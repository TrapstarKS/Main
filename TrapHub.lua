local repo = "https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/"
local function LoadScript(ScriptName)
	pcall(function()
		t = 0
		repeat
			local s, r = pcall(function()
				loadstring(game:HttpGet(repo .. ScriptName))()
			end)
			if not s then
				spawn(function()
					error(r)
				end)
			end
			t = t + 1
			wait(60)
		until getgenv().Executed or t >= 30
	end)
end
local Id = game.PlaceId
local PlaceIds = {
	["AA"] = { 8304191830, 8349889591 },
	["RG"] = { 914010731 },
	["BF"] = { 2753915549, 4442272183, 7449423635 },
	["PJS"] = { 6152116144, 5956785391, 11468159863, 11468075017, 9321822839, 11468034852 },
}
if table.find(PlaceIds["AA"], Id) then -- Anime Adventures
	LoadScript("Anime%20Adventures.lua")
elseif table.find(PlaceIds["RG"], Id) then -- RoGhoul
	LoadScript("RoGhoul.lua")
elseif table.find(PlaceIds["BF"], Id) then -- Blox Fruits
	LoadScript("BloxFruits.lua")
elseif table.find(PlaceIds["PJS"], Id) then -- Project Slayer
	LoadScript("PJS.lua")
else -- Astd
	LoadScript("Astd.lua")
end
