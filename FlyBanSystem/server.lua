ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('FlyBanSystem:toggleFly')
AddEventHandler('FlyBanSystem:toggleFly', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getGroup() == Config.FlyPermission then
            TriggerClientEvent('FlyBanSystem:toggleFly', source)
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {'FlyBanSystem', 'You do not have permission to use this command'}
            })
        end
    end
end)

RegisterServerEvent('FlyBanSystem:banPlayer')
AddEventHandler('FlyBanSystem:banPlayer', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getGroup() == Config.BanPermission then
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if targetPlayer then
                MySQL.Async.execute('INSERT INTO bans (player_id, reason, banned_by) VALUES (@player_id, @reason, @banned_by)', {
                    ['@player_id'] = targetPlayer.identifier,
                    ['@reason'] = reason,
                    ['@banned_by'] = xPlayer.identifier
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        DropPlayer(playerId, 'You have been banned: ' .. reason)
                        TriggerClientEvent('chat:addMessage', -1, {
                            color = {255, 0, 0},
                            multiline = true,
                            args = {'FlyBanSystem', targetPlayer.name .. ' has been banned by ' .. xPlayer.name .. ' for ' .. reason}
                        })
                    end
                end)
            else
                TriggerClientEvent('chat:addMessage', source, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'FlyBanSystem', 'Player not found'}
                })
            end
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = {255, 0, 0},
                multiline = true,
                args = {'FlyBanSystem', 'You do not have permission to use this command'}
            })
        end
    end
end)