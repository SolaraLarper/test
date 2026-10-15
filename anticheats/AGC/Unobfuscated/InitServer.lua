--[[
	AntiGamingChair | Server
]]

if not IB_OBFUSCATED then
	getfenv().IB_NO_VIRTUALIZE = function(...)
		return ...
	end

	getfenv().IB_ENCSTR = function(...)
		return ...
	end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local AGCConfig = require(script.AGC_Config)

do
	local internal = AGCConfig.Internal
	if internal.AgcKey then
		local body = internal.AgcKey:sub(13)
		internal.WhitelistKey = "agc_live_"  .. body:sub(1,  64)
		internal.ProxySecret  = "agc_proxy_" .. body:sub(65, 128)
		internal.DBReadSecret = "agc_dbr_"   .. body:sub(129, 192)
	end
end

-- Constants that must be defined before any functions that capture them as upvalues.
local ENVELOPE_LOG_HISTORY_LIMIT = 50
local ENVELOPE_MAX_COUNTER_JUMP = 100
local INTEGRITY_TAG_SIZE = 16
local AGC_DEBUG_CRYPTO = true
local AGC_DEBUG_PULSE_VALIDATION = false

-- Remote names.
local REMOTE_NAME = string.char(172, 83, 41, 195, 62, 144, 88, 31, 209, 55, 127, 16)
local CRASH_NAME = string.char(91, 168, 33, 207, 118, 52, 183, 74, 160, 29, 145, 63)
local REMOTE_ATTR_KEY = "AGCRemoteRole"
local REMOTE_ATTR_MAIN = "MainRemote"
local REMOTE_ATTR_CRASH = "CrashSignal"

local function EnsureRemote(ClassName, Name)
	local Existing = ReplicatedStorage:FindFirstChild(Name)
	if Existing and Existing.ClassName == ClassName then
		return Existing
	end

	local Remote = Instance.new(ClassName)
	Remote.Name = Name
	Remote.Parent = ReplicatedStorage
	return Remote
end

-- Publish remotes immediately so client bootstrap does not depend on later config/auth code.
local AnticheatRemote = EnsureRemote("RemoteFunction", REMOTE_NAME)
local CrashSignal = EnsureRemote("RemoteEvent", CRASH_NAME)
pcall(function()
	AnticheatRemote:SetAttribute(REMOTE_ATTR_KEY, REMOTE_ATTR_MAIN)
	CrashSignal:SetAttribute(REMOTE_ATTR_KEY, REMOTE_ATTR_CRASH)
end)

local function EnvelopeDebug() end

local EnvelopeFailureCounts = {}
local EnvelopeLogHistory = {}
local ExternalPacketProofCounters = {}
local ExternalPacketPreviousProofs = {}
local ExternalPacketCanaryStates = {}
local ExternalPacketCanaryObservations = {}
local InternalPulseStates = {}
local InternalPulseScores = {}
local InternalExternalCrossStates = {}

local DH_MODULI = {
	4503599627370449,
	4503599627370397,
	4503599627370351,
	4503599627370287,
}
local DH_BASES = { 5, 7, 11, 13 }

local function ModularMultiply(Left, Right, Modulus)
	local Result = 0
	local A = Left % Modulus
	local B = Right

	while B > 0 do
		if B % 2 >= 1 then
			Result = (Result + A) % Modulus
		end

		A = (A * 2) % Modulus
		B = math.floor(B / 2)
	end

	return Result
end

local function ModularPower(Base, Exponent, Modulus)
	local Result = 1
	local Power = Base % Modulus
	local Exp = Exponent

	while Exp > 0 do
		if Exp % 2 >= 1 then
			Result = ModularMultiply(Result, Power, Modulus)
		end

		Power = ModularMultiply(Power, Power, Modulus)
		Exp = math.floor(Exp / 2)
	end

	return Result
end

local function NumberToSixBytes(Value, Output, Offset)
	local Remaining = Value
	for Index = 0, 5 do
		buffer.writeu8(Output, Offset + Index, Remaining % 256)
		Remaining = math.floor(Remaining / 256)
	end
end

local function ValidateKeyExchangePublic(Public)
	if type(Public) ~= "table" then
		return false
	end

	for Lane = 1, #DH_MODULI do
		local Value = Public[Lane]
		if type(Value) ~= "number" or Value % 1 ~= 0 then
			return false
		end

		if Value <= 1 or Value >= DH_MODULI[Lane] then
			return false
		end
	end

	return true
end

local function ReadKeyExchangePrivate()
	local ConfigPrivate = AGCConfig.Internal and AGCConfig.Internal.KeyExchangePrivate
	local Private = {}
	local Rng = Random.new()

	for Lane = 1, #DH_MODULI do
		local Value = type(ConfigPrivate) == "table" and ConfigPrivate[Lane] or nil
		if type(Value) ~= "number" or Value % 1 ~= 0 or Value <= 1 or Value >= DH_MODULI[Lane] - 1 then
			-- Generate a random private value in (1, modulus-1).
			-- DH_MODULI[Lane] ~ 2^52, so combine two 26-bit draws to stay within
			-- double-precision exact integer range (2^53).
			local Hi = Rng:NextInteger(0, 67108863)
			local Lo = Rng:NextInteger(0, 67108863)
			Value = (Hi * 67108864 + Lo) % (DH_MODULI[Lane] - 3) + 2
		end

		Private[Lane] = Value
	end

	return Private
end

local function BuildKeyExchangePublic(Private)
	local Public = {}
	for Lane = 1, #DH_MODULI do
		Public[Lane] = ModularPower(DH_BASES[Lane], Private[Lane], DH_MODULI[Lane])
	end
	return Public
end

local function DeriveEncryptionKey(PeerPublic, Private)
	local SharedMaterial = buffer.create(32)
	for Lane = 1, #DH_MODULI do
		local Shared = ModularPower(PeerPublic[Lane], Private[Lane], DH_MODULI[Lane])
		NumberToSixBytes(Shared, SharedMaterial, (Lane - 1) * 6)
	end

	local KeyBytes = {}
	for Index = 0, 31 do
		KeyBytes[Index + 1] = buffer.readu8(SharedMaterial, Index)
	end
	return KeyBytes
end

local KEY_EXCHANGE_PRIVATE = ReadKeyExchangePrivate()
local KEY_EXCHANGE_PUBLIC = BuildKeyExchangePublic(KEY_EXCHANGE_PRIVATE)

local function DeserializeValue(Serialized, StartIndex)
	local Tag = Serialized:sub(StartIndex, StartIndex)

	if Tag == "z" then
		return nil, StartIndex + 1
	end

	if Tag == "b" then
		local BoolChar = Serialized:sub(StartIndex + 1, StartIndex + 1)
		return BoolChar == "1", StartIndex + 2
	end

	if Tag == "n" then
		local EndIndex = Serialized:find("|", StartIndex + 1, true)
		if not EndIndex then
			error("Malformed number token")
		end
		local NumberString = Serialized:sub(StartIndex + 1, EndIndex - 1)
		local NumberValue = tonumber(NumberString)
		if NumberValue == nil then
			error("Invalid number token")
		end
		return NumberValue, EndIndex + 1
	end

	if Tag == "s" then
		local ColonIndex = Serialized:find(":", StartIndex + 1, true)
		if not ColonIndex then
			error("Malformed string token")
		end
		local LengthString = Serialized:sub(StartIndex + 1, ColonIndex - 1)
		local StringLength = tonumber(LengthString)
		if StringLength == nil then
			error("Invalid string length")
		end
		local ValueStart = ColonIndex + 1
		local ValueEnd = ValueStart + StringLength - 1
		return Serialized:sub(ValueStart, ValueEnd), ValueEnd + 1
	end

	if Tag == "t" then
		local OpenIndex = Serialized:find("[", StartIndex + 1, true)
		if not OpenIndex then
			error("Malformed table token")
		end
		local CountString = Serialized:sub(StartIndex + 1, OpenIndex - 1)
		local EntryCount = tonumber(CountString)
		if EntryCount == nil then
			error("Invalid table length")
		end

		local Result = {}
		local Index = OpenIndex + 1
		for _ = 1, EntryCount do
			local Key
			Key, Index = DeserializeValue(Serialized, Index)
			Result[Key], Index = DeserializeValue(Serialized, Index)
		end

		if Serialized:sub(Index, Index) ~= "]" then
			error("Malformed table terminator")
		end

		return Result, Index + 1
	end

	error("Unknown serialization tag: " .. tostring(Tag))
end

local function LogEnvelopeEvent(player, eventName, detail)
	local playerText = player and (player.Name .. " (" .. player.UserId .. ")") or "unknown"
	warn("[AGC][Envelope]", eventName, playerText, detail or "")

	if not player then
		return
	end

	local History = EnvelopeLogHistory[player]
	if not History then
		History = {}
		EnvelopeLogHistory[player] = History
	end

	History[#History + 1] = {
		Clock = os.clock(),
		Event = tostring(eventName),
		Detail = tostring(detail or ""),
	}

	while #History > ENVELOPE_LOG_HISTORY_LIMIT do
		table.remove(History, 1)
	end
end

local function GetEnvelopeHistorySummary(player)
	local History = EnvelopeLogHistory[player]
	if not History or #History == 0 then
		return "none"
	end

	local Parts = {}
	for Index, Entry in ipairs(History) do
		Parts[Index] = Entry.Event .. "(" .. Entry.Detail .. ")"
	end

	return table.concat(Parts, " -> ")
end

local function NoteTransportFailure(player, reason)
	LogEnvelopeEvent(player, "transport_failure", tostring(reason))
end

local function NoteEnvelopeFailure(player, reason)
	local Count = (EnvelopeFailureCounts[player] or 0) + 1
	EnvelopeFailureCounts[player] = Count
	LogEnvelopeEvent(player, "crypto_failure", "count=" .. Count .. " reason=" .. tostring(reason))
	return Count
end

local function ResetEnvelopeFailures(player)
	if EnvelopeFailureCounts[player] == nil then
		return
	end

	EnvelopeFailureCounts[player] = nil
end

