local first = {
    'nice',
    'good',
    'nice fucking',
    'amazing',
    'insane',
    'sick',
    'plz give',
    'refund that',
    'nice fucking',
    'u sell that',
    'send selly link for that sick'
}
local second = {
    ' config',
    ' antiaim',
    ' settings',
	' resolver',
	' brain',
	' kd',
	' death',
    ' cheat'
}
local function aim_hit()
	local sendconsole = client.exec
    local _first = first[math.random(0, #first)]
    local _second = second[math.random(0, #second)]   
    local say = 'say ' .. _first .. _second
    sendconsole(say)
end
client.set_event_callback('aim_hit', aim_hit)
