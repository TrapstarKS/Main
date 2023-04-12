local repo = 'https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/'
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

if game.PlaceId == 8304191830 or game.PlaceId == 8349889591 then -- Anime Adventures
	LoadScript('Anime%20Adventures.lua')
elseif game.PlaceId == 914010731 then -- RoGhoul
	LoadScript('RoGhoul.lua')
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then -- Blox Fruits
	LoadScript('BloxFruits.lua')
else -- Astd
	LoadScript('Astd.lua')
end
