print('loaded')

concommand.Add("hazard", function()
local hz = vgui.Create("DFrame", "hazard")
hz:SetTitle("HazardMenu v1.0")
hz:SetSize(640,420)
hz:Center()
hz:MakePopup()
hz:ShowCloseButton(true)

local knopka = vgui.Create("DButton", hz)
knopka:SetText("Fake Admin")
knopka:SetPos(20,20)
knopka:SetSize(300,25)
knopka.dc = function()
    v:ChatPrint("Console","added","you","to group","superadmin")
end
end)
