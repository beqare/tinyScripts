-- made by snoopti
-- insert in StarterPlayerScripts

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local vip = {
	123123123123, -- userid
	123123123123, -- userid
}

local owner = {
	123123123123, -- userid
}

local function isVIP(player)
	for _, userId in ipairs(vip) do
		if player.UserId == userId then
			return true
		end
	end
	return false
end

local function isOwner(player)
	for _, userId in ipairs(owner) do
		if player.UserId == userId then
			return true
		end
	end
	return false
end

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")

	if message.TextSource then
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)
		if player then
			if isOwner(player) then
				properties.PrefixText = "<font color='#C42036'>[Owner]</font> " .. message.PrefixText
			elseif isVIP(player) then
				properties.PrefixText = "<font color='#F99F1E'>[VIP]</font> " .. message.PrefixText
			end
		end
	end

	return properties
end