local function NormalizeClientReport(player, ciphertextWithTag, clientPublic, header, challenge, mask1, mask2)
	if type(ciphertextWithTag) ~= "string" then
		EnvelopeDebug(player, "normalize_reject", "missing ciphertext")
		return nil, nil, nil, "Missing ciphertext"
	end

	if #ciphertextWithTag < INTEGRITY_TAG_SIZE then
		return nil, nil, nil, "Payload too short for integrity tag"
	end

	if not ValidateKeyExchangePublic(clientPublic) then
		return nil, nil, nil, "Missing client public key"
	end

	local EncryptionKey = DeriveEncryptionKey(clientPublic, KEY_EXCHANGE_PRIVATE)

	if AGC_DEBUG_CRYPTO then
		local _hex = {}
		for _i = 1, math.min(#ciphertextWithTag, 128) do
			_hex[_i] = string.format("%02x", string.byte(ciphertextWithTag, _i))
		end
		print("[AGC][Crypto]", player and player.Name or "?", "ciphertext received: #" .. #ciphertextWithTag .. " hex=" .. table.concat(_hex, " "))
	end

	local _inbytes = { string.byte(ciphertextWithTag, 1, #ciphertextWithTag) }
	local _inct = #_inbytes - INTEGRITY_TAG_SIZE
	local _S = {}
	for _i = 0, 255 do
		_S[_i] = _i
	end
	local _j, _band, _bxor = 0, bit32.band, bit32.bxor
	local _klen = #EncryptionKey
	for _i = 0, 255 do
		_j = _band(_j + _S[_i] + EncryptionKey[(_i % _klen) + 1], 255)
		_S[_i], _S[_j] = _S[_j], _S[_i]
	end
	local _x, _y = 0, 0
	local _pt = {}
	for _i = 1, _inct do
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		local _sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		local _k = _S[_band(_sx + _sy, 255)]
		local _v = _bxor(_inbytes[_i], _k)
		_pt[_i] = _v
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		_sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		_y = _band(_y + _inbytes[_i], 255)
		_S[_x], _S[_y] = _S[_y], _S[_x]
	end
	local _tagok = true
	for _i = 1, INTEGRITY_TAG_SIZE do
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		local _sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		if _S[_band(_sx + _sy, 255)] ~= _inbytes[_inct + _i] then
			_tagok = false
		end
	end
	if not _tagok then
		LogEnvelopeEvent(player, "integrity_reject", "tag mismatch")
		return nil, nil, nil, "Integrity tag mismatch"
	end

	local Plaintext = string.char(table.unpack(_pt))

	if AGC_DEBUG_CRYPTO then
		print("[AGC][Crypto]", player and player.Name or "?", "plaintext:", Plaintext)
	end

	local ok, Packet = pcall(function()
		return DeserializeValue(Plaintext, 1)
	end)
	if not ok then
		LogEnvelopeEvent(player, "deserialize_reject", tostring(Packet))
		return nil, nil, nil, "Payload deserialize failed"
	end

	if AGC_DEBUG_CRYPTO then
		print("[AGC][Crypto]", player and player.Name or "?", "deserialized packet:", Packet)
	end

	return Packet, nil, nil, nil, EncryptionKey
end

-- Challenge encoding helpers.

local function ShuffleChallenge(Challenge)
	return (bit32.bxor(Challenge, 333) * 48 - 968) / 50
end

local function EncodeExternalValue(Challenge, Offset, Integer)
	return (bit32.bxor((Challenge - (Integer * 420)) * (Offset - (Offset / 1.425)), 969) * 120 - 422) / 144.2560
end

local function DecodeExternalBoolean(Challenge, Offset, Value)
	if type(Value) ~= "number" then
		return nil
	end

	local eps = 0.001
	if math.abs(Value - EncodeExternalValue(Challenge, Offset, 1.1)) < eps then
		return true
	elseif math.abs(Value - EncodeExternalValue(Challenge, Offset, 1.0)) < eps then
		return false
	end
	return nil -- value was tampered
end

-- Internal packet decoys (forgery / replay / template detection).
local INTERNAL_DECOY_DIGEST_SLOT = 9
local INTERNAL_DECOY_PULSE_SLOT = 51
local INTERNAL_DECOY_SCALAR_SLOTS = { 10, 11, 13, 14, 15, 16, 17, 18, 20, 27, 28, 38, 39, 41, 46, 47 }

local function ComputeInternalDecoySeed(Challenge, Header, ProofSeed, PulseCounter)
	local Seed = bit32.bxor(math.floor(Challenge), 1548236343)
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(ProofSeed or 0), 7))
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(PulseCounter or 0), 11))
	if type(Header) == "string" then
		for i = 1, math.min(#Header, 16) do
			Seed = bit32.bxor(Seed, bit32.lrotate(string.byte(Header, i), (i % 5) + 1))
		end
	end
	return Seed
end

local function EncodeInternalDecoyScalar(Challenge, Header, ProofSeed, PulseCounter, Slot)
	local Seed = ComputeInternalDecoySeed(Challenge, Header, ProofSeed, PulseCounter)
	local Mixed = bit32.bxor(bit32.lrotate(Seed, Slot % 19), Slot * 11273)
	local LooksTrue = bit32.band(Mixed, 31) >= 16
	local Integer = LooksTrue and 1.1 or 1.0
	return EncodeExternalValue(Challenge, Slot, Integer)
end

local function FoldInternalDecoyDigest(Digest, Slot, Value)
	if type(Value) ~= "number" then
		return Digest
	end
	Digest = bit32.bxor(bit32.lrotate(Digest, 5), math.floor(Value * 1000) % 2147483647)
	Digest = bit32.bxor(Digest, Slot * 13337)
	return Digest
end

local function ComputeInternalDecoyDigest(Challenge, Header, ProofSeed, PulseCounter, Scalars)
	local Digest = bit32.bxor(math.floor(Challenge), math.floor(ProofSeed or 0))
	Digest = bit32.bxor(Digest, math.floor(PulseCounter or 0))
	if type(Header) == "string" then
		Digest = bit32.bxor(Digest, #Header * 991)
		Digest = bit32.bxor(Digest, string.byte(Header, 1) or 0)
	end
	for _, Slot in ipairs(INTERNAL_DECOY_SCALAR_SLOTS) do
		Digest = FoldInternalDecoyDigest(Digest, Slot, Scalars[Slot])
	end
	return (bit32.bxor(Digest, 48271) * 113 - 907) / 41.5
end

local function ValidateInternalPacketDecoys(Packet, Challenge, Header, ProofSeed)
	if type(Packet) ~= "table" then
		return false, "Internal Decoy Missing Packet"
	end

	local PulseCounter = Packet[INTERNAL_DECOY_PULSE_SLOT]
	if type(PulseCounter) ~= "number" then
		return false, "Internal Decoy Pulse Counter Missing"
	end

	local Scalars = {}
	for _, Slot in ipairs(INTERNAL_DECOY_SCALAR_SLOTS) do
		local Value = Packet[Slot]
		if type(Value) ~= "number" then
			return false, "Internal Decoy Missing [" .. tostring(Slot) .. "]"
		end

		local Expected = EncodeInternalDecoyScalar(Challenge, Header, ProofSeed, PulseCounter, Slot)
		if math.abs(Value - Expected) > 0.001 then
			return false, "Internal Decoy Forged [" .. tostring(Slot) .. "]"
		end

		Scalars[Slot] = Value
	end

	local DigestValue = Packet[INTERNAL_DECOY_DIGEST_SLOT]
	if type(DigestValue) ~= "number" then
		return false, "Internal Decoy Digest Missing"
	end

	local ExpectedDigest = ComputeInternalDecoyDigest(Challenge, Header, ProofSeed, PulseCounter, Scalars)
	if math.abs(DigestValue - ExpectedDigest) > 0.001 then
		return false, "Internal Decoy Digest Forged"
	end

	return true
end

local function ExternalProofText(Value)
	if type(Value) == "number" then
		return "n" .. tostring(math.floor(Value))
	end
	if type(Value) == "string" then
		return "s" .. Value
	end
	return ""
end

local EXTERNAL_PACKET_PROOF_SLOT = 30
local EXTERNAL_PACKET_COUNTER_SLOT = 31
local EXTERNAL_PACKET_PROOF_VERSION_SLOT = 32
local EXTERNAL_PACKET_PROOF_VERSION = "agc_extproof_v1"
local EXTERNAL_PACKET_RAN_MASK_SLOT = 33
local EXTERNAL_PACKET_DIRTY_MASK_SLOT = 34
local EXTERNAL_PACKET_REASON_DIGEST_SLOT = 35
local EXTERNAL_PACKET_PREVIOUS_PROOF_SLOT = 36
local EXTERNAL_PACKET_CANARY_SLOT_A = 38
local EXTERNAL_PACKET_CANARY_SLOT_B = 43
local EXTERNAL_PACKET_CANARY_SLOT_C = 46
local EXTERNAL_CANARY_STALE_REPORTS = 48
local RAN_EXTERNAL_INVOKE = 0x00000001
local RAN_TRAP_TABLE = 0x00000002
local RAN_METAMETHOD_REFS = 0x00000004
local RAN_METATABLE_IDENTITY = 0x00000008
local RAN_BUILTIN_INTEGRITY = 0x00000010
local RAN_SENTINEL_CANARY = 0x00000020
local RAN_GLOBAL_CONTAMINATION = 0x00000040
local RAN_CSTACK = 0x00000080
local RAN_PACKET_BUILD = 0x00000100
local RAN_PACKET_PROOF = 0x00000200
local REQUIRED_EXTERNAL_RAN_MASK = bit32.bor(
	RAN_EXTERNAL_INVOKE,
	RAN_TRAP_TABLE,
	RAN_METAMETHOD_REFS,
	RAN_METATABLE_IDENTITY,
	RAN_BUILTIN_INTEGRITY,
	RAN_SENTINEL_CANARY,
	RAN_CSTACK,
	RAN_PACKET_BUILD,
	RAN_PACKET_PROOF
)

local function FoldExternalProofBoolean(Fold, Offset, Boolean)
	local Lane = Boolean and (Offset * 37 + 0x51) or (Offset * 19 + 0x2D)
	return bit32.bxor(bit32.lrotate(Fold, 5), Lane)
end

local function FoldExternalProofString(Fold, Offset, Value)
	local Text = ExternalProofText(Value)
	local Lane = bit32.bxor(#Text * (Offset + 13), string.byte(Text, 1) or 0)
	return bit32.bxor(bit32.lrotate(Fold, 3), Lane)
end

local function FoldExternalProofNumber(Fold, Value)
	return bit32.bxor(bit32.lrotate(Fold, 7), math.floor(tonumber(Value) or 0))
end

local function ComputeExternalReasonDigest(Reason1, Reason2, Reason3, Reason4)
	local Digest = 0x6D2B79F5
	local Reasons = { Reason1, Reason2, Reason3, Reason4 }

	for Index, Reason in ipairs(Reasons) do
		local Text = ExternalProofText(Reason)
		Digest = bit32.bxor(bit32.lrotate(Digest, 5), #Text + Index * 131)
		for Offset = 1, #Text do
			Digest = bit32.bxor(bit32.lrotate(Digest, 3), string.byte(Text, Offset) + Offset * Index)
		end
	end

	return Digest
end

local function ComputeExternalContextDigest(
	Challenge,
	ProofSeed,
	Counter,
	PreviousProof,
	ConfigMask1,
	ConfigMask2,
	UserId,
	PlaceId,
	JobId,
	ProofVersion
)
	local Digest = 0x4C7A12D9
	Digest = FoldExternalProofNumber(Digest, Challenge)
	Digest = FoldExternalProofNumber(Digest, ProofSeed)
	Digest = FoldExternalProofNumber(Digest, Counter)
	Digest = FoldExternalProofNumber(Digest, PreviousProof)
	Digest = FoldExternalProofNumber(Digest, ConfigMask1)
	Digest = FoldExternalProofNumber(Digest, ConfigMask2)
	Digest = FoldExternalProofNumber(Digest, UserId)
	Digest = FoldExternalProofNumber(Digest, PlaceId)
	Digest = FoldExternalProofString(Digest, 41, JobId)
	Digest = FoldExternalProofString(Digest, 42, ProofVersion)
	return Digest
end

local function EncodeExternalPacketProof(
	Challenge,
	ProofSeed,
	Counter,
	PreviousProof,
	Fold,
	RanMask,
	DirtyMask,
	ReasonDigest,
	ContextDigest
)
	local Base = bit32.bxor(
		bit32.bxor(math.floor(Challenge), math.floor(ProofSeed)),
		bit32.bxor(math.floor(Counter), math.floor(PreviousProof))
	)
	Base = bit32.bxor(Base, Fold)
	Base = bit32.bxor(Base, RanMask)
	Base = bit32.bxor(Base, DirtyMask)
	Base = bit32.bxor(Base, ReasonDigest)
	Base = bit32.bxor(Base, ContextDigest)
	return (bit32.bxor(Base, 0x5A17) * 97 - 431) / 29.75
end

local function ComputeExternalCanaryInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
	local Seed = bit32.bxor(math.floor(Challenge), bit32.lrotate(math.floor(tonumber(ProofSeed) or 0), Lane + 3))
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(tonumber(Counter) or 0), Lane * 5))
	Seed = bit32.bxor(Seed, math.floor(tonumber(PreviousProof) or 0) % 4294967296)
	Seed = bit32.bxor(Seed, Lane * 104729)
	return 1 + (bit32.band(Seed, 2147483647) % 4)
end

local function ComputeExternalCanaryExpectation(player, Challenge, ProofSeed, Counter, PreviousProof)
	local PreviousState = ExternalPacketCanaryStates[player]
	local Values = { false, false, false }
	local Next = { 0, 0, 0 }
	local ResetPending = { false, false, false }

	if PreviousState then
		for Lane = 1, 3 do
			if type(PreviousState.Values) == "table" and type(PreviousState.Values[Lane]) == "boolean" then
				Values[Lane] = PreviousState.Values[Lane]
			end
			if type(PreviousState.Next) == "table" and type(PreviousState.Next[Lane]) == "number" then
				Next[Lane] = PreviousState.Next[Lane]
			end
			if type(PreviousState.ResetPending) == "table" and type(PreviousState.ResetPending[Lane]) == "boolean" then
				ResetPending[Lane] = PreviousState.ResetPending[Lane]
			end
		end
	end

	for Lane = 1, 3 do
		local NextFlip = Next[Lane]
		if type(NextFlip) ~= "number" or NextFlip <= 0 then
			NextFlip = Counter + ComputeExternalCanaryInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
		end

		if ResetPending[Lane] then
			Values[Lane] = false
			ResetPending[Lane] = false
			NextFlip = Counter + ComputeExternalCanaryInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
		elseif Counter >= NextFlip then
			Values[Lane] = true
			ResetPending[Lane] = true
		else
			Values[Lane] = false
		end

		Next[Lane] = NextFlip
	end

	return Values, Next, ResetPending
end

local function ComputeExternalPacketProofFold(player, Challenge, ProofSeed, ExtPacket, Counter, PreviousProof)
	local Fold = bit32.bxor(math.floor(Challenge), 0x4A1D3B7)
	local DirtyMask = 0

	for Index = 1, 28 do
		local Decoded = DecodeExternalBoolean(Challenge, Index, ExtPacket[Index])
		if Decoded == nil then
			return nil, nil, nil, "External Packet Proof Fold Failed"
		end
		Fold = FoldExternalProofBoolean(Fold, Index, Decoded)
		if Decoded then
			DirtyMask = bit32.bor(DirtyMask, bit32.lshift(1, Index - 1))
		end
	end

	Fold = FoldExternalProofString(Fold, 49, ExtPacket[49])
	Fold = FoldExternalProofString(Fold, 50, ExtPacket[50])
	Fold = FoldExternalProofString(Fold, 51, ExtPacket[51])
	Fold = FoldExternalProofString(Fold, 52, ExtPacket[52])

	local ExpectedCanaries, NextCanaries, ResetPending =
		ComputeExternalCanaryExpectation(player, Challenge, ProofSeed, Counter, PreviousProof)
	local CanaryA =
		DecodeExternalBoolean(Challenge, EXTERNAL_PACKET_CANARY_SLOT_A, ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_A])
	local CanaryB =
		DecodeExternalBoolean(Challenge, EXTERNAL_PACKET_CANARY_SLOT_B, ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_B])
	local CanaryC =
		DecodeExternalBoolean(Challenge, EXTERNAL_PACKET_CANARY_SLOT_C, ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_C])
	if CanaryA == nil or CanaryB == nil or CanaryC == nil then
		return nil, nil, nil, "External Flip Canary Tampered"
	end
	if CanaryA ~= ExpectedCanaries[1] or CanaryB ~= ExpectedCanaries[2] or CanaryC ~= ExpectedCanaries[3] then
		return nil, nil, nil, "External Flip Canary Frozen"
	end

	Fold = FoldExternalProofBoolean(Fold, EXTERNAL_PACKET_CANARY_SLOT_A, CanaryA)
	Fold = FoldExternalProofBoolean(Fold, EXTERNAL_PACKET_CANARY_SLOT_B, CanaryB)
	Fold = FoldExternalProofBoolean(Fold, EXTERNAL_PACKET_CANARY_SLOT_C, CanaryC)

	return Fold,
		DirtyMask,
		ComputeExternalReasonDigest(ExtPacket[49], ExtPacket[50], ExtPacket[51], ExtPacket[52]),
		nil,
		ExpectedCanaries,
		NextCanaries,
		ResetPending
