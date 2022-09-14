--[[


############################################################################################################
# ########   #######  ##    ## ##    ## ##     ##    ###     ######  ##    ##          ##     ##  #######  #
# ##     ## ##     ## ###   ##  ##  ##  ##     ##   ## ##   ##    ## ##   ##           ##     ## ##     ## #
# ##     ## ##     ## ####  ##   ####   ##     ##  ##   ##  ##       ##  ##            ##     ##        ## #
# ########  ##     ## ## ## ##    ##    ######### ##     ## ##       #####             ##     ##  #######  #
# ##        ##     ## ##  ####    ##    ##     ## ######### ##       ##  ##             ##   ##  ##        #
# ##        ##     ## ##   ###    ##    ##     ## ##     ## ##    ## ##   ##             ## ##   ##        #
# ##         #######  ##    ##    ##    ##     ## ##     ##  ######  ##    ##             ###    ######### #
############################################################################################################


____________________▄▄▄███████████████▄▄
__________________▅▀█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▄
_______________________▄▄▄█████▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓███▄▄
____________________▄██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓██▄_____▓▓
_________________▄█▒▒▓__▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓██▓___▓▓
______________▄█▒▒▒▒▒▓__▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓_______▓
____________▄█▒▒▒▒▒▒▒▓_▓___▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓_________▓
__________▄█▒▒▒▒▒▒▒▒▒▓______▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▓___________▓
_________██▒▒▒████▓▓▓▓▓____▓____▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓________▓____▓
________███▀▀██▓▓▓▓▓▓▓▓▓_▓_______▓▓▀▀▀▀▀▀██▓▓▓▓▓▓▓__________▓____▓█
______█▀___▄█▓▓▓▓▓▓▓▓▓▓▓▓________▓_______██▓▓▓▓▓▓▓▓▓__________▓___▓██
_________▄█▓▓▓▓▓▓▓▓█████▓▓______________██▓▓▓▓██▀▀▀▓__________▓___▓▓▓█
_______▄█▓▓▓▓▓▓███▓███▓▓__▓____________█▓██▀▀▀_________________▓___▓▒▓▓█
_____▄█▓▓▓▓▓███▒▒▓██▓██▓______________█▀▀__▓▓▓▓▓▓▓___________▓___▓▒▒▓▓█
____██▓▓▓███▒▒▒▒▓██▓▓██▓_______________▓▓▓▓██████▓▓▀______▓_____▓▒▒▒▓▓█
___█▓▓████▒▒▒▒▒▓██▓▓▒██▓____________▓▓███▒▒▓▓▓▓██▓_____________▓▒▒▒▒▓▓█
__█▓█▀_██▒▒▒▒▒▒▓██▓▒▒██▓__________▓▓██▒▒▒▒▓▓▓▓▓██▓▄▀_________▓▓▓▒▒▒▓▓█
_██____██▒▒▒▒▒▒▓██▒▒▓▓█▓▓________▓▓██▓▒▒▒▓▓▓▓▓▓██▓__________▓█▓▓▒▒▒▒▓█
▀_____██▒▒▒▒▒▒▒▓██▒▒▓▓█▓▓_______▓▓██▓▓▓▒▒▒▓▓▓▓██▓▄▄▀______▓_█▓▓▒▒▒▒▓▓█
_____██▒▒▒▒▒▒▒▒▓██▒▒▓▓█▓▓▓____▓▓██▓▓▓▓▒▒▒▒▓▓▓██▓____________█▓▓▒▒▒▒▒▓█
_____██▒▒▒▒▒▒▒▒▓██▒▒▒▓██████▓▓▓██▓▓▓▒▒▒▒▒▓▓▓██▓___________█▓▓▓▒▒▒▒▒▓▓█
____██▒▒▒▒▒▒▒▒▒▓██▒▓▓██▓▓▓▓▓████▓▓▓▒▒▒▒▒▓▓▓██▓___________█▓▓▓▒▒▒▒▒▒▓▓█
____█▒▒▒▒▒▒▒▒▒▒▒▓█▓▓▓█▓▓______▓▓█▓▓▒▒▒▒▒▓▓▓▓██▓___________█▓▓▓▓▒▒▒▒▒▓▓█
___█▒▒▒▒▒▒▒▒▒▒▒▓▓█▓▓██▓_______▓▓█▓▓▒▒▒▒▓▓▓▓██▓___________█▓▓▓▓█▒▒▒▒▒▓▓█
___█▒▒▒▒▒▒█▒▒▒▒▓▓▓▓▓▓__________▓▓█▓▒▒▒▒▓▓▓▓██▓___________█▓▓▓▓█▒▒▒▒▒█▓▓█
__█▒▒▒▒▒▒█▒▒▒▒▓▓▓▓____▄▄___▄___▓▓██▒▒▒▒▓▓███▓____________█▓▓▓██▒▒▒▒▒██▓█
__█▒▒▒▒▒██▒▒▒▓▓▓▓▓▓________█▐___▓▓████████▓▓____________█▓▓▓█_█▒█▒▒▒█_█▓█
__█▒▒▒██_█▒▒▒▓▓▓▓▓▓▓▓▓▄▄▄▀_▐____▓▓▓▓███▓▓_________▓▓▓▓█▓▓█_█▒▒█▒▒▒█__██
_█▒▒▒█___█▒▒▒▓▓▓▓▓▓▓▓▓▓_____▐________▓▓▓▓________▓▓▓___████___█▒▒█▒▒█____█
_█▒▒█____█▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▄▀_______________▓▓▓▓▓_____██______█▒▒██▒▒█____█
_█▒█______█▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓___________________█▒▒███▒█
_██_______█▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█____________________________█▒▒█_█▒█
_█_________█▒▒▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓█_____________________________█▒█___█▒█
____________█▒▓▓▓▓▓▓▓█▓▓▓▓▓██▓▓█____________________________█▒█_____██
____________█▒▓▓▓▓▓▓▓██▓▓▓█__███____________________________██_______█
_____________█▓▓▓▓▓▓▓█_█▓▓▓█___█____________________________█_________▀
______________█▓▓▓▓▓▓█__█▓▓▓█
______________█▓▓▓▓▓▓█___██▓█
_______________█▓▓▓▓▓█______██
________________█▓▓▓▓▓█_______█
_________________█▓▓▓▓█
__________________██▓▓▓█
____________________█▓▓▓█
_____________________██▓▓█
________________________██
__________________________█

This version of PonyHack aims that fixing the horrible mess I created in PonyHack v1, it also has a lot more features than v1 and a lot of stuff has been redone.
This is a generic hack that can be used on any gamemode and it's made to be used on servers that have sv_allowcslua set to 1. 
If you have any problems with this hack or just want to add me, feel free to do so: http://steamcommunity.com/id/MLP-FiM/


##     ##    ###    ########  ########  ##    ##    ##     ##    ###     ######  ##    ## #### ##    ##  ######   
##     ##   ## ##   ##     ## ##     ##  ##  ##     ##     ##   ## ##   ##    ## ##   ##   ##  ###   ## ##    ##  
##     ##  ##   ##  ##     ## ##     ##   ####      ##     ##  ##   ##  ##       ##  ##    ##  ####  ## ##        
######### ##     ## ########  ########     ##       ######### ##     ## ##       #####     ##  ## ## ## ##   #### 
##     ## ######### ##        ##           ##       ##     ## ######### ##       ##  ##    ##  ##  #### ##    ##  
##     ## ##     ## ##        ##           ##       ##     ## ##     ## ##    ## ##   ##   ##  ##   ### ##    ##  
##     ## ##     ## ##        ##           ##       ##     ## ##     ##  ######  ##    ## #### ##    ##  ######

]]--

