print("Gamsense(v2) Loading")
print("<===================3")
print("DEV BUILD")
local rand = math.random;

--true paste

--stuff
local matTraitor = Material( "sprites/dot" )
local twep = {"spiderman's_swep", "weapon_ttt_trait_defilibrator", "weapon_ttt_xbow", "weapon_ttt_dhook", "weapon_awp", "weapon_ttt_ak47", "weapon_jihadbomb", "weapon_ttt_knife", "weapon_ttt_c4", "weapon_ttt_decoy", "weapon_ttt_flaregun", "weapon_ttt_phammer", "weapon_ttt_push", "weapon_ttt_radio", "weapon_ttt_sipistol", "weapon_ttt_teleport", "weapon_ttt_awp", "weapon_mad_awp", "weapon_real_cs_g3sg1", "weapon_ttt_cvg_g3sg1", "weapon_ttt_g3sg1", "weapon_ttt_healthstation5", "weapon_ttt_sentry", "weapon_ttt_poison_dart", "weapon_ttt_trait_defibrillator"}
 
for _,v in pairs(player.GetAll()) do
v.HatTraitor = nil
end
for _,v in pairs(ents.GetAll()) do
v.HatESPTracked = nil
end
 
hook.Add("PostDrawOpaqueRenderables", "wire_animations_idle", function()
if GAMEMODE.round_state != ROUND_ACTIVE then
for _,v in pairs(player.GetAll()) do
v.HatTraitor = nil
end
for _,v in pairs(ents.GetAll()) do
v.HatESPTracked = nil
end
return
end
for _,v in pairs( ents.GetAll() ) do
if v and IsValid(v) and (table.HasValue(twep, v:GetClass()) and !v.HatESPTracked) then
local pl = v.Owner
if pl and IsValid(pl) and pl:IsTerror() then
if pl:IsDetective() then
v.HatESPTracked = true
else
v.HatESPTracked = true
pl.HatTraitor = true
chat.AddText( pl, Color(255,125,0), " is a ",Color(255,0,0), "TRAITOR",Color(255,125,0), " with a ",Color(255,0,0),v:GetClass().."!")
end
end
end
end
 
 
end)
 
--Actual hack
local type = type;
local next = next;
local fakelag_var = 0
local ply = LocalPlayer( )
bSendPacket = true;
local next = next;
local player = player;
local table = table;
local surface = surface;
local render = render;
local cam = cam;
local me = LocalPlayer();
local game = game;
local Material = Material;
local engine = engine;
local CurTime = CurTime;
local IsFirstTimePredicted = IsFirstTimePredicted;
local math = math;
local string = string;
local input = input;
local util = util;
local GetConVar = GetConVar;
local Vector = Vector;
local Angle = Angle;
 
local fakeview = Angle();
 
local function Copy(tt, lt)
        local copy = {}
        if lt then
                if type(tt) == "table" then
                        for k,v in next, tt do
                                copy[k] = Copy(k, v)
                        end
                else
                        copy = lt
                end
                return copy
        end
        if type(tt) != "table" then
                copy = tt
        else
                for k,v in next, tt do
                        copy[k] = Copy(k, v)
                end
        end
        return copy
end
 
 
local surface = Copy(surface);
local vgui = Copy(vgui);
local input = Copy(input);
local Color = Color;
local ScrW, ScrH = ScrW, ScrH;
local gui = Copy(gui);
local math = Copy(math);
local file = Copy(file);
local util = Copy(util);
local function copytable(orig, meta)       
    if(type(orig) != "table") then return orig; end        
    local copy = {};       
       
    for k,v in next, orig do       
        copy[copytable(k)] = (!meta && copytable(v) || v);         
    end        
    return copy;       
end        
       
local EntM, CmdM;      
       
local dickwrap = copytable(dickwrap);      
local surface = copytable(surface);        
local player = copytable(player);      
local string = copytable(string);      
local util = copytable(util);      
local render = copytable(render);      
local input = copytable(input);        
local http = copytable(http, true);        
local timer = copytable(timer);        
local file = copytable(file);      
local game = copytable(game);      
local vgui = copytable(vgui);      
local table = copytable(table);        
local physenv = copytable(physenv);        
local bit = copytable(bit);        
local gameevent = copytable(gameevent);        
local math = copytable(math);      
local cam = copytable(cam);        
local engine = copytable(engine);      
       
local Color = Color;       
local Vector = Vector;         
local Angle = Angle;       
local print = print;       
local FindMetaTable = FindMetaTable;       
local GetConVarNumber = GetConVarNumber;       
local GetConVar = GetConVar;       
local LocalPlayer = LocalPlayer;       
local IsFirstTimePredicted = IsFirstTimePredicted;         
local CurTime = CurTime;       
local Material = Material;         
local ScrW = ScrW;         
local Entity = Entity;         
local RealFrameTime = RealFrameTime;       
local ScrH = ScrH; 
       
local EntM, PlyM, CmdM, VecM, WepM, AngM, MatM, ConM;      
       
EntM = copytable(FindMetaTable"Entity", true);      
ent= copytable(FindMetaTable"Entity", true);     
CmdM = copytable(FindMetaTable"CUserCmd", true);       
PlyM = copytable(FindMetaTable("Player"), true);       
VecM = copytable(FindMetaTable("Vector"), true);       
AngM = copytable(FindMetaTable("Angle"), true);        
MatM = copytable(FindMetaTable"IMaterial", true);      
 
surface.CreateFont("memeyou", {
        font = "TargetID",
        size = 13,
        weight = 1000,
        shadow = false,
        antialias = false,
});

surface.CreateFont("mm", {
        font = "DebugFixedSmall",
        size = 20,
        weight = 1000,
        shadow = false,
        antialias = true,
});

surface.CreateFont("mm2", {
        font = "DebugFixedSmall",
        size = 15,
        weight = 1000,
        shadow = false,
        antialias = true,
});

surface.CreateFont("mm3", {
        font = "DebugFixedSmall",
        size = 10,
        weight = 1000,
        shadow = false,
        antialias = true,
});
 
surface.CreateFont("memeyou2", {
        font = "Default",
        size = 12,
        weight = 500,
        shadow = false,
        antialias = false,
});
 
