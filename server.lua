QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("qy:server:yeninot")
AddEventHandler("qy:server:yeninot", function(info)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local info = {
		type = "note",
		info = info,
	}
    xPlayer.Functions.AddItem("notepad", 1, nil, info)
end)

local kullanilannotdefteri = 0
QBCore.Functions.CreateUseableItem('book', function(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if kullanilannotdefteri < 8 then 
		TriggerClientEvent('qy:notepad:opennui', source)
		kullanilannotdefteri = kullanilannotdefteri + 1
	else
		TriggerClientEvent("QBCore:Notify", source, "Sayfan bitti!", "error")
		xPlayer.Functions.RemoveItem("book", 1)
		kullanilannotdefteri = 0
	end
end)

QBCore.Functions.CreateUseableItem('notepad', function(source, item)
	TriggerClientEvent('qy:notepad:oku', source, item.info.info)
end)