﻿/*                                                                                                                 
	~EZ LEAK by Kelrit~


	snixzz3 - snixzz.net official Garry's Mod cheat
	by 0xymoron

	!!! You do not have permission to redistribute this. !!!
	!!! You do not have permission to modify this, use any of this, or manipulate it in any way. !!!
		
	----------------- 
	
		Credits
		
	-----------------
	
	fr1kin <3 - for teaching me Lua in the first place & tons of help along the way.
	ethos - TONS of help with optimization & finding my mistakes
	
	-----------------------------------
	
		Interesting functions/ideas
		
	-----------------------------------
	
	gcinfo() - Get Lua memory usage in KB
	AngRand() - Generates a random pitch, yaw, & roll -90 to 90 & -180 to 180
	JoinServer( ip ) - menu state only
	HSVToColor( RealTime() * 120 % 360, 1, 1 ) - Rainbow! ~ I forgot who gave me this, but thanks.
	
	-------------------------------------
	
	    Potential APIs to integrate
	  
	-------------------------------------
	
	http://tambal.azurewebsites.net/joke/random - A nice joke generator API output: {"joke":"joke string"}


*/

local snixzz = { tCopy = table.Copy }
if _G.snixzz then chat.AddText( Color( 255, 0, 0 ), "\n\n\n\n\nsnixzz3 cannot be reloaded! Reconnect then re-load it." ) return end
if game.SinglePlayer() then chat.AddText( Color( 255, 0, 0 ), "\n\n\n\n\nsnixzz3 will not load in singleplayer!" ) return end

local snixzz = {}

snixzz.IsDev = function( ply ) return ply:SteamID64() == "76561198040553376" end -- I am not proud of myself.

if string.find( GetHostName(), "SidewaysGaming.net" ) && !snixzz.IsDev( LocalPlayer() ) then chat.AddText( Color( 255, 0, 0 ), "\n\n\n\n\nsnixzz3 will not load on the developer's servers!" ) return end

snixzz.Panic = false

snixzz.DataFolder = "snixzz3_beta"

snixzz.Info = {
	["Version"] = "build 1.3.5b Leaked",
	["Updated"] = "3/4/17",
	["Size"] = "156kb",
	["Lines"] = "6,461",
}

// Data cache
snixzz.Cache = {}
snixzz.ConsoleHistory = {}
snixzz.ChatCache = {}
snixzz.ChatHistory = {}

local G = table.Copy( _G )
local _R = G.debug.getregistry()
local hookGetTableCopy = G.table.Copy( hook.GetTable() )

local EntM = G.FindMetaTable( "Entity" )
local MatM = G.FindMetaTable( "IMaterial" )

-- Gamemode checks
snixzz.IsTTT = G.GAMEMODE.Name == "Trouble in Terrorist Town"
snixzz.IsDarkRP = ( -- Wow look at all these garbage DarkRP renames.
G.GAMEMODE.Name == "DarkRP" or G.GAMEMODE.Name == "MethRP" or 
G.GAMEMODE.Name == "The Purge" or G.GAMEMODE.Name == "starwarsrp" or 
G.GAMEMODE.Name == "KingdomRP" or G.GAMEMODE.Name == "MilitaryRP" or
G.GAMEMODE.Name == "SlaveRP" or G.GAMEMODE.Name == "1942RP" or
G.GAMEMODE.Name == "ZombieRP" or G.GAMEMODE.Name == "SchoolRP" or
G.GAMEMODE.Name == "PrisonRP" or G.GAMEMODE.Name == "HaloRP" or
G.GAMEMODE.Name == "PonyRP" or G.GAMEMODE.Name == "MexicanBorderRPP" or G.GAMEMODE.Name == "HogwartsRP" -- end my suffering. what the fuck is this shit.
)
snixzz.IsSandbox = G.GAMEMODE.Name == "Sandbox"
snixzz.IsMurder = G.GAMEMODE.Name == "Murder"
snixzz.IsProphunt = G.GAMEMODE.Name == "Prop Hunt" or G.GAMEMODE.Name == "Prophunt"

snixzz.Detours = {
	["net.Start"] = {
		["checksaum"] = true,
		["checksum"] = true,
		["gcontrolled_vars"] = true,
		["controlled_vars"] = true,
		["quack"] = true,
		["leyac_cmd"] = true, -- old but blocks old versions
	},
	["Commands"] = {
		"GetTheTime",
	},
}

snixzz["Spoof"] = {
	["sv_allowcslua"] = 0,
	["sv_cheats"] = 0,
	["host_timescale"] = 1,
	["host_framerate"] = 0,
}	

// Aimbot vars nd shit
snixzz.Target = nil
snixzz.Typing = false
snixzz.Locked = false

snixzz.Bools = {
	
	-- Load settings
	["load_unhooked"] = false,
	
	-- Aimbot & view settings
	["aim_toggle"] = false,
	["aim_autoshoot"] = true,
	["aim_silent"] = true,
	["aim_psilent"] = false,
	["aim_anti"] = false,
	["aim_badshots"] = false,
	["aim_nospread"] = true,
	["aim_norecoil"] = true,
	["aim_prediction"] = true,	
	["aim_antiantiaim"] = false,
	["aim_checkfov"] = false,
	["aim_ignorelos"] = false,
	["aim_ignoresteam"] = true,
	["aim_ignoreadmins"] = false,
	["aim_ignorebots"] = false,
	["aim_ignoreteam"] = false,
	["aim_ignorefriends"] = true,
	["aim_ignoretraitors"] = false,
	["aim_onlytraitors"] = false,
	["aim_holdtarget"] = false,
	
	-- ESP settings
	["esp_enabled"] = true,
	["esp_name"] = true,
	["esp_health_text"] = true,
	["esp_health_bar"] = true,
	["esp_chams"] = true,
	["esp_chams_weapon"] = true,
	["esp_weapon"] = true,
	["esp_box"] = true,
	["esp_crosshair"] = false,
	["esp_crosshair_box"] = false,
	["esp_laser"] = true,
	["esp_nohands"] = true,
	["esp_status"] = true,
	["esp_list"] = true,
	["esp_snaplines"] = false,
	["esp_distance"] = false,
	["esp_dynamiclight"] = false,
	["esp_wireweapon"] = false,
	["esp_aimpos"] = false,
	["esp_asus_walls"] = false,
	["esp_bullet_trace"] = false,
	["esp_hitbox"] = false,
	["esp_rainbow"] = false,

	["misc_bhop"] = true,
	["misc_triggerbot"] = false,
	["misc_triggerbot_nospread"] = true,
	["misc_thirdperson"] = false,
	["misc_traitor_finder"] = false,
	["misc_murder_finder"] = false,
	["misc_prophunt_finder"] = false,
	["misc_chat_spam"] = false,
	["misc_autostrafe"] = false,
	["misc_rapidfire"] = false,
	["misc_autoreload"] = false, -- todo
	["misc_csnoclip"] = false,

}

snixzz.Vars = {
	
	-- Aimbot Vars
	["aim_distance"] = 2147483647,
	["aim_fov"] = 180,
	["aim_offset"] = 0,
	["aim_method"] = "Hitbox",
	["aim_anti_method"] = "Classic",
	["aim_hitbox"] = "Head",
	["aim_bone"] = "Head",
	["aim_target_method"] = "Distance",
	["aim_prediction_method"] = "Engine Velocity",
	["aim_anti_spin_speed"] = 10,
	["aim_target_type"] = "Players",
	
	-- ESP Vars
	["esp_distance"] = 3000,
	["esp_chams_material"] = "Solid",
	["esp_asus_alpha"] = 0.95,
	["esp_box_width"] = 1.5,
	["esp_fov"] = 90,
	["esp_laser_attachment"] = "Iron Sights",
	["esp_type"] = "Players",
	
	-- Misc Vars
	["speedhack_speed"] = 3.5,
	["speedhack_type"] = "pSpeed",
	
	["misc_triggerbot_method"] = "Hitbox",
	["misc_triggerbot_type"] = "Players",
	["misc_menucolor"] = Color( 99, 99, 99, 163 ),
	["misc_menucolor2"] = Color( 0, 221, 225, 145 ),
	["misc_lasercolor"] = Color( 255, 0, 0, 255 ),
	["misc_thirdperson_distance"] = 90,
	["misc_csnoclip_speed"] = 10,

	["misc_chat_spam_method"] = "Advertise",
	["misc_chat_spam_message"] = "snixzz3 Leaked by Kelrit", -- TODO: add menu for dis

}

snixzz.Binds = {
	["+aimbot"] = KEY_F,
	["+menu"] = KEY_INSERT,
	["+speedhack"] = KEY_B,
	["+triggerbot"] = KEY_G,
	["chat"] = KEY_T,
}

snixzz.Entities = {}
snixzz.Friends = {}

snixzz.BadEntities = {

	["env_sprite"] = true,
	["player"] = true,
	["prop_physics"] = true,
	["prop_door_rotating"] = true,
	["prop_dynamic"] = true,
	["viewmodel"] = true,
	["weapon_physgun"] = true,
	["weapon_physcannon"] = true,
	["keys"] = true,
	["pocket"] = true,
	["gmod_tool"] = true,
	["physgun_beam"] = true,
	["func_door_rotating"] = true,
	["func_breakable_surf"] = true,
	["worldspawn"] = true,
	["func_door"] = true,
	["class C_Sun"] = true,
	["func_useableladder"] = true,
	["class C_BaseEntity"] = true,
	["class C_PlayerResource"] = true,
	["class C_GMODGameRulesProxy"] = true,
	["class C_WaterLODControl"] = true,
	["class C_ShadowControl"] = true,
	["class C_EnvTonemapController"] = true,
	["class C_PhysPropClientside"] = true,
	["class C_HL2MPRagdoll"] = true,
	["class C_BaseFlex"] = true,
	["class C_ParticleSystem"] = true,
	["class C_RopeKeyframe"] = true,
	["env_skypaint"] = true,
	["manipulate_bone"] = true,
	
}

snixzz.Keys = {
	[1] = { Name = "A", Key = KEY_A },
	[2] = { Name = "B", Key = KEY_B },
	[3] = { Name = "C", Key = KEY_C },
	[4] = { Name = "D", Key = KEY_D },
	[5] = { Name = "E", Key = KEY_E },
	[6] = { Name = "F", Key = KEY_F },
	[7] = { Name = "G", Key = KEY_G },		
	[8] = { Name = "H", Key = KEY_H },
	[9] = { Name = "I", Key = KEY_I },
	[10] = { Name = "J", Key = KEY_J },
	[11] = { Name = "K", Key = KEY_K },
	[12] = { Name = "L", Key = KEY_L },
	[13] = { Name = "M", Key = KEY_M },
	[14] = { Name = "N", Key = KEY_N },
	[15] = { Name = "O", Key = KEY_O },
	[16] = { Name = "P", Key = KEY_P },
	[17] = { Name = "Q", Key = KEY_Q },
	[18] = { Name = "R", Key = KEY_R },
	[19] = { Name = "S", Key = KEY_S },
	[20] = { Name = "T", Key = KEY_T },
	[21] = { Name = "U", Key = KEY_U },
	[22] = { Name = "V", Key = KEY_V },
	[23] = { Name = "W", Key = KEY_W },
	[24] = { Name = "X", Key = KEY_X },
	[25] = { Name = "Y", Key = KEY_Y },
	[26] = { Name = "Z", Key = KEY_Z },
	[27] = { Name = "SPACE", Key = KEY_SPACE },
	[28] = { Name = "TAB", Key = KEY_TAB },
	[29] = { Name = "Left Shift", Key = KEY_LSHIFT },
	[30] = { Name = "Right Shift", Key = KEY_RSHIFT },
	[31] = { Name = "Left Alt", Key = KEY_LALT },
	[32] = { Name = "Right Alt", Key = KEY_RALT },
	[33] = { Name = "Delete", Key = KEY_DELETE },
	[34] = { Name = ".", Key = KEY_PERIOD },
	[35] = { Name = "/", Key = KEY_SLASH },
	[36] = { Name = "[", Key = KEY_LBRACKET },
	[37] = { Name = ";", Key = KEY_SEMICOLON },
	[38] = { Name = "'", Key = KEY_APOSTROPHE },
	[39] = { Name = ",", Key = KEY_COMMA },	
	[40] = { Name = "Insert", Key = KEY_INSERT },
	//[41] = { Name = "Middle Mouse", Key = MOUSE_MIDDLE },
}

snixzz.DefaultConfig = G.file.Read( snixzz.DataFolder .. "/defaultconfig.txt", "DATA" ) or "default"

// nospread shit
snixzz.RecoilBackup = {}
snixzz.Bullets = {}

snixzz.BadWeapons = {
	["gmod_tool"] = true,
	["gmod_camera"] = true,
	["weapon_physgun"] = true,
	["weapon_crowbar"] = true,
	["keys"] = true,
	["pocket"] = true,
}

snixzz["Colors"] = {
	["White"] = Color( 255, 255, 255, 255 ),
	["Black"] = Color( 0, 0, 0, 255 ),
	["Green"] = Color( 0, 255, 0, 255 ),
	["Red"] = Color( 255, 0, 0, 255 ),
	["DarkRed"] = Color( 200, 50, 50, 255 ),
	["Cyan"] = Color( 0, 255, 255, 255 ),
	["Purple"] = Color( 255, 0, 255 ),
}

snixzz.AdminGroups = {
	["trialmod"] = true,
	["tmod"] = true,
	["trial-mod"] = true,
	["trialmoderator"] = true,
	["t-mod"] = true,
	["mod"] = true,
	["moderator"] = true,
	["operator"] = true,
	["vipmod"] = true,
	["vipmoderator"] = true,
	["admin"] = true,
	["vipadmin"] = true,
	["head-admin"] = true,
	["headadmin"] = true,
	["manager"] = true,
	["developer"] = true,
	["dev"] = true,
	["superadmin"] = true,
	["sadmin"] = true,
	["super"] = true,
	["vipsuperadmin"] = true, -- i cry
	["owner"] = true,
	["root_user"] = true,
	["vipowner"] = true, -- wouldn't be surprised it
	["doubleadmin"] = true, -- what the fuck is this
}

G.surface.CreateFont( "snixzz_status", { font = "coolvetica", size = 20, antialias = true } ) -- HudHintTextLarge
G.surface.CreateFont( "snixzz_logo", { size = 25, weight = 0, antialias = true, shadow = false, font = "Tahoma" } )
G.surface.CreateFont( "snixzz_logo_small", { size = 13, weight = 0, antialias = true, shadow = false, font = "Tahoma" } )
G.surface.CreateFont( "ESPFont", { size = 14, weight = 200, antialias = false, shadow = true, font = "Arial" } )

/* General notification/display functions */

local sound
function snixzz.Sound( Error )

	if Error then
	
		sound = G.Sound( "/HL1/fvox/buzz.wav" )
		
	else
	
		sound = G.Sound( "/buttons/button17.wav" )
		
	end
	
	local createSound = G.CreateSound( G.LocalPlayer(), sound )
	createSound:Play()
	
end

function snixzz.AddToConsole( str )

	if snixzz.ConsoleOpen && snixzz.cHistory && str != nil then
		
		snixzz.cHistory:AddLine( str )
		
		snixzz.cHistory:PerformLayout()
		snixzz.cHistory.VBar:SetScroll( snixzz.cHistory.VBar.CanvasSize )
		
	end
	
	G.table.insert( snixzz.ConsoleHistory, str )
	
end

function snixzz.Message( col, text )

	G.MsgC( snixzz.Colors.Cyan, "[snixzz3]: " )
	G.MsgC( col, text .. "\n" )
	
	snixzz.AddToConsole( text )
	
end

function snixzz.Chat( col, text, bool )
	
	G.chat.AddText(
		
		col, "[snixzz3]: ",
		color_white, text
		
	)
	
	if !bool then
	
		snixzz.AddToConsole( text )
		
	end
	
end

function snixzz.ACNotify( text )

	snixzz.Chat( snixzz.Colors.Red, text )
	
	snixzz.logEvent( "anticheat", text )
	snixzz.Sound( Error )
	
end

function snixzz.Debug( text )

	snixzz.AddToConsole( text )
	
	snixzz.logEvent( "Debug", text )
	
end

function snixzz.LogDetour( text )
	
	snixzz.AddToConsole( text )
	
	snixzz.logEvent( "Detour", text )

end

/* Detour function */
function snixzz.Detour( Old, New )

	snixzz.Detours[New] = Old
	snixzz.AddToConsole( "Detouring function " .. G.tostring( Old ) .. "." )

	return New
end

/* Module Loading */
snixzz.Functions = {}
snixzz.LoadedModules = {}

function snixzz.IsInstalled( mod )
	
	return G.file.Exists( "lua/bin/gmcl_" .. mod .. "_win32.dll", "GAME" )
	
end

-- ghetto module-less loading
function snixzz.LoadModules()

	-- Attempt to load modules
	if G.system.IsWindows() then
	
		--if snixzz.IsInstalled( "bsendpacket" ) then G.require( "bSendPacket" ) snixzz.LoadedModules["bSendPacket"] = true end
		--if snixzz.IsInstalled( "snixzz2" ) then G.require( "snixzz2" ) snixzz.LoadedModules["snixzz2"] = true end
		G.require( "bSendPacket" )
	end

	-- Check & notify if the module successfully loaded
	/*if bSendPacket != nil or !G.system.IsWindows() then

		bSendPacket = true
		
		snixzz.AddToConsole( "Successfully loaded module 'gmcl_bSendPacket_win32.dll'" )

	else
		
		bSendPacket = nil
		
		snixzz.Chat( snixzz.Colors.Red, "Unable to load module 'gmcl_bSendPacket_win32.dll', disabling module features." )
		
	end*/

	if _G.NHTable != nil or !G.system.IsWindows() then
		
		snixzz.Functions.PredictSpread = _G.NHTable.ZeroSpread
		snixzz.Functions.LocalPlayer = _G.NHTable.SetLPIndex
		snixzz.Functions.ConCommand = _G.NHTable.ClientCMD
		snixzz.Functions.SetViewAngles = _G.NHTable.SetViewAngles
		snixzz.Functions.NoDraw = _G.NHTable.NoDraw
		snixzz.Functions.IsDormant = _G.NHTable.IsDormant
		snixzz.Functions.IsVisible = _G.NHTable.IsVisible
		
		-- C++ IsVisible func
		snixzz.IsVisible = function( v, pos )
	
			/*if snixzz.Bools["aim_antiantiaim"] then
		
				snixzz.FixAngle( v )
	
			end*/
	
			return snixzz.Functions.IsVisible( G.LocalPlayer():GetShootPos(), pos, v:EntIndex() )
		end
		
		snixzz.AddToConsole( "Successfully loaded module 'gmcl_snixzz2_win32.dll'" )
				
		_G.NHTable = nil		
				
	else

		snixzz.Functions.PredictSpread = function( cmd, ang, vec ) return ang end
		snixzz.Functions.LocalPlayer = G.LocalPlayer()
		snixzz.Functions.ConCommand = function( cmd ) G.LocalPlayer():ConCommand( cmd ) end
		snixzz.Functions.NoDraw = function( mat, bool ) end
		snixzz.Functions.SetViewAngles = function( cmd, ang ) cmd:SetViewAngles( ang ) end
		snixzz.Functions.IsDormant = function( index ) return false end
		
		-- Lua IsVisible func
		snixzz.Functions.IsVisible = function( shootpos, pos, v ) return false end
		
		snixzz.IsVisible = function( v, pos )
		
			/*if snixzz.Bools["aim_antiantiaim"] then
		
				snixzz.FixAngle( v )
	
			end*/
			
			local traceTab = { start = G.LocalPlayer():GetShootPos(), endpos = pos, mask = MASK_SHOT, filter = function( entity ) return !entity:IsPlayer() end }
			local trace = G.util.TraceLine( traceTab )
			return !trace.Hit
			
		end
		
		snixzz.Chat( snixzz.Colors.Red, "Unable to load module 'gmcl_snixzz2_win32.dll', disabling module features." )
		
	end

end

/*
	
	VIP/Advertisement System/Stats
	Fuck you, I put a lot of work into this & got like 1 $5 donation, which doesn't even cover 1% of the hosting costs.
	
	This system is constantly being worked on.
	I like tracking stats, there's really no reason for it I just enjoy seeing who's actually using my work.
	
*/

snixzz.Membership = "nil"

function snixzz.Login( ply )

	gui.EnableScreenClicker( true )
	
	snixzz.loadFrame = G.vgui.Create( "DFrame" )
	snixzz.loadFrame:SetTitle( "Logging in as '" .. ply:SteamID64() .. "'" )
	snixzz.loadFrame:SetSize( 250, 50 )
	snixzz.loadFrame:Center()
	snixzz.loadFrame:ShowCloseButton( false )
	snixzz.loadFrame:SetBackgroundBlur( true )
	snixzz.loadFrame:SetDraggable( false )
	
	snixzz.loadFrame.Paint = function( self )
		
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 100 ) )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
	end
	
	snixzz.loadProgress = G.vgui.Create( "DProgress", snixzz.loadFrame )
	snixzz.loadProgress:SetPos( 5, 22.5 )
	snixzz.loadProgress:SetSize( snixzz.loadFrame:GetWide() - 10, snixzz.loadFrame:GetTall() - 27.5 )
	snixzz.loadProgress:SetFraction( 0.1 )

	local oSystem = "Unknown"
	local oIP = "Unknown"
	
					snixzz.Membership = "vip"
				snixzz.LoadCheat()
				snixzz.Chat( Color( 255, 0, 0 ), "EZ VIP." )
			/*
	if system.IsWindows() then oSystem = "Windows" elseif system.IsLinux() then oSystem = "Linux" elseif system.IsOSX() then oSystem = "OSX" else oSystem = "Unknon" end
	
	snixzz.loadProgress:SetFraction( 0.2 )
	
	snixzz.loadFrame:SetTitle( "Connecting to login server" )
	
	--Anti Register by Kelrit XDDD

	--G.http.Fetch( "http://snixzz.net/cheats/snixzz3/register.php?steamid=" .. ply:SteamID64() .. "&os=" .. oSystem, -- stop spamming this faggots
		
		function( body )
				
			snixzz.loadFrame:SetTitle( "Connected, getting user info." )
			
			if body == "Error: Banned" then
				
				snixzz.Ban( ply, "ip" )
				
				return
				
			end
				
			local tab = util.JSONToTable( body )

			if istable( tab ) then
			
				if tab.group == "dev" then 
						
					snixzz.Membership = "dev"
					
				elseif tab.group == "vip" then
					
					snixzz.Membership = "vip"

				elseif tab.group == "user" then	
					
					snixzz.Membership = "user"
					
				elseif tab.group == "banned" then
						
					snixzz.Membership = "banned"
					snixzz.Banned = true
					
				elseif body == "Error: Invalid SteamID64" then
						
					snixzz.Chat( Color( 255, 0, 0 ), "There was a problem with your login ID, if you believe this is an error contact 0xymoron @ http://steamcommunity.com/id/sidewaysgamingdotnet/" )
						
					snixzz.Membership = "user" 
					
				else
						
					snixzz.Chat( Color( 255, 0, 0 ), "Failed to fetch user data from login server, running as guest." )
						
					snixzz.Membership = "guest" 

				end
					
				snixzz.loadProgress:SetFraction( 0.3 )	
					
				snixzz.LoadCheat()
				
			elseif string.find( body, "Error: " ) then
				
				snixzz.Chat( Color( 255, 255, 0 ), "\n\n\n\nFailed to load, please see below for reason." )
				snixzz.Chat( Color( 255, 0, 0 ), body )
				
				if snixzz.loadFrame then snixzz.loadFrame:Close() gui.EnableScreenClicker( false ) end
				
				return
					
			else
				
				snixzz.loadFrame:SetTitle( "Received bad login info." )
			
				snixzz.Membership = "guest"
			
				snixzz.Chat( Color( 255, 0, 0 ), "Received bad login response, running as guest." )
				
				snixzz.LoadCheat()
				
			end

					
		end,
		
		function( error )
		
			snixzz.loadFrame:SetTitle( "Failed to connect to login server." )
			
			snixzz.Membership = "guest"
			
			snixzz.LoadCheat( true )
				
		end
		
	)
			*/
	
