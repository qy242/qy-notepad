-- Settings
local guiEnabled = false
local hasOpened = false
local serverNotes = {}

-- Nui
RegisterNUICallback('close', function(info, cb)
    closeGui()
    cb('ok')
end)

RegisterNUICallback('drop', function(info, cb)
    closeGui()
    TriggerServerEvent("qy:server:yeninot", info.noteText)
end)


-- Function
function closeGui()
    guiEnabled = false
    ped = PlayerPedId();
    ClearPedTasks(ped);
    SetNuiFocus(false, false)
    SendNUIMessage({openSection = "close"})
    TriggerEvent("dpemotes:play-anim", {"c"}) -- animasyon valla üşendim
    SetPlayerControl(PlayerId(), 1, 0)
end

function openGui()
    SetPlayerControl(PlayerId(), 0, 0)
    guiEnabled = true
    SetNuiFocus(true, true)
    SendNUIMessage({openSection = "openNotepad"})
    local inveh = IsPedSittingInAnyVehicle(PlayerPedId())
    TriggerEvent("dpemotes:play-anim", {"not"}) -- animasyon valla üşendim
end


-- Event
RegisterNetEvent('qy:notepad:opennui')
AddEventHandler('qy:notepad:opennui', function()
    openGui()
    guiEnabled = true
end)

RegisterNetEvent('qy:notepad:oku')
AddEventHandler('qy:notepad:oku', function(sendyazi)
    SetPlayerControl(PlayerId(), 0, 0)
    guiEnabled = true
    SetNuiFocus(true)
    SendNUIMessage({openSection = "openNotepadRead", TextRead = sendyazi})
    TriggerEvent("dpemotes:play-anim", {"not"}) -- animasyon valla üşendim
end)