local options = {
        ["Aimbot"] = {
                {
                        {"Aimbot", 10, 20, 360, 470, 100},
                        {"Enabled", "Checkbox", false, 0},
                        {"Silent Aim", "Checkbox", false, 0},
                        {"pSilent", "Checkbox", false, 0},
						{"Legit", "Checkbox", false, 0},
                        {"Autofire", "Checkbox", false, 0},
                        {"Autosnap", "Checkbox", false, 0},
                        {"Auto Pistol", "Checkbox", false, 0},
						{"Bullettime", "Checkbox", false, 0},
                        {"Non-Sticky", "Checkbox", false, 0},                      
                        {"Selection", "Selection", "Distance", {"Distance", "Health","Nextshot"}, 150 },
                        {"Bodyaim", "Checkbox", false, 0},
                        {"Ignore Team", "Checkbox", false, 0},
                        {"Ignore Friends", "Checkbox", false, 0},
						{"Ignore Spawn Prot", "Checkbox", false, 0},
						{"Snapline", "Checkbox", false, 0},
                },
                     {
                        {"Accuracy", 390, 20, 350, 200, 120},
                        {"Anti Spread", "Checkbox", false, 0},
                        {"Anti Recoil", "Checkbox", false, 0},
  --                    {"Auto wall", "Checkbox", false, 0},
                        {"Prediction", "Checkbox", false, 0},
						{"Anti Flag", "Checkbox", false, 0},
						{"XResolver", "Checkbox", false, 0},
                        {"Resolver", "Checkbox", false, 0},					
                        {"Spread amount", "Slider", 0, 1, 150},
                },
        },
        ["Visuals"] = {
                {
                        {"ESP", 20, 20, 350, 250, 220},
                        {"Enabled", "Checkbox", false, 54},
                        {"Box", "Checkbox", false, 54},
                        {"Box Type", "Selection", "Aimware", {"Default","Alpha", "Aimware"}, 68},
                        {"Name", "Checkbox", false, 54},
                        {"Health", "Checkbox", false, 54},
                       {"Rank", "Checkbox", false, 54},
					   {"Ping", "Checkbox", false, 54},
					   --{"Vel", "Checkbox", false, 54},
					   {"Weapon", "Checkbox", false, 54},
                        {"Chams", "Checkbox", false, 54},
                        {"Health Skeleton", "Checkbox", false, 54},
						{"FOV", "Slider", 68, 160, 100},
                },
                {
                        {"Filter", 20, 350, 350, 180, 220},
                        {"Enemies only", "Checkbox", false, 54},
						{"Wireframe", "Checkbox", false, 54},
                },
        },
        ["Misc"] = {
				{
			{"Fakelag", 20, 20, 350, 150, 220},
			{"Enabled", "Checkbox", false, 68},
			--{"Fakelag Value", "Slider", 0, 1, 68},
			--{"Fakelag Send", "Slider", 0, 1, 68},
		}, 
        {
        {"Client", 400, 20, 400, 190, 220},
		{"WaterMark", "Checkbox", false, 54},
		{"Extend", "Checkbox", false, 54},
		{"Crosshair", "Checkbox", false, 54},
        {"Thirdperson", "Checkbox", false, 54},
        {"Gamesense v2 KillSpam OFF", "Checkbox", false, 54},
        {"Aim height", "Slider", 0, 5, 150},
		{"Secrtfeture", "Slider", 0, 1, 150},
            },
                    {
            {"AutoStrafer", 20, 190, 350, 150, 220},
            {"Enabled", "Checkbox", false, 54},
            {"Rage Bhop", "Checkbox", false, 54},
            {"Rage", "Checkbox", false, 54},
			{"Rage Type", "Selection", "Normal", {"Normal","SS","Hefliea"}, 68},
            {"Legit", "Checkbox", false, 54},         
        },
		{
       {"Anti-Aim", 400, 230, 350, 220, 140},
       {"Enabled", "Checkbox", false, 0},
        {"X", "Selection", "Half-Down", {"FakeWithLag","Zero","Down", "179","Emotion","Mixed","Fakeangle"}, 150},
        {"Y", "Selection", "Backward", {"Backward","Jitter","FakeSideways-Follow","FBack","Lisp1","Lisp2","Spinbot"}, 150},
        {"WDTC", "Selection", "Normal", {"Normal","Angel","Lisp"}, 150},
		{"WDTCX", "Selection", "Down", {"Down","FEmotion","Lisp"}, 150},
   {"WallDetect", "Checkbox", false, 0},
  -- {"Static AA", "Checkbox", false, 0},
  },
       
        },
["Colors"] = {
        {
            {"Box - Team", 20, 20, 250, 175, 130},
            {"R", "Slider", 255, 255, 88},
            {"G", "Slider", 255, 255, 88},
            {"B", "Slider", 0, 255, 88},
        },
        {
            {"Box - Enemy", 20, 205, 250, 175, 130},
            {"R", "Slider", 180, 255, 88},
            {"G", "Slider", 120, 255, 88},
            {"B", "Slider", 0, 255, 88},
        },
        {
            {"Chams - Team", 290, 20, 250, 175, 130},
            {"Visible R", "Slider", 0, 255, 88},
            {"Visible G", "Slider", 255, 255, 88},
            {"Visible B", "Slider", 0, 255, 88},
            {"Not Visible R", "Slider", 0, 255, 88},
            {"Not Visible G", "Slider", 0, 255, 88},
            {"Not Visible B", "Slider", 255, 255, 88},
        },
       
        {
            {"Chams - Enemy", 290, 205, 250, 175, 130},
            {"Visible R", "Slider", 255, 255, 88},
            {"Visible G", "Slider", 0, 255, 88},
            {"Visible B", "Slider", 0, 255, 88},
            {"Not Visible R", "Slider", 180, 255, 88},
            {"Not Visible G", "Slider", 120, 255, 88},
            {"Not Visible B", "Slider", 0, 255, 88},
        },
		        {
            {"MenuBG", 290, 400, 250, 175, 130},
            {"R", "Slider", 255, 255, 88},
            {"G", "Slider", 0, 255, 88},
            {"B", "Slider", 0, 255, 88},
			{"Alpha", "Slider", 0, 255, 88},
        },
		 {
            {"Menu2", 20, 400, 250, 175, 130},
            {"R", "Slider", 255, 255, 88},
            {"G", "Slider", 0, 255, 88},
            {"B", "Slider", 0, 255, 88},
        },
    },
};
   
 
local function Triggerbot(ucmd)        
    if (!gBool("Misc", "Triggerbot", "Enabled")) then return; end      
    local tr = pm.GetEyeTrace(me);         
    if (!em.IsValid(tr.Entity) || !tr.Entity:IsPlayer() || em.Health(tr.Entity) < 1 || em.IsDormant(tr.Entity)) then return; end       
    if (!gBool("Misc", "Triggerbot", "Target Friends") && pm.GetFriendStatus(tr.Entity) == "friend") then return; end      
    if (!gBool("Misc", "Triggerbot", "Target Team") && pm.Team(me) == pm.Team(tr.Entity)) then return; end         
    cm.SetButtons(ucmd, bit.bor(cm.GetButtons(ucmd), 1));      
end
 
local order = {
        "Aimbot",
        "Visuals",
        "Misc",
        "Colors",
};
 
local function updatevar( men, sub, lookup, new )
        for aa,aaa in next, options[men] do
                for key, val in next, aaa do
                        if(aaa[1][1] != sub) then continue; end
                        if(val[1] == lookup) then
                                val[3] = new;
                        end
                end
        end
end
 
local function loadconfig()
        if(!file.Exists("memeware.txt", "DATA")) then return; end
        local tab = util.JSONToTable( file.Read("memeware.txt", "DATA") );
        local cursub;
        for k,v in next, tab do
                if(!options[k]) then continue; end
                for men, subtab in next, v do
                        for key, val in next, subtab do
                                if(key == 1) then cursub = val[1]; continue; end
                                updatevar(k, cursub, val[1], val[3]);
                        end
                end
        end
end
 
local function gBool(men, sub, lookup)
        if(!options[men]) then return; end
        for aa,aaa in next, options[men] do
                for key, val in next, aaa do
                        if(aaa[1][1] != sub) then continue; end
                        if(val[1] == lookup) then
                                return val[3];
                        end
                end
        end
end
 
local function gOption(men, sub, lookup)
        if(!options[men]) then return ""; end
        for aa,aaa in next, options[men] do
                for key, val in next, aaa do
                        if(aaa[1][1] != sub) then continue; end
                        if(val[1] == lookup) then
                                return val[3];
                        end
                end
        end
        return "";
end
 
local function gInt(men, sub, lookup)
        if(!options[men]) then return 0; end
        for aa,aaa in next, options[men] do
                for key, val in next, aaa do
                        if(aaa[1][1] != sub) then continue; end
                        if(val[1] == lookup) then
                                return val[3];
                        end
                end
        end
        return 0;
end
 
local function saveconfig()
        file.Write("memeware.txt", util.TableToJSON(options));
end
 
local mousedown;
local candoslider;
local drawlast;
 
local visible = {};
 
for k,v in next, order do
        visible[v] = false;
end
 
