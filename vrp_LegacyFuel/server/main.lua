-- Credits: Marmota#2533 edit for vRP; inZidiu#1 for creating the script
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")


fuelServer = {}
vRP = Proxy.getInterface("vRP")
Tunnel.bindInterface("vrp_LegacyFuel", fuelServer)

local Vehicles = {
	{ plate = '87OJP476', fuel = 50 }
}

function fuelServer.tryPayment(amount)
	local source = source
	local user_id = vRP.getUserId(source)

	return vRP.tryPayment(user_id, amount)
end


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
