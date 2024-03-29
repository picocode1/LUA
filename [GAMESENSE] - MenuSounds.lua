--Download the files https://github.com/picocode1/LUA/blob/main/sound.zip
local Sounds = {
    '-',
    'menu1',
    'menu2',
    'menu3',
    'menu4',
    'menu5'
}
   
local combo_box = ui.new_combobox('LUA', 'a', 'Select Sound', Sounds)
client.set_event_callback("paint", function()
        if ui.is_menu_open() == false and not ui.get(combo_box) == '-' then
        client.exec(string.format("play %s.mp3", ui.get(combo_box)))
    end
end)


--[[ backup
local Sounds = {
    '-',
    'Sound 1',
    'Sound 2',
    'Sound 3',
    'Sound 4',
    'Sound 5'
   }
   
    local combo_box = ui.new_combobox('LUA', 'a', 'Select Sound', Sounds)
    function MenuSound()
        local menu_open = ui.is_menu_open();
        if (menu_open == false) then
            if ui.get(combo_box) == 'Sound 1' then
               client.exec("play menu1.mp3")
            elseif ui.get(combo_box) == 'Sound 2' then
               client.exec("play menu2.mp3")
            elseif ui.get(combo_box) == 'Sound 3' then
                client.exec("play menu3.mp3")
            elseif ui.get(combo_box) == 'Sound 4' then
                client.exec("play menu4.mp3")
            elseif ui.get(combo_box) == 'Sound 5' then
                client.exec("play menu5.mp3")
            end
        end
    end
   client.set_event_callback("paint", MenuSound)
]]
