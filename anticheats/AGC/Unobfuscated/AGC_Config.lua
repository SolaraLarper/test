--[[

  ___        _   _   _____                 _               _____ _           _      
 / _ \      | | (_) |  __ \               (_)             /  __ \ |         (_)     
/ /_\ \_ __ | |_ _  | |  \/ __ _ _ __ ___  _ _ __   __ _  | /  \/ |__   __ _ _ _ __ 
|  _  | '_ \| __| | | | __ / _` | '_ ` _ \| | '_ \ / _` | | |   | '_ \ / _` | | '__|
| | | | | | | |_| | | |_\ \ (_| | | | | | | | | | | (_| | | \__/\ | | | (_| | | |   
\_| |_/_| |_|\__|_|  \____/\__,_|_| |_| |_|_|_| |_|\__, |  \____/_| |_|\__,_|_|_|   
                                                    __/ |                           
                                                   |___/                            

gg/Px2yXYX6Nx

--@ Transport policy and configurable detections are listed below. Core detections are hardcoded and cannot be disabled.
-- Current Version: 1.8

]]

local AntiGamingChair = {}

AntiGamingChair.Internal = {
	AgcKey = "agc_license_da7c7d215224d7a9e2b0ae2be770e5e2f8cd4ac40a834f2ec8610c666c2f1638521d9441168aec38ba22edc1ec72c95d29c9b497a6cf88f587c6eb2e68b46881176e3ed81070a5cfcc14f7305e176ec2a6d6e356286d8079e16e476e6400932a",

	PunishmentType = "Kick", -- "Kick" or "Ban"
	LogOnlyMode = false, -- true = webhook/log detections only
	ClientInitDelaySeconds = 0, -- start the report loop immediately (keep it to 0)		
	StartupInvokeGraceSeconds = 10, -- invoke timeouts only log during this startup window (incase the obfuscation makes the loading longer, make this higher)
}

AntiGamingChair.Detections = {

	Executor = {
		RemoteSpy               = true,
		Saveinstance            = true,
		ScriptExecution         = true,
	},

	Environment = {
		UntrustedServices       = true,
		ForeignFFlags           = true,
		AntiFling               = true,
		SelectionAPI            = true,
	},

	LimbResizing = {
		LimbResize              = true,
	},
}

return AntiGamingChair
