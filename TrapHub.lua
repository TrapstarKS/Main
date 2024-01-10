local repo = "https://raw.githubusercontent.com/TrapstarKSSKSKSKKS/Main/main/"
local Id = game.PlaceId
local GameId = game.GameId

local Games = {
	["AA"] = {
		FileName = getgenv().BetaScript and "AnimeAdventures-Rewrite" or "Anime%20Adventures",
		PlaceId = { 3183403065 },
		GameName = "Anime Adventures",
	},
	["RoGhoul"] = {
		FileName = "RoGhoul",
		PlaceId = { 380704901 },
		GameName = "RoGhoul",
	},
	["Blade Ball"] = {
		FileName = "BladeBall",
		PlaceId = { 13772394625 },
		GameName = "Blade Ball",
	},
}

local function LoadScript(name)
	local data = Games[name]
	getgenv().GameName = data.GameName

	loadstring(game:HttpGet(repo .. data.FileName .. ".lua"))()
end

for _, data in next, Games do
	for _, v in next, data.PlaceId do
		if Id == v or GameId == v then LoadScript(data.FileName) end
	end
end
