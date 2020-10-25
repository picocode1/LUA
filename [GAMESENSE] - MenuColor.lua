local menu_ref = ui.reference("Misc", "Settings", "Menu color")
local colors = ui.new_color_picker("CONFIG", "Presets", "Menu color per config", 255, 255, 255, 255)

function paint()
    ui.set(menu_ref, ui.get(colors))
end
client.set_event_callback("paint_ui", paint)
