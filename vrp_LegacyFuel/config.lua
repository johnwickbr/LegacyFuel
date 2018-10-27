-- Credits: Marmota#2533 edit for vRP; inZidiu#1 for creating the script

Config = {}

Config.EnableBlips				= true
Config.VehicleFailure			= 0 -- At what fuel-percentage should the engine stop functioning properly? (Defualt: 10)
Config.FuelPrice                = 3
Config.Usage                    = 1.25
Config.EnableJerryCans			= true
Config.EnableBuyableJerryCans	= true
Config.JerryCanPrice	        = 100*Config.FuelPrice

Config.SpecialUsage = {
    -- ["Model"] = Usage
    -- ["adder"] = 3
}