local pony = {}
local vars = {}
local data = {
	version="Loading...",
	link="Loading...",
	info="Loading..."
}

if !detours then -- We'll eventually add more shit here...

	detours = {}

	detours.RunConsoleCommand = RunConsoleCommand
	detours.NetStart = net.Start

end

pony.logs = {}

function pony.log(txt, log_type)

	if !vars["more.log"] then 
		return 
	end

	table.insert( pony.logs,  log_type .. "->" .. txt )
	
	MsgC(Color(255,200,0,255), "[DETOUR] (" .. log_type .. ") ", Color(255,255,255,255), txt .. "\n")

end

function RunConsoleCommand(cmd,...)

	pony.log(cmd, "RunConsoleCommand")

	return detours.RunConsoleCommand(cmd,...)

end

function net.Start(name)

	pony.log(name, "net.Start")

end


pony.Nospread = false
pony.Spreads = {}
pony.detours = {} -- This should probably be removed since it's no longer being used.

pony.name = "PonyHack"
pony.version = "2.6.2"
pony.author = "Kawaii Hafnium"
pony.prefix = "[PonyHack]"

surface.CreateFont( "PonyFont", {
	font = "Arial",
	size = 15
} )

surface.CreateFont( "PonyFont_n", {
	font = "Arial",
	size = 30
} )

require("hook")

local LocalPlayer = LocalPlayer
local math = math
local draw = draw
local player = player
local render = render
local pairs = pairs
local cam = cam
local table = table
local RunConsoleCommand = RunConsoleCommand
local ents = ents
local ScrH = ScrH
local ScrW = ScrW
local tostring = tostring
local Color = Color
local Angle = Angle
local IsValid = IsValid
local Vector = Vector
local MASK_SHOT = MASK_SHOT
local IN_ATTACK = IN_ATTACK
local KEY_SPACE = KEY_SPACE
local KEY_E = KEY_E
local _R = debug.getregistry()
local me = LocalPlayer()
local attacking = false

-- Menu color
local CurColor = 3
local ForColors = {Color(150,0,255,255),
	Color(200,0,0,255),
	Color(0,150,255,255),
	Color(255,255,255,255),
	Color(255,0,80,255),
	Color(0,200,0,255),
	Color(0,255,255,255),
	Color(255,200,0,255)
}

local BgColor = Color( 20, 20, 20, 255 )

--[[
Name: 
	Hack functions
Description: 
	A bunch of functions that the hack utilizes, every function should be inside the 'pony' table.
]]--

local tempr = table.Copy( _R )
_R.Entity.FireBullets = function( ent, bullet )
	if not pony.Spreads[me:GetActiveWeapon():GetClass()] || pony.Spreads[me:GetActiveWeapon():GetClass()] != bullet.Spread then
		pony.Spreads[me:GetActiveWeapon():GetClass()] = bullet.Spread
	end
	return tempr.Entity.FireBullets( ent, bullet )
end

function pony.print(txt)
	return MsgC( Color(255,0,0,255), pony.prefix, Color(255,255,255,255), " " .. txt .. "\n")
end

function pony.drawtext(txt,x,y,col)

	if !col then
		col = Color(255,255,255,255)
	end


	draw.SimpleTextOutlined( txt, "PonyFont", x, y, col, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, Color(0,0,0,255) )
end


function pony.distance(v1,v2)
	v1 = v1:LengthSqr()
	v2 = v2:LengthSqr()

	local distance = math.Round( v1 - v2 )
	distance = distance * 0.001

	if distance < 0 then
		distance = -distance
	end

	return distance

end

local old_angs = nil
function pony.getfakeangle()

	if old_angs != nil then
		return old_angs
	end

	return Angle(me:EyeAngles().p,me:EyeAngles().y, me:EyeAngles().r)

end


