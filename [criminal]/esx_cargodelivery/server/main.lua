ESX = nil
LastDelivery = 0.0


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetCopsOnline()

	local PoliceConnected = 0
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' or 'fbi'  then
			PoliceConnected = PoliceConnected + 1
		end
	end

	return PoliceConnected
end



RegisterServerEvent('esx_cargodelivery:resetEvent')
AddEventHandler('esx_cargodelivery:resetEvent', function()
	LastDelivery = 0.0
end)




ESX.RegisterServerCallback('esx_cargodelivery:getCopsOnline', function(source, cb)
	cb(GetCopsOnline())
end)






ESX.RegisterServerCallback('esx_cargodelivery:sellCargo', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.UsesBlackMoney then
	
		xPlayer.addAccountMoney('black_money', price)
	
	else

		xPlayer.addMoney(price)

	end
	
	TriggerClientEvent('esx:showNotification', source, "Вы получили ~r~" .. price .. "$~w~ грязным деньгами за доставку груза.")
	cb(true)

	LastDelivery = 0.0

end)





ESX.RegisterServerCallback('esx_cargodelivery:buyCargo', function(source, cb, price)
	
	local xPlayer = ESX.GetPlayerFromId(source)

	if (os.time() - LastDelivery) < 200.0 and LastDelivery ~= 0.0 then

		TriggerClientEvent('esx:showNotification', source, "Груз уже доставляется")
		cb(false)

	else 

		police_alarm_time = os.time() + math.random(10000, 20000)

		if Config.UsesBlackMoney then

			if xPlayer.getAccount('black_money').money >= price then

				xPlayer.removeAccountMoney('black_money', price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Не хватает ~r~грязных денег~w~.")
	

				cb(false)
			end

		else 

				if xPlayer.getMoney() >= price then

				xPlayer.removeMoney(price)

				LastDelivery = os.time()

				cb(true)
			else

				TriggerClientEvent('esx:showNotification', source, "Не хватает ~r~наличных денег~w~.")
	
				cb(false)
			end
		end

	end

end)