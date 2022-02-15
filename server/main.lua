local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("fishingrod", function(source)
    TriggerClientEvent('jcc-fishing:client:startFishing', source)
end)
RegisterNetEvent('jcc-fishing:server:CatchFreshwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.FreshWaterFish[math.random(1, #Config.FreshWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:CatchRareFreshwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.RareFreshWaterFish[math.random(1, #Config.RareFreshWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:CatchIllegalFreshwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.IllegalFreshWaterFish[math.random(1, #Config.IllegalFreshWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:CatchSaltwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.SaltWaterFish[math.random(1, #Config.SaltWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:CatchRareSaltwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.RareSaltWaterFish[math.random(1, #Config.RareSaltWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:CatchIllegalSaltwaterFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.IllegalSaltWaterFish[math.random(1, #Config.IllegalSaltWaterFish)]
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
end)
RegisterNetEvent('jcc-fishing:server:TakeBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local removeItem = "redwiggler"
    if Player.Functions.GetItemByName(removeItem) ~= nil then
        Player.Functions.RemoveItem(removeItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[removeItem], 'remove')
    end
end)
RegisterNetEvent('jcc-fishing:server:sellfish', function(fish)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local currentitem = fish
    if Player.Functions.GetItemByName(currentitem) ~= nil then
        local amount = Player.Functions.GetItemByName(fish).amount
        local pay = (amount * Config.SellFish[currentitem])
        Player.Functions.RemoveItem(currentitem, amount)
        Player.Functions.AddMoney('cash', pay)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[currentitem], 'remove', amount)
    else
        TriggerClientEvent("QBCore:Notify", src, "You don't have any "..QBCore.Shared.Items[currentitem].label, "error")
    end
end)