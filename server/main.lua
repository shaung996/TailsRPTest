-- Register a server-side command to spawn vehicles
RegisterCommand("spawnvehicle", function(source, args, rawCommand)
    
    local vehicleModel = args[1] -- Get the vehicle model from the command argument

    if not vehicleModel then
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^1Error', 'You must specify a vehicle model!' }
        })
        return
    end

    local playerPed = GetPlayerPed(source) -- Get the player entity
    local playerCoords = GetEntityCoords(playerPed) -- Get player's coordinates
    
    -- Load the vehicle model
    local model = GetHashKey(vehicleModel)

    -- Create the vehicle at the player's coordinates
    local vehicle = CreateVehicle(model, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

    if vehicle then

        Wait(50)

        SetVehicleBodyHealth(vehicle, 1000.0)     -- Set max body health
        SetVehicleColours(vehicle, 53, 103)       -- Set primary and secondary colors
        SetVehicleNumberPlateText(vehicle, "ABC1234") -- Set vehicle plate

        local networkId = NetworkGetNetworkIdFromEntity(vehicle)

        -- Send the network ID to the client
        TriggerClientEvent('garage:setVehicleAttributes', source, networkId)
    end

end, false)

