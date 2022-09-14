--[[
Copyright (C) Insan3 Cheats.

--Credits:
Insan3, Steavix.
--]]

//I hear this makes the hack load faster, i didn't actually check the O times but whatever.
local hook = hook
local derma = derma
local surface = surface
local vgui = vgui
local input = input
local util = util
local cam = cam
local render = render
local math = math
local draw = draw
local team = team

local Sasha = {}
Sasha.Active = CreateClientConVar("Sasha_Active", 1, true, false)
Sasha.Version = "1.5.0"
Sasha.Ply = LocalPlayer()
Sasha.TTT = (GAMEMODE and GAMEMODE.Name and string.find(GAMEMODE.Name, "Terror") and true) or false
if Sasha.TTT then Sasha.TTTCORPSE = CORPSE end
Sasha.DarkRP = (GAMEMODE and GAMEMODE.Name and string.find(GAMEMODE.Name, "DarkRP") and true) or false

//Converts a string of a color (ex. "Color(255, 255, 255, 255)") into an actual color, and returns the color.
Sasha.GetColorFromString = function(words)
	//I probably shouldve just used string.explode...well.......
	if type(words) != "string" then return Color(255, 255, 255, 255) end
	words = "return "..words
	local func = CompileString(words, "GettingColors", true)
	local good, color = pcall(func)
	if good and type(color) == "table" and color.r and color.g and color.b and color.a then
		return color
	else
		return Color(255, 255, 255, 255)
	end
end

Sasha.Chars = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
Sasha.RandomName = function(amount)
	local toReturn = ""
	local amount = amount or 10
	for i = 1, amount do
		if math.random(0, 1) == 0 then
			toReturn = toReturn..string.lower(table.Random(Sasha.Chars))
		else
			toReturn = toReturn..table.Random(Sasha.Chars)
		end
	end
	return toReturn
end

Sasha.Message = function(...)
	chat.AddText(Color(50, 255, 100), "[Sasha] ", ...)
end

Sasha.Aimbot = {}
Sasha.Aimbot.CurTarget = nil
Sasha.Aimbot.Vars = {}
Sasha.Aimbot.Vars["Active"] = CreateClientConVar("Sasha_Aimbot_Active", 0, true, false)
Sasha.Aimbot.Vars["RandomBones"] = CreateClientConVar("Sasha_Aimbot_RandomBones", 0, true, false)
Sasha.Aimbot.Vars["AttackNPCs"] = CreateClientConVar("Sasha_Aimbot_AttackNPCs", 0, true, false)
Sasha.Aimbot.Vars["AttackPlayers"] = CreateClientConVar("Sasha_Aimbot_AttackPlayers", 0, true, false)
Sasha.Aimbot.Vars["Prediction"] = CreateClientConVar("Sasha_Aimbot_Prediction", 0, true, false)
Sasha.Aimbot.Vars["AimOnKey"] = CreateClientConVar("Sasha_Aimbot_AimOnKey", 0, true, false)
Sasha.Aimbot.Vars["AimOnKey_Key"] = CreateClientConVar("Sasha_Aimbot_AimOnKey_Key", "MOUSE_LEFT", true, false)
Sasha.Aimbot.Vars["MaxAngle"] = CreateClientConVar("Sasha_Aimbot_MaxAngle", 180, true, false)
Sasha.Aimbot.Vars["Preferance"] = CreateClientConVar("Sasha_Aimbot_Preferance", "Distance", true, false)
Sasha.Aimbot.Vars["AntiSnap"] = CreateClientConVar("Sasha_Aimbot_AntiSnap", 0, true, false)
Sasha.Aimbot.Vars["AntiSnapSpeed"] = CreateClientConVar("Sasha_Aimbot_AntiSnapSpeed", 4, true, false)
Sasha.Aimbot.Vars["AutoShoot"] = CreateClientConVar("Sasha_Aimbot_AutoShoot", 0, true, false)
Sasha.Aimbot.Vars["PanicMode"] = CreateClientConVar("Sasha_Aimbot_PanicMode", 0, true, false)
Sasha.Aimbot.Vars["IgnoreTeam"] = CreateClientConVar("Sasha_Aimbot_IgnoreTeam", 0, true, false)

Sasha.Friends = {}
Sasha.Friends.List = {} //The steamIDs of everyone on your friends list
Sasha.Friends.Vars = {}
Sasha.Friends.Vars["Active"] = CreateClientConVar("Sasha_Friends_Active", 0, true, false)
Sasha.Friends.Vars["Reverse"] = CreateClientConVar("Sasha_Friends_Reverse", 0, true, false)

Sasha.ESP = {}
Sasha.ESP.Vars = {}
Sasha.ESP.Vars["Active"] = CreateClientConVar("Sasha_ESP_Active", 0, true, false)
Sasha.ESP.Vars["Players"] = CreateClientConVar("Sasha_ESP_Players", 0, true, false)
Sasha.ESP.Vars["NPCs"] = CreateClientConVar("Sasha_ESP_NPCs", 0, true, false)
Sasha.ESP.Vars["Name"] = CreateClientConVar("Sasha_ESP_Name", "Off", true, false)
Sasha.ESP.Vars["Weapons"] = CreateClientConVar("Sasha_ESP_Weapons", "Off", true, false)
Sasha.ESP.Vars["Distance"] = CreateClientConVar("Sasha_ESP_Distance", "Off", true, false)
Sasha.ESP.Vars["Health"] = CreateClientConVar("Sasha_ESP_Health", "Off", true, false)
Sasha.ESP.Vars["MaxDistance"] = CreateClientConVar("Sasha_ESP_MaxDistance", 0, true, false)
Sasha.ESP.Vars["Box"] = CreateClientConVar("Sasha_ESP_Box", 0, true, false)
Sasha.ESP.Vars["ShowTraitors"] = CreateClientConVar("Sasha_ESP_ShowTraitors", "Off", true, false)
Sasha.ESP.Vars["Bodies"] = CreateClientConVar("Sasha_ESP_Bodies", 0, true, false)
Sasha.ESP.Vars["Radar"] = CreateClientConVar("Sasha_ESP_Radar", 0, true, false)
Sasha.ESP.Vars["RadarScale"] = CreateClientConVar("Sasha_ESP_RadarScale", 20, true, false)
Sasha.ESP.Vars["TeamBased"] = CreateClientConVar("Sasha_ESP_TeamBased", 0, true, false)

Sasha.Chams = {}
Sasha.Chams.Mat = CreateMaterial(Sasha.RandomName(math.random(10,15)), "VertexLitGeneric", { ["$basetexture"] = "models/debug/debugwhite", ["$model"] = 1, ["$ignorez"] = 1 })
Sasha.Chams.Vars = {}
Sasha.Chams.Vars["Active"] = CreateClientConVar("Sasha_Chams_Active", 0, true, false)
Sasha.Chams.Vars["Players"] = CreateClientConVar("Sasha_Chams_Players", 0, true, false)
Sasha.Chams.Vars["NPCs"] = CreateClientConVar("Sasha_Chams_NPCs", 0, true, false)
Sasha.Chams.Vars["Weapons"] = CreateClientConVar("Sasha_Chams_Weapons", 0, true, false)
Sasha.Chams.Vars["MaxDistance"] = CreateClientConVar("Sasha_Chams_MaxDistance", 0, true, false)
Sasha.Chams.Vars["Bodies"] = CreateClientConVar("Sasha_Chams_Boddies", 0, true, false)
Sasha.Chams.Vars["TeamBased"] = CreateClientConVar("Sasha_Chams_TeamBased", 0, true, false)

Sasha.Entities = {}
Sasha.Entities.List = {} //The class namse of all the entities
Sasha.Entities.Vars = {}
Sasha.Entities.Vars["Active"] = CreateClientConVar("Sasha_Entities_Active", 0, true, false)

Sasha.Misc = {}
Sasha.Misc.Vars = {}
Sasha.Misc.Vars["ShowAdmins"] = CreateClientConVar("Sasha_Misc_ShowAdmins", 0, true, false)
Sasha.Misc.Vars["Crosshair"] = CreateClientConVar("Sasha_Misc_Cross", 0, true, false)
Sasha.Misc.Vars["CrosshairSize"] = CreateClientConVar("Sasha_Misc_CrossSize", 50, true, false)
Sasha.Misc.Vars["NoRecoil"] = CreateClientConVar("Sasha_Misc_NoRecoil", 0, true, false)
Sasha.Misc.Vars["ShowSpectators"] = CreateClientConVar("Sasha_Misc_ShowSpectators", 0, true, false)
Sasha.Misc.Vars["BunnyHop"] = CreateClientConVar("Sasha_Misc_BunnyHop", 0, true, false)
Sasha.Misc.Vars["BunnyHop_Key"] = CreateClientConVar("Sasha_Misc_BunnyHop_Key", "KEY_SPACE", true, false)
Sasha.Misc.Vars["AutoReload"] = CreateClientConVar("Sasha_Misc_AutoReload", 0, true, false)
Sasha.Misc.Vars["AutoPistol"] = CreateClientConVar("Sasha_Misc_AutoPistol", 0, true, false)
Sasha.Misc.Vars["BuyHealth"] = CreateClientConVar("Sasha_Misc_BuyHealth", 0, true, false)
Sasha.Misc.Vars["BuyHealth_Minimum"] = CreateClientConVar("Sasha_Misc_BuyHealth_Minimum", 80, true, false)
Sasha.Misc.Vars["TraitorFinder"] = CreateClientConVar("Sasha_Misc_TraitorFinder", 0, true, false)
Sasha.Misc.Vars["Deaths"] = CreateClientConVar("Sasha_Misc_Deaths", 0, true, false)
Sasha.Misc.Vars["Sounds"] = CreateClientConVar("Sasha_Misc_Sounds", 0, true, false)

