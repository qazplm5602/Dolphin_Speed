local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP",GetCurrentResourceName())

math.randomseed(os.time())
local rand = math.random(1, 100000)

MySQL.createCommand("vRP/last_user_id" .. rand, "SELECT id FROM vrp_users order by id desc")
MySQL.createCommand("vRP/get_ids" .. rand, "SELECT * FROM vrp_user_ids WHERE user_id = @user_id")
MySQL.createCommand("vRP/get_ids_old" .. rand, "SELECT * FROM vrp_user_ids_old WHERE identifier = @identifier")


local limitUserId = nil

Citizen.CreateThread(
  function()
    Citizen.Wait(1000)
    while true do
      MySQL.query(
        "vRP/last_user_id" .. rand,
        {},
        function(rows, affected)
          if rows and #rows > 0 then
            limitUserId = tonumber(rows[1].id) - 500 or nil
          end
        end
      )
      Citizen.Wait(60000)
    end
  end
)

Citizen.CreateThread(
  function()
    Citizen.Wait(1000)
    function task_get_last_user_id()
      MySQL.query(
        "vRP/last_user_id" .. rand,
        {},
        function(rows, affected)
          if rows and #rows > 0 then
            limitUserId = tonumber(rows[1].id) - 1000 or nil
          end
          SetTimeout(60000, task_get_last_user_id)
        end
      )
    end
    task_get_last_user_id()
  end
)

RegisterServerEvent("dc:payget")
AddEventHandler("dc:payget", function()
	local user_id = vRP.getUserId({source})
    if limitUserId ~= nil and tonumber(user_id) > limitUserId or vRP.hasPermission({user_id, "police.lostnotify"}) or vRP.hasPermission({user_id, "ems.whitelisted"}) or vRP.hasPermission({user_id, "prison.lostnotify"}) then
        vRPclient.notifys(source, {"공무원 및 뉴비는 단속 시스템에서 제외됩니다."})
        return
    else
        vRP.tryFullPayment({user_id,4000000})
        vRPclient.notifys(source, {"벌금 400만원이 지불되었습니다."})
    end
end
)