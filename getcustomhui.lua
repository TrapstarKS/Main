if not getgenv().getcustomhui then
	if not sethiddenproperty then
		game.Players.LocalPlayer:kick(
			"Your exploit is not supported (may you consider switching to a better one?)!\nCannot implement gethui! 'sethiddenproperty' function not found."
		)
		return
	end

	repeat
		task.wait(1)
	until game:IsLoaded()

	local PlayersService = game:GetService("Players")
	local LocalPlayer = PlayersService.LocalPlayer
	local CoreGui = LocalPlayer:WaitForChild("PlayerGui")

	if not getconnections then
		LocalPlayer:kick(
			"Your exploit is not supported (may you consider switching to a better one?)!\nCannot implement gethui! 'getconnections' function not found."
		)
		return
	end

	local DescendantAddedConnections = getconnections(CoreGui.DescendantAdded)
	local ChildAddedConnections = getconnections(CoreGui.ChildAdded)

	for _, connection in ipairs(ChildAddedConnections) do
		connection:Disable()
	end
	for _, connection in ipairs(DescendantAddedConnections) do
		connection:Disable()
	end

	local HiddenFolder = Instance.new("Folder", CoreGui)
	HiddenFolder.Name = "\69\0\4\20"
	sethiddenproperty(HiddenFolder, "RobloxLocked", true)

	for _, connection in ipairs(ChildAddedConnections) do
		connection:Enable()
	end

	coroutine.wrap(function()
		repeat
			task.wait(1)
		until HiddenFolder
		while true do
			task.wait(1)
			for _, ChildInstance in ipairs(HiddenFolder:GetChildren()) do
				if ChildInstance:IsA("ScreenGui") then
					ChildInstance.ResetOnSpawn = false
				end
			end
		end
	end)()

	local function gethui()
		return HiddenFolder
	end

	getgenv().getcustomhui = newcclosure(gethui)
end
