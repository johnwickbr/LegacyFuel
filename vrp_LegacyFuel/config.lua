-- Credits: Marmota#2533 edit for vRP; inZidiu#1 for creating the script

Config = {}

Config.EnableBlips				= true
Config.EnableJerryCans			= true
Config.EnableBuyableJerryCans	= true -- Coming soon, currently useless
Config.VehicleFailure			= 0 -- At what fuel-percentage should the engine stop functioning properly? (Defualt: 10)
Config.FuelPrice                = 3
Config.Usage                    = 1.25

Config.SpecialUsage = {
    -- ["Model"] = Usage
    -- ["adder"] = 3
}

Lang = {}
Lang.exitVehicle                = "Exit to fuel your vehicle"
Lang.buyFuel                    = "Press ~g~G ~w~to fuel your vehicle. " .. "$" .. Config.FuelPrice .. " per Liter."
Lang.cancelFueling              = "Press ~g~G ~w~to cancel the fueling of your vehicle."
Lang.fullFuel                   = "Vehicle is too filled with gas to be fueled"