Sasha.Style = {}
Sasha.Style.Vars = {}
Sasha.Style.Vars["BoundingBox"] = {}
Sasha.Style.Vars["BoundingBox"].var = CreateClientConVar("Sasha_Style_BoundingBox", "Color(255, 0, 0, 255)", true, false)
Sasha.Style.Vars["BoundingBox"].color = Sasha.GetColorFromString(Sasha.Style.Vars["BoundingBox"].var:GetString())
Sasha.Style.Vars["ESPText"] = {}
Sasha.Style.Vars["ESPText"].var = CreateClientConVar("Sasha_Style_ESPText", "Color(255, 255, 255, 255)", true, false)
Sasha.Style.Vars["ESPText"].color = Sasha.GetColorFromString(Sasha.Style.Vars["ESPText"].var:GetString())
Sasha.Style.Vars["Crosshair"] = {}
Sasha.Style.Vars["Crosshair"].var = CreateClientConVar("Sasha_Style_Cross", "Color(255, 255, 255, 255)", true, false)
Sasha.Style.Vars["Crosshair"].color = Sasha.GetColorFromString(Sasha.Style.Vars["Crosshair"].var:GetString())
Sasha.Style.Vars["BodyText"] = {}
Sasha.Style.Vars["BodyText"].var = CreateClientConVar("Sasha_Style_BodyText", "Color(255, 255, 255, 255)", true, false)
Sasha.Style.Vars["BodyText"].color = Sasha.GetColorFromString(Sasha.Style.Vars["BodyText"].var:GetString())
Sasha.Style.Vars["Chams"] = {}
Sasha.Style.Vars["Chams"].var = CreateClientConVar("Sasha_Style_Chams", "Color(0, 255, 0, 255)", true, false)
Sasha.Style.Vars["Chams"].color = Sasha.GetColorFromString(Sasha.Style.Vars["Chams"].var:GetString())
Sasha.Style.Vars["BodyChams"] = {}
Sasha.Style.Vars["BodyChams"].var = CreateClientConVar("Sasha_Style_BodyChams", "Color(0, 255, 0, 255)", true, false)
Sasha.Style.Vars["BodyChams"].color = Sasha.GetColorFromString(Sasha.Style.Vars["BodyChams"].var:GetString())

//This loads our friends list and custom entities list.
/*Sasha.SavedData = CreateClientConVar("Sasha_SaveData", Sasha.RandomName(math.random(10, 15)), true, false)
if file.Exists(Sasha.SavedData:GetString()..".txt", "DATA") then
	local info = string.Explode("\n", file.Read(Sasha.SavedData:GetString()..".txt", "DATA"))
	if type(info) == "table" and info[1] and info[2] then
		Sasha.Friends.List = util.JSONToTable(info[1])
		Sasha.Entities.List = util.JSONToTable(info[2])
	end
end

Sasha.SaveData = function()
	file.Write(Sasha.SavedData:GetString()..".txt", util.TableToJSON(Sasha.Friends.List))
	file.Append(Sasha.SavedData:GetString()..".txt", "\n")
	file.Append(Sasha.SavedData:GetString()..".txt", util.TableToJSON(Sasha.Entities.List))
end*/

//This is all the bones i look for in the order im looking for them. Feel free to change the order if you want to attack the foot before the head or something like that.
Sasha.Bones = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Neck1",
"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_Spine1",
"ValveBiped.Bip01_Spine",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Bip01_R_Thigh",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_R_Toe0",
"ValveBiped.Bip01_L_Thigh",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot",
"ValveBiped.Bip01_L_Toe0"
}

