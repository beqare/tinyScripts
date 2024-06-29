-- made by snoopti
-- insert in StarterPlayerScripts

local TextChatService = game:GetService("TextChatService")

TextChatService.OnBubbleAdded = function(message: TextChatMessage, adornee: Instance)
	if message.TextSource then
		local bubbleProperties :BubbleChatMessageProperties = Instance.new("BubbleChatMessageProperties")

		bubbleProperties.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
		bubbleProperties.TextColor3 = Color3.fromRGB(234, 234, 234)

		local uiGradient : UIGradient = Instance.new("UIGradient")
		uiGradient.Color = ColorSequence.new(Color3.fromRGB(110, 110, 110), Color3.fromRGB(0, 0, 0))
		uiGradient.Parent = bubbleProperties
		uiGradient.Rotation = 90

		return bubbleProperties
	end
end