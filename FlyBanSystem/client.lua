local isFlying = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 288) then
            TriggerServerEvent('FlyBanSystem:toggleFly')
        end
    end
end)

RegisterNetEvent('FlyBanSystem:toggleFly')
AddEventHandler('FlyBanSystem:toggleFly', function()
    isFlying = not isFlying
    SetFlyMode(isFlying)
    if isFlying then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'FlyBanSystem', 'Fly mode enabled'}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'FlyBanSystem', 'Fly mode disabled'}
        })
    end
end)

RegisterCommand(Config.FlyCommand, function(source, args, rawCommand)
    TriggerServerEvent('FlyBanSystem:toggleFly')
end, false)

RegisterCommand(Config.BanCommand, function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local reason = table.concat(args, ' ', 2)
    if playerId and reason then
        TriggerServerEvent('FlyBanSystem:banPlayer', playerId, reason)
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {'FlyBanSystem', 'Usage: /ban [playerId] [reason]'}
        })
    end
end, false)