//If random bones is enabled this list is gone through, randomly, and if none of the bones on this list are found the entire list (above) is gone through.
//If you edit this be sure to edit the function below it.
Sasha.RandomBones = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Neck1",
"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_L_UpperArm"
}
Sasha.GetRandomBones = function()
	local temp = {}
	local function GetBones() //Ahh recursion, i love you.
		if #Sasha.RandomBones > 0 then
			local random = math.random(1, #Sasha.RandomBones)
			table.insert(temp, Sasha.RandomBones[random])
			table.remove(Sasha.RandomBones, random)
			GetBones()
		else
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_Head1")
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_Neck1")
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_Spine4")
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_Spine2")
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_R_UpperArm")
			table.insert(Sasha.RandomBones, "ValveBiped.Bip01_L_UpperArm")
		end
	end
	GetBones()
	return temp
end

//A list of all keyboard keys, for binding
Sasha.Keys = {
[0] = "KEY_NONE",
[1] = "KEY_0",
[2] = "KEY_1",
[3] = "KEY_2",
[4] = "KEY_3",
[5] = "KEY_4",
[6] = "KEY_5",
[7] = "KEY_6",
[8] = "KEY_7",
[9] = "KEY_8",
[10] = "KEY_9",
[11] = "KEY_A",
[12] = "KEY_B",
[13] = "KEY_C",
[14] = "KEY_D",
[15] = "KEY_E",
[16] = "KEY_F",
[17] = "KEY_G",
[18] = "KEY_H",
[19] = "KEY_I",
[20] = "KEY_J",
[21] = "KEY_K",
[22] = "KEY_L",
[23] = "KEY_M",
[24] = "KEY_N",
[25] = "KEY_O",
[26] = "KEY_P",
[27] = "KEY_Q",
[28] = "KEY_R",
[29] = "KEY_S",
[30] = "KEY_T",
[31] = "KEY_U",
[32] = "KEY_V",
[33] = "KEY_W",
[34] = "KEY_X",
[35] = "KEY_Y",
[36] = "KEY_Z",
[37] = "KEY_PAD_0",
[38] = "KEY_PAD_1",
[39] = "KEY_PAD_2",
[40] = "KEY_PAD_3",
[41] = "KEY_PAD_4",
[42] = "KEY_PAD_5",
[43] = "KEY_PAD_6",
[44] = "KEY_PAD_7",
[45] = "KEY_PAD_8",
[46] = "KEY_PAD_9",
[47] = "KEY_PAD_DIVIDE",
[48] = "KEY_PAD_MULTIPLY",
[49] = "KEY_PAD_MINUS",
[50] = "KEY_PAD_PLUS",
[51] = "KEY_PAD_ENTER",
[52] = "KEY_PAD_DECIMAL",
[53] = "KEY_LBRACKET",
[54] = "KEY_RBRACKET",
[55] = "KEY_SEMICOLON",
[56] = "KEY_APOSTROPHE",
[57] = "KEY_BACKQUOTE",
[58] = "KEY_COMMA",
[59] = "KEY_PERIOD",
[60] = "KEY_SLASH",
[61] = "KEY_BACKSLASH",
[62] = "KEY_MINUS",
[63] = "KEY_EQUAL",
[64] = "KEY_ENTER",
[65] = "KEY_SPACE",
[66] = "KEY_BACKSPACE",
[67] = "KEY_TAB",
[68] = "KEY_CAPSLOCK",
[69] = "KEY_NUMLOCK",
[70] = "KEY_ESCAPE",
[71] = "KEY_SCROLLLOCK",
[72] = "KEY_INSERT",
[73] = "KEY_DELETE",
[74] = "KEY_HOME",
[75] = "KEY_END",
[76] = "KEY_PAGEUP",
[77] = "KEY_PAGEDOWN",
[78] = "KEY_BREAK",
[79] = "KEY_LSHIFT",
[80] = "KEY_RSHIFT",
[81] = "KEY_LALT",
[82] = "KEY_RALT",
[83] = "KEY_LCONTROL",
[84] = "KEY_RCONTROL",
[85] = "KEY_LWIN",
[86] = "KEY_RWIN",
[87] = "KEY_APP",
[88] = "KEY_UP",
[89] = "KEY_LEFT",
[90] = "KEY_DOWN",
[91] = "KEY_RIGHT",
[92] = "KEY_F1",
[93] = "KEY_F2",
[94] = "KEY_F3",
[95] = "KEY_F4",
[96] = "KEY_F5",
[97] = "KEY_F6",
[98] = "KEY_F7",
[99] = "KEY_F8",
[100] = "KEY_F9",
[101] = "KEY_F10",
[102] = "KEY_F11",
[103] = "KEY_F12",
//[104] = "KEY_CAPSLOCKTOGGLE", //THESE
//[105] = "KEY_NUMLOCKTOGGLE", //MOFOS
//[106] = "KEY_SCROLLLOCKTOGGLE", //SHOULD DIE
[107] = "KEY_XBUTTON_UP",
[108] = "KEY_XBUTTON_DOWN",
[109] = "KEY_XBUTTON_LEFT",
[110] = "KEY_XBUTTON_RIGHT",
[111] = "KEY_XBUTTON_START",
[112] = "KEY_XBUTTON_BACK",
[113] = "KEY_XBUTTON_STICK1",
[114] = "KEY_XBUTTON_STICK2",
[115] = "KEY_XBUTTON_A",
[116] = "KEY_XBUTTON_B",
[117] = "KEY_XBUTTON_X",
[118] = "KEY_XBUTTON_Y",
[119] = "KEY_XBUTTON_BLACK",
[120] = "KEY_XBUTTON_WHITE",
[121] = "KEY_XBUTTON_LTRIGGER",
[122] = "KEY_XBUTTON_RTRIGGER",
[123] = "KEY_XSTICK1_UP",
[124] = "KEY_XSTICK1_DOWN",
[125] = "KEY_XSTICK1_LEFT",
[126] = "KEY_XSTICK1_RIGHT",
[127] = "KEY_XSTICK2_UP",
[128] = "KEY_XSTICK2_DOWN",
[129] = "KEY_XSTICK2_LEFT",
[130] = "KEY_XSTICK2_RIGHT"
}
//A list of all mouse keys, for binding
Sasha.MouseKeys = {
[107] = "MOUSE_LEFT",
[108] = "MOUSE_RIGHT",
[109] = "MOUSE_MIDDLE",
[110] = "MOUSE_4",
[111] = "MOUSE_5"
}
//Tells me if a specific key is pressed. Loops through both tables.
Sasha.KeyPressed = function(key)
	if Sasha.InChat then return false end
	
	for k = 107, 111 do
		if key == Sasha.MouseKeys[k] then
			if input.IsMouseDown(k) then
				return true
			else
				return false
			end
		end
	end
	
	for k = 0, 130 do
		if key == Sasha.Keys[k] then
			if input.IsKeyDown(k) then
				return true
			else
				return false
			end
		end
	end
	
	return false
end

//Very simple. If the boolean is true it returns 1. If the boolean is false then it returns 0. I dont think i ended up using this anywhere, but whatever, ill leave it here.
Sasha.BoolToInt = function(bool)
	if bool then 
		return 1
	else
		return 0
	end
end

//Checking if a bone is visible, pos is the position of the bone and ent is the entity whos bone were looking for. 
Sasha.SpotIsVisible = function(pos, ent)
	ent = ent or Sasha.Aimbot.CurTarget
	local tracedata = {}
	tracedata.start = Sasha.Ply:GetShootPos()
	tracedata.endpos = pos
	tracedata.filter = {Sasha.Ply, ent}
	
	local trace = util.TraceLine(tracedata)
	if trace.HitPos:Distance(pos) < 0.005 then
		return true
	else
		return false
	end
end

//Checks all of the entities bones to find if we can see this entity or not.
Sasha.CanSee = function(ent)
	for k = 1, #Sasha.Bones do 
		local v = Sasha.Bones[k]
		local bone = ent:LookupBone(v)
		if bone != nil then
			local pos, ang = ent:GetBonePosition(bone)
			if Sasha.SpotIsVisible(pos, ent) then
				return true
			end
		end
	end
	return false
end

//This returns the next entity we should attack.
Sasha.GetTarget = function()
	if Sasha.Aimbot.Vars["AttackNPCs"]:GetBool() or Sasha.Aimbot.Vars["AttackPlayers"]:GetBool() then
		local targets = {}
		local everything = ents.GetAll()
		for k = 1, #everything do 
			local v = everything[k]
			if Sasha.Aimbot.Vars["AttackNPCs"]:GetBool() and v:IsNPC() then
				if Sasha.CanSee(v) then
					table.insert(targets, {["Target"] = v, ["Pos"] = v:LocalToWorld(v:OBBCenter())})
				end
			elseif Sasha.Aimbot.Vars["AttackPlayers"]:GetBool() and v:IsPlayer() and v != Sasha.Ply then
				if Sasha.CanSee(v) then
					table.insert(targets, {["Target"] = v, ["Pos"] = v:LocalToWorld(v:OBBCenter())})
				end
			end
		end
		
		for k,v in SortedPairs(targets, true) do //It will already be sorted so this shouldn't be too resource heavy, the main point of this is to loop through the table backwards
			local v = v["Target"]
			local shouldremove = false
			if Sasha.Aimbot.Vars["IgnoreTeam"]:GetBool() and v:IsPlayer() then
				if Sasha.TTT then
					if Sasha.Ply:GetRole() == 1 and v:GetRole() == 1 then
						shouldremove = true
					end
						
					if Sasha.Ply:GetRole() != 1 and not table.HasValue(Sasha.Traitors, v) then
						shouldremove = true
					end
				else
					if v:Team() == Sasha.Ply:Team() then
						shouldremove = true
					end
				end
			end
			
			if Sasha.Friends.Vars["Active"]:GetBool() then
				if Sasha.Friends.Vars["Reverse"]:GetBool() then
					if not table.HasValue(Sasha.Friends.List, v:SteamID()) then
						shouldremove = true
					end
				else
					if table.HasValue(Sasha.Friends.List, v:SteamID()) then
						shouldremove = true		
					end
				end
			end
			
			if shouldremove then
				table.remove(targets, k)
			end
		end
		
		if #targets == 0 then 
			return nil
		elseif #targets == 1 then
			targets[1]["Target"].BoneToAimAt = nil
			return targets[1]["Target"]
		end
		
		if Sasha.Aimbot.Vars["Preferance"]:GetString() == "Distance" then
			local min = {["Distance"] = Sasha.Ply:GetPos():Distance(targets[1]["Pos"]), ["Target"] = targets[1]["Target"]}
			for k = 1, #targets do 
				local v = targets[k]
				
				local distance = Sasha.Ply:GetPos():Distance(v["Pos"])
				if distance < min["Distance"] then
					min = {["Distance"] = distance, ["Target"] = v["Target"]}
				end
			end
			min["Target"].BoneToAimAt = nil
			return min["Target"]
		elseif Sasha.Aimbot.Vars["Preferance"]:GetString() == "Angle" then		
			local min = {["Angle"] = Sasha.AngleTo(targets[1]["Pos"]), ["Target"] = targets[1]["Target"]}
			for k = 1, #targets do 
				local v = targets[k]
				
				local angle = Sasha.AngleTo(v["Pos"])
				if angle < min["Angle"] then
					min = {["Angle"] = angle, ["Target"] = v["Target"]}
				end
			end
			min["Target"].BoneToAimAt = nil
			return min["Target"]
		end
	else
		return nil
	end
end

//This returns the total angle away from the target we are, and then the pitch and yaw seperately
Sasha.AngleTo = function(pos)
	local myAngs = Sasha.Ply:GetAngles()
	local needed = (pos - Sasha.Ply:GetShootPos()):Angle()
	
	myAngs.p = math.NormalizeAngle(myAngs.p)
	needed.p = math.NormalizeAngle(needed.p)
	
	myAngs.y = math.NormalizeAngle(myAngs.y)
	needed.y = math.NormalizeAngle(needed.y)
	
	local p = math.NormalizeAngle(needed.p - myAngs.p)
	local y = math.NormalizeAngle(needed.y - myAngs.y)
	
	return math.abs(p) + math.abs(y), {p = p, y = y}
end

//Returns true if our target meets our preferances.
Sasha.ValidTarget = function()
	if Sasha.Aimbot.CurTarget == nil then return false end
	if not IsValid(Sasha.Aimbot.CurTarget) then return false end
	if Sasha.Aimbot.CurTarget:IsPlayer() and (not Sasha.Aimbot.CurTarget:Alive() or Sasha.Aimbot.CurTarget:Team() == TEAM_SPECTATOR or Sasha.Aimbot.CurTarget:Health() < 1) then return false end
	if not Sasha.Aimbot.Vars["AttackNPCs"]:GetBool() and Sasha.Aimbot.CurTarget:IsNPC() then return false end
	if not Sasha.Aimbot.Vars["AttackPlayers"]:GetBool() and Sasha.Aimbot.CurTarget:IsPlayer() then return false end
	if not Sasha.CanSee(Sasha.Aimbot.CurTarget) then return false end
	if Sasha.Aimbot.Vars["IgnoreTeam"]:GetBool() and Sasha.Aimbot.CurTarget:IsPlayer() then
		if Sasha.TTT then
			if Sasha.Ply:GetRole() == 1 and Sasha.Aimbot.CurTarget:GetRole() == 1 then return false end				
			if Sasha.Ply:GetRole() != 1 and not table.HasValue(Sasha.Traitors, Sasha.Aimbot.CurTarget) then return false end
		else
			if Sasha.Aimbot.CurTarget:Team() == Sasha.Ply:Team() then return false end
		end
	end
	
	return true
end

hook.Add("RenderScreenspaceEffects", Sasha.RandomName(math.random(10, 15)), function()
	if Sasha.Active:GetBool() then
		local everything = ents.GetAll()
		for k = 1, #everything do
			local v = everything[k]
			
			if Sasha.Chams.Vars["Active"]:GetBool() and v != Sasha.Ply and (Sasha.Chams.Vars["MaxDistance"]:GetInt() == 0 or v:GetPos():Distance(Sasha.Ply:GetPos()) < Sasha.Chams.Vars["MaxDistance"]:GetInt()) then
				cam.Start3D(EyePos(), EyeAngles())
					if (v:IsPlayer() and v:Alive() and v:Team() != TEAM_SPECTATOR and Sasha.Chams.Vars["Players"]:GetBool()) or (v:IsNPC() and v:Health() > 0 and Sasha.Chams.Vars["NPCs"]:GetBool()) then
						local color = Sasha.Style.Vars["Chams"].color
						if Sasha.Chams.Vars["TeamBased"]:GetBool() and v:IsPlayer() then
							color = team.GetColor(v:Team())
							if Sasha.TTT then
								if v:GetRole() == 2 then
									color = Color(0, 0, 255, 255)
								elseif table.HasValue(Sasha.Traitors, v) then
									color = Color(255, 0, 0, 255)
								else
									color = Color(0, 255, 0, 255)
								end
							end
						end
						render.SuppressEngineLighting(true)
						render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)
						render.MaterialOverride(Sasha.Chams.Mat)
						v:DrawModel()
						
						render.SetColorModulation((color.r + 150)/250, (color.g + 150)/250, (color.b + 150)/255, 1)						
						if IsValid(v:GetActiveWeapon()) and Sasha.Chams.Vars["Weapons"]:GetBool() then
							v:GetActiveWeapon():DrawModel() 
						end
						
						render.SetColorModulation(1, 1, 1, 1)
						render.MaterialOverride()
						render.SetModelLighting(4, color.r/255, color.g/255, color.b/255)
						v:DrawModel()
						render.SuppressEngineLighting(false)
					elseif Sasha.TTT and Sasha.Chams.Vars["Bodies"]:GetBool() and v:GetClass() == "prop_ragdoll" then
						local color = Sasha.Style.Vars["BodyChams"].color
						render.SuppressEngineLighting(true)	
						render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)
						render.MaterialOverride(Sasha.Chams.Mat)
						v:DrawModel()	
						render.SetColorModulation(1, 1, 1, 1)
						render.MaterialOverride()
						render.SetModelLighting(4, color.r/255, color.g/255, color.b/255)
						v:DrawModel()
						render.SuppressEngineLighting(false)
					elseif Sasha.Entities.Vars["Active"]:GetBool() and table.HasValue(Sasha.Entities.List, v:GetClass()) then
						local color = Sasha.Style.Vars["Chams"].color					
						render.SuppressEngineLighting(true)	
						render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)
						render.MaterialOverride(Sasha.Chams.Mat)
						v:DrawModel()	
						render.SetColorModulation(1, 1, 1, 1)
						render.MaterialOverride()
						render.SetModelLighting(4, color.r/255, color.g/255, color.b/255)
						v:DrawModel()
						render.SuppressEngineLighting(false)
					end
				cam.End3D()
			end
		end
	end
end)

//Helper function on radar. I just copied this one from the wiki.
Sasha.DrawFilledCircle = function(x, y, radius, quality)
	local circle = {}
    local tmp = 0
    for i = 1, quality do
        tmp = math.rad(i * 360) / quality 
        circle[i] = {x = x + math.cos(tmp) * radius, y = y + math.sin(tmp) * radius}
    end
	surface.DrawPoly(circle)
end

//Another helper fuction on the radar.
Sasha.DrawArrow = function(x, y, myRotation)
	local arrow = {}	
	arrow[1] = {x = x, y = y}
	arrow[2] = {x = x + 4, y = y + 7.5}
	arrow[3] = {x = x, y = y + 5}
	arrow[4] = {x = x - 4, y = y + 7.5}
	
	//Now that i have the arrow determined, i have to rotate it to match the targets angle
	myRotation = myRotation * -1
	myRotation = math.rad(myRotation)
	for i = 1, 4 do
		local theirX = arrow[i].x
		local theirY = arrow[i].y
		
		theirX = theirX - x
		theirY = theirY - y
		
		arrow[i].x = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
		arrow[i].y = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
		
		arrow[i].x = arrow[i].x + x
		arrow[i].y = arrow[i].y + y
	end

	surface.DrawPoly(arrow)
