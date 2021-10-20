ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("qy:server:yeninot")
AddEventHandler("qy:server:yeninot", function(info)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local info = {
		type = "note",
		info = info,
	}
    xPlayer.addInventoryItem("notepad", 1, nil, info)
end)

local kullanilannotdefteri = 0
ESX.RegisterUsableItem('notepad', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if kullanilannotdefteri < 8 then 
		TriggerClientEvent('qy:notepad:opennui', source)
		kullanilannotdefteri = kullanilannotdefteri + 1
	else
        TriggerClientEvent('mythic_notify:sendAlert', source, {type = "error", "Sayfan Bitti!"})
		xPlayer.removeInventoryItem("book", 1)
		kullanilannotdefteri = 0
	end
end)

ESX.RegisterUsableItem('notepad', function(source, item)
	TriggerClientEvent('qy:notepad:oku', source, item.info.info)
end)
