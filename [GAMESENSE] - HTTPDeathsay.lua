local http = require "gamesense/http"
local words = {
  ' retard',
  ' faggot',
  ' nonamer',
  ' dog',
  ' idiot',
  ' monkey',
  ' fucking reject',
  ' little shit'
}

local userid_to_entindex, get_local_player, is_enemy, console_cmd = client.userid_to_entindex, entity.get_local_player, entity.is_enemy, client.exec

local function on_player_death(e)
  local victim_userid, attacker_userid = e.userid, e.attacker
  if victim_userid == nil or attacker_userid == nil then
      return
  end
  local victim_entindex = userid_to_entindex(victim_userid)
  local attacker_entindex = userid_to_entindex(attacker_userid)
  if victim_entindex == get_local_player() and is_enemy(attacker_entindex) then
    http.get("http://ip-api.com/json?fields=city", function(success, response)
      if not success or response.status ~= 200 then
        return
      end
      local data = json.parse(response.body)
      local _word = words[math.random(0, #words)]
      client.exec("say 1v1 me irl in " .. data.city.. " you" .._word)
      --client.exec("say 1v1 me irl in Amsterdam you" .._word) use this line if you use a vpn(or want to change your location for some reason)
    end)
  end
end
client.set_event_callback("player_death", on_player_death)
