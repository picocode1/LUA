---@diagnostic disable: undefined-global, lowercase-global
local images = require("gamesense/images")
local websockets = require 'gamesense/websockets'

local background = images.get_panorama_image("backgrounds/startup.png")
local w,h = client.screen_size()


local tab, container = "CONFIG", "Presets"
local screen = ui.new_checkbox(tab, container, 'Enable LiveStream')
local viewcount = ui.new_label(tab, container, 'Viewcount:')
local quality_slider = ui.new_slider(tab, container, 'LiveStream Quality', 0, 50, 0)

local size = ui.new_slider(tab, container, 'Size', 2, 10, 5)
local screen_x = ui.new_slider(tab, container, 'Screen X', -47, w, 0)
local screen_y = ui.new_slider(tab, container, 'Screen Y', -66, h, 0)

ui.new_button(tab, container, 'Set quality', function ()
	print("Setting LiveStream quality to: ", ui.get(quality_slider))
	if not websocket == nil then
		websocket:send(json.stringify({compression = ui.get(quality_slider)}))
	end
end)


--Base64 Decode
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function decode64(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end


-- Gamesense Border
local function draw_container(x, y, w, h, a)
	local c = { 10, 60, 40, 40, 40, 60, 20 }
	for i = 0,6,1 do
		renderer.rectangle(x+i, y+i, w-(i*2), h-(i*2), c[i+1], c[i+1], c[i+1], a)
        renderer.gradient(x+7, y+7, w/2-8, 1, 55, 177, 218, 255, 201, 84, 205, 255, true)
        renderer.gradient(x+w/2-2, y+7, (w/2)-5, 1, 201, 84, 205, 255, 204, 207, 53, 255, true)
	end
end

websockets.connect("ws://127.0.0.1:6969/", {
	open = function(ws)
		print('connected')
		websocket = nil
	end,
	message = function(ws, data)
		if ui.get(screen) then			
			local json_data = json.parse(data)

			if type(json_data.image) == "string" then
				background = images.load_jpg(decode64(json_data.image:sub(24)))
			end
			if json_data.compression then
				if json_data.compression * 100 > 50 then
					ui.set(quality_slider, 50)
				else
					ui.set(quality_slider, json_data.compression * 100)
				end
			elseif json_data.viewcount then
				ui.set(viewcount, "Viewcount: " ..json_data.viewcount)
			end
		end

		websocket = ws
	end,
	close = function(ws, code, reason, was_clean)
		print("closed ws")
		websocket = nil
	end,
	error = function(ws, err)
		print('Error')
		websocket = nil
	end
})


local offset = 6

client.set_event_callback("paint_ui", function()
	if ui.get(screen) then
		s = ui.get(size)

		x = tonumber(ui.get(screen_x))
		y = tonumber(ui.get(screen_y))

		draw_container(50 - offset + x, 66 + y, w / s + offset * 2, h / s + offset * 2 + offset /2, 255)
		background:draw(50 + x, 75 + y, w / s, h / s)
	end
end)
