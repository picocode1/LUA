local fakechams, color = ui.reference('VISUALS', 'Colored models', 'Local player fake')
local combobox = ui.new_combobox('LUA', 'a', 'VelocityChams', 'Velocity Fake', 'Reverse Velocity Fake')
local minimumalpha = ui.new_slider('LUA', 'a', 'Minimum Fake on stand', 0, 255, 0)
local speedindicator = ui.new_checkbox('LUA', 'a', 'Speed Indicator')
local indicatoralpha = ui.new_checkbox('LUA', 'a', 'Change indicator alpha')

function VelocityChams()
    local x, y = entity.get_prop( entity.get_local_player(), 'm_vecVelocity')
    local speed = x ~= nil and math.floor(math.sqrt( x * x + y * y + 0.5 )) or 0
    local r, g, b, a = ui.get(color)
    
    if ui.get(speedindicator) then
        ui.set_visible(indicatoralpha, true)
        if speed < 3 then 
            speed = 0 
        end
        if ui.get(indicatoralpha) then
		    renderer.indicator(r, g, b, a, "Current speed: " .. speed)
        else
            renderer.indicator(r, g, b, 255, "Current speed: " .. speed)   
        end  
    else
        ui.set_visible(indicatoralpha, false)
    end

	if ui.get(fakechams) then
		if ui.get(combobox) == 'Velocity Fake' then
            --Velocity Fake
			ui.set_visible(minimumalpha, false)
			if speed < 3 then
				ui.set(color, r, g, b, 255)
			elseif speed >= 235 then
				ui.set(color, r, g, b, 0)
			else
				ui.set(color, r, g, b, speed * -1)
			end
		else 
            --Reverse Velocity Fake
			ui.set_visible(minimumalpha, true)
			if speed > 245 then
				ui.set(color, r, g, b, 255)
			elseif speed < 3 then
				ui.set(color, r, g, b, ui.get(minimumalpha))
			else
				ui.set(color, r, g, b, speed)
			end
		end
	end
end
client.set_event_callback('paint_ui', VelocityChams)
