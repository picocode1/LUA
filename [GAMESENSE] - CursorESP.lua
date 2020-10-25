--UI
local CursorESP_Health = ui.new_checkbox('LUA', 'a', 'CursorESP Health')
local CursorESP_Glow = ui.new_checkbox('LUA', 'a', 'CursorESP Glow (WIP)')
local CursorESP_Color_Glow = ui.new_color_picker('LUA', 'a', 'CursorESP Glow (WIP)', 255, 255, 255, 25)
local CursorESP_Box = ui.new_checkbox('LUA', 'a', 'CursorESP Box')
local CursorESP_Color_Box = ui.new_color_picker('LUA', 'a', 'CursorESP Box', 255, 255, 255)
--UI

--Mouse Stuff + Health

local health = (entity.get_prop(entity.get_local_player(), 'm_iHealth'))
local menu_open = ui.is_menu_open();
local r,g,b = ui.get(CursorESP_Color_Glow)
local r1,g1,b1 = ui.get(CursorESP_Color_Box)
--Mouse Stuff + Health


function CursorESP()
    local x, y = ui.mouse_position()
    if (menu_open == true) then
        if ui.get(CursorESP_Health) then
            renderer.line(x-21,y-6,x-21,y+57,0,0,0,255)renderer.line(x-6,y-6,x-6,y+57,0,0,0,255)renderer.line(x-5,y-6,x-22,y-6,0,0,0,255)renderer.line(x-5,y+58,x-22,y+58,0,0,0,255)renderer.rectangle(x-20,y-5,13,62,255,0,0,255)if health>=91 and health<=100 then renderer.rectangle(x-20,y-5,13,62,0,255,0,255)end;if health>=81 and health<=90 then renderer.rectangle(x-20,y+3,13,55,0,255,0,255)end;if health>=71 and health<=80 then renderer.rectangle(x-20,y+8,13,50,0,255,0,255)end;if health>=61 and health<=70 then renderer.rectangle(x-20,y+13,13,45,0,255,0,255)end;if health>=51 and health<=60 then renderer.rectangle(x-20,y+18,13,40,0,255,0,255)end;if health>=41 and health<=50 then renderer.rectangle(x-20,y+23,13,35,0,255,0,255)end;if health>=31 and health<=40 then renderer.rectangle(x-20,y+28,13,30,0,255,0,255)end;if health>=21 and health<=30 then renderer.rectangle(x-20,y+33,13,25,0,255,0,255)end;if health>=11 and health<=20 then renderer.rectangle(x-20,y+38,13,20,0,255,0,255)end;if health>=5 and health<=10 then renderer.rectangle(x-20,y+43,13,15,0,255,0,255)end;if health>=1 and health<=5 then renderer.rectangle(x-20,y+53,13,5,0,255,0,255)end
        end
        if ui.get(CursorESP_Glow) then
            renderer.circle(x +4, y +9, r, g, b, 255, 10, 1, 1)
        end
        if ui.get(CursorESP_Box) then
            renderer.line(x -3, y -3,x -3, y +25, r1, g1, b1, 255) --left line
            renderer.line(x -3, y -3,x +17, y -3, r1, g1, b1, 255) --top line
            renderer.line(x +17, y -3,x +17, y +25, r1, g1, b1, 255) --right line
            renderer.line(x -3, y +25,x +17, y +25, r1, g1, b1, 255) --bottom line
        end
    end
end
client.set_event_callback("paint", CursorESP)
