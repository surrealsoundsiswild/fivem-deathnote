
RegisterCommand('deathnote', function(source, args, rawCommand)
    local targetId = tonumber(args[1])
    
    if targetId then
        TriggerServerEvent('deathnote:useDeathNote', targetId)
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "Please specify a valid player ID."}
        })
    end
end, false)

RegisterNetEvent('deathnote:executeDeathNote')
AddEventHandler('deathnote:executeDeathNote', function()
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"Death Note", "Your name has been written in the Death Note. You have 5 seconds to live."}
    })
    
    Citizen.CreateThread(function()
        Citizen.Wait(5000) -- 5 seconds
        SetEntityHealth(PlayerPedId(), 0) -- Kill the player
    end)
end)