end

Sasha.Traitors = {}
Sasha.SuperAdmins = {}
Sasha.Admins = {}
Sasha.Spectators = {}
local radarX, radarY, radarWidth, radarHeight = 100, 200, 150, 150
hook.Add("HUDPaint", Sasha.RandomName(math.random(10, 15)), function()
	if Sasha.Active:GetBool() then	
		local everything = ents.GetAll()
		
		if Sasha.ESP.Vars["Active"]:GetBool() and Sasha.ESP.Vars["Radar"]:GetBool() then //Setting up the background here. And since the ESP doesnt draw you 
			draw.RoundedBox(0, radarX, radarY, radarWidth, radarHeight, Color(100, 100, 100, 255 ))
			draw.NoTexture()
			if Sasha.ESP.Vars["TeamBased"]:GetBool() then
				local color = team.GetColor(Sasha.Ply:Team())
				if Sasha.TTT then
					if Sasha.Ply:GetRole() == 2 then
						color = Color(0, 0, 255, 255)
					elseif Sasha.Ply:GetRole() == 1 then
						color = Color(255, 0, 0, 255)
					else
						color = Color(0, 255, 0, 255)
					end
				end
				surface.SetDrawColor(color)
			else
				surface.SetDrawColor(Sasha.Style.Vars["ESPText"].color)
			end
			Sasha.DrawArrow(radarX + (radarWidth / 2), radarY + (radarHeight / 2), 0)
		end
		
		for k = 1, #everything do
			local v = everything[k]
		
			if Sasha.ESP.Vars["Active"]:GetBool() and v != Sasha.Ply and (Sasha.ESP.Vars["MaxDistance"]:GetInt() == 0 or v:GetPos():Distance(Sasha.Ply:GetPos()) < Sasha.ESP.Vars["MaxDistance"]:GetInt()) then										
				if (v:IsPlayer() and v:Alive() and v:Team() != TEAM_SPECTATOR and Sasha.ESP.Vars["Players"]:GetBool()) or (v:IsNPC() and v:Health() > 0 and Sasha.ESP.Vars["NPCs"]:GetBool()) then
					local color = Sasha.Style.Vars["ESPText"].color
					if Sasha.ESP.Vars["TeamBased"]:GetBool() and v:IsPlayer() then
						color = team.GetColor(v:Team())
						if Sasha.TTT then
							if v:GetRole() == 2 then
								color = Color(0, 0, 255, 255)
							elseif table.HasValue(Sasha.Traitors, v) then
								color = Color(255, 0, 0, 255)
							else
								color = Color(0, 255, 0, 255)
							end
						end
					end
					
					local Min, Max = v:GetCollisionBounds()
					if Sasha.ESP.Vars["Box"]:GetBool() then
						local one = v:LocalToWorld(Min):ToScreen()
						local two = v:LocalToWorld(Vector(Min.x, Min.y, Max.z)):ToScreen()
						local three = v:LocalToWorld(Vector(Min.x, Min.y + (Max.y * 2), Min.z)):ToScreen()
						local four = v:LocalToWorld(Vector(Min.x + (Max.x * 2), Min.y, Min.z)):ToScreen()
						local five = v:LocalToWorld(Max):ToScreen()
						local six = v:LocalToWorld(Vector(Max.x, Max.y, Min.z)):ToScreen()
						local seven = v:LocalToWorld(Vector(Max.x, Max.y + (Min.y * 2), Max.z)):ToScreen()
						local eight = v:LocalToWorld(Vector(Max.x + (Min.x * 2), Max.y, Max.z)):ToScreen()				
						
						if Sasha.ESP.Vars["TeamBased"]:GetBool() then
							surface.SetDrawColor(color)
						else
							surface.SetDrawColor(Sasha.Style.Vars["BoundingBox"].color)
						end
						local function connect(tabone, tabtwo)
							surface.DrawLine(tabone.x, tabone.y, tabtwo.x, tabtwo.y)
						end
						
						connect(one, two)
						connect(three, eight)
						connect(four, seven)
						connect(six, five)
						connect(four, six)
						connect(four, one)
						connect(one, three)
						connect(three, six)
						connect(five, eight)
						connect(eight, two)
						connect(two, seven)
						connect(seven, five)
					end
					
					surface.SetFont("ESPFont")
					local top = v:GetPos() + Vector(0, 0, Max.z + 10) // A little above their head so its not constantly covering their face.
					local topscreen = top:ToScreen()
					local topy = topscreen.y
					
					local bottom = v:GetPos()
					local bottomscreen = bottom:ToScreen()
					local bottomy = bottomscreen.y
					
					local function DrawAbove(text)
						local W, H = surface.GetTextSize(text)
						surface.SetTextPos(topscreen.x - W / 2, topy) 
						surface.DrawText(text)
						
						topy = topy + H
					end
					
					local function DrawBelow(text)
						local W, H = surface.GetTextSize(text)
						surface.SetTextPos(bottomscreen.x - W / 2, bottomy) 
						surface.DrawText(text)
						
						bottomy = bottomy + H
					end
					
					surface.SetTextColor(Color(255, 0, 0, 255))
					if Sasha.ESP.Vars["ShowTraitors"]:GetString() != "Off" and table.HasValue(Sasha.Traitors, v) then
						if Sasha.ESP.Vars["ShowTraitors"]:GetString() == "Above" then
							DrawAbove("Traitor")
						else
							DrawBelow("Traitor")
						end
					end
					
					surface.SetTextColor(color)
					if v:IsPlayer() then
						if Sasha.ESP.Vars["Name"]:GetString() == "Above" then
							DrawAbove("Name: "..v:Nick())
						elseif Sasha.ESP.Vars["Name"]:GetString() == "Below" then
							DrawBelow("Name: "..v:Nick())
						end
					else
						if Sasha.ESP.Vars["Name"]:GetString() == "Above" then
							DrawAbove("Name: "..v:GetClass())
						elseif Sasha.ESP.Vars["Name"]:GetString() == "Below" then
							DrawBelow("Name: "..v:GetClass())
						end
					end
					
					if Sasha.ESP.Vars["Weapons"]:GetString() == "Above" and IsValid(v:GetActiveWeapon()) then
						DrawAbove("Weapon: "..v:GetActiveWeapon():GetClass()) 
					elseif Sasha.ESP.Vars["Weapons"]:GetString() == "Below" and IsValid(v:GetActiveWeapon()) then
						DrawBelow("Weapon: "..v:GetActiveWeapon():GetClass()) 
					end		
					
					if Sasha.ESP.Vars["Distance"]:GetString() == "Above" then 
						DrawAbove("Distance: "..bottom:Distance(Sasha.Ply:GetPos())) 
					elseif Sasha.ESP.Vars["Distance"]:GetString() == "Below" then
						DrawBelow("Distance: "..bottom:Distance(Sasha.Ply:GetPos())) 
					end	
					
					if Sasha.ESP.Vars["Health"]:GetString() == "Above" then 
						DrawAbove("HP: "..v:Health()) 
					elseif Sasha.ESP.Vars["Health"]:GetString() == "Below" then
						DrawBelow("HP: "..v:Health()) 
					end
					
					if Sasha.ESP.Vars["Radar"]:GetBool() then
						surface.SetDrawColor(color)
						local myPos = Sasha.Ply:GetPos()
						local theirPos = v:GetPos()
						local myAngles = Sasha.Ply:GetAngles()
						
						local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / Sasha.ESP.Vars["RadarScale"]:GetInt())
						local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / Sasha.ESP.Vars["RadarScale"]:GetInt())
						
						//Now i have to rotate this
						local myRotation = myAngles.y - 90
						myRotation = math.rad(myRotation)
						
						theirX = theirX - (radarX + (radarWidth / 2))
						theirY = theirY - (radarY + (radarHeight / 2))
						local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
						local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
						newX = newX + (radarX + (radarWidth / 2))
						newY = newY + (radarY + (radarHeight / 2))
						
						//And now that its rotated i can check if its within our radars bounds and draw it
						if newX < (radarX + radarWidth) and newX > radarX and newY < (radarY + radarHeight) and newY > radarY then
							Sasha.DrawArrow(newX, newY, v:EyeAngles().y - myAngles.y)
						end
					end
				elseif Sasha.TTT and Sasha.ESP.Vars["Bodies"]:GetBool() and v:GetClass() == "prop_ragdoll" then
					surface.SetFont("ESPFont")
					
					//Im just going to position this info at the center of the player, if i get any complaints ill change it
					local pos = v:LocalToWorld(v:OBBCenter())
					local poscreen = pos:ToScreen()
					local W, H = surface.GetTextSize("Sample") //It doesnt have to be perfect but this will help center the text more.
					local y = poscreen.y - (H * 1.5)
					
					local function DrawText(text)
						local W, H = surface.GetTextSize(text)
						surface.SetTextPos(poscreen.x - W / 2, y) 
						surface.DrawText(text)
						
						y = y + H
					end
					
					surface.SetTextColor(Sasha.Style.Vars["BodyText"].color)
					DrawText("Credits: "..Sasha.TTTCORPSE.GetCredits(v, 0))
					DrawText("Name: "..Sasha.TTTCORPSE.GetPlayerNick(v, "Unknown"))
					DrawText("Found: "..tostring(Sasha.TTTCORPSE.GetFound(v, false)))
					
					if Sasha.ESP.Vars["Radar"] then
						surface.SetDrawColor(Sasha.Style.Vars["BodyText"].color)
						local myPos = Sasha.Ply:GetPos()
						local theirPos = v:GetPos()
						
						local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / Sasha.ESP.Vars["RadarScale"]:GetInt())
						local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / Sasha.ESP.Vars["RadarScale"]:GetInt())
						
						//Now i have to rotate this
						local myRotation = Sasha.Ply:GetAngles().y - 90
						myRotation = math.rad(myRotation)
						
						theirX = theirX - (radarX + (radarWidth / 2))
						theirY = theirY - (radarY + (radarHeight / 2))
						local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
						local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
						newX = newX + (radarX + (radarWidth / 2))
						newY = newY + (radarY + (radarHeight / 2))
						
						//And now that its rotated i can check if its within our radars bounds and draw it
						if newX < (radarX + radarWidth) and newX > radarX and newY < (radarY + radarHeight) and newY > radarY then
							Sasha.DrawFilledCircle(newX, newY, 2, 4)
						end
					end
				elseif Sasha.Entities.Vars["Active"]:GetBool() and table.HasValue(Sasha.Entities.List, v:GetClass()) then
					surface.SetFont("ESPFont")
					surface.SetTextColor(Sasha.Style.Vars["ESPText"].color)
					
					local text = v:GetClass()
					local W, H = surface.GetTextSize(text)
					
					local PosScreen = v:GetPos():ToScreen()
					surface.SetTextPos(PosScreen.x - W / 2, PosScreen.y) 
					surface.DrawText(text)
				end
			end
			
			surface.SetFont("default")
			if v:IsPlayer() and v:IsSuperAdmin() then
				if not table.HasValue(Sasha.SuperAdmins, v) then
					table.insert(Sasha.SuperAdmins, v) 
					Sasha.Message("Super Admin "..v:Nick().." joined the game.")
					if Sasha.Misc.Vars["Sounds"]:GetBool() then
						surface.PlaySound("vo/npc/Alyx/watchout02.wav")
					end	
				end
			end			
			if v:IsPlayer() and v:IsAdmin() and not v:IsSuperAdmin() then
				if not table.HasValue(Sasha.Admins, v) then
					table.insert(Sasha.Admins, v)
					Sasha.Message("Admin "..v:Nick().." joined the game.")
					if Sasha.Misc.Vars["Sounds"]:GetBool() then
						surface.PlaySound("vo/npc/Alyx/watchout01.wav")
					end	
				end
			end		
			for k,v in SortedPairs(Sasha.Admins, true) do
				if not IsValid(v) then
					table.remove(Sasha.Admins, k)
				end
			end
			for k,v in SortedPairs(Sasha.SuperAdmins, true) do
				if not IsValid(v) then
					table.remove(Sasha.SuperAdmins, k)
				end
			end
				
			if v:IsPlayer() and v:GetObserverTarget() == Sasha.Ply then
				if not table.HasValue(Sasha.Spectators, v) then
					table.insert(Sasha.Spectators, v)
					Sasha.Message(v:Nick().." started spectating you.")
					if Sasha.Misc.Vars["Sounds"]:GetBool() then
						surface.PlaySound("vo/npc/female01/ohno.wav")
					end				
				end
			end
			for k,v in SortedPairs(Sasha.Spectators, true) do
				if IsValid(v) then
					if v:GetObserverTarget() != Sasha.Ply then
						table.remove(Sasha.Spectators, k)
					end
				else
					table.remove(Sasha.Spectators, k)
				end
			end
			
			if Sasha.TTT and Sasha.Misc.Vars["TraitorFinder"]:GetBool() then
				if GetRoundState() == 3 and v:IsWeapon() and type(v:GetOwner()) == "Player" and v.Buyer == nil and v.CanBuy and table.HasValue(v.CanBuy, 1) then
					local owner = v:GetOwner()
					if owner:GetRole() == 2 then
						v.Buyer = owner
					else
						Sasha.Message(owner:Nick().." bought a traitor weapon: "..v:GetClass())
						v.Buyer = owner
						table.insert(Sasha.Traitors, owner)
						if Sasha.Misc.Vars["Sounds"]:GetBool() then
							surface.PlaySound("weapons/shotgun/shotgun_cock.wav")
						end	
					end
				elseif GetRoundState() != 3 then
					table.Empty(Sasha.Traitors)
				end
			end
			
			if Sasha.Misc.Vars["Deaths"]:GetBool() and v:IsPlayer() then
				if v:Alive() then
					v.IsAlive = true
				elseif v.IsAlive then
					Sasha.Message(3, v:Nick().." just died.")
					v.IsAlive = false
					if Sasha.Misc.Vars["Sounds"]:GetBool() then
						surface.PlaySound("npc/combine_soldier/vo/onedown.wav")
					end	
				end				
			end
		end
		
		surface.SetFont("default")
		surface.SetTextColor(Color(255, 255, 255, 255))	
		local AdminWidest = 0
		local AdminTotalHeight = 0
		local AdminHeight = 20
		if Sasha.Misc.Vars["ShowAdmins"]:GetBool() then 
			for k,v in pairs(Sasha.SuperAdmins) do
				local W, H = surface.GetTextSize(v:Nick().." - Super Admin")
				if W > AdminWidest then
					AdminWidest = W
				end
				AdminTotalHeight = AdminTotalHeight + H
			end
			for k,v in pairs(Sasha.Admins) do
				local W, H = surface.GetTextSize(v:Nick().." - Admin")
				if W > AdminWidest then
					AdminWidest = W
				end
				AdminTotalHeight = AdminTotalHeight + H
			end
			draw.RoundedBox(8, ScrW() - AdminWidest - 30, 10, AdminWidest + 20, AdminTotalHeight + 20, Color(0, 0, 0, 150 ))
			for k,v in pairs(Sasha.SuperAdmins) do
				local text = v:Nick().." - Super Admin"
				local W, H = surface.GetTextSize(text)
				surface.SetTextPos(ScrW() - 20 - AdminWidest, AdminHeight)
				surface.DrawText(text)
				AdminHeight = AdminHeight + H
			end
			for k,v in pairs(Sasha.Admins) do
				local text = v:Nick().." - Admin"
				local W, H = surface.GetTextSize(text)
				surface.SetTextPos(ScrW() - 20 - AdminWidest, AdminHeight)
				surface.DrawText(text)
				AdminHeight = AdminHeight + H
			end
		end
		
		local SpecWidest = 0
		local SpecTotalHeight = 0
		local SpecHeight = AdminTotalHeight + 50
		if Sasha.Misc.Vars["ShowSpectators"]:GetBool() then
			for k,v in pairs(Sasha.Spectators) do
				local W, H = surface.GetTextSize(v:Nick())
				if W > SpecWidest then
					SpecWidest = W
				end
				SpecTotalHeight = SpecTotalHeight + H
			end
			draw.RoundedBox(8, ScrW() - SpecWidest - 30, 40 + AdminTotalHeight, SpecWidest + 20, SpecTotalHeight + 20, Color(0, 0, 0, 150 ))
			for k,v in pairs(Sasha.Spectators) do
				local text = v:Nick()
				local W, H = surface.GetTextSize(text)
				surface.SetTextPos(ScrW() - 20 - SpecWidest, SpecHeight)
				surface.DrawText(text)
				SpecHeight = SpecHeight + H
			end
		end
		
		if Sasha.Misc.Vars["Crosshair"]:GetBool() then
			local size = Sasha.Misc.Vars["CrosshairSize"]:GetInt()
			local MiddleScreen = {x = surface.ScreenWidth() / 2, y = surface.ScreenHeight() / 2}
			surface.SetDrawColor(Sasha.Style.Vars["Crosshair"].color)
			surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x - size, MiddleScreen.y)
			surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x, MiddleScreen.y - size)
			surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x + size, MiddleScreen.y)
			surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x, MiddleScreen.y + size)
		end
	end
