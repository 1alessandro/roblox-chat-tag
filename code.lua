local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local r, g, b = 255, 176, 0 --You can change the color using the RGB system
local ChatTagText = "[OWNER]" --You can change the tag's name
local TagOwners = {
    ["YourUsername"] = true,
    ["OtherUsernames"] = true,
    --You can add more users copying and pasting
}

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
    if message.TextSource then
        local senderName = Players:GetNameFromUserIdAsync(message.TextSource.UserId)
        if TagOwners[senderName] then
            local props = Instance.new("TextChatMessageProperties")
            props.PrefixText = string.format(
                "<font color='rgb(%d,%d,%d)'>%s</font> %s",
                r, g, b, ChatTagText, message.PrefixText or ""
            )
            return props
        end
    end

    return nil
end
