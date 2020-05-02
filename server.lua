local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_save")

function notify(source, text, type)
    TriggerClientEvent(
        "pNotify:SendNotification", source,
        {
            text = tostring(text), 
            type = tostring(type), 
            queue = "global", 
            timeout = 4000, 
            layout = "bottomCenter",
            animation = {
                open = "gta_effects_fade_in", 
                close = "gta_effects_fade_out"
            }
        }
    )
end

local cooldowns = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(cooldowns) do
            if v >= 0 then
                cooldowns[k] = v - 1
                if v == 0 then
                    cooldowns[k] = nil
                end
            end
        end
    end
end)

RegisterCommand(config.command, function(source, args)
    if not cooldowns[source] then
        local user_id = vRP.getUserId({source})
        if user_id then
            notify(source, config.notifys.gem, "info")
            local tmpTable = vRP.getUserDataTable({user_id})
            if tmpTable then
                TriggerEvent("vRP:save")
                vRP.setUData({tonumber(user_id),"vRP:datatable",json.encode(tmpTable)})
            end
            notify(source, config.notifys.gemt, "success")
        end
        cooldowns[source] = config.cooldown
    else
        notify(source, "Du skal vente "..cooldowns[source].."s før du kan bruge denne kommando igen.", "error")
    end
end, false)

RegisterCommand(config.commandall, function(source, args)
    if args then
        if args[1] then
            notify(source, "Udsætter data gen med " ..tostring(args[1]).. " sekunder.", "info")
            args[1] = args[1]*1000
            Citizen.Wait(tonumber(args[1]))
        end
    end
    local user_id = vRP.getUserId({source})

    if user_id then
        if vRP.hasPermission({user_id, config.permall}) then
            notify(source, config.notifys.gem, "info")
            local usrs = vRP.getUsers({})
            if usrs and #usrs > 0 then
                TriggerEvent("vRP:save")
                print("[omarkez_save] Gemmer data for " ..#usrs.. " spillere.")
                for k,v in pairs(usrs) do
                    local tmpTable = vRP.getUserDataTable({k})
                    if tmpTable then
                        vRP.setUData({k,"vRP:datatable",json.encode(tmpTable)})
                    end
                end
                print("[omarkez_save] Data gemt for "..#usrs.." spillere.")
                notify(source, config.notifys.gemt, "success")
            end
        else
            notify(source, config.notifys.ingenperms, "error")
        end
    end
end, false)