end)

hook.Add("Think", Sasha.RandomName(math.random(10, 15)), function()
	if Sasha.Active:GetBool() then	
		if Sasha.Aimbot.Vars["Active"]:GetBool() and not (Sasha.Aimbot.Vars["PanicMode"]:GetBool() and #Sasha.Spectators > 0) then
			if not Sasha.Aimbot.Vars["AimOnKey"]:GetBool() or (Sasha.Aimbot.Vars["AimOnKey"]:GetBool() and Sasha.KeyPressed(Sasha.Aimbot.Vars["AimOnKey_Key"]:GetString())) then
				if Sasha.ValidTarget() then
					local BoneOrder = {}
					if Sasha.Aimbot.CurTarget.BoneToAimAt and Sasha.Aimbot.Vars["RandomBones"]:GetBool() then
						table.insert(BoneOrder, Sasha.Aimbot.CurTarget.BoneToAimAt)
						table.Add(BoneOrder, Sasha.GetRandomBones())
						table.Add(BoneOrder, Sasha.Bones)
					else
						if Sasha.Aimbot.Vars["RandomBones"]:GetBool() then
							table.Add(BoneOrder, Sasha.GetRandomBones())
							table.Add(BoneOrder, Sasha.Bones)
						else
							table.Add(BoneOrder, Sasha.Bones)
						end
					end
					for k = 1, #BoneOrder do 
						local v = BoneOrder[k]
						local bone = Sasha.Aimbot.CurTarget:LookupBone(v)
						if bone != nil then
							local pos, ang = Sasha.Aimbot.CurTarget:GetBonePosition(bone)
							if v == "ValveBiped.Bip01_Head1" then
								pos = pos + Vector(0, 0, 3) //Aiming a little higher for the head
							end
							local total, needed = 300, {300, 300}
							
							if Sasha.Aimbot.Vars["Prediction"]:GetBool() then
								local tarSpeed = Sasha.Aimbot.CurTarget:GetVelocity() * 0.013
								local plySpeed = Sasha.Ply:GetVelocity() * 0.013
								total, needed = Sasha.AngleTo(pos - plySpeed + tarSpeed)
							else
								total, needed = Sasha.AngleTo(pos)
							end
								
							if Sasha.SpotIsVisible(pos) and total < Sasha.Aimbot.Vars["MaxAngle"]:GetInt() then
								local myAngles = Sasha.Ply:GetAngles()								
								local NewAngles = Angle(myAngles.p + needed.p, myAngles.y + needed.y, 0)
								
								if Sasha.Aimbot.Vars["AntiSnap"]:GetBool() then
									local speed = Sasha.Aimbot.Vars["AntiSnapSpeed"]:GetInt()
									NewAngles = (Angle(math.Approach(myAngles.p, NewAngles.p, speed), math.Approach(myAngles.y, NewAngles.y, speed), 0))
								end
								
								Sasha.Ply:SetEyeAngles(NewAngles)
								Sasha.Aimbot.CurTarget.BoneToAimAt = BoneOrder[k]
								break
							end
						end
					end
				else
					Sasha.Aimbot.CurTarget = Sasha.GetTarget()
				end
			else
				Sasha.Aimbot.CurTarget = nil
			end
		end
		
		if Sasha.Misc.Vars["NoRecoil"]:GetBool() then
			if IsValid(Sasha.Ply:GetActiveWeapon()) then
				local weapon = Sasha.Ply:GetActiveWeapon()
				if weapon.Primary then
					weapon.OldRecoil = weapon.OldRecoil or weapon.Primary.Recoil or weapon.Recoil
					weapon.Primary.Recoil = 0
					weapon.Recoil = 0
				else
					weapon.OldRecoil = weapon.OldRecoil or weapon.Recoil
					weapon.Recoil = 0
				end
			end
		elseif IsValid(Sasha.Ply:GetActiveWeapon()) then
			local weapon = Sasha.Ply:GetActiveWeapon()
			if weapon.Primary then
				weapon.Primary.Recoil = weapon.OldRecoil or weapon.Primary.Recoil or weapon.Recoil
				weapon.Recoil = weapon.OldRecoil or weapon.Recoil or weapon.Primary.Recoil
			else
				weapon.Recoil = weapon.OldRecoil or weapon.Recoil
			end
		end
		
		if Sasha.DarkRP and Sasha.Misc.Vars["BuyHealth"]:GetBool() then
			if Sasha.Ply:Alive() and Sasha.Ply:Health() < Sasha.Misc.Vars["BuyHealth_Minimum"]:GetInt() then
				Sasha.Ply:ConCommand("say /buyhealth")
			end
		end
	end
end)

Sasha.Misc.NextReload = CurTime()
Sasha.Misc.ShootNext = true
hook.Add("CreateMove", Sasha.RandomName(math.random(10, 15)), function(cmd)
	if Sasha.Active:GetBool() then		
		local DontShoot = {"gmod_tool", "gmod_camera", "weapon_physgun", "weapon_physcannon"}
		if Sasha.Aimbot.Vars["AutoShoot"]:GetBool() and Sasha.Aimbot.Vars["Active"]:GetBool() and Sasha.Ply:GetEyeTrace().Entity == Sasha.Aimbot.CurTarget and IsValid(Sasha.Ply:GetActiveWeapon()) and not table.HasValue(DontShoot, Sasha.Ply:GetActiveWeapon():GetClass()) then
			cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)
		end
		
		if Sasha.Misc.Vars["BunnyHop"]:GetBool() and cmd:KeyDown(IN_JUMP) and Sasha.KeyPressed(Sasha.Misc.Vars["BunnyHop_Key"]:GetString()) then
			cmd:SetButtons(cmd:GetButtons() - IN_JUMP)
		end
		if Sasha.Misc.Vars["BunnyHop"]:GetBool() and Sasha.Ply:OnGround() and Sasha.KeyPressed(Sasha.Misc.Vars["BunnyHop_Key"]:GetString()) then
			cmd:SetButtons(cmd:GetButtons() + IN_JUMP)
		end
		
		local DontReload = {"gmod_tool", "gmod_camera", "weapon_physgun", "weapon_physcannon", "weapon_crowbar"}
		if Sasha.Misc.Vars["AutoReload"]:GetBool() and IsValid(Sasha.Ply:GetActiveWeapon()) and Sasha.Ply:GetActiveWeapon():Clip1() < 1 and not table.HasValue(DontReload, Sasha.Ply:GetActiveWeapon():GetClass()) and Sasha.Misc.NextReload < CurTime() then
			cmd:SetButtons(cmd:GetButtons() + IN_RELOAD)
		end
		
		if Sasha.Misc.Vars["AutoPistol"]:GetBool() and IsValid(Sasha.Ply:GetActiveWeapon()) then
			local weapon = Sasha.Ply:GetActiveWeapon()
			if weapon.Primary and type(weapon.Primary.Automatic) == "boolean" and not weapon.Primary.Automatic then
				if cmd:KeyDown(IN_ATTACK) then
					if Sasha.Misc.ShootNext then
						Sasha.Misc.ShootNext = false
					else
						cmd:SetButtons(cmd:GetButtons() - IN_ATTACK)
						Sasha.Misc.ShootNext = true
					end
				end					
			elseif type(weapon.Automatic) == "boolean" and not weapon.Automatic then
				if cmd:KeyDown(IN_ATTACK) then
					if Sasha.Misc.ShootNext then
						Sasha.Misc.ShootNext = false
					else
						cmd:SetButtons(cmd:GetButtons() - IN_ATTACK)
						Sasha.Misc.ShootNext = true
					end
				end
			end
		end
	end
end)

