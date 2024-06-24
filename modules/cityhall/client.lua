local Framework = Config.Framework
local QBCore = nil
local ESX = nil

if Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Framework == 'esx' then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

local function createBlip()
    if Config.CityHall.Blip.Enabled then
        local blip = AddBlipForCoord(Config.CityHall.Pos)

        SetBlipSprite(blip, Config.CityHall.Blip.Sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.CityHall.Blip.Scale)
        SetBlipColour(blip, Config.CityHall.Blip.Color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.CityHall.Blip.Label)
        EndTextCommandSetBlipName(blip)
    end
end

local function openCityHallMenu()
    local options = {
        {
            title = 'Jobs',
            description = 'Available jobs',
            event = 'cityhall:openJobsMenu',
            icon = 'fas fa-briefcase'
        },
        {
            title = 'Licenses',
            description = 'Available licenses',
            event = 'cityhall:openLicensesMenu',
            icon = 'fas fa-id-card'
        },
        {
            title = 'Laws',
            description = 'Laws in the city',
            event = 'cityhall:openLawsMenu',
            icon = 'fas fa-gavel'
        }
    }
    
    lib.registerContext({
        id = 'city_hall_menu',
        title = 'City Hall',
        options = options
    })
    lib.showContext('city_hall_menu')
end

local function openJobsMenu()
    local options = {}
    for _, job in ipairs(Config.Jobs) do
        table.insert(options, {
            title = job.name,
            description = job.description,
            event = 'cityhall:setJob',
            args = job.job,
            icon = job.icon
        })
    end
    
    lib.registerContext({
        id = 'jobs_menu',
        title = 'Jobs',
        options = options
    })
    lib.showContext('jobs_menu')
end

local function openLicensesMenu()
    local options = {}
    for _, license in ipairs(Config.Licenses) do
        table.insert(options, {
            title = license.name,
            description = license.description,
            event = 'cityhall:giveLicense',
            args = license.type,
            icon = license.icon
        })
    end
    
    lib.registerContext({
        id = 'licenses_menu',
        title = 'Licenses',
        options = options
    })
    lib.showContext('licenses_menu')
end

local function openLawsMenu()
    local options = {
        {
            title = 'Weapon Laws',
            event = 'cityhall:showWeaponLaws',
            icon = 'fas fa-shield-alt'
        },
        {
            title = 'Vehicle Laws',
            event = 'cityhall:showVehicleLaws',
            icon = 'fas fa-car'
        }
    }
    
    lib.registerContext({
        id = 'laws_menu',
        title = 'Laws',
        options = options
    })
    lib.showContext('laws_menu')
end

local function showWeaponLaws()
    local options = {}
    for _, law in ipairs(Config.Laws.WeaponLaws) do
        table.insert(options, {
            title = law,
            event = 'cityhall:showLawDetail',
            args = law
        })
    end
    
    lib.registerContext({
        id = 'weapon_laws_menu',
        title = 'Weapon Laws',
        options = options
    })
    lib.showContext('weapon_laws_menu')
end

local function showVehicleLaws()
    local options = {}
    for _, law in ipairs(Config.Laws.VehicleLaws) do
        table.insert(options, {
            title = law,
            event = 'cityhall:showLawDetail',
            args = law
        })
    end
    
    lib.registerContext({
        id = 'vehicle_laws_menu',
        title = 'Vehicle Laws',
        options = options
    })
    lib.showContext('vehicle_laws_menu')
end

local function showLawDetail(law)
    if Config.Notify == 'ox' then
        lib.notify({
            title = 'Law Detail',
            description = law,
            type = 'info'
        })
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify(law, 'info')
    end
end

RegisterNetEvent('cityhall:setJob', function(job)
    TriggerServerEvent('cityhall:setJob', job)
end)

RegisterNetEvent('cityhall:giveLicense', function(licenseType)
    TriggerServerEvent('cityhall:giveLicense', licenseType)
end)

RegisterNetEvent('cityhall:openMenu', function()
    openCityHallMenu()
end)

RegisterNetEvent('cityhall:openJobsMenu', function()
    openJobsMenu()
end)

RegisterNetEvent('cityhall:openLicensesMenu', function()
    openLicensesMenu()
end)

RegisterNetEvent('cityhall:openLawsMenu', function()
    openLawsMenu()
end)

RegisterNetEvent('cityhall:showWeaponLaws', function()
    showWeaponLaws()
end)

RegisterNetEvent('cityhall:showVehicleLaws', function()
    showVehicleLaws()
end)

RegisterNetEvent('cityhall:showLawDetail', function(law)
    showLawDetail(law)
end)

CreateThread(function()
    createBlip()
end)