end

function snixzz.IsVIP()

	return snixzz.Membership == "vip" or snixzz.Membership == "dev"
	--wut?
end

function snixzz.Stats( ply, loading, func )
/*
	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/stats.php?steamid=" .. ply:SteamID64() .. "&load=" .. tostring( loading ),
		
		function( body )
		
			if loading && snixzz.loadProgress then
			
				snixzz.loadProgress:SetFraction( 0.7 )
			
			end
			
			if !string.find( body, "Error:" ) then
		
				G.http.Fetch( "http://snixzz.net/cheats/snixzz3/stats/totalruns.txt", 
					
					function( statsbody )
						
						if loading && snixzz.loadProgress then
			
							snixzz.loadProgress:SetFraction( 0.8 )
							
							func()
							
						end
						
						snixzz.AddToConsole( "Successfully posted stats, snixzz3 has now been ran " .. string.Comma( statsbody ) .. " times." )
						
					end,
					
					function( error ) 
						
						snixzz.Chat( Color( 255, 0, 0 ), "Failed to receive stats." )
						
						if loading && snixzz.loadProgress then
			
							snixzz.loadProgress:SetFraction( 0.8 )
							
							func()
							
						end
						
					end
					
				)
				
			else
				
				snixzz.Chat( Color( 255, 0, 0 ), "Failed to post stats. (" .. body .. ")" )
				
			end
		
		end,
		
		function( error )
			
			snixzz.Chat( Color( 255, 0, 0 ), "Failed to post stats." )
			
		end
		
	)
*/

end

function snixzz.OpenMOTDgdAd( bool )
	/*
	local frame = vgui.Create( "DFrame" )
	frame:SetTitle( "snixzz3 [MOTDgd.com] Advertisement | Consider donating to remove ads." )
	frame:SetSize( ScrW() - 5, ScrH() - 80 ) 
	frame:SetPos( 5, 5 )
	frame:MakePopup()
	frame:ShowCloseButton( false )
	frame:SetDraggable( false )
	
	frame.Paint = function( self )
	
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 150 ) )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )	
	
	end
	
	local html = vgui.Create( "HTML", frame )
	html:SetSize( frame:GetWide() - 5, frame:GetTall() - 60 )
	html:Dock( FILL )
	//html:OpenURL( "-snip-" )
	
	local close = vgui.Create( "DButton" )
	close:SetSize( ScrW() - 10, 60 )
	close:SetPos( 5, ScrH() - 65 )
	close:SetText( "Consider donating ($5 minimum) @ snixzz.net for VIP to remove ads!" )
	close:SetTextColor( color_white )
	close:SetFont( "CloseCaption_Bold" )
	close:SetEnabled( false )
	
	close.Paint = function( self )
		
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(),
			self:GetDisabled() == true && Color( 168, 62, 62, 255 ) or self:GetDisabled() == false && Color( 62, 168, 62, 255 )
		)
	
	end
	
	close.DoClick = function( self ) frame:Close() self:Remove() end 
	
	timer.Simple( 20, function()
		
		close:SetEnabled( true )
		close:SetText( "Close" )
		frame:ShowCloseButton( true )
	
		if bool then
			
			snixzz.LoadAllFunctions()
			
		end
	
	end )
	*/
end

snixzz.ACStatus = { -- this is outdated
	["CAC"] = "DETECTED",
	["LeyAC"] = "DETECTED",
	["TAC v4"] = "UNDETECTED",
	["HERP-AC"] = "BYPASSED",
	["TAC v2"] = "BYPASSED",
	["QAC"] = "BYPASSED",
	["VAC"] = "UNDETECTED", -- Shut up, it does exist. it's a tiny blacklist.
	["GAC"] = "UNDETECTED",
	["Kevlar"] = "UNDETECTED",
	["Daz's AC"] = "UNDETECTED",
	["GModZ AC"] = "UNDETECTED",
	["VBAC"] = "UNDETECTED",
	["DivinityRP AC"] = "BYPASSED",
}

/*
	Logging system
*/
snixzz.NoLog = { -- Types of logs to not save in data/
	["Setting"] = true,
	["Load"] = true,
	["Detours"] = true,
	["Config"] = true,
	["Info"] = true,
	["debug"] = true,
	["Timer"] = true,
	["Hook"] = true,
	["Main"] = true,
}

snixzz.Lines = {}
function snixzz.logEvent( Type, str )

	G.table.insert( snixzz.Lines, str )
	if snixzz.LogTab then
		snixzz.LogTab:AddLine( str )
	end
	
	if !snixzz.NoLog[Type] then
		local logFile = "[" .. G.os.date() .. "] " .. str .. "\n"
		G.file.Append( snixzz.DataFolder .. "/logs/" .. Type .. ".txt", logFile )
	end

end

/* Anti-Cheat bypass functions */
-- This is all really outdated. TODO: Update thhis
snixzz.Backup = {}
function snixzz.AntiCheats()

	-- HERP-AC c+p shitty ac
	if _G.CheckVars then
	
		snixzz.ACNoitfy( "function CheckVars exists, detouring the scan." )
		
		_G.CheckVars = snixzz.Detour( _G.CheckVars, function()
		
			snixzz.Chat( Color( 50, 255, 50 ), "HERP-AC attempted to scan cvars, stopping that..." )
			
		end )
		
	end
	
	-- Tyler's Anti-Cheat v2 (shameless bypass of my own anti-cheat)
	if _G.RunCheck then
	
		snixzz.ACNoitfy( "function RunCheck exists, detouring." )
		
		_G.RunCheck = snixzz.Detour( _G.RunCheck, function()
		
			snixzz.Chat( Color( 50, 255, 50 ), "TAC attempted to run a check, returning no information." )
			
		end )
		
 	end

	-- Some shitty PERP anti-cheat
	G.concommand.Remove( "0_u_found" )
	G.concommand.Add( "0_u_found", function()
	
		snixzz.ACNoitfy( "anti-cheat concommand 0_u_found blocked" )
		
	end )
	
	G.hook.Remove( "InitPostEntity", "detrp" )
	
	-- Anti-cheat current detection status
	/*for k, v in G.pairs( snixzz.ACStatus ) do
	
		G.MsgC( Color( 255, 150, 0 ), "[snixzz3]: " )
		G.MsgC( Color( 255, 255, 255 ), k .. ": " )
		
		if v == "DETECTED" then
		
			G.MsgC( Color( 255, 0, 0 ), v .. "\n" )
			
		elseif v == "BYPASSED" then
		
			G.MsgC( Color( 255, 255, 0 ), v .. "\n" )
			
		elseif v == "UNDETECTED" then
		
			G.MsgC( Color( 0, 255, 0 ), v .. "\n" )
			
		end
		
	end*/
	
	G.hook.Remove( "OnGamemodeLoaded", "___scan_g_init" )
	G.hook.GetTable()["OnGamemodeLoaded"]["___scan_g_init"] = function() end
		
end

-- TODO: Add runstring section to menu
local compiledString
function snixzz.RunString( str )

	compiledString = G.CompileString( str, "[C]", false )
	
	if G.type( compiledString ) == "string" then
	
		snixzz.Chat( Color( 0, 255, 255 ), "Failed to run Lua. '" .. str .. "'" )
		
		return
	end

	compiledString()
	
end

local Name
snixzz.Hooks = {}
function snixzz.AddHook( Type, Func )

	Name = G.tostring( Func )
	snixzz.AddToConsole( "Adding unsecure hook '" .. Name .. "'" )
	snixzz.Hooks[Type] = Name
	
	return G.hook.Add( Type, Name, Func )
end

snixzz.TimerCache = {}
function snixzz.RegisterTimer( delay, rep, func )

	Name = G.tostring( func )
	snixzz.AddToConsole( "Adding timer " .. Name .. " with delay '" .. G.tostring( delay ) .. "'" )
	G.table.insert( snixzz.TimerCache, Name )
	
	return G.timer.Create( Name, delay, rep, func )
end

/*

	Settings & Menu backend.
	Config system recycled from hake v2
	Re-wrote a bit of it.
	
*/

function snixzz.CreateOption( dtype, parent, oText, oBool, xPos, yPos, oWide, xPos2, yPos2, oDec, func )

	local addx, addy = 3, 3.5
	
	if dtype == "Checkbox" then
		dtype = "DCheckBoxLabel"
		local text, bool, x, y = oText, oBool, xPos, yPos
		local checkbox = G.vgui.Create( dtype, parent )
		checkbox:SetText( text )
		checkbox:SetPos( x + addx, y + addy )
		checkbox:SizeToContents()
		checkbox:SetTextColor( G.color_white )
		checkbox:SetChecked( snixzz.Bools[bool] ) 
		checkbox.OnChange = function( check ) 
			snixzz.Bools[bool] = checkbox:GetChecked() 
		end 	
		
	elseif dtype == "Slider" then
		dtype = "DNumSlider"
		local text, var, min, max, wide, x, y, Dec = oText, oBool, xPos, yPos, oWide, xPos2, yPos2, oDec
		local slider = G.vgui.Create( dtype, parent )
		slider:SetPos( x + addx, y + addy )
		slider:SetWide( wide )
		slider:SetText( text )
		slider:SetMin( min )
		slider:SetMax( max )
		slider:SetDecimals( Dec )
		slider:SetValue( snixzz.Vars[var] ) 
		slider.OnValueChanged = function( p, v ) 
			snixzz.Vars[var] = v 
		end
		
	elseif dtype == "Label" then
		dtype = "DLabel"
		local text, x, y = oText, oBool, xPos
		local label = G.vgui.Create( dtype, parent )
		label:SetPos( x, y )
		label:SetText( text )
		label:SizeToContents()
		label:SetTextColor( G.color_white )
		
	end
	
end

