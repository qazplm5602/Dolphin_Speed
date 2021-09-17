Citizen.CreateThread(function()
    while Config == nil do
        Citizen.Wait(100)
    end
    while true do
        Wait(0)
        for k, v in pairs(Config.cctvlist) do
            local peds = GetPlayerPed(-1)
            local sdcord = GetEntityCoords(GetPlayerPed(-1))
                if Vdist(v[1],v[2],v[3], sdcord["x"], sdcord["y"], sdcord["z"]) < 10 then
                    DP_Fine()
                end
            end
        end
    end
)


function DP_Fine()
    local entity = GetPlayerPed(-1)
    local speed = GetEntitySpeed(entity)
    local veh = GetVehiclePedIsIn(entity, false)
    local seat1 = GetPedInVehicleSeat(veh, -1)
    local kmspeed = math.ceil(speed*3.6)
    local maxspeed = 350
    local ksm = seat1 and kmspeed > maxspeed
    if ksm then
        TriggerServerEvent("dc:payget")
        Citizen.Wait(500)
        SendNUIMessage({ 
            type="open",
        })
        SendNUIMessage({ 
            type="sidenotice",
        })
            Citizen.Wait(100)
        SendNUIMessage({ 
            type="close",
        })
            Citizen.Wait(5000)
        SendNUIMessage({ 
            type="closeside",
        })
    end
end