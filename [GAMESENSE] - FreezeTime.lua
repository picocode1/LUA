local freezetimer = ui.new_checkbox('AA', 'Other', "Freezetime Anti-Aim")
function runFreezeTimeAA(cmd)
    local pitch, yaw = client.camera_angles()
    local bFreezePeriod = entity.get_prop(entity.get_game_rules(), "m_bFreezePeriod")
    if ui.get(freezetimer) and (bFreezePeriod == 1) then
        if not cmd.in_use == 1 then
            cmd.yaw = yaw + 180
            cmd.pitch = 89
        end
    end
end
client.set_event_callback("setup_command", runFreezeTimeAA)