function pony.isvisible(target) -- This needs to be improved in the future

	local target_head = target:LookupAttachment("eyes")
	local headpos
	
	if target_head and target:GetAttachment(target_head) then
		headpos = target:GetAttachment(target_head).Pos
	end

	local StartPos = me:GetShootPos()

	local tr = {}
	tr.start = StartPos
	tr.endpos = headpos or (target:GetPos() + Vector(0,0,16)) 
	tr.mask = MASK_SHOT
	tr.filter = function( ent ) 
		return !ent:IsPlayer()
	end 
 
	local trace = util.TraceLine( tr )

	if trace.Hit then return false else return true end

end


function pony.addhook(name,name2,func)
	local hidden_name = util.CRC( name2 )
	hook.Add(name,hidden_name,func)
end


function pony.detour(name,func,func2) -- I should probably removed this if I have no intentions to using it.
	pony.detours[name] = func
	func = func2
end

function pony.dormant(ent)

	if #player.GetAll() >= 15 then -- Just incase things get laggy
		return ent:IsDormant()
	else
		return false
	end

end

local messages = {}
function pony.msg(txt, msgtime)

	for k,v in pairs(messages) do
		if IsValid(v) then
			v:Remove()
		end
	end

	surface.PlaySound("Friends/message.wav")
	local msgbox = vgui.Create("DFrame")
	msgbox:SetSize(300,50)
	msgbox:SetPos(ScrW() - 350, 50)
	msgbox:SetTitle("PonyHack Notification: " .. msgtime)
	msgbox:SetDraggable(false)
	function msgbox.Paint()
		draw.RoundedBox(4, 0, 0, msgbox:GetWide(), msgbox:GetTall(), Color(0,0,0,255))
		pony.drawtext(txt, 10, msgbox:GetTall()*0.5)
	end

	surface.SetFont("PonyFont")
	local txt_size = surface.GetTextSize(txt)
	msgbox:SetWide(txt_size + 20)
	msgbox:SetPos(ScrW() - txt_size - 30, 50)

	table.insert(messages,msgbox)

	timer.Create("msgtime", 1, 0, function()
		
		msgtime = msgtime - 1
		
		if IsValid(msgbox) then
			msgbox:SetTitle("PonyHack Notification: " .. msgtime)
		end

		if msgtime <= 0 then

			if IsValid(msgbox) then
				msgbox:Remove()
			end

			timer.Destroy("msgtime")
		end

	end)


end

function pony.closest(ents)

	local ent_distances = {}

	for i = 1, #ents do

		v = ents[i]
		ent_distances[i] = pony.distance( me:GetPos(), v:GetPos() )
		i = i+1

	end

	local closest = math.min( unpack( ent_distances ) )

	for i = 1, #ent_distances do

		v = ent_distances[i]

		if closest == v then
			return ents[i]
		end

		i = i+1

	end

	return nil

end

function pony.RetreiveUpdate()

	--[[
	Had to remove the updater for MPGH
	]]--

	data.version = "N/A"
	data.link = "N/A"
	data.info = "N/A"


end

function pony.attack(cmd)

	local wep = me:GetActiveWeapon()
	if IsValid(wep) and wep.Primary and (wep.Primary.Automatic == true) then
		cmd:SetButtons( IN_ATTACK )
		attacking = true
	else
		print(attacking)
		if attacking then
			cmd:SetButtons(0)
			attacking = false
		else
			cmd:SetButtons( IN_ATTACK )
			attacking = true
		end
	end

end

--[[
Name: 
	PonyVars
Description: 
	Variables that the hack uses, these variables can be set with pony.setvar and retreived with pony.getvar.
]]--

vars["esp.distance"] = 5000
vars["esp.players"] = false
vars["esp.entity"] = false
vars["esp.ents"] = {"money_printer", "spawned_money", "spawned_shipment"}
vars["esp.staff"] = false
vars["esp.crosshair"] = false

vars["aimbot.enabled"] = false
vars["aimbot.limb"] = "eyes" -- Unused var, not sure why it's still here, maybe I'll use it.
vars["aimbot.silent"] = false
vars["aimbot.friends"] = false
vars["aimbot.babygod"] = false
vars["aimbot.noclip"] = false
vars["aimbot.team"] = false
vars["aimbot.rage"] = false
vars["aimbot.nospread"] = false

vars["misc.bhop"] = false
vars["misc.fastshoot"] = false
vars["misc.dancer"] = false
vars["misc.offline"] = false
vars["misc.ezpk"] = false

--[[
Name: 
	Hooks
Description: 
	The hacks themselves
]]--


pony.addhook("HUDPaint", "player.wallhack", function()

	if !vars["esp.players"] then
		return
	end

	for _,v in pairs( player.GetAll() ) do

		if v != me and !pony.dormant(v) and v:Alive() then


			cam.Start3D()

				cam.IgnoreZ(true)
				render.MaterialOverride(Material("models/debug/debugwhite"))
				render.SuppressEngineLighting( true )

				local col = team.GetColor( v:Team() )

				render.SetColorModulation( col.r/255, col.g/255, col.b/255 )
					v:DrawModel()
				render.SetColorModulation( 1, 1, 1 )
				
				render.SuppressEngineLighting( false )
				render.MaterialOverride(0)
				cam.IgnoreZ(false)

			cam.End3D()


			local posy = v:LocalToWorld( v:OBBCenter() ):ToScreen() -- I wanted it to be perfectly in the center ^.^

			local name = v:Nick() or "N/A"
			local health = v:Health() or 0
			local weapon = v:GetActiveWeapon()
			local rank = v:GetUserGroup() or "N/A"

			if weapon and weapon.GetPrintName then
				weapon = weapon:GetPrintName() or "N/A"
			else
				weapon = "N/A"
			end

			surface.SetFont("PonyFont")
			local x,y = surface.GetTextSize("X")

			posy.y = posy.y - y*2

			pony.drawtext("N: " .. name, posy.x,posy.y)
			pony.drawtext("H: " .. health, posy.x,posy.y + y)
			pony.drawtext("W: " .. weapon, posy.x,posy.y + (y*2))
			pony.drawtext("R: " .. rank, posy.x,posy.y + (y*3))

			if health > 100 then
				health = 100
			end

			if health < 0 then
				health = 0
			end

			local healthbar = y*4
			local width = 5

			draw.RoundedBox(0, posy.x - width - 5 - 2, posy.y - 2, width + 4, healthbar + 4, Color(0, 0, 0, 255) )
			draw.RoundedBox(0, posy.x - width - 5, posy.y, width, healthbar * 0.01 * health, Color(0, 200, 0, 200) )

		end 

	end


end)


