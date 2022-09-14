--[[

Angry Aryan Co.

Made By

Rootie Patootie, Icarusfeather

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

 

local slavermenu = {}

slavermenu.Active = CreateClientConVar("slavermenu_Active", 1, true, false)

slavermenu.Version = "0.0.2"

slavermenu.Ply = LocalPlayer()

slavermenu.TTT = (GAMEMODE and GAMEMODE.Name and string.find(GAMEMODE.Name, "Terror") and true) or false

if slavermenu.TTT then slavermenu.TTTCORPSE = CORPSE end

slavermenu.DarkRP = (GAMEMODE and GAMEMODE.Name and string.find(GAMEMODE.Name, "DarkRP") and true) or false

 

//Converts a string of a color (ex. "Color(255, 255, 255, 255)") into an actual color, and returns the color.

slavermenu.GetColorFromString = function(words)

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

 

slavermenu.Chars = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

slavermenu.RandomName = function(amount)

    local toReturn = ""

    local amount = amount or 10

    for i = 1, amount do

        if math.random(0, 1) == 0 then

            toReturn = toReturn..string.lower(table.Random(slavermenu.Chars))

        else

            toReturn = toReturn..table.Random(slavermenu.Chars)

        end

    end

    return toReturn

end

 

slavermenu.Message = function(...)

    chat.AddText(Color(50, 255, 100), "[slavermenu] ", ...)

end

 

slavermenu.Aimbot = {}

slavermenu.Aimbot.CurTarget = nil

slavermenu.Aimbot.Vars = {}

slavermenu.Aimbot.Vars["Active"] = CreateClientConVar("slavermenu_Aimbot_Active", 0, true, false)

slavermenu.Aimbot.Vars["RandomBones"] = CreateClientConVar("slavermenu_Aimbot_RandomBones", 0, true, false)

slavermenu.Aimbot.Vars["AttackNPCs"] = CreateClientConVar("slavermenu_Aimbot_AttackNPCs", 0, true, false)

slavermenu.Aimbot.Vars["AttackPlayers"] = CreateClientConVar("slavermenu_Aimbot_AttackPlayers", 0, true, false)

slavermenu.Aimbot.Vars["Prediction"] = CreateClientConVar("slavermenu_Aimbot_Prediction", 0, true, false)

slavermenu.Aimbot.Vars["AimOnKey"] = CreateClientConVar("slavermenu_Aimbot_AimOnKey", 0, true, false)

slavermenu.Aimbot.Vars["AimOnKey_Key"] = CreateClientConVar("slavermenu_Aimbot_AimOnKey_Key", "MOUSE_LEFT", true, false)

slavermenu.Aimbot.Vars["MaxAngle"] = CreateClientConVar("slavermenu_Aimbot_MaxAngle", 180, true, false)

slavermenu.Aimbot.Vars["Preferance"] = CreateClientConVar("slavermenu_Aimbot_Preferance", "Distance", true, false)

slavermenu.Aimbot.Vars["AntiSnap"] = CreateClientConVar("slavermenu_Aimbot_AntiSnap", 0, true, false)

slavermenu.Aimbot.Vars["AntiSnapSpeed"] = CreateClientConVar("slavermenu_Aimbot_AntiSnapSpeed", 4, true, false)

slavermenu.Aimbot.Vars["AutoShoot"] = CreateClientConVar("slavermenu_Aimbot_AutoShoot", 0, true, false)

slavermenu.Aimbot.Vars["PanicMode"] = CreateClientConVar("slavermenu_Aimbot_PanicMode", 0, true, false)

slavermenu.Aimbot.Vars["IgnoreTeam"] = CreateClientConVar("slavermenu_Aimbot_IgnoreTeam", 0, true, false)

 

slavermenu.Friends = {}

slavermenu.Friends.List = {} //The steamIDs of everyone on your friends list

slavermenu.Friends.Vars = {}

slavermenu.Friends.Vars["Active"] = CreateClientConVar("slavermenu_Friends_Active", 0, true, false)

slavermenu.Friends.Vars["Reverse"] = CreateClientConVar("slavermenu_Friends_Reverse", 0, true, false)

 

slavermenu.ESP = {}

slavermenu.ESP.Vars = {}

slavermenu.ESP.Vars["Active"] = CreateClientConVar("slavermenu_ESP_Active", 0, true, false)

slavermenu.ESP.Vars["Players"] = CreateClientConVar("slavermenu_ESP_Players", 0, true, false)

slavermenu.ESP.Vars["NPCs"] = CreateClientConVar("slavermenu_ESP_NPCs", 0, true, false)

slavermenu.ESP.Vars["Name"] = CreateClientConVar("slavermenu_ESP_Name", "Off", true, false)

slavermenu.ESP.Vars["Weapons"] = CreateClientConVar("slavermenu_ESP_Weapons", "Off", true, false)

slavermenu.ESP.Vars["Distance"] = CreateClientConVar("slavermenu_ESP_Distance", "Off", true, false)

slavermenu.ESP.Vars["Health"] = CreateClientConVar("slavermenu_ESP_Health", "Off", true, false)

slavermenu.ESP.Vars["MaxDistance"] = CreateClientConVar("slavermenu_ESP_MaxDistance", 0, true, false)

slavermenu.ESP.Vars["Box"] = CreateClientConVar("slavermenu_ESP_Box", 0, true, false)

slavermenu.ESP.Vars["ShowTraitors"] = CreateClientConVar("slavermenu_ESP_ShowTraitors", "Off", true, false)

slavermenu.ESP.Vars["Bodies"] = CreateClientConVar("slavermenu_ESP_Bodies", 0, true, false)

slavermenu.ESP.Vars["Radar"] = CreateClientConVar("slavermenu_ESP_Radar", 0, true, false)

slavermenu.ESP.Vars["RadarScale"] = CreateClientConVar("slavermenu_ESP_RadarScale", 20, true, false)

slavermenu.ESP.Vars["TeamBased"] = CreateClientConVar("slavermenu_ESP_TeamBased", 0, true, false)

 

slavermenu.Chams = {}

slavermenu.Chams.Mat = CreateMaterial(slavermenu.RandomName(math.random(10,15)), "VertexLitGeneric", { ["$basetexture"] = "models/debug/debugwhite", ["$model"] = 1, ["$ignorez"] = 1 })

slavermenu.Chams.Vars = {}

slavermenu.Chams.Vars["Active"] = CreateClientConVar("slavermenu_Chams_Active", 0, true, false)

slavermenu.Chams.Vars["Players"] = CreateClientConVar("slavermenu_Chams_Players", 0, true, false)

slavermenu.Chams.Vars["NPCs"] = CreateClientConVar("slavermenu_Chams_NPCs", 0, true, false)

slavermenu.Chams.Vars["Weapons"] = CreateClientConVar("slavermenu_Chams_Weapons", 0, true, false)

slavermenu.Chams.Vars["MaxDistance"] = CreateClientConVar("slavermenu_Chams_MaxDistance", 0, true, false)

slavermenu.Chams.Vars["Bodies"] = CreateClientConVar("slavermenu_Chams_Bodies", 0, true, false)

slavermenu.Chams.Vars["TeamBased"] = CreateClientConVar("slavermenu_Chams_TeamBased", 0, true, false)

 

slavermenu.Entities = {}

slavermenu.Entities.List = {} //The class namse of all the entities

slavermenu.Entities.Vars = {}

slavermenu.Entities.Vars["Active"] = CreateClientConVar("slavermenu_Entities_Active", 0, true, false)

 

slavermenu.Misc = {}

slavermenu.Misc.Vars = {}

slavermenu.Misc.Vars["ShowAdmins"] = CreateClientConVar("slavermenu_Misc_ShowAdmins", 0, true, false)

slavermenu.Misc.Vars["Crosshair"] = CreateClientConVar("slavermenu_Misc_Cross", 0, true, false)

slavermenu.Misc.Vars["CrosshairSize"] = CreateClientConVar("slavermenu_Misc_CrossSize", 50, true, false)

slavermenu.Misc.Vars["NoRecoil"] = CreateClientConVar("slavermenu_Misc_NoRecoil", 0, true, false)

slavermenu.Misc.Vars["ShowSpectators"] = CreateClientConVar("slavermenu_Misc_ShowSpectators", 0, true, false)

slavermenu.Misc.Vars["BunnyHop"] = CreateClientConVar("slavermenu_Misc_BunnyHop", 0, true, false)

slavermenu.Misc.Vars["BunnyHop_Key"] = CreateClientConVar("slavermenu_Misc_BunnyHop_Key", "KEY_SPACE", true, false)

slavermenu.Misc.Vars["AutoReload"] = CreateClientConVar("slavermenu_Misc_AutoReload", 0, true, false)

slavermenu.Misc.Vars["AutoPistol"] = CreateClientConVar("slavermenu_Misc_AutoPistol", 0, true, false)

slavermenu.Misc.Vars["BuyHealth"] = CreateClientConVar("slavermenu_Misc_BuyHealth", 0, true, false)

slavermenu.Misc.Vars["BuyHealth_Minimum"] = CreateClientConVar("slavermenu_Misc_BuyHealth_Minimum", 80, true, false)

slavermenu.Misc.Vars["TraitorFinder"] = CreateClientConVar("slavermenu_Misc_TraitorFinder", 0, true, false)

slavermenu.Misc.Vars["Deaths"] = CreateClientConVar("slavermenu_Misc_Deaths", 0, true, false)

slavermenu.Misc.Vars["Sounds"] = CreateClientConVar("slavermenu_Misc_Sounds", 0, true, false)

 

slavermenu.Style = {}

slavermenu.Style.Vars = {}

slavermenu.Style.Vars["BoundingBox"] = {}

slavermenu.Style.Vars["BoundingBox"].var = CreateClientConVar("slavermenu_Style_BoundingBox", "Color(255, 0, 0, 255)", true, false)

slavermenu.Style.Vars["BoundingBox"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["BoundingBox"].var:GetString())

slavermenu.Style.Vars["ESPText"] = {}

slavermenu.Style.Vars["ESPText"].var = CreateClientConVar("slavermenu_Style_ESPText", "Color(255, 255, 255, 255)", true, false)

slavermenu.Style.Vars["ESPText"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["ESPText"].var:GetString())

slavermenu.Style.Vars["Crosshair"] = {}

slavermenu.Style.Vars["Crosshair"].var = CreateClientConVar("slavermenu_Style_Cross", "Color(255, 255, 255, 255)", true, false)

slavermenu.Style.Vars["Crosshair"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["Crosshair"].var:GetString())

slavermenu.Style.Vars["BodyText"] = {}

slavermenu.Style.Vars["BodyText"].var = CreateClientConVar("slavermenu_Style_BodyText", "Color(255, 255, 255, 255)", true, false)

slavermenu.Style.Vars["BodyText"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["BodyText"].var:GetString())

slavermenu.Style.Vars["Chams"] = {}

slavermenu.Style.Vars["Chams"].var = CreateClientConVar("slavermenu_Style_Chams", "Color(0, 255, 0, 255)", true, false)

slavermenu.Style.Vars["Chams"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["Chams"].var:GetString())

slavermenu.Style.Vars["BodyChams"] = {}

slavermenu.Style.Vars["BodyChams"].var = CreateClientConVar("slavermenu_Style_BodyChams", "Color(0, 255, 0, 255)", true, false)

slavermenu.Style.Vars["BodyChams"].color = slavermenu.GetColorFromString(slavermenu.Style.Vars["BodyChams"].var:GetString())

 

//This loads our friends list and custom entities list.

/*slavermenu.SavedData = CreateClientConVar("slavermenu_SaveData", slavermenu.RandomName(math.random(10, 15)), true, false)

if file.Exists(slavermenu.SavedData:GetString()..".txt", "DATA") then

    local info = string.Explode("\n", file.Read(slavermenu.SavedData:GetString()..".txt", "DATA"))

    if type(info) == "table" and info[1] and info[2] then

        slavermenu.Friends.List = util.JSONToTable(info[1])

        slavermenu.Entities.List = util.JSONToTable(info[2])

    end

end

 

slavermenu.SaveData = function()

    file.Write(slavermenu.SavedData:GetString()..".txt", util.TableToJSON(slavermenu.Friends.List))

    file.Append(slavermenu.SavedData:GetString()..".txt", "\n")

    file.Append(slavermenu.SavedData:GetString()..".txt", util.TableToJSON(slavermenu.Entities.List))

end*/

 

//This is all the bones i look for in the order im looking for them. Feel free to change the order if you want to attack the foot before the head or something like that.

slavermenu.Bones = {

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

slavermenu.RandomBones = {

"ValveBiped.Bip01_Head1",

"ValveBiped.Bip01_Neck1",

"ValveBiped.Bip01_Spine4",

"ValveBiped.Bip01_Spine2",

"ValveBiped.Bip01_R_UpperArm",

"ValveBiped.Bip01_L_UpperArm"

}

slavermenu.GetRandomBones = function()

    local temp = {}

    local function GetBones() //Ahh recursion, i love you.

        if #slavermenu.RandomBones > 0 then

            local random = math.random(1, #slavermenu.RandomBones)

            table.insert(temp, slavermenu.RandomBones[random])

            table.remove(slavermenu.RandomBones, random)

            GetBones()

        else

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_Head1")

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_Neck1")

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_Spine4")

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_Spine2")

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_R_UpperArm")

            table.insert(slavermenu.RandomBones, "ValveBiped.Bip01_L_UpperArm")

        end

    end

    GetBones()

    return temp

end

 

//A list of all keyboard keys, for binding

slavermenu.Keys = {

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

slavermenu.MouseKeys = {

[107] = "MOUSE_LEFT",

[108] = "MOUSE_RIGHT",

[109] = "MOUSE_MIDDLE",

[110] = "MOUSE_4",

[111] = "MOUSE_5"

}

//Tells me if a specific key is pressed. Loops through both tables.

slavermenu.KeyPressed = function(key)

    if slavermenu.InChat then return false end

   

    for k = 107, 111 do

        if key == slavermenu.MouseKeys[k] then

            if input.IsMouseDown(k) then

                return true

            else

                return false

            end

        end

    end

   

    for k = 0, 130 do

        if key == slavermenu.Keys[k] then

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

slavermenu.BoolToInt = function(bool)

    if bool then

        return 1

    else

        return 0

    end

end

 

//Checking if a bone is visible, pos is the position of the bone and ent is the entity whos bone were looking for.

slavermenu.SpotIsVisible = function(pos, ent)

    ent = ent or slavermenu.Aimbot.CurTarget

    local tracedata = {}

    tracedata.start = slavermenu.Ply:GetShootPos()

    tracedata.endpos = pos

    tracedata.filter = {slavermenu.Ply, ent}

   

    local trace = util.TraceLine(tracedata)

    if trace.HitPos:Distance(pos) < 0.005 then

        return true

    else

        return false

    end

end

 

//Checks all of the entities bones to find if we can see this entity or not.

slavermenu.CanSee = function(ent)

    for k = 1, #slavermenu.Bones do

        local v = slavermenu.Bones[k]

        local bone = ent:LookupBone(v)

        if bone != nil then

            local pos, ang = ent:GetBonePosition(bone)

            if slavermenu.SpotIsVisible(pos, ent) then

                return true

            end

        end

    end

    return false

end

 

//This returns the next entity we should attack.

slavermenu.GetTarget = function()

    if slavermenu.Aimbot.Vars["AttackNPCs"]:GetBool() or slavermenu.Aimbot.Vars["AttackPlayers"]:GetBool() then

        local targets = {}

        local everything = ents.GetAll()

        for k = 1, #everything do

            local v = everything[k]

            if slavermenu.Aimbot.Vars["AttackNPCs"]:GetBool() and v:IsNPC() then

                if slavermenu.CanSee(v) then

                    table.insert(targets, {["Target"] = v, ["Pos"] = v:LocalToWorld(v:OBBCenter())})

                end

            elseif slavermenu.Aimbot.Vars["AttackPlayers"]:GetBool() and v:IsPlayer() and v != slavermenu.Ply then

                if slavermenu.CanSee(v) then

                    table.insert(targets, {["Target"] = v, ["Pos"] = v:LocalToWorld(v:OBBCenter())})

                end

            end

        end

       

        for k,v in SortedPairs(targets, true) do //It will already be sorted so this shouldn't be too resource heavy, the main point of this is to loop through the table backwards

            local v = v["Target"]

            local shouldremove = false

            if slavermenu.Aimbot.Vars["IgnoreTeam"]:GetBool() and v:IsPlayer() then

                if slavermenu.TTT then

                    if slavermenu.Ply:GetRole() == 1 and v:GetRole() == 1 then

                        shouldremove = true

                    end

                       

                    if slavermenu.Ply:GetRole() != 1 and not table.HasValue(slavermenu.Traitors, v) then

                        shouldremove = true

                    end

                else

                    if v:Team() == slavermenu.Ply:Team() then

                        shouldremove = true

                    end

                end

            end

           

            if slavermenu.Friends.Vars["Active"]:GetBool() then

                if slavermenu.Friends.Vars["Reverse"]:GetBool() then

                    if not table.HasValue(slavermenu.Friends.List, v:SteamID()) then

                        shouldremove = true

                    end

                else

                    if table.HasValue(slavermenu.Friends.List, v:SteamID()) then

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

       

        if slavermenu.Aimbot.Vars["Preferance"]:GetString() == "Distance" then

            local min = {["Distance"] = slavermenu.Ply:GetPos():Distance(targets[1]["Pos"]), ["Target"] = targets[1]["Target"]}

            for k = 1, #targets do

                local v = targets[k]

               

                local distance = slavermenu.Ply:GetPos():Distance(v["Pos"])

                if distance < min["Distance"] then

                    min = {["Distance"] = distance, ["Target"] = v["Target"]}

                end

            end

            min["Target"].BoneToAimAt = nil

            return min["Target"]

        elseif slavermenu.Aimbot.Vars["Preferance"]:GetString() == "Angle" then    

            local min = {["Angle"] = slavermenu.AngleTo(targets[1]["Pos"]), ["Target"] = targets[1]["Target"]}

            for k = 1, #targets do

                local v = targets[k]

               

                local angle = slavermenu.AngleTo(v["Pos"])

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

slavermenu.AngleTo = function(pos)

    local myAngs = slavermenu.Ply:GetAngles()

    local needed = (pos - slavermenu.Ply:GetShootPos()):Angle()

   

    myAngs.p = math.NormalizeAngle(myAngs.p)

    needed.p = math.NormalizeAngle(needed.p)

   

    myAngs.y = math.NormalizeAngle(myAngs.y)

    needed.y = math.NormalizeAngle(needed.y)

   

    local p = math.NormalizeAngle(needed.p - myAngs.p)

    local y = math.NormalizeAngle(needed.y - myAngs.y)

   

    return math.abs(p) + math.abs(y), {p = p, y = y}

end

 

//Returns true if our target meets our preferances.

slavermenu.ValidTarget = function()

    if slavermenu.Aimbot.CurTarget == nil then return false end

    if not IsValid(slavermenu.Aimbot.CurTarget) then return false end

    if slavermenu.Aimbot.CurTarget:IsPlayer() and (not slavermenu.Aimbot.CurTarget:Alive() or slavermenu.Aimbot.CurTarget:Team() ==TEAM_SPECTATOR or slavermenu.Aimbot.CurTarget:Health() < 1) then return false end

    if not slavermenu.Aimbot.Vars["AttackNPCs"]:GetBool() and slavermenu.Aimbot.CurTarget:IsNPC() then return false end

    if not slavermenu.Aimbot.Vars["AttackPlayers"]:GetBool() and slavermenu.Aimbot.CurTarget:IsPlayer() then return false end

    if not slavermenu.CanSee(slavermenu.Aimbot.CurTarget) then return false end

    if slavermenu.Aimbot.Vars["IgnoreTeam"]:GetBool() and slavermenu.Aimbot.CurTarget:IsPlayer() then

        if slavermenu.TTT then

            if slavermenu.Ply:GetRole() == 1 and slavermenu.Aimbot.CurTarget:GetRole() == 1 then return false end              

            if slavermenu.Ply:GetRole() != 1 and not table.HasValue(slavermenu.Traitors, slavermenu.Aimbot.CurTarget) then return false end

        else

            if slavermenu.Aimbot.CurTarget:Team() == slavermenu.Ply:Team() then return false end

        end

    end

   

    return true

end

 

hook.Add("RenderScreenspaceEffects", slavermenu.RandomName(math.random(10, 15)), function()

    if slavermenu.Active:GetBool() then

        local everything = ents.GetAll()

        for k = 1, #everything do

            local v = everything[k]

           

            if slavermenu.Chams.Vars["Active"]:GetBool() and v != slavermenu.Ply and (slavermenu.Chams.Vars["MaxDistance"]:GetInt() == 0 orv:GetPos():Distance(slavermenu.Ply:GetPos()) < slavermenu.Chams.Vars["MaxDistance"]:GetInt()) then

                cam.Start3D(EyePos(), EyeAngles())

                    if (v:IsPlayer() and v:Alive() and v:Team() != TEAM_SPECTATOR and slavermenu.Chams.Vars["Players"]:GetBool()) or(v:IsNPC() and v:Health() > 0 and slavermenu.Chams.Vars["NPCs"]:GetBool()) then

                        local color = slavermenu.Style.Vars["Chams"].color

                        if slavermenu.Chams.Vars["TeamBased"]:GetBool() and v:IsPlayer() then

                            color = team.GetColor(v:Team())

                            if slavermenu.TTT then

                                if v:GetRole() == 2 then

                                    color = Color(0, 0, 255, 255)

                                elseif table.HasValue(slavermenu.Traitors, v) then

                                    color = Color(255, 0, 0, 255)

                                else

                                    color = Color(0, 255, 0, 255)

                                end

                            end

                        end

                        render.SuppressEngineLighting(true)

                        render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)

                        render.MaterialOverride(slavermenu.Chams.Mat)

                        v:DrawModel()

                       

                        render.SetColorModulation((color.r + 150)/250, (color.g + 150)/250, (color.b + 150)/255, 1)                    

                        if IsValid(v:GetActiveWeapon()) and slavermenu.Chams.Vars["Weapons"]:GetBool() then

                            v:GetActiveWeapon():DrawModel()

                        end

                       

                        render.SetColorModulation(1, 1, 1, 1)

                        render.MaterialOverride()

                        render.SetModelLighting(4, color.r/255, color.g/255, color.b/255)

                        v:DrawModel()

                        render.SuppressEngineLighting(false)

                    elseif slavermenu.TTT and slavermenu.Chams.Vars["Bodies"]:GetBool() and v:GetClass() == "prop_ragdoll" then

                        local color = slavermenu.Style.Vars["BodyChams"].color

                        render.SuppressEngineLighting(true)

                        render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)

                        render.MaterialOverride(slavermenu.Chams.Mat)

                        v:DrawModel()  

                        render.SetColorModulation(1, 1, 1, 1)

                        render.MaterialOverride()

                        render.SetModelLighting(4, color.r/255, color.g/255, color.b/255)

                        v:DrawModel()

                        render.SuppressEngineLighting(false)

                    elseif slavermenu.Entities.Vars["Active"]:GetBool() and table.HasValue(slavermenu.Entities.List, v:GetClass()) then

                        local color = slavermenu.Style.Vars["Chams"].color                 

                        render.SuppressEngineLighting(true)

                        render.SetColorModulation(color.r/255, color.g/255, color.b/255, 1)

                        render.MaterialOverride(slavermenu.Chams.Mat)

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

slavermenu.DrawFilledCircle = function(x, y, radius, quality)

    local circle = {}

    local tmp = 0

    for i = 1, quality do

        tmp = math.rad(i * 360) / quality

        circle = {x = x + math.cos(tmp) * radius, y = y + math.sin(tmp) * radius}

    end

    surface.DrawPoly(circle)

end

 

//Another helper fuction on the radar.

slavermenu.DrawArrow = function(x, y, myRotation)

    local arrow = {}   

    arrow[1] = {x = x, y = y}

    arrow[2] = {x = x + 4, y = y + 7.5}

    arrow[3] = {x = x, y = y + 5}

    arrow[4] = {x = x - 4, y = y + 7.5}

   

    //Now that i have the arrow determined, i have to rotate it to match the targets angle

    myRotation = myRotation * -1

    myRotation = math.rad(myRotation)

    for i = 1, 4 do

        local theirX = arrow.x

        local theirY = arrow.y

       

        theirX = theirX - x

        theirY = theirY - y

       

        arrow.x = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)

        arrow.y = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)

       

        arrow.x = arrow.x + x

        arrow.y = arrow.y + y

    end

 

    surface.DrawPoly(arrow)

end

 

slavermenu.Traitors = {}

slavermenu.SuperAdmins = {}

slavermenu.Admins = {}

slavermenu.Spectators = {}

local radarX, radarY, radarWidth, radarHeight = 100, 200, 150, 150

hook.Add("HUDPaint", slavermenu.RandomName(math.random(10, 15)), function()

    if slavermenu.Active:GetBool() then

        local everything = ents.GetAll()

       

        if slavermenu.ESP.Vars["Active"]:GetBool() and slavermenu.ESP.Vars["Radar"]:GetBool() then //Setting up the background here. And since the ESP doesnt draw you

            draw.RoundedBox(0, radarX, radarY, radarWidth, radarHeight, Color(100, 100, 100, 255 ))

            draw.NoTexture()

            if slavermenu.ESP.Vars["TeamBased"]:GetBool() then

                local color = team.GetColor(slavermenu.Ply:Team())

                if slavermenu.TTT then

                    if slavermenu.Ply:GetRole() == 2 then

                        color = Color(0, 0, 255, 255)

                    elseif slavermenu.Ply:GetRole() == 1 then

                        color = Color(255, 0, 0, 255)

                    else

                        color = Color(0, 255, 0, 255)

                    end

                end

                surface.SetDrawColor(color)

            else

                surface.SetDrawColor(slavermenu.Style.Vars["ESPText"].color)

            end

            slavermenu.DrawArrow(radarX + (radarWidth / 2), radarY + (radarHeight / 2), 0)

        end

       

        for k = 1, #everything do

            local v = everything[k]

       

            if slavermenu.ESP.Vars["Active"]:GetBool() and v != slavermenu.Ply and (slavermenu.ESP.Vars["MaxDistance"]:GetInt() == 0 orv:GetPos():Distance(slavermenu.Ply:GetPos()) < slavermenu.ESP.Vars["MaxDistance"]:GetInt()) then                                       

                if (v:IsPlayer() and v:Alive() and v:Team() != TEAM_SPECTATOR and slavermenu.ESP.Vars["Players"]:GetBool()) or (v:IsNPC() andv:Health() > 0 and slavermenu.ESP.Vars["NPCs"]:GetBool()) then

                    local color = slavermenu.Style.Vars["ESPText"].color

                    if slavermenu.ESP.Vars["TeamBased"]:GetBool() and v:IsPlayer() then

                        color = team.GetColor(v:Team())

                        if slavermenu.TTT then

                            if v:GetRole() == 2 then

                                color = Color(0, 0, 255, 255)

                            elseif table.HasValue(slavermenu.Traitors, v) then

                                color = Color(255, 0, 0, 255)

                            else

                                color = Color(0, 255, 0, 255)

                            end

                        end

                    end

                   

                    local Min, Max = v:GetCollisionBounds()

                    if slavermenu.ESP.Vars["Box"]:GetBool() then

                        local one = v:LocalToWorld(Min):ToScreen()

                        local two = v:LocalToWorld(Vector(Min.x, Min.y, Max.z)):ToScreen()

                        local three = v:LocalToWorld(Vector(Min.x, Min.y + (Max.y * 2), Min.z)):ToScreen()

                        local four = v:LocalToWorld(Vector(Min.x + (Max.x * 2), Min.y, Min.z)):ToScreen()

                        local five = v:LocalToWorld(Max):ToScreen()

                        local six = v:LocalToWorld(Vector(Max.x, Max.y, Min.z)):ToScreen()

                        local seven = v:LocalToWorld(Vector(Max.x, Max.y + (Min.y * 2), Max.z)):ToScreen()

                        local eight = v:LocalToWorld(Vector(Max.x + (Min.x * 2), Max.y, Max.z)):ToScreen()             

                       

                        if slavermenu.ESP.Vars["TeamBased"]:GetBool() then

                            surface.SetDrawColor(color)

                        else

                            surface.SetDrawColor(slavermenu.Style.Vars["BoundingBox"].color)

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

                    if slavermenu.ESP.Vars["ShowTraitors"]:GetString() != "Off" and table.HasValue(slavermenu.Traitors, v) then

                        if slavermenu.ESP.Vars["ShowTraitors"]:GetString() == "Above" then

                            DrawAbove("Traitor")

                        else

                            DrawBelow("Traitor")

                        end

                    end

                   

                    surface.SetTextColor(color)

                    if v:IsPlayer() then

                        if slavermenu.ESP.Vars["Name"]:GetString() == "Above" then

                            if v:IsSuperAdmin() then   

                                DrawAbove("[SA] "..v:Nick().. " [SA]")

                            elseif v:IsAdmin() then

                                DrawAbove("[A] "..v:Nick().." [A]")

                            elseif v:IsUserGroup("moderator") or v:IsUserGroup("mod") or v:IsUserGroup("operator") or v:IsUserGroup("op")then

                                DrawAbove("[OP] "..v:Nick().." [OP]")

                            elseif v:IsUserGroup("vip") or v:IsUserGroup("donator") then

                                DrawAbove("[$$] "..v:Nick().." [$$]")

                            else

                                DrawAbove(v:Nick())

                            end

                        elseif slavermenu.ESP.Vars["Name"]:GetString() == "Below" then

                            if v:IsSuperAdmin() then   

                                DrawBelow("[SA] "..v:Nick().. " [SA]")

                            elseif v:IsAdmin() then

                                DrawBelow("[A] "..v:Nick().." [A]")

                            elseif v:IsUserGroup("moderator") or v:IsUserGroup("mod") or v:IsUserGroup("operator") or v:IsUserGroup("op")then

                                DrawBelow("[OP] "..v:Nick().." [OP]")

                            elseif v:IsUserGroup("vip") or v:IsUserGroup("donator") then

                                DrawBelow("[$$] "..v:Nick().." [$$]")

                            else

                                DrawAbove(v:Nick())

                            end

                        end

                    else

                        if slavermenu.ESP.Vars["Name"]:GetString() == "Above" then

                            DrawAbove("NPC: "..v:GetClass())

                        elseif slavermenu.ESP.Vars["Name"]:GetString() == "Below" then

                            DrawBelow("NPC: "..v:GetClass())

                        end

                    end

                   

                    if slavermenu.ESP.Vars["Weapons"]:GetString() == "Above" and IsValid(v:GetActiveWeapon()) then

                        DrawAbove("Weapon: "..v:GetActiveWeapon():GetClass())

                    elseif slavermenu.ESP.Vars["Weapons"]:GetString() == "Below" and IsValid(v:GetActiveWeapon()) then

                        DrawBelow("Weapon: "..v:GetActiveWeapon():GetClass())

                    end    

                   

                    if slavermenu.ESP.Vars["Distance"]:GetString() == "Above" then

                        DrawAbove(""..bottom:Distance(slavermenu.Ply:GetPos()))

                    elseif slavermenu.ESP.Vars["Distance"]:GetString() == "Below" then

                        DrawBelow(""..bottom:Distance(slavermenu.Ply:GetPos()))

                    end

                   

                    if slavermenu.ESP.Vars["Health"]:GetString() == "Above" then

                        if v:IsPlayer()then

                            DrawAbove(v:Health().. "H - "..v:Armor().."A")

                        else

                            DrawAbove(v:Health().. "H")

                        end

                    elseif slavermenu.ESP.Vars["Health"]:GetString() == "Below" then

                        if v:IsPlayer()then

                            DrawBelow(v:Health().. "H - "..v:Armor().."A")

                        else

                            DrawBelow(v:Health().. "H")

                        end

                    end

                   

                    if slavermenu.ESP.Vars["Radar"]:GetBool() then

                        surface.SetDrawColor(color)

                        local myPos = slavermenu.Ply:GetPos()

                        local theirPos = v:GetPos()

                        local myAngles = slavermenu.Ply:GetAngles()

                       

                        local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / slavermenu.ESP.Vars["RadarScale"]:GetInt())

                        local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / slavermenu.ESP.Vars["RadarScale"]:GetInt())

                       

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

                            slavermenu.DrawArrow(newX, newY, v:EyeAngles().y - myAngles.y)

                        end

                    end

                elseif slavermenu.TTT and slavermenu.ESP.Vars["Bodies"]:GetBool() and v:GetClass() == "prop_ragdoll" then

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

                   

                    surface.SetTextColor(slavermenu.Style.Vars["BodyText"].color)

                    DrawText("Credits: "..slavermenu.TTTCORPSE.GetCredits(v, 0))

                    DrawText("Name: "..slavermenu.TTTCORPSE.GetPlayerNick(v, "Unknown"))

                    DrawText("Found: "..tostring(slavermenu.TTTCORPSE.GetFound(v, false)))

                   

                    if slavermenu.ESP.Vars["Radar"] then

                        surface.SetDrawColor(slavermenu.Style.Vars["BodyText"].color)

                        local myPos = slavermenu.Ply:GetPos()

                        local theirPos = v:GetPos()

                       

                        local theirX = (radarX + (radarWidth / 2)) + ((theirPos.x - myPos.x) / slavermenu.ESP.Vars["RadarScale"]:GetInt())

                        local theirY = (radarY + (radarHeight / 2)) + ((myPos.y - theirPos.y) / slavermenu.ESP.Vars["RadarScale"]:GetInt())

                       

                        //Now i have to rotate this

                        local myRotation = slavermenu.Ply:GetAngles().y - 90

                        myRotation = math.rad(myRotation)

                       

                        theirX = theirX - (radarX + (radarWidth / 2))

                        theirY = theirY - (radarY + (radarHeight / 2))

                        local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)

                        local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)

                        newX = newX + (radarX + (radarWidth / 2))

                        newY = newY + (radarY + (radarHeight / 2))

                       

                        //And now that its rotated i can check if its within our radars bounds and draw it

                        if newX < (radarX + radarWidth) and newX > radarX and newY < (radarY + radarHeight) and newY > radarY then

                            slavermenu.DrawFilledCircle(newX, newY, 2, 4)

                        end

                    end

                elseif slavermenu.Entities.Vars["Active"]:GetBool() and table.HasValue(slavermenu.Entities.List, v:GetClass()) then

                    if v:GetClass() == "cw_item" then -- Dingus ESP

                        local itemTable = v.cwItemTable;

                        local text

                        if itemTable then

                            text = itemTable("name")

                        else

                            text = v:GetModel()

                        end

                        surface.SetFont("ESPFont")

                        surface.SetTextColor(slavermenu.Style.Vars["ESPText"].color)

                       

                        local W, H = surface.GetTextSize(text)

                        local PosScreen = v:GetPos():ToScreen()

                        surface.SetTextPos(PosScreen.x - W / 2, PosScreen.y)

                        surface.DrawText(text)

                    else

                        surface.SetFont("ESPFont")

                        surface.SetTextColor(slavermenu.Style.Vars["ESPText"].color)

                   

                        local text = v:GetClass()

                        local W, H = surface.GetTextSize(text)

                   

                        local PosScreen = v:GetPos():ToScreen()

                        surface.SetTextPos(PosScreen.x - W / 2, PosScreen.y)

                        surface.DrawText(text)

                    end

                end

            end

           

            surface.SetFont("default")

            if v:IsPlayer() and v:IsSuperAdmin() then

                if not table.HasValue(slavermenu.SuperAdmins, v) then

                    table.insert(slavermenu.SuperAdmins, v)

                    slavermenu.Message("Sarge, Super Admin "..v:Nick().." has connected to the server!")

                    if slavermenu.Misc.Vars["Sounds"]:GetBool() then

                        surface.PlaySound("vo/npc/Alyx/watchout02.wav")

                    end

                end

            end        

            if v:IsPlayer() and v:IsAdmin() and not v:IsSuperAdmin() then

                if not table.HasValue(slavermenu.Admins, v) then

                    table.insert(slavermenu.Admins, v)

                    slavermenu.Message("Sarge, Admin "..v:Nick().." has connected to the server!")

                    if slavermenu.Misc.Vars["Sounds"]:GetBool() then

                        surface.PlaySound("vo/npc/Alyx/watchout01.wav")

                    end

                end

            end    

            for k,v in SortedPairs(slavermenu.Admins, true) do

                if not IsValid(v) then

                    table.remove(slavermenu.Admins, k)

                end

            end

            for k,v in SortedPairs(slavermenu.SuperAdmins, true) do

                if not IsValid(v) then

                    table.remove(slavermenu.SuperAdmins, k)

                end

            end

               

            if v:IsPlayer() and v:GetObserverTarget() == slavermenu.Ply then

                if not table.HasValue(slavermenu.Spectators, v) then

                    table.insert(slavermenu.Spectators, v)

                    slavermenu.Message(v:Nick().." is spectating you.")

                    if slavermenu.Misc.Vars["Sounds"]:GetBool() then

                        surface.PlaySound("vo/npc/female01/ohno.wav")

                    end            

                end

            end

            for k,v in SortedPairs(slavermenu.Spectators, true) do

                if IsValid(v) then

                    if v:GetObserverTarget() != slavermenu.Ply then

                        table.remove(slavermenu.Spectators, k)

                    end

                else

                    table.remove(slavermenu.Spectators, k)

                end

            end

           

            if slavermenu.TTT and slavermenu.Misc.Vars["TraitorFinder"]:GetBool() then

                if GetRoundState() == 3 and v:IsWeapon() and type(v:GetOwner()) == "Player" and v.Buyer == nil and v.CanBuy andtable.HasValue(v.CanBuy, 1) then

                    local owner = v:GetOwner()

                    if owner:GetRole() == 2 then

                        v.Buyer = owner

                    else

                        slavermenu.Message(owner:Nick().." got a new toy: "..v:GetClass())

                        v.Buyer = owner

                        table.insert(slavermenu.Traitors, owner)

                        if slavermenu.Misc.Vars["Sounds"]:GetBool() then

                            surface.PlaySound("weapons/shotgun/shotgun_cock.wav")

                        end

                    end

                elseif GetRoundState() != 3 then

                    table.Empty(slavermenu.Traitors)

                end

            end

           

            if slavermenu.Misc.Vars["Deaths"]:GetBool() and v:IsPlayer() then

                if v:Alive() then

                    v.IsAlive = true

                elseif v.IsAlive then

                    slavermenu.Message(3, v:Nick().." just got naturally selected. Fuckin' Jock.")

                    v.IsAlive = false

                    if slavermenu.Misc.Vars["Sounds"]:GetBool() then

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

        if slavermenu.Misc.Vars["ShowAdmins"]:GetBool() then

            for k,v in pairs(slavermenu.SuperAdmins) do

                local W, H = surface.GetTextSize(v:Nick().." - Super Admin")

                if W > AdminWidest then

                    AdminWidest = W

                end

                AdminTotalHeight = AdminTotalHeight + H

            end

            for k,v in pairs(slavermenu.Admins) do

                local W, H = surface.GetTextSize(v:Nick().." - Admin")

                if W > AdminWidest then

                    AdminWidest = W

                end

                AdminTotalHeight = AdminTotalHeight + H

            end

            draw.RoundedBox(8, ScrW() - AdminWidest - 30, 10, AdminWidest + 20, AdminTotalHeight + 20, Color(0, 0, 0, 150 ))

            for k,v in pairs(slavermenu.SuperAdmins) do

                local text = v:Nick().." - Super Admin"

                local W, H = surface.GetTextSize(text)

                surface.SetTextPos(ScrW() - 20 - AdminWidest, AdminHeight)

                surface.DrawText(text)

                AdminHeight = AdminHeight + H

            end

            for k,v in pairs(slavermenu.Admins) do

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

        if slavermenu.Misc.Vars["ShowSpectators"]:GetBool() then

            for k,v in pairs(slavermenu.Spectators) do

                local W, H = surface.GetTextSize(v:Nick())

                if W > SpecWidest then

                    SpecWidest = W

                end

                SpecTotalHeight = SpecTotalHeight + H

            end

            draw.RoundedBox(8, ScrW() - SpecWidest - 30, 40 + AdminTotalHeight, SpecWidest + 20, SpecTotalHeight + 20, Color(0, 0, 0, 150 ))

            for k,v in pairs(slavermenu.Spectators) do

                local text = v:Nick()

                local W, H = surface.GetTextSize(text)

                surface.SetTextPos(ScrW() - 20 - SpecWidest, SpecHeight)

                surface.DrawText(text)

                SpecHeight = SpecHeight + H

            end

        end

       

        if slavermenu.Misc.Vars["Crosshair"]:GetBool() then

            local size = slavermenu.Misc.Vars["CrosshairSize"]:GetInt()

            local MiddleScreen = {x = surface.ScreenWidth() / 2, y = surface.ScreenHeight() / 2}

            surface.SetDrawColor(slavermenu.Style.Vars["Crosshair"].color)

            surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x - size, MiddleScreen.y)

            surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x, MiddleScreen.y - size)

            surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x + size, MiddleScreen.y)

            surface.DrawLine(MiddleScreen.x, MiddleScreen.y, MiddleScreen.x, MiddleScreen.y + size)

        end

    end

