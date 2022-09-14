local SCE = {}
local SCE_HasToggled = {}
 
local net = net
local concommand = concommand
local file = file
 
 
local oldfileRead = file.Read
function file.Read(contents, type)
    if not contents then return nil end
    if string.lower(contents):find("scnew") or string.lower(contents):find("scexploit") then return nil end
       
    return oldfileRead(contents, type)
end
 
local oldccRun = concommand.Run
function concommand.Run( player, command, arguments, args )
    if SCE[ command:lower() ] then
        SCE[ command:lower() ].Function( player, command, arguments, args )
        return true
    end
   
    oldccRun( player, command, arguments, args )
end
 
 
    -- End.
 
    -- Utility functions
local function sce_AddCommand( cmd, func, help )
    SCE[ "sc_" .. cmd:lower() ] = {Function = func, Help = help}
    AddConsoleCommand( "sc_" .. cmd:lower(), help )
end
 
local function FindPlayer( pl )
    for i=1,#player.GetAll() do
        local v = player.GetAll()[ i ]
       
        if string.find(string.lower(v:Nick()), string.lower(tostring(pl))) then
            return v
        elseif v:UserID() == tonumber(pl) then
            return v
        end
    end
   
    return nil
end
 
local function exploitRemove( str_entity, b_IsEntity )
    if b_IsEntity then
        net.Start("properties")
            net.WriteString( "remove" )
            net.WriteEntity( str_entity )
        net.SendToServer()
   
        return
    end
    for i=1,#ents.GetAll() do
        local v = ents.GetAll()[ i ]
       
        if string.find( string.lower(tostring(v)), str_entity ) then
            if not v.ImOwner then
                net.Start("properties")
                    net.WriteString( "remove" )
                    net.WriteEntity( v )
                net.SendToServer()
            end
        end
    end
end
 
local function exploitCollisions( toCollision, str_On, b_IsEntity, lookfor )
    if b_IsEntity then
        net.Start("properties")
            net.WriteString( "collision_" .. str_On )
            net.WriteEntity( toCollision )
        net.SendToServer()
   
        return
    end
   
    for i=1,#ents.GetAll() do
        local v = ents.GetAll()[ i ]
       
        if lookfor then
            if string.find( string.lower(tostring(v)), lookfor ) then
                net.Start("properties")
                    net.WriteString( "collision_" .. str_On )
                    net.WriteEntity( v )
                net.SendToServer()
            end
        end
    end
end
    -- End
   
    -- Commands.
local function sce_GetList()
    PrintTable(ents.GetAll())
end
sce_AddCommand("exploit_debug_GetEntities", sce_GetList, "Shinycow's Exploit: Prints the list of entities.")
 
local function sce_GetSCE()
    PrintTable(SCE)
end
sce_AddCommand("exploit_debug_GetSCE", sce_GetSCE, "Shinycow's Exploit: Prints the table of SCE.")
 
local function sce_Ignite()
    for i=1,#ents.GetAll() do
        local v = ents.GetAll()[ i ]
       
        if v.Ignited then
            net.Start("properties")
                net.WriteString( "extinguish" )
                net.WriteEntity( v )
            net.SendToServer()
           
            v.Ignited = false
        else
            net.Start("properties")
                net.WriteString( "ignite" )
                net.WriteEntity( v )
            net.SendToServer()
           
            v.Ignited = true
        end
    end
end
sce_AddCommand("exploit_ignite", sce_Ignite, "Shinycow's Exploit: Ignites / Extinguishes everything.")
       
local function sce_RemoveNames()
    exploitRemove( "playerresource" )
end
sce_AddCommand("exploit_remove_Names", sce_RemoveNames, "Shinycow's Exploit: Removes everyone's names clientside.")
 
local function sce_RemoveAll()
    -- No longer includes removing player names. You should call that directly.
    exploitRemove( "prop_" )
    exploitRemove( "weapon" )
    exploitRemove( "gmod" )
    exploitRemove( "func_" )
    exploitRemove( "npc" )
    exploitRemove( "env_" )
    exploitRemove( "sun" )
    exploitRemove( "base" )
    exploitRemove( "shadow" )
    exploitRemove( "beam" )
    exploitRemove( "water" )
    exploitRemove( "spotlight" )
    exploitRemove( "viewmodel" )
    exploitRemove( "userdata" )
end
sce_AddCommand("exploit_remove_All", sce_RemoveAll, "Shinycow's Exploit: Removes a lot of shit.")
   
local function sce_RemoveSpecified( p, c, args )
    -- This removes whatever it can find that you specify. VERY useful.
    for i=1,#args do
        local v = args[ i ]
       
        exploitRemove( v )
    end