pony.addhook("HUDPaint", "wallhack.entities", function()

	if !vars["esp.entity"] then
		return
	end

	for k,v in pairs(ents.GetAll()) do

		if table.HasValue(vars["esp.ents"], v:GetClass()) and ( pony.distance( me:GetPos(), v:GetPos() ) <= vars["esp.distance"] ) and !v:IsDormant() then

			surface.SetFont("PonyFont")
			local class = v:GetClass()
			local classize = surface.GetTextSize(class)
			local posy = v:GetPos():ToScreen()

			cam.Start3D()
				cam.IgnoreZ(true)
				render.MaterialOverride(Material("models/debug/debugwhite"))
				render.SuppressEngineLighting( true )

				local col = ForColors[CurColor]

				render.SetColorModulation( col.r/255, col.g/255, col.b/255 )
					v:DrawModel()
				render.SetColorModulation( 1, 1, 1 )
				
				render.SuppressEngineLighting( false )
				render.MaterialOverride(0)
				cam.IgnoreZ(false)

			cam.End3D()

			pony.drawtext(class, posy.x - classize*0.5,posy.y)

		end

	end

end)

local safegroups = { -- Groups that shouldn't be considered as 'staff'
	"user",
	"default",
	"vip",
	"member",
	"regular"	
}

pony.addhook("HUDPaint", "wallhack.staff", function()

	if !vars["esp.staff"] then
		return
	end

	local staffs = 0

	for k,v in pairs(player.GetAll()) do

		if !table.HasValue(safegroups, v:GetUserGroup()) then
			staffs = staffs + 1
		end

	end

	pony.drawtext("Possible staff members online: " .. tostring( staffs ), 5,5)

end)

pony.addhook("HUDPaint", "wallhack.crosshair", function()

	if !vars["esp.crosshair"] then
		return
	end

	local x = ScrW()*0.5
	local y = ScrH()*0.5

	surface.SetDrawColor( ForColors[CurColor] )
 
	
	local wep = me:GetActiveWeapon()
	local gapx

	if wep and wep.Primary and wep.Primary.Spread then
		gap = wep.Primary.Spread * (x)
	else
		gap = 5
	end

	local length = gap + 20

	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )

	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )


end)

local target = nil
pony.addhook("CreateMove", "aimbot", function(cmd)

	local wep = LocalPlayer():GetActiveWeapon()

	if attacking and IsValid(wep) and wep.Primary and wep.Primary.Automatic then
		cmd:SetButtons(0)
		attacking = false
	end

	if !vars["aimbot.enabled"] then
		target = nil
		return
	end


	if old_angs then

		if vars["aimbot.silent"] then
			cmd:SetViewAngles(old_angs)
		end

		old_angs = nil

		if vars["aimbot.silent"] then
			cmd:ClearButtons()
			return
		end

	end

	if !IsValid(target) or !target:Alive() or !pony.isvisible(target) then 

		local possible_targets = {}

		for i = 1, #player.GetAll() do

			v = player.GetAll()[i]
			i = i+1

			if v != me and pony.isvisible(v) and !v:IsDormant() and v:Alive() then

				if (vars["aimbot.friends"] and v:GetFriendStatus() == "friend") or 
					(vars["aimbot.babygod"] and v:GetColor().a != 255) or 
					(vars["aimbot.noclip"] and v:GetMoveType() == MOVETYPE_NOCLIP) or 
					(vars["aimbot.team"] and v:Team() == me:Team()) then
				else

					table.insert(possible_targets, v)

				end

			end


		end

		local ent = pony.closest(possible_targets)

		if not IsValid(ent) then
			return
		end

		target = ent

	end

	if cmd:KeyDown( IN_ATTACK ) or vars["aimbot.rage"] then
		
		old_angs = cmd:GetViewAngles()

		local new_angs = ( target:GetBonePosition( target:LookupBone("ValveBiped.Bip01_Head1") ) - me:GetShootPos() ):Angle()

		target:SetAnimation( 0 )

		if pony.Nospread and vars["more.nospread"] then
		
			if !IsValid(me:GetActiveWeapon()) or !pony.Spreads[ me:GetActiveWeapon():GetClass() ] then
				local angle = ( target:GetAttachment( target:LookupAttachment( vars["aimbot.limb"]  ) ).Pos - me:GetShootPos() ):Angle()
				cmd:SetViewAngles( angle )
			else
				local angle = ( target:GetAttachment( target:LookupAttachment( vars["aimbot.limb"]  ) ).Pos - me:GetShootPos() ):Angle()
				angle = DS_manipulateShot(DS_md5PseudoRandom(cmd:CommandNumber()), angle:Forward(), Vector(-pony.Spreads[me:GetActiveWeapon():GetClass()].x, -pony.Spreads[me:GetActiveWeapon():GetClass()].y, 0)):Angle();
				cmd:SetViewAngles( angle )
			end
		else
			local angle = ( target:GetAttachment( target:LookupAttachment( vars["aimbot.limb"]  ) ).Pos - me:GetShootPos() ):Angle()
			cmd:SetViewAngles( angle )
		end
		

		-- If it wasn't for willox, I'd be struggling on this for hours ^.^

		local ang = new_angs - pony.getfakeangle()

		local MoveSpeed = 10

		if !input.IsKeyDown( KEY_W ) then
			MoveSpeed = 0
		end

		if input.IsKeyDown( KEY_S ) then
			MoveSpeed = -10
		end

		cmd:SetForwardMove( (ang:Forward().x*100) * MoveSpeed )
        cmd:SetSideMove( (ang:Forward().y*100) * MoveSpeed )   

		if vars["aimbot.rage"] then
			pony.attack(cmd)
		end

	end



end)

