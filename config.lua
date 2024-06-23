Config = {}

Config.Framework = 'qbcore' -- Options: 'qbcore', 'esx'
Config.InteractionType = 'target' -- Options: 'target', 'drawmarker'
Config.TextUIType = 'drawtext' -- Options: 'oxlib', 'drawtext'
Config.DiscordWebhook = 'YOUR_WEBHOOK_URL'

Config.Notify = 'ox' -- Options: 'qb', 'ox'
Config.Inventory = 'ox' -- Options: 'qb', 'ox'

Config.CityHall = {
    Pos = vector3(-264.58, -964.87, 31.22),
    Marker = {
        Type = 27, -- https://docs.fivem.net/docs/game-references/markers/
        Size = vector3(1.0, 1.0, 1.0),
        Color = {r = 0, g = 255, b = 0, a = 100}
    },
    Target = {
        Size = 2,
        PedModel = 'a_m_y_business_01', -- https://docs.fivem.net/docs/game-references/ped-models/
        PedPos = vector3(-264.67, -964.84, 30.22),
        PedHeading = 204.07
    }
}
Config.TextUI = '[~g~E~w~] City Hall'
Config.WeaponLicenseItem = 'weaponlicense'
Config.HuntingLicenseItem = 'huntinglicense'

Config.Jobs = {
    { name = 'Police', job = 'police', description = 'Join the police force.', icon = 'fas fa-shield-alt' },
    { name = 'EMS', job = 'ambulance', description = 'Join the emergency medical services.', icon = 'fas fa-ambulance' },
    { name = 'Mechanic', job = 'mechanic', description = 'Become a mechanic.', icon = 'fas fa-wrench' },
}

Config.Licenses = {
    { name = 'Weapon License', type = 'weapon', description = 'Obtain a weapon license.', icon = 'fas fa-id-card' },
    { name = 'Hunting License', type = 'hunting', description = 'Obtain a hunting license.', icon = 'fas fa-paw' },
}

Config.Laws = {
    WeaponLaws = {
        'No carrying of illegal weapons',
        'No discharging firearms in public',
    },
    VehicleLaws = {
        'No speeding over the limit',
        'No driving under the influence',
    }
}