end)

 

hook.Add("Think", slavermenu.RandomName(math.random(10, 15)), function()

    if slavermenu.Active:GetBool() then

        if slavermenu.Aimbot.Vars["Active"]:GetBool() and not (slavermenu.Aimbot.Vars["PanicMode"]:GetBool() and #slavermenu.Spectators > 0)then

            if not slavermenu.Aimbot.Vars["AimOnKey"]:GetBool() or (slavermenu.Aimbot.Vars["AimOnKey"]:GetBool() andslavermenu.KeyPressed(slavermenu.Aimbot.Vars["AimOnKey_Key"]:GetString())) then

                if slavermenu.ValidTarget() then

                    local BoneOrder = {}

                    if slavermenu.Aimbot.CurTarget.BoneToAimAt and slavermenu.Aimbot.Vars["RandomBones"]:GetBool() then

                        table.insert(BoneOrder, slavermenu.Aimbot.CurTarget.BoneToAimAt)

                        table.Add(BoneOrder, slavermenu.GetRandomBones())

                        table.Add(BoneOrder, slavermenu.Bones)

                    else

                        if slavermenu.Aimbot.Vars["RandomBones"]:GetBool() then

                            table.Add(BoneOrder, slavermenu.GetRandomBones())

                            table.Add(BoneOrder, slavermenu.Bones)

                        else

                            table.Add(BoneOrder, slavermenu.Bones)

                        end

                    end

                    for k = 1, #BoneOrder do

                        local v = BoneOrder[k]

                        local bone = slavermenu.Aimbot.CurTarget:LookupBone(v)

                        if bone != nil then

                            local pos, ang = slavermenu.Aimbot.CurTarget:GetBonePosition(bone)

                            if v == "ValveBiped.Bip01_Head1" then

                                pos = pos + Vector(0, 0, 3) //Aiming a little higher for the head

                            end

                            local total, needed = 300, {300, 300}

                           

                            if slavermenu.Aimbot.Vars["Prediction"]:GetBool() then

                                local tarSpeed = slavermenu.Aimbot.CurTarget:GetVelocity() * 0.013

                                local plySpeed = slavermenu.Ply:GetVelocity() * 0.013

                                total, needed = slavermenu.AngleTo(pos - plySpeed + tarSpeed)

                            else

                                total, needed = slavermenu.AngleTo(pos)

                            end

                               

                            if slavermenu.SpotIsVisible(pos) and total < slavermenu.Aimbot.Vars["MaxAngle"]:GetInt() then

                                local myAngles = slavermenu.Ply:GetAngles()                            

                                local NewAngles = Angle(myAngles.p + needed.p, myAngles.y + needed.y, 0)

                               

                                if slavermenu.Aimbot.Vars["AntiSnap"]:GetBool() then

                                    local speed = slavermenu.Aimbot.Vars["AntiSnapSpeed"]:GetInt()

                                    NewAngles = (Angle(math.Approach(myAngles.p, NewAngles.p, speed), math.Approach(myAngles.y, NewAngles.y,speed), 0))

                                end

                               

                                slavermenu.Ply:SetEyeAngles(NewAngles)

                                slavermenu.Aimbot.CurTarget.BoneToAimAt = BoneOrder[k]

                                break

                            end

                        end

                    end

                else

                    slavermenu.Aimbot.CurTarget = slavermenu.GetTarget()

                end

            else

                slavermenu.Aimbot.CurTarget = nil

            end

        end

       

        if slavermenu.Misc.Vars["NoRecoil"]:GetBool() then

            if IsValid(slavermenu.Ply:GetActiveWeapon()) then

                local weapon = slavermenu.Ply:GetActiveWeapon()

                if weapon.Primary then

                    weapon.OldRecoil = weapon.OldRecoil or weapon.Primary.Recoil or weapon.Recoil

                    weapon.Primary.Recoil = 0

                    weapon.Recoil = 0

                else

                    weapon.OldRecoil = weapon.OldRecoil or weapon.Recoil

                    weapon.Recoil = 0

                end

            end

        elseif IsValid(slavermenu.Ply:GetActiveWeapon()) then

            local weapon = slavermenu.Ply:GetActiveWeapon()

            if weapon.Primary then

                weapon.Primary.Recoil = weapon.OldRecoil or weapon.Primary.Recoil or weapon.Recoil

                weapon.Recoil = weapon.OldRecoil or weapon.Recoil or weapon.Primary.Recoil

            else

                weapon.Recoil = weapon.OldRecoil or weapon.Recoil

            end

        end

       

        if slavermenu.DarkRP and slavermenu.Misc.Vars["BuyHealth"]:GetBool() then

            if slavermenu.Ply:Alive() and slavermenu.Ply:Health() < slavermenu.Misc.Vars["BuyHealth_Minimum"]:GetInt() then

                slavermenu.Ply:ConCommand("say /buyhealth")

            end

        end

    end

end)

 

slavermenu.Misc.NextReload = CurTime()

slavermenu.Misc.ShootNext = true

hook.Add("CreateMove", slavermenu.RandomName(math.random(10, 15)), function(cmd)

    if slavermenu.Active:GetBool() then    

        local DontShoot = {"gmod_tool", "gmod_camera", "weapon_physgun", "weapon_physcannon"}

        if slavermenu.Aimbot.Vars["AutoShoot"]:GetBool() and slavermenu.Aimbot.Vars["Active"]:GetBool() andslavermenu.Ply:GetEyeTrace().Entity == slavermenu.Aimbot.CurTarget and IsValid(slavermenu.Ply:GetActiveWeapon()) and nottable.HasValue(DontShoot, slavermenu.Ply:GetActiveWeapon():GetClass()) then

            cmd:SetButtons(cmd:GetButtons() + IN_ATTACK)

        end

       

        if slavermenu.Misc.Vars["BunnyHop"]:GetBool() and cmd:KeyDown(IN_JUMP) andslavermenu.KeyPressed(slavermenu.Misc.Vars["BunnyHop_Key"]:GetString()) then

            cmd:SetButtons(cmd:GetButtons() - IN_JUMP)

        end

        if slavermenu.Misc.Vars["BunnyHop"]:GetBool() and slavermenu.Ply:OnGround() andslavermenu.KeyPressed(slavermenu.Misc.Vars["BunnyHop_Key"]:GetString()) then

            cmd:SetButtons(cmd:GetButtons() + IN_JUMP)

        end

       

        local DontReload = {"gmod_tool", "gmod_camera", "weapon_physgun", "weapon_physcannon", "weapon_crowbar"}

        if slavermenu.Misc.Vars["AutoReload"]:GetBool() and IsValid(slavermenu.Ply:GetActiveWeapon()) andslavermenu.Ply:GetActiveWeapon():Clip1() < 1 and not table.HasValue(DontReload, slavermenu.Ply:GetActiveWeapon():GetClass()) andslavermenu.Misc.NextReload < CurTime() then

            cmd:SetButtons(cmd:GetButtons() + IN_RELOAD)

        end

       

        if slavermenu.Misc.Vars["AutoPistol"]:GetBool() and IsValid(slavermenu.Ply:GetActiveWeapon()) then

            local weapon = slavermenu.Ply:GetActiveWeapon()

            if weapon.Primary and type(weapon.Primary.Automatic) == "boolean" and not weapon.Primary.Automatic then

                if cmd:KeyDown(IN_ATTACK) then

                    if slavermenu.Misc.ShootNext then

                        slavermenu.Misc.ShootNext = false

                    else

                        cmd:SetButtons(cmd:GetButtons() - IN_ATTACK)

                        slavermenu.Misc.ShootNext = true

                    end

                end                

            elseif type(weapon.Automatic) == "boolean" and not weapon.Automatic then

                if cmd:KeyDown(IN_ATTACK) then

                    if slavermenu.Misc.ShootNext then

                        slavermenu.Misc.ShootNext = false

                    else

                        cmd:SetButtons(cmd:GetButtons() - IN_ATTACK)

                        slavermenu.Misc.ShootNext = true

                    end

                end

            end

        end

    end

end)

 

//Used to see if the player is typing in chat or not. Binds arent called when you're in chat.

slavermenu.InChat = false

hook.Add("StartChat", slavermenu.RandomName(math.random(10, 15)), function()

    slavermenu.InChat = true

end)

hook.Add("FinishChat", slavermenu.RandomName(math.random(10, 15)), function()

    slavermenu.InChat = false

end)

 

concommand.Add("slavermenu_Menu", function()

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

            slavermenu.Ply:ConCommand("slavermenu_Active 0")

        end

        slavermenu.Ply:ConCommand("slavermenu_Active 1")

    end

    local function Disable()

        PanicButton:SetText("Enable")

        PanicButton.DoClick = function()

            PanicButton:SetText("Disable")

            PanicButton.DoClick = Disable

            slavermenu.Ply:ConCommand("slavermenu_Active 1")

        end

        slavermenu.Ply:ConCommand("slavermenu_Active 0")

    end

    if slavermenu.Active:GetBool() then

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

    title:SetText("slavermenu - "..slavermenu.Version)

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

            slavermenu.Ply:ConCommand(var.." "..data)

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

                        slavermenu.Ply:ConCommand(var.." "..slavermenu.MouseKeys[k])

                        Options:SetText(slavermenu.MouseKeys[k])

                        Options.Think = nil

                    end

                end

               

                for k = 0, 130 do

                    if input.IsKeyDown(k) then

                        slavermenu.Ply:ConCommand(var.." "..slavermenu.Keys[k])

                        Options:SetText(slavermenu.Keys[k])

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

            Options:AddChoice(tab)

        end

        Options.OnSelect = function(panel,index,value,data)

            slavermenu.Ply:ConCommand(var.." "..value)

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

   

    ToggleOption("Active", Aimbot, "slavermenu_Aimbot_Active")

    ToggleOption("Random Bones", Aimbot, "slavermenu_Aimbot_RandomBones")

    MultiOption("Preferance", Aimbot, "slavermenu_Aimbot_Preferance", {"Distance", "Angle"})   

    ToggleOption("Attack Players", Aimbot, "slavermenu_Aimbot_AttackPlayers")

    ToggleOption("Attack NPCs", Aimbot, "slavermenu_Aimbot_AttackNPCs")

    ToggleOption("Prediction", Aimbot, "slavermenu_Aimbot_Prediction")

    ToggleOption("Aim On Key", Aimbot, "slavermenu_Aimbot_AimOnKey")

    SetKeyOption("Key", Aimbot, "slavermenu_Aimbot_AimOnKey_Key")

    ToggleOption("Anti Snap", Aimbot, "slavermenu_Aimbot_AntiSnap")

    SetNumberOption("Anti Snap Speed", Aimbot, "slavermenu_Aimbot_AntiSnapSpeed", 1, 5, 2)

    SetNumberOption("Max Angle", Aimbot, "slavermenu_Aimbot_MaxAngle", 0, 270, 0)

    ToggleOption("Auto Shoot", Aimbot, "slavermenu_Aimbot_AutoShoot")

    ToggleOption("Panic Mode", Aimbot, "slavermenu_Aimbot_PanicMode")

    ToggleOption("Ignore Team", Aimbot, "slavermenu_Aimbot_IgnoreTeam")

   

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

        if v != slavermenu.Ply then

            if table.HasValue(slavermenu.Friends.List, v:SteamID()) then

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

       

        slavermenu.Friends.List = {}

        for k = 1, #Friends do

            table.insert(slavermenu.Friends.List, Friends[k]:SteamID())

        end

        //slavermenu.SaveData()

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

       

        slavermenu.Friends.List = {}

        for k = 1, #Friends do

            table.insert(slavermenu.Friends.List, Friends[k]:SteamID())

        end

        //slavermenu.SaveData()

    end

   

    y = y + EnemiesList:GetTall() + 20

    ToggleOption("Use", FriendsPanel, "slavermenu_Friends_Active")

    ToggleOption("Reverse", FriendsPanel, "slavermenu_Friends_Reverse")

   

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

    ToggleOption("Active", ESP, "slavermenu_ESP_Active")

    ToggleOption("Player Info", ESP, "slavermenu_ESP_Players")

    ToggleOption("NPC Info", ESP, "slavermenu_ESP_NPCs")

    MultiOption("Name", ESP, "slavermenu_ESP_Name", {"Off", "Above", "Below"}) 

    MultiOption("Weapon", ESP, "slavermenu_ESP_Weapons", {"Off", "Above", "Below"})

    MultiOption("Health", ESP, "slavermenu_ESP_Health", {"Off", "Above", "Below"}) 

    MultiOption("Distance", ESP, "slavermenu_ESP_Distance", {"Off", "Above", "Below"})

    MultiOption("Show Traitors", ESP, "slavermenu_ESP_ShowTraitors", {"Off", "Above", "Below"})

    ToggleOption("Bounding Box", ESP, "slavermenu_ESP_Box")

    ToggleOption("Body Info", ESP, "slavermenu_ESP_Bodies")

    ToggleOption("2D Radar", ESP, "slavermenu_ESP_Radar")

    SetNumberOption("Radar Scale", ESP, "slavermenu_ESP_RadarScale", 1, 100, 0)

    SetNumberOption("Max Distance", ESP, "slavermenu_ESP_MaxDistance", 0, 8000, 0)

    ToggleOption("Team Based", ESP, "slavermenu_ESP_TeamBased")

   

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

    ToggleOption("Active", Chams, "slavermenu_Chams_Active")

    ToggleOption("Draw Players", Chams, "slavermenu_Chams_Players")

    ToggleOption("Draw NPCs", Chams, "slavermenu_Chams_NPCs")

    ToggleOption("Draw Weapons", Chams, "slavermenu_Chams_Weapons")

    ToggleOption("Draw Bodies", Chams, "slavermenu_Chams_Bodies")

    ToggleOption("Team Based", Chams, "slavermenu_Chams_TeamBased")

    SetNumberOption("Max Distance", Chams, "slavermenu_Chams_MaxDistance", 0, 8000, 0)

   

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

        if table.HasValue(slavermenu.Entities.List, v:GetClass()) then

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

    ToShowList:SetSize(150, 350)

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

       

        slavermenu.Entities.List = {}

        for k = 1, #ToShow do

            table.insert(slavermenu.Entities.List, ToShow[k])

        end

        //slavermenu.SaveData()

    end

   

    IgnoreList:SetSize(150, 350)

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

       

        slavermenu.Entities.List = {}

        for k = 1, #ToShow do

            table.insert(slavermenu.Entities.List, ToShow[k])

        end

        //slavermenu.SaveData()

    end

   

    y = y + IgnoreList:GetTall() + 20

    ToggleOption("Active", Finder, "slavermenu_Entities_Active")

   

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

    ToggleOption("Show Admins", Misc, "slavermenu_Misc_ShowAdmins")

    ToggleOption("Crosshair", Misc, "slavermenu_Misc_Cross")

    SetNumberOption("Corsshair Size", Misc, "slavermenu_Misc_CrossSize", 0, 1000, 0)

    ToggleOption("No Recoil", Misc, "slavermenu_Misc_NoRecoil")

    ToggleOption("Spectators", Misc, "slavermenu_Misc_ShowSpectators")

    ToggleOption("Auto Reload", Misc, "slavermenu_Misc_AutoReload")

    ToggleOption("Bunny Hop", Misc, "slavermenu_Misc_BunnyHop")

    SetKeyOption("Key", Misc, "slavermenu_Misc_BunnyHop_Key")

    ToggleOption("Auto Pistol", Misc, "slavermenu_Misc_AutoPistol")

    ToggleOption("Buy Health", Misc, "slavermenu_Misc_BuyHealth")

    SetNumberOption("Minimum", Misc, "slavermenu_Misc_BuyHealth_Minimum", 0, 100, 0)

    ToggleOption("Traitor Finder", Misc, "slavermenu_Misc_TraitorFinder")

    ToggleOption("Show Deaths", Misc, "slavermenu_Misc_Deaths")

    ToggleOption("Sounds", Misc, "slavermenu_Misc_Sounds")

 

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

        Options:SetColor(tab.color)//slavermenu.GetColorFromString(GetConVar(var):GetString()))

        Options:SetWangs(false)

        Options:SetPalette(false)

        Options.ValueChanged = function(panel, color)

            slavermenu.Ply:ConCommand(tab.var:GetName().." ".."Color("..color.r..","..color.g..","..color.b..","..color.a..")")

            tab.color = slavermenu.GetColorFromString(tab.var:GetString())

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

    ColorOption("Bounding Box", Style, slavermenu.Style.Vars["BoundingBox"])

    ColorOption("ESP Text", Style, slavermenu.Style.Vars["ESPText"])

    ColorOption("Crosshair", Style, slavermenu.Style.Vars["Crosshair"])

    ColorOption("TTT Body Text", Style, slavermenu.Style.Vars["BodyText"])

    ColorOption("Chams", Style, slavermenu.Style.Vars["Chams"])

    ColorOption("TTT Body Chams", Style, slavermenu.Style.Vars["BodyChams"])

   

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

 

slavermenu.Message("Hack Loaded, welcome to 'Nam, sarge!")

 

---- Dingus Pickupinradius

 

 

function PickUpInRadius()

   local ply = LocalPlayer()

       for k,v in pairs( ents.GetAll() ) do

               local pos = v:GetPos()

               if v:IsValid() and ply:GetPos():Distance(pos) <= 2048 then

                       if v:GetClass() == "cw_item"  then

                               Clockwork.datastream:Start("EntityMenuOption", {v, "cwItemTake", "cwItemTake"});

                       elseif v:GetClass() == "cw_cash" then

                               Clockwork.datastream:Start("EntityMenuOption", {v, "cwCashTake", "cwCashTake"});

                       elseif v:GetClass() == "cw_shipment" then

                               Clockwork.datastream:Start("EntityMenuOption", {v, "cwShipmentOpen", "cwShipmentOpen"});

                       elseif v:GetClass() == "prop_physics" then

                               Clockwork.datastream:Start("EntityMenuOption", {v, "cwContainerOpen", "cwContainerOpen"});

                       elseif v:GetClass() == "prop_ragdoll" then

                               Clockwork.datastream:Start("EntityMenuOption", {v, "cwContainerOpen", "cwContainerOpen"});

                        end

               end

       end

end

concommand.Add( "pickupinradius", PickUpInRadius )

 

---- Mysterious Adminconfig command from Dingus. Seems patched already but left in anyways

 

function ConfigSet()

       Clockwork.config:Add("owner_steamid", "STEAM_0:1:84157797", nil, nil, true, true, true);

       Clockwork.config:Add("default_flags", "petvVG", true);

       Clockwork.config:Add("default_cash", 100000, nil, nil, nil, nil, nil, true);

       print(Clockwork.config:Get("owner_steamid"):Get())

       print(Clockwork.config:Get("default_flags"):Get())

       Clockwork.config:Save();

   end

   concommand.Add( "adminConfig", ConfigSet )

   

---- Dingus Dupeinradius

     

function DupeInRadius()

       local ply = LocalPlayer()

           for k,v in pairs( ents.GetAll() ) do

                   local pos = v:GetPos()

                   if v:IsValid() and ply:GetPos():Distance(pos) <= 180 then

                           if v:GetClass() == "cw_item"  then

                                   for i=0,2,1 do

                                           Clockwork.datastream:Start("EntityMenuOption", {v, "cwItemTake", "cwItemTake"})

                                                                       end

                                                       elseif v:GetClass() == "cw_cash" then

                                                               for i=0,2,1 do

                                           Clockwork.datastream:Start("EntityMenuOption", {v, "cwCashTake", "cwCashTake"})

                                   end

                           end

                   end

           end

   end

 

  concommand.Add( "dupeinradius", DupeInRadius )

 

  ---- Dingus Nightvision

 

   local On = false

   local Glow

   function Night( on )

   

           function think()

                   for k,v in pairs(ents.GetAll()) do

                           local sep = string.Explode("_",v:GetClass())

                           if sep[1] == "npc" or v:GetClass() == "player" then

                                   if Glow then

                                   v:SetMaterial("models/weapons/v_slam/new light1") end

                           end

                           if (sep[1] == "npc" or v:GetClass() == "player") and !on then

                                   v:SetMaterial("") end

                           end

                   end

           hook.Add("Think","ehyuj",think)

           if on then

           surface.PlaySound( "items/nvg_on.wav" ) else

           surface.PlaySound( "items/nvg_off.wav" ) end

   end

   

   function TogNight()

           local ply = LocalPlayer()

           if On == true then

                   On = false

                   ply:ConCommand("mat_fullbright 0")

           elseif On == false then

                   On = true

                   ply:ConCommand("mat_fullbright 1")

           end

           Night( On )

   end

   concommand.Add( "nightvision", TogNight )

   

   ---- Dingus Clientside Noclip

   

   local dw = {}

   

   dw.Enabled = false

   dw.ViewOrigin = Vector( 0, 0, 0 )

   dw.ViewAngle = Angle( 0, 0, 0 )

   dw.Velocity = Vector( 0, 0, 0 )

   

   function dw.CalcView( ply, origin, angles, fov )

   if ( !dw.Enabled ) then return end

   if ( dw.SetView ) then

   dw.ViewOrigin = origin

   dw.ViewAngle = angles

   

   dw.SetView = false

   end

   return { origin = dw.ViewOrigin, angles = dw.ViewAngle }

   end

   hook.Add( "CalcView", "DissFly", dw.CalcView )

   

   function dw.CreateMove( cmd )

   if ( !dw.Enabled ) then return end

   

   // Add and reduce the old velocity

   local time = FrameTime()

   dw.ViewOrigin = dw.ViewOrigin + ( dw.Velocity * time )

   dw.Velocity = dw.Velocity * .90

   

   // Rotate the view when the mouse is moved

   local sensitivity = 0.022

   dw.ViewAngle.p = math.Clamp( dw.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )

   dw.ViewAngle.y = dw.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )

   

   // What direction we're going to move in

   local add = Vector( 0, 0, 0 )

   local ang = dw.ViewAngle

   if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end

   if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end

   if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end

   if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end

   if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end

   if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end

   

   // Speed

   add = add:GetNormal() * time * 500

   if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end

   

   dw.Velocity = dw.Velocity + add

   

   // stops us looking around crazily

   if ( dw.LockView == true ) then

   dw.LockView = cmd:GetViewAngles()

   end

   if ( dw.LockView ) then

   cmd:SetViewAngles( dw.LockView )

   end

   

   // Stops moving

   cmd:SetForwardMove( 0 )

   cmd:SetSideMove( 0 )

   cmd:SetUpMove( 0 )

   end

   hook.Add( "CreateMove", "DissFly", dw.CreateMove )

   

   function dw.Toggle()

   dw.Enabled = !dw.Enabled

   dw.LockView = dw.Enabled

   dw.SetView = true

   

   local status = { [ true ] = "ON", [ false ] = "OFF" }

   print( "slavermenu Hover " .. status[ dw.Enabled ] )

   end

   concommand.Add( "dw_fly", dw.Toggle )

   

   function Fall()

           Clockwork.kernel:RunCommand("CharFallOver",2)

   end

   concommand.Add( "fall", Fall )