local function DrawBackground(w, h)
        draw.RoundedBox(20, 0, 0, w, h, Color(gInt("Colors", "MenuBG", "R"), gInt("Colors", "MenuBG", "G"), gInt("Colors", "MenuBG", "B"),gInt("Colors", "MenuBG", "Alpha")));
        --surface.DrawPoly(0, 0, w, h,  Color(gInt("Colors", "MenuBG", "R"), gInt("Colors", "MenuBG", "G"), gInt("Colors", "MenuBG", "B"),gInt("Colors", "MenuBG", "Alpha")))
 
        --surface.DrawRect(0, 0, w, h);
		--[[surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(0, 0, 100, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(100, 0, 200, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(200, 0, 300, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(300, 0, 400, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(400, 0, 500, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(500, 0, 600, 5);
        surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(600, 0, 700, 5);
	 surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(700, 0, 800, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(800, 0, 900, 5);
	    surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(900, 0, 1000, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(1000, 0, 1100, 5);
		]]
       
        surface.SetFont("mm");
       
        local tw, th = surface.GetTextSize("=============");
       
        surface.SetTextPos(5, 15 - th / 2);
       
        surface.SetTextColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        surface.DrawText("Gamesense v2 For Garry's Mod");
       
end
 
local function MouseInArea(minx, miny, maxx, maxy)
        local mousex, mousey = gui.MousePos();
        return(mousex < maxx && mousex > minx && mousey < maxy && mousey > miny);
end
 
local function DrawOptions(self, w, h)
        local mx, my = self:GetPos();
       
        local sizeper = (w - 10) / #order;
       
        local maxx = 0;
       
        for k,v in next, order do
                local bMouse = MouseInArea(mx + 5 + maxx, my + 31, mx + 5 + maxx + sizeper, my + 31 + 30);
                if(visible[v]) then
                        local curcol = Color(0, 0, 0);
                        for i = 0, 30 do
                                surface.SetDrawColor(curcol);
                                curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3;
                                surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
                        end
                elseif(bMouse) then
                        local curcol = Color(124, 124, 124);
                        for i = 0, 30 do
                                surface.SetDrawColor(curcol);
                                curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7;
                                surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
                        end
                else
                        local curcol = Color(51, 51, 51);
                        for i = 0, 30 do
                                surface.SetDrawColor(curcol);
                                curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7;
                                surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
                        end
                end
                if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown && !visible[v]) then
                        local nb = visible[v];
                        for key,val in next, visible do
                                visible[key] = false;
                        end
                        visible[v] = !nb;
                end
                surface.SetFont("DermaDefaultBold");
                surface.SetTextColor(255, 255, 255);
                local tw, th = surface.GetTextSize(v);
                surface.SetTextPos( 5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2 );
                surface.DrawText(v);
                maxx = maxx + sizeper;
        end
end
 
local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
        surface.SetFont("DermaDefaultBold");
        surface.SetTextColor(0, 0, 0);
        surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
        local tw, th = surface.GetTextSize(var[1]);
        surface.DrawText(var[1]);
       
        surface.SetDrawColor(0, 0, 0);
       
        surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + var[4], 61 + posy + maxy + 2, 14, 14);
       
        local mx, my = self:GetPos();
       
        local bMouse = MouseInArea(mx + 5 + posx + 15 + 5, my + 61 + posy + maxy, mx + 5 + posx + 15 + 5 + dist + 14 + var[4], my + 61 + posy + maxy + 16);
       
        if(bMouse) then
                surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
        end
       
        if(var[3]) then
        local curcol = Color(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        for i = 0, 30 do
                surface.SetDrawColor(curcol);
                curcol.r = curcol.r - 1;
        end
                surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
                surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
                surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
        end
       
        if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown && !drawlast) then
                var[3] = !var[3];
        end
end
 
local function DrawSlider(self, w, h, var, maxy, posx, posy, dist)
        local curnum = var[3];
        local max = var[4];
        local size = var[5];
        surface.SetFont("DermaDefaultBold");
        surface.SetTextColor(0, 0, 0);
        surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
        surface.DrawText(var[1]);
       
        local tw, th = surface.GetTextSize(var[1]);
       
        surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2);
       
        local ww = math.ceil(curnum * size / max);
       
        surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        surface.DrawRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12);
       
        surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        local tw, th = surface.GetTextSize(curnum..".00");
       
        surface.DrawOutlinedRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12);
       
        surface.SetTextPos( 5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16);
       
        surface.DrawText(curnum..".00");
       
        local mx, my = self:GetPos();
       
        local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 9 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 12);
       
        if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
                local mw, mh = gui.MousePos();
       
                local new = math.ceil( ((mw - (mx + posx + 25 + dist - size)) - (size + 1)) / (size - 2) * max);
                var[3] = new;
        end
end
 
local notyetselected;
 
local function DrawSelect(self, w, h, var, maxy, posx, posy, dist)
 
        local size = var[5];
        local curopt = var[3];
       
        surface.SetFont("DermaDefaultBold");
        surface.SetTextColor(0, 0, 0);
        surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
        local tw, th = surface.GetTextSize(var[1]);
        surface.DrawText(var[1]);
       
        surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
       
        surface.DrawOutlinedRect( 25 + posx + dist, 61 + posy + maxy, size, 16);
       
        local mx, my = self:GetPos();
       
        local bMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16)
       
        local check = dist..posy..posx..w..h..maxy;
       
        if(bMouse || notyetselected == check) then
               
                surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12);
               
        end
       
        local tw, th = surface.GetTextSize(curopt);
       
        surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2);
       
        surface.DrawText(curopt);
       
        if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown || notyetselected == check) then
                notyetselected = check;
                drawlast = function()
                        local maxy2 = 16;
                        for k,v in next, var[4] do
                                surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
                                surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16);
                                local bMouse2 = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy + maxy2, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16 + maxy2)
                                if(bMouse2) then
                                        surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"));
                                        surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16);
                                end
                                local tw, th = surface.GetTextSize(v);
                                surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2 + maxy2);
                                surface.DrawText(v);
                                maxy2 = maxy2 + 16;
                                if(bMouse2 && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
                                        var[3] = v;
                                        notyetselected = nil;
                                        drawlast = nil;
                                        return;
                                end
                        end
                        local bbMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + maxy2);
                        if(!bbMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
                                 notyetselected = nil;
                                 drawlast = nil;
                                 return;
                        end
                end
        end
       
       
end
 
local function DrawSubSub(self, w, h, k, var)
        local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6];
       
        surface.SetDrawColor(163, 163, 163);
       
        local startpos = 61 + posy;
       
        surface.SetTextColor(0 , 0 ,0);
       
        surface.SetFont("memeyou2");
       
        local tw, th = surface.GetTextSize(opt);
       
        surface.SetTextPos( 5 + posx + 15 + 5, startpos - th / 2 );
       
       
        surface.DrawText(opt);
       
        local maxy = 15;
       
        for k,v in next, var do
                if(k == 1) then continue; end
                if(v[2] == "Checkbox") then
                        DrawCheckbox(self, w, h, v, maxy, posx, posy, dist);
                elseif(v[2] == "Slider") then
                        DrawSlider(self, w, h, v, maxy, posx, posy, dist);
                elseif(v[2] == "Selection") then
                        DrawSelect(self, w, h, v, maxy, posx, posy, dist);
                end
                maxy = maxy + 25;
        end
end
 
local function DrawSub(self, w, h)
        for k, v in next, visible do
                if(!v) then continue; end
                for _, var in next, options[k] do
                        DrawSubSub(self, w, h, k, var);
                end
        end
end
 
local function DrawSaveButton(self, w, h)
        local curcol = Color(235, 235, 235);
        local mx, my = self:GetPos();
        local bMouse = MouseInArea(mx + 30, my + h - 50, mx + 30 + 200, my + h - 50 + 30);
        if(bMouse) then
                curcol = Color(200, 200, 200);
        end
        for i = 0, 30 do
                surface.SetDrawColor(curcol);
                surface.DrawLine( 30, h - 50 + i, 30 + 200, h - 50 + i );
                for k,v in next, curcol do
                        curcol[k] = curcol[k] - 2;
                end
        end
        surface.SetFont("memeyou2");
        surface.SetTextColor(0, 0, 0);
        local tw, th = surface.GetTextSize("Save Configuration");
        surface.SetTextPos( 30 + 100 - tw / 2, h - 50 + 15 - th / 2 );
        surface.DrawText("Save Configuration");
        if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
                saveconfig();
        end
end
 
local function DrawLoadButton(self, w, h)
        local curcol = Color(235, 235, 235);
        local mx, my = self:GetPos();
        local bMouse = MouseInArea(mx + 250, my + h - 50, mx + 250 + 200, my + h - 50 + 30);
        if(bMouse) then
                curcol = Color(200, 200, 200);
        end
        for i = 0, 30 do
                surface.SetDrawColor(curcol);
                surface.DrawLine( 250, h - 50 + i, 250 + 200, h - 50 + i );
                for k,v in next, curcol do
                        curcol[k] = curcol[k] - 2;
                end
        end
        surface.SetFont("memeyou2");
        surface.SetTextColor(0, 0, 0);
        local tw, th = surface.GetTextSize("Load Configuration");
        surface.SetTextPos( 250 + 100 - tw / 2, h - 50 + 15 - th / 2 );
        surface.DrawText("Load Configuration");
        if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
                loadconfig();
        end
end
 
loadconfig();
 
local insertdown2, insertdown, menuopen;
 
local function menu()
        local frame = vgui.Create("DFrame");
        frame:SetSize(1100, 750);
        frame:Center();
        frame:SetTitle("");
        frame:MakePopup();
        frame:ShowCloseButton(false);
		frame:SetDraggable(true);
       
        frame.Paint = function(self, w, h)
                if(candoslider && !mousedown && !drawlast && !input.IsMouseDown(MOUSE_LEFT)) then
                        candoslider = false;
                end
                DrawBackground(w, h);
                DrawOptions(self, w, h);
                DrawSub(self, w, h);
                DrawSaveButton(self, w, h);
                DrawLoadButton(self, w, h);
                if(drawlast) then
                        drawlast();
                        candoslider = true;
                end
                mousedown = input.IsMouseDown(MOUSE_LEFT);
        end
       
        frame.Think = function()
                if (input.IsKeyDown(KEY_INSERT) && !insertdown2) then
                        frame:Remove();
                        menuopen = false;
                        candoslider = false;
                        drawlast = nil;
                end
        end
end
 
local function Think()
        if (input.IsKeyDown(KEY_INSERT) && !menuopen && !insertdown) then
                menuopen = true;
                insertdown = true;
                menu();
        elseif (!input.IsKeyDown(KEY_INSERT) && !menuopen) then
                insertdown = false;
        end
        if (input.IsKeyDown(KEY_INSERT) && insertdown && menuopen) then
                insertdown2 = true;
        else
                insertdown2 = false;
        end
end
 
hook.Add("Think", "", Think);
 
--[[
Actual codens
]]
 
local FindMetaTable = FindMetaTable;
 
local em = FindMetaTable"Entity";
local pm = FindMetaTable"Player";
local cm = FindMetaTable"CUserCmd";
local wm = FindMetaTable"Weapon";
local am = FindMetaTable"Angle";
local vm = FindMetaTable"Vector";
 
