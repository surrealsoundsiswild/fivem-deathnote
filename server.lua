-- Death Note Server Script

-- Event handler for using the death note
RegisterServerEvent('deathnote:useDeathNote')
AddEventHandler('deathnote:useDeathNote', function(targetId)
    local source = source
    local targetPlayer = tonumber(targetId)
    
    -- Check if target player exists
    if GetPlayerName(targetPlayer) then
        -- Inform the user that the death note was used
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "You have written " .. GetPlayerName(targetPlayer) .. "'s name in the Death Note."}
        })
        
        -- Trigger the death note effect on the target player
        TriggerClientEvent('deathnote:executeDeathNote', targetPlayer)
    else
        -- Inform the user if the target player doesn't exist
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"Death Note", "Player with ID " .. targetId .. " not found."}
        })
    end
end)

-- Add ACL permission check (optional, uncomment to use)
--[[
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
--]]