getgenv().decompilerMessage = "-- Decompiled with Potassium's decompiler."

local msg = getgenv().decompilerMessage

assert(getscriptbytecode, "Executor doesn't support getscriptbytecode...")
assert(request, "Executor doesn't support request...")

local HttpService: HttpService = game:GetService("HttpService")

local function base64Encode(data)
	local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((data:gsub('.', function(x)
		local r,byte = '',x:byte()
		for i=8,1,-1 do
			r = r .. (byte % 2^i - byte % 2^(i-1) > 0 and '1' or '0')
		end
		return r
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if #x < 6 then return '' end
		local c = 0
		for i=1,6 do
			c = c + (x:sub(i,i) == '1' and 2^(6-i) or 0)
		end
		return b:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data % 3 + 1])
end

type DecompileOptions = {
	target: "luau" | "lua51"?,
	mode: "decompile" | "disasm"?,
}

type DecompileMetadata = {
	target: string,
	mode: string,
	bytes: number,
}

type RequestResponse = {
	Body: string?,
	StatusCode: number?,
	Headers: { [string]: string }?,
}

type ParsedResponse = {
	ok: boolean,
	output: string?,
	target: string?,
	mode: string?,
	bytes: number?,
	stage: string?,
	error: string?,
}

local function decompile(bytecode: string | script, opts: DecompileOptions?): (string?, string | DecompileMetadata)
	opts = opts or {}

	if (bytecode:IsA("Script") and bytecode.RunContext == Enum.RunContext.Client) or bytecode:IsA("ModuleScript") or bytecode:IsA("LocalScript") then
		local ok, scriptBytecode = pcall(getscriptbytecode, bytecode)
		if not ok then
			return "-- decompiler.lol | Failed to get bytecode for "..bytecode.Name, "no script bytecode"
		end
		bytecode = scriptBytecode
	end

	assert(type(bytecode) == "string" and #bytecode > 0,"bytecode must be a non-empty string")

	local target: string = opts.target or "luau"
	local mode: string = opts.mode or "decompile"

	local body: string = HttpService:JSONEncode({
		target = target,
		mode = mode,
		bytecodeBase64 = base64Encode(bytecode),
	})

	local res: RequestResponse = request({
		Url = "https://www.decompiler.lol/api/decompile",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json",
		},
		Body = body,
	})

	if not res or not res.Body then
		return "-- decompiler.lol | No response body", "no response body"
	end

	local ok: boolean, parsed: ParsedResponse = pcall(function(): ParsedResponse
		return HttpService:JSONDecode(res.Body) :: ParsedResponse
	end)

	if not ok then
		return "-- decompiler.lol | Invalid JSON response", "invalid JSON response: " .. tostring(res.Body):sub(1, 200)
	end

	if not parsed.ok then
		return "-- decompiler.lol | Unknown Error", ("[%s] %s"):format(parsed.stage or "?", parsed.error or "unknown error")
	end

		-- Fix: Capture the new string returned by string.gsub
	local cleanOutput = string.gsub(parsed.output, "%-%- Decompiled by Sabre %(https://www%.decompiler%.lol/%) %- bytecode v%d+ types v%d+", msg)
	
	return cleanOutput, {
		target = parsed.target or "",
		mode = parsed.mode or "",
		bytes = parsed.bytes or 0,
	}
end

getgenv().decompile = decompile

local res = request({
    Url = "https://files.potassium.pro/version",
    Method = "GET"
})

if res and res.Body then
    local data = HttpService:JSONDecode(res.Body)
    local v1 = data.versionPotassium
    getgenv().identifyexecutor = function() return "Potassium", v1 end
end