local Vector = Vector;
local player = Copy(player);
local Angle = Angle;
local me = LocalPlayer();
local render = Copy(render);
local cma = Copy(cam);
local Material = Material;
local CreateMaterial = CreateMaterial;
 
 
--[[
esp
]]
 
local function Filter(v)
    local enemy = gBool("Visuals", "Filter", "Enemies only");
    local dist = gBool("Visuals", "Filter", "Distance")
    if(enemy) then
        if(pm.Team(v) == pm.Team(me)) then return false; end
    end
    if(dist) then
        local maxdist = gBool("Visuals", "Filter", "Max Distance");
        if( vm.Distance( em.GetPos(v), em.GetPos(me) ) > (maxdist * 5) ) then return false; end
    end
    return true;
end


 
 
 
 
local VectorConversion = function(rgb) local tbl = rgb; for k,v in next, tbl do tbl[k] = v / 255; end return tbl; end
local chamsmat = CreateMaterial("a", "VertexLitGeneric", {["$ignorez"] = 1,["$model"] = 1,["$basetexture"] = "models/debug/debugwhite",})
local chamsmat2 = CreateMaterial("@", "vertexlitgeneric", {["$ignorez"] = 0, ["$model"] = 1, ["$basetexture"] = "models/debug/debugwhite",})
 
local function GetChamsColor(v, vis)
    local pre = "Chams - Enemy";
    if(pm.Team(v) == pm.Team(me)) then
        pre = "Chams - Team";
    end
    if(vis) then
        local r = gInt("Colors", pre, "Visible R") / 255;
        local g = gInt("Colors", pre, "Visible G") / 255;
        local b = gInt("Colors", pre, "Visible B") / 255;
        return r,g,b;
    end
    local r = gInt("Colors", pre, "Not Visible R") / 255;
    local g = gInt("Colors", pre, "Not Visible G") / 255;
    local b = gInt("Colors", pre, "Not Visible B") / 255;
    return r,g,b;
end
 
local function Chams(v)
    if(gBool("Visuals", "ESP", "XQZ")) then
        cam.Start3D();
            cam.IgnoreZ(true);
            em.DrawModel(v);
            cam.IgnoreZ(false);
        cam.End3D();
    end
    if(gBool("Visuals", "ESP", "Chams")) then
        cam.Start3D();
           
            render.MaterialOverride(chamsmat);
            render.SetColorModulation(GetChamsColor(v));
            render.SetBlend(1);
            em.DrawModel(v);
               
            render.SetColorModulation(GetChamsColor(v, true));
            render.MaterialOverride(chamsmat2);
            render.SetBlend(1);
            em.DrawModel(v);
           
        cam.End3D();
    end
end
 
local function GetColor(v)
    if(pm.Team(v) == pm.Team(me)) then
        local r = gInt("Colors", "Box - Team", "R");
        local g = gInt("Colors", "Box - Team", "G");
        local b = gInt("Colors", "Box - Team", "B");
        return(Color(r, g, b, 220));
    end
    local r = gInt("Colors", "Box - Enemy", "R");
    local g = gInt("Colors", "Box - Enemy", "G");
    local b = gInt("Colors", "Box - Enemy", "B");
    return(Color(r, g, b, 220));
end
local function ESP(v)
 
	


	local pos = em.GetPos(v);
	local min, max = em.GetCollisionBounds(v);
	local pos2 = pos + Vector(0, 0, max.z);
	local pos = vm.ToScreen(pos);
	local pos2 = vm.ToScreen(pos2);
	local hh = 0;
	local h = pos.y - pos2.y;
	local w = h / 2;
	local color = team.GetColor(pm.Team(v));
	local hh = 0;
	
	
	
		if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "Default") then   
        surface.SetDrawColor(GetColor(v));
        surface.DrawOutlinedRect( pos.x - w / 2 - 2, pos.y - h - 2, w + 4, h + 4);
        surface.DrawOutlinedRect( pos.x - w / 2 + 2, pos.y - h + 2, w - 4, h - 4);
       
    end 
	
	
	
   
    local pos = em.GetPos(v);
    local pos, pos2 = vm.ToScreen(pos - Vector(0, 0, 5)), vm.ToScreen( pos + Vector(0, 0, 70) );
    local h = pos.y - pos2.y;
    local w = h / 1.7; 
	
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "Skidicks") then 
       
        surface.SetDrawColor(GetColor(v));
        surface.DrawOutlinedRect( pos.x - w / 2, pos.y - h, w, h);
        surface.SetDrawColor(0, 0, 0, 220);
        surface.DrawOutlinedRect( pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
        surface.DrawOutlinedRect( pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
       
    end    
	
	
   
    local pos = em.GetPos(v);
    local pos, pos2 = vm.ToScreen(pos - Vector(0, 2, 5)), vm.ToScreen( pos + Vector(0, 0, 70) );
    local h = pos.y - pos2.y;
    local w = h / 2.2; 
	
    if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "Alpha") then 
       
        surface.SetDrawColor(125,72,208,120);
        surface.DrawRect( pos.x - w / 1.7, pos.y - h, w, h);
		surface.SetDrawColor(0,0,0,120);
		surface.DrawOutlinedRect( pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
        surface.DrawOutlinedRect( pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
        --draw.RoundedBox(20, 0, 0, pos.x - w / 1.7, pos.y - h, w, h;


       
    end    
   
    local pos = em.GetPos(v);
    local pos, pos2 = vm.ToScreen(pos - Vector(0, 0, 5)), vm.ToScreen( pos + Vector(0, 0, 70 ) );
    local h = pos.y - pos2.y;
    local w = h / 2;    
    
if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "Aimware") then  
 
surface.SetDrawColor(GetColor(v));
        surface.DrawOutlinedRect(pos.x - w / 2, pos.y - h, w, h);      
        surface.SetDrawColor(0, 0, 0, 220);        
        surface.DrawOutlinedRect(pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);      
        surface.DrawOutlinedRect(pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
end    

    if(gBool("Visuals", "ESP", "Health")) then
		hh = hh + 1;
		local col1 = Color((100 - em.Health(v)) * 2.55, em.Health(v) * 2, 0);
		draw.SimpleText(em.Health(v).."HP", "TargetID", pos.x, pos.y - 2 + hh, col1, 1, 0);
		hh = hh + 9;
	end
	
		if(gBool("Visuals", "ESP", "Ping")) then
	hh = hh + 1;
	local col1 = Color(v:Ping() * 2.55, 255 - v:Ping() - 5 * 2, 0);
	draw.SimpleText(v:Ping().."ms", "TargetID", pos.x, pos.y - -2 + hh, col1, 1, 0);
	hh = hh + 9;
	end
	
		if(gBool("Visuals", "ESP", "Rank")) then
	hh = hh + 1;
	local col = Color(255,255,255);
	draw.SimpleText(pm.GetUserGroup(v), "TargetID", pos.x, pos.y - 0 + hh, col, 1, 0);
	hh = hh + 9;
	end
 
       
    surface.SetFont("BudgetLabel");
   
    surface.SetTextColor(255, 255, 255);
   
    if(gBool("Visuals", "ESP", "Name")) then
   
        local tw, th = surface.GetTextSize(pm.Name(v));
       
        surface.SetTextPos( pos.x - tw / 2, pos.y - h + 2 - th );
       
        surface.DrawText(pm.Name(v));
       
    end
   
    if(gBool("Visuals", "ESP", "Weapon")) then
       
		hh = hh + 1;
		local w = pm.GetActiveWeapon(v);
		if(w && em.IsValid(w)) then
		local col = Color(200,150,150);
		draw.SimpleText(w:GetPrintName(), "TargetID", pos.x, pos.y - 0 + hh, col, 1, 0);
		hh = hh + 9;
		end
	end
   
    if(gBool("Visuals", "ESP", "Health Skeleton")) then
        local origin = em.GetPos(v);
        for i = 1, em.GetBoneCount(v) do
            local parent = em.GetBoneParent(v, i);
            if(!parent) then continue; end
            local bonepos, parentpos = em.GetBonePosition(v, i), em.GetBonePosition(v, parent);
            if(!bonepos || !parentpos || bonepos == origin) then continue; end
            local bs, ps = vm.ToScreen(bonepos), vm.ToScreen(parentpos);
            surface.SetDrawColor( ( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255);
            surface.DrawLine(bs.x, bs.y, ps.x, ps.y);
        end 
end


        if(aimtarget and aimtarget:IsValid() && gBool("Aimbot", "Aimbot", "Snapline")) then
		if me:Health() > 0 then
		local col = Color(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"))
		local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)))
		surface.SetDrawColor(col)
		surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y)
		surface.SetDrawColor(0,0,0)
		surface.DrawOutlinedRect(pos.x -2, pos.y -2, 5, 5)
		surface.SetDrawColor(gInt("Colors", "Menu2", "R"), gInt("Colors", "Menu2", "G"), gInt("Colors", "Menu2", "B"))
		surface.DrawRect(pos.x -1, pos.y -1, 3, 3)
		
		end
		end
	end
 
local aimtarget;
 
 
hook.Add("HUDPaint", "", function()
 
    if(!gBool("Visuals", "ESP", "Enabled")) then return; end
    for k,v in next, player.GetAll() do
        if(!em.IsValid(v) || em.Health(v) < 1 || v == me || em.IsDormant(v)) then continue; end
        if(!Filter(v)) then continue; end
        ESP(v);
    end
end);
 
hook.Add("RenderScreenspaceEffects", "", function()
    if(!gBool("Visuals", "ESP", "Enabled")) then return; end
    for k,v in next, player.GetAll() do
        if(!em.IsValid(v) || em.Health(v) < 1 || em.IsDormant(v)) then continue; end
        if(!Filter(v)) then continue; end
        Chams(v);
    end
end);
saveconfig();
 
local fa;
local aa;
 
local function FixMovement(ucmd)
	local vec = Vector(cm.GetForwardMove(ucmd), cm.GetSideMove(ucmd), 0)
	local vel = math.sqrt(vec.x*vec.x + vec.y*vec.y)
	local mang = vm.Angle(vec)
	local yaw = cm.GetViewAngles(ucmd).y - fa.y + mang.y
	if (((cm.GetViewAngles(ucmd).p+90)%360) > 180) then
	yaw = 180 - yaw
	end
	yaw = ((yaw + 180)%360)-180
	ucmd:SetForwardMove(math.cos(math.rad(yaw)) * vel)
	ucmd:SetSideMove(math.sin(math.rad(yaw)) * vel)
end
 
local function Clamp(val, min, max)
    if(val < min) then
        return min
    elseif(val > max) then
            return max
        end
    return val
end
 
local function NormalizeAngle(ang)
        ang.x = math.NormalizeAngle(ang.x);
        ang.p = math.Clamp(ang.p, -89, 89);
end
--Strafer
 
--lol
--lol
--[[
aimer
]]

Ticks = 0;
function FakeLag(ucmd)
  Ticks = Ticks + 0.5
if (!gBool("Misc", "Fakelag", "Enabled")) then
    if (!gBool("Misc", "Fakelag", "Enabled")) then
      if ucmd:KeyDown(IN_ATTACK) then return end
    end
    local flagval = 2
    if Ticks < flagval then
      bSendPacket = false;
    end
    if Ticks >= flagval then
      bSendPacket = true;
      Ticks = 0;
    end
  end
end
function AdaptiveFakeLag(ucmd)
if (gBool("Misc", "Fakelag", "Enabled")) then
  if (!gBool("Misc", "Fakelag", "Enabled")) then
    if ucmd:KeyDown(IN_ATTACK) then return end
  end
      if ucmd:KeyDown(IN_JUMP) then return
  end
  local flagval = me:GetVelocity():Length2D() * 0.1 / 22.6
  if flagval > 2 then
    flagval = 2
  end
  if ((Ticks < flagval)) then
    bSendPacket = false;
  end
  if (Ticks >= (flagval)) then
    bSendPacket = true;
    Ticks = 0;
  end
    Ticks = Ticks + 1.5
end
end

local table = Copy(table);
local dists = {};

local function isVisible(pos, ply)  	   
	local trace = {  	   
		start = EntM.EyePos(me),  	   
		endpos = pos,  	   
		mask = MASK_SHOT,  	   
		filter = {me, ply},  	   
	};  	   
  	   
	return (util.TraceLine(trace).Fraction == 1);  	   
end  

local trace_walls = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX);
local NoPenetration = {[MAT_SLOSH] = true};
local PenMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2};
local trace_normal = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER);