pony.addhook("Think", "norecoil", function()

	if !vars["more.norecoil"] then return end

	local weapon = me:GetActiveWeapon()

	if !IsValid(weapon) then
		return
	end

	if weapon.Primary then

		if weapon.Primary.Recoil then
			weapon.Primary.Recoil = 0
		end

		if weapon.Primary.KickUp then
			weapon.Primary.KickUp = 0
			weapon.Primary.KickDown = 0
			weapon.Primary.KickHorizontal = 0
		end

	end


end)

pony.addhook("CalcView", "fakeview", function( ply, pos, ang, fov, nearZ, farZ )

	local view = {}

	view.origin = pos
    view.angles = pony.getfakeangle()
    view.fov = fov

    return view

end)

pony.addhook("CalcViewModelView", "fakeview_weapon", function( wep, vm, oldPos, oldAng, pos, ang )

	return pos, pony.getfakeangle()

end)

pony.addhook("CreateMove", "bhop", function(cmd)

	if !vars["misc.bhop"] then return end

	if me:IsOnGround() and input.IsKeyDown( KEY_SPACE ) then
		RunConsoleCommand("+jump")
	else
		RunConsoleCommand("-jump")
	end

end)

pony.addhook("CreateMove", "ezpk", function(cmd)

	if !vars["misc.ezpk"] then return end

	if input.IsKeyDown( KEY_E ) then
		cmd:SetMouseWheel(1)
	end

end)

pony.addhook("CreateMove", "dancer", function()

	if !vars["misc.dancer"] then return end

	RunConsoleCommand("act","dance")

end)

local attacking = false
pony.addhook("CreateMove", "fastshoot", function(cmd)

	if !vars["misc.fastshoot"] then return end

	if !input.IsMouseDown( MOUSE_LEFT ) then return end

	attacking = !attacking

	if attacking then
		cmd:SetButtons(IN_ATTACK)
	else
		cmd:SetButtons(0)
	end


end)

--[[
Name: 
	PonyMenu
Description: 
	The hack's menu, don't be surprised if you don't understand the menu's code... It's extremely messy
]]--

function pony.menu_logs()

	local ForColor = ForColors[CurColor]

	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(512,512)
	backpanel:MakePopup()
	backpanel:SetDraggable(false)
	backpanel:SetTitle("Logs...")
	backpanel:Center()

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	local logger = vgui.Create("DTextEntry", backpanel)
	logger:SetSize(backpanel:GetWide()-10, backpanel:GetTall()-27 - 5)
	logger:SetMultiline(true)
	logger:SetPos(5,22+5)

	local txt = ""
	for k,v in pairs(pony.logs) do
		txt = txt .. v .. "\n"
	end

	logger:SetText(txt)

end

function pony.menu_runstring()

	local ForColor = ForColors[CurColor]

	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(512,512)
	backpanel:MakePopup()
	backpanel:SetDraggable(false)
	backpanel:SetTitle("Run code...")
	backpanel:Center()

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	local text = vgui.Create( "DTextEntry", backpanel )
	text:SetPos(5,22 + 5)
	text:SetWide(backpanel:GetWide()-10)
	text:SetTall( backpanel:GetTall() - 27 - 30 )
	text:SetMultiline(true)


	local function btn_paint2(but)
	
		function but.OnCursorEntered()
			but.hover = true
			but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				but:SetTextColor(BgColor)
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			end

		end

	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize( text:GetWide() , 25 )
	but:SetPos(5, backpanel:GetTall() - 30 )
	but:SetText("Run code ->")
	btn_paint2(but)
	function but.DoClick()
		RunString( text:GetValue() )
	end

end

function pony.menu_more_options()

	local ForColor = ForColors[CurColor]

	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(256,10 + 35 + 35 + 35 + 35 + 22 + 35)
	backpanel:MakePopup()
	backpanel:SetDraggable(false)
	backpanel:SetTitle("More options...")
	backpanel:SetPos(ScrW()/2 - 512 - 5, ScrH()/2 - (10+35+35+35+35+22+35)/2 )

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	local function btn_paint(but)
	
		function but.OnCursorEntered()
			but.hover = true
			//but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			//but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, 25, 25, ForColor)
			draw.RoundedBox(0, 1, 1, 25 - 2, 25 - 2, BgColor)

			if but.hover then
				draw.RoundedBox(0, 0, 0, 25, 25, ForColor)
			end

			if vars[but.var] then
				draw.RoundedBox(0, 0, 0, 25, 25, Color( ForColor.r, ForColor.g, ForColor.b, 100 ))
			end

		end

	end

	local function btn_paint2(but)
	
		function but.OnCursorEntered()
			but.hover = true
			but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				but:SetTextColor(BgColor)
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			end

		end

	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize(backpanel:GetWide() - 10, 30)
	but:SetPos(5, 22 + 10)
	but:SetText("No recoil")
	but.var = "more.norecoil"
	btn_paint(but)
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize(backpanel:GetWide() - 10, 30)
	but:SetPos(5, 22 + 10 + 30 + 5)
	but:SetText("No spread")
	but.var = "more.nospread"
	btn_paint(but)
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize(backpanel:GetWide() - 10, 30)
	but:SetPos(5, 22 + 10 + 35 + 35)
	but:SetText("Log data")
	but.var = "more.log"
	btn_paint(but)
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize(backpanel:GetWide() - 10, 30)
	but:SetPos(5, 22 + 10 + 35 + 35 + 35)
	but:SetText("View logs...")
	btn_paint2(but)
	function but.DoClick()
		pony.menu_logs()
	end

	local but = vgui.Create("DButton", backpanel)
	but:SetSize(backpanel:GetWide() - 10, 30)
	but:SetPos(5, 22 + 10 + 35 + 35 + 35 + 35)
	but:SetText("Run code...")
	btn_paint2(but)
	function but.DoClick()
		pony.menu_runstring()
	end




