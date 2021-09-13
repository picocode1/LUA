local message = ui.new_textbox("LUA", "a", "Send webhook", "Message")
local webhook_link = "https://discordapp.com/api/webhooks/yourownlink"
function sendMessage()
    local eval = [[
        $.AsyncWebRequest("%s", {
            type: "POST",
            data: {
                "content": "%s"
            }
        })
    ]]
    print( panorama.loadstring( string.format( eval, webhook_link, ui.get(message) ) )() )
    --message is content being send
end
local sendButton = ui.new_button("LUA", "a", "Send webhook", sendMessage)