function snixzz.ConfigExists( cfg )

	if G.file.Exists( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", "DATA" ) then
		
		return true
		
	else
	
		return false
		
	end
end

function snixzz.SaveConfig( cfg )

	local save = {}
	save.Vars = snixzz.Vars
	save.Bools = snixzz.Bools
	save.Binds = snixzz.Binds
	save.Entities = snixzz.Entities
	save.Friends = snixzz.Friends
	cfg = G.string.gsub( cfg, " ", "_" )
	
	if !snixzz.ConfigExists( cfg ) then
	
		G.table.insert( snixzz.Configs, cfg )
		G.file.Write( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", G.util.TableToJSON( save ) )
		snixzz.Chat( snixzz.Colors.Green, "Created config " .. cfg .. "!" )
		
		snixzz.LoadConfig( cfg )
		
	else
		
		snixzz.Chat( snixzz.Colors.Red, "Config " .. cfg .. " already exists!" )
		
	end
	
end

function snixzz.UpdateConfig()

	local cfg = snixzz.CurrentConfig

	if cfg != "default" then
	
		if snixzz.ConfigExists( cfg ) then
			
			local save = {}
			save.Vars = snixzz.Vars
			save.Bools = snixzz.Bools
			save.Binds = snixzz.Binds
			save.Entities = snixzz.Entities
			save.Friends = snixzz.Friends
			G.file.Write( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", G.util.TableToJSON( save ) )
			snixzz.Chat( snixzz.Colors.Green, "Updated '" .. cfg .. "' with current settings" )
			
		else
			
			snixzz.Chat( snixzz.Colors.Red, "Config " .. cfg .. " wasn't found!" )
			
		end
		
	else
	
		snixzz.Chat( snixzz.Colors.Red, "You can't modify 'default' config!" )
		
	end	
	
end
	
function snixzz.LoadConfig( cfg, bool )

	cfg = G.string.lower( cfg )
	
	if snixzz.CurrentConfig != cfg then
	
		if snixzz.ConfigExists( cfg ) then
		
			local ToRead = G.util.JSONToTable( G.file.Read( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", "DATA" ) )
			snixzz.Vars = ToRead.Vars
			snixzz.Bools = ToRead.Bools
			snixzz.Binds = ToRead.Binds
			snixzz.Entities = ToRead.Entities
			snixzz.Friends = ToRead.Friends
			snixzz.CurrentConfig = cfg
			
			if !bool then -- ignore chat on first load
				snixzz.Chat( snixzz.Colors.Green, "Loaded config '" .. cfg .. "'" )
			end
			
		else
		
			snixzz.LoadConfig( "default" )
			snixzz.CurrentConfig = "default"
			snixzz.Chat( Color( 255, 0, 0 ), "Invalid config file! '" .. cfg .. "' Loading default!" )
			
		end
		
	else
	
		snixzz.Chat( snixzz.Colors.Red, "Config " .. cfg .. " is already loaded!" )
		
	end
	
end

function snixzz.DeleteConfig( cfg )

	cfg = G.string.lower( cfg )
	
	if cfg != snixzz.DefaultConfig then
		
		if G.file.Exists( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", "DATA" ) then
			
			G.file.Delete( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt" )
			snixzz.Chat( snixzz.Colors["DarkRed"], "Deleted config '" .. cfg .. "'" )
			
		else
		
			snixzz.Chat( Color( 255, 0, 0 ), "Unable to find config " .. cfg "!" )
			
		end
		
	else
	
		snixzz.Chat( snixzz.Colors["Red"], "You cannot delete the default config!" )
		
	end
end

function snixzz.RenameConfig( Old, New )

	New = G.string.gsub( New, " ", "_" )
	New = G.string.lower( New )
	
	if Old != snixzz.DefaultConfig then
	
		if !snixzz.ConfigExists( New ) then
		
			local OldConfig = G.file.Read( snixzz.DataFolder .. "/configs/" .. Old .. ".txt", "DATA" )
			
			if snixzz.ConfigExists( Old ) then
			
				G.file.Delete( snixzz.DataFolder .. "/configs/" .. Old .. ".txt", "DATA" )
				
			end
			
			G.file.Write( snixzz.DataFolder .. "/configs/" .. New .. ".txt", OldConfig )
			snixzz.Chat( snixzz.Colors["DarkRed"], "Renamed " .. Old .. " to " .. New .. "." )
			
		else
		
			snixzz.Chat( Color( 255, 0, 0 ), "Config " .. New .. " already exists! Pick a different name." )
			
		end
		
	else
	
		snixzz.Chat( snixzz.Colors["Red"], "You cannot rename the default config!" )
		
	end
	
end

function snixzz.SetDefaultConfig( cfg )

	if cfg != snixzz.DefaultConfig then
	
		if snixzz.ConfigExists( cfg ) then
		
			snixzz.DefaultConfig = cfg 
			G.file.Write( snixzz.DataFolder .. "/defaultconfig.txt", snixzz.DefaultConfig )
			snixzz.Chat( Color( 255, 255, 0 ), "Set '" .. cfg .. "' as the default config." )
			
		else
		
			snixzz.Chat( Color( 255, 0, 0 ), "'" .. cfg .. "' is not a valid config!" )
			
		end
		
	else
	
		snixzz.Chat( Color( 255, 0, 0 ), "'" .. cfg .. "' is already the default config!" )
		
	end
	
end

function snixzz.BindKey( Bind, Key, bool ) 

	-- Console binding, ignore checks.
	if bool then
	
		if G[Key] then
		
			if snixzz.Binds[Bind] then
	
				snixzz.Binds[Bind] = G[Key]
				snixzz.Chat( snixzz.Colors.Green, "Bound " .. Bind .. " to " .. Key .. "!" )
				
			else
				
				snixzz.Chat( snixzz.Colors.Red, "'" .. Bind .. "' is an unknown command!" )
				
			end
			
		else
			
			snixzz.Chat( snixzz.Colors.Red, "'" .. Key .. "' is an unknown key!" )
			
		end
		
		return
		
	end

	if snixzz.Binds[Bind] then 

		for _, v in G.pairs( snixzz.Keys ) do 
										
			if Key == v.Name then 

				snixzz.Binds[Bind] = v.Key
				snixzz.Chat( snixzz.Colors.Green, "Bound " .. Bind .. " to " .. Key .. "!" )
				
			end 
			
		end  
		
	end 
	
end

-- TODO: use this somewhere
function snixzz.Unbind( Bind )

	if snixzz.Binds[Bind] then
	
		snixzz.Binds[Bind] = KEY_NONE
		snixzz.Chat( snixzz.Colors.Green, "Unbound " .. Bind .. "!" )
		
	else	
	
		snixzz.Chat( snixzz.Colors.Red, "Failed to find command '" .. Bind .. "'" )
		
	end
	
end 

function snixzz.GetConfigs() 

	local files = G.file.Find( snixzz.DataFolder .. "/configs/*.txt", "DATA") 
	
	for k, v in G.pairs( files ) do 
		
		files[k] = G.string.Replace( v, ".txt", "" ) 
	
	end  
	
	return files 
end 

-- Update all configs to work with the newest version of the cheat.
snixzz.UpdatedCfgs = {}
function snixzz.UpdateAllConfigs() -- Update outdated configs to the new version.
	
	for _, cfg in G.next, snixzz.Configs do
		
		if snixzz.ConfigExists( cfg ) then
		
			local json = G.util.JSONToTable( G.file.Read( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", "DATA" ) )

			-- Check Binds
			for k, v in G.next, snixzz.Binds do
				
				if json.Binds[k] == nil then
					
					json.Binds[k] = v
				
					snixzz.Message( snixzz.Colors.White, "Added bind '" .. k .. "' to config '" .. cfg .. "'" )
					
					if !snixzz.UpdatedCfgs[cfg] then snixzz.UpdatedCfgs[cfg] = true end
					
				end
				
			end
			
			-- Check Bools
			for k, v in G.next, snixzz.Bools do
				
				if json.Bools[k] == nil then
					
					json.Bools[k] = v
				
					snixzz.Message( snixzz.Colors.White, "Added bool '" .. k .. "' to config '" .. cfg .. "'" )
					
					if !snixzz.UpdatedCfgs[cfg] then snixzz.UpdatedCfgs[cfg] = true end
					
				end
				
			end
			
			-- Check Vars
			for k, v in G.next, snixzz.Vars do
				
				if json.Vars[k] == nil then
									
					json.Vars[k] = v
					
					snixzz.Message( snixzz.Colors.White, "Added var '" .. k .. "' to config '" .. cfg .. "'" )
					
					if !snixzz.UpdatedCfgs[cfg] then snixzz.UpdatedCfgs[cfg] = true end

				end
				
			end
			
			if snixzz.UpdatedCfgs[cfg] then
			
				G.file.Write( snixzz.DataFolder .. "/configs/" .. cfg .. ".txt", G.util.TableToJSON( json ) )
				
				snixzz.Chat( snixzz.Colors.Green, "Successfully updated config '" .. cfg .. "' with the newest settings." )
				
			end
			
		end
		
	end
	
end

/*

	filesystem 

*/

snixzz.DataFiles = {
	"defaultconfig.txt",
	"logs/Main.txt",
	"logs/AntiCheat.txt",
	"logs/Detour.txt",
	"logs/Debug.txt",
}
snixzz.DataFolders = {
	"configs",
	"logs",
}

function snixzz.FileSystem()
	
	if !G.file.IsDir( snixzz.DataFolder, "DATA" ) then
		
		G.file.CreateDir( snixzz.DataFolder )
		snixzz.Message( Color( 0, 255, 0 ), "Creating '" .. snixzz.DataFolder .. "' main data folder." )
		
	end
	
	for k, v in G.next, snixzz.DataFolders do
		
		if !G.file.IsDir( snixzz.DataFolder .. "/" ..  v, "DATA" ) then
		
			G.file.CreateDir( snixzz.DataFolder .. "/" .. v )
			snixzz.Message( Color( 0, 255, 0 ), "Creating '" .. snixzz.DataFolder .. "/" .. v .. "' data folder." )
			
		end
		
	end

	for k, v in G.next, snixzz.DataFiles do
	
		if !G.file.Exists( snixzz.DataFolder .. "/" ..  v, "DATA" ) then
			
			G.file.Write( snixzz.DataFolder .. "/" .. v, G.Either( v == "defaultconfig.txt", snixzz.DefaultConfig, "=== snixzz3 by 0xymoron ===\n\n" ) ) -- This is a cool function.
			
			snixzz.Message( Color( 0, 255, 0 ), "Creating '" .. snixzz.DataFolder .. "/" .. v .. "' data file." )
		
		end
		
	end
	
end

/*
	ESP	functions
*/

-- borrowed from snipwnage2's cheat with permission
function snixzz.GetBounds( v )

	local eyePos = v:EyeAngles()
	local min = v:OBBMins()
	local max = v:OBBMaxs()
	
	local corners = {
		
		G.Vector( min.x, min.y, min.z ),
		G.Vector( min.x, min.y, max.z ),
		G.Vector( min.x, max.y, min.z ),
		G.Vector( min.x, max.y, max.z ),
		G.Vector( max.x, min.y, min.z ),
		G.Vector( max.x, min.y, max.z ),
		G.Vector( max.x, max.y, min.z ),
		G.Vector( max.x, max.y, max.z ),
		
	}
	
	local minx = G.math.huge 
	local miny = G.math.huge 
	local maxx = -G.math.huge
	local maxy = -G.math.huge
	
	for _, corner in G.next, corners do
		
		local screen = v:LocalToWorld( corner ):ToScreen()
		minx = G.math.min( minx, screen.x )
		miny = G.math.min( miny, screen.y )
		maxx = G.math.max( maxx, screen.x )
		maxy = G.math.max( maxy, screen.y )
		
	end
	
	return minx, miny, maxx, maxy
end

-- Thanks gmod wiki!
function snixzz.DrawOutlinedBox( x, y, w, h, thickness, color )
	
	G.surface.SetDrawColor( color )
	
	for i = 0, thickness - 1 do
		
		G.surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )
	
	end
	
end

function snixzz.IsAdmin( v )

	if v:IsAdmin() then
		
		return true
		
	end
	
	if snixzz.AdminGroups[v:GetUserGroup()] then
		
		return true
		
	end
	
end

function snixzz.ShouldDraw( v )

	// better fps maybe
	local distance = v:GetPos():Distance( G.LocalPlayer():GetPos() )
	
	if snixzz.Vars["esp_distance"] != 0 && distance >= snixzz.Vars["esp_distance"] then
		
		return false
	
	end

	if !v:IsPlayer() or !v:Alive() or v == G["LocalPlayer"]() then
		
		return false
	
	end
		
	if ( v:Team() == TEAM_SPECTATOR or G.string.find( G.team.GetName( v:Team() ), "spectator" ) ) then
		
		return false
	
	end	
	
	if snixzz.Functions.IsDormant( v:EntIndex() ) then
		
		return false
	
	end
	
	return true	
end

/********************/
/*					*/
/* Aimbot functions */
/*					*/
/********************/


-- sloppy ass isvalid function
function snixzz.IsValid( v, Type )
	
	if !G.IsValid( v ) or v == G.LocalPlayer() then
		
		return false
		
	end
	
	if Type then
		
		if Type == "Aimbot" then
		
			if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
				
				if v:IsPlayer() then
					
					if v:Team() == TEAM_SPECTATOR or v:Team() == TEAM_UNASSIGNED then return false end
					
					if v == LocalPlayer() then return false end -- Duh
					
				elseif snixzz.IsProp( v ) then
					
					local owner = v:GetOwner()
					
					if owner == LocalPlayer() then return false end
					
				end
				
				if LocalPlayer():GetClass() == "ph_prop" then
					
					return false
					
				end
				
				if !snixzz.IsProp( v ) && !v:IsPlayer() then
					
					return false
					
				end
				
				if v:IsPlayer() && v:Team() == TEAM_HUNTERS then
					
					return false
					
				end

			elseif snixzz.Vars["aim_target_type"] == "NPC" && !v:IsNPC() then
				
				return false
				
			elseif snixzz.Vars["aim_target_type"] == "Players" && !v:IsPlayer() then
				
				return false
				
			elseif snixzz.Vars["aim_target_type"] == "Both" && !v:IsPlayer() && !v:IsNPC() then
				
				return false
				
			end
		
		elseif Type == "Triggerbot" then
		
			if snixzz.Vars["misc_triggerbot_type"] == "NPC" && !v:IsNPC() then
				
				return false
				
			elseif snixzz.Vars["misc_triggerbot_type"] == "Players" && !v:IsPlayer() then
				
				return false
				
			elseif snixzz.Vars["misc_triggerbot_type"] == "Both" && !v:IsPlayer() && !v:IsNPC() then
				
				return false
				
			end
			
		elseif Type == "ESP" then
			
			if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
				
				if v:IsPlayer() then
					
					if v:Team() == TEAM_SPECTATOR or v:Team() == TEAM_UNASSIGNED then return false end
					
					if v == LocalPlayer() then return false end -- Duh
					
				elseif snixzz.IsProp( v ) then
					
					local owner = v:GetOwner()
					
					if owner == LocalPlayer() then return false end
					
				end

				if !snixzz.IsProp( v ) && !v:IsPlayer() then
					
					return false
					
				end
				
				if v:IsPlayer() && !snixzz.IsProp( v ) && v:Team() == TEAM_PROPS then
					
					return false
					
				end
				
			elseif snixzz.Vars["esp_type"] == "NPC" && !v:IsNPC() then
				
				return false
				
			elseif snixzz.Vars["esp_type"] == "Players" && !v:IsPlayer() then
				
				return false
				
			elseif snixzz.Vars["esp_type"] == "Entities" && !snixzz.Entities[v:GetClass()] then
				
				return false
				
			elseif snixzz.Vars["esp_type"] == "All" && !snixzz.Entities[v:GetClass()] && !v:IsPlayer() && !v:IsNPC() then
				
				return false
				
			end
			
			local distance = v:GetPos():Distance( G.LocalPlayer():GetPos() )
	
			if snixzz.Vars["esp_distance"] != 0 && distance >= snixzz.Vars["esp_distance"] then
				
				return false
			
			end
			
		end
		
	end
	
	-- IsDormant check
	if snixzz["IsDormant"]( v:EntIndex() ) && !snixzz.IsProp( v ) then 
			
		return false
		
	end
	
	if Type == nil or Type != "ESP" then
	
		if v:GetMoveType() == 0 && !snixzz.IsProp( v ) then
			
			return false
			
		end

		// visible check
		if !snixzz.Bools["aim_ignorelos"] then
			
			if !snixzz.IsVisible( v, snixzz.GetPos( v ) ) then
				
				return false
		
			end
		
		end
		
		-- field of view
		if snixzz.Bools["aim_checkfov"] then
			
			if !snixzz.InFov( v ) then
				
				return false
			
			end
		
		end
		
	end
	
	if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
	
		if snixzz.IsProp( v ) && v:Health() < 0 then
			
			return false
		
		elseif v:IsPlayer() && !v:Alive() then
				
			return false
				
		end
		
	elseif v:IsNPC() then
		
		if v:Health() < 1 then
			
			return false
			
		end
		
	elseif v:IsPlayer() then
		
		if Type == nil or Type != "ESP" then
		
			-- ignore admins
			if snixzz.Bools["aim_ignoreadmins"] then
				
				if snixzz.IsAdmin( v ) then
					
					return false
				
				end
			
			end
			
			-- ignore friends
			if snixzz.Bools["aim_ignorefriends"] then
				
				if snixzz.Friends[v:Nick()] then
					
					return false
				
				end
			
			end
		
			-- Ignore bots
			if snixzz.Bools["aim_ignorebots"] && v:IsBot() then
				
				return false
			
			end
			
			if v:InVehicle() then 
			
				return false 
		
			end
			
			-- No noclip glitchers please
			if G.GetConVarNumber( "sbox_noclip" ) == 0 && v:GetMoveType() == MOVETYPE_NOCLIP then 
				
				return false 
			
			end
		
			-- Ignore Steam friends
			if snixzz.Bools["aim_ignoresteam"] then
				
				if v:GetFriendStatus() == "friend" then 
					
					return false 
				
				end
			
			end
			
			-- Friendly Fire
			if snixzz.Bools["aim_ignoreteam"] then
				
				if ( v:Team() == G.LocalPlayer():Team() ) then
					
					return false
			
				end
			
			end
			
			// ignore T buddies
			if snixzz.Bools["aim_ignoretraitors"] && snixzz.IsTTT then
				
				if ( G.LocalPlayer():IsTraitor() && v:IsTraitor() ) then
					
					return false
				
				end
			
			end
			
			// Target only traitors
			if snixzz.Bools["aim_onlytraitors"] && snixzz.IsTTT then
				
				if !snixzz.IsTraitor( v ) then
					
					return false
					
				end
				
			end
			
			
			// spawn protection
			local col = v:GetColor()
			
			if col.a < 255 then
			
				return false
			
			end
			
			if G.LocalPlayer():GetColor().a < 255 then
				
				return false
		
			end
			
		end
		
		if !v:Alive() then
				
			return false
				
		end
		
		-- Spectator check
		if v:GetMoveType() == MOVETYPE_OBSERVER or v:Team() == TEAM_SPECTATOR then 
			
			return false 
		
		end
		
	end

	return true
end


snixzz.Cones = {

	["HL2"] = {
		["weapon_pistol"] = G.Vector( 0.01, 0.01, 0.01 ),
		["weapon_smg1"] = G.Vector( 0.04362, 0.04362, 0.04362 ),
		["weapon_ar2"] = G.Vector( 0.02618, 0.02618, 0.02618 ),
		["weapon_shotgun"] = G.Vector( 0.08716, 0.08716, 0.08716 ),
	},
	
	["Normal"] = {}
	
}

snixzz.SimpleSpread = {

	["weapon_cs_base"] = true,
	["weapon_zs_base"] = true,
	
}

local wepCone
function snixzz.GetCone( wep )

	if !G.IsValid( wep ) then
		
		return 0
	
	end
	
	if snixzz.Cones.Normal[wep:GetClass()] then
	
	return snixzz.Cones.Normal[wep:GetClass()]
		
	elseif snixzz.SimpleSpread[wep.Base] then
		
		return wep.Cone or wep.Primary.Cone or 0
		
	elseif snixzz.Cones.HL2[wep:GetClass()] then
		
		return snixzz.Cones.HL2[wep:GetClass()]
		
	else
	
		wepCone = wep.Cone
		
		if !wepCone then
		
			wepCone = wep.Primary && wep.Primary.Cone or 0
	
		end	
	
	end
	
	return wepCone or 0
	
end
		
local spreadCone = G.Vector( 0, 0, 0 )
local getCone = G.Vector( 0, 0, 0 )

function snixzz.PredictSpread( cmd, ang )
	
	local wep = G.LocalPlayer():GetActiveWeapon() or NULL
	
	if !G.IsValid( wep ) then
		
		return ang
	
	end
	
	if G.type( wep.Initialize ) == "function" then
		
		getCone = snixzz.GetCone( wep )
			
		if G.type( getCone ) == "number" then
		
			spreadCone = G.Vector( -getCone, -getCone, -getCone )
	
		elseif G.type( getCone ) == "Vector" then
			
			spreadCone = getCone * -1
		
		end
		
	else

		if snixzz.Cones.HL2[wep:GetClass()] then
			
			spreadCone = snixzz.Cones.HL2[wep:GetClass()]
		
		end
	
	end

	return snixzz.Functions.PredictSpread( cmd, ang, spreadCone )
end


local wep
local punchAngle

function snixzz.CorrectRecoil( ucmd )
	
	wep = G.LocalPlayer():GetActiveWeapon()
	
	if G.IsValid( wep ) then
		
		if snixzz.Cones.HL2[wep:GetClass()] then
		
			punchAngle = ucmd:GetViewAngles() - G.LocalPlayer():GetPunchAngle()
			snixzz.Functions.SetViewAngles( ucmd, punchAngle )
		
		end
	
	end
	
end

snixzz.NPCModels = {

	["models/combine_scanner.mdl"] = "Scanner.Body",
	["models/hunter.mdl"] = "MiniStrider.body_joint",
	["models/combine_turrets/floor_turret.mdl"] = "Barrel",
	["models/dog.mdl"] = "Dog_Model.Eye",
	["models/antlion.mdl"] = "Antlion.Body_Bone",
	["models/antlion_guard.mdl"] = "Antlion_Guard.Body",
	["models/antlion_worker.mdl"] = "Antlion.Head_Bone",
	["models/zombie/fast_torso.mdl"] = "ValveBiped.HC_BodyCube",
	["models/zombie/fast.mdl"] = "ValveBiped.HC_BodyCube",
	["models/headcrabclassic.mdl"] = "HeadcrabClassic.SpineControl",
	["models/headcrabblack.mdl"] = "HCBlack.body",
	["models/headcrab.mdl"] = "HCFast.body",
	["models/zombie/poison.mdl"] = "ValveBiped.Headcrab_Cube1",
	["models/zombie/classic.mdl"] = "ValveBiped.HC_Body_Bone",
	["models/zombie/classic_torso.mdl"] = "ValveBiped.HC_Body_Bone",
	["models/zombie/zombie_soldier.mdl"] = "ValveBiped.HC_Body_Bone",
	["models/combine_strider.mdl"] = "Combine_Strider.Body_Bone",
	["models/lamarr.mdl"] = "HeadcrabClassic.SpineControl",
	["models/crow.mdl"] = Vector( 0, 0, 5 ),
	["models/pigeon.mdl"] = Vector( 0, 0, 5 ),
	["models/seagull.mdl"] = Vector( 0, 0, 6 ),

}

snixzz.Bones = {
	
	["Head"] = "ValveBiped.Bip01_Head1",
	["Neck"] = "ValveBiped.Bip01_Neck1",
	["Spine"] = "ValveBiped.Bip01_Spine",
	["Spine2"] = "ValveBiped.Bip01_Spine2",
	["Spine4"] =  "ValveBiped.Bip01_Spine4",
	["Pelvis"] = "ValveBiped.Bip01_Pelvis",
	["R Upperarm"] = "ValveBiped.Bip01_R_UpperArm",
	["R Forearm"] = "ValveBiped.Bip01_R_Forearm",
	["R Hand"] = "ValveBiped.Bip01_R_Hand",
	["L Upperarm"] = "ValveBiped.Bip01_L_UpperArm",
	["L Forearm"] = "ValveBiped.Bip01_L_Forearm",
	["L Hand"] = "ValveBiped.Bip01_L_Hand",
	["R Thigh"] = "ValveBiped.Bip01_R_Thigh",
	["R Calf"] = "ValveBiped.Bip01_R_Calf",
	["R Foot"] = "ValveBiped.Bip01_R_Foot",
	["R Toes"] = "ValveBiped.Bip01_R_Toe0",
	["L Thigh"] = "ValveBiped.Bip01_L_Thigh",
	["L Calf"] = "ValveBiped.Bip01_L_Calf",
	["L Foot"] = "ValveBiped.Bip01_L_Foot",
	["L Toes"] = "ValveBiped.Bip01_L_Toe0",
	
}

snixzz.Hitboxes = {

	["Head"] = 0,	
	["L Upperarm"] = 1,
	["L Forearm"] = 2,
	["L Hand"] = 3,
	["R Upperarm"] = 4,
	["R Forearm"] = 5,
	["R Hand"] = 6,
	["L Thigh"] = 7,
	["L Calf"] = 8,
	["F Foot"] = 9,
	["L Toe"] = 10,
	["R Thigh"] = 11,
	["R Calf"] = 12,
	["R Foot"] = 13,
	["R Toe"] = 14,
	["Pelvis"] = 15,
	["Spine"] = 16,
	
}

snixzz.Hitscans = {
	0, -- head
	16, -- spine
	4, -- r upper arm
	1, -- l upper arm
	5, -- r forearm
	2, -- l forearm
	6, -- r hand
	3, -- l hand
	15, -- pelvis
	11, -- r thigh
	7, -- l thigh
	12, -- r calf
	8, -- l calf
	13, -- r foot
	9, -- l foot
}

snixzz.Hitgroups = {
	[HITGROUP_HEAD] = "Head",
	[HITGROUP_CHEST] = "Chest",
	[HITGROUP_STOMACH] = "Stomach",
	[HITGROUP_LEFTARM] = "Left Arm",
	[HITGROUP_RIGHTARM] = "Right Arm",
	[HITGROUP_LEFTLEG] = "Left Leg",
	[HITGROUP_RIGHTLEG] = "Right Leg",
}

local Hitbox
local HitboxPos
local Bone
local BonePos
local Hitscan
local HitscanPos
local HitMin, HitMax
function snixzz.GetPos( v )
	
	if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] && snixzz.IsProp( v ) then
		
		return v:LocalToWorld( v:OBBCenter() )
	
	elseif snixzz.Vars["aim_target_type"] == "NPC" or snixzz.Vars["aim_target_type"] == "Both" && v:IsNPC() then
		
		local special = snixzz.NPCModels[v:GetModel()]	
		
		if !special then	
			
			for k, v in G.next, snixzz.Bones do
				
				if v[1] == snixzz.Vars["aim_bone"] then
					
					special = v[2]
					
				end
				
			end
			
			special = special or "ValveBiped.Bip01_Head1"
			
		elseif type( special ) == "Vector" then
		
			return v:LocalToWorld( special )
		
		end
		
		local bone = v:LookupBone( special )
		
		if bone then
			
			local pos, ang = v:GetBonePosition( bone )
			
			return pos, ang
			
		end
		
	elseif snixzz.Vars["aim_target_type"] == "Players" or snixzz.Vars["aim_target_type"] == "Both" && v:IsPlayer() then
	
		if snixzz.Vars["aim_method"] == "Hitbox" then
		
			Hitbox = v:GetHitBoxBone( snixzz.Hitboxes[snixzz.Vars["aim_hitbox"]], 0 )	
			HitboxPos = v:GetBonePosition( Hitbox )
		
			local min, max = v:GetHitBoxBounds( snixzz.Hitboxes[snixzz.Vars["aim_hitbox"]], 0 )
			
			return HitboxPos + ( min + max ) / 2
			
		elseif snixzz.Vars["aim_method"] == "Bone" then
			
			Bone = snixzz.Bones[snixzz.Vars["aim_bone"]]
			BonePos = v:LookupBone( Bone )
			
			if BonePos then
				
				local pos, ang = v:GetBonePosition( BonePos )
				return pos, ang
			
			end
		
		elseif snixzz.Vars["aim_method"] == "Hitscan" then
			
			for k, e in G.next, snixzz.Hitscans do
			
				Hitscan = v:GetHitBoxBone( snixzz.Hitscans[k], 0 )

				if Hitscan != nil then
					
					HitscanPos = v:GetBonePosition( Hitscan )
					HitMin, HitMax = v:GetHitBoxBounds( snixzz.Hitscans[k], 0 )
					
					if snixzz.IsVisible( v, HitscanPos + ( HitMin + HitMax ) / 2 ) then
						
						snixzz.TargetBone = Hitscan

						return HitscanPos + ( HitMin + HitMax ) / 2
						
					end
					
				end
				
			end
		
		end		
		
	end

	return v:LocalToWorld( v:OBBCenter() )
end

function snixzz.InFov( v ) 
	-- wip
	return true
end

-- thanks asutorea
function snixzz.CanFire()
	
	local wep = G.LocalPlayer():GetActiveWeapon()
	
	if snixzz.properCurTime == nil then return false end
	
	return G.IsValid( wep ) && !snixzz.BadWeapons[wep:GetClass()] && wep:GetActivity() != ACT_RELOAD && wep:GetNextPrimaryFire() < snixzz.properCurTime && G.LocalPlayer():Alive()
end

-- pAntiAnti Aim
function snixzz.FixAngle( v )

	local eyeAngles = _R.Entity.EyeAngles( v )
	
	if eyeAngles.p < -89 then
		
		_R.Entity.SetPoseParameter( v, "aim_pitch", eyeAngles.p + 180 )
		_R.Entity.InvalidateBoneCache( v )
	
	elseif eyeAngles.p > 89 then
	
		_R.Entity.SetPoseParameter( v, "aim_pitch", eyeAngles.p - 180 )
		_R.Entity.InvalidateBoneCache( v )
	
	end
	
end

function snixzz.OnScreen( v )
	
	local a, f = _R.Player.GetAimVector( G.LocalPlayer() ):Angle() - ( v:GetPos() - G.LocalPlayer():GetShootPos() ):Angle(), _R.Player.GetFOV( G.LocalPlayer() )     
	
	return ( G.math.NormalizeAngle( a.y ) < f + 2 && G.math.NormalizeAngle( a.p ) < f + 2 )
end

function snixzz.IsDormant( index )
	
	return snixzz.Functions.IsDormant( index )

end

function snixzz.FixMove( ucmd, aa )
	
	local fixAngle = G.Vector( ucmd:GetForwardMove(), ucmd:GetSideMove(), 0 )
	fixAngle = (( fixAngle:GetNormal() ):Angle() + ( ucmd:GetViewAngles() - G.Angle( 0, snixzz.Silent.y, 0 ) ) ):Forward() * fixAngle:Length()
	
	if aa then
		
		ucmd:SetForwardMove( fixAngle.x )
		ucmd:SetSideMove( fixAngle.y * -1 )
		
		return	
	end
	
	ucmd:SetForwardMove( fixAngle.x )
	ucmd:SetSideMove( fixAngle.y )
	
end

function snixzz.NormalizeAngles( ang )
	
	ang.p = G.math.NormalizeAngle( ang.p )
	ang.y = G.math.NormalizeAngle( ang.y )
	ang.r = 0
	
	return ang
end

snixzz.PredPositions = {}
local tbl = snixzz.PredPositions[v] or {}

function snixzz.GetPredictionPos( v, pos )
	
	tbl.pos = tbl.pos or pos or _R.Entity.GetPos( v )
	
	local realTime = G.RealTime()
	
	if tbl.realTime != realTime then
		
		tbl.realTime = realTime
		tbl.pos = pos or _R.Entity.GetPos( v )
		
	end	
	
	tbl.velocity = v:GetVelocity()	
	snixzz.PredPositions = tbl	
	
	return tbl.pos
end

snixzz.PredictionMethods = { "Velocity 0.0075", "Engine Velocity", "Classic", "Herpes", "ColdFire", "FapHack", "fr1kin" }
snixzz.PredWeapons = {

	["weapon_crossbow"] = 3110,
	["weapon_frag"] = 3110,
	
}

local tPos, lVelocity, tVelocity, tDistance, predTime
-- Some methods are BASED on other cheat's methods, I suck at prediction.
function snixzz.Prediction( Pos, v )

	local wep = G.LocalPlayer():GetActiveWeapon()
	lVelocity = _R.Entity.GetVelocity( G.LocalPlayer() )
	tVelocity = _R.Entity.GetVelocity( v )
	tPos = _R.Entity.GetPos( v )
	lPos = _R.Entity.GetPos( G.LocalPlayer() )
	tDistance = lPos:Distance( tPos )
	
	if G.IsValid( v ) && G.type( tVelocity ) == "Vector" && G.type( tPos ) == "Vector" then		

		if wep && G.IsValid( wep ) && snixzz.PredWeapons[wep:GetClass()] then		
		
			predTime = distance / snixzz.PredWeapons[wep:GetClass()]
			Pos = Pos + tVelocity * predTime	
			
		else		
		
			if snixzz.Vars["aim_prediction_method"] == "Velocity 0.0075" then
				
				Pos = Pos + lVelocity * 0.0075 + tVelocity * 0.0075
					
			elseif snixzz.Vars["aim_prediction_method"] == "Engine Velocity" then
				
				Pos = Pos + tVelocity * G.engine.TickInterval() - lVelocity * G.engine.TickInterval()
				
			elseif snixzz.Vars["aim_prediction_method"] == "Classic" then
			
			Pos = Pos + tVelocity / 45 - lVelocity / 45
			
			elseif snixzz.Vars["aim_prediction_method"] == "Herpes" then
			
				tPos = snixzz.GetPredictionPos( v, Pos ) - Pos
				Pos = Pos + ( tPos * 2 ) - ( lVelocity / 50 )
			
			elseif snixzz.Vars["aim_prediction_method"] == "ColdFire" then
			
				Pos = Pos - tVelocity:GetNormal() / 5.8 + lVelocity:GetNormal() / 3
				
			elseif snixzz.Vars["aim_prediction_method"] == "FapHack" then
				
				Pos = Pos + tVelocity * 0.02 - lVelocity * 0.05
				
			elseif snixzz.Vars["aim_prediction_method"] == "fr1kin" then
			
				local targetFrames = RealFrameTime() / 25
				local plyFrames = RealFrameTime() / 66
				
				Pos = Pos + ( ( tVelocity * targetFrames ) - ( tVelocity * plyFrames ) ) - ( ( lVelocity * targetFrames ) + ( lVelocity * plyFrames ) )
				
			end	
			
		end
		
	end
	
	return Pos
end

function snixzz.GetTarget()
	
	local x, y = G.ScrW(), G.ScrH()
	local vPos
	local oldPos = G.LocalPlayer():EyePos():ToScreen()
	local distance = G.math.huge
	local AngA
	local AngB
	//local target
	
	local Method
	
	if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
		
		Method = G.ents.GetAll()
	
	elseif snixzz.Vars["aim_target_type"] == "NPC" then
		
		Method = G.ents.GetAll() 
		
	elseif snixzz.Vars["aim_target_type"] == "Players" then
	
		Method = G.player.GetAll()

	elseif snixzz.Vars["aim_target_type"] == "Both" then

		Method = G.ents.GetAll()
		
	end
	
	for k, v in G.next, Method do
	
		vPos = v:GetPos():ToScreen()
		distance2 = v:GetPos():DistToSqr( G.LocalPlayer():GetPos() )
		AngA = G.math.Dist( x / 2, y / 2, oldPos.x, oldPos.y )
		AngB = G.math.Dist( x / 2, y / 2, vPos.x, vPos.y )
		
		if snixzz.IsValid( v, "Aimbot" ) then
		
			if snixzz.Vars["aim_target_method"] == "Distance" then
				
				if distance2 < distance then
				
					distance = distance2
					return v
				
				end
				
			elseif snixzz.Vars["aim_target_method"] == "Crosshair" then
			
				if AngB <= AngA then
				
					return v
					
				end
				
			end	
			
		else
		
			continue
			
		end
		
	end
	
	return nil
end

snixzz.Firing = false
function snixzz.Fire( ucmd )

	if snixzz.Firing then
	
		ucmd:RemoveKey( G.IN_ATTACK )
		snixzz.Firing = false
		
	else
	
		ucmd:SetButtons( G.bit.bor( ucmd:GetButtons(), G.IN_ATTACK ) )
		snixzz.Firing = true
		
	end
	
end

snixzz.FakeSwitch = false
snixzz.FakeAngle = G.Angle()
snixzz.AntiAimMethods = { "Classic", "Classic Inverted", "Static", "Jitter", "Random Pitch", "Fake Angles", "Fake Jitter", "Spin", "Fake Spin" }
function snixzz.AntiAim( ucmd )

	local pitches = { -181, 541, 262 }
	local yaws = { 262, -262, 181, -181, 541, -541 }
	
	-- OG anti-aim
	if snixzz.Vars["aim_anti_method"] == "Classic" then
		
		snixzz.Functions.SetViewAngles( ucmd, G.Angle( 181, ucmd:GetViewAngles().y, 180 ) )
		snixzz.FixMove( ucmd )
		
	-- Looking down instead of up
	elseif snixzz.Vars["aim_anti_method"] == "Classic Inverted" then
		
		snixzz.Functions.SetViewAngles( ucmd, G.Angle( -181, ucmd:GetViewAngles().y, 180 ) )
		snixzz.FixMove( ucmd )
		
	-- Static
	elseif snixzz.Vars["aim_anti_method"] == "Static" then
		
		snixzz.Functions.SetViewAngles( ucmd, G.Angle( -snixzz.Angles.p + 900, snixzz.Angles.y + 180, 0 ) )
		snixzz.FixMove( ucmd, true )
		
	-- Jitter - credits to cdriza
	elseif snixzz.Vars["aim_anti_method"] == "Jitter" then
		
		snixzz.Functions.SetViewAngles( ucmd, G.Angle( G.table.Random( pitches ), G.table.Random( yaws ), 0 ) )
		snixzz.FixMove( ucmd, true )
		
	-- Randomized pitch
	elseif snixzz.Vars["aim_anti_method"] == "Random Pitch" then
	
		snixzz.Functions.SetViewAngles( ucmd, G.Angle( G.math.random( -180, -186.49999 ), ucmd:GetViewAngles().y, 180 ) )
		snixzz.FixMove( ucmd )
		
	-- bSendPacket Fake Angles
	elseif snixzz.Vars["aim_anti_method"] == "Fake Angles" then
		
		snixzz.FakeAngle = ucmd:GetViewAngles()
		
		if snixzz.FakeSwitch then
			
			bSendPacket = true
			//snixzz.Functions.SendPacket( true )
			snixzz.Functions.SetViewAngles( ucmd, G.Angle( -192, snixzz.FakeAngle.y + 90, 0 ) )
		
		else
			
			bSendPacket = false			
			snixzz.Functions.SetViewAngles( ucmd, G.Angle( -192, snixzz.FakeAngle.y - 90, 0 ) )
		
		end
		
		snixzz.FixMove( ucmd, true )
		snixzz.FakeSwitch = !snixzz.FakeSwitch
	
	-- bSendPacket Fake Jitter
	elseif snixzz.Vars["aim_anti_method"] == "Fake Jitter" then
		
		snixzz.FakeAngle = ucmd:GetViewAngles()
		
		if snixzz.FakeSwitch then
			
			bSendPacket = true
			snixzz.Functions.SetViewAngles( ucmd, G.Angle( G.math.random( -180, -186.49999 ), snixzz.FakeAngle.y + 90, 0 ) )
		
		else
			
			bSendPacket = false			
			snixzz.Functions.SetViewAngles( ucmd, G.Angle( G.math.random( -180, -186.49999 ), snixzz.FakeAngle.y - 90, 0 ) )
		
		end
		
		snixzz.FixMove( ucmd, true )
		snixzz.FakeSwitch = !snixzz.FakeSwitch
		
	
		
	-- Simple spinbot with -192 pitch
	elseif snixzz.Vars["aim_anti_method"] == "Spin" then
		
		snixzz.Functions.SetViewAngles( ucmd, ucmd:GetViewAngles() + G.Angle( 0, G.math.fmod( G.CurTime() / .1 * 2 * snixzz.Vars["aim_anti_spin_speed"], 360 ), 0 ) )
		snixzz.FixMove( ucmd, false )
	
	-- bSendPacket Spinbot
	elseif snixzz.Vars["aim_anti_method"] == "Fake Spin" then
		
		snixzz.FakeAngle = ucmd:GetViewAngles()
		
		if FakeSwitch then
			
			bSendPacket = true			
			snixzz.Functions.SetViewAngles( ucmd, ucmd:GetViewAngles() + G.Angle( 0, G.math.fmod( G.CurTime() / .1 * 2 * snixzz.Vars["aim_anti_spin_speed"], 360 ), 0 ) )
		
		else
			
			bSendPacket = false
			snixzz.Functions.SetViewAngles( ucmd, ucmd:GetViewAngles() + G.Angle( 0, -G.math.fmod( G.CurTime() / .1 * 2 * snixzz.Vars["aim_anti_spin_speed"], 360 ), 0 ) )
		
		end
		
		snixzz.FixMove( ucmd, false )
	
	end
	
end

-- To shorten up my aimbot checks a bit.
function snixzz.ShouldAim( ucmd, isToggled )
	
	return snixzz.Target && snixzz.IsValid( snixzz.Target, "Aimbot" ) && ucmd:CommandNumber() != 0// && snixzz.CanFire()	
	
end

function snixzz.InMenu()

	return snixzz.Typing && snixzz.ChatboxOpen && G.gui.IsConsoleVisible() && G.gui.IsGameUIVisible()

end

/*=======================


Hooked functions below


=========================*/
snixzz.Status = "Waiting..."
snixzz.StatusColor = Color( 255, 255, 0, 150 )
snixzz.Silent = G.Angle()
snixzz.BulletTime = true
snixzz.StuckSwitch = false
snixzz.StuckTicks = 0
snixzz.pDelay = 0
//snixzz.SpreadPos = G.Vector( 0, 0, 0 )

function snixzz.CreateMove( ucmd )

	-- cl noclip
	if snixzz.Bools["misc_csnoclip"] then
	
		ucmd:SetForwardMove( 0 )
		ucmd:SetUpMove( 0 )
		ucmd:SetSideMove( 0 )
		
	end

	// Silent aim
	snixzz.Silent = snixzz.Silent + G.Angle( ucmd:GetMouseY() * 0.022, -ucmd:GetMouseX() * 0.022, 0 )
	snixzz.Silent.p = G.math.Clamp( snixzz.Silent.p, -89, 89 )
	snixzz.Silent.y = G.math.NormalizeAngle( snixzz.Silent.y )
	
	ucmd:SetViewAngles( snixzz.Silent ) 
			
	if ucmd:CommandNumber() == 0 then

		return
	end		
	
	if !snixzz.Bools["aim_holdtarget"] then 
		
		snixzz.Target = snixzz.GetTarget()
		
	end
	
	snixzz.Offset = G.Vector( 0, 0, snixzz.Vars["aim_offset"] )
			
	snixzz.Angles = snixzz.Silent
	
	// Aimbot core
	if ( snixzz.Binds["+aimbot"] != nil && G.input.IsKeyDown( snixzz.Binds["+aimbot"] ) && !snixzz.ChatboxOpen && !snixzz.Typing or snixzz.Bools["aim_toggle"] ) then
		
		if snixzz.Bools["aim_holdtarget"] then
		
			if snixzz.Target == nil or snixzz.Target != nil && !snixzz.IsValid( snixzz.Target, "Aimbot" ) then
			
				snixzz.Target = snixzz.GetTarget()
			 
			end
			
		end
		
		if snixzz.ShouldAim( ucmd, snixzz.Bools["aim_toggle"] ) then
		
			snixzz.Angles = snixzz.GetPos( snixzz.Target ) - snixzz.Offset
			
			if snixzz.Bools["aim_prediction"] then
				
				snixzz.Angles = snixzz.Prediction( snixzz.Angles, snixzz.Target )
				
			end
				
			snixzz.Angles = ( snixzz.Angles - G.LocalPlayer():GetShootPos() ):Angle()
			
			-- View punch fix
			if snixzz.Bools["aim_norecoil"] then
				
				snixzz.CorrectRecoil( ucmd )
				
			end
				
			-- Spread Prediction
			if snixzz.Bools["aim_nospread"] then
			
				if snixzz.Bools["aim_badshots"] then
					
					if G.math.random( 1, 5 ) == 1 then
					
						snixzz.Angles = snixzz.Angles
						
					else
		
						snixzz.Angles = snixzz.PredictSpread( ucmd, G.Angle( snixzz.Angles.p, snixzz.Angles.y, 0 ) )
						
					end
					
				else
					
					snixzz.Angles = snixzz.PredictSpread( ucmd, G.Angle( snixzz.Angles.p, snixzz.Angles.y, 0 ) )
					
				end
				
			end
			
			snixzz.NormalizeAngles( snixzz.Angles )
			
			-- Set angles
			snixzz.Functions.SetViewAngles( ucmd, snixzz.Angles )	

			-- autofire
			if snixzz.Bools["aim_autoshoot"] then
				
				snixzz.Fire( ucmd )		
				
			end
			
			-- Silent aim view & move correction
			if snixzz.Bools["aim_silent"] then
				
				snixzz.FixMove( ucmd )
				
			else
				
				snixzz.Silent = snixzz.Angles
				
			end
				
			-- ghetto aimbot status
			if snixzz.Target:IsPlayer() then
			
				snixzz.Status = "Locked! (" .. snixzz.Target:Nick() .. ")"
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Locked = true
				
			elseif snixzz.Target:IsNPC() then
				
				snixzz.Status = "Locked! (" .. snixzz.Target:GetModel() .. ")"
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Locked = true
				
			elseif snixzz.IsProphunt && snixzz.IsProp( snixzz.Target ) && snixzz.IsProp( snixzz.Target ) then
				
				snixzz.Status = "Locked! (" .. snixzz.Target:GetOwner():Name() .. ")"
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Locked = true

			end
							
		else
			
			snixzz.Target = nil
			snixzz.Status = "Searching..."
			snixzz.StatusColor = Color( 0, 255, 0, 150 )
			snixzz.Locked = false	
		
		end
	
	else
		
		snixzz.Target = nil
		snixzz.Status = "Searching..."
		snixzz.StatusColor = Color( 0, 255, 0, 150 )
		snixzz.Locked = false	
	
	end
	
	-- Rapid-Fire
	if snixzz.Bools["misc_rapidfire"] && ucmd:KeyDown( IN_ATTACK ) && !snixzz.Locked then
		
		snixzz.Fire( ucmd )
		
	end

	-- Triggerbot
	if snixzz.Binds["+triggerbot"] != nil && snixzz.Bools["misc_triggerbot"] or G.input.IsKeyDown( snixzz.Binds["+triggerbot"] ) then
		
		snixzz.StatusColor = Color( 255, 255, 0, 150 )
		snixzz.Status = "Triggerbot Searching.."
		local hitgroup = G.LocalPlayer():GetEyeTrace().HitGroup
		local entity = G.LocalPlayer():GetEyeTrace().Entity
		snixzz.SpreadPos = G.LocalPlayer():GetEyeTrace().HitPos
		
		if snixzz.Vars["misc_triggerbot_type"] == "NPC" or snixzz.Vars["misc_triggerbot_type"] == "Both" && entity:IsNPC() then
			
			if snixzz.IsValid( entity, "Triggerbot" ) then
				
				if snixzz.Bools["misc_triggerbot_nospread"] then
					
					snixzz.NoSpreadAng = ( snixzz.SpreadPos - G.LocalPlayer():GetShootPos() ):GetNormal():Angle()
					snixzz.NoSpreadAng = snixzz.PredictSpread( ucmd, snixzz.NoSpreadAng )
					snixzz.Functions.SetViewAngles( ucmd, snixzz.NoSpreadAng )
					
				end
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Status = "Firing! (" .. entity:GetModel() .. ")"
			
				snixzz.Fire( ucmd )
				
			end
		
		elseif snixzz.Vars["misc_triggerbot_method"] == "Body" then
			
			if snixzz.IsValid( entity, "Triggerbot" ) then
								
				if snixzz.Bools["misc_triggerbot_nospread"] then
					
					snixzz.NoSpreadAng = ( snixzz.SpreadPos - G.LocalPlayer():GetShootPos() ):GetNormal():Angle()
					snixzz.NoSpreadAng = snixzz.PredictSpread( ucmd, snixzz.NoSpreadAng )
					snixzz.Functions.SetViewAngles( ucmd, snixzz.NoSpreadAng )
					
				end
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Status = "Firing! (" .. entity:Nick() .. ")"
			
				snixzz.Fire( ucmd )
				
			end
			
		elseif snixzz.Vars["misc_triggerbot_method"] == "Hitbox" then
			
			if snixzz.Hitgroups[hitgroup] != nil && snixzz.IsValid( entity, "Triggerbot" ) then
								
				if snixzz.Bools["misc_triggerbot_nospread"] then
					
					snixzz.NoSpreadAng = ( snixzz.SpreadPos - G.LocalPlayer():GetShootPos() ):GetNormal():Angle()
					snixzz.NoSpreadAng = snixzz.PredictSpread( ucmd, snixzz.NoSpreadAng )
					snixzz.Functions.SetViewAngles( ucmd, snixzz.NoSpreadAng )
					
				end
				
				snixzz.StatusColor = Color( 255, 0, 0, 150 )
				snixzz.Status = "Firing! (" .. entity:Nick() .. ")"
				
				snixzz.Fire( ucmd ) 
				
			end
			
		end
		
	end
	
	-- Anti-Aim
	if snixzz.Bools["aim_anti"] && !snixzz.Locked && !ucmd:KeyDown( IN_ATTACK ) && !ucmd:KeyDown( IN_USE ) && G.LocalPlayer():GetMoveType() != MOVETYPE_LADDER then
		
		snixzz.AntiAim( ucmd )
		
	end	
	
	// Bunnyhop & autostrafe
	if snixzz.Bools["misc_bhop"] then
		
		if !G.LocalPlayer():GetMoveType() != MOVETYPE_NOCLIP && G.LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !snixzz.Typing then		
			
			if !G.LocalPlayer():OnGround() && ucmd:KeyDown( IN_JUMP )then				
				
				ucmd:SetButtons( G.bit.band( ucmd:GetButtons(), G.bit.bnot( IN_JUMP ) ) )
				
				-- Autostrafe shamelessly ripped from "public hvh v1".
				-- i don't understand this shit.
				if snixzz.Bools["misc_autostrafe"] then
					
					if ucmd:GetMouseX() > 1 or ucmd:GetMouseX() < - 1 then
						
						ucmd:SetSideMove( ucmd:GetMouseX() > 1 && 400 or -400 )
						
					else
						
						ucmd:SetForwardMove( 5850 / G.LocalPlayer():GetVelocity():Length2D() )
						ucmd:SetSideMove( ( ucmd:CommandNumber() % 2 == 0 ) && -400 or 400 ) -- what the fuck. who thought of this shit.
						
					end
					
				end
				
			elseif ucmd:KeyDown( IN_JUMP ) && snixzz.Bools["misc_autostrafe"] then
				
				ucmd:SetForwardMove( 10000 )
							
			end			
			
		end		
		
	end

end

snixzz.CSNoclipPos = {}
function snixzz.CalcView( ply, origin, angles, fov )

	local ply = G.LocalPlayer()
	local wep = ply:GetActiveWeapon()
	local noclipSpeed = snixzz.Vars["misc_csnoclip_speed"] * ( FrameTime() / 2 ) * 100
	local view = {}
		
	// Advanced NoRecoil. TODO: Recoil Control System
	if snixzz.Bools["aim_norecoil"] then
		
		if wep.Primary then
		
			if !snixzz.RecoilBackup[wep:GetClass()] then
				snixzz.RecoilBackup[wep:GetClass()] = wep.Primary.Recoil
			end
			
			wep.Primary.Recoil = 0
			
		elseif wep.Secondary then
		
			if !snixzz.RecoilBackup then
			
				snixzz.RecoilBackup[wep:GetClass()] = wep.Secondary.Recoil
				
			end
			
			wep.Secondary.Recoil = 0
			
		end
	else
	
		if wep.Primary then
		
			if wep.Primary.Recoil == 0 then
			
				wep.Primary.Recoil = snixzz.RecoilBackup[wep:GetClass()]
				
			end
			
		else
		
			if wep.Secondary then
			
				if wep.Secondary.Recoil == 0 then
				
					wep.Secondary.Recoil = snixzz.RecoilBackup[wep:GetClass()]
					
				end
				
			end
			
		end
		
	end
		
	if snixzz.Bools["misc_csnoclip"] && snixzz.CSNoclipPos then

		local ang = snixzz.Silent:Forward()
		
		if LocalPlayer():KeyDown( IN_FORWARD ) then
			
			snixzz.CSNoclipPos = snixzz.CSNoclipPos + LocalPlayer():GetAimVector() * noclipSpeed
			
		end
		
		if LocalPlayer():KeyDown( IN_BACK ) then
			
			snixzz.CSNoclipPos = snixzz.CSNoclipPos - LocalPlayer():GetAimVector() * noclipSpeed
			
		end
		
		if LocalPlayer():KeyDown( IN_MOVERIGHT ) then
			
			snixzz.CSNoclipPos = snixzz.CSNoclipPos + ang:Angle():Right() * noclipSpeed
			
		end
		
		if LocalPlayer():KeyDown( IN_MOVELEFT ) then
			
			snixzz.CSNoclipPos = snixzz.CSNoclipPos - ang:Angle():Right() * noclipSpeed
			
		end

	else 
		
		snixzz.CSNoclipPos = LocalPlayer():EyePos()
		
	end
	
	view.angles = ( snixzz.Bools["aim_silent"] or snixzz.Bools["aim_anti"] ) && snixzz.Silent or angles
		
	view.fov = snixzz.Vars["esp_fov"]
	
	//view.origin = snixzz.Bools["misc_thirdperson"] && ( origin - snixzz.Silent:Forward() * snixzz.Vars["misc_thirdperson_distance"] ) or origin
	
	if snixzz.Bools["misc_thirdperson"] then
		
		view.origin =  origin - snixzz.Silent:Forward() * snixzz.Vars["misc_thirdperson_distance"] or origin
		
	elseif snixzz.Bools["misc_csnoclip"] then
		
		view.origin = snixzz.CSNoclipPos
		
	else
		
		view.origin = origin
		
	end

	return view	
end

-- Autism as FUCK
function snixzz.Color( col )

	if snixzz.Bools["esp_rainbow"] then
		
		return G.HSVToColor( RealTime() * 120 % 360, 1, 1 )

	end
		
	return col

end

// GetColor func
function snixzz.GetESPColor( v )
	
	if snixzz.Bools["misc_murder_finder"] && snixzz.IsMurder then
		
		if snixzz.IsMurderer( v ) then
		
			return G.Color( 255, 0, 0 )
			
		elseif snixzz.HasMagnum( v ) then
			
			return G.Color( 0, 255, 255 )
			
		else 
			
			return G.Color( 0, 255, 0 )
			
		end
		
	elseif snixzz.Bools["misc_prophunt_finder"] && snixzz.IsProphunt then
		
		if snixzz.IsProp( v ) then
			
			return G.Color( 255, 0, 0 )
			
		else
		
			return G.Color( 0, 255, 0 )
			
		end
		
	end
	
	if v:IsNPC() then
		
		return G.Color( 0, 255, 0 )
		
	end
	
	if snixzz.Entities[v:GetClass()] then
		
		return G.Color( 255, 255, 255 )
		
	end
	
	if v:GetFriendStatus() == "friend" then
		
		return G.HSVToColor( RealTime() * 120 % 360, 1, 1 )
	
	end
	
	if snixzz.Bools["misc_traitor_finder"] && snixzz.IsTTT && snixzz.IsTraitor( v ) then
		
		return G.Color( 255, 0, 0 )
		
	else
		
		return snixzz.Color( G.team.GetColor( v:Team() ) )
	
	end
	
	return G.Color( 255, 255, 255 )
	
end

function snixzz.HUDPaint()

	local textpos;
	local x1, y1, x2, y2;
	local diff;
	local diff2;
	local color;
	local startx;
	local starty;
	local endpos;
	local pos;
	local wep = G.LocalPlayer():GetActiveWeapon()
	local viewmodel = G.LocalPlayer():GetViewModel()		
	local weapon
	local dynLight
	local playerPos
	local targetPos
	local mats = EntM.GetMaterials( game.GetWorld() )	
	
	-- Menu header
	if snixzz.MenuOpen then
		
		G.surface.SetDrawColor( snixzz.Color( snixzz.Vars["misc_menucolor2"] ) )
		G.surface.DrawRect( 20, 50, 420, 60 )
		
		G.surface.SetDrawColor( Color( 0, 0, 0, 255 ) )
		G.surface.DrawOutlinedRect( 20, 50, 420, 60, 2 )		

		G.draw.SimpleTextOutlined( "snixzz3", "snixzz_logo", 25, 55, snixzz.Color( snixzz.Colors.White ), TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT, 1.5, Color( 0, 0, 0 ) )
		G.draw.SimpleTextOutlined( "by 0xymoron", "snixzz_logo_small", G.surface.GetTextSize( "snixzz3" ) + 30, 65, snixzz.Color( snixzz.Colors.White ), TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT, 1, Color( 0, 0, 0 ) )
		
		-- Is VIP?
		G.draw.SimpleTextOutlined( "VIP:", "snixzz_logo_small", 
			//190, 65, 
			snixzz.Frame:GetWide() / 2 - surface.GetTextSize( "VIP:" ) / 2, 65,
			snixzz.Colors.White, TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT, 1, Color( 0, 0, 0 ) 
		)		
		
		-- Texture
		G.surface.SetMaterial( Material( snixzz.IsVIP() == true && "icon16/accept.png" or snixzz.IsVIP() == false && "icon16/cancel.png" ) )
		G.surface.SetDrawColor( color_white )
		G.surface.DrawTexturedRect( snixzz.Frame:GetWide() / 2 - surface.GetTextSize( "VIP:" ) / 2 + 22, 65, 16, 16 )
		
		-- Big ass shit
		G.draw.SimpleTextOutlined( 
			snixzz.Info.Version .. "   Last Updated: " .. snixzz.Info.Updated, 
			"snixzz_logo_small", 
			snixzz.Frame:GetWide() + 15, snixzz.Frame:GetTall() - 352,
			snixzz.Colors.White, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color( 30, 30, 30, 255 ) 
		)
		
	end
	
	if snixzz.Panic then return end
	if !snixzz.Bools["esp_enabled"] then return end
	
	-- Watermark
	if !snixzz.IsVIP() then
	
		G.draw.SimpleTextOutlined( "snixzz3 " .. snixzz.Info.Version .. " - snixzz.net", "snixzz_logo", G.ScrW() - 10, 25, G.HSVToColor( G.RealTime() * 120 % 360, 1, 1 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, G.Color( 0, 0, 0 ) )
	
	end
	
	-- Laser Sight
	if snixzz.Bools["esp_laser"] then
					
		if viewmodel && G.IsValid( wep ) && G.IsValid( viewmodel ) then
			
			if wep:GetClass() != "weapon_physgun" then
						
				local muzzle = viewmodel:LookupAttachment( "muzzle" )
				
				if muzzle == 0 then
					
					muzzle = viewmodel:LookupAttachment( "1" )
			
				end
							
				local trace = G.LocalPlayer():GetEyeTrace().HitPos
							
				if viewmodel:GetAttachment( muzzle ) then						
					
					G.cam.Start3D( G.EyePos(), G.EyeAngles() )
									
						local startpos = viewmodel:GetAttachment( muzzle ).Pos						
						local endpos = trace	
									
						if snixzz.Bools["aim_silent"] && snixzz.Locked && G.IsValid( snixzz.Target ) then
							
							endpos = snixzz.GetPos( snixzz.Target )
							
						else
							
							endpos = trace
							
						end
									
						-- Laser
						G.render.SetMaterial( G.Material( "trails/laser" ) )													
						G.render.DrawBeam( startpos, endpos, 4, 0, 0, snixzz.Color( snixzz.Vars["misc_lasercolor"] ) )
								
						-- HitPos Dot
						G.render.SetMaterial( G.Material( "Sprites/light_glow02_add_noz" ) )
						
							G.render.DrawQuadEasy( 
							endpos, -- trace
							( G.EyePos() - trace ):GetNormal(), 
							25, 25, 
							Color( 255, 255, 255, 255 ), 0 
							
						)
								
					G.cam.End3D()
					
				end
				
			end
			
		end
		
	end
	
	for k, v in G.next, mats do
			
		local mat = G.Material( v )
			
		if !snixzz.Bools["esp_asus_walls"] then
			
			MatM.SetFloat( mat, "$alpha", 1 )
			
			continue
			
		end
			
		MatM.SetFloat( mat, "$alpha", .56 )
		
	end		
	
	-- Dynamic Light around player
	if snixzz.Bools["esp_dynamiclight"] then
	
		dynLight = G.DynamicLight( G.LocalPlayer():EntIndex() )
		dynLight.pos = G.LocalPlayer():GetShootPos()
		dynLight.r = 255
		dynLight.g = 255
		dynLight.b = 255
		dynLight.brightness = 1.75
		dynLight.Decay = 850
		dynLight.Size = 250
		dynLight.DieTime = G.CurTime() + 1
		
	end
	
	if G.IsValid( viewmodel ) then
	
		if snixzz.Bools["esp_wireweapon"] then
			
			_R.Entity.SetMaterial( viewmodel, "models/wireframe" )
			_R.Entity.SetColor( viewmodel, snixzz.Color( snixzz.Vars["misc_lasercolor"] ) )
			
		else
		
			_R.Entity.SetMaterial( viewmodel, "" )
			_R.Entity.SetColor( viewmodel, Color( 255, 255, 255 ) )
			
		end
		
	end
	
	local Method
	
	if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
		
		Method = G.ents.GetAll()
	
	elseif snixzz.Vars["esp_type"] == "NPC" or snixzz.Vars["esp_type"] == "All" or snixzz.Vars["esp_type"] == "Entities" then
		
		Method = G.ents.GetAll()
		
	elseif snixzz.Vars["esp_type"] == "Players" then
		
		Method = G.player.GetAll()
		
	end
			
	for k, v in G.next, Method do
		
		if snixzz.IsValid( v, "ESP" ) then	

			textpos = 0 -- -2
			
			x1, y1, x2, y2 = snixzz.GetBounds( v )
			diff = G.math.abs( x2 - x1 )
			diff2 = G.math.abs( y2 - y1 )
			
			playerPos = snixzz.GetPos( v )
			color = snixzz.GetESPColor( v )	

			if v:IsPlayer() or v:IsNPC() then
				
				if G.IsValid( v:GetActiveWeapon() ) then
					
					weapon = v:GetActiveWeapon():GetPrintName()
					
				else
					
					weapon = "Unknown"
					
				end		
				
			else
				
				weapon = "nil"
				
			end
				
			if v:IsPlayer() or snixzz.IsProphunt && snixzz.IsProp( v ) then
				
				if snixzz.IsMurder then
				
					if snixzz.Bools["esp_name"] then
						
						G.draw.SimpleText( v:GetBystanderName() .. " (" .. v:Nick() .. ")", "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
						textpos = textpos + 12
						
					end
				
				elseif snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] then
					
					if snixzz.IsProp( v ) then
					
						G.draw.SimpleText( v:GetOwner():Name(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
						textpos = textpos + 12
					
					elseif v:Team() != TEAM_PROPS && v:GetClass() != "ph_prop" then
					
						G.draw.SimpleText( v:Nick(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
						textpos = textpos + 12
					
					end
					
				else
				
					if snixzz.Bools["esp_name"] then
						
						G.draw.SimpleText( v:Nick(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
						textpos = textpos + 12
						
					end
					
				end
				
			elseif v:IsNPC() then
				
				G.draw.SimpleText( v:GetModel(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				textpos = textpos + 12
				
			elseif snixzz.Entities[v:GetClass()] then
			
				G.draw.SimpleText( v:GetClass(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				textpos = textpos + 12
				
			end	
			
			if snixzz.Bools["esp_health_text"] then
			
				if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] && snixzz.IsProp( v ) then
				
					G.draw.SimpleText( "HP: " .. v:GetOwner():Health(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
					textpos = textpos + 12

				elseif !snixzz.Entities[v:GetClass()] then
						
					G.draw.SimpleText( "HP: " .. v:Health(), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
					textpos = textpos + 12
						
				end
					
			end	
			
			-- Health Bar
			if snixzz.Bools["esp_health_bar"] && !snixzz.Entities[v:GetClass()] then
				
				local health = v:Health()
					
				if snixzz.IsProphunt && snixzz.Bools["misc_prophunt_finder"] && snixzz.IsProp( v ) then
						
					health = v:GetOwner():Health()
						
				end
					
				G.surface.SetDrawColor( Color( 0, 0, 0 ) )
				G.surface.DrawRect( x1 -6, y1, 3, diff2 )
				G.surface.SetDrawColor( Color( 0, 255, 0 ) )
				G.surface.DrawRect( x1 - 6, y2 - diff2 / 100 * health, 3, diff2 / 100 * health )

			end
			
			-- ESP weapon
			if v:IsPlayer() or v:IsNPC() then
			
				if snixzz.Bools["esp_weapon"] then
						
					G.draw.SimpleText( weapon, "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
					textpos = textpos + 12
						
				end
				
				-- Snaplines
				if snixzz.Bools["esp_snaplines"] then
						
					startx = G.ScrW() / 2
					starty = G.ScrH() / 2
					endpos = playerPos:ToScreen()
							
					G.surface.SetDrawColor( color )
					G.surface.DrawLine( startx, starty, endpos.x, endpos.y )
						
				end
		
			end	
				
			-- Distance ESP
			if snixzz.Bools["esp_distance"] then
				
				G.draw.SimpleText( "D: " .. G.math.Round( v:GetPos():Distance( G.LocalPlayer():GetPos() ) ), "ESPFont", x2 + 2, y1 + textpos, color, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT )
				textpos = textpos + 12
					
			end
				
				
			// Box ESP
			if snixzz.Bools["esp_box"] then
				
				snixzz.DrawOutlinedBox( x1, y1, diff, diff2, snixzz.Vars["esp_box_width"], color )
				
			end
			
			-- taken from newsbot for debug purposes
			if snixzz.Bools["esp_hitbox"] then
				
				for group = 0, EntM.GetHitBoxGroupCount( v ) do
				
					local count = EntM.GetHitBoxCount( v, group ) - 1
					
					for hitbox = 0, count do
					
						local bone = EntM.GetHitBoxBone( v, hitbox, group )
						
						if !bone then continue end
						
						local min, max = EntM.GetHitBoxBounds( v, hitbox, group )
						
						local bonepos, boneang = EntM.GetBonePosition( v, bone )
						
						G.cam.Start3D()
							
							if snixzz.Vars["aim_target_method"] == "Hitscan" && snixzz.TargetBone != nil && bone == snixzz.TargetBone then
							
								G.render.DrawWireframeBox( bonepos, boneang, min, max, Color( 255, 0, 0 ), true )
							
							else
							
								G.render.DrawWireframeBox( bonepos, boneang, min, max, Color( 255, 255, 255 ), true )
								
							end
							
						G.cam.End3D()
						
					end
					
				end
				
			end
				
			-- Chams! Much faster than RenderScreenSpaceEffects
			if snixzz.Bools["esp_chams"] then
				
				G.cam.Start3D()
					
					if snixzz.Vars["esp_chams_material"] == "Solid" then
						
						v:SetMaterial( "models/debug/debugwhite" )
						
					elseif snixzz.Vars["esp_chams_material"] == "Wireframe" then
					
						v:SetMaterial( "models/wireframe" )
					
					elseif snixzz.Vars["esp_chams_material"] == "XQZ" then
						
						v:SetMaterial( "" )
						
					end
						
					-- Weapon Chams
					if v:IsPlayer() or v:IsNPC() then
					
						if G.IsValid( v:GetActiveWeapon() ) then
							
							v:GetActiveWeapon():DrawModel()
							
						end
						
					end
						
					-- Player chams
					if snixzz.Vars["esp_chams_material"] != "XQZ" then
						
						G.render.SetColorModulation( color.r / 255, color.g / 255, color.b / 255 )
						
					end
					
					v:DrawModel()	
					//v:SetColor( Color( 255, 255, 255 ) )	
					v:SetMaterial( "" )

				G.cam.End3D()
				
			end
									
			-- For prediction testing & shit
			if snixzz.Bools["esp_aimpos"] then
				
				local predictedPos = snixzz.Prediction( playerPos, v ):ToScreen()
			
				G.draw.RoundedBox( 4, predictedPos.x, predictedPos.y, 7, 7, Color( 255, 0, 0, 255 ) )
				
			end
			
		else
		
			continue
			
		end	
	
	end

	// Aim status & shit
	if snixzz.Bools["esp_status"] then
		
		G.draw.DrawText( snixzz.Status, "snixzz_status", G.ScrW() / 2, G.ScrH() * 0.5 + 50, snixzz.StatusColor, TEXT_ALIGN_CENTER )
		
	end
	
	// Crosshair
	local x = ScrW() / 2
	local y = ScrH() / 2
	
	local crosscolor = Color( 0, 0, 0, 255 )
	local crosslength = 50
	local gap = 2
	
	local boxsize = 5
		
	-- Box
	if snixzz.Bools["esp_crosshair_box"] then
		
		G.surface.SetDrawColor( snixzz.Color( Color( 255, 255, 255 ) ) )
		G.surface.DrawOutlinedRect( x - boxsize - 2, y - boxsize - 2, ( boxsize + 2 ) * 2 + 1, ( boxsize + 2 ) * 2 + 1 )
		
	end
	
	-- Crosshair
	if snixzz.Bools["esp_crosshair"] then
		
		G.surface.SetDrawColor( snixzz.Color( Color( 0, 0, 0, 255 ) ) )
		G.surface.DrawLine( x - crosslength, y, x - gap, y )
		G.surface.DrawLine( x + crosslength, y, x + gap, y )
		
		G.surface.DrawLine( x, y - crosslength, x, y - gap )
		G.surface.DrawLine( x, y + crosslength, x, y + gap )
		
	end
	
	-- Menu opening
	if snixzz.Binds["+menu"] != nil then
	
		if G.input.IsKeyDown( snixzz.Binds["+menu"] ) && !snixzz.Typing && !snixzz.MenuOpen && !G.gui.IsConsoleVisible() then
			
			snixzz.Menu()
			snixzz.MenuOpen = true
			
		end
		
	end
	
	-- Console Opening
	if G.input.IsKeyDown( KEY_Q ) && G.input.IsKeyDown( KEY_TAB ) && !snixzz.Typing && !snixzz.ConsoleOpen && !G.gui.IsConsoleVisible() then
		
		snixzz.Console()
		snixzz.ConsoleOpen = true
		
	end
	
	-- Chat opening
	if !snixzz.ChatboxOpen && !snixzz.Typing && !snixzz.ConsoleOpen && !G.gui.IsConsoleVisible() then
		
		if G.input.IsKeyDown( snixzz.Binds["chat"] ) then
			
			snixzz.OpenChat()
			snixzz.ChatboxOpen = true
			
		end
		
	end
	
end

snixzz.properCurTime = 0
snixzz.LagVar = 12
snixzz.LagTicks = 0
local dynLight
function snixzz.Move()

	if G.IsFirstTimePredicted() then return end
	snixzz.properCurTime = G.CurTime() + G.engine.TickInterval()	
			
	// No hands
	if snixzz.Bools["esp_nohands"] then
		
		snixzz.Functions.NoDraw( G.Material( "models/weapons/v_models/hands/v_hands" ), true )
		
	else
	
		snixzz.Functions.NoDraw( G.Material( "models/weapons/v_models/hands/v_hands" ), false )
		
	end			
			
end

function snixzz.Namechanger()
	
	/*if snixzz.Bools["misc_namechanger"] then
		
		snixzz.NextName = G.table.Random( G.player.GetAll() ):Nick()
		G.chat.AddText( Color( 0, 255, 255 ), "[snixzz3] Changed your name to " .. snixzz.NextName ) 
		
		if snixzz.IsDarkRP then
			
			-- Overly comlpicated Steam name stealer & RP name stealer. Accuse 2 different people at once.
			snixzz.NextName = G.table.Random( G.player.GetAll() ):Nick()
			//snixzz.Functions.ConCommand( "name " .. snixzz.NextName .. " %" )
			//snixzz.Functions.SetName( snixzz.NextName .. " %" )
			
			G.timer.Simple( 0.5, function()
				snixzz.NextName = G.table.Random( G.player.GetAll() ):Nick()
				snixzz.Functions.ConCommand( "darkrp rpname " .. snixzz.NextName .. "q" ) -- ** TODO: CHANGE q TO SOMETHING ELSE.
			end )
			
		else
			
			snixzz.NextName = G.table.Random( G.player.GetAll() ):Nick()
			//snixzz.Functions.ConCommand( "name " .. snixzz.NextName .. " %" )
			//snixzz.Functions.SetName( snixzz.NextName .. " %" )
			
		end
		
	end*/
	
end

function snixzz.ChatSpam()

	if snixzz.Bools["misc_chat_spam"] then
	
		if snixzz.Vars["misc_chat_spam_method"] == "Advertise" then
	
			G.RunConsoleCommand( "say", G.Either( snixzz.IsDarkRP, "/ooc " .. snixzz.Vars["misc_chat_spam_message"], snixzz.Vars["misc_chat_spam_message"] ) )
			
		elseif snixzz.Vars["misc_chat_spam_method"] == "Jokes" then
			
			G.http.Fetch( "http://tambal.azurewebsites.net/joke/random", 
				
				function( body )
					
					if body && body != "" then
						
						G.RunConsoleCommand( "say", G.Either( snixzz.IsDarkRP,  "/ooc " .. util.JSONToTable( body )["joke"], util.JSONToTable( body )["joke"] ) )
						
					end
					
				end,
				
				function( error )
					
					snixzz.Chat( snixzz.Colors.Red, "Unable to grab joke from API! (" .. error .. ")" )
					
				end
			
			)
			
		end

	end	
	
end

snixzz.CorrectAngles = {}

function snixzz.AAA()

	for k, v in G.next, G.player.GetAll() do
		
		if v == G.LocalPlayer() then continue end
		
		local pitch, yaw = v:EyeAngles().x, v:EyeAngles().y
		local sid = v:SteamID()
		
		if !snixzz.CorrectAngles[sid] then
			
			snixzz.CorrectAngles[sid] = { ["p"] = 0, ["y"] = 0 }
			
		end
		
		-- pitch
		if snixzz.CorrectAngles[sid]["p"] == 1 then
			
			pitch = 89
			
		elseif snixzz.CorrectAngles[sid]["p"] == 2 then
			
			pitch = -89
			
		end
		
		-- yaw
		if snixzz.CorrectAngles["y"] == 1 then
			
			yaw = yaw - 45
			
		elseif snixzz.CorrectAngles["y"] == 2 then
			
			yaw = yaw + 45
			
		else
			
			yaw = yaw - 180
			
		end
			
		_R.Entity.SetPoseParameter( v, "aim_pitch", pitch )
		_R.Entity.SetPoseParameter( v, "body_yaw", 0 )
		_R.Entity.SetPoseParameter( v, "aim_yaw", 0 )
		_R.Entity.InvalidateBoneCache( v )
		_R.Entity.SetRenderAngles( v, G.Angle( 0, G.math.NormalizeAngle( yaw ), 0 ) )
		
	end

end

/*
	
		
	Traitor, Prophunt, & Murder Finders.
	

*/
snixzz.Traitors = {}
snixzz.Murderers = {}
snixzz.ClearedMurderers = false
snixzz.ClearedTraitors = false
local t

function snixzz.IsMurderer( v )

	if v:HasWeapon( "weapon_mu_knife" ) then
	
		return true
		
	end
	
	if G.table.HasValue( snixzz.Murderers, v ) then 
	
		return true
		
	end
	
	return false

end

function snixzz.HasMagnum( v )

	if v:HasWeapon( "weapon_mu_magnum" ) then
	
		return true
		
	end
	
	return false

end

local testtab = {}
function snixzz.IsProp( v )
	
	if v:GetOwner() != nil then
		
		local owner = v:GetOwner()
		
	else
		
		return false
		
	end
	
	if v:GetClass() == "ph_prop" && owner != G.LocalPlayer() then
		
		return true
		
	end
	
	return false

end

function snixzz.IsTraitor( v )
	
	if G.table.HasValue( snixzz.Traitors, v ) or G.LocalPlayer():IsTraitor() && v:IsTraitor() then
		
		return true
		
	end
	
	return false
end

function snixzz.GetTraitors()
	
	if !snixzz.IsTTT then return end
	
	if !snixzz.Bools["misc_traitor_finder"] then return end
		
	for k, v in G.next, G.ents.GetAll() do
			
		if _G.GetRoundState() == 3 && v:IsWeapon() && v:GetOwner():IsPlayer() && v.Buyer == nil && v.CanBuy && G.table.HasValue( v.CanBuy, 1 ) && !G.table.HasValue( snixzz.Traitors, v:GetOwner() ) then
				
			local t = v:GetOwner()
				
			if t:GetRole() == 2 then
					
				v.Buyer = t
				
				snixzz.ClearedTraitors = false
					
			else
					
				G.table.insert( snixzz.Traitors, t )
				
				snixzz.ClearedTraitors = false
				
				snixzz.Chat( G.Color( 255, 0, 0 ), t:Nick() .. " bought traitor weapon '" .. v:GetClass() .. "'" )
					
			end
				
		elseif GetRoundState() != 3 then
				
			if !snixzz.ClearedTraitors then
		
				snixzz.Traitors = {}
				snixzz.Chat( color_white, "Cleared traitors table." )
				snixzz.ClearedTraitors = true
			
				
			end
			
		end
		
	end
	
end


/*
	DETOURS
*/

function snixzz.CreateDetours()
	
	debug.getinfo = snixzz.Detour( debug.getinfo, function()
	
		return { 
			what = "C",
			source = "[C]",
			source_src = "[C]",
			linedefined = -1,
			currentline = -1,
			lastlinedefined = -1,
			short_src = "[C]",
		}
		
	end )
	
	_R.Entity.FireBullets = snixzz.Detour( _R.Entity.FireBullets, function( e, bullet )
		
		snixzz.Cones.Normal[ G.LocalPlayer():GetActiveWeapon():GetClass() ] = bullet["Spread"]
		
		return snixzz.Detours[ _R.Entity.FireBullets ]( e, bullet )
	end )

	render.Capture = snixzz.Detour( render.Capture, function( data )
		
		snixzz.ACNotify( "An anti-cheat attempted to capture your screen, disabling visuals for 5 seconds." )
		
		snixzz.Panic = true
		
		if snixzz.MenuOpen == true then
			
			snixzz.Frame:SetVisible( false )
			snixzz.MenuOpen = false
			
		end
		
		G.timer.Simple( 5, function() snixzz.Panic = false end )
		
		return data
	end )

	file.Exists = snixzz.Detour( file.Exists, function( filename, dir )
		
		snixzz.LogDetour( "file.Exists( '" .. filename .. "', '" .. dir .. "' )" )
		
		if G.string.find( filename, "snixzz" ) then
			
			snixzz.ACNotify( "An anti-cheat attempted to search for snixzz" )
			return false
			
		else
		
			return snixzz.Detours[ file.Exists ]( filename, dir )
			
		end
		
	end )

	file.Read = snixzz.Detour( file.Read, function( filename, dir )
		
		snixzz.LogDetour( "file.Read( '" .. filename .. "', '" .. dir .. "' )" )
		
		if G.string.find( filename, ".lua" ) then
			
			snixzz.ACNotify( "An anti-cheat attempted to search for a .lua file '" .. filename .. "'" )
			return "print( 'Hello World' )"
			
		else
			
			return snixzz.Detours[ file.Read ]( filename, dir )
			
		end
		
	end )

	snixzz.FakeFiles = {
		"demo_recording.lua",
		"vgui/dbutton.lua",
		"vgui/dgrid.lua",
		"menu/menu.lua",
		"menu/mainmenu.lua",
		"menu/loading.lua",
		"menu/video.lua",
		"menu/errors.lua",
	}

	file.Find = snixzz.Detour( file.Find, function( filename, dir )
		
		snixzz.LogDetour( "file.Find( '" .. filename .. "', '" .. dir .. "' )" )
		
		if G.string.find( filename, "snixzz" ) then 
			
			return G.table.Random( snixzz.FakeFiles )
		
		else
		
			return snixzz.Detours[ file.Find ]( filename, dir )
			
		end
		
	end )	

	net.Receive = snixzz.Detour( net.Receive, function( name, func )
		
		snixzz.LogDetour( "net.Receive( '" .. name .. "' )" )
		
		return snixzz.Detours[ net.Receive ]( name, func )
	end )

	net.Start = snixzz.Detour( net.Start, function( name )
		
		if snixzz.Detours["net.Start"][name] then
			
			snixzz.ACNotify( "Blocked net.Start ( '" .. name .. "' )" )
			return
			
		else
		
			snixzz.LogDetour( "net.Start( '" .. name .. "' )" )
			return snixzz.Detours[ net.Start ]( name )
			
		end
		
	end )

	net.SendToServer = snixzz.Detour( net.SendToServer, function()
		
		//snixzz.LogDetour( "net.SendToServer()" )
		
		return snixzz.Detours[net.SendToServer]()
	end )

	net.WriteString = snixzz.Detour( net.WriteString, function( str )
		
		if G.string.find( str, "snixzz" ) then
			
			snixzz.ACNotify( "Blocked net.WriteString ( '" .. str .. "' )" )
			return "nil"
			
		else
		
			snixzz.LogDetour( "net.WriteString( '" .. str .. "' )" )
			return snixzz.Detours[ net.WriteString ]( str )
			
		end
		
	end )

	net.WriteTable = snixzz.Detour( net.WriteTable, function( tab )
			
		//local theTab = G.table.concat( tab, ", " )
		
		//snixzz.LogDetour( "net.WriteTable( { " .. theTab .. " } )" )
		
		return snixzz.Detours[net.WriteTable]( tab )
		
	end )

	_R.Player.ConCommand = snixzz.Detour( _R.Player.ConCommand, function( ply, args )

		snixzz.LogDetour( ply:Nick() .. " - _R.Player.ConCommand( '" .. args .. "' ) " )
		
		if !snixzz.Detours["Commands"][args] then
		
			return snixzz.Detours[ _R.Player.ConCommand ]( ply, args )
		
		else
			
			snixzz.ACNotify( "Blocked _R.Player.ConCommand( '" .. args .. "' )" )
			return
		
		end
		
	end )

	/*
	_R.ConVar.GetBool = snixzz.Detour( _R.Convar.GetBool, function( cvar )
		snixzz.LogDetour( "_R.ConVar.GetBool( '" .. cvar:GetName() .. "'" )
		for k, v in G.pairs( snixzz.Spoof ) do
			if cvar:GetName() == k then
				snixzz.ACNotify( "_R.ConVar.GetBool( '" .. cvar:GetName() .. "' ) returning " .. G.tostring( v ) )
				return v
			else
				return snixzz.Detours[_R.ConVar.GetBool]( cvar )
			end
		end
	end )*/

	GetConVarNumber = snixzz.Detour( GetConVarNumber, function( cvar )
		
		if snixzz.Spoof[cvar] != nil then
			
			return snixzz.Spoof[cvar]
			
		else
			
			return snixzz.Detours[GetConVarNumber]( cvar )
			
		end
		
	end )

	snixzz.IgnoreCMDs = {
		["hvh_playheadshotsound"] = true,
		["hvh_hitsound"] = true,
		["r_cleardecals"] = true,
		["ulx_showmotd"] = true,
	}

	RunConsoleCommand = snixzz.Detour( RunConsoleCommand, function( cmd, ... )
		
		local str = cmd
		
		if !snixzz.IgnoreCMDs[cmd] then	
			
			if ... then
			
				local args = { ... }
				str = str .. ", " .. ( ... )
				
				snixzz.LogDetour( "RunConsoleCommand( '" .. cmd .. ", '" .. G.table.concat( args, "', '" ) .. "' )" )
				
			else
			
				snixzz.LogDetour( "RunConsoleCommand( '" .. cmd .. "' )")
				
			end
			
		end
		
		if !snixzz.Detours["Commands"][cmd] then
		
			return snixzz.Detours[ RunConsoleCommand ]( cmd, ... )
			
		else
			
			snixzz.ACNotify( "Blocked RunConsoleCommand( '" .. cmd .. "' )" )
			return
			
		end
		
	end )

	hook.GetTable = snixzz.Detour( hook.GetTable, function()
		
		//snixzz.LogDetour( "hook.GetTable() was checked, returning bullshit." )
		
		return hookGetTableCopy
	end )
	
end

/*
	
	Menu Core
	
*/


/***************
	
	Changelog
	
****************/
snixzz.UpdateLog = "Loading..."

function snixzz.UpdateChangelog()
	
	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/changelog.txt",
	
		function( body, len, headers, code )
			
			snixzz.UpdateLog = body
			
			if !G.file.Exists( snixzz.DataFolder .. "/changelog.txt", "DATA" ) then
				
				G.file.Write( snixzz.DataFolder .. "/changelog.txt", body )
				
				snixzz.Chat( Color( 0, 255, 0 ), "The changelog has been updated!" )
				
				snixzz.CMenu()
				
			else
				
				local log = G.file.Read( snixzz.DataFolder .. "/changelog.txt", "DATA" )
				
				if log != body then

					G.file.Write( snixzz.DataFolder .. "/changelog.txt", body )
					
					snixzz.Chat( Color( 0, 255, 0 ), "The changelog has been updated!" )
				
					snixzz.CMenu()	
					
				end
				
			end
			
		end,
		
		function( error )
			
			snixzz.UpdateLog = error
			snixzz.Chat( snixzz.Colors.Red, "Failed to update changelog '" .. error .. "'" )
			
		end
		
	)
	
end

function snixzz.CMenu()

	snixzz.CFrame = G.vgui.Create( "DFrame" )
	snixzz.CFrame:SetPos( 20, 80 )
	snixzz.CFrame:SetSize( 430, 420 )
	snixzz.CFrame:SetTitle( "snixzz3 " .. snixzz.Info.Version .. " Changelog :: by 0xymoron" )
	snixzz.CFrame:SetVisible( true )
	snixzz.CFrame:SetDraggable( true )
	snixzz.CFrame:ShowCloseButton( false )
	snixzz.CFrame:MakePopup()
	snixzz.CFrame.Paint = function() 
	
		G.draw.RoundedBox( 0, 0, 0, snixzz.CFrame:GetWide(), snixzz.CFrame:GetTall(), snixzz.Vars["misc_menucolor2"] )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, snixzz.CFrame:GetWide(), snixzz.CFrame:GetTall() )
		
	end
	
	local close = G.vgui.Create( "DButton", snixzz.CFrame )
	close:SetSize( 50, 20 )
	close:SetPos( snixzz.CFrame:GetWide() - 51, 1 )
	close:SetText( "x" )
	close:SetTextColor( G.Color( 255, 255, 255 ) )
	close:SetFont( "Trebuchet18" )
	
	close.Paint = function()
	
		G.draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
	
	end
	
	close.DoClick = function()
		
		snixzz.CFrame:Close()
		snixzz.Sound()
		snixzz.CFrame = nil
		
	end
	
	local ChangelogText = G.vgui.Create( "DTextEntry", snixzz.CFrame )
	ChangelogText:SetPos( 5, 35 )
	ChangelogText:SetSize( snixzz.CFrame:GetWide() - 10, snixzz.CFrame:GetTall() - 40 )
	ChangelogText:SetText( snixzz.UpdateLog )
	ChangelogText:SetEditable( false )
	ChangelogText:SetMultiline( true )
	
end

/*
	
	snixzz3 "IRC" (Chatbox)
	
*/

local function urlencode( str ) -- thanks random github guy
  
	if ( str ) then
      
		str = string.gsub (str, "\n", "\r\n")
		
		str = string.gsub (str, "([^%w ])", function( c )
			
			return string.format( "%%%02X", string.byte( c ) )
			
		end )
		
		str = string.gsub ( str, " ", "+" )
		
   end
   
   return str    
   
end

function snixzz.GetChatData( ply, func )

	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/data/chat.json",
		
		function( body )
		
			local tab = util.JSONToTable( body )
			
			snixzz.ChatCache = tab
			
			if func then
			
				return func()
				
			end
			
		end,
		
		function( error )
		
			snixzz.Chat( Color( 255, 0, 0 ), "Failed to get chat data." )
		
		end
		
	)

end

function snixzz.SendChatMessage( ply, msg, func )
	
	local oldMsg = msg
	
	msg = urlencode( msg )

	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/chat.php?steamid=" .. ply:SteamID64() .. "&msg=" .. msg,
	
		function( body )
		
			if body != "sent" then
				
				snixzz.Chat( Color( 255, 0, 0 ), "Failed to send chat message. '" .. body .. "'" )
				
			else
				
				if func then
			
					func()
				
				end
				
				snixzz.AddToConsole( "Sent chat message '" .. oldMsg .. "'" )
				
			end
			
		end,
		
		function( error )
		
			snixzz.Chat( Color( 255, 0, 0 ), "Failed to send message, try again. '" .. error .. "'" )
			
		end
		
	)
	
end

function snixzz.UpdateChatbox( bool, func )

	if !snixzz.ChatDisplay then return end
	
	for k, v in G.next, snixzz.ChatCache do
				
		local nick = v["nick"]		
		local sid = v["sid"]
		local message = v["message"]
		
		if !snixzz.ChatHistory[sid] then
		
			snixzz.ChatHistory[sid] = {}

		end
		
		if !G.table.HasValue( snixzz.ChatHistory[sid], message ) or bool == true then	
			
			if sid == "nil" then
					
				snixzz.ChatDisplay:InsertColorChange( 255, 0, 0, 255 )
					
			elseif sid == "76561198040553376" then
			
				snixzz.ChatDisplay:InsertColorChange( 0, 255, 255, 255 )
			
			else
			
				snixzz.ChatDisplay:InsertColorChange( 185, 185, 185, 255 )
				
			end 
			
			snixzz.ChatDisplay:AppendText( nick )
			
			snixzz.ChatDisplay:InsertColorChange( 255, 255, 255, 255 )
			snixzz.ChatDisplay:AppendText( ": " .. message .. "\n" )
			
			if bool == false then
				
				snixzz.Sound()
				
			end
		
			G.table.insert( snixzz.ChatHistory[sid], message )

		end
			
	end
		
	if func then
			
		func()
			
	end

end

function snixzz.UpdateWhosOnline( bool, func )

	if !snixzz.IsVIP() then return end
	
	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/getonline.php", 
	
		function( body )
			
			snixzz.WhosOnline = G.util.JSONToTable( body )

			if func then
				
				func()
				
			end
			
		end,
		
		function( error )
			
			snixzz.WhosOnline = { ["fail"] = "Failed to update" }
		
		end
		
	)
	
end

snixzz.ChatboxOpen = false
snixzz.ChatUpdateData = 0
snixzz.WhosOnline = {}

function snixzz.OpenChat()
	
	if snixzz.Chatbox && snixzz.Chatbox:IsVisible() or snixzz.ChatboxOpen then return end
	
	snixzz.Chatbox = G.vgui.Create( "DFrame" )
	snixzz.Chatbox:SetTitle( "snixzz3 Chat (Experimental)" )
	snixzz.Chatbox:SetSize( 600, 240 )
	snixzz.Chatbox:SetPos( 20, ScrH() / 2 - snixzz.Chatbox:GetTall() )
	snixzz.Chatbox:ShowCloseButton( true )
	snixzz.Chatbox:SetDraggable( true )
	
	snixzz.Chatbox.Paint = function( self )
	
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 150 ) )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
	
	end
	
	snixzz.Chatbox.Think = function( self )
		
		snixzz.ChatUpdateData = snixzz.ChatUpdateData + 1
		
		if snixzz.ChatUpdateData == 3300 then
			
			snixzz.GetChatData( LocalPlayer(), function()
			
				snixzz.UpdateChatbox( false, function()
				
					snixzz.ChatUpdateData = 0
					
				end )
				
			end )
			
		end
		
		if G.input.IsKeyDown( KEY_ESCAPE ) then
			
			self:Close()
			
		end
		
	end
	
	snixzz.Chatbox.OnClose = function( self )

		snixzz.ChatHistory = {}
		snixzz.ChatCache = {}
		snixzz.ChatboxOpen = false
		
		if snixzz.OnlineFrame && snixzz.OnlineFrame:IsVisible() then
		
			snixzz.OnlineFrame:SetVisible( false )
			snixzz.OnlineFrame = nil
		
		end
		
	end
	
	snixzz.ChatEntry = vgui.Create( "DTextEntry", snixzz.Chatbox )
	snixzz.ChatEntry:SetPos( 5, snixzz.Chatbox:GetTall() - 25 )
	snixzz.ChatEntry:SetSize( snixzz.Chatbox:GetWide() - 35, 20 )
		
	snixzz.ChatEntry.OnEnter = function( self )
		
		local oldMsg = self:GetValue()
		
		if oldMsg == "" then snixzz.Chatbox:Close() return end
		
		self:SetEnabled( false )
		self:SetEditable( false )
		
		self:SetText( "Sending message..." )
		
		snixzz.SendChatMessage( LocalPlayer(), oldMsg, function() 
			
			self:SetText( "Updating chat..." )
			
			snixzz.GetChatData( LocalPlayer(), function()
			
				snixzz.UpdateChatbox( false, function()
					
					self:SetText( "Sent! Please wait 10 seconds before sending another message." )
					
					G.timer.Simple( 10, function() if IsValid( self ) then self:SetEnabled( true ) self:SetEditable( true ) self:SetText( "" ) end end )
					
				end )
			
			end )
			
		end )
		
	end	
	
	snixzz.ChatDisplay = vgui.Create( "RichText", snixzz.Chatbox )
	snixzz.ChatDisplay:SetPos( 5, 25 )
	snixzz.ChatDisplay:SetSize( snixzz.Chatbox:GetWide() - 10, snixzz.Chatbox:GetTall() - 45 )

	snixzz.ChatDisplay.PerformLayout = function( self )
	
		self:SetFontInternal( "ChatFont" )
	
	end

	snixzz.GetChatData( LocalPlayer(), function()
		
		snixzz.UpdateChatbox( true, function()
			
			snixzz.Chatbox:MakePopup()
			
			snixzz.ChatboxOpen = true
			
		end )
		
	end )
	
	if snixzz.IsVIP() then
	
		snixzz.UpdateWhosOnline( true, function()
			
			if !snixzz.Chatbox:IsVisible() then return end
			
			snixzz.OnlineFrame = G.vgui.Create( "DFrame" )
			snixzz.OnlineFrame:SetSize( 200, 120 )
			snixzz.OnlineFrame:SetTitle( "Online Users (" .. table.Count( snixzz.WhosOnline ) .. ")" )
			snixzz.OnlineFrame:SetPos( 20, ScrH() / 2 - snixzz.Chatbox:GetTall() - snixzz.OnlineFrame:GetTall() - 10 )
			snixzz.OnlineFrame:ShowCloseButton( false )
			snixzz.OnlineFrame:SetDraggable( false )
			
			snixzz.OnlineFrame.Paint = function( self )
			
				G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 125 ) )
				G.surface.SetDrawColor( Color( 0, 0, 0 ) )
				G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
			
			end
			
			snixzz.OnlineList = G.vgui.Create( "DListLayout", snixzz.OnlineFrame )
			snixzz.OnlineList:SetPos( 5, 25 )
			snixzz.OnlineList:SetSize( snixzz.OnlineFrame:GetWide() - 10, snixzz.OnlineFrame:GetTall() - 35 )

			
			if table.Count( snixzz.WhosOnline ) >= 1 then
			
				for k, v in G.next, snixzz.WhosOnline do
					
					local pButton = snixzz.OnlineList:Add( "DButton" )
					pButton:SetText( v )
					pButton:SetSize( snixzz.OnlineList:GetWide() - 10, 15 )
					pButton:SetTextColor( color_white )
					pButton:SetFont( "ChatFont" )

					pButton.Paint = function( self )
						
						G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 50 ) )
						G.surface.SetDrawColor( color_white )
						G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
						
					end
					
					pButton.DoClick = function( self )
					
						gui.OpenURL( "http://steamcommunity.com/profiles/" .. util.NiceFloat( k ) )
					
					end
					
				end
				
			else
				
				local pButton = snixzz.OnlineList:Add( "DButton" )
				pButton:SetText( "No one :(" )
				pButton:SetSize( snixzz.OnlineList:GetWide() - 10, 15 )
				pButton:SetTextColor( Color( 255, 0, 0 ) )
				pButton:SetFont( "ChatFont" )

				pButton.Paint = function( self )
						
					G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 50 ) )
					G.surface.SetDrawColor( Color( 255, 0, 0 ) )
					G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
						
				end
				
			end
				
		
		end )
	
	end

end

/*
	
	
	Custom Console

	
*/

snixzz.Cmds = {}

snixzz.CmdDesc = {

	["bind"] = "bind: proper usage: bind <key> <command>",
	["unbind"] = "unbind: proper usage: unbind <command>",
	["binds"] = "binds: Displays a list of bindable commands",
	["convars"] = "convars: Displays a list of changable convars",
	["server"] = "server: Displays server information",
	["players"] = "players: Displays a list of players & SteamIDs",
	["lua_run"] = "lua_run: Run a Lua string",
	["connect"] = "connect: Connect to the provided IP",
	["clear"] = "clear: Clears the console",
	
}

function snixzz.ConsoleCommand( str )
	
	if !snixzz.ConFrame then return end
	
	local args = G.string.Explode( " ", str )
	local cmd = args[1]
	local cmdArgs = args[2]
	
	G.table.remove( args, 1 )
	
	snixzz.AddToConsole( "] " .. str )
	
	-- Console Commands
	if snixzz.Cmds[cmd] then
		
		snixzz.Cmds[cmd]( G.LocalPlayer(), cmd, args )
		
	-- ConVars
	elseif snixzz.Bools[cmd] != nil then
		
		cmdArgs = G.tobool( cmdArgs )
		
		if cmdArgs != nil then 
		
			snixzz.Bools[cmd] = cmdArgs
			snixzz.Chat( snixzz.Colors.Green, "Set ConVar '" .. cmd .. "' to '" .. G.tostring( cmdArgs ) .. "'" )
			
		else
		
			snixzz.Chat( snixzz.Colors.Red, "Failed to set ConVar '" .. cmd .. "' to '" .. G.tostring( cmdArgs ) or "nil" )
			
		end
			
	elseif snixzz.Vars[cmd] != nil then
		
		if cmdArgs != nil then
			
			snixzz.Vars[cmd] = cmdArgs
			snixzz.Chat( snixzz.Colors,Green, "Set ConVar '" .. cmd .. "' to '" .. G.tostring( cmdArgs ) .. "'" )
			
		else
			
			snixzz.Chat( snixzz.Colors.Red, "Failed to set ConVar '" .. cmd .. "' to '" .. G.tostring( cmdArgs ) or "nil" )
			
		end
		
	elseif cmd == "lua_run" then
		
		local lua_String = G.string.gsub( str, "lua_run ", "" )
		
		snixzz.AddToConsole( "Running Lua String '" .. lua_String .. "'" )
		
		snixzz.RunString( lua_String )
		
	else
	
		snixzz.AddToConsole( "Unknown command '" .. cmd .. "'" )
		
	end
	
	snixzz.cEntry:SetText( "" )
	
end

function snixzz.AddConsoleCommand( cmd, func )

	snixzz.Cmds[cmd] = func
	
end

snixzz.AddConsoleCommand( "help", function( ply, cmd, args )

	for k, v in G.next, snixzz.Cmds do
		
		snixzz.AddToConsole( snixzz.CmdDesc[k] )
		
	end
	
end )

snixzz.AddConsoleCommand( "ping", function( ply, cmd, args )

	--if snixzz.Membership == "dev" then
	
		snixzz.PingServer( ply )
		
	--else
		
		--snixzz.AddToConsole( "You must be a developer to use this command." )
		
	--end

end )

snixzz.AddConsoleCommand( "chat", function( ply, cmd, args )

	if snixzz.ConFrame then
		
		snixzz.ConsoleOpen = false
		snixzz.ConFrame:Remove()
		
	end

	snixzz.OpenChat()

end )


snixzz.AddConsoleCommand( "say", function( ply, cmd, args )

	--if snixzz.Membership == "dev" then
	
		snixzz.SendChatMessage( ply, tostring( table.concat( args, " " ) ) )
		
	--else
		
		--snixzz.AddToConsole( "You must be a developer to use this command." )
		
	--end

end )

snixzz.AddConsoleCommand( "bind", function( ply, cmd, args )

	if !args[1] or !args[2] then snixzz.AddToConsole( snixzz.CmdDesc["bind"] ) return end

	local key = "KEY_" .. G.string.upper( args[1] )
	local cmd = args[2]
	
	snixzz.BindKey( cmd, key, true )

end )

snixzz.AddConsoleCommand( "unbind", function( ply, cmd, args )
	
	if !args[1] then snixzz.AddToConsole( "Unbind proper usage: unbind <command>" ) return end
	
	local command = args[1]
	
	snixzz.Unbind( command )
	
end )

snixzz.AddConsoleCommand( "convars", function( ply, cmd, args )
	
	for k, v in G.next, snixzz.Bools do
		
		snixzz.AddToConsole( "ConVar: " .. k .. " | Enabled: " .. G.tostring( v ) )
		
	end
	
	for k, v in G.next, snixzz.Vars do
		
		snixzz.AddToConsole( "ConVar: " .. k .. " | Value: " .. G.tostring( v ) )
		
	end

end )

snixzz.AddConsoleCommand( "binds", function( ply, cmd, args )
	
	for k, v in G.next, snixzz.Binds do
		
		snixzz.AddToConsole( "Command: " .. k .. " | Bound to: " .. G.input.GetKeyName( v )	)
		
	end
	
end )

snixzz.AddConsoleCommand( "clear", function( ply, cmd, args )
	
	if snixzz.ConFrame && snixzz.cHistory then
		
		snixzz.cHistory:Clear()
		
	end
	
	snixzz.ConsoleHistory = {}
	
	snixzz.AddToConsole( "Cleared console history." )
	
end )

snixzz.AddConsoleCommand( "connect", function( ply, cmd, args )
	
	if args[1] != nil then
	
		snixzz.AddToConsole( "Connecting to '" .. args[1] .. "'" )
		
		G.RunConsoleCommand( "connect", args[1] )
		
	else
		
		snixzz.AddToConsole( "Unknown IP" )
		
	end
	
end )

snixzz.ConsoleOpen = false

function snixzz.Console()
	
	snixzz.ConFrame = G.vgui.Create( "DFrame" )
	snixzz.ConFrame:SetSize( 700, 450 )
	snixzz.ConFrame:SetPos( 30, 30 )
	snixzz.ConFrame:SetTitle( "snixzz3 Console :: by 0xymoron" )
	snixzz.ConFrame:ShowCloseButton( false )
	snixzz.ConFrame:MakePopup()
	snixzz.ConFrame.Paint = function( self ) 
	
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), snixzz.Vars["misc_menucolor2"] )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
		
	end
	snixzz.ConFrame.Think = function( self )
		
		if G.input.IsKeyDown( KEY_ESCAPE ) then
		
			snixzz.ConsoleOpen = false
			self:Remove()
			
		end
		
	end	
	
	local close = G.vgui.Create( "DButton", snixzz.ConFrame )
	close:SetSize( 50, 20 )
	close:SetPos( snixzz.ConFrame:GetWide() - 51, 1 )
	close:SetText( "x" )
	close:SetTextColor( G.Color( 255, 255, 255 ) )
	close:SetFont( "Trebuchet18" )
	
	close.Paint = function( self )
	
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), G.Color( 168, 62, 62, 255 ) )
	
	end
	
	close.DoClick = function()
		
		snixzz.ConsoleOpen = false
		snixzz.ConFrame:Remove()
		snixzz.Sound()
		
	end
	
	snixzz.cHistory = G.vgui.Create( "DListView", snixzz.ConFrame )
	snixzz.cHistory:SetPos( 5, 27 )
	snixzz.cHistory:SetSize( 690, 397 )
	snixzz.cHistory:SetSortable( false )
	snixzz.cHistory:AddColumn( "" )
	snixzz.cHistory:SetMultiSelect( false )

	for k, v in pairs( snixzz.ConsoleHistory ) do
		
		snixzz.cHistory:AddLine( v )
		
	end
	
	snixzz.cHistory.OnClickLine = function( prnt, line, self )
	
		G.SetClipboardText( line:GetValue( 1 ) )
		
		snixzz.Chat( snixzz.Colors.Green, "Copied selected line to clipboard.", true )
		
	end
	
	snixzz.cHistory:PerformLayout()
	snixzz.cHistory.VBar:SetScroll( snixzz.cHistory.VBar.CanvasSize )
	
	-- command entry
	snixzz.cEntry = G.vgui.Create( "DTextEntry", snixzz.ConFrame )
	snixzz.cEntry:SetMultiline( false )
	snixzz.cEntry:SetSize( 690, 20 )
	snixzz.cEntry:SetPos( 5, 427 )
	
	snixzz.cEntry.OnEnter = function( self )
		
		snixzz.ConsoleCommand( self:GetValue() )
		
	end
	
	snixzz.cEntry.Think = function( self )
		
		self:RequestFocus()
		
	end
	
end

snixzz.MenuToggle = false

function snixzz.DoMenuToggle()
	
	snixzz.MenuOpen = true
	snixzz.Frame:SetVisible( true )
	
end

function snixzz.Menu()

	local tabs, menuheight, menuwidth, w, h = {}, 430, 420, ScrW() / 2, ScrH() / 2
	
	snixzz.Frame = G.vgui.Create( "DPropertySheet" )
	snixzz.Frame:SetParent( snixzz.Frame )
	snixzz.Frame:SetPos( 20, 80 )
	snixzz.Frame:SetSize( menuwidth, menuheight )
	snixzz.Frame:SetVisible( true )
	snixzz.Frame:MakePopup()
	snixzz.Frame.Think = function()
		
		if snixzz.Binds["+menu"] == nil then return end
		
		if !G.input.IsKeyDown( snixzz.Binds["+menu"] ) && !snixzz.MenuToggle then
		
			snixzz.MenuOpen = false
			//snixzz.Changelog:SetVisible( false )
			//snixzz.LinksButton:SetVisible( false )
			snixzz.Frame:SetVisible( false )
			
		end
		
	end	
	snixzz.Frame.Paint = function() 
		
		G.draw.RoundedBox( 0, 0, 30, snixzz.Frame:GetWide(), snixzz.Frame:GetTall(), snixzz.Vars["misc_menucolor"] )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, snixzz.Frame:GetWide(), snixzz.Frame:GetTall() )
		
	end
	
	-- Menu Toggle button
	local Toggle = G.vgui.Create( "DButton" )
	Toggle:SetParent( snixzz.Frame )
	Toggle:SetText( "Hold Open" )
	Toggle:SetTextColor( snixzz.Colors.Green )
	Toggle:SetPos( 0, 0 )
	Toggle:SetPos( snixzz.Frame:GetWide() - 60, 0 )
	Toggle:SetSize( 60, 30 )
	Toggle.DoClick = function()
		
		snixzz.MenuToggle = !snixzz.MenuToggle
		snixzz.DoMenuToggle()
		
		if snixzz.MenuToggle == true then
			
			Toggle:SetText( "Close" )
			Toggle:SetTextColor( Color( 255, 255, 0 ) )
			snixzz.Sound()
			
		else
			
			Toggle:SetText( "Hold Open" )
			Toggle:SetTextColor( snixzz.Colors.Green )
			snixzz.Sound()
			
		end
		
	end
	Toggle.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, Toggle:GetWide(), Toggle:GetTall() )
		
	end

	/*snixzz.LinksButton = G.vgui.Create( "DButton" )
	snixzz.LinksButton:SetText( "Links" )
	snixzz.LinksButton:SetPos( snixzz.Frame:GetWide() - 205, 60 )
	snixzz.LinksButton:SetSize( 35, 18 )
	snixzz.LinksButton:SetFont( "snixzz_logo_small" )
	snixzz.LinksButton:SetTextColor( color_white )
	
	snixzz.LinksButton.DoClick = function()
		
		if !snixzz.linksMenu then
		
			snixzz.Sound()
			snixzz.OpenLinksMenu()
			
		end
		
	end
	snixzz.LinksButton.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, snixzz.LinksButton:GetWide(), snixzz.LinksButton:GetTall() )
		
	end*/

	-- Parents for the tabs
	tabs.aimbot = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.aimbot:SetPos( 0, 0 )
	tabs.aimbot:SetText( "" )

	tabs.esp = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.esp:SetPos( 0, 0 )
	tabs.esp:SetText( "" )

	tabs.misc = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.misc:SetPos( 0, 0 )
	tabs.misc:SetText( "" )
	
	tabs.lists = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.lists:SetPos( 0, 0 )
	tabs.lists:SetText( "" )

	tabs.log = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.log:SetPos( 0, 0 )
	tabs.log:SetText( "" )

	tabs.config = G.vgui.Create( "DLabel", snixzz.Frame )
	tabs.config:SetPos( 0, 0 )
	tabs.config:SetText( "" )
	
	snixzz.Frame:AddSheet( "Aimbot", tabs.aimbot, "icon16/lightning.png", false, false )
	snixzz.Frame:AddSheet( "Visual", tabs.esp, "icon16/eye.png", false, false )
	snixzz.Frame:AddSheet( "Misc", tabs.misc, "icon16/plugin.png", false, false )
	snixzz.Frame:AddSheet( "Lists", tabs.lists, "icon16/user_add.png", false, false )
	snixzz.Frame:AddSheet( "Detours", tabs.log, "icon16/application_xp_terminal.png", false, false )
	snixzz.Frame:AddSheet( "Config", tabs.config, "icon16/wrench.png", false, false )

	-- Aimbot Settings
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Aimbot Toggle", "aim_toggle", 5, 5 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Autoshoot", "aim_autoshoot", 5, 25 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Silent Aim", "aim_silent", 5, 45 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Spread Prediction", "aim_nospread", 5, 65 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Aim Prediction", "aim_prediction", 5, 85 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Remove Recoil", "aim_norecoil", 5, 105 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Miss random shots", "aim_badshots", 5, 125 )	
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Hold Target", "aim_holdtarget", 5, 145 )	
	
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Team", "aim_ignoreteam", 130, 5 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Admins", "aim_ignoreadmins", 130, 25 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Steam Friends", "aim_ignoresteam", 130, 45 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Bots", "aim_ignorebots", 130, 65 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore LOS", "aim_ignorelos", 130, 85 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Friends", "aim_ignorefriends", 130, 105 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Ignore Friendly Traitors", "aim_ignoretraitors", 130, 125 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Target Only Traitors", "aim_onlytraitors", 130, 145 )
	
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Anti Anti-Aim", "aim_antiantiaim", 275, 5 )
	snixzz.CreateOption( "Checkbox", tabs.aimbot, "Anti-Aim", "aim_anti", 275, 25 )

	snixzz.CreateOption( "Slider", tabs.aimbot, "Spinbot Speed", "aim_anti_spin_speed", 10, 50, 420, 5, 325, 0 )
	snixzz.CreateOption( "Slider", tabs.aimbot, "Field of View", "aim_fov", 1, 180, 420, 5, 345, 0 )
	snixzz.CreateOption( "Slider", tabs.aimbot, "Aimspot Offset", "aim_offset", -20, 20, 425, 5, 365, 0 )
	
	
	snixzz.CreateOption( "Label", tabs.aimbot, "Prediction Method", 115, 250 )
	
	local PredictionMethod = G.vgui.Create( "DComboBox", tabs.aimbot )
	PredictionMethod:SetPos( 115, 265 )
	PredictionMethod:SetSize( 105, 20 )
	PredictionMethod:SetText( snixzz.Vars["aim_prediction_method"] )
	PredictionMethod:SetTextColor( color_white )
	
	for k, v in G.next, snixzz.PredictionMethods do
		
		PredictionMethod:AddChoice( v )
		
	end
	
	PredictionMethod.OnSelect = function( self )
		
		snixzz.Vars["aim_prediction_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set prediction method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end	
	
	PredictionMethod.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, PredictionMethod:GetWide(), PredictionMethod:GetTall() )
		
	end
	
	snixzz.CreateOption( "Label", tabs.aimbot, "Target Type", 225, 250 )
	
	local TargetType = G.vgui.Create( "DComboBox", tabs.aimbot )
	TargetType:SetPos( 225, 265 )
	TargetType:SetSize( 105, 20 )
	TargetType:SetText( snixzz.Vars["aim_target_type"] )
	TargetType:SetTextColor( color_white )
	
	for k, v in G.next, { "Players", "NPC", "Both" } do
		
		TargetType:AddChoice( v )
		
	end
	
	TargetType.OnSelect = function( self )
		
		snixzz.Vars["aim_target_type"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set target type to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end	
	
	TargetType.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, TargetType:GetWide(), TargetType:GetTall() )
		
	end
	
	// AntiAim Method
	snixzz.CreateOption( "Label", tabs.aimbot, "Anti-Aim Method", 5, 250 )
	local AntiAimMethod = G.vgui.Create( "DComboBox", tabs.aimbot )
	AntiAimMethod:SetPos( 5, 265 )
	AntiAimMethod:SetSize( 105, 20 )
	AntiAimMethod:SetText( snixzz.Vars["aim_anti_method"] )
	AntiAimMethod:SetTextColor( color_white )
	
	for k, v in G.next, snixzz.AntiAimMethods do
		
		AntiAimMethod:AddChoice( v )
		
	end
	
	AntiAimMethod.OnSelect = function( self )
		
		snixzz.Vars["aim_anti_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set anti-aim method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	
	AntiAimMethod.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, AntiAimMethod:GetWide(), AntiAimMethod:GetTall() )
		
	end

	-- Aimbot hitbox/bone method & spot selection
	snixzz.CreateOption( "Label", tabs.aimbot, "Aimbot Method", 5, 290 )

	local AimbotMethod = G.vgui.Create( "DComboBox", tabs.aimbot )
	AimbotMethod:SetPos( 5, 305 )
	AimbotMethod:SetSize( 105, 20 )
	AimbotMethod:SetText( snixzz.Vars["aim_method"] )
	AimbotMethod:AddChoice( "Hitbox" )
	AimbotMethod:AddChoice( "Bone" )
	AimbotMethod:AddChoice( "Hitscan" )
	AimbotMethod:SetTextColor( color_white )
	AimbotMethod.OnSelect = function( self )
		
		snixzz.Vars["aim_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set aimbot method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
		 -- Close to menu to avoid bugs.
		snixzz.Frame:SetVisible( false )
		//snixzz.Changelog:SetVisible( false )
		//snixzz.LinksButton:SetVisible( false )
		snixzz.MenuOpen = false
		snixzz.MenuToggle = false
		
	end
	
	AimbotMethod.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, AimbotMethod:GetWide(), AimbotMethod:GetTall() )
		
	end
	
	-- Aimspot & aim method selection
	snixzz.CreateOption( "Label", tabs.aimbot, "Aim Spot", 115, 290 )
	
	local Aimspot = G.vgui.Create( "DComboBox", tabs.aimbot )
	Aimspot:SetPos( 115, 305 )
	Aimspot:SetSize( 105, 20 )
	Aimspot:SetTextColor( color_white )
	
	if snixzz.Vars["aim_method"] == "Hitbox" then
		
		Aimspot:SetText( snixzz.Vars["aim_hitbox"] )
		
		Aimspot:SetDisabled( false )
		
		for k, v in G.next, snixzz.Hitboxes do
			
			Aimspot:AddChoice( k )
			
		end
		
	elseif snixzz.Vars["aim_method"] == "Bone" then
	
		Aimspot:SetText( snixzz.Vars["aim_bone"] )
		
		Aimspot:SetDisabled( false )
		
		for k, v in G.next, snixzz.Bones do
			
			Aimspot:AddChoice( k )
			
		
		end
		
	elseif snixzz.Vars["aim_method"] == "Hitscan" then
	
		Aimspot:SetText( "Auto" )
		Aimspot:SetDisabled( true )
		
	end
	
	Aimspot.OnSelect = function( self )
		
		if snixzz.Vars["aim_method"] == "Hitbox" then
		
			snixzz.Vars["aim_hitbox"] = self:GetValue()
			snixzz.Chat( Color( 0, 255, 255 ), "Set aimbot hitbox to '" .. self:GetValue() .. "'" )
			
		elseif snixzz.Vars["aim_method"] == "Bone" then
		
			snixzz.Vars["aim_bone"] = self:GetValue()
			snixzz.Chat( Color( 0, 255, 255 ), "Set aimbot bone to '" .. self:GetValue() .. "'" )

		end
		
		snixzz.Sound()
	end
	
	Aimspot.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, Aimspot:GetWide(), Aimspot:GetTall() )
		
	end
	
	// Target method
	snixzz.CreateOption( "Label", tabs.aimbot, "Target Method", 225, 290 )
	
	local TargetMethod = G.vgui.Create( "DComboBox", tabs.aimbot )
	TargetMethod:SetPos( 225, 305 )
	TargetMethod:SetSize( 105, 20 )
	TargetMethod:SetText( snixzz.Vars["aim_target_method"] )
	TargetMethod:SetTextColor( color_white )
	TargetMethod:AddChoice( "Distance" )
	TargetMethod:AddChoice( "Crosshair" )
	TargetMethod.OnSelect = function( self )
	
		snixzz.Vars["aim_target_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set target method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end	
	
	TargetMethod.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, TargetMethod:GetWide(), TargetMethod:GetTall() )
		
	end

	-- Visual Settings
	snixzz.CreateOption( "Checkbox", tabs.esp, "Enable Visuals", "esp_enabled", 5, 5 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Name Text", "esp_name", 5, 45 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Health Text", "esp_health_text", 5, 65 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Weapon Text", "esp_weapon", 5, 85 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Distance Text", "esp_distance", 5, 105 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Bounding Box", "esp_box", 5, 125 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Chams", "esp_chams", 5, 145 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Health Bar", "esp_health_bar", 5, 165 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Hitbox ESP", "esp_hitbox", 5, 185 )

	snixzz.CreateOption( "Checkbox", tabs.esp, "Crosshair", "esp_crosshair", 130, 5 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Crosshair Box", "esp_crosshair_box", 130, 25 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Remove Hands", "esp_nohands", 130, 45 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Aimbot Status", "esp_status", 130, 65 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Laser Sights", "esp_laser", 130, 85 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Aim Snaplines", "esp_snaplines", 130, 105 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Dynamic Light", "esp_dynamiclight", 130, 125 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Wireframe Weapon", "esp_wireweapon", 130, 145 )
	snixzz.CreateOption( "Checkbox", tabs.esp, "Draw Aimbot Position", "esp_aimpos", 130, 165 )	
	snixzz.CreateOption( "Checkbox", tabs.esp, "ASUS Walls", "esp_asus_walls", 130, 185 )	
	snixzz.CreateOption( "Checkbox", tabs.esp, "RGB Mode", "esp_rainbow", 130, 205 )	

	snixzz.CreateOption( "Slider", tabs.esp, "Field of View", "esp_fov", 90, 140, 420, 5, 325, 1 )
	snixzz.CreateOption( "Slider", tabs.esp, "Box Width", "esp_box_width", 1, 2.5, 420, 5, 345, 1 )
	snixzz.CreateOption( "Slider", tabs.esp, "Render Distance", "esp_distance", 0, 7500, 415, 5, 365, 0 )

	
	snixzz.CreateOption( "Label", tabs.esp, "Chams Material", 5, 290 )
	
	local ChamsType = G.vgui.Create( "DComboBox", tabs.esp )
	ChamsType:SetPos( 5, 305 )
	ChamsType:SetSize( 105, 20 )
	ChamsType:SetText( snixzz.Vars["esp_chams_material"] )
	ChamsType:AddChoice( "Solid" )
	ChamsType:AddChoice( "Wireframe" )
	ChamsType:AddChoice( "XQZ" )
	ChamsType:SetTextColor( color_white )
	ChamsType.OnSelect = function( self )
	
		snixzz.Vars["esp_chams_material"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set chams material to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	
	ChamsType.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, ChamsType:GetWide(), ChamsType:GetTall() )
		
	end
	
	snixzz.CreateOption( "Label", tabs.esp, "ESP Type", 115, 290 )
	
	local ESPType = G.vgui.Create( "DComboBox", tabs.esp )
	ESPType:SetPos( 115, 305 )
	ESPType:SetSize( 105, 20 )
	ESPType:SetText( snixzz.Vars["esp_type"] )
	ESPType:AddChoice( "Players" )
	ESPType:AddChoice( "NPC" )
	ESPType:AddChoice( "Entities" )
	ESPType:AddChoice( "All" )
	ESPType:SetTextColor( color_white )
	ESPType.OnSelect = function( self )
	
		snixzz.Vars["esp_type"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set ESP type to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	
	ESPType.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, ESPType:GetWide(), ESPType:GetTall() )
		
	end
	
	--------------
	-- Misc tab --
	--------------
	snixzz.CreateOption( "Checkbox", tabs.misc, "Bunnyhop", "misc_bhop", 5, 5 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Autostrafe", "misc_autostrafe", 5, 25 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Triggerbot", "misc_triggerbot", 5, 45 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Triggerbot NoSpread", "misc_triggerbot_nospread", 5, 65 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Thirdperson", "misc_thirdperson", 5, 85 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Traitor Finder", "misc_traitor_finder", 5, 105 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Murder Finder", "misc_murder_finder", 5, 125 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Prophunt Finder", "misc_prophunt_finder", 5, 145 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Chat Spam", "misc_chat_spam", 5, 165 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Rapid Fire", "misc_rapidfire", 5, 185 )
	snixzz.CreateOption( "Checkbox", tabs.misc, "Clientside Noclip [Beta]", "misc_csnoclip", 5, 205 )
	snixzz.CreateOption( "Slider", tabs.misc, "Thirdperson Distance", "misc_thirdperson_distance", 50, 180, 415, 5, 345, 1 )

	snixzz.CreateOption( "Label", tabs.misc, "Triggerbot Method", 5, 290 )
	
	local Trigmethod = G.vgui.Create( "DComboBox", tabs.misc )
	Trigmethod:SetPos( 5, 305 )
	Trigmethod:SetSize( 105, 20 )
	Trigmethod:SetText( snixzz.Vars["misc_triggerbot_method"] )
	Trigmethod:AddChoice( "Body" )
	Trigmethod:AddChoice( "Hitbox" )
	Trigmethod:SetTextColor( color_white )
	Trigmethod.OnSelect = function( self )
	
		snixzz.Vars["misc_triggerbot_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set triggerbot method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	Trigmethod.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, Trigmethod:GetWide(), Trigmethod:GetTall() )
		
	end	
	
	snixzz.CreateOption( "Label", tabs.misc, "Triggerbot Type", 115, 290 )
	
	local TrigType = G.vgui.Create( "DComboBox", tabs.misc )
	TrigType:SetPos( 115, 305 )
	TrigType:SetSize( 105, 20 )
	TrigType:SetText( snixzz.Vars["misc_triggerbot_type"] )
	TrigType:AddChoice( "Players" )
	TrigType:AddChoice( "NPC" )
	TrigType:AddChoice( "Both" )
	TrigType:SetTextColor( color_white )
	TrigType.OnSelect = function( self )
	
		snixzz.Vars["misc_triggerbot_type"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set triggerbot type to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	TrigType.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, TrigType:GetWide(), TrigType:GetTall() )
		
	end		
	
	snixzz.CreateOption( "Label", tabs.misc, "Chat Spam Method", 225, 290 )

	local SpamMethod = G.vgui.Create( "DComboBox", tabs.misc )
	SpamMethod:SetPos( 225, 305 )
	SpamMethod:SetSize( 105, 20 )
	SpamMethod:SetText( snixzz.Vars["misc_chat_spam_method"] )
	SpamMethod:AddChoice( "Advertise" )
	SpamMethod:AddChoice( "Jokes" )
	SpamMethod:SetTextColor( color_white )
	SpamMethod.OnSelect = function( self )
	
		snixzz.Vars["misc_chat_spam_method"] = self:GetValue()
		snixzz.Chat( Color( 0, 255, 255 ), "Set chat spam method to '" .. self:GetValue() .. "'" )
		snixzz.Sound()
		
	end
	
	SpamMethod.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, SpamMethod:GetWide(), SpamMethod:GetTall() )
		
	end	
	
	---------------
	-- Lists Tab --
	---------------
	
	-- Friends/enemies
	
	local Enemies = G.vgui.Create( "DListView", tabs.lists )
	Enemies:SetPos( 5, 5 )
	Enemies:SetSize( 170, 180 )
	Enemies:AddColumn( "Enemies" )
	
	for k, v in G.next, G.player.GetAll() do
		
		if !snixzz.Friends[v:Nick()] && v != G.LocalPlayer() then
			
			Enemies:AddLine( v:Nick() )
			
		end
		
	end
	
	local Friends = G.vgui.Create( "DListView", tabs.lists )
	Friends:SetPos( 230, 5 )
	Friends:SetSize( 170, 180 )
	Friends:AddColumn( "Friends" )
	
	for k, v in G.next, snixzz.Friends do
		
		Friends:AddLine( k )
		
	end
	
	local AddFriend = G.vgui.Create( "DButton", tabs.lists ) 
	AddFriend:SetText( "-->" ) 
	AddFriend:SetSize( 30, 20 )
	AddFriend:SetPos( 187.5, 140 )
	AddFriend:SetTextColor( color_white )
	AddFriend.DoClick = function() 
	
	local line = Enemies:GetSelectedLine()
		
		if line != nil then 
			
			local ply = Enemies:GetLine( line ):GetValue(1)  
			
			if !snixzz.Friends[ply] then
				
				snixzz.Friends[ply] = true
				snixzz.Chat( snixzz.Colors.Green, "Added '" .. ply .. "' to friends list." )
				Friends:AddLine( ply ) 
				Enemies:RemoveLine( line ) 
				snixzz.Sound()
				
			end 
			
		end
		
	end
	
	AddFriend.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, AddFriend:GetWide(), AddFriend:GetTall() )
		
	end
	
	local RemoveFriend = G.vgui.Create( "DButton", tabs.lists ) 
	RemoveFriend:SetText("<--") 
	RemoveFriend:SetSize( 30, 20 ) 
	RemoveFriend:SetPos( 187.5, 165 )
	RemoveFriend:SetTextColor( color_white )
	RemoveFriend.DoClick = function() 
	
		local line = Friends:GetSelectedLine() 
		
		if line != nil then 
			
			local ply = Friends:GetLine( line ):GetValue( 1 ) 
			
			if snixzz.Friends[ply] then
			
				for k, v in G.next, snixzz.Friends do 
					
					if k == ply then 
						
						snixzz.Friends[k] = nil
						snixzz.Chat( snixzz.Colors.Red, "Removed '" .. ply .. "' from the friends list." )
						snixzz.Sound()
						
					end 
					
				end 
				
				Enemies:AddLine( ply ) 
				Friends:RemoveLine( line )
				
			end
			
		end 
		
	end 
	
	RemoveFriend.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, RemoveFriend:GetWide(), RemoveFriend:GetTall() )
		
	end
	
	local AllEnts = G.vgui.Create( "DListView", tabs.lists )
	AllEnts:SetPos( 5, 190 )
	AllEnts:SetSize( 170, 180 )
	AllEnts:AddColumn( "All Entities" )
	
	local addedEnts = {}
	
	for k, v in G.next, G.ents.GetAll() do
	
		if !addedEnts[v:GetClass()] && !v:IsPlayer() && !v:IsNPC() && !snixzz.Entities[v:GetClass()] && !snixzz.BadEntities[v:GetClass()] then
	
			AllEnts:AddLine( v:GetClass() )
			addedEnts[v:GetClass()] = true
			
		end
		
	end
	
	local DrawEnts = G.vgui.Create( "DListView", tabs.lists )
	DrawEnts:SetPos( 230, 190 )
	DrawEnts:SetSize( 170, 180 )
	DrawEnts:AddColumn( "Entities to Draw" )
	
	for k, v in G.next, snixzz.Entities do
		
		DrawEnts:AddLine( k )
		
	end
	
	local AddEntity = G.vgui.Create( "DButton", tabs.lists ) 
	AddEntity:SetText( "-->" ) 
	AddEntity:SetSize( 30, 20 )
	AddEntity:SetPos( 187.5, 315 )
	AddEntity:SetTextColor( color_white )
	AddEntity.DoClick = function() 
	
	local line = AllEnts:GetSelectedLine()
		
		if line != nil then 
			
			local ent = AllEnts:GetLine( line ):GetValue(1)  
			
			if !snixzz.Entities[ply] then
				
				snixzz.Entities[ent] = true
				snixzz.Chat( snixzz.Colors.Green, "Added '" .. ent .. "' to entities list." )
				DrawEnts:AddLine( ent ) 
				AllEnts:RemoveLine( line ) 
				snixzz.Sound()
				
			end 
			
		end
		
	end
	
	AddEntity.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, AddEntity:GetWide(), AddEntity:GetTall() )
		
	end
	
	local RemoveEntity = G.vgui.Create( "DButton", tabs.lists ) 
	RemoveEntity:SetText("<--") 
	RemoveEntity:SetSize( 30, 20 ) 
	RemoveEntity:SetPos( 187.5, 350 )
	RemoveEntity:SetTextColor( color_white )
	RemoveEntity.DoClick = function() 
	
		local line = DrawEnts:GetSelectedLine() 
		
		if line != nil then 
			
			local ent = DrawEnts:GetLine( line ):GetValue( 1 ) 
			
			if snixzz.Entities[ent] then
			
				for k, v in G.next, snixzz.Entities do 
					
					if k == ent then 
						
						snixzz.Entities[k] = nil
						snixzz.Chat( snixzz.Colors.Red, "Removed '" .. ent .. "' from the entities list." )
						snixzz.Sound()
						
					end 
					
				end 
				
				AllEnts:AddLine( ent ) 
				DrawEnts:RemoveLine( line )
				
			end
			
		end 
		
	end 
	
	RemoveEntity.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, RemoveEntity:GetWide(), RemoveEntity:GetTall() )
		
	end
	
	-----------------
	--  Log Tab    --
	-----------------
	
	snixzz.LogTab = G.vgui.Create( "DListView", tabs.log )
	snixzz.LogTab:SetPos( 5, 5 )
	snixzz.LogTab:SetSize( snixzz.Frame:GetWide() - 25, snixzz.Frame:GetTall() - 70 )
	snixzz.LogTab:AddColumn( "snixzz3 Logs" )
	snixzz.LogTab:SetSortable( false )
	snixzz.LogTab:SetMultiSelect( false )
	
	for k, v in G.next, snixzz.Lines do
		snixzz.LogTab:AddLine( v )
		
	end
	
	snixzz.LogTab.OnClickLine = function( parent, line, isselected )
		
		G.SetClipboardText( line:GetValue( 1 ) )
		
	end
	
	local ConsoleClear = G.vgui.Create( "DButton", tabs.log ) 
	ConsoleClear:SetText( "Clear Log" ) 
	ConsoleClear:SetSize( snixzz.Frame:GetWide() - 25, 23 )
	ConsoleClear:SetPos( 5, 370 )
	ConsoleClear:SetTextColor( color_white )
	
	ConsoleClear.DoClick = function() 
	
		snixzz.Lines = {}
		snixzz.LogTab:Clear()
		
	end 
	
	ConsoleClear.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, ConsoleClear:GetWide(), ConsoleClear:GetTall() )
		
	end
	
	----------------
	-- Config Tab --
	----------------
	--Menu Settings
	snixzz.CreateOption( "Label", tabs.config, "Menu Color", 230, 5 )
	
	local MenuColor = G.vgui.Create( "DColorMixer", tabs.config )
	MenuColor:SetPos( 230, 20 ) 
	MenuColor:SetSize( 170, 100 )
	MenuColor:SetPalette( false )
	MenuColor:SetAlphaBar( true )
	MenuColor:SetWangs( false )
	MenuColor:SetColor( snixzz.Vars["misc_menucolor"] )
	
	MenuColor.ValueChanged = function()
		
		snixzz.Vars["misc_menucolor"] = MenuColor:GetColor()
		
	end
	
	snixzz.CreateOption( "Label", tabs.config, "Secondary Menu Color", 230, 125 )
	
	local MenuColor2 = G.vgui.Create( "DColorMixer", tabs.config )
	MenuColor2:SetPos( 230, 140 ) 
	MenuColor2:SetSize( 170, 100 )
	MenuColor2:SetPalette( false )
	MenuColor2:SetAlphaBar( true )
	MenuColor2:SetWangs( false )
	MenuColor2:SetColor( snixzz.Vars["misc_menucolor2"] )
	
	MenuColor2.ValueChanged = function()
		
		snixzz.Vars["misc_menucolor2"] = MenuColor2:GetColor()
		
	end
	
	snixzz.CreateOption( "Label", tabs.config, "Laser Color", 230, 245 )
	
	local LaserCol = G.vgui.Create( "DColorMixer", tabs.config )
	LaserCol:SetPos( 230, 260 ) 
	LaserCol:SetSize( 170, 100 )
	LaserCol:SetPalette( false )
	LaserCol:SetAlphaBar( false )
	LaserCol:SetWangs( false )
	LaserCol:SetColor( snixzz.Vars["misc_lasercolor"] )
	
	LaserCol.ValueChanged = function()
		
		snixzz.Vars["misc_lasercolor"] = LaserCol:GetColor()
		
	end
	
	local CfgList = G.vgui.Create( "DListView", tabs.config ) 
	CfgList:SetPos( 5, 5 ) 
	CfgList:SetMultiSelect( false ) 
	CfgList:SetSize( 220, 80 )
	CfgList:AddColumn( "Config" ) 
	
	for k, v in G.next, snixzz.Configs do 
		
		CfgList:AddLine( v ) 
		
	end 
	
	CfgList.DoDoubleClick = function() 
		
		local line = CfgList:GetSelectedLine() 
		
		if line != nil then 
		
			local config = CfgList:GetLine( line ):GetValue( 1 ) 
			snixzz.LoadConfig( config ) 
			snixzz.Sound()
			
		end 
		
	end 
		
	-- Right from gInject. Im lazy with menus. I'll re-write it later
	local CreateConfig = G.vgui.Create( "DButton", tabs.config ) 
	CreateConfig:SetText( "Create New" ) 
	CreateConfig:SetSize( 105, 30 )
	CreateConfig:SetPos( 5, 90 )
	CreateConfig:SetTextColor( color_white )
	CreateConfig.DoClick = function() 
	
		G.Derma_StringRequest( "New Config", "Name of the new config", "", function( txt ) 
		
			snixzz.SaveConfig( txt ) 
			snixzz.Sound()
			
		end )
		
	end 
	
	CreateConfig.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, CreateConfig:GetWide(), CreateConfig:GetTall() )
		
	end
	
	local RenameConfig = G.vgui.Create( "DButton", tabs.config ) 
	RenameConfig:SetText( "Rename" ) 
	RenameConfig:SetSize( 105, 30 )
	RenameConfig:SetPos( 5, 125 )
	RenameConfig:SetTextColor( color_white )
	RenameConfig.DoClick = function()
		
		G.Derma_StringRequest( "Rename Config", "Name of the new config", "", function( NewConfig ) 
			
			local line = CfgList:GetSelectedLine() 
			
			if line != nil then 
				
				local OldConfig = CfgList:GetLine( line ):GetValue( 1 ) 
				
				if OldConfig != "default" then
				
					snixzz.RenameConfig( OldConfig, NewConfig )
					G.table.remove( snixzz.Configs, CfgList:GetSelectedLine() )
					G.table.insert( snixzz.Configs, NewConfig )
					snixzz.Sound()
					
				end
				
			end
			
		end )
		
	end
	
	RenameConfig.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, RenameConfig:GetWide(), RenameConfig:GetTall() )
		
	end
	
	local DeleteConfig = G.vgui.Create( "DButton", tabs.config ) 
	DeleteConfig:SetText( "Delete" ) 
	DeleteConfig:SetSize( 105, 30 )
	DeleteConfig:SetPos( 118, 90 )
	DeleteConfig:SetTextColor( color_white )
	DeleteConfig.DoClick = function() 
	
		local line = CfgList:GetSelectedLine() 
		
		if line != nil then
			
			local config = CfgList:GetLine( line ):GetValue( 1 ) 
			if config != "default" then
			
				for k, v in G.next, snixzz.Configs do 
					
					if v == config then 
					
						snixzz.DeleteConfig( config )
						G.table.remove( snixzz.Configs, k ) 
						snixzz.Sound()
						
					end 
					
				end
				
			end
			
		end 
		
	end 
	
	DeleteConfig.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, DeleteConfig:GetWide(), DeleteConfig:GetTall() )
		
	end
	
	
	local LoadConfig = G.vgui.Create( "DButton", tabs.config ) 
	LoadConfig:SetText( "Load" ) 
	LoadConfig:SetSize( 105, 30 )
	LoadConfig:SetPos( 118, 125 )
	LoadConfig:SetTextColor( color_white )
	LoadConfig.DoClick = function()
	
		local line = CfgList:GetSelectedLine() 
		
		if line != nil then 
			local config = CfgList:GetLine( line ):GetValue( 1 ) 
			snixzz.LoadConfig( config )
			snixzz.Frame:SetVisible( false )
			//snixzz.Changelog:SetVisible( false )
			//snixzz.LinksButton:SetVisible( false )
			snixzz.MenuOpen = false
			snixzz.MenuToggle = false
			snixzz.Sound()
			
		end
		
	end
	
	LoadConfig.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, LoadConfig:GetWide(), LoadConfig:GetTall() )
		
	end
	
	local SetDefaultCfg = G.vgui.Create( "DButton", tabs.config ) 
	SetDefaultCfg:SetText( "Set Default" ) 
	SetDefaultCfg:SetSize( 105, 30 )
	SetDefaultCfg:SetPos( 118, 160 )
	SetDefaultCfg:SetTextColor( color_white )
	SetDefaultCfg.DoClick = function()
	
		local line = CfgList:GetSelectedLine() 
	
		if line != nil then 
		
			local config = CfgList:GetLine( line ):GetValue( 1 ) 
			
			snixzz.SetDefaultConfig( config )
			snixzz.LoadConfig( config )
			snixzz.Sound()
			
		end
		
	end	
	
	SetDefaultCfg.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, SetDefaultCfg:GetWide(), SetDefaultCfg:GetTall() )
		
	end
		
	local UpdateConfig = G.vgui.Create( "DButton", tabs.config ) 
	UpdateConfig:SetText( "Save Changes" ) 
	UpdateConfig:SetSize( 105, 35 )
	UpdateConfig:SetPos( 118, 195 )
	UpdateConfig:SetTextColor( color_white )
	UpdateConfig.DoClick = function()
		
		snixzz.Sound()
		snixzz.UpdateConfig()
		
	end	
	
	UpdateConfig.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, UpdateConfig:GetWide(), UpdateConfig:GetTall() )
		
	end
		
	// Binds
	local BindCommands = G.vgui.Create( "DComboBox", tabs.config )
	BindCommands:SetPos( 5, 160 )
	BindCommands:SetSize( 105, 20 )
	BindCommands:SetTextColor( color_white )
	
	for k, v in G.next, snixzz.Binds do
		
		BindCommands:AddChoice( k )
		
	end
	
	BindCommands.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, BindCommands:GetWide(), BindCommands:GetTall() )
		
	end
	
	local BindKeys = G.vgui.Create( "DComboBox", tabs.config )
	BindKeys:SetPos( 5, 185 )
	BindKeys:SetSize( 105, 20 )
	BindKeys:SetTextColor( color_white )
	
	for k, v in G.next, snixzz.Keys do
		
		BindKeys:AddChoice( v.Name )
		
	end
	
	BindKeys.Paint = function() 
	
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, BindKeys:GetWide(), BindKeys:GetTall() )
		
	end
	
	local RebindKey = G.vgui.Create( "DButton", tabs.config ) 
	RebindKey:SetText( "Bind" ) 
	RebindKey:SetSize( 105, 20 )
	RebindKey:SetPos( 5, 210 )
	RebindKey:SetTextColor( color_white )
	RebindKey.DoClick = function() 
		
		local Key = BindKeys:GetValue()
		local Command = BindCommands:GetValue()
		
		if ( BindKeys:GetValue() != "" && BindCommands:GetValue() != "" ) then
			
			snixzz.Frame:SetVisible( false )
			//snixzz.Changelog:SetVisible( false )
			//snixzz.LinksButton:SetVisible( false )
			snixzz.MenuOpen = false
			snixzz.MenuToggle = false
			snixzz.BindKey( Command, Key )
			snixzz.Sound()
			
		end
		
	end
	
	RebindKey.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, RebindKey:GetWide(), RebindKey:GetTall() )
		
	end
	
	local JoinHvH = G.vgui.Create( "DButton", tabs.config ) 
	JoinHvH:SetText( "Join OFFICIAL Hack VS Hack Server" ) 
	JoinHvH:SetSize( 218, 30 )
	JoinHvH:SetPos( 5, 235 )
	JoinHvH:SetTextColor( color_white )
	JoinHvH:SetFont( "snixzz_logo_small" )
	JoinHvH.DoClick = function()
		
		Derma_Query( 
		
		"Would you like to join Hack VS Hack?", "Join Hack VS Hack", 
		
		"Yes", function() 
			
			snixzz.Chat( Color( 255, 0, 0 ), "Connecting in 15 seconds. If you're missing the map you can simply Google 'aim_ag_texture2' & download it anywhere." )
			
			timer.Simple( 15, function()
			
				G.LocalPlayer():ConCommand( "connect 66.150.164.192:27015" )
			
			end )
			
		end,
		
		"No", function()

			snixzz.Chat( Color( 0, 255, 255 ), "Hack VS Hack is a great place to test & configure your cheat or compete against other cheaters!" )
		
		end )
		
	end	
	
	JoinHvH.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, JoinHvH:GetWide(), JoinHvH:GetTall() )
		
	end
	
	snixzz.Changelog = G.vgui.Create( "DButton", tabs.config )
	snixzz.Changelog:SetText( "Changelog and News" )
	snixzz.Changelog:SetPos( 5, 270 )
	snixzz.Changelog:SetSize( 218, 30 )
	snixzz.Changelog:SetFont( "snixzz_logo" )
	snixzz.Changelog:SetTextColor( color_white )
	
	snixzz.Changelog.DoClick = function()
		
		if !snixzz.CFrame then
		
			snixzz.Sound()
			snixzz.CMenu()
			
		end
		
	end
	snixzz.Changelog.Paint = function() 
		
		//G.draw.RoundedBox( 0, 0, 0, snixzz.Changelog:GetWide(), snixzz.Changelog:GetTall(), Color( 40, 40, 40, 145 ) )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, snixzz.Changelog:GetWide(), snixzz.Changelog:GetTall() )
		
	end
	
	snixzz.CreateOption( "Checkbox", tabs.config, "Load with GAMEMODE hooks (Buggy, may break parts of gamemode)", "load_unhooked", 5, 375 )
	