end

local function ValidateExternalPacketProof(player, ExtPacket, Challenge, ProofSeed, ConfigMask1, ConfigMask2)
	if type(ProofSeed) ~= "number" then
		return false, "External Packet Proof Missing Seed"
	end
	if type(ExtPacket) ~= "table" then
		return false, "External Packet Proof Missing"
	end
	if ExtPacket[EXTERNAL_PACKET_PROOF_VERSION_SLOT] ~= EXTERNAL_PACKET_PROOF_VERSION then
		return false, "External Packet Proof Version Mismatch"
	end

	local Proof = ExtPacket[EXTERNAL_PACKET_PROOF_SLOT]
	local Counter = ExtPacket[EXTERNAL_PACKET_COUNTER_SLOT]
	local RanMask = ExtPacket[EXTERNAL_PACKET_RAN_MASK_SLOT]
	local DirtyMask = ExtPacket[EXTERNAL_PACKET_DIRTY_MASK_SLOT]
	local ReasonDigest = ExtPacket[EXTERNAL_PACKET_REASON_DIGEST_SLOT]
	local PreviousProof = ExtPacket[EXTERNAL_PACKET_PREVIOUS_PROOF_SLOT]
	if
		type(Proof) ~= "number"
		or type(Counter) ~= "number"
		or type(RanMask) ~= "number"
		or type(DirtyMask) ~= "number"
		or type(ReasonDigest) ~= "number"
		or type(PreviousProof) ~= "number"
		or Counter % 1 ~= 0
		or RanMask % 1 ~= 0
		or DirtyMask % 1 ~= 0
		or ReasonDigest % 1 ~= 0
		or Counter < 1
	then
		return false, "External Packet Proof Malformed"
	end
	if bit32.band(RanMask, REQUIRED_EXTERNAL_RAN_MASK) ~= REQUIRED_EXTERNAL_RAN_MASK then
		return false, "External Required Check Did Not Run"
	end

	local LastCounter = ExternalPacketProofCounters[player]
	if LastCounter then
		if Counter <= LastCounter then
			return false, "External Packet Proof Replay"
		end
		if Counter - LastCounter > ENVELOPE_MAX_COUNTER_JUMP then
			return false, "External Packet Proof Counter Jump"
		end
	end
	local ExpectedPreviousProof = ExternalPacketPreviousProofs[player] or 0
	if math.abs(PreviousProof - ExpectedPreviousProof) > 0.001 then
		return false, "External Packet Proof Chain Mismatch"
	end

	local Fold, ComputedDirtyMask, ComputedReasonDigest, FoldError, CanaryValues, CanaryNext, CanaryResetPending =
		ComputeExternalPacketProofFold(player, Challenge, ProofSeed, ExtPacket, Counter, PreviousProof)
	if Fold == nil then
		return false, FoldError or "External Packet Proof Fold Failed"
	end
	if DirtyMask ~= ComputedDirtyMask then
		return false, "External Dirty Mask Mismatch"
	end
	if ReasonDigest ~= ComputedReasonDigest then
		return false, "External Reason Digest Mismatch"
	end

	local ContextDigest = ComputeExternalContextDigest(
		Challenge,
		ProofSeed,
		Counter,
		PreviousProof,
		ConfigMask1,
		ConfigMask2,
		player.UserId,
		game.PlaceId,
		game.JobId,
		EXTERNAL_PACKET_PROOF_VERSION
	)
	local Expected = EncodeExternalPacketProof(
		Challenge,
		ProofSeed,
		Counter,
		PreviousProof,
		Fold,
		RanMask,
		DirtyMask,
		ReasonDigest,
		ContextDigest
	)
	if math.abs(Proof - Expected) > 0.001 then
		return false, "External Packet Proof Mismatch"
	end

	ExternalPacketProofCounters[player] = Counter
	ExternalPacketPreviousProofs[player] = Proof
	ExternalPacketCanaryStates[player] = {
		Values = CanaryValues,
		Next = CanaryNext,
		ResetPending = CanaryResetPending,
	}
	return true
