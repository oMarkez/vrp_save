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

RegisterCommand("gem", function(source, args)
    if args then
        if args[1] then
            notify(source, "Udsætter data gen med " ..tostring(args[1]).. " sekunder.", "info")
            args[1] = args[1]*1000
            Citizen.Wait(tonumber(args[1]))
        end
    end
    local user_id = vRP.getUserId({source})

    if user_id then
        if vRP.hasPermission({user_id, config.perm}) then
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