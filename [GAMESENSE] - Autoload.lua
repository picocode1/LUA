local config_list, _, name = ui.reference('Config', 'Presets', 'Presets')
local load = ui.reference('Config', 'Presets', 'Load')

local autoload_button = ui.new_button('Config', 'Presets', 'Autoload current config', function()
    local current_select = ui.get(config_list)
    if current_select < -1 then
        current_select = current_select + 2147483648
    end
    database.write('config_autoload', current_select)
    ui.set(config_list, current_select)
    ui.set(load, true)
    print(string.format('%s has been saved for autoloading', ui.get(name)))
end)

if globals.framecount() < 1500 then --Checks if lua is not reloaded/loaded after the game is running for longer then 1500
    ui.set(config_list, database.read('config_autoload'))
    ui.update(name)
    config.load(ui.get(name))
    ui.set(load, true)
end