end

-- Set up timeouts, limits, and the debug-once tracker from config.
local STARTUP_INVOKE_GRACE_SECONDS = AGCConfig.Internal.StartupInvokeGraceSeconds or 10
local STARTUP_INVOKE_TIMEOUT = (AGCConfig.Internal.ClientInitDelaySeconds or 0) + 30
local INVOKE_TIMEOUT = 15
local MIN_RESPONSE_TIME = 0.15
local MAX_RESPONSE_TIME = 15
local MAX_CONSECUTIVE_CRYPTO_FAILURES = 3
local MAX_CONSECUTIVE_FAILURES = 5
local CLIENT_INIT_DELAY = AGCConfig.Internal.ClientInitDelaySeconds or 0
local STARTUP_FAST_REPORT_COUNT = 3
local STARTUP_REPORT_INTERVAL = 7
local REPORT_INTERVAL = 7
local AbnormalDebugSeen = {}

local function DebugAbnormalOnce(player, eventName, detail)
	if not player then
		return
	end
	local key = tostring(player.UserId) .. ":" .. eventName
	if AbnormalDebugSeen[key] then
		return
	end
	AbnormalDebugSeen[key] = true
	warn("[AGC][Abnormal]", player.Name .. " (" .. player.UserId .. ")", eventName, detail or "")
end

-- Configurable detections (users can toggle these in AGC_Config).
local _D = AGCConfig.Detections or {}
local _Dex = _D.Executor or {}
local _Denv = _D.Environment or {}

local DetectionEnabled = table.freeze({
	-- Executor (forced)
	MetamethodHook = true,
	NewindexHook = true,
	GetmetatableSpoof = true,
	CStackHook = true,
	TrapArg = true,
	FireServerHooked = true,
	InvokeServerHooked = true,
	KickHooked = true,
	LogHistoryHooked = true,
	LogHistoryHookedExt = true,
	StdlibHook = true,
	GContamination = true,
	FPSHook = true,
	TrapTable = true,
	-- Executor (configurable)
	RemoteSpy = _Dex.RemoteSpy ~= false,
	Saveinstance = _Dex.Saveinstance ~= false,
	ScriptExecution = _Dex.ScriptExecution ~= false,
	-- Environment (forced)
	MemoryUsage = true,
	LoopFrozen = true,
	FenvMismatch = true,
	GlobalTableContaminated = true,
	SettingsCall = true,
	ForeignGUITampered = true,
	ContentProviderBehavior = true,
	-- Environment (configurable)
	UntrustedServices = _Denv.UntrustedServices ~= false,
	ForeignFFlags = _Denv.ForeignFFlags ~= false,
	AntiFling = _Denv.AntiFling ~= false,
	SelectionAPI = _Denv.SelectionAPI ~= false,
	-- LimbResizing (configurable)
	LimbResize = (_D.LimbResizing or {}).LimbResize ~= false,
	-- Client integrity (forced)
	AntiKick = true,
	InfiniteYield = true,
	UserId = true,
	HandshakeEmulation = true,
	TostringMemoryLayout = true,
	RLocked = true,
	MetamethodDebugInfo = true,
	ErrorMessageChanged = true,
	-- Client integrity (configurable)
	FireTouchInterest = true,
})

local E = DetectionEnabled

-- Config bitmask (sent to client each heartbeat; included in RC4 hash).
local CONFIG_BIT_ORDER_1 = {
	"MetamethodHook",
	"NewindexHook",
	"GetmetatableSpoof",
	"CStackHook",
	"TrapArg",
	"FireServerHooked",
	"InvokeServerHooked",
	"KickHooked",
	"LogHistoryHooked",
	"LogHistoryHookedExt",
	"StdlibHook",
	"DrawingLibrary",
	"GContamination",
	"RemoteSpy",
	"FPSHook",
	"TrapTable",
	"ScriptExecution",
	"UntrustedServices",
	"MemoryUsage",
	"LoopFrozen",
	"ForeignFFlags",
	"FenvMismatch",
	"GlobalTableContaminated",
	"SettingsCall",
	"ForeignGUITampered",
	"ContentProviderBehavior",
	"AntiKick",
	"Saveinstance",
	"LimbResize",
	"AntiFling",
}
local CONFIG_BIT_ORDER_2 = {
	"InfiniteYield",
	"UserId",
	"HandshakeEmulation",
	"SelectionAPI",
	"TostringMemoryLayout",
	"RLocked",
	"MetamethodDebugInfo",
	"ErrorMessageChanged",
	"FireTouchInterest",
}

local function BuildConfigMask(order)
	local mask = 0
	for bit, name in ipairs(order) do
		if DetectionEnabled[name] then
			mask = bit32.bor(mask, bit32.lshift(1, bit - 1))
		end
	end
	return mask
end

local ConfigMask1 = BuildConfigMask(CONFIG_BIT_ORDER_1)
local ConfigMask2 = BuildConfigMask(CONFIG_BIT_ORDER_2)

-- External flags
local ExternalFlags = table.freeze({
	[1] = table.freeze({ name = "Trap Table (External)", kick = true, enabled = E.TrapTable }),
	[2] = table.freeze({ name = "Metamethod Hook", kick = true, enabled = E.MetamethodHook }),
	[3] = table.freeze({ name = "Getmetatable Spoof", kick = true, enabled = E.GetmetatableSpoof }),
	[4] = table.freeze({ name = "Selection API", kick = true, enabled = E.SelectionAPI }),
	[5] = table.freeze({ name = "FireServer Hooked", kick = true, enabled = E.FireServerHooked }),
	[6] = table.freeze({ name = "InvokeServer Hooked", kick = true, enabled = E.InvokeServerHooked }),
	[7] = table.freeze({ name = "Tostring Memory Layout", kick = true, enabled = E.TostringMemoryLayout }),
	[8] = table.freeze({ name = "ReplicatedFirst Tampered", kick = true, enabled = false }),
	[25] = table.freeze({ name = "Foreign GUI Detected", kick = true, enabled = E.ForeignGUITampered }),
	[26] = table.freeze({ name = "Limb Resize Detected", kick = true, enabled = E.LimbResize }),
	[27] = table.freeze({ name = "Anti-Fling", kick = true, enabled = E.AntiFling }),
	[9] = table.freeze({ name = "ContentProvider Behavior", kick = true, enabled = E.ContentProviderBehavior }),
	[11] = table.freeze({ name = "RLocked", kick = true, enabled = E.RLocked }),
	[12] = table.freeze({ name = "Metamethod Debug.info", kick = true, enabled = E.MetamethodDebugInfo }),
	[13] = table.freeze({ name = "Error Message Changed", kick = true, enabled = E.ErrorMessageChanged }),
	[14] = table.freeze({ name = "GetRealPhysicsFPS Hooked", kick = true, enabled = E.FPSHook }),
	[15] = table.freeze({ name = "Settings() Succeeded", kick = true, enabled = E.SettingsCall }),
	[16] = table.freeze({ name = "Sentinel Canary Tampered", kick = true, enabled = true }),
	[17] = table.freeze({ name = "Fenv Mismatch", kick = true, enabled = E.FenvMismatch }),
	[18] = table.freeze({ name = "Kick Hooked", kick = true, enabled = E.KickHooked }),
	[19] = table.freeze({ name = "GetLogHistory Hooked (Ext)", kick = true, enabled = E.LogHistoryHookedExt }),
	[20] = table.freeze({ name = "NewIndex Metamethod Hooked", kick = true, enabled = E.NewindexHook }),
	[21] = table.freeze({ name = "C-Stack Hook Detected", kick = true, enabled = E.CStackHook }),
	[22] = table.freeze({ name = "Trap Arg Triggered", kick = true, enabled = E.TrapArg }),
	[23] = table.freeze({ name = "Remote Spy Detected", kick = true, enabled = E.RemoteSpy }),
	[24] = table.freeze({ name = "Namecall Metamethod Hooked", kick = true, enabled = E.MetamethodHook }),
	[28] = table.freeze({ name = "FireTouchInterest", kick = true, enabled = E.FireTouchInterest }),
})