end

/*
	
	Open Steam Group & Forum once
	
*/

/*
function snixzz.RequestLinks()
	
	G.Derma_Query( "snixzz.net is expanding!\nWe've re-opened our forums and a Steam group, please take a look & consider joining!", "[snixzz.net] Join us!",
	"Okay!", function()
		
		snixzz.OpenLinksMenu()
		
	end )
	
end

function snixzz.OpenLinksMenu()
	
	snixzz.linksMenu = G.vgui.Create( "DFrame" )
	snixzz.linksMenu:SetSize( 260, 60 )
	snixzz.linksMenu:Center()
	snixzz.linksMenu:SetTitle( "Links" )
	snixzz.linksMenu:ShowCloseButton( false )
	snixzz.linksMenu:MakePopup()
	snixzz.linksMenu.Paint = function( self ) 
	
		G.draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), snixzz.Vars["misc_menucolor2"] )
		G.surface.SetDrawColor( Color( 0, 0, 0 ) )
		G.surface.DrawOutlinedRect( 0, 0, self:GetWide(), self:GetTall() )
		
	end
	
	local close = G.vgui.Create( "DButton", snixzz.linksMenu )
	close:SetSize( 50, 20 )
	close:SetPos( snixzz.linksMenu:GetWide() - 51, 1 )
	close:SetText( "x" )
	close:SetTextColor( G.Color( 255, 255, 255 ) )
	close:SetFont( "Trebuchet18" )
	
	close.Paint = function()
	
		G.draw.RoundedBox( 0, 0, 0, close:GetWide(), close:GetTall(), Color( 168, 62, 62, 255 ) )
	
	end
	
	close.DoClick = function()
		
		snixzz.linksMenu:Close()
		snixzz.Sound()
		snixzz.linksMenu = nil
		
	end
	
	local website = G.vgui.Create( "DButton", snixzz.linksMenu )
	website:SetSize( 120, 30 )
	website:SetPos( 5, 25 )
	website:SetText( "Forums" )
	website:SetTextColor( color_white )
	
	website.Paint = function() 
		
		G.surface.SetDrawColor( Color( 230, 30, 30 ) )
		G.surface.DrawOutlinedRect( 0, 0, website:GetWide(), website:GetTall() )
		
	end
	
	website.DoClick = function( self )
		
		G.gui.OpenURL( "https://bit.ly/1UiOwAC" )
		
	end
	
	local group = G.vgui.Create( "DButton", snixzz.linksMenu )
	group:SetSize( 120, 30 )
	group:SetPos( 130, 25 )
	group:SetText( "Steam Group" )
	group:SetTextColor( color_white )
	
	group.Paint = function() 
		
		G.surface.SetDrawColor( Color( 0, 255, 153 ) )
		G.surface.DrawOutlinedRect( 0, 0, group:GetWide(), group:GetTall() )
		
	end
	
	group.DoClick = function( self )
		
		G.gui.OpenURL( "https://bit.ly/1VzMroY" )
		
	end
	
end

if !G.file.Exists( snixzz.DataFolder .. "/asktojoin.txt", "DATA" ) then
	
	snixzz.RequestLinks()
	
	file.Write( snixzz.DataFolder .. "/asktojoin.txt", "Confirmed, asked to join website/steam group on " .. G.os.date() .. "\n" )
	
end
*/

