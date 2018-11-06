-- Credits: Marmota#2533 edit for vRP; inZidiu#1 for creating the script
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

local Vehicles = {
	{ plate = '87OJP476', fuel = 50 }
}

RegisterServerEvent("LegacyFuel:GetMoneyOnHand")
AddEventHandler("LegacyFuel:GetMoneyOnHand",function ()
	local source = source
	TriggerClientEvent("LegacyFuel:ReturnMoneyOnHand",source,vRP.getMoney({vRP.getUserId({source})}))
end)

RegisterServerEvent("LegacyFuel:PayFuel")
AddEventHandler("LegacyFuel:PayFuel",function (price)
	vRP.tryPayment({vRP.getUserId({source}), price})
	TriggerClientEvent("LegacyFuel:ReturnMoneyOnHand",source,vRP.getMoney({vRP.getUserId({source})}))
end)


RegisterServerEvent('LegacyFuel:UpdateServerFuelTable')
AddEventHandler('LegacyFuel:UpdateServerFuelTable', function(plate, fuel, model)
	local found = false

	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].model == model then
			found = true

			if fuel ~= Vehicles[i].fuel then
				table.remove(Vehicles, i)
				table.insert(Vehicles, {plate = plate, fuel = fuel, model = model})
			end
			break 
		end
	end

	if not found then
		table.insert(Vehicles, {plate = plate, fuel = fuel, model = model})
	end
end)

RegisterServerEvent('LegacyFuel:CheckServerFuelTable')
AddEventHandler('LegacyFuel:CheckServerFuelTable', function(plate, model)
	for i = 1, #Vehicles do
		if Vehicles[i].plate == plate and Vehicles[i].model == model then
			local vehInfo = {plate = Vehicles[i].plate, fuel = Vehicles[i].fuel,model = Vehicles[i].model}

			TriggerClientEvent('LegacyFuel:ReturnFuelFromServerTable', source, vehInfo)

			break
		end
	end
end)

function round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
