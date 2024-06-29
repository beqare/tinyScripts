-- made by snoopti
-- insert in ServerScriptService

game.Players.PlayerAdded:Connect(function(player)
	local function onCharacterAdded(char)
		local HRP = char:WaitForChild("HumanoidRootPart")

		local marble = Instance.new("Part")
		marble.Size = Vector3.new(8, 8, 8)
		marble.BrickColor = BrickColor.Random()
		marble.Transparency = 0.5
		marble.Shape = Enum.PartType.Ball
		marble.Parent = char
		marble.Material = Enum.Material.SmoothPlastic

		local Velocity = Instance.new("BodyAngularVelocity")
		Velocity.Parent = marble

		local Weld = Instance.new("Weld")
		Weld.Parent = marble
		Weld.Part0 = HRP
		Weld.Part1 = marble

		local Hum = char:WaitForChild("Humanoid")
		Hum.PlatformStand = true
		-- Hum.JumpPower = 0

		local spawnLocation = game.Workspace.MEGARAMP.spawn.SpawnLocation
		if spawnLocation then
			HRP.CFrame = spawnLocation.CFrame
		else
			warn("SpawnLocation not found!")
		end

		while true do
			wait()
			marble.BodyAngularVelocity.AngularVelocity = Vector3.new(char.Humanoid.MoveDirection.z * 32, 0, char.Humanoid.MoveDirection.x * -32)
			marble.BodyAngularVelocity.MaxTorque = Vector3.new(30000, 30000, 30000)
			if char.Humanoid.MoveDirection == Vector3.new(0, 0, 0) then
				marble.BodyAngularVelocity.MaxTorque = Vector3.new(0, 0, 0)
			end
		end
	end

	player.CharacterAdded:Connect(onCharacterAdded)
end)
