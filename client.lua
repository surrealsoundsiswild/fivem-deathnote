-- Death Note Client Script

-- Register the command
RegisterCommand('deathnote', function(source, args, rawCommand)
    local targetId = tonumber(args[1])
    
    if targetId then
        -- Notify server to process the death note
        TriggerServerEvent('deathnote:useDeathNote', targetId)
    else
        -- Inform player if they didn't provide a valid ID
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "Please specify a valid player ID."}
        })
    end
end, false)

-- Event to play sound and kill player
RegisterNetEvent('deathnote:executeDeathNote')
AddEventHandler('deathnote:executeDeathNote', function()
    -- Play death note sound
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    
    -- Display message
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"Death Note", "Your name has been written in the Death Note. You have 5 seconds to live."}
    })
    
    -- Wait 5 seconds then kill player
    Citizen.CreateThread(function()
        Citizen.Wait(5000) -- 5 seconds
        SetEntityHealth(PlayerPedId(), 0) -- Kill the player
    end)
end)