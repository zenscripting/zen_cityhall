if Config.InteractionType == 'target' then
    CreateThread(function()
        local pedModel = Config.CityHall.Target.PedModel
        local pedPos = Config.CityHall.Target.PedPos
        local pedHeading = Config.CityHall.Target.PedHeading

        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(0)
        end

        local ped = CreatePed(4, pedModel, pedPos.x, pedPos.y, pedPos.z, pedHeading, false, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)

        exports.ox_target:addSphereZone({
            coords = Config.CityHall.Pos,
            radius = Config.CityHall.Target.Size,
            debugPoly = false,
            options = {
                {
                    name = 'city_hall_target',
                    event = 'cityhall:openMenu',
                    icon = 'fas fa-building',
                    label = 'City Hall'
                }
            }
        })
    end)
end
