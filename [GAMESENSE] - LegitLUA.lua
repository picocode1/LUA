local FOV = ui.reference('LEGIT', 'Aimbot', 'Maximum FOV')
local Aimbot = ui.reference('LEGIT', 'Aimbot', 'Enabled')
local x, y = client.screen_size()
local FOV_Checkbox = ui.new_checkbox('LEGIT', 'Other', 'FOV Circle')
local Color = ui.new_color_picker('LEGIT', 'Other', 'FOV Circle', 255, 255, 255, 255)
local Aircheck_Checkbox = ui.new_checkbox('LEGIT', 'Other', 'Aircheck')

client.set_event_callback('paint', function()
    local r, g, b, a = ui.get(Color)
    local Flags = entity.get_prop(entity.get_local_player(), 'm_fFlags')
    if ui.get(FOV_Checkbox) then
        renderer.circle_outline(x / 2, y / 2, r, g, b, a, ui.get(FOV), 1, 1, 1)
    end
    if Flags == 257 and ui.get(Aircheck_Checkbox) then
        ui.set(Aimbot, true)
    elseif Flags == 256 and ui.get(Aircheck_Checkbox) then
        ui.set(Aimbot, false)
    end
end)
