-- made by snoopti
-- insert in StarterGui/ScreenGui/[RESPAWNBUTTON]

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local button = script.Parent

local function killPlayer()
	humanoid.Health = 0
end

button.MouseButton1Click:Connect(function()
	killPlayer()
end)
