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
local GameId = game.GameId
local PlaceIds = {
	["AA"] = { 8304191830, 8349889591 },
	["RG"] = { 914010731 },
	["BF"] = { 2753915549, 4442272183, 7449423635 },
	["PJS"] = { 2142948266 },
        ["AFS"] = {6299805723, 9141645420}
}
if table.find(PlaceIds["AA"], Id) then -- Anime Adventures
	if getgenv().BetaScript then
        LoadScript("AnimeAdventures-Rewrite.lua")
	else
	LoadScript("Anime%20Adventures.lua")
	end
elseif table.find(PlaceIds["RG"], Id) then -- RoGhoul
	LoadScript("RoGhoul.lua")
elseif table.find(PlaceIds["BF"], Id) then -- Blox Fruits
	LoadScript("BloxFruits.lua")
elseif table.find(PlaceIds["PJS"], GameId) then -- Project Slayer
	LoadScript("PJS.lua")
elseif table.find(PlaceIds["AFS"], Id) then -- Afs
	LoadScript("afsdupe.lua")
else -- Astd
	LoadScript("Astd.lua")
end
