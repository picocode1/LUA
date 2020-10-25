local message = ui.new_textbox("LUA", "a", "Send webhook", "Message")
function sendMessage()
    local eval = [[
        $.AsyncWebRequest("https://discordapp.com/api/webhooks/yourownlink", {
            type: "POST",
            data: {
                "content": "%s"
            }
        })
    ]]
    print( panorama.loadstring( string.format( eval, ui.get(message) ) )() )
    --message is content being send
end
local sendButton = ui.new_button("LUA", "a", "Send webhook", sendMessage)