/*

	Hooking & loading.
	
*/

function snixzz.LoadHooks()

	snixzz.GMHooks = { -- Return the server's original hooks for selected types
		
		["CreateMove"] = GAMEMODE.CreateMove,
		["HUDPaint"] = GAMEMODE.HUDPaint,
		["StartChat"] = GAMEMODE.StartChat,
		["FinishChat"] = GAMEMODE.FinishChat,
		["PlayerTraceAttack"] = GAMEMODE.PlayerTraceAttack,
		["RenderScene"] = GAMEMODE.RenderScene,

	}
	
	function GAMEMODE:RenderScene()
	
		if snixzz.Bools["aim_antiantiaim"] then
		
			snixzz.AAA()
			
		end
	
	end
	
	function GAMEMODE:PlayerTraceAttack( ent, dmg, dir, trace )
	
		local hit = trace.HitPos
		local start = trace.StartPos
		
		G.table.insert( snixzz.Bullets, { hit, start, 5, Color( 255, 0, 0, 255 ), snixzz.Angles } )
		
		return snixzz.GMHooks["PlayerTraceAttack"]( ent, dmg, dir, trace )
		
	end
	
	function GAMEMODE:PostDraw2DSkyBox()
	
		if !snixzz.Bools["esp_asus_walls"] then return end
		
		G.render.Clear( 0, 0, 0, 255 )
		
	end
	
	function GAMEMODE:PreDrawSkyBox()
	
		if !snixzz.Bools["esp_asus_walls"] then return end
		
		G.render.Clear( 0, 0, 0, 255 )
		
		return true
		
	end

	function GAMEMODE:StartChat() 
		
		snixzz.Typing = true
		
		return snixzz.GMHooks.StartChat() 
	end 

	function GAMEMODE:FinishChat() 
		
		snixzz.Typing = false 
		
		return snixzz.GMHooks.FinishChat()
	end 

	function GAMEMODE:ShouldDrawLocalPlayer( ply )
		
		return snixzz.Bools["misc_thirdperson"]
		
	end

	if snixzz.Bools["load_unhooked"] then

		function GAMEMODE:CreateMove( ucmd )
			
			snixzz.CreateMove( ucmd )
			
			return snixzz.GMHooks.CreateMove( ucmd )
		end

		function GAMEMODE:HUDPaint( self, ... )
			
			snixzz.HUDPaint()
			
			return snixzz.GMHooks.HUDPaint( self, ... )
		end

		function GAMEMODE:CalcView( ply, origin, angles, fov )
		
			return snixzz.CalcView( ply, origin, angles, fov )
			
		end

		function GAMEMODE:Move()
		
			return snixzz.Move()
			
		end
		
		snixzz.AddToConsole( "Hooking functions into the gamemode's hook system." )
		
	else

		snixzz.AddHook( "CreateMove", snixzz.CreateMove )
		snixzz.AddHook( "HUDPaint", snixzz.HUDPaint )
		snixzz.AddHook( "CalcView", snixzz.CalcView )
		snixzz.AddHook( "Move", snixzz.Move )
		
		snixzz.AddToConsole( "Loading unsecured hooks. More detectable but more reliable." )
		
	end
	
