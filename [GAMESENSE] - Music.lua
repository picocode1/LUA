local Speed = 15
local RadioNames = {
    'Hits', 
    'House', 
    'Techno', 
    'Metal', 
    'Rap', 
    'Deep House', 
    'Pop', 
    '8bit', 
    'Lo-Fi', 
    'Ibiza'
}

local RadioURLs = {
    "http://air.radiorecord.ru:805/dc_320",
    "http://uk7.internet-radio.com:8000/stream",
    "https://www.internet-radio.com/player/?mount=http://uk1.internet-radio.com:8200/live.m3u&title=Phever%20Media%20Live%20Audio%20Stream&website=www.phever.ie",
    "https://www.internet-radio.com/player/?mount=http://uk1.internet-radio.com:8294/live.m3u&title=Radio%20Bloodstream&website=http://www.RadioBloodstream.com",
    "https://www.internet-radio.com/player/?mount=http://us4.internet-radio.com:8107/listen.pls&title=kmjt98.6%20Radio&website=https://www.internet-radio.com",
    "https://www.internet-radio.com/player/?mount=http://uk7.internet-radio.com:8000/listen.pls&title=MoveDaHouse&website=http://www.movedahouse.com",
    "http://air.radiorecord.ru:805/dc_320",
    "https://icecast.z8r.de/radiosven-lofi-ogg",
    "http://playerservices.streamtheworld.com/api/livestream-redirect/TLPSTR19.mp3"
}

local EffectList = ui.new_combobox('LUA', 'a', 'Choose active radio indicator', {'No indicator', 'Static', 'Breathing', 'Flashing'})
local MusicList = ui.new_combobox('LUA', 'a', 'Choose radio', RadioNames)

function OpenMusic()
    local Index;
    for ind, val in next, RadioNames do
        if val == ui.get(MusicList) then
            Index = ind
            ::continue::
        end
    end
    local js = panorama.loadstring([[
        return {
          open_url: function(url){
            SteamOverlayAPI.OpenURL(url)
          }
        }
        ]])()
        js.open_url(RadioURLs[Index]) 
end

local function Normalize(A, B)
    A = A * Speed
    while A > B do
        A = B - A
    end
    return A
end

function OnDraw()
    local Mode = ui.get(EffectList)
    local Current = ui.get(MusicList)
    if Mode == "No indicator" then
        --Nothing
    elseif Mode == "Static" then
        renderer.indicator(0, 255, 255, 255, Current)
    elseif Mode == "Breathing" then
        R, G, B = math.floor( math.sin( (globals.curtime() + 0.7) * 4 + 4 ) * 127 + 128 ), 255, math.floor( math.sin( (globals.curtime() + 0.7) * 4 + 4 ) * 127 + 128 )
        renderer.indicator(0, R, G, B, Current)
    elseif Mode == "Flashing" then
        local Value = (510 / Speed)
        R, G, B = Normalize( ( globals.tickcount() % (Value) ), 255 ), 255, Normalize( ( globals.tickcount() % (Value) ), 255 )
        renderer.indicator(0, R, G, B, Current)
    end
end

client.set_event_callback("paint", OnDraw)
ui.new_button('LUA', 'a', 'Start Radio', OpenMusic)
