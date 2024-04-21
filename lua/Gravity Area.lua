-- for Roblox
-- insert in ServerScriptService

local part = script.Parent

local walkSpeedMultiplier = 2
local normalWalkSpeed = 32

local function increaseWalkSpeed(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = normalWalkSpeed * walkSpeedMultiplier
	end
end

local function resetWalkSpeed(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = normalWalkSpeed
	end
end

part.Touched:Connect(function(hit)
	local character = hit.Parent
	if character and character:IsA("Model") then
		increaseWalkSpeed(character)
	end
end)

part.TouchEnded:Connect(function(hit)
	local character = hit.Parent
	if character and character:IsA("Model") then
		resetWalkSpeed(character)
	end
end)