end

--[[
function pony.kawaii_srouce_banner()

	local ForColor = ForColors[CurColor]

	local function btn_paint(but)
	
		function but.OnCursorEntered()
			but.hover = true
			but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				but:SetTextColor(BgColor)
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			end

		end

	end

	local function view_paint(view)

		function view.Paint()
			draw.RoundedBox(0, 0, 0, view:GetWide(), view:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, view:GetWide() - 2, view:GetTall() - 2, BgColor)
		end

	end


	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(512,256)
	backpanel:MakePopup()
	backpanel:SetDraggable(false)
	backpanel:SetTitle("Kawaii Source Banner - Use the full banner at ****")

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	local textbox = vgui.Create("DTextEntry", backpanel)
	textbox:SetWide(500)
	textbox:SetPos(6,22 + 10)
	textbox:SetText("Enter server's IP address...")

	local but = vgui.Create("DButton", backpanel)
	but:SetWide(500)
	but:SetPos(6,22 + textbox:GetTall() + 20)
	but:SetText("Generate Link ->")
	btn_paint(but)

	local linkbox = vgui.Create("DTextEntry", backpanel)
	linkbox:SetWide(500)
	linkbox:SetPos(6, 52 + but:GetTall() + textbox:GetTall())
	linkbox:SetText("Link will appear here...")

	backpanel:SetTall(textbox:GetTall() + 20 + but:GetTall() + 10 + 22 + linkbox:GetTall() + 10)
	backpanel:Center()

	function but.DoClick()

		linkbox:SetText("Generating link...")

		local link;
		local ip = **** .. textbox:GetText()

		http.Fetch( ip, 
			function( body, len, headers, code ) 
				linkbox:SetText(body)
			end, 

			function()
				linkbox:SetText("Error, unable to generate link for ip: " .. textbox:GetText() .. "!")
			end
		)

	end


end
--]]

function pony.menu_entitylist()

	local ForColor = ForColors[CurColor]

	local function btn_paint(but)
	
		function but.OnCursorEntered()
			but.hover = true
			but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				but:SetTextColor(BgColor)
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			end

		end

	end

	local function view_paint(view)

		function view.Paint()
			draw.RoundedBox(0, 0, 0, view:GetWide(), view:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, view:GetWide() - 2, view:GetTall() - 2, BgColor)
		end

	end


	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(ScrW()/2,ScrH()/2)
	backpanel:Center()
	backpanel:MakePopup()
	backpanel:SetDraggable(false)
	backpanel:SetTitle("Entity list")

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	local view1 = vgui.Create("DListView", backpanel)
	view1:SetPos(5,30)
	view1:SetSize(backpanel:GetWide()/2 - 30, backpanel:GetTall()-35)
	local view = view1:AddColumn("Not on ESP")
	view1:SetMultiSelect( false )

	view_paint(view1)

	local entities = {}
	for k,v in pairs(ents.GetAll()) do
		local class = v:GetClass()
		if !table.HasValue(entities,class) then
			table.insert(entities,class)
			view1:AddLine(class)
		end
	end

	for k,v in pairs(view1:GetLines()) do
		function v.Paint()
			local val = v:GetValue()
			draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, BgColor)
			v.Columns[1]:SetTextColor(ForColor)

			if v:IsSelected() then
				draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, ForColor)
				v.Columns[1]:SetTextColor(BgColor)
			end

		end
	end

	function view.Header.Paint()
		draw.RoundedBox(0, 0, 0, view.Header:GetWide(), view.Header:GetTall(), ForColor)
		draw.RoundedBox(0, 1, 1, view.Header:GetWide() - 2, view.Header:GetTall() - 2, BgColor)
		view.Header:SetTextColor(ForColor)
	end

	local view2 = vgui.Create("DListView", backpanel)
	view2:SetPos(backpanel:GetWide() - view1:GetWide() - 5,30)
	view2:SetSize(backpanel:GetWide()/2 - 30, backpanel:GetTall()-35)
	view2:SetMultiSelect( false )
	local view = view2:AddColumn("On ESP")
	for k,v in pairs(vars["esp.ents"]) do
		view2:AddLine(v)
	end

	view_paint(view2)

	for k,v in pairs(view2:GetLines()) do
		function v.Paint()
			local val = v:GetValue()
			draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, BgColor)
			v.Columns[1]:SetTextColor(ForColor)

			if v:IsSelected() then
				draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, ForColor)
				v.Columns[1]:SetTextColor(BgColor)
			end

		end
	end

	local function refresh()

		if IsValid(view2) then
			view2:Clear()
			for k,v in pairs(vars["esp.ents"]) do
				view2:AddLine(v)
			end
		end

		entities = {}

		if IsValid(view1) then
			view1:Clear()

			for k,v in pairs(ents.GetAll()) do
				local class = v:GetClass()
			
				if !table.HasValue(entities,class) then
					table.insert(entities,class)
					view1:AddLine(class)
				end
			
			end

		end


		for k,v in pairs(view2:GetLines()) do
			function v.Paint()
				local val = v:GetValue()
				draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, BgColor)
				v.Columns[1]:SetTextColor(ForColor)

				if v:IsSelected() then
					draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, ForColor)
					v.Columns[1]:SetTextColor(BgColor)
				end

			end
		end

		for k,v in pairs(view1:GetLines()) do
			function v.Paint()
				local val = v:GetValue()
				draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, BgColor)
				v.Columns[1]:SetTextColor(ForColor)

				if v:IsSelected() then
					draw.RoundedBox(0, 1, 1, v:GetWide() - 2, v:GetTall() - 2, ForColor)
					v.Columns[1]:SetTextColor(BgColor)
				end

			end
		end


	end

	function view.Header.Paint()
		draw.RoundedBox(0, 0, 0, view.Header:GetWide(), view.Header:GetTall(), ForColor)
		draw.RoundedBox(0, 1, 1, view.Header:GetWide() - 2, view.Header:GetTall() - 2, BgColor)
		view.Header:SetTextColor(ForColor)
	end

	local but = vgui.Create("DButton", backpanel)
	but:SetPos(view1:GetWide() + 10, backpanel:GetTall()/2 - 10)
	but:SetSize(40,20)
	but:SetText("->")
	btn_paint(but)
	function but.DoClick()
		local class = view1:GetSelected()[1].Columns[1]:GetValue() -- Something tells me I'm overcomplicating it ^.^
		print(class)

		if !table.HasValue(vars["esp.ents"], class) then
			table.insert(vars["esp.ents"],class)
		end

		refresh()

	end

	local but = vgui.Create("DButton", backpanel)
	but:SetPos(view1:GetWide() + 10, backpanel:GetTall()/2 + 15)
	but:SetSize(40,20)
	but:SetText("<-")
	btn_paint(but)
	function but.DoClick()
		local class = view2:GetSelected()[1].Columns[1]:GetValue()

		if table.HasValue(vars["esp.ents"], class) then
			table.RemoveByValue(vars["esp.ents"],class)
		end

		refresh()

	end