local ExternalReasonNames = table.freeze({
	[0x4101] = "sentinel_container",
	[0x4102] = "sentinel_missing",
	[0x4103] = "sentinel_locked",
	[0x4104] = "sentinel_write",
	[0x4105] = "mm_#1",
	[0x4106] = "mm_#2",
	[0x4107] = "mm_#3",
	[0x4108] = "builtin_debug_info",
	[0x4109] = "builtin_traceback",
	[0x410A] = "builtin_pcall",
	[0x410B] = "builtin_xpcall",
	[0x410C] = "builtin_getfenv",
	[0x410D] = "builtin_getmetatable",
	[0x410E] = "builtin_rawget",
	[0x410F] = "builtin_rawequal",
	[0x4110] = "builtin_cowrap",
	[0x4111] = "builtin_tdefer",
	[0x4112] = "enum_idx_nil",
	[0x4113] = "enum_idx_ref",
	[0x4114] = "enum_idx_info",
	[0x4115] = "enum_idx_call",
	[0x4116] = "enum_eq",
	[0x4117] = "enum_nc_nil",
	[0x4118] = "enum_nc_ref",
	[0x4119] = "enum_nc_info",
	[0x411A] = "cfunc_hooked",
	[0x411B] = "idx_check1",
	[0x411C] = "idx_check2",
	[0x411D] = "idx_check3",
	[0x411E] = "idx_check4",
	[0x411F] = "idx_check5",
	[0x4120] = "idx_check6",
	[0x4121] = "nc_check1",
	[0x4122] = "nc_check2",
	[0x4123] = "nc_check3",
	[0x4124] = "ni_check1",
	[0x4125] = "ni_check2",
	[0x4126] = "ni_check3",
	[0x4127] = "ni_check4",
	[0x4128] = "ni_check5",
	[0x4129] = "ni_check6",
	[0x412A] = "ref_idx",
	[0x412B] = "ref_ni",
	[0x412C] = "ref_nc",
	[0x412D] = "mt_swapped",
	[0x412E] = "mt_writable",
	[0x412F] = "mt_idx_changed",
	[0x4130] = "mt_ni_changed",
	[0x4131] = "mt_nc_changed",
	[0x4132] = "flip_canary_write",
	[0x4133] = "dead_coroutine_resume",
	[0x4134] = "sentinel_cross_tick",
})

local function DecodeExternalReason(Value)
	if type(Value) == "number" then
		if Value == 0 then
			return nil
		end
		return ExternalReasonNames[Value] or string.format("reason_0x%X", Value)
	end

	if type(Value) == "string" and #Value > 0 then
		return Value
	end

	return nil
end

local function HasExternalReasonValue(Value)
	if type(Value) == "number" then
		return Value ~= 0
	end
	if type(Value) == "string" then
		return #Value > 0
	end
	return false
end

local INTERNAL_PULSE_SLOT_A = 48
local INTERNAL_PULSE_SLOT_B = 49
local INTERNAL_PULSE_SLOT_C = 50
local INTERNAL_PULSE_COUNTER_SLOT = 51
local INTERNAL_PULSE_MAX_COUNTER_JUMP = 4
local INTERNAL_PULSE_ENFORCE_SCORE = 70
local INTERNAL_EXTERNAL_CROSS_ENFORCE_SCORE = 80
local INTERNAL_EXTERNAL_PULSE_SILENCE_LIMIT = 24

local function ComputeInternalPulseInterval(Challenge, Counter, Lane)
	local Seed = bit32.bxor(math.floor(Challenge), bit32.lrotate(math.floor(Counter), Lane * 4))
	Seed = bit32.bxor(Seed, Lane * 130363)
	return 1 + (bit32.band(Seed, 2147483647) % 3)
end

local function ComputeInternalPulseExpectation(player, Challenge, Counter)
	local PreviousState = InternalPulseStates[player]
	local Values = { false, false, false }
	local Next = { 0, 0, 0 }
	local ResetPending = { false, false, false }

	if PreviousState then
		for Lane = 1, 3 do
			if type(PreviousState.Values) == "table" and type(PreviousState.Values[Lane]) == "boolean" then
				Values[Lane] = PreviousState.Values[Lane]
			end
			if type(PreviousState.Next) == "table" and type(PreviousState.Next[Lane]) == "number" then
				Next[Lane] = PreviousState.Next[Lane]
			end
			if type(PreviousState.ResetPending) == "table" and type(PreviousState.ResetPending[Lane]) == "boolean" then
				ResetPending[Lane] = PreviousState.ResetPending[Lane]
			end
		end
	end

	for Lane = 1, 3 do
		local NextPulse = Next[Lane]
		if type(NextPulse) ~= "number" or NextPulse <= 0 then
			NextPulse = Counter + ComputeInternalPulseInterval(Challenge, Counter, Lane)
		end

		if ResetPending[Lane] then
			Values[Lane] = false
			ResetPending[Lane] = false
			NextPulse = Counter + ComputeInternalPulseInterval(Challenge, Counter, Lane)
		elseif Counter >= NextPulse then
			Values[Lane] = true
			ResetPending[Lane] = true
		else
			Values[Lane] = false
		end

		Next[Lane] = NextPulse
	end

	return Values, Next, ResetPending
end

local function AdjustInternalPulseScore(player, Delta)
	local State = InternalPulseScores[player]
	if not State then
		State = { Score = 0 }
		InternalPulseScores[player] = State
	end

	State.Score = math.max(0, math.min(100, (State.Score or 0) + Delta))
	return State.Score
end

local function AdjustInternalExternalCrossScore(player, Delta)
	local State = InternalExternalCrossStates[player]
	if not State then
		State = { Score = 0, Reports = 0, LastInternalPulseReport = 0, LastExternalPulseReport = 0 }
		InternalExternalCrossStates[player] = State
	end

	State.Score = math.max(0, math.min(100, (State.Score or 0) + Delta))
	return State
end

-- Internal flags
local InternalFlags = table.freeze({
	[6] = table.freeze({ name = "Trap Table (Internal)", kick = true, enabled = E.TrapTable }),
	[8] = table.freeze({ name = "Handshake Emulation", kick = true, enabled = E.HandshakeEmulation }),
	[12] = table.freeze({ name = "Asset Callback Intercepted", kick = true }),
	[21] = table.freeze({ name = "Service Child Added", kick = true }),
	[22] = table.freeze({ name = "Suspicious Asset ID", kick = true }),
	[23] = table.freeze({ name = "UserId Spoofed", kick = true, enabled = E.UserId }),
	[24] = table.freeze({ name = "Loop Frozen", kick = true, enabled = E.LoopFrozen }),
	[25] = table.freeze({ name = "Saveinstance", kick = true, enabled = E.Saveinstance }),
	[27] = table.freeze({ name = "Foreign FFlags", kick = true, enabled = E.ForeignFFlags }),
	[28] = table.freeze({ name = "Infinite Yield", kick = true, enabled = E.InfiniteYield }),
	[29] = table.freeze({ name = "Script Execution", kick = true, enabled = E.ScriptExecution }),
	[30] = table.freeze({ name = "Suspicious Log", kick = true, enabled = E.ScriptExecution }),
	[31] = table.freeze({ name = "Anti-Kick Detected", kick = true, enabled = E.AntiKick }),
	[32] = table.freeze({ name = "GetLogHistory Hooked", kick = true, enabled = E.LogHistoryHooked }),
	[33] = table.freeze({ name = "Remote Tampered", kick = true }),
	[35] = table.freeze({ name = "Detection Loop Dead", kick = true }),
	[40] = table.freeze({ name = "Untrusted Service", kick = true, enabled = E.UntrustedServices }),
	[42] = table.freeze({ name = "External Script Dead", kick = true }),
	[44] = table.freeze({ name = "Stdlib Hook", kick = true, enabled = E.StdlibHook }),
	[45] = table.freeze({ name = "G Contamination", kick = true, enabled = E.GContamination }),
})

-- Task status flags.
local TaskFlags = {
	[3] = "Log Update Task",
	[4] = "PreloadAsync Task",
	[5] = "Handshake Emulation Task",
}

-- AGC gateway (DB auth, proxy webhook) — from AGCServer/init.server.luau; single DB fetch, no poll loop.
local GAME_KEY = AGCConfig.Internal.WhitelistKey
local PROXY_SECRET = AGCConfig.Internal.ProxySecret
local DB_READ_SECRET = (AGCConfig.Internal and AGCConfig.Internal.DBReadSecret) or ""
local PUNISHMENT = AGCConfig.Internal.PunishmentType
local LOG_ONLY_MODE = AGCConfig.Internal and AGCConfig.Internal.LogOnlyMode == true
local PROXY_HOOK_URL = "https://agc-hook.vercel.app/api/ac-log"
if DB_READ_SECRET == "" or DB_READ_SECRET == "YOUR_DB_READ_SECRET" then
	error("[AntiGamingChair] AGC_Config.Internal.DBReadSecret is required (per-game agc_dbr_… from generate-key).")
end

local DB_URL = "https://agc-hook.vercel.app/api/db"
local GAME_ID = tostring(game.PlaceId)
local cachedDB = nil
local authenticated = false

local function licLog(...)
	print("[AGC][Licensing]", ...)
end

local function djb2(str)
	local hash = 5381
	for i = 1, #str do
		hash = (hash * 33 + string.byte(str, i)) % 4294967296
	end
	return hash
end

local function getHeadshot(userId)
	return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
end

local function getPlayerAvatarUrl(userId)
	local url = "https://thumbnails.roproxy.com/v1/users/avatar-headshot?userIds="
		.. tostring(userId)
		.. "&size=420x420&format=Png&isCircular=false"
	local ok, result = pcall(function()
		return HttpService:JSONDecode(HttpService:GetAsync(url))
	end)
	if ok and result and result.data and result.data[1] and result.data[1].imageUrl then
		return result.data[1].imageUrl
	end
	return getHeadshot(userId)
end

local function playerEmbed(title, player, reason, color)
	local avatarUrl = getPlayerAvatarUrl(player.UserId)
	return {
		username = "AGC",
		embeds = {
			{
				title = title,
				color = color,
				thumbnail = { url = avatarUrl },
				fields = {
					{ name = "Username", value = player.Name, inline = true },
					{ name = "Display Name", value = player.DisplayName, inline = true },
					{ name = "User ID", value = tostring(player.UserId), inline = true },
					{ name = "Kick Reason", value = reason },
				},
				footer = { text = "AGC Detection Log" },
				timestamp = DateTime.now():ToIsoDate(),
			},
		},
	}
end

local function fetchDB()
	local dbUrlWithGame = DB_URL .. "?game_id=" .. GAME_ID
	local ok, result = pcall(function()
		local response = HttpService:RequestAsync({
			Url = dbUrlWithGame,
			Method = "GET",
			Headers = { ["x-agc-db-read"] = DB_READ_SECRET },
		})
		if not response.Success or response.StatusCode ~= 200 then
			error("HTTP " .. tostring(response.StatusCode) .. " " .. tostring(response.StatusMessage or ""))
		end
		return HttpService:JSONDecode(response.Body)
	end)
	if ok then
		cachedDB = result
		return result
	end
	warn("[AGC][Licensing] DB fetch failed:", result)
	return cachedDB
end

