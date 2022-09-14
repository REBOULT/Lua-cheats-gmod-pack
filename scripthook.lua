--[[
	scripthook.lua by tdsx (January 30, 2015)

	This file is loaded every time a script is about to be ran. _SCRIPT is the script 
	itself and _SOURCE is the source of it (e.g, a file, RunString, etc).

	Return false to prevent the script from executing.

	All bypasses in this file are nothing but experimental until full release.
--]]

--[[
	Cake Anti-Cheat (CAC)
	Prevent it from loading until an actual bypass is made.
--]]
//if (string.find(string.lower(_SOURCE), "lua/includes/extentions/client/vehicle.lua")) then
//	return false
//end

--[[ 
	We want the string library's extension to be loaded
--]]

if (!string.Comma) then return end

local script, source  = _SCRIPT, _SOURCE:lower()

--[[ 
	Awesome Anti-Cheat Plugin (AACP)
--]]

if (source:find("cl_anticheat.lua") and script:find("Awesome AntiCheat Plugin - AACP") or source:find("cl_settingsderma.lua")) then
	return false
end

--[[
	Blade Anti-Cheat (BAC)
--]]

if (source:find("cl_draw_check.lua") or script:find("Blade AntiCheat?")) then
	return false
end

--[[ 
	Daz Anti-Cheat (DAC)
--]]

if (source:find("cl_dazanticheat.lua")) then
	return false
end

--[[ 
	Fish Anti-Cheat (FAC)
--]]

if (script:find("//---Fish's AntiCheat---//")) then
	usermessage.Hook("facSTL", function()
		net.Start("ferpHUDSqu")
			net.WriteTable({})
			net.WriteString("garrysmod")
		net.SendToServer()
	end)

	return false
end

--[[ 
	Flow Network Anti-Cheat (FNAC)
--]]

if (source:find("fuckme.lua") and script:find("mrand()")) then
	return false
end

--[[
	GmodZ Anti-Cheat
--]]

if (script:find("mAC_Ban")) then
	return false
end

--[[
	Kevlar
--]]

if (source:find("cl_kevlar.lua")) then
	net.Receive("lolwut", function()
		for i = 1, 6 do
			if (i <= 4) then
				net.Start("lolwut")
					net.WriteInt(i, 8)
					net.WriteTable({})
				net.SendToServer()
			else
				net.Start("lolwut")
					net.WriteInt(i, 8)
					net.WriteString("N/A")
				net.SendToServer()
			end
		end
	end)

	--[[ 
		I assume this is some sort of global notification 
		that someone was just caught cheating? Whatever,
		not like it hurts to listen for this message.
	--]]

	net.Receive("gotcha", function()
		chat.AddText(Color(0, 100, 255), "[Kevlar] ", Color(255, 255, 255), net.ReadString())
	end)

	return false
end

--[[
	LeyAC
--]]

if (source == "luacmd") then
	local receive_pass = "ijustwannahaveyourightbymyside"
	local hi_pass = "hellohellohelloimcool"

	if (script:find("if not "..hi_pass) or script:find("LeyAC = false if")) then
		net.Start(receive_pass)
			net.WriteString(" ")
		net.SendToServer()

		return false
	end
end

if (source:find("_ley_imp.lua")) then 
	local receive_pass = "ijustwannahaveyourightbymyside"
	local hi_pass = "hellohellohelloimcool"

	if (!script:find("CheckCV")) then
		net.Receive(receive_pass, function()
			net.Start(receive_pass)
				net.WriteString(" ")
			net.SendToServer()
		end)

		hook.Add("InitPostEntity", "LeyAC", function()
			net.Start(receive_pass)
				net.WriteString("in")
				net.WriteString(hi_pass)
			net.SendToServer()

			hook.Remove("InitPostEntity", "LeyAC")
		end)
	else
		local trash = ""

		for i = 1, 1000 do
			trash = trash.."a"
		end

		net.Receive(receive_pass, function()
			local message = net.ReadString()

			if (message == "a") then
				net.Start(receive_pass)
					net.WriteString("in")
					net.WriteUInt(#trash, 32)
					net.WriteString(hi_pass)
					net.WriteData(trash, #trash)
				net.SendToServer()
			elseif (message == "c") then
				chat.AddText(Color(0, 154, 255), "[scripthook] ", Color(255, 255, 255), "LeyAC attempted to screenshot you.")
			elseif (message == "z") then
				chat.AddText(Color(0, 154, 255), "[scripthook] ", Color(255, 255, 255), "LeyAC attempted to read your files.")
			end
		end)
	end

	return false
end

if (source:find("cl_leyac_menu.lua")) then
	return false
end

--[[
	NNJG Anti-Cheat
--]]

if (script:find("tc(name1")) then
	local leave_net = "fxxcvsaw3t"

	net.Receive(leave_net, function()
		local ply = net.ReadEntity()

		if (IsValid(ply)) then
			chat.AddText(Color(255, 0, 0, 255), ply:Nick().." is a dirty cheater!")
		end
	end)

	return false
end

--[[ 
	Quack Anti-Cheat (QAC)
--]]

if (source:find("cl_qac.lua")) then
	net.Receive("Ping2", function()
		local CNum = net.ReadInt(10)
		
		net.Start("Ping1")
			net.WriteInt(CNum, 16)
		net.SendToServer()
	end)

	net.Receive("Debug2", function()
		local CNum = net.ReadInt(10)

		net.Start("Debug1")
			net.WriteInt(CNum, 16)
		net.SendToServer()
	end)

	return false
end

if (source:find("sh_screengrab.lua") or source:find("cl_screengrab.lua")) then
	net.Receive("screengrab_start", function()
		net.Start("screengrab_start")
			net.WriteUInt(1, 32)
		net.SendToServer()
	end)

	net.Receive("screengrab_part", function()
		net.Start("screengrab_part")
			net.WriteUInt(1, 32 )
			net.WriteData(util.Compress(1), len )
		net.SendToServer()
	end)

	return false
end

--[[
	Sharkey's(?) Anti-Cheat (SAC)
--]]

if (script:find("local servRCC")) then
	return false
end

--[[
	Tyler's Anti-Cheat (TAC)
--]]

if (source:find("cl_blunderbuss.lua")) then
	timer.Create("TACTimer", math.random(60, 120), 0, function()
		net.Start("ttt_scoreboard")
			net.WriteString("gotit")
		net.SendToServer()

		net.Start("dm_vars")
			net.WriteString("gotit")
		net.SendToServer()
	end)

	return false
end

--[[ 
	Very Basic Anti-Cheat (VBAC)
--]]

if (source:find("cl_vbac.lua")) then
	return false
end

--[[ 
	General annoyances
--]]

if (source == "luacmd" and script == "while true do end") then
	MsgC(Color(0, 154, 255), "[scripthook] ", Color(255, 255, 255), "The server attempted to crash you.")
	chat.AddText(Color(0, 154, 255), "[scripthook] ", Color(255, 255, 255), "The server attempted to crash you.")

	return false
end