end

function pony.menu()

	local x,y = ScrW()/2 - 256, ScrH()/2 - 247/2 - 30

	local ForColor = ForColors[CurColor]

	local layouts = {} -- This will contain all the layouts for the main frame.

	local backpanel = vgui.Create("DFrame")
	backpanel:SetSize(512,22)
	backpanel:SetPos(-512,ScrH()/2 - 247/2 - 30)
	backpanel:MakePopup()
	backpanel:SetDraggable(0)
	backpanel:SetTitle(pony.name .. " " .. pony.version .. " by " .. pony.author)

	backpanel:MoveTo( x, y, 0.4, 0, 1)
	backpanel:SizeTo( 512, 247 + 55	, 0.4, 0.5, 1)

	function backpanel.Paint()
		draw.RoundedBox(2, 0, 0, backpanel:GetWide(), backpanel:GetTall(), ForColor)
		draw.RoundedBox(2, 1, 1, backpanel:GetWide() - 2, backpanel:GetTall() - 2, BgColor)
		draw.RoundedBox(0, 0, 0, backpanel:GetWide(), 22, ForColor)
	end

	function backpanel.Think()
		ForColor = ForColors[CurColor]
	end

	function pony.button()
		local but = vgui.Create("DButton", backpanel)
		but:SetSize(0,0)
		but:SetPos(0,0)
		but.hover = false

		function but.OnCursorEntered()
			but.hover = true
		end

		function but.OnCursorExited()
			but.hover = false
		end

		function but.Paint()

			but:SetTextColor(ForColor)

			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
				but:SetTextColor(BgColor)
			end

		end

		return but
	end

	local mainframe = vgui.Create( "DPanel", backpanel )
	mainframe:SetPos( 110, 27 ) 
	mainframe:SetSize( backpanel:GetWide() - 110 - 5, 215 )
	function mainframe.Paint()
		draw.RoundedBox(0, 0, 0, mainframe:GetWide(), mainframe:GetTall(), ForColor)
		draw.RoundedBox(0, 1, 1, mainframe:GetWide() - 2, mainframe:GetTall() - 2, BgColor)
	end

	local function ClearMainframe() -- Clear all elements from the main frame
		for k,v in pairs(layouts) do
			for _,v in pairs(layouts[k]) do
				v:Remove()
			end
		end
	end

	local function AddFrameItem(frame,element)
		e = vgui.Create(element, mainframe)
		table.insert(layouts[frame],e)
		return e
	end


	--[[
		Isn't this menu simply devine? awwwww yeahhhhhh...
	]]--

	function btn_paint(but)
		function but.OnCursorEntered()
			but.hover = true
			//but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			//but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, 25, 25, ForColor)
			draw.RoundedBox(0, 1, 1, 25 - 2, 25 - 2, BgColor)

			if but.hover then
				draw.RoundedBox(0, 0, 0, 25, 25, ForColor)
			end

			if vars[but.var] then
				draw.RoundedBox(0, 0, 0, 25, 25, Color( ForColor.r, ForColor.g, ForColor.b, 100 ))
			end

		end

	end

	function btn_paint2(but)
	
		function but.OnCursorEntered()
			but.hover = true
			but:SetTextColor(BgColor)
		end

		function but.OnCursorExited()
			but.hover = false
			but:SetTextColor(ForColor)
		end

		function but.Paint()
			but:SetTextColor(ForColor)
			draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, but:GetWide() - 2, but:GetTall() - 2, BgColor)

			if but.hover then
				but:SetTextColor(BgColor)
				draw.RoundedBox(0, 0, 0, but:GetWide(), but:GetTall(), ForColor)
			end

		end

	end

	local but = pony.button()
	but:SetSize( backpanel:GetWide() - 10, 50 )
	but:SetPos( 5 , 256 - 10 )
	but:SetText("More options ...")
	function but.DoClick()
		pony.menu_more_options()
	end

	local but = pony.button()
	but:SetSize(100,50)
	but:SetPos(5,27)
	but:SetText("Aimbot ->")
	layouts["aimbot"] = {}
	function but.DoClick()

	ClearMainframe()

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,5)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Aimbot enabled")
	but.var = "aimbot.enabled"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,35)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Silent aim")
	but.var = "aimbot.silent"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,65)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Ignore steam friends")
	but.var = "aimbot.friends"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,95)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Ignore baby godmode")
	but.var = "aimbot.babygod"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,125)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Ignore players in noclip")
	but.var = "aimbot.noclip"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,155)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Ignore players in same team")
	but.var = "aimbot.team"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	local but = AddFrameItem("aimbot", "DButton")
	but:SetPos(10,155 + 30)
	but:SetSize(mainframe:GetWide() - 20, 30)
	but:SetText("Rage mode")
	but.var = "aimbot.rage"
	function but.DoClick()
		vars[but.var] = !vars[but.var]
	end

	function but.Paint()
		btn_paint(but)
	end

	end

	local but = pony.button()
	but:SetSize(100,50)
	but:SetPos(5,27 + 55)
	but:SetText("Visual ->")
	layouts["visual"] = {}
	function but.DoClick()

		ClearMainframe()

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Wallhack")
		but.var = "esp.players"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10 + 30)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Entity finder")
		but.var = "esp.entity"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10 + 60)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Show crosshair")
		but.var = "esp.crosshair"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10 + 90)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Staff counter")
		but.var = "esp.staff"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10 + 130)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Entity list")
		function but.DoClick()
			pony.menu_entitylist()
		end

		function but.Paint()
			btn_paint2(but)
		end

		local but = AddFrameItem("visual", "DButton")
		but:SetPos(10,10 + 165)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Menu color")

		function but.Paint()
			btn_paint2(but)
		end

		function but.DoClick()
			
			if CurColor >= #ForColors then
				CurColor = 1
			else
				CurColor = CurColor + 1
			end

		end

	end


	local but = pony.button()
	but:SetSize(100,50)
	but:SetPos(5,27 + 55 + 55)
	but:SetText("Misc ->")
	layouts["misc"] = {}
	function but.DoClick()
		ClearMainframe()

		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Auto bhop")
		but.var = "misc.bhop"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end


		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10 + 30)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Autofire")
		but.var = "misc.fastshoot"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10 + 30 + 30)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Dance spam")
		but.var = "misc.dancer"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10 + 30 + 30 + 30)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Easy propkill")
		but.var = "misc.ezpk"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10 + 30 + 30 + 30 + 30)
		but:SetSize(mainframe:GetWide() - 20, 30)
		but:SetText("Offline mode")
		but.var = "misc.offline"
		function but.DoClick()
			vars[but.var] = !vars[but.var]
		end

		function but.Paint()
			btn_paint(but)
		end

		local but = AddFrameItem("misc", "DButton")
		but:SetPos(10,10 + 30 + 30 + 30 + 30 + 30)
		but:SetSize(mainframe:GetWide() - 20, 45)
		but:SetText("Kawaii Source Banner")
		function but.DoClick()
			pony.msg("This feature has been removed for the MPGH release.", 10)
			//pony.kawaii_srouce_banner()
			//backpanel:Remove()
		end

		function but.Paint()
			btn_paint2(but)
		end

	end

	local but = pony.button()
	but:SetSize(100,50)
	but:SetPos(5,27 + 55 + 55 + 55)
	but:SetText("Update ->")
	layouts["online"] = {}
	function but.DoClick()

		ClearMainframe()

		local online_data = data

		surface.SetFont("PonyFont")
		local _,height = surface.GetTextSize("Current version: " .. pony.version .. "\n" .. "Latest version: " .. tostring(online_data.version) .. "\n" .. "Link: " .. tostring(online_data.link))

		local CurVer = AddFrameItem("online","DLabel")
		CurVer:SetPos(10,5)
		CurVer:SetColor(ForColor)
		CurVer:SetFont("PonyFont")
		CurVer:SetText("Current version: " .. pony.version .. "\n" .. "Latest version: " .. tostring(online_data.version) .. "\n" .. "Link: " .. tostring(online_data.link))
		CurVer:SizeToContents()


		local logs = AddFrameItem("online", "DTextEntry")
		logs:SetSize(mainframe:GetWide() - 10, mainframe:GetTall() - height - 15)
		logs:SetPos(5,height + 10)
		logs:SetEditable(false)
		logs:SetMultiline(true)
		logs.m_FontName = "PonyFont"
		logs:SetTextColor(ForColor)
		logs:SetText("What's new in " .. online_data.version .. ":\n" .. online_data.info )
		surface.SetFont("PonyFont")
		local _,height = surface.GetTextSize("X")
		function logs.Paint()
			draw.RoundedBox(0, 0, 0, logs:GetWide(), logs:GetTall(), ForColor)
			draw.RoundedBox(0, 1, 1, logs:GetWide() - 2, logs:GetTall() - 2, BgColor)
			
			local txt = string.Explode("\n",logs:GetText())
			
			local ofx = 0
			for k,v in pairs(txt) do -- Haha, pretty hacky but I like it
				pony.drawtext(v, 5, 5 + ofx, ForColor)
				ofx = ofx + height + 2
			end

		end
	end

end

concommand.Add("pony", function()
	pony.menu()
end)

if file.Find( "lua/bin/gmcl_spreadthebutter_win32.dll", "MOD" ) then
	pony.print( "Nospread Module Found!" )
	pony.Nospread = true
	require( "spreadthebutter" )
end

pony.RetreiveUpdate() -- We might as well do a update check when we load