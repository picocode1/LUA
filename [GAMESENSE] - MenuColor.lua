local menu_ref = ui.reference("Misc", "Settings", "Menu color")
local label = ui.new_label("CONFIG", "Presets", "Menu Color")
local colors = ui.new_color_picker("CONFIG", "Presets", "Menu Color", 224 , 7, 224, 242)
ui.set(colors, 224 , 255 , 255, 255)
local function update(s)
	ui.set(menu_ref, ui.get(s))
end
update(colors)
ui.set_callback(colors, update)
