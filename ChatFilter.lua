-- List of words to filter ( add new if needed )
local blockedWords = {
    "lf1m",
    "lfg",
    "lfm",
    "lf2m",
    "lf",
    
}

-- Filtering Function
local function ChatFilter(self, event, message, author, ...)
    for _, word in ipairs(blockedWords) do
        if string.find(string.lower(message), string.lower(word)) then
            return true -- bloque le message
        end
    end
    return false, message, author, ...
end

-- Apply the filters to differents channels
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", ChatFilter)