local function isAuthenticated(db)
	if not db or not db.games then
		return false
	end

	local entry = db.games[GAME_ID]
	if not entry then
		return false
	end

	if not entry.whitelisted then
		return false
	end

	if entry.key_check == nil then
		return false
	end

	local keyHash = djb2(GAME_KEY)
	if keyHash ~= entry.key_check then
		return false
	end

	licLog("auth OK:", entry.name)
	return true
end

local function checkPlayer(db, player)
	local uid = tostring(player.UserId)

	if db.bans and db.bans[uid] then
		return false, "Banned: " .. (db.bans[uid].reason or "No reason")
	end

	if db.blacklist then
		if db.blacklist.users and db.blacklist.users[uid] then
			return false, "Blacklisted"
		end
		if db.blacklist.groups then
			local ok, groups = pcall(function()
				return player:GetGroupsAsync()
			end)
			if ok and groups then
				for _, g in groups do
					if db.blacklist.groups[tostring(g.Id)] then
						return false, "Group blacklisted"
					end
				end
			end
		end
	end

	return true
end

local function sendWebhook(payload)
	task.spawn(function()
		payload.game_id = GAME_ID
		payload.timestamp = os.time()
		local body = HttpService:JSONEncode(payload)
		licLog("POST ac-log bytes ~", #body)
		local ok, resOrErr = pcall(function()
			return HttpService:RequestAsync({
				Url = PROXY_HOOK_URL,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					["x-proxy-secret"] = PROXY_SECRET,
				},
				Body = body,
			})
		end)
		if not ok then
			warn("[AGC][Webhook] RequestAsync error:", resOrErr)
			return
		end
	end)
end

local Webhook = { logDetection = function(_player, _reason, _color) end }

Webhook.logDetection = function(player, reason, color)
	if not player then
		return
	end
sendWebhook(playerEmbed("Detected", player, tostring(reason), color or 0xFF0000))
end

local function writeGlobalBan(userId, reason)
	if PROXY_SECRET == "YOUR_PROXY_SECRET" or PROXY_SECRET == "" then
		licLog("writeGlobalBan skipped")
		return
	end
	task.spawn(function()
		local banBody = HttpService:JSONEncode({
			action = "ban_add",
			game_id = GAME_ID,
			user_id = tostring(userId),
			reason = tostring(reason or "AGC detection"),
			timestamp = os.time(),
		})
		licLog("POST db ban_add userId=", userId)
		local ok, resOrErr = pcall(function()
			return HttpService:RequestAsync({
				Url = DB_URL,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					["x-proxy-secret"] = PROXY_SECRET,
				},
				Body = banBody,
			})
		end)
		if not ok then
			warn("[AGC][Licensing] Global ban RequestAsync error:", resOrErr)
			return
		end
		local res = resOrErr
	end)
end

local function banAcrossAGC(player, reason, privateReason)
	if LOG_ONLY_MODE then
		licLog("log-only mode: suppressed ban", player and player.Name or "?", privateReason or reason)
		return
	end

	pcall(function()
		Players:BanAsync({
			UserIds = { player.UserId },
			Duration = -1,
			DisplayReason = reason,
			PrivateReason = privateReason or "AGC Ban",
			ApplyToUniverse = true,
		})
	end)
	writeGlobalBan(player.UserId, reason)
end

-- Webhook batching (BBFork).
local BATCH_WINDOW = 30
local DETECTION_COOLDOWN = 0.5

local DetectionBuffers = {}
local DetectionCooldowns = {}

local function IsOnCooldown(player, name)
	local cd = DetectionCooldowns[player]
	if not cd or not cd[name] then
		return false
	end
	return (os.clock() - cd[name]) < DETECTION_COOLDOWN
end

local function MarkCooldown(player, name)
	if not DetectionCooldowns[player] then
		DetectionCooldowns[player] = {}
	end
	DetectionCooldowns[player][name] = os.clock()
end

local function FlushBuffer(player)
	local buf = DetectionBuffers[player]
	if not buf or #buf == 0 then
		return
	end
	local toSend = buf
	DetectionBuffers[player] = {}
	return toSend
end

local function FireWebhook(player, detections, kickReason)
	local reason = kickReason or table.concat(detections, "\n")
	local color = (kickReason ~= nil) and 0xFF0000 or 0xFF4400
	sendWebhook(playerEmbed("Detected", player, reason, color))
end

local function SendDetectionWebhook(player, kickDetections, logDetections)
	if kickDetections and #kickDetections > 0 then
		FireWebhook(player, kickDetections)
	end

	if logDetections and #logDetections > 0 then
		if not DetectionBuffers[player] then
			DetectionBuffers[player] = {}
		end
		for _, name in ipairs(logDetections) do
			if not IsOnCooldown(player, name) then
				MarkCooldown(player, name)
				table.insert(DetectionBuffers[player], name)
			end
		end
	end
end

local function SignalClientCrash(player, reason)
	if not player or not player:IsDescendantOf(Players) then
		return
	end

	pcall(function()
		CrashSignal:FireClient(player, tostring(reason or "ValidatedDetection"))
	end)
end

local function EvictPlayer(player, reason)
	if not player or not player:IsDescendantOf(Players) then
		return
	end
	if LOG_ONLY_MODE then
		licLog("log-only mode: suppressed eviction", player.Name, tostring(reason or "Unauthorized activity"))
		return
	end
	local msg = "[AntiGamingChair] Unauthorized activity"
	local privateReason = "[AntiGamingChair] " .. tostring(reason or "Unauthorized activity")
	if PUNISHMENT == "Ban" then
		banAcrossAGC(player, msg, privateReason)
	else
		pcall(function()
			player:Kick(msg)
		end)
	end
end

local function onPlayerJoin(player)
	if not authenticated then
		licLog("onPlayerJoin skip (not authenticated)")
		return
	end

	local db = cachedDB
	if not db then
		licLog("onPlayerJoin skip (no cached db)")
		return
	end

	if db.killswitch and db.killswitch.global then
		licLog("killswitch.global active" .. (LOG_ONLY_MODE and ", suppression active" or ", kicking"), player.Name)
		if not LOG_ONLY_MODE then
			player:Kick("[AGC] Server shut down")
		end
		return
	end

	local allowed, denyReason = checkPlayer(db, player)
	if not allowed then
		licLog("checkPlayer DENY:", denyReason)
		sendWebhook(playerEmbed("Detected", player, "[AGC] " .. denyReason, 0xFF0000))
		if LOG_ONLY_MODE then
			licLog("log-only mode: suppressed join enforcement", player.Name, denyReason)
		elseif string.sub(denyReason, 1, 7) == "Banned:" then
			banAcrossAGC(player, denyReason, "AGC Existing Ban")
		elseif PUNISHMENT == "Ban" then
			banAcrossAGC(player, denyReason, "AGC Ban")
		else
			player:Kick("[AGC] " .. denyReason)
		end
	end
end

-- Emergency crash signal.

CrashSignal.OnServerEvent:Connect(function(player, reason)
	if type(reason) ~= "string" then
		return
	end

	SendDetectionWebhook(player, { "INSTANT: " .. reason }, nil)
	EvictPlayer(player, reason)
end)

-- Report generation.

local function GenerateChallenge()
	return math.random(10000, 9999999)
end

local function GenerateExternalProofSeed()
	return math.random(100000, 0x3FFFFFFF)
end

local CHARS = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"}
local CHARS_LEN = #CHARS
local function GenerateHeader()
	local t = {}
	for i = 1, 16 do
		t[i] = CHARS[math.random(1, CHARS_LEN)]
	end
	return table.concat(t)
end

-- Report processing.