//Used to see if the player is typing in chat or not. Binds arent called when you're in chat.
Sasha.InChat = false
hook.Add("StartChat", Sasha.RandomName(math.random(10, 15)), function()
	Sasha.InChat = true
end)
hook.Add("FinishChat", Sasha.RandomName(math.random(10, 15)), function()
	Sasha.InChat = false
end) 

concommand.Add("Sasha_menu", function()
	//Im only using DColumnSheet because everyone used DPropertySheet. I just want to be different
	local main = vgui.Create("DFrame")
	main:SetSize(500,496)
	main:Center()
	main:SetTitle("")
	main:MakePopup()
	main:ShowCloseButton(false)
	main.Paint = function()
		draw.RoundedBox( 0, 0, 0, main:GetWide(), main:GetTall(), Color( 0, 0, 0, 150 ) )
	end
	
	local PanicButton = vgui.Create("DButton", main)
	PanicButton:SetSize(50, 20)
	PanicButton:SetPos(415, 3)
	local function Enable()
		PanicButton:SetText("Disable")
		PanicButton.DoClick = function()
			PanicButton:SetText("Enable")
			PanicButton.DoClick = Enable
			Sasha.Ply:ConCommand("Sasha_Active 0")
		end
		Sasha.Ply:ConCommand("Sasha_Active 1")
	end
	local function Disable()
		PanicButton:SetText("Enable")
		PanicButton.DoClick = function()
			PanicButton:SetText("Disable")
			PanicButton.DoClick = Disable
			Sasha.Ply:ConCommand("Sasha_Active 1")
		end
		Sasha.Ply:ConCommand("Sasha_Active 0")
	end
	if Sasha.Active:GetBool() then
		PanicButton:SetText("Disable")
		PanicButton.DoClick = Disable
	else
		PanicButton:SetText("Enable")
		PanicButton.DoClick = Enable
	end
	
	local CloseButton = vgui.Create("DButton", main)
	CloseButton:SetSize(30, 20)
	CloseButton:SetPos(465, 3)
	CloseButton:SetText("X")
	CloseButton.DoClick = function()
		main:Close()
	end
	
	local title = vgui.Create("DLabel", main)
	title:SetColor(Color(255, 255, 255, 255))
	title:SetFont("TitleFont")
	title:SetText("Sasha - "..Sasha.Version)
	title:SizeToContents()
	title:SetPos(main:GetWide() / 2 - title:GetWide() / 2,3)	
	
	ColumnSheet = vgui.Create("DColumnSheet",main)
	ColumnSheet:SetPos(5, 25)
	ColumnSheet:SetSize(500 ,465)
	
	local y = 40
	local function ToggleOption(name, parent, var)
		local Options = vgui.Create("DComboBox", parent)
		Options:SetSize(100, 20)
		Options:SetPos(parent:GetWide() * 0.75 - Options:GetWide() / 2, y)
		Options:AddChoice("Off", 0)
		Options:AddChoice("On", 1)
		Options.OnSelect = function(panel,index,value,data)
			Sasha.Ply:ConCommand(var.." "..data)
		end
		Options:SetText(Options:GetOptionText(GetConVar(var):GetInt() + 1))
		
		local text = vgui.Create("DLabel", parent)
		text:SetColor(Color(0, 0, 0, 255))
		text:SetFont("CatagoryText")
		text:SetText(name)
		text:SizeToContents()
		text:SetPos(parent:GetWide() / 4 - text:GetWide() / 2, y + Options:GetTall() / 2 - text:GetTall() / 2)
		
		y = y + Options:GetTall() + 20
	end
	
	local function SetKeyOption(name, parent, var)		
		local Options = vgui.Create("DButton", parent)
		Options:SetSize(100, 20)
		Options:SetPos(parent:GetWide() * 0.75 - Options:GetWide() / 2, y)
		Options:SetText(GetConVar(var):GetString())
		Options.DoClick = function()
			Options:SetText("Press a key...")
			Options.Think = function()
				for k = 107, 111 do
					if input.IsMouseDown(k) then
						Sasha.Ply:ConCommand(var.." "..Sasha.MouseKeys[k])
						Options:SetText(Sasha.MouseKeys[k])
						Options.Think = nil
					end
				end
				
				for k = 0, 130 do
					if input.IsKeyDown(k) then
						Sasha.Ply:ConCommand(var.." "..Sasha.Keys[k])
						Options:SetText(Sasha.Keys[k])
						Options.Think = nil
					end
				end 
			end
		end
		
		local text = vgui.Create("DLabel", parent)
		text:SetColor(Color(0, 0, 0, 255))
		text:SetFont("CatagoryText")
		text:SetText(name)
		text:SizeToContents()
		text:SetPos(parent:GetWide() / 4 - text:GetWide() / 2, y + Options:GetTall() / 2 - text:GetTall() / 2)
		
		y = y + Options:GetTall() + 20
	end
	
	local function SetNumberOption(name, parent, var, min, max, decimals)		
		local Options = vgui.Create("DNumberWang", parent)
		Options:SetSize(100, 20)
		Options:SetPos(parent:GetWide() * 0.75 - Options:GetWide() / 2, y)
		Options:SetMin(min)
		Options:SetMax(max)
		Options:SetDecimals(decimals)
		Options:SetConVar(var)
		
		local text = vgui.Create("DLabel", parent)
		text:SetColor(Color(0, 0, 0, 255))
		text:SetFont("CatagoryText")
		text:SetText(name)
		text:SizeToContents()
		text:SetPos(parent:GetWide() / 4 - text:GetWide() / 2, y + Options:GetTall() / 2 - text:GetTall() / 2)
		
		y = y + Options:GetTall() + 20
	end
	
	local function MultiOption(name, parent, var, tab)		
		local Options = vgui.Create("DComboBox", parent)
		Options:SetSize(100, 20)
		Options:SetPos(parent:GetWide() * 0.75 - Options:GetWide() / 2, y)
		for i = 1, #tab do
			Options:AddChoice(tab[i])
		end
		Options.OnSelect = function(panel,index,value,data)
			Sasha.Ply:ConCommand(var.." "..value)
		end
		Options:SetText(GetConVar(var):GetString())
		
		local text = vgui.Create("DLabel", parent)
		text:SetColor(Color(0, 0, 0, 255))
		text:SetFont("CatagoryText")
		text:SetText(name)
		text:SizeToContents()
		text:SetPos(parent:GetWide() / 4 - text:GetWide() / 2, y + Options:GetTall() / 2 - text:GetTall() / 2)
		
		y = y + Options:GetTall() + 20
	end
	
	//Starting the Aimbot panel
	local Aimbot = vgui.Create("DPanel")
	Aimbot:SetSize(379, 465)
	Aimbot.Paint = function()
		draw.RoundedBox( 0, 0, 0, Aimbot:GetWide(), Aimbot:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", Aimbot)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Aimbot")
	title:SizeToContents()
	title:SetPos(Aimbot:GetWide() / 2 - title:GetWide() / 2, 0)
	
	ToggleOption("Active", Aimbot, "Sasha_Aimbot_Active")
	ToggleOption("Random Bones", Aimbot, "Sasha_Aimbot_RandomBones")
	MultiOption("Preferance", Aimbot, "Sasha_Aimbot_Preferance", {"Distance", "Angle"})	
	ToggleOption("Attack Players", Aimbot, "Sasha_Aimbot_AttackPlayers")
	ToggleOption("Attack NPCs", Aimbot, "Sasha_Aimbot_AttackNPCs")
	ToggleOption("Prediction", Aimbot, "Sasha_Aimbot_Prediction")
	ToggleOption("Aim On Key", Aimbot, "Sasha_Aimbot_AimOnKey")
	SetKeyOption("Key", Aimbot, "Sasha_Aimbot_AimOnKey_Key")
	ToggleOption("Anti Snap", Aimbot, "Sasha_Aimbot_AntiSnap")
	SetNumberOption("Anti Snap Speed", Aimbot, "Sasha_Aimbot_AntiSnapSpeed", 1, 5, 2)
	SetNumberOption("Max Angle", Aimbot, "Sasha_Aimbot_MaxAngle", 0, 270, 0)
	ToggleOption("Auto Shoot", Aimbot, "Sasha_Aimbot_AutoShoot")
	ToggleOption("Panic Mode", Aimbot, "Sasha_Aimbot_PanicMode")
	ToggleOption("Ignore Team", Aimbot, "Sasha_Aimbot_IgnoreTeam")
	
	if y > 465 then
		Aimbot:SetTall(y)
	end
	
	//This is the best way i can find to add a scrollbar to the menu...
	AimbotList = vgui.Create( "DPanelList" )
	AimbotList:SetSize(379, 465)
	AimbotList:SetSpacing(0)
	AimbotList:EnableHorizontal(false)
	AimbotList:EnableVerticalScrollbar(true)
	AimbotList:AddItem(Aimbot)
	
	ColumnSheet:AddSheet("Aimbot", AimbotList, "icon16/application_xp_terminal.png")
	
	//Starting the Friends panel
	local FriendsPanel = vgui.Create("DPanel")
	FriendsPanel:SetSize(379, 465)
	FriendsPanel.Paint = function()
		draw.RoundedBox( 0, 0, 0, FriendsPanel:GetWide(), FriendsPanel:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", FriendsPanel)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Friends")
	title:SizeToContents()
	title:SetPos(FriendsPanel:GetWide() / 2 - title:GetWide() / 2, 3)
	
	local Friends = {}
	local Enemies = {}
	
	local players = player.GetAll()
	for k = 1, #players do
		local v = players[k]
		if v != Sasha.Ply then
			if table.HasValue(Sasha.Friends.List, v:SteamID()) then
				table.insert(Friends, v)
			else
				table.insert(Enemies, v)
			end
		end
	end
	
	y = 40
	local EnemiesList = vgui.Create("DListView", FriendsPanel) //Need this up here so FriendsList can reference it.	
	local FriendsList = vgui.Create("DListView", FriendsPanel)
	FriendsList:SetSize(150, 200)
	FriendsList:SetPos(FriendsPanel:GetWide() * 0.25 - FriendsList:GetWide() / 2, y)
	FriendsList:SetMultiSelect(false)
	FriendsList:AddColumn("Friends")
	for k = 1, #Friends do
		FriendsList:AddLine(Friends[k]:Nick())
	end
	FriendsList.DoDoubleClick = function(panel, index, line)
		table.insert(Enemies, Friends[index])
		table.remove(Friends, index)
		
		FriendsList:Clear()
		EnemiesList:Clear()
		for k = 1, #Friends do
			FriendsList:AddLine(Friends[k]:Nick())
		end
		for k = 1, #Enemies do
			EnemiesList:AddLine(Enemies[k]:Nick())
		end
		
		Sasha.Friends.List = {}
		for k = 1, #Friends do
			table.insert(Sasha.Friends.List, Friends[k]:SteamID())
		end
		//Sasha.SaveData()
	end
	
	EnemiesList:SetSize(150, 200)
	EnemiesList:SetPos(FriendsPanel:GetWide() * 0.75 - EnemiesList:GetWide() / 2, y)
	EnemiesList:SetMultiSelect(false)
	EnemiesList:AddColumn("Enemies")
	for k = 1, #Enemies do
		EnemiesList:AddLine(Enemies[k]:Nick())
	end
	EnemiesList.DoDoubleClick = function(panel, index, line)
		table.insert(Friends, Enemies[index])
		table.remove(Enemies, index)
		
		FriendsList:Clear()
		EnemiesList:Clear()
		for k = 1, #Friends do
			FriendsList:AddLine(Friends[k]:Nick())
		end
		for k = 1, #Enemies do
			EnemiesList:AddLine(Enemies[k]:Nick())
		end
		
		Sasha.Friends.List = {}
		for k = 1, #Friends do
			table.insert(Sasha.Friends.List, Friends[k]:SteamID())
		end
		//Sasha.SaveData()
	end
	
	y = y + EnemiesList:GetTall() + 20
	ToggleOption("Use", FriendsPanel, "Sasha_Friends_Active")
	ToggleOption("Reverse", FriendsPanel, "Sasha_Friends_Reverse")
	
	if y > 465 then
		FriendsPanel:SetTall(y)
	end
	
	local FriendsPanelList = vgui.Create( "DPanelList" )
	FriendsPanelList:SetSize(379, 465)
	FriendsPanelList:SetSpacing(0)
	FriendsPanelList:EnableHorizontal(false)
	FriendsPanelList:EnableVerticalScrollbar(true)
	FriendsPanelList:AddItem(FriendsPanel)
	
	ColumnSheet:AddSheet("Friends", FriendsPanelList, "icon16/group.png")

	//Starting the ESP panel
	local ESP = vgui.Create("DPanel")
	ESP:SetSize(379, 465)
	ESP.Paint = function()
		draw.RoundedBox( 0, 0, 0, ESP:GetWide(), ESP:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", ESP)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("ESP")
	title:SizeToContents()
	title:SetPos(ESP:GetWide() / 2 - title:GetWide() / 2, 3)
	
	y = 40
	ToggleOption("Active", ESP, "Sasha_ESP_Active")
	ToggleOption("Player Info", ESP, "Sasha_ESP_Players")
	ToggleOption("NPC Info", ESP, "Sasha_ESP_NPCs")
	MultiOption("Name", ESP, "Sasha_ESP_Name", {"Off", "Above", "Below"})	
	MultiOption("Weapon", ESP, "Sasha_ESP_Weapons", {"Off", "Above", "Below"})	
	MultiOption("Health", ESP, "Sasha_ESP_Health", {"Off", "Above", "Below"})	
	MultiOption("Distance", ESP, "Sasha_ESP_Distance", {"Off", "Above", "Below"})
	MultiOption("Show Traitors", ESP, "Sasha_ESP_ShowTraitors", {"Off", "Above", "Below"})
	ToggleOption("Bounding Box", ESP, "Sasha_ESP_Box")
	ToggleOption("Body Info", ESP, "Sasha_ESP_Bodies")
	ToggleOption("2D Radar", ESP, "Sasha_ESP_Radar")
	SetNumberOption("Radar Scale", ESP, "Sasha_ESP_RadarScale", 1, 100, 0)
	SetNumberOption("Max Distance", ESP, "Sasha_ESP_MaxDistance", 0, 8000, 0)
	ToggleOption("Team Based", ESP, "Sasha_ESP_TeamBased")
	
	if y > 465 then
		ESP:SetTall(y)
	end
	
	ESPList = vgui.Create( "DPanelList" )
	ESPList:SetSize(379, 465)
	ESPList:SetSpacing(0)
	ESPList:EnableHorizontal(false)
	ESPList:EnableVerticalScrollbar(true)
	ESPList:AddItem(ESP)
	
	ColumnSheet:AddSheet("ESP", ESPList, "icon16/pencil.png")
	
	//Starting the Chams panel
	local Chams = vgui.Create("DPanel")
	Chams:SetSize(379, 465)
	Chams.Paint = function()
		draw.RoundedBox( 0, 0, 0, Chams:GetWide(), Chams:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", Chams)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Chams")
	title:SizeToContents()
	title:SetPos(Chams:GetWide() / 2 - title:GetWide() / 2, 3)
	
	y = 40
	ToggleOption("Active", Chams, "Sasha_Chams_Active")
	ToggleOption("Draw Players", Chams, "Sasha_Chams_Players")
	ToggleOption("Draw NPCs", Chams, "Sasha_Chams_NPCs")
	ToggleOption("Draw Weapons", Chams, "Sasha_Chams_Weapons")
	ToggleOption("Team Based", Chams, "Sasha_Chams_TeamBased")
	SetNumberOption("Max Distance", Chams, "Sasha_Chams_MaxDistance", 0, 8000, 0)
	
	if y > 465 then
		Chams:SetTall(y)
	end
	
	ChamsList = vgui.Create( "DPanelList" )
	ChamsList:SetSize(379, 465)
	ChamsList:SetSpacing(0)
	ChamsList:EnableHorizontal(false)
	ChamsList:EnableVerticalScrollbar(true)
	ChamsList:AddItem(Chams)
	
	ColumnSheet:AddSheet("Chams", ChamsList, "icon16/eye.png")
	
	//Starting the Finder panel
	local Finder = vgui.Create("DPanel")
	Finder:SetSize(379, 465)
	Finder.Paint = function()
		draw.RoundedBox( 0, 0, 0, Finder:GetWide(), Finder:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", Finder)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Entity Finder")
	title:SizeToContents()
	title:SetPos(Finder:GetWide() / 2 - title:GetWide() / 2, 3)
	
	local ToShow = {}
	local Others = {}
	
	local All = ents.GetAll()
	for k = 1, #All do
		local v = All[k]
		if table.HasValue(Sasha.Entities.List, v:GetClass()) then
			if not table.HasValue(ToShow, v:GetClass()) then
				table.insert(ToShow, v:GetClass())
			end
		elseif not table.HasValue(Others, v:GetClass()) then
			table.insert(Others, v:GetClass())
		end
	end
	
	y = 40
	local IgnoreList = vgui.Create("DListView", Finder) //Need this up here so ToShowList can reference it.	
	local ToShowList = vgui.Create("DListView", Finder)
	ToShowList:SetSize(150, 200)
	ToShowList:SetPos(Finder:GetWide() * 0.25 - ToShowList:GetWide() / 2, y)
	ToShowList:SetMultiSelect(false)
	ToShowList:AddColumn("To Show")
	for k = 1, #ToShow do
		ToShowList:AddLine(ToShow[k])
	end
	ToShowList.DoDoubleClick = function(panel, index, line)
		table.insert(Others, ToShow[index])
		table.remove(ToShow, index)
		
		ToShowList:Clear()
		IgnoreList:Clear()
		for k = 1, #ToShow do
			ToShowList:AddLine(ToShow[k])
		end
		for k = 1, #Others do
			IgnoreList:AddLine(Others[k])
		end
		
		Sasha.Entities.List = {}
		for k = 1, #ToShow do
			table.insert(Sasha.Entities.List, ToShow[k])
		end
		//Sasha.SaveData()
	end
	
	IgnoreList:SetSize(150, 200)
	IgnoreList:SetPos(Finder:GetWide() * 0.75 - IgnoreList:GetWide() / 2, y)
	IgnoreList:SetMultiSelect(false)
	IgnoreList:AddColumn("Others")
	for k = 1, #Others do
		IgnoreList:AddLine(Others[k])
	end
	IgnoreList.DoDoubleClick = function(panel, index, line)
		table.insert(ToShow, Others[index])
		table.remove(Others, index)
		
		ToShowList:Clear()
		IgnoreList:Clear()
		for k = 1, #ToShow do
			ToShowList:AddLine(ToShow[k])
		end
		for k = 1, #Others do
			IgnoreList:AddLine(Others[k])
		end
		
		Sasha.Entities.List = {}
		for k = 1, #ToShow do
			table.insert(Sasha.Entities.List, ToShow[k])
		end
		//Sasha.SaveData()
	end
	
	y = y + IgnoreList:GetTall() + 20
	ToggleOption("Active", Finder, "Sasha_Entities_Active")
	
	if y > 465 then
		Finder:SetTall(y)
	end
	
	local FinderList = vgui.Create( "DPanelList" )
	FinderList:SetSize(379, 465)
	FinderList:SetSpacing(0)
	FinderList:EnableHorizontal(false)
	FinderList:EnableVerticalScrollbar(true)
	FinderList:AddItem(Finder)
	
	ColumnSheet:AddSheet("Finder", FinderList, "icon16/magnifier.png")
	
	//Starting the Misc panel
	local Misc = vgui.Create("DPanel")
	Misc:SetSize(379, 465)
	Misc.Paint = function()
		draw.RoundedBox( 0, 0, 0, Misc:GetWide(), Misc:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", Misc)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Misc")
	title:SizeToContents()
	title:SetPos(Misc:GetWide() / 2 - title:GetWide() / 2, 3)
	
	y = 40
	ToggleOption("Show Admins", Misc, "Sasha_Misc_ShowAdmins")
	ToggleOption("Crosshair", Misc, "Sasha_Misc_Cross")
	SetNumberOption("Corsshair Size", Misc, "Sasha_Misc_CrossSize", 0, 1000, 0)
	ToggleOption("No Recoil", Misc, "Sasha_Misc_NoRecoil")
	ToggleOption("Spectators", Misc, "Sasha_Misc_ShowSpectators")
	ToggleOption("Auto Reload", Misc, "Sasha_Misc_AutoReload")
	ToggleOption("Bunny Hop", Misc, "Sasha_Misc_BunnyHop")
	SetKeyOption("Key", Misc, "Sasha_Misc_BunnyHop_Key")
	ToggleOption("Auto Pistol", Misc, "Sasha_Misc_AutoPistol")
	ToggleOption("Buy Health", Misc, "Sasha_Misc_BuyHealth")
	SetNumberOption("Minimum", Misc, "Sasha_Misc_BuyHealth_Minimum", 0, 100, 0)
	ToggleOption("Traitor Finder", Misc, "Sasha_Misc_TraitorFinder")
	ToggleOption("Show Deaths", Misc, "Sasha_Misc_Deaths")
	ToggleOption("Sounds", Misc, "Sasha_Misc_Sounds")

	if y > 465 then
		Misc:SetTall(y)
	end
	
	MiscList = vgui.Create( "DPanelList" )
	MiscList:SetSize(379, 465)
	MiscList:SetSpacing(0)
	MiscList:EnableHorizontal(false)
	MiscList:EnableVerticalScrollbar(true)
	MiscList:AddItem(Misc)

	ColumnSheet:AddSheet("Misc", MiscList, "icon16/package.png")
	
	local function ColorOption(name, parent, tab)
		local Options = vgui.Create("DColorMixer", parent)
		Options:SetSize(150, 100)
		Options:SetPos(parent:GetWide() * 0.75 - Options:GetWide() / 2, y)
		Options:SetColor(tab.color)//Sasha.GetColorFromString(GetConVar(var):GetString()))
		Options:SetWangs(false)
		Options:SetPalette(false)
		Options.ValueChanged = function(panel, color) 
			Sasha.Ply:ConCommand(tab.var:GetName().." ".."Color("..color.r..","..color.g..","..color.b..","..color.a..")")
			tab.color = Sasha.GetColorFromString(tab.var:GetString())
		end
		
		local text = vgui.Create("DLabel", parent)
		text:SetColor(Color(0, 0, 0, 255))
		text:SetFont("CatagoryText")
		text:SetText(name)
		text:SizeToContents()
		text:SetPos(parent:GetWide() / 4 - text:GetWide() / 2, y + Options:GetTall() / 2 - text:GetTall() / 2)
		
		y = y + Options:GetTall() + 10
	end
	//Starting the Style panel
	local Style = vgui.Create("DPanel")
	Style:SetSize(379, 465)
	Style.Paint = function()
		draw.RoundedBox( 0, 0, 0, Style:GetWide(), Style:GetTall(), Color( 240, 240, 240, 255 ) )
	end
	
	local title = vgui.Create("DLabel", Style)
	title:SetColor(Color(0, 0, 0, 255))
	title:SetFont("CatagoryHeader")
	title:SetText("Style")
	title:SizeToContents()
	title:SetPos(Style:GetWide() / 2 - title:GetWide() / 2, 3)
	
	y = 50
	ColorOption("Bounding Box", Style, Sasha.Style.Vars["BoundingBox"])
	ColorOption("ESP Text", Style, Sasha.Style.Vars["ESPText"])
	ColorOption("Crosshair", Style, Sasha.Style.Vars["Crosshair"])
	ColorOption("TTT Body Text", Style, Sasha.Style.Vars["BodyText"])
	ColorOption("Chams", Style, Sasha.Style.Vars["Chams"])
	ColorOption("TTT Body Chams", Style, Sasha.Style.Vars["BodyChams"])
	
	if y > 465 then
		Style:SetTall(y)
	end
	
	StyleList = vgui.Create( "DPanelList" )
	StyleList:SetSize(379, 465)
	StyleList:SetSpacing(0)
	StyleList:EnableHorizontal(false)
	StyleList:EnableVerticalScrollbar(true)
	StyleList:AddItem(Style)
	
	ColumnSheet:AddSheet("Style", StyleList, "icon16/color_wheel.png")
end)


//Just some fonts
surface.CreateFont("TitleFont", {font = "Arial", size = 20})
surface.CreateFont("CatagoryHeader", {font = "CloseCaption_Normal", size = 34})
surface.CreateFont("CatagoryText", {font = "CloseCaption_Normal", size = 28})
surface.CreateFont("ESPFont", {font = "CloseCaption_Normal", weight = 1000, size = 15})

--[[ 
	DPropertySheet - Slightly edited so it looks good.
--]]
local PANEL = {}
AccessorFunc( PANEL, "ActiveButton", "ActiveButton" )

--[[---------------------------------------------------------
Name: Init
-----------------------------------------------------------]]
function PANEL:Init()
	self.Navigation = vgui.Create( "DScrollPanel", self )
	self.Navigation:Dock( LEFT )
	self.Navigation:SetWidth( 100 )
	self.Navigation:DockMargin( 0, 0, 10, 0 )

	self.Content = vgui.Create( "Panel", self )
	self.Content:Dock( FILL )

	self.Items = {}
end

function PANEL:UseButtonOnlyStyle()
	self.ButtonOnly = true
end

--[[---------------------------------------------------------
Name: AddSheet
-----------------------------------------------------------]]
function PANEL:AddSheet( label, panel, material )
	if ( !IsValid( panel ) ) then return end

	local Sheet = {}

	if ( self.ButtonOnly ) then
		Sheet.Button = vgui.Create( "DImageButton", self.Navigation )
	else
		Sheet.Button = vgui.Create( "DButton", self.Navigation )
	end
	Sheet.Button:SetImage( material )
	Sheet.Button.Target = panel
	Sheet.Button:Dock( TOP )
	Sheet.Button:SetText( label )
	Sheet.Button:DockMargin( 0, 0, 0, 5 )

	Sheet.Button.DoClick = function ()
		self:SetActiveButton( Sheet.Button )
	end

	Sheet.Panel = panel
	Sheet.Panel:SetParent( self.Content )
	Sheet.Panel:SetVisible( false )

	if ( self.ButtonOnly ) then
		Sheet.Button:SizeToContents()
		Sheet.Button:SetColor( Color( 150, 150, 150, 255 ) )
	end

	table.insert( self.Items, Sheet )

	if ( !IsValid( self.ActiveButton ) ) then
		self:SetActiveButton( Sheet.Button )
	end
end

--[[---------------------------------------------------------
Name: SetActiveTab
-----------------------------------------------------------]]
function PANEL:SetActiveButton( active )
	if ( self.ActiveButton == active ) then return end

	if ( self.ActiveButton && self.ActiveButton.Target ) then	
		self.ActiveButton.Target:SetVisible( false )
		self.ActiveButton:SetSelected( false )
		self.ActiveButton:SetColor( Color( 0, 0, 0, 255 ) )
	end
	self.ActiveButton = active
	active.Target:SetVisible( true )
	active:SetSelected( true )
	active:SetColor( Color( 150, 150, 150, 255 ) )

	self.Content:InvalidateLayout()
end

derma.DefineControl( "DColumnSheet", "", PANEL, "Panel" )

Sasha.Message("Hack sucefully loaded, happy hacking from Steavix!")