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

client.set_event_callback('aim_hit', function()
    client.exec('say ' ..first[math.random(0, #first)] .. second[math.random(0, #second)] )
end)
