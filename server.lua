RegisterNetEvent('mx-caradio:attach', function(soundId, netId)
    if not netId then return end
    exports['mx-surround']:attachEntity(-1, soundId, netId)
end)