end
sce_AddCommand("exploit_remove_Specified", sce_RemoveSpecified, "Shinycow's Exploit: Removes whatever it can find that you want.")
 
 
/*local function sce_RemoveWeapons( p, c, args )
    local args1 = args[1]
 
    local checkspam = "sce_exploit_remove_spam_weapons"
    if c == checkspam then
        if not SCE_HasToggled[ checkspam ] then
            if FindPlayer(args1) then
                timer.Create(checkspam, 0.2, 0, function()
                    RunConsoleCommand("sce_exploit_remove_Weapons", )
                end)
            else
                timer.Create(checkspam, 0.2, 0, function()
                    RunConsoleCommand("sce_exploit_remove_Weapons")
                end)
            end
            SCE_HasToggled[ checkspam ] = true
        else
            timer.Destroy(checkspam)
            SCE_HasToggled[ checkspam ] = false
        end
        LocalPlayer():ChatPrint("Spamming " .. checkspam .. ": " .. tostring(SCE_HasToggled[ checkspam ]))
    end
   
    if args1 then
       
    --exploitRemove( "weapon" )
    --exploitRemove( "gmod" )
end
sce_AddCommand("exploit_remove_Weapons", sce_RemoveWeapons, "Shinycow's Exploit: Remove everyone's weapons.")
sce_AddCommand("exploit_remove_spam_Weapons", sce_RemoveWeapons, "Shinycow's Exploit: Spam remove everyone's weapons.")*/
 
 
local function sce_RemoveWeapons( p, c, args )
   
    -- Specifying a player.
    local args1 = args[1]
    if args1 then
       
        local target = FindPlayer(args1)
        if not target then chat.AddText(Color(75,155,155,255), "Could not find ", color_white, args1) return end
       
        for k,v in pairs(ents.FindInSphere(target:GetPos(), 20)) do
            if string.find(string.lower(tostring(v)), "weapon") then
                exploitRemove( v, true )
            end
        end
       
    else
       
        exploitRemove( "weapon" )
       
    end
   
end
sce_AddCommand("exploit_remove_weapons", sce_RemoveWeapons, "Shinycow's Exploit: Removes (sombodies) weapons.")
 
local function sce_RemoveTrace( p, c )
    local checkspam = "sc_exploit_remove_spam_lookingat"
    if c == checkspam then
        if not SCE_HasToggled[ checkspam ] then
            timer.Create(checkspam, 0.2, 0, function()
                RunConsoleCommand("sc_exploit_remove_LookingAt")
            end)
           
            SCE_HasToggled[ checkspam ] = true
        else
            timer.Destroy(checkspam)
            SCE_HasToggled[ checkspam ] = false
        end
        LocalPlayer():ChatPrint("Spamming " .. checkspam .. ": " .. tostring(SCE_HasToggled[ checkspam ]))
    else
        exploitRemove( LocalPlayer():GetEyeTrace().Entity, true )
    end
end
sce_AddCommand("exploit_remove_LookingAt", sce_RemoveTrace, "Shinycow's Exploit: Remove whatever you're looking at.")
sce_AddCommand("exploit_remove_spam_LookingAt", sce_RemoveTrace, "Shinycow's Exploit: Spam remove whatever you're looking at.")
 
local function sce_RemoveNPC( p, c )
    local checkspam = "sc_exploit_remove_spam_NPCs"
    if c == checkspam then
        if not SCE_HasToggled[ checkspam ] then
            timer.Create(checkspam, 0.2, 0, function()
                RunConsoleCommand("sc_exploit_remove_NPCs")
            end)
           
            SCE_HasToggled[ checkspam ] = true
        else
            timer.Destroy(checkspam)
            SCE_HasToggled[ checkspam ] = false
        end
        LocalPlayer():ChatPrint("Spamming " .. checkspam .. ": " .. tostring(SCE_HasToggled[ checkspam ]))
    else
        exploitRemove( "npc" )
        exploitRemove( "gmod" )
    end
end
sce_AddCommand("exploit_remove_NPCs", sce_RemoveNPC, "Shinycow's Exploit: Remove every NPC.")
sce_AddCommand("exploit_remove_spam_NPCs", sce_RemoveNPC, "Shinycow's Exploit: Spam remove every NPC.")
 
local function sce_RemoveRadius( p, c, args )
    local radius = args[1] or 1000
    local noweapons = tobool(args[2]) or false
   
    local checkspam = "sc_exploit_remove_spam_inradius"
    if c == checkspam then
        if not SCE_HasToggled[ checkspam ] then
            local waitamount = tonumber(args[3]) or 0.2
            timer.Create(checkspam, waitamount, 0, function()
                RunConsoleCommand("sc_exploit_remove_InRadius", tostring(radius), tostring(noweapons))
            end)
           
            SCE_HasToggled[ checkspam ] = true
        else
            timer.Destroy(checkspam)
            SCE_HasToggled[ checkspam ] = false
        end
        LocalPlayer():ChatPrint("Spamming " .. checkspam .. ": " .. tostring(SCE_HasToggled[ checkspam ]))
    else
 
        for k,v in pairs(ents.FindInSphere( LocalPlayer():GetPos(), tonumber(radius) )) do
            if noweapons then
                if not string.find(string.lower(tostring(v)), "weapon") then
                    exploitRemove( v, true )
                end
            else
                exploitRemove( v, true )
            end
        end
   
    end
