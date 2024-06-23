if Config.InteractionType == 'drawmarker' then
    CreateThread(function()
        local marker = Config.CityHall.Marker
        local pos = Config.CityHall.Pos

        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - pos)

            DrawMarker(marker.Type, pos.x, pos.y, pos.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.Size.x, marker.Size.y, marker.Size.z, marker.Color.r, marker.Color.g, marker.Color.b, marker.Color.a, false, true, 2, true, nil, nil, false)
            
            if distance < 2.0 then
                if Config.TextUIType == 'oxlib' then
                    lib.showTextUI(Config.TextUI, {position = "top-center"})
                else
                    DrawText3D(pos.x, pos.y, pos.z, Config.TextUI)
                end
                
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('cityhall:openMenu')
                end
            else
                if Config.TextUIType == 'oxlib' then
                    lib.hideTextUI()
                end
            end

            Wait(0)
        end
    end)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    local scale = 0.35

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
