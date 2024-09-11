RegisterNetEvent('garage:setVehicleAttributes')
AddEventHandler('garage:setVehicleAttributes', function(networkId)

   local vehicle = NetworkGetEntityFromNetworkId(networkId)

    -- Ensure the vehicle exists and is valid
    if DoesEntityExist(vehicle) then
        NetworkRequestControlOfEntity(vehicle)
        SetVehicleEngineHealth(vehicle, 1000.0)
    else
        print("Vehicle does not exist or failed to spawn!")
    end

end)