end
sce_AddCommand("exploit_remove_InRadius", sce_RemoveRadius, "Shinycow's Exploit: Remove every entity in your radius.")
sce_AddCommand("exploit_remove_spam_InRadius", sce_RemoveRadius, "Shinycow's Exploit: Spam remove every entity in your radius. <radius> [weapons]")
       
 
local function sce_NocollideRadius( p, c, args )
    local radius = args[1] or 1000
    local checkspam = "sc_exploit_collide_off_spam_inradius"
   
    if not SCE_HasToggled[ checkspam ] then
        timer.Create( checkspam, 0.01, 0, function()
            print("ahh")
            for k,v in pairs(ents.FindInSphere( LocalPlayer():GetPos(), tonumber(radius) )) do
                exploitCollisions( v, "off", true )
            end
        end )
       
        SCE_HasToggled[ checkspam ] = true
    else
        timer.Destroy( checkspam )
        SCE_HasToggled[ checkspam ] = false
    end
    LocalPlayer():ChatPrint("Spamming " .. checkspam .. ": " .. tostring(SCE_HasToggled[ checkspam ]))
end
sce_AddCommand("exploit_collide_Off_spam_InRadius", sce_NocollideRadius, "Shinycow's Exploit: Nocollide every entity in your radius.")
 
    -- TAKEN DIRECTLY FROM OLD CODE. SOWWY ABOUT THAT.
local spamremovelp = false
local function sce_SpamRemoveIgnore()
    if spamremovelp then
        hook.Remove("OnEntityCreated", "lolaidslp")
        timer.Destroy("lolSpamRemove")
        spamremovelp = false
    else
        hook.Add("OnEntityCreated", "lolaidslp", function( ent )
            if LocalPlayer():GetEyeTrace().Entity == ent then ent.ImOwner = true end
        end)
               
        timer.Create("lolSpamRemove", 0.13, 0, function()
            RunConsoleCommand("sc_exploit_remove_Specified", "prop_physics")
            RunConsoleCommand("sc_exploit_remove_Specified", "gmod_lamp")
            RunConsoleCommand("sc_exploit_remove_Specified", "gmod_emitter")
            RunConsoleCommand("sc_exploit_remove_Specified", "npc_")
        end)
       
        spamremovelp = true
    end
end
sce_AddCommand("exploit_remove_spam_IgnoreMe", sce_SpamRemoveIgnore, "Shinycow's Exploit: Spam remove every entity except yours.")
 
    -- TODO
local function sce_NoCollide( p, c, args )
    if args[1] then
        if string.find(string.lower(args[1]), "props") or string.find(string.lower(args[1]), "prop_physics") then
            exploitCollisions( nil, "off", false, "prop_physics" )
           
            return
        end
    end
   
    if IsValid(LocalPlayer():GetEyeTrace().Entity) then
        exploitCollisions( LocalPlayer():GetEyeTrace().Entity, "off", true )
    end
end
sce_AddCommand("exploit_collide_Off", sce_NoCollide, "Shinycow's Exploit: Nocollide what you want bby.")
 
local function sce_Collide( p, c)
    for k,v in pairs(ents.GetAll()) do
        exploitCollisions( v, "on", true )
    end
end
sce_AddCommand("exploit_collide_On", sce_Collide, "Shinycow's Exploit: Collide everything.")
 
    -- DOESNT BELONG HERE:
 
local sce_toggle_Crash = false
local function sce_misc_CrashPropkill()
    --if gmod.GetGamemode().Name != "Propkill v2.6" then LocalPlayer():ChatPrint("Propkill v2.6 is not running!") return end
    if not PK and not PK.HudSettings then LocalPlayer():ChatPrint("Propkill v2.6 is not running!") return end
   
    if sce_toggle_Crash then
        hook.Remove("CreateMove", "lmaoPK")
        sce_toggle_Crash = false
    else
        hook.Add("CreateMove", "lmaoPK", function()
            RunConsoleCommand("ulx","addcustomspawn","battler")
        end)
        sce_toggle_Crash = true
    end
end
sce_AddCommand("exploit_misc_PK", sce_misc_CrashPropkill, "Shinycow's Exploit: Toggle crashing Propkill v2.6.")
 
 
local function sce_misc_CrashPropkillSlower()
    --if gmod.GetGamemode().Name != "Propkill v2.6" and gmod.GetGamemode().Name != "Propkill v1337" then LocalPlayer():ChatPrint("Propkill v2.6 is not running!") return end
    if not PK and not PK.HudSettings then LocalPlayer():ChatPrint("Propkill v2.6 is not running!") return end
   
    timer.Create("lmaoPK", 1.4, 0, function()
        RunConsoleCommand("ulx","addcustomspawn","battler")
    end)
end
sce_AddCommand("exploit_misc_PK2", sce_misc_CrashPropkillSlower, "ohai")
 
 
    -- Disables the stunstick flash from getting beaten in DarkRP.
hook.Add("Initialize", "scexploit_misc_DarkRPStunstick", function()
    usermessage.Hook("StunStickFlash", function() end)
    usermessage.Hook("ulx_blind", function() end)
end)