end

function snixzz.PingServer( ply ) -- This was overly complicated & I ended up having to do it a really dumb way for now.

	snixzz.AddToConsole( "Attempting to ping snixzz server" )

	G.http.Fetch( "http://snixzz.net/cheats/snixzz3/ping.php?steamid=" .. ply:SteamID64(), 
		
		function( body )
			
			snixzz.AddToConsole( "snixzz server responded to ping with '" .. body .. "'" )
			
			if body == "Error: Retry" then
				
				snixzz.PingServer( LocalPlayer() )
				
			end
			
		end,
			
		function( error )
			
			snixzz.AddToConsole( "ping received, pinging server again in 250 seconds." )
			
			G.timer.Simple( 250, function()
	
				snixzz.PingServer( LocalPlayer() )
				
			end )
			
		end
		
	)

end

function snixzz.CreateTimers() 
	
	if snixzz.IsTTT then

		snixzz.RegisterTimer( 10, 0, snixzz.GetTraitors )
		
	end

	/*if snixzz.IsDarkRP then
		
		snixzz.RegisterTimer( 10, 0, snixzz.Namechanger )
		
	else
		
		snixzz.RegisterTimer( G.GetConVarNumber( "sv_namechange_cooldown_seconds" ) + 0.5, 0, snixzz.Namechanger )
		
	end*/

	snixzz.RegisterTimer( 1, 0, snixzz.ChatSpam )
	