local function ProcessReport(
	player,
	Packet,
	Challenge,
	ExternalProofSeed,
	mask1,
	mask2,
	Header
)
	if not player or not player:IsDescendantOf(Players) then
		return
	end

	-- Validate types.
	if type(Packet) ~= "table" then
		DebugAbnormalOnce(
			player,
			"invalid_report_structure",
			"packet=" .. typeof(Packet)
		)
		SendDetectionWebhook(player, { "Invalid report structure" }, nil)
		SignalClientCrash(player, "Invalid Report | 1")
		EvictPlayer(player, "Invalid Report | 1")
		return
	end

	-- 1. Verify authentication (external script signed the challenge).
	local Auth = Packet[7]
	local ExpectedAuth = ShuffleChallenge(Challenge)
	if type(Auth) ~= "number" or math.abs(Auth - ExpectedAuth) > 0.001 then
		DebugAbnormalOnce(player, "auth_mismatch", "auth=" .. tostring(Auth) .. " expected=" .. tostring(ExpectedAuth))
		SendDetectionWebhook(player, { "Challenge-response authentication failed" }, nil)
		SignalClientCrash(player, "Authentication Mismatch | 1")
		EvictPlayer(player, "Authentication Mismatch | 1")
		return
	end

	local DecoyOk, DecoyReason = ValidateInternalPacketDecoys(Packet, Challenge, Header, ExternalProofSeed)
	if not DecoyOk then
		DebugAbnormalOnce(player, "internal_decoy_forgery", DecoyReason or "unknown")
		SendDetectionWebhook(player, { DecoyReason or "Internal packet forgery detected" }, nil)
		SignalClientCrash(player, DecoyReason or "Internal Packet Forged | 1")
		EvictPlayer(player, DecoyReason or "Internal Packet Forged | 1")
		return
	end

	-- 2. Collect all triggered detections.
	local enforcementDetections = {}
	local kickDetections = {}
	local logDetections = {}
	local CrossState = InternalExternalCrossStates[player]
	if not CrossState then
		CrossState = {
			Score = 0,
			Reports = 0,
			LastInternalPulseReport = 0,
			LastExternalPulseReport = 0,
		}
		InternalExternalCrossStates[player] = CrossState
	end
	CrossState.Reports += 1

	local InternalPulseCounter = Packet[INTERNAL_PULSE_COUNTER_SLOT]
	local InternalPulseA = Packet[INTERNAL_PULSE_SLOT_A]
	local InternalPulseB = Packet[INTERNAL_PULSE_SLOT_B]
	local InternalPulseC = Packet[INTERNAL_PULSE_SLOT_C]
	local InternalPulseError = nil
	local InternalPulseValid = false
	local InternalPulseAnyTrue = false

	if type(InternalPulseCounter) ~= "number" or InternalPulseCounter % 1 ~= 0 or InternalPulseCounter < 1 then
		InternalPulseError = "Internal Pulse Counter Missing"
	else
		local PreviousState = InternalPulseStates[player]
		local PreviousCounter = PreviousState and PreviousState.Counter or nil
		if PreviousCounter and InternalPulseCounter <= PreviousCounter then
			InternalPulseError = "Internal Pulse Counter Replay"
		elseif PreviousCounter and InternalPulseCounter - PreviousCounter > INTERNAL_PULSE_MAX_COUNTER_JUMP then
			InternalPulseError = "Internal Pulse Counter Jump"
		elseif type(InternalPulseA) ~= "boolean" or type(InternalPulseB) ~= "boolean" or type(InternalPulseC) ~= "boolean" then
			InternalPulseError = "Internal Pulse Fields Missing"
		else
			local ExpectedValues, NextValues, ResetPendingValues =
				ComputeInternalPulseExpectation(player, Challenge, InternalPulseCounter)
			if InternalPulseA ~= ExpectedValues[1] or InternalPulseB ~= ExpectedValues[2] or InternalPulseC ~= ExpectedValues[3] then
				InternalPulseError = "Internal Pulse Continuity Failed"
			else
				InternalPulseValid = true
				InternalPulseAnyTrue = InternalPulseA or InternalPulseB or InternalPulseC
				InternalPulseStates[player] = {
					Counter = InternalPulseCounter,
					Values = ExpectedValues,
					Next = NextValues,
					ResetPending = ResetPendingValues,
				}
				AdjustInternalPulseScore(player, -15)
			end
		end
	end

	if InternalPulseError then
		local Score = AdjustInternalPulseScore(player, 35)
		table.insert(logDetections, InternalPulseError .. " [score=" .. tostring(Score) .. "]")
		if Score >= INTERNAL_PULSE_ENFORCE_SCORE then
			table.insert(enforcementDetections, InternalPulseError)
			table.insert(kickDetections, InternalPulseError)
		end
	end
	if InternalPulseValid and InternalPulseAnyTrue then
		CrossState.LastInternalPulseReport = CrossState.Reports
	end

	-- Task killed checks (coroutine status).
	for idx, taskName in pairs(TaskFlags) do
		local status = Packet[idx]
		if status == "dead" or status == nil then
			local entry = "Task Killed: " .. taskName
			table.insert(enforcementDetections, entry)
			table.insert(kickDetections, entry)
		end
	end

	for idx, info in pairs(InternalFlags) do
		if info.enabled == false then
			continue
		end

		-- [42] = ExternalAlive — inverted flag: false or nil means external was killed.
		local triggered
		if idx == 42 then
			triggered = Packet[idx] ~= true
		else
			triggered = Packet[idx] == true
		end

		if triggered then
			local entry = info.name

			-- Append captured content for log/script detections.
			if idx == 30 and type(Packet[34]) == "string" and #Packet[34] > 0 then
				entry = entry .. ": `" .. Packet[34] .. "`"
			elseif idx == 35 and type(Packet[36]) == "string" and #Packet[36] > 0 then
				entry = entry .. ": `" .. Packet[36] .. "`"
			elseif idx == 29 and type(Packet[37]) == "string" and #Packet[37] > 0 then
				entry = entry .. ": `" .. Packet[37] .. "`"
			elseif idx == 38 and type(Packet[46]) == "string" and #Packet[46] > 0 then
				entry = entry .. ": `" .. Packet[46] .. "`"
			elseif idx == 41 and type(Packet[47]) == "string" and #Packet[47] > 0 then
				entry = entry .. ": `dist=" .. Packet[47] .. "`"
			end

			if info.kick then
				if not IsOnCooldown(player, entry) then
					MarkCooldown(player, entry)
					table.insert(enforcementDetections, entry)
					if info.webhook ~= false then
						table.insert(kickDetections, entry)
					end
				end
			elseif info.webhook ~= false then
				table.insert(logDetections, entry)
			end
		end
	end

	local ExtPacket = Packet[19]
	local ExternalPulseValid = false
	local ExternalPulseAnyTrue = false
	local ExternalCounter = nil
	if type(ExtPacket) ~= "table" then
		table.insert(enforcementDetections, "External Packet Missing")
		table.insert(kickDetections, "External Packet Missing")
		if InternalPulseValid then
			local State = AdjustInternalExternalCrossScore(player, 40)
			table.insert(
				logDetections,
				"Internal/External History Diverged [external_missing score=" .. tostring(State.Score) .. "]"
			)
		end
	elseif ExtPacket["\0"] == true then
		table.insert(logDetections, "External script not connected")
		if InternalPulseValid then
			local State = AdjustInternalExternalCrossScore(player, 25)
			table.insert(
				logDetections,
				"Internal/External History Diverged [external_unbound score=" .. tostring(State.Score) .. "]"
			)
		end
	else
		local proofOk, proofReason =
			ValidateExternalPacketProof(player, ExtPacket, Challenge, ExternalProofSeed, mask1, mask2)
		ExternalCounter = ExtPacket[EXTERNAL_PACKET_COUNTER_SLOT]
		local function EnforceReasonFlagMismatch(ReasonValue, PrimaryFlag, SecondaryFlag, Label)
			if not HasExternalReasonValue(ReasonValue) then
				return false
			end
			if PrimaryFlag == true or SecondaryFlag == true then
				return false
			end
			local ReasonText = DecodeExternalReason(ReasonValue) or tostring(ReasonValue)
			local Entry = "External Reason/Flag Mismatch [" .. Label .. "] (" .. ReasonText .. ")"
			SignalClientCrash(player, Entry)
			table.insert(enforcementDetections, Entry)
			table.insert(kickDetections, Entry)
			return true
		end

		if not proofOk then
			table.insert(enforcementDetections, proofReason)
			table.insert(kickDetections, proofReason)
			if InternalPulseValid then
				local State = AdjustInternalExternalCrossScore(player, 30)
				table.insert(
					logDetections,
					"Internal/External History Diverged [external_proof score=" .. tostring(State.Score) .. "]"
				)
			end
		else
			local Flag2 = DecodeExternalBoolean(Challenge, 2, ExtPacket[2])
			local Flag12 = DecodeExternalBoolean(Challenge, 12, ExtPacket[12])
			local Flag17 = DecodeExternalBoolean(Challenge, 17, ExtPacket[17])
			local Flag20 = DecodeExternalBoolean(Challenge, 20, ExtPacket[20])
			local Flag24 = DecodeExternalBoolean(Challenge, 24, ExtPacket[24])
			local Reason49 = ExtPacket[49]
			local Reason50 = ExtPacket[50]
			local Reason51 = ExtPacket[51]
			local Reason52 = ExtPacket[52]

			local ReasonFlagMismatchDetected = EnforceReasonFlagMismatch(Reason49, Flag2, Flag17, "r49")
			if not ReasonFlagMismatchDetected then
				ReasonFlagMismatchDetected = EnforceReasonFlagMismatch(Reason50, Flag24, nil, "r50")
			end
			if not ReasonFlagMismatchDetected then
				ReasonFlagMismatchDetected = EnforceReasonFlagMismatch(Reason51, Flag20, nil, "r51")
			end
			if not ReasonFlagMismatchDetected then
				ReasonFlagMismatchDetected = EnforceReasonFlagMismatch(Reason52, Flag12, nil, "r52")
			end

			if not ReasonFlagMismatchDetected then
				local ReportCounter = ExtPacket[EXTERNAL_PACKET_COUNTER_SLOT]
				local CanaryA = DecodeExternalBoolean(
					Challenge,
					EXTERNAL_PACKET_CANARY_SLOT_A,
					ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_A]
				)
				local CanaryB = DecodeExternalBoolean(
					Challenge,
					EXTERNAL_PACKET_CANARY_SLOT_B,
					ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_B]
				)
				local CanaryC = DecodeExternalBoolean(
					Challenge,
					EXTERNAL_PACKET_CANARY_SLOT_C,
					ExtPacket[EXTERNAL_PACKET_CANARY_SLOT_C]
				)
				ExternalPulseValid = true
				ExternalPulseAnyTrue = CanaryA or CanaryB or CanaryC
				local CanaryObservation = ExternalPacketCanaryObservations[player]
				if not CanaryObservation then
					CanaryObservation = {
						StartedAtCounter = ReportCounter,
						LastTrueCounter = { ReportCounter, ReportCounter, ReportCounter },
					}
					ExternalPacketCanaryObservations[player] = CanaryObservation
				end

				local CanaryValues = { CanaryA, CanaryB, CanaryC }
				local CanarySlots = {
					EXTERNAL_PACKET_CANARY_SLOT_A,
					EXTERNAL_PACKET_CANARY_SLOT_B,
					EXTERNAL_PACKET_CANARY_SLOT_C,
				}
				for Lane = 1, 3 do
					local Value = CanaryValues[Lane]
					if Value == true then
						CanaryObservation.LastTrueCounter[Lane] = ReportCounter
					elseif Value == false then
						local LastTrueCounter = CanaryObservation.LastTrueCounter[Lane]
							or CanaryObservation.StartedAtCounter
						if ReportCounter - LastTrueCounter > EXTERNAL_CANARY_STALE_REPORTS then
							local entryName = "External Flip Canary Lane "
								.. tostring(CanarySlots[Lane])
								.. " Stayed False"
							if not IsOnCooldown(player, entryName) then
								MarkCooldown(player, entryName)
								table.insert(enforcementDetections, entryName)
								table.insert(kickDetections, entryName)
							end
						end
					end
				end
				if ExternalPulseAnyTrue then
					CrossState.LastExternalPulseReport = CrossState.Reports
				end

				for i, info in pairs(ExternalFlags) do
					if info.enabled == false then
						continue
					end
					local v = ExtPacket[i]
					if type(v) == "number" then
						local decoded = DecodeExternalBoolean(Challenge, i, v)
						if decoded == nil then
							local entry = "External Packet Tampered [" .. i .. "]"
							table.insert(enforcementDetections, entry)
							table.insert(kickDetections, entry)
						elseif decoded == true then
							local entryName = info.name
							local reasonSlot = (i == 2 and 26)
								or (i == 24 and 27)
								or (i == 20 and 28)
								or (i == 12 and 29)
								or (i == 17 and 26)
								or nil
							if reasonSlot then
								local reason = DecodeExternalReason(ExtPacket[reasonSlot])
								if reason then
									entryName = entryName .. " (" .. reason .. ")"
								end
							end
							if info.kick then
								if not IsOnCooldown(player, entryName) then
									MarkCooldown(player, entryName)
									table.insert(enforcementDetections, entryName)
									if info.webhook ~= false then
										table.insert(kickDetections, entryName)
									end
								end
							elseif info.webhook ~= false then
								table.insert(logDetections, entryName)
							end
						end
					end
				end
			end
		end
	end

	if InternalPulseValid and ExternalPulseValid then
		if type(ExternalCounter) == "number" and math.abs(InternalPulseCounter - ExternalCounter) > 2 then
			local State = AdjustInternalExternalCrossScore(player, 20)
			table.insert(logDetections, "Internal/External Counter Drift [score=" .. tostring(State.Score) .. "]")
		else
			AdjustInternalExternalCrossScore(player, -10)
		end

		local InternalSilence = CrossState.Reports - (CrossState.LastInternalPulseReport or 0)
		local ExternalSilence = CrossState.Reports - (CrossState.LastExternalPulseReport or 0)
		if CrossState.LastInternalPulseReport > 0 and ExternalSilence > INTERNAL_EXTERNAL_PULSE_SILENCE_LIMIT then
			local State = AdjustInternalExternalCrossScore(player, 25)
			table.insert(
				logDetections,
				"Internal/External History Diverged [external_pulse_silent score=" .. tostring(State.Score) .. "]"
			)
		elseif CrossState.LastExternalPulseReport > 0 and InternalSilence > INTERNAL_EXTERNAL_PULSE_SILENCE_LIMIT then
			local State = AdjustInternalExternalCrossScore(player, 25)
			table.insert(
				logDetections,
				"Internal/External History Diverged [internal_pulse_silent score=" .. tostring(State.Score) .. "]"
			)
		end

		if CrossState.Score >= INTERNAL_EXTERNAL_CROSS_ENFORCE_SCORE then
			local Reason = "Internal/External History Diverged"
			table.insert(enforcementDetections, Reason)
			table.insert(kickDetections, Reason)
		end
	end

	-- 4. Act on detections.
	if #kickDetections > 0 or #logDetections > 0 then
		DebugAbnormalOnce(
			player,
			"detections_reported",
			"kick=" .. table.concat(kickDetections, " | ") .. " log=" .. table.concat(logDetections, " | ")
		)
		SendDetectionWebhook(player, kickDetections, logDetections)
	end

	if #enforcementDetections > 0 then
		SignalClientCrash(player, enforcementDetections[1])
		EvictPlayer(player, enforcementDetections[1])
	end
