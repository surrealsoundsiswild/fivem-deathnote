
RegisterServerEvent('deathnote:useDeathNote')
AddEventHandler('deathnote:useDeathNote', function(targetId)
    local source = source
    local targetPlayer = tonumber(targetId)
    
    if GetPlayerName(targetPlayer) then
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "You have written " .. GetPlayerName(targetPlayer) .. "'s name in the Death Note."}
        })
        
        TriggerClientEvent('deathnote:executeDeathNote', targetPlayer)
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "Player with ID " .. targetId .. " not found."}
        })
    end
end)

AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, 10) == '/deathnote ' then
        -- Check if player has permission to use the command
        if not IsPlayerAceAllowed(source, "command.deathnote") then
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"Death Note", "You don't have permission to use this command."}
            })
            CancelEvent()
        end
    end
end)