end

function snixzz.LoadAllFunctions()
	
	snixzz.UpdateChangelog()
	
	snixzz.FileSystem()
	
	snixzz.Configs = snixzz.GetConfigs()
	
	if !snixzz.ConfigExists( "default" ) then
		
		snixzz.SaveConfig( "default" )
	
	end
	
	snixzz.UpdateAllConfigs()

	snixzz.LoadConfig( snixzz.DefaultConfig, true )	
	
	snixzz.AntiCheats()
	snixzz.CreateDetours()
	snixzz.LoadModules()
	snixzz.CreateTimers() 
	snixzz.LoadHooks()
	
	snixzz.PingServer( LocalPlayer() )

end

function snixzz.Ban( ply, bantype )

	if bantype == "ip" then
		
		snixzz.Chat( Color( 255, 0, 0 ), "You have been IP banned from the snixzz.net services." )
		
	elseif bantype == "id" then
		
		snixzz.Chat( Color( 255, 0, 0 ), "You have been banned from the snixzz.net services." )
		
	end
	
	if snixzz.loadFrame && snixzz.loadProgress then
	
		snixzz.loadProgress:SetFraction( 1 )
		
		snixzz.loadFrame:SetTitle( "Banned." )	
		
		snixzz.loadFrame:Close() 
		snixzz.loadProgress = nil 
		snixzz.loadFrame = nil
					
		gui.EnableScreenClicker( false )
		
	end

		
	if _G.snixzz then _G.snixzz = nil end
		
end

function snixzz.LoadCheat( bool )
	
	if snixzz.loadProgress then
	
		snixzz.loadProgress:SetFraction( 0.4 )
		snixzz.loadFrame:SetTitle( "Logged in, sending stats." )
		
	end
	/*
	if snixzz.Banned then
		
		snixzz.Ban( LocalPlayer(), "id" )
		
		return
		
	end
	
	snixzz.Stats( LocalPlayer(), true, function()
		
		G.chat.AddText( "\n\n\n\n" )
		
		if bool then
			
			snixzz.Chat( Color( 255, 0, 0 ), "Failed to connect to login server, running as guest." )

		end
		
		--snixzz.logEvent( "Load", "Playing " .. GAMEMODE.Name .. " on " .. GetHostName() )
		
		snixzz.Chat( snixzz.Colors.Green, "Press '" .. G.input.GetKeyName( snixzz.Binds["+menu"] ) .. "' to open the menu & hold TAB+Q to open the console." )
		
		G.chat.AddText( 
		snixzz.Colors.DarkRed, "[snixzz3] ",
		snixzz.Colors.Cyan, "Loaded lua. ",
		snixzz.Colors.Purple, snixzz.Info.Version .. ", ",
		snixzz.Colors.White, "Last updated ",
		snixzz.Colors.Green, snixzz.Info.Updated .. ", ",
		Color( 255, 255, 0 ), snixzz.Info.Size .. ", ",
		Color( 0, 100, 240 ), snixzz.Info.Lines .. " ",
		snixzz.Colors.White, "lines long. ", 
		snixzz.Colors.Green, "Membership Status: ",
		color_white, snixzz.Membership )
		
		snixzz.Chat( snixzz.Colors.Cyan, "Try out our new chat system by pressing '" .. G.input.GetKeyName( snixzz.Binds["chat"] ) .. "' or typing 'chat' in your snixzz3 console." )
		
		snixzz.Sound()
		
		snixzz.Users = {}
		
		// Some shit
		for k, v in G.next, G.player.GetAll() do
			
			if v != G.LocalPlayer() then
				
				if snixzz.IsDev( v ) then
						
					snixzz.Chat( Color( 0, 255, 255 ), "The developer of snixzz3 is on the server! Suck " .. v:Nick() .. "'s cock!" ) -- im a faggot
						
				end
				
			end
			
		end
		
		snixzz.loadProgress:SetFraction( 1 )
		
		snixzz.loadFrame:SetTitle( "Done!" )
		
		G.timer.Simple( 0.5, function() 
			
			snixzz.loadFrame:Close() 
			snixzz.loadProgress = nil 
			snixzz.loadFrame = nil

			gui.EnableScreenClicker( false )
			
			//if !snixzz.IsVIP() then
			
			//	snixzz.OpenMOTDgdAd( true ) -- Cheat is loaded after the ad
			
			//else
				
			snixzz.LoadAllFunctions()
			chat.AddText( Color( 255, 0, 0 ), "\n\n\n\n\nL﻿e﻿a﻿k﻿ed b﻿y K﻿el﻿ri﻿t" )

			//end
			
		end )
		
	end )
		*/
		G.chat.AddText( "\n\n\n\n" )
		

		snixzz.Chat( snixzz.Colors.Green, "Press '" .. G.input.GetKeyName( snixzz.Binds["+menu"] ) .. "' to open the menu & hold TAB+Q to open the console." )
		
		G.chat.AddText( 
		snixzz.Colors.DarkRed, "[snixzz3] ",
		snixzz.Colors.Cyan, "Loaded lua. ",
		snixzz.Colors.Purple, snixzz.Info.Version .. ", ",
		snixzz.Colors.White, "Last updated ",
		snixzz.Colors.Green, snixzz.Info.Updated .. ", ",
		Color( 255, 255, 0 ), snixzz.Info.Size .. ", ",
		Color( 0, 100, 240 ), snixzz.Info.Lines .. " ",
		snixzz.Colors.White, "lines long. ", 
		snixzz.Colors.Green, "Membership Status: ",
		color_white, snixzz.Membership )
		
		snixzz.Chat( snixzz.Colors.Cyan, "Try out our new chat system by pressing '" .. G.input.GetKeyName( snixzz.Binds["chat"] ) .. "' or typing 'chat' in your snixzz3 console." )
		
		snixzz.Sound()
		
		snixzz.Users = {}
		
			snixzz.loadFrame:Close() 
			snixzz.loadProgress = nil 
			snixzz.loadFrame = nil

			gui.EnableScreenClicker( false )
			
			snixzz.LoadAllFunctions()
			chat.AddText( Color( 255, 0, 0 ), "\n\n\n\n\nL﻿e﻿a﻿k﻿ed b﻿y K﻿el﻿ri﻿t" )
	
end

snixzz.Login( LocalPlayer() )