local function fasAutowall(wep, startPos)
	local traces = {};
	local traceResults = {};
	local dir = (aimPos - startPos):GetNormalized();
	traces[1] = { start = startPos, filter = me, mask = trace_normal, endpos = aimPos, };
	traceResults[1] = util.TraceLine(traces[1]);
	if(NoPenetration[traceResults[1].MatType]) then return false; end
	if(-dir:DotProduct(traceResults[1].HitNormal) <= .26) then return false; end
	traces[2] = { start = traceResults[1].HitPos, endpos = traceResults[1].HitPos + dir * wep.PenStr * (PenMod[traceResults[1].MatType] || 1) * wep.PenMod, filter = me, mask = trace_walls, };
	traceResults[2] = util.TraceLine(traces[2]);
	traces[3] = { start = traceResults[2].HitPos, endpos = traceResults[2].HitPos + dir * .1, filter = me, mask = trace_normal, };
	traceResults [3] = util.TraceLine(traces[3]);
	traces[4] = { start = traceResults[2].HitPos, endpos = aimPos, filter = me, mask = MASK_SHOT, };
	traceResults[4] = util.TraceLine(traces[4]);
	if(traceResults[4].Entity != aimTarget) then return false; end
	return(!traceResults[3].Hit);
end

local penetrationValues = {
	["SniperPenetratedRound"] = 20,
	["pistol"] = 9,
	["357"] = 12,
	["smg1"] = 14,
	["ar2"] = 16,
	["buckshot"] = 5,
	["slam"] = 5,
	["AirboatGun"] = 17,	
};

local double = {
	[MAT_GLASS] = true,
	[MAT_PLASTIC] = true,
	[MAT_WOOD] = true,
	[MAT_FLESH] = true,
	[MAT_ALIENFLESH] = true,	
};

local function m9kAutowall(wep, tr)
	local maxPen = penetrationValues[wep.MaxPenetration] || 14;
	local penDir = tr.Normal * (double[tr.Hit] && maxPen * 2 || maxPen);
	local trace = { endpos = tr.HitPos, start = tr.HitPos + penDir, mask = MASK_SHOT, filter = me };
	trace = util.TraceLine(trace);
	if(trace.StartSolid || trace.Fraction >= 1 || tr.Fraction <= 0) then return false; end
	local trace = { endpos = aimPos, start = trace.HitPos, mask = MASK_SHOT, filter = me };
	return(util.TraceLine(trace).Entity == aimTarget);
end

local function canAutowall()
	local wep = me:GetActiveWeapon();
	if(!wep || !wep:IsValid()) then return false; end
	if(isVisible(getPos, aimtarget)) then return true; end
	if(wep.PenStr) then return fasAutowall(wep, me:EyePos()); end //gay
	if(wep.OrigCrossHair) then return m9kAutowall(wep, util.TraceLine({endpos = aimPos, start = me:EyePos(), mask = MASK_SHOT, filter = me,})); end //gay
	return false;
end
 
 
local function GetPos(v)
 
        if(gBool("Aimbot", "Aimbot", "Bodyaim")) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
 
        local eyes = em.LookupAttachment(v, "eyes");
       
        if(!eyes) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
       
        local pos = em.GetAttachment(v, eyes);
       
        if(!pos) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
       
        return(pos.Pos);
end
 
local aimignore;
 
local function Valid(v)
        if(!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || pm.Team(v) == 1002 || (v == aimignore && gOption("Aimbot", "Aimbot", "Selection") == "Nextshot")) then return false; end
        if(gBool("Aimbot", "Aimbot", "Ignore Team")) then
                if(pm.Team(v) == pm.Team(me)) then return false; end
        end
        if(gBool("Aimbot", "Aimbot", "Ignore Friends")) then
                if(pm.GetFriendStatus(v) == "friend") then return false; end
        end
		    if(gBool("Aimbot", "Aimbot", "Ignore Spawn Prot")) then
        if em.GetColor(v).a < 255 then return false; end
    end
    local tr = {
        start = em.EyePos(me),
        endpos = GetPos(v),
        mask = MASK_SHOT,
        filter = {me, v},
    }
            if(util.TraceLine(tr).Fraction == 1) then
        return true
    elseif(wep and wep:IsValid() and wep.PenStr) then
        return fasAutowall(wep, tr.start, tr.endpos, v)
	elseif (wep and wep:IsValid() and wep.BulletPenetrate) then
		return m9kAutowall(wep, tr.start, tr.endpos, v)
    end
    return false
end

--[[local function Valid2(v)
        if(!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || pm.Team(v) == 1002 || (v == aimignore && gOption("Aimbot", "Aimbot", "Selection") == "S
		")) then return false; end
        if(gBool("Aimbot", "Aimbot", "Ignore Team")) then
                if(pm.Team(v) == pm.Team(me)) then return false; end
        end
        if(gBool("Aimbot", "Aimbot", "Ignore Friends")) then
                if(pm.GetFriendStatus(v) == "friend") then return false; end
        end
    local tr = {
        start = em.EyePos(me),
        endpos = GetPos(v),
        mask = MASK_SHOT,
        filter = {me, v},
    }
        return(util.TraceLine(tr).Fraction == 1);
end]]
 
					
 
 
local cones = {};
 
local pcall = pcall;
local require = require;
 
local nullvec = Vector() * -1;
 
local IsFirstTimePredicted = IsFirstTimePredicted;
local CurTime = CurTime;
local servertime=0;
local bit = Copy(bit);
pcall(require, "dickwrap"); 
pcall(require, "fhook");
pcall(require, "bsendpacket");
 
local servertime = 0;
 
hook.Add("Move", "", function()
    if(!IsFirstTimePredicted()) then return; end
    servertime = CurTime() + engine.TickInterval();
end);
 
 
GAMEMODE["EntityFireBullets"] = function(self, p, data)
        aimignore = aimtarget;
        local w = pm.GetActiveWeapon(me);
        local Spread = data.Spread * -gInt("Aimbot", "Accuracy", "Spread amount");
        if(not w or not em.IsValid(w) or cones[em.GetClass(w)] == Spread or Spread == nullvec) then return end
        cones[em.GetClass(w)] = Spread;
end
 
local function PredictSpread(ucmd, ang)
        local w = pm.GetActiveWeapon(me);
        if(!w || !em.IsValid(w) || !cones[em.GetClass(w)] || !gBool("Aimbot", "Accuracy", "Anti Spread")) then return am.Forward(ang); end
        return(dickwrap.Predict(ucmd, am.Forward(ang), cones[em.GetClass(w)]))
end
 
local function Autofire(ucmd)
        if(pm.KeyDown(me, 1) && gBool("Aimbot", "Aimbot", "Auto Pistol")) then
                cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
        else
                cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );
        end
end
 
 hook.Add("CreateMove", "", function(cmd)
 local tPos, lVelocity, tVelocity, tDistance, predTime
    local function WeaponCanFire()
    local w = pm.GetActiveWeapon(me);
    if(!w || !em.IsValid(w) || !gBool("Aimbot", "Accuracy", "")) then return true; end
    return((servertime >= wm.GetNextPrimaryFire(w) * engine.TickInterval() + engine.TickInterval()));
    --Pos + tVelocity * G.engine.TickInterval() - lVelocity * G.engine.TickInterval()
end
end);
 
local function WeaponCanFire()
        local w = pm.GetActiveWeapon(me);
        if(!w || !em.IsValid(w) || !gBool("Aimbot", "Aimbot", "")) then return true; end
        return( servertime >= wm.GetNextPrimaryFire(w) * engine.TickInterval() );
end
 
local function WeaponShootable()
    local wep = pm.GetActiveWeapon(me);
    if( em.IsValid(wep) ) then // I would never get lazy..
             local n = string.lower(wep:GetPrintName())
             if( wep:Clip1() <= 0 ) then
                    return false;
                 end
                 
                 
                 
                 if( string.find(n,"grenade") or string.find(n,"bomb") or string.find(n,"ied") or string.find(n,"c4") or string.find(n,"slam") or string.find(n,"climb") or string.find(n,"hand") ) then
 return false;
                 end
                 
                 
                  return true;
        end
end

 


	local fakelagBucket = {};
	local FakeLagPrediction = function(v)
		if(v == nil || !gBool("Aimbot", "Accuracy", "Anti Flag")) then return Vector(0,0,0); end
		if(!fakelagBucket[v]) then
			fakelagBucket[v] = {
				eGetVelocity(v),
				eGetPos(v),
				0,
			};
		end

		local oldVel = fakelagBucket[v][1];
		local oldPos = fakelagBucket[v][2];
	
		fakelagBucket[v][1] = eGetVelocity(v);
		fakelagBucket[v][2] = eGetPos(v);
	
		if(oldVel == Vector()) then 
			fakelagBucket[v][3] = 0;
			return Vector(0,0,0);
		end
	
		if(fakelagBucket[v][1] == oldVel && oldPos == fakelagBucket[v][2]) then
			fakelagBucket[v][3] = fakelagBucket[v][3] + 1;
	
			return ((oldVel * (eTickInt * fakelagBucket[v][3])));
		else
			fakelagBucket[v][3] = 0;
		end
		return Vector(0,0,0);
	end
	
	
local function PredictPos(pos)
local myvel = LocalPlayer():GetVelocity()
if(gBool("Aimbot", "Accuracy", "Prediction")) then return; end
local pos = pos - (myvel * engine.TickInterval());
return pos;
end	   
  	   
local function gettarget()
 
        local opt = gOption("Aimbot", "Aimbot", "Selection");
       
        local sticky = gOption("Aimbot", "Aimbot", "Non-Sticky");
       
        if(opt == "Distance") then
 
                if( !sticky && Valid(aimtarget) ) then return; end
 
                dists = {};
               
                for k,v in next, player.GetAll() do
                        if(!Valid(v)) then continue; end
                        dists[#dists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
                end
               
                table.sort(dists, function(a, b)
                        return(a[1] < b[1]);
                end);
               
                aimtarget = dists[1] && dists[1][2] || nil;
               
        elseif(opt == "Health") then
               
                if( !sticky && Valid(aimtarget) ) then return; end
 
                dists = {};
               
                for k,v in next, player.GetAll() do
                        if(!Valid(v)) then continue; end
                        dists[#dists + 1] = { em.Health(v), v };
                end
               
                table.sort(dists, function(a, b)
                        return(a[1] < b[1]);
                end);
               
                aimtarget = dists[1] && dists[1][2] || nil;
               
        elseif(opt == "Nextshot") then
	if( not sticky and Valid(aimtarget) ) then return end
	aimtarget = nil
	local allplys = player.GetAll()
	local avaib = {}
		for k,v in next, allplys do
			avaib[math.random(RealTime()*4000000%360)] = v
		end
		for k,v in next, avaib do
			if(Valid(v)) then
				aimtarget = v
			end
		end
	end
	aimignore = nil
	end
	




 
local function aimer(ucmd)
        if(cm.CommandNumber(ucmd) == 0 || !gBool("Aimbot", "Aimbot", "Enabled")) then return; end
		gettarget();
        aa = false;
        if(aimtarget && (input.IsMouseDown(109) ||  gBool("Aimbot", "Aimbot", "Autosnap")) && WeaponCanFire() && WeaponShootable() && am.Forward(fa) * -150) then
				aa = true;
				bsendpacket = true
				if(gBool("Aimbot", "Aimbot", "pSilent")) then
				bsendpacket = false
				end
				
                local pos = GetPos(aimtarget) - em.EyePos(me) + Vector(0,0,gInt("Misc", "Client", "Aim height"))
                PredictPos(pos);
                local ang = vm.Angle( PredictSpread(ucmd, vm.Angle(pos)));
                NormalizeAngle(ang);
                cm.SetViewAngles(ucmd, ang);
                if(gBool("Aimbot", "Aimbot", "Autofire")) then
                        Autofire(ucmd);
                end
                if(gBool("Aimbot", "Aimbot", "Silent Aim")) then
                        FixMovement(ucmd);
                else
                        fa = ang;
                        end
                        require("bsendpacket");
						end
						end

function AddHook(htype, name, func)
	hook.Add(htype, name, func)
end

--[[
function PreDrawOpaqueRenderables()
	for k,v in next, player.GetAll() do
		local ang = v:EyeAngles()
		rang[v] = ang
		if(!gBool("Aimbot", "Accuracy", "Shit")) then return;end
			shit(v, ang)
		end
end
AddHook("PreDrawOpaqueRenderables", "PreDrawOpaqueRenderables", PreDrawOpaqueRenderables)]]
 
local function FixMove(cmd, old, aaaaa)
    local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0);
    local speed = math.sqrt(move.x * move.x + move.y * move.y);
    local ang = move:Angle();
    local yaw = math.rad(cmd:GetViewAngles().y - old.y + ang.y);
    cmd:SetForwardMove((math.cos(yaw) * speed) * ( aaaaa && -1 || 1 ));
    cmd:SetSideMove(math.sin(yaw) * speed);
end
 
 
 
--[[
antiaimer
]]

local function canFire()  	   
	if(!gBool("Aimbot", "Aimbot" ,"Bullettime")) then  	   
		bulletTime = true;  	   
		return;  	   
	end  	   
	bulletTime = false;  	   
	local wep = PlyM.GetActiveWeapon(me);  	   
	if(!wep || !EntM.IsValid(wep)) then return; end  	   
  	   
	local clip = WepM.Clip1(wep);  	   
	if(clip <= 0) then return; end  	   
  	   
	if(reload[EntM.GetSequence(wep)]) then  	   
		return;  	   
	end  	   
	  	   
	local wepTime = WepM.GetNextPrimaryFire(wep);  	   
  	   
	if(curTime >= wepTime) then  	   
		bulletTime = true;  	   
	end  	   
end  	 	   



function CheckAAA(ply, ang)
	   
--Ignore this meme
	local pitch = ang.x
	local correctedpitch = ang.x
	local yaw = ang.y
	local correctedyaw = ang.y
	
	if(gBool("Aimbot", "Accuracy", "XResolver")) then 
            if(pitch >= 89 && pitch < 180) then
                pitch = 89;
            if(pitch >= -89 && pitch < -180) then
                pitch = -89;
			elseif(pitch >= 89 && pitch < -89) then
			pitch = 0;
				
			end
			end
			end

		for k,v in next, player.GetAll() do
		if (!IsValid(v) or v:IsDormant()) then
			continue
		end
		
		if (!v:Alive() or v:Health() < 1) then
			continue
		end
		
		local eyeangles = v:EyeAngles()
		local roll = eyeangles.r
		
local eyeangles = v:EyeAngles()
		local roll = eyeangles.r
		spinaaa = 0
		--main inverse(180) checker 		
			spinaaa = spinaaa + 10
            if spinaaa >= 360 then
              spinaaa = math.NormalizeAngle(spinaaa)
            end
            correctedyaw = math.fmod(correctedyaw + 180, 360) - 180;
        end
          ply:SetPoseParameter("aim_pitch", correctedpitch);
          ply:SetPoseParameter("body_yaw", 0);
          ply:SetPoseParameter("aim_yaw", 0);
          ply:InvalidateBoneCache();
          ply:SetRenderAngles(Angle(0	, math.NormalizeAngle(correctedyaw), 0));
end

rang = {}

--Render Scene also works


function RenderScene()
	for k,v in next, player.GetAll() do
		local ang = v:EyeAngles()
		rang[v] = ang
		if(!gBool("Aimbot", "Accuracy", "Resolver")) then return;end
			CheckAAA(v, ang)
		end
end
 AddHook("RenderScene", "", RenderScene)


 
 
local ox=0;
local oy=0;
local ox0=0
 
local function RandCoin()
        local randcoin = rand(0,100);
        if(randcoin == 1) then return 1; else return -1; end
end
 
local function GetX()
        local opt = gOption("Misc", "Anti-Aim", "X");
        if(opt == "Emotion") then
	  	if(bSendPacket) then
        ox = -89
		else
		ox = 180
		end
		
            elseif( opt == "Eye Angles" ) then
        ox = fa.x;
        elseif( opt == "Down" ) then
		if !gBool("Misc", "Anti-Aim", "SAFEANGLES") then
		ox = 180
		else
		ox = 89
		end
		
		
	
		elseif( opt == "179" ) then
		if !gBool("Misc", "Anti-Aim", "SAFEANGLES") then
		ox = 179.087929
		else
		ox = 188.98989
		end
		
		
        elseif( opt == "Mixed" ) then
		if !gBool("Misc", "Anti-Aim", "SAFEANGLES") then
        ox = RealTime()*5000%89;
		else
		ox = RealTime()*5000%89;
		end
		
		        elseif( opt == "Zero" ) then
	  ox = 0;	
		
		
        elseif( opt == "Fakeangle" ) then
	  ox = 180.890491;	
	  elseif( opt == "FakeWithLag" ) then
	  		if(bSendPacket) then
        ox = 180.929780
		else
		ox = 45
		end
 
        end
end
 
local function GetClosest()
        local ddists = {};
       
        local closest;
               
        for k,v in next, player.GetAll() do
        if(!Valid(v)) then continue; end
                ddists[#ddists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
        end
               
        table.sort(ddists, function(a, b)
                return(a[1] < b[1]);
        end);
               
        closest = ddists[1] && ddists[1][2] || nil;
       
        if(!closest) then return fa.y; end
       
        local pos = em.GetPos(closest);
       
        local pos = vm.Angle(pos - em.EyePos(me));
       
        return( pos.y );
end

 
local function GetY()
        local opt = gOption("Misc", "Anti-Aim", "Y");
        if(opt == "Emotion") then
                        oy = fa.y + rand(-360, 360);

        elseif( opt == "Eye Angles" ) then
                oy = fa.y; 
	--
    elseif(opt == "FakeSideways-Follow") then
	if(bSendPacket) then
        oy = -90 - GetClosest() + RealTime()*25%math.Rand(25,50);
    else
        oy = 90 - GetClosest();
    end
	
	    elseif(opt == "Lisp1") then
	if(bSendPacket) then
        oy = RealTime()*math.Rand(4000,400000)%200 + GetClosest();
    else
        oy =  0 - GetClosest();
    end
	
	    elseif(opt == "Spinbot") then
        oy = RealTime()*1200%360
		
	
    elseif(opt == "Backward") then
oy = 180;

elseif(opt == "Lisp2") then
	if(bSendPacket) then
        oy = RealTime()*4000000%20 - rand(1+1) + GetClosest() + 800;
    else
        oy =  249 - GetClosest();
    end

      elseif(opt == "Jitter") then
        oy = math.Rand(90,180) * RealTime()*4000%200;
	
	
      elseif(opt == "FBack") then
	  	if(bSendPacket) then
        oy = RealTime()*5%25 - 180 + GetClosest();
    else
        oy = 0 - GetClosest();
    end
	
	      elseif(opt == "Custom") then
	  	if(bSendPacket) then
        oy = RealTime()*5%25 - 180 + GetClosest();
    else
        oy = 0 - GetClosest();
    end
 
   
    -- true ends VV
               end
end

local function walldetect()
if( gBool("Misc", "Anti-Aim", "WallDetect")) then
        local eye = em.EyePos(me);
        local tr = util.TraceLine({
                start = eye,
                endpos = (eye + (am.Forward(fa) * 10)),
                mask = MASK_ALL,
        });
        if(tr.Hit) then
		
		local opt = gOption("Misc", "Anti-Aim", "WDTCX");
        if(opt == "Emotion") then
		ox = -192;
            elseif( opt == "Eye Angles" ) then
        ox = fa.x;
        elseif( opt == "Down" ) then
		ox = 89
        elseif( opt == "FEmotion" ) then
        ox = 179 * 1 - 1;
	 elseif( opt == "Lisp" ) then
       	  		if(bSendPacket) then
        ox = 0
		else
		ox = 89
		
		end
end	   
	
 
        end
		

		local opt = gOption("Misc", "Anti-Aim", "WDTC");
        if(opt == "Normal") then
                        oy = 0;
		elseif(opt == "Angel") then
      if(bSendPacket) then
        oy = 0 + fa.y;
		else
		oy = 180
end		
        end
		end
end
 
local function antiaimer(ucmd)
        if( (cm.CommandNumber(ucmd) == gInt("Misc", "Client", "Secrtfeture") && !gBool("Misc", "Client", "Thirdperson")) || cm.KeyDown(ucmd, 1) || cm.KeyDown(ucmd, 32) || aa || !gBool("Misc", "Anti-Aim", "Enabled")) then return; end
        GetX();
        GetY();
        walldetect();
        local aaang = Angle(ox, oy, 0);
        cm.SetViewAngles(ucmd, aaang);
        FixMovement(ucmd, true);
end
 
local function GetAngle(ang)
        if(not gBool("Aimbot", "Accuracy", "Anti Recoil")) then return ang + pm.GetPunchAngle(me) end
        return ang;
end
 
local function rapidfire(ucmd)
        if(pm.KeyDown(me, 1) && gBool("Aimbot", "Aimbot", "Auto Pistol")) then
                cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
        end
end
 
local function meme(ucmd)
    if(!fa) then fa = cm.GetViewAngles(ucmd); end
    fa = fa + Angle(cm.GetMouseY(ucmd) * .023, cm.GetMouseX(ucmd) * -.023, 0);
    NormalizeAngle(fa);
    if(cm.CommandNumber(ucmd) == 0) then
        cm.SetViewAngles(ucmd, GetAngle(fa));
        return;
    end
	if(cm.KeyDown(ucmd, 1)) then
			local ang = GetAngle(vm.Angle(PredictSpread(ucmd, fa ) ) )
			NormalizeAngle(ang)
			cm.SetViewAngles(ucmd, ang)	
end			
    if(gBool("Misc", "AutoStrafer", "Rage Bhop")) then
    if(!me:IsOnGround() && ucmd:KeyDown(IN_JUMP)) then
        ucmd:RemoveKey(IN_JUMP);
        end
    end
if(gBool("Misc", "AutoStrafer", "Rage")) then
    if(!em.IsOnGround(me)) then
        local mouseX = ucmd:GetMouseX()
            if(ucmd:GetMouseX() > 1 || ucmd:GetMouseX() < -1) then
            ucmd:SetSideMove(ucmd:GetMouseX() > 1 && 400 || -400);
else
ucmd:SetForwardMove(6480 / me:GetVelocity():Length2D());
ucmd:SetSideMove((ucmd:CommandNumber() % 2 == 0) && -400 || 400);          
            end
            elseif(ucmd:KeyDown(IN_JUMP) && gBool("Misc", "AutoStrafer", "Rage")) then
            ucmd:SetForwardMove(6480);
        end
    end
if(gBool("Misc", "AutoStrafer", "Rage") && gOption("Misc", "AutoStrafer", "Rage Type") == "SS") then 
    if(!em.IsOnGround(me)) then
        local mouseX = ucmd:GetMouseX()
            if(ucmd:GetMouseX() > 1 || ucmd:GetMouseX() < -1) then
            ucmd:SetSideMove(ucmd:GetMouseX() > 1 && 400 || -400);
else
ucmd:SetForwardMove(5850 / me:GetVelocity():Length2D());
ucmd:SetSideMove((ucmd:CommandNumber() % 2 == 0) && -400 || 400);          
            end
            elseif(ucmd:KeyDown(IN_JUMP) && gOption("Misc", "AutoStrafer", "Rage Type") == "SS") then
            ucmd:SetForwardMove(5850);
        end
    end
if(gBool("Misc", "AutoStrafer", "Rage") && gOption("Misc", "AutoStrafer", "Rage Type") == "Hefliea") then 
    if(!em.IsOnGround(me)) then
        local mouseX = ucmd:GetMouseX()
            if(ucmd:GetMouseX() > 1 || ucmd:GetMouseX() < -1) then
            ucmd:SetSideMove(ucmd:GetMouseX() > 1 && 400 || -400);
else
ucmd:SetForwardMove(6000 / me:GetVelocity():Length2D());
ucmd:SetSideMove((ucmd:CommandNumber() % 2 == 0) && -400 || 400);          
            end
            elseif(ucmd:KeyDown(IN_JUMP) && gOption("Misc", "AutoStrafer", "Rage Type") == "Hefliea") then
            ucmd:SetForwardMove(6000);
        end
    end
if(gBool("Misc", "AutoStrafer", "Legit")) then
    if(!em.IsOnGround(me)) then
        local mouseX = ucmd:GetMouseX()
            if(ucmd:GetMouseX() > 1 || ucmd:GetMouseX() < -1) then
            ucmd:SetSideMove(ucmd:GetMouseX() > 1 && 10000 || -10000);
else
ucmd:SetForwardMove(1000 / me:GetVelocity():Length2D());
ucmd:SetSideMove((ucmd:CommandNumber() % 2 == 0) && -10000 || 10000);          
            end
            elseif(ucmd:KeyDown(IN_JUMP) && gBool("Misc", "AutoStrafer", "Legit")) then
            ucmd:SetForwardMove(1000);
        end
	end
end

 
 
 
hook.Add("CreateMove", "", function(ucmd)
        meme(ucmd);
        aimer(ucmd);
        antiaimer(ucmd);
		AdaptiveFakeLag(ucmd);
end);
 
hook.Add("CalcView", "", function(p, o, a, f)
        return({
                angles = GetAngle(fa),
                origin = (gBool("Misc", "Client", "Thirdperson") && o + am.Forward(fa) * -150 || o),
                fov = gInt("Visuals", "ESP", "FOV");
        });
end);
 
hook.Add("ShouldDrawLocalPlayer", "", function()
        return(gBool("Misc", "Client", "Thirdperson"));
end);
 
//watermark
hook.Add( "HUDPaint", "WaterMark", function()
if(gBool("Misc", "Client", "WaterMark")) then 
    local h = ScrH() / 1
    local w = ScrW() / 5
	local EyeX = math.Round(ply:EyeAngles().x);
	local EyeY = math.Round(ply:EyeAngles().y);
	local Team = team.GetName(ply:Team());
	local rank = ply:GetUserGroup()
	
    draw.SimpleTextOutlined( "Welcome " .. ply:GetName() .. "," .. " to Gamesense", "mm2", w - 5, h / 60, HSVToColor( RealTime() * 80 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Powered by colossalcrew.tk", "mm2", w - 5, h / 25, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(0, 0, 100, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(100, 0, 200, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(200, 0, 300, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(300, 0, 400, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(400, 0, 500, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(500, 0, 600, 5);
        surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(600, 0, 700, 5);
	    surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(700, 0, 800, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(800, 0, 900, 5);
	    surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(900, 0, 1000, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(1000, 0, 1100, 5);
	    surface.SetDrawColor(HSVToColor( RealTime() * 80 % 360, 1, 1 ));
        surface.DrawRect(1100, 0, 1200, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 120 % 360, 1, 1 ));
        surface.DrawRect(1200, 0, 1300, 5);
		surface.SetDrawColor(HSVToColor( RealTime() * 140 % 360, 1, 1 ));
        surface.DrawRect(1300, 0, 1400, 5);
	--draw.SimpleTextOutlined( "Your Aimtarget" .. player.GetAll(), "mm", w - 5, h / 7.2, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	if(gBool("Misc", "Client", "Extend")) then
	draw.SimpleTextOutlined( "Powered by colossalcrew.tk", "mm2", w - 5, h / 25, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( "Your Speed " .. math.Round(ply:GetVelocity():Length( )), "mm2", w - 5, h / 15, Color(255,255,255), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Health " ..  ply:Health(), "mm2", w - 5, h / 11, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your X " ..  EyeX, "mm2", w - 5, h / 8.5, HSVToColor( RealTime() * 80 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Y " ..  EyeY, "mm2", w - 5, h / 7.2, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Team: " ..  Team, "mm2", w + 120, h / 11, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Rank: " ..  rank, "mm3", w + 120, h / 9.5, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Kills: " ..  ply:Frags(), "mm2", w - 5, h / 6.2, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( "Your Deaths: " ..  ply:Deaths(), "mm2", w + 100, h / 6.2, HSVToColor( RealTime() * 120 % 360, 1, 1 ), 1.4, 1.4, 1.4, Color( 0, 0, 0 ) )
	end
	end 
end)
 
//other stuf
       
 
GAMEMODE["storedFuncs"] = GAMEMODE["storedFuncs"] || {};
GAMEMODE["addedHooks"] = GAMEMODE["addedHooks"] || {};
 
GAMEMODE["AddHook"] = function(self, type, name, func)
    self["addedHooks"][type] = self["addedHooks"][type] || {};
 
    self["addedHooks"][type][name] = func;
 
    self["storedFuncs"][type] = self["storedFuncs"][type] || function() end;
 
    self[type] = function(self, ...)
    self["storedFuncs"][type](self, ...);
 
    for k,v in next, self["addedHooks"][type] do
        local args = {v(...)};
        if(#args == 0) then continue; end
        return(unpack(args));
    end
 
    end
end
 
local wireframeMat = Material("models/wireframe");


 
GAMEMODE:AddHook("PreDrawPlayerHands", "", function()
    if(!gBool("Visuals", "Filter", "Wireframe")) then return; end
    render.MaterialOverride(wireframeMat);
    render.SetColorModulation(1,1,1)
 
 
end);
 
--TTT  
local Entity = Entity;
 
 
gameevent.Listen("entity_killed");
 
hook.Add("entity_killed", "", function(data)
    local att_index = data.entindex_attacker;
    local vic_index = data.entindex_killed;
 
    if(vic_index != att_index && att_index == me:EntIndex()) then
   
    if(!gBool("Misc", "Client", "Gamesense v2 KillSpam OFF")) then
        RunConsoleCommand("say", "Gamesense v2 | colossalcrew.tk");
        end
        end
end)

	local bH = {}

local ply = LocalPlayer()


bH[ "Radius" ] = 1
bH[ "RadiusDI" ] = true
bH[ "RadiusUpdate" ] = RealTime()
bH[ "RadiusColour" ] = Color( 0,0,0)

bH[ "Crosshair" ] = function()

	bH[ "RadiusColour" ].g = gInt("Colors", "MenuBG", "G")
	bH[ "RadiusColour" ].b = gInt("Colors", "MenuBG", "B")
	bH[ "RadiusColour" ].r =  gInt("Colors", "MenuBG", "R")

if(gBool("Misc", "Client", "Crosshair")) then
if(gBool("Misc", "Client", "Crosshair") && gOption("Misc", "Client", "Crosshair Style") == "Default") then 

    end 
	surface.DrawCircle( ScrW() / 2, ScrH() / 2, bH[ "Radius" ], bH[ "RadiusColour" ] )
	surface.DrawCircle( ScrW() / 2, ScrH() / 2, 10 % bH[ "Radius" ], bH[ "RadiusColour" ] )

	if RealTime() < bH[ "RadiusUpdate" ] then return end

	if bH[ "Radius" ] < 5 then
		
		bH[ "RadiusDI" ] = false

	elseif bH[ "Radius" ] >= 8 then
		
		bH[ "RadiusDI" ] = true

	end

	if bH[ "RadiusDI" ] then
		
		bH[ "Radius" ] = bH[ "Radius" ] - 1

	else

		bH[ "Radius" ] = bH[ "Radius" ] + 1

	end

	bH[ "RadiusUpdate" ] = RealTime() + 0.2

end

bH[ "HideHud" ] = function( name )

	return name ~= "CHudCrosshair"

end
end

hook.Add( "HUDPaint", "Crosshair", bH[ "Crosshair" ] )
hook.Add( "HUDShouldDraw", "Crosshair", bH[ "HideHud" ] )

print("===================")
print("Gamesense By Tuxy")
print("Finished loading")