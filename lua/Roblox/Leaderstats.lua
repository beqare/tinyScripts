-- made by snoopti
-- insert in ServerScriptService

-- services
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- datastore
local playtimeDataStore = DataStoreService:GetDataStore("PlaytimeDataStore")


-- function to create leaderstats
local function createLeaderstats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local playtime = Instance.new("IntValue")
	playtime.Name = "⏰ Playtime"
	playtime.Parent = leaderstats


	local speed = Instance.new("IntValue")
	speed.Name = "🚀 Speed"
	speed.Parent = leaderstats

	local height = Instance.new("IntValue")
	height.Name = "🗻 Height"
	height.Parent = leaderstats

	-- load playtime
	local success, err = pcall(function()
		local savedPlaytime = playtimeDataStore:GetAsync(tostring(player.UserId))
		if savedPlaytime then
			playtime.Value = savedPlaytime
		else
			playtime.Value = 0
		end
	end)

	if not success then
		warn("Error loading data for player: "..err)
		playtime.Value = 0
	end
end


-- save playtime
local function saveStats(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local playtime = leaderstats:FindFirstChild("⏰ Playtime")
		if playtime then
			local success, err = pcall(function()
				playtimeDataStore:SetAsync(tostring(player.UserId), playtime.Value)
			end)

			if not success then
				warn("Error saving data for player: "..err)
			end
		end
	end
end

-- playtime function
local function updatePlaytime()
	while true do
		wait(60)
		for _, player in pairs(Players:GetPlayers()) do
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local playtime = leaderstats:FindFirstChild("⏰ Playtime")
				if playtime then
					playtime.Value = playtime.Value + 1
					for _, player in pairs(Players:GetPlayers()) do
						saveStats(player)
					end
				end
			end
		end
	end
end


-- height function
local function updateHeight()
	while true do
		wait(0.5)
		for _, player in pairs(Players:GetPlayers()) do
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local height = leaderstats:FindFirstChild("🗻 Height")
				if height and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					height.Value = math.floor(player.Character.HumanoidRootPart.Position.Y)
				end
			end
		end
	end
end

-- speed function
local function updateSpeed()
	while true do
		wait(0.5)
		for _, player in pairs(Players:GetPlayers()) do
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local speed = leaderstats:FindFirstChild("🚀 Speed")
				if speed then
					local rootPart = player.Character.HumanoidRootPart
					local velocity = rootPart.Velocity
					speed.Value = math.floor(velocity.Magnitude)
				end
			end
		end
	end
end


-- event connections
Players.PlayerAdded:Connect(function(player)
	createLeaderstats(player)
end)

Players.PlayerRemoving:Connect(function(player)
	saveStats(player)
end)


-- periodically save player stats
local function autoSave()
	while true do
		wait(120)
		for _, player in pairs(Players:GetPlayers()) do
			saveStats(player)
		end
	end
end

-- start updating
spawn(updatePlaytime)
spawn(updateHeight)
spawn(updateSpeed)
spawn(autoSave)
