RegisterNetEvent('mx-caradio:attach', function(soundId, netId, volume, isInVehicle)
    if not netId then return end
    exports['mx-surround']:attachEntity(-1, soundId, netId)
    local wait = isInVehicle and 0 or 200
    Wait(wait)
    exports['mx-surround']:setVolumeMax(-1, soundId, volume)
end)