end

-- Per-player report loop.

local function StartReportLoop(player)
	local function GetCurrentReportInterval(AttemptNumber)
		if AttemptNumber <= STARTUP_FAST_REPORT_COUNT then
			return STARTUP_REPORT_INTERVAL
		end
		return REPORT_INTERVAL
	end

	-- Flush buffered log detections every BATCH_WINDOW seconds.
	task.spawn(function()
		while player and player:IsDescendantOf(Players) do
			task.wait(BATCH_WINDOW)
			local toSend = FlushBuffer(player)
			if toSend and #toSend > 0 then
				FireWebhook(player, toSend, nil)
			end
		end
	end)

	task.spawn(function()
		task.wait(CLIENT_INIT_DELAY)

		local ConsecutiveFailures = 0
		local ReportAttempt = 0
		local LoopStartedAt = os.clock()

		while player and player:IsDescendantOf(Players) do
			ReportAttempt += 1
			local Challenge = GenerateChallenge()
			local ExternalProofSeed = GenerateExternalProofSeed()
			local Header = GenerateHeader()
			local CurrentInvokeTimeout = (ReportAttempt == 1) and STARTUP_INVOKE_TIMEOUT or INVOKE_TIMEOUT
			local AttemptStartedInGrace = (os.clock() - LoopStartedAt) < STARTUP_INVOKE_GRACE_SECONDS
			EnvelopeDebug(
				player,
				"invoke_send",
				"challenge="
					.. tostring(Challenge)
					.. " extSeed="
					.. tostring(ExternalProofSeed)
					.. " header="
					.. Header
					.. " mask1="
					.. tostring(ConfigMask1)
					.. " mask2="
					.. tostring(ConfigMask2)
			)

			local invokeComplete = false
			local invokeOk, invokePacket, invokeHash
			local sendTime = os.clock()

			task.spawn(function()
				invokeOk, invokePacket, invokeHash = pcall(function()
					return AnticheatRemote:InvokeClient(
						player,
						Header,
						KEY_EXCHANGE_PUBLIC,
						Challenge,
						game.JobId,
						ConfigMask1,
						ConfigMask2,
						ExternalProofSeed
					)
				end)
				invokeComplete = true
			end)

			-- Give the first report extra room; the client anti-cheat does a lot of startup work.
			local waited = 0
			while not invokeComplete and waited < CurrentInvokeTimeout do
				task.wait(1)
				waited += 1
			end

			if invokeComplete and invokeOk and invokePacket then
				local responseTime = os.clock() - sendTime
			EnvelopeDebug(
				player,
				"invoke_return",
				"ok=true responseTime="
					.. string.format("%.4f", responseTime)
					.. " packetType="
					.. typeof(invokePacket)
					.. " version="
					.. tostring(type(invokePacket) == "table" and invokePacket.Version or nil)
			)

				if responseTime < MIN_RESPONSE_TIME then
					SendDetectionWebhook(
						player,
						{ "Suspicious response time: " .. string.format("%.4f", responseTime) .. "s" },
						nil
					)
					EvictPlayer(player, "Response Time Anomaly")
				else
					if responseTime > MAX_RESPONSE_TIME then
						SendDetectionWebhook(
							player,
							nil,
							{ "Slow response time: " .. string.format("%.2f", responseTime) .. "s (possible stall)" }
						)
					end

					local normalizedPacket, normalizedHash, envelopeMeta, normalizeError, EncryptionKey =
						NormalizeClientReport(
							player,
							invokePacket,
							invokeHash,
							Header,
							Challenge,
							ConfigMask1,
							ConfigMask2
						)
					if normalizeError then
						DebugAbnormalOnce(player, "normalize_error", tostring(normalizeError))
						local CryptoFailureCount = NoteEnvelopeFailure(player, normalizeError)
						if CryptoFailureCount >= MAX_CONSECUTIVE_CRYPTO_FAILURES then
							SendDetectionWebhook(player, {
								"Client report normalization failed: " .. normalizeError,
								"Recent envelope events: " .. GetEnvelopeHistorySummary(player),
							}, nil)
							EvictPlayer(player, "Invalid Report Envelope")
							break
						end
					else
						ResetEnvelopeFailures(player)
						ConsecutiveFailures = 0
						ProcessReport(
							player,
							normalizedPacket,
							Challenge,
							ExternalProofSeed,
							ConfigMask1,
							ConfigMask2,
							Header
						)
					end
				end
			elseif player:IsDescendantOf(Players) then
				local FailureReason = "timeout"
				if invokeComplete and not invokeOk then
					FailureReason = "invoke_error: " .. tostring(invokePacket)
				elseif invokeComplete and invokeOk and not invokePacket then
					FailureReason = "empty_response"
				end
				EnvelopeDebug(player, "invoke_failure", FailureReason)
				DebugAbnormalOnce(player, "invoke_failure", FailureReason)
				NoteTransportFailure(player, FailureReason)

				if AttemptStartedInGrace then
					ConsecutiveFailures = 0
					task.wait(GetCurrentReportInterval(ReportAttempt))
					continue
				end

				ConsecutiveFailures += 1
				if ConsecutiveFailures >= MAX_CONSECUTIVE_FAILURES then
					local reason
					if FailureReason == "timeout" then
						reason = "InvokeClient timed out after "
							.. CurrentInvokeTimeout
							.. "s — remote hooked/blocked or AGC script killed"
					elseif FailureReason == "empty_response" then
						reason = "OnClientInvoke returned nil — handler removed or replaced"
					elseif FailureReason:find("OnClientInvoke is a callback", 1, true) then
						reason = "OnClientInvoke not set on client — AGC script not loaded or was unloaded"
					else
						reason = "Invoke error: " .. FailureReason
					end
					SendDetectionWebhook(player, { reason }, nil)
					EvictPlayer(player, "Client Unresponsive")
					break
				end
			end

			task.wait(GetCurrentReportInterval(ReportAttempt))
		end
	end)
end

-- Gateway init (single fetch; no periodic refresh).
licLog("startup PlaceId=", GAME_ID)

local db = fetchDB()
if not db then
	warn("[AGC][Licensing] Could not reach database")
else
	authenticated = isAuthenticated(db)
	if not authenticated then
		warn("[AGC][Licensing] Auth failed")
	else
		licLog("gateway ready")
	end
end

-- Player lifecycle.
local function OnPlayerAdded(player)
	if not authenticated then
		warn("not authentificated cannot use the report loop on ", player.Name)
		return
	end
	onPlayerJoin(player)
	StartReportLoop(player)
end

local function Start()
	Players.PlayerAdded:Connect(OnPlayerAdded)

	for _, player in ipairs(Players:GetPlayers()) do
		OnPlayerAdded(player)
	end

	Players.PlayerRemoving:Connect(function(player)
		DetectionBuffers[player] = nil
		DetectionCooldowns[player] = nil
		EnvelopeFailureCounts[player] = nil
		EnvelopeLogHistory[player] = nil
		ExternalPacketProofCounters[player] = nil
		ExternalPacketPreviousProofs[player] = nil
		ExternalPacketCanaryStates[player] = nil
		ExternalPacketCanaryObservations[player] = nil
		InternalPulseStates[player] = nil
		InternalPulseScores[player] = nil
		InternalExternalCrossStates[player] = nil
		local prefix = tostring(player.UserId) .. ":"
		for key in pairs(AbnormalDebugSeen) do
			if string.sub(key, 1, #prefix) == prefix then
				AbnormalDebugSeen[key] = nil
			end
		end
	end)
end

Start()
