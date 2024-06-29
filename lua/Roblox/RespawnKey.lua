-- made by snoopti
-- insert in StarterCharacterScripts 

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local function killPlayer()
	humanoid.Health = 0
end

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.R and not gameProcessedEvent then
		killPlayer()
	end
end)
