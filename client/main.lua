local playerped, playercoords, isInVehicle, vehicle
AudioPlayer = exports['mx-audioplayer']

CreateThread(function()
    while true do
        playerped = PlayerPedId()
        playercoords = GetEntityCoords(playerped)
        isInVehicle = IsPedInAnyVehicle(playerped, false)
        vehicle = GetVehiclePedIsIn(playerped, false)
        Wait(300)
    end
end)

local function openUi()
    if not isInVehicle then return end
    local _vehicle = vehicle
    local plate = GetVehicleNumberPlateText(vehicle)
    AudioPlayer:open({
        onPlay = function(sound)
            if not DoesEntityExist(_vehicle) then
                TriggerServerEvent('mx-audioplayer:destroy', sound.soundId)
                return
            end
            local volume = AudioPlayer:getVolume()
            TriggerServerEvent('mx-caradio:attach', sound.soundId, NetworkGetNetworkIdFromEntity(_vehicle), volume, isInVehicle)
        end
    }, plate, true)
end

RegisterCommand('carRadio', openUi, false)
RegisterKeyMapping('carRadio', 'Open Car Radio', 'keyboard', Config.defaultOpenRadioKey)

if Config.disableDefaultRadio then
    CreateThread(function()
        while true do
            local sleep = 1250
            if isInVehicle then
                sleep = 0
                if IsControlJustPressed(0, 44) and isInVehicle then
                    HideHudComponentThisFrame(16)
                    SetVehRadioStation(vehicle, 'OFF')
                    SetVehicleRadioEnabled(vehicle, false)
                    SetRadioStationDisabled('RADIO_01_CLASS_ROCK', true)
                    SetRadioStationDisabled('RADIO_02_POP', true)
                    SetRadioStationDisabled('RADIO_03_HIPHOP_NEW', true)
                    SetRadioStationDisabled('RADIO_04_PUNK', true)
                    SetRadioStationDisabled('RADIO_05_TALK_01', true)
                    SetRadioStationDisabled('RADIO_06_COUNTRY', true)
                    SetRadioStationDisabled('RADIO_07_DANCE_01', true)
                    SetRadioStationDisabled('RADIO_08_MEXICAN', true)
                    SetRadioStationDisabled('RADIO_09_HIPHOP_OLD', true)
                    SetRadioStationDisabled('RADIO_12_REGGAE', true)
                    SetRadioStationDisabled('RADIO_13_JAZZ', true)
                    SetRadioStationDisabled('RADIO_14_DANCE_02', true)
                    SetRadioStationDisabled('RADIO_15_MOTOWN', true)
                    SetRadioStationDisabled('RADIO_20_THELAB', true)
                    SetRadioStationDisabled('RADIO_16_SILVERLAKE', true)
                    SetRadioStationDisabled('RADIO_17_FUNK', true)
                    SetRadioStationDisabled('RADIO_18_90S_ROCK', true)
                    SetRadioStationDisabled('RADIO_21_DLC_XM17', true)
                    SetRadioStationDisabled('RADIO_22_DLC_BATTLE_MIX1_RADIO', true)
                    SetRadioStationDisabled('RADIO_19_USER', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_AMBIENT_TV', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_AMBIENT_TV_BRIGHT', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_01_CLASS_ROCK', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_ADVERTS', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_02_POP', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_03_HIPHOP_NEW', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_04_PUNK', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_06_COUNTRY', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_07_DANCE_01', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_09_HIPHOP_OLD', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_12_REGGAE', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_15_MOTOWN', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_16_SILVERLAKE', true)
                    SetRadioStationDisabled('RADIO_22_DLC_BATTLE_MIX1_CLUB', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_STRIP_CLUB', true)
                    SetRadioStationDisabled('DLC_BATTLE_MIX1_CLUB_PRIV', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_BIKER_CLASSIC_ROCK', true)
                    SetRadioStationDisabled('DLC_BATTLE_MIX2_CLUB_PRIV', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_BIKER_MODERN_ROCK', true)
                    SetRadioStationDisabled('RADIO_23_DLC_BATTLE_MIX2_CLUB', true)
                    SetRadioStationDisabled('RADIO_25_DLC_BATTLE_MIX4_CLUB', true)
                    SetRadioStationDisabled('DLC_BATTLE_MIX3_CLUB_PRIV', true)
                    SetRadioStationDisabled('RADIO_26_DLC_BATTLE_CLUB_WARMUP', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_BIKER_PUNK', true)
                    SetRadioStationDisabled('RADIO_24_DLC_BATTLE_MIX3_CLUB', true)
                    SetRadioStationDisabled('DLC_BATTLE_MIX4_CLUB_PRIV', true)
                    SetRadioStationDisabled('HIDDEN_RADIO_BIKER_HIP_HOP', true)
                end
            end
            Wait(sleep)
        end
    end)
end
