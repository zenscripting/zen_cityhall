local QBCore = nil
local ESX = nil

if Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

local function logToDiscord(title, description)
    local webhook = Config.DiscordWebhook
    if webhook ~= '' then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
            username = 'KubanScripts - City Hall',
            avatar_url = 'https://media.discordapp.net/attachments/1253047723238752296/1253047774174253107/512x512.png?ex=66790c6d&is=6677baed&hm=f6b864964e4939712ec2a687dab7a4232c88c19833a94214af732379985965dc&=&format=webp&quality=lossless&width=701&height=701', -- Add your avatar URL here
            embeds = {{
                ["title"] = title,
                ["description"] = description,
                ["color"] = 65280,
                ["footer"] = {
                    ["text"] = "KubanScripts - City Hall",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1253047723238752296/1253047774174253107/512x512.png?ex=66790c6d&is=6677baed&hm=f6b864964e4939712ec2a687dab7a4232c88c19833a94214af732379985965dc&=&format=webp&quality=lossless&width=701&height=701" -- Add your footer icon URL here
                }
            }},
        }), { ['Content-Type'] = 'application/json' })
    end
end

local function notifyPlayer(source, message, type)
    if Config.Notify == 'ox' then
        TriggerClientEvent('ox_lib:notify', source, { type = type, description = message })
    elseif Config.Notify == 'qb' then
        TriggerClientEvent('QBCore:Notify', source, message, type)
    end
end

RegisterNetEvent('cityhall:setJob', function(job)
    local src = source
    if Config.Framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            if job then
                Player.Functions.SetJob(job, 0)
                notifyPlayer(src, 'Job set to ' .. job, 'success')
                logToDiscord('Job Set', 'Player ' .. GetPlayerName(src) .. ' set job to ' .. job)
            else
                print('Error: Job argument is nil')
            end
        else
            print('Error: Could not find player for job setting')
        end
    elseif Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            if job then
                xPlayer.setJob(job, 0)
                notifyPlayer(src, 'Job set to ' .. job, 'success')
                logToDiscord('Job Set', 'Player ' .. GetPlayerName(src) .. ' set job to ' .. job)
            else
                print('Error: Job argument is nil')
            end
        else
            print('Error: Could not find player for job setting')
        end
    end
end)

RegisterNetEvent('cityhall:giveLicense', function(licenseType)
    local src = source
    if Config.Framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            if licenseType then
                if licenseType == 'weapon' then
                    Player.Functions.AddItem(Config.WeaponLicenseItem, 1)
                elseif licenseType == 'hunting' then
                    Player.Functions.AddItem(Config.HuntingLicenseItem, 1)
                end
                
                notifyPlayer(src, licenseType .. ' license granted!', 'success')
                logToDiscord('License Granted', 'Player ' .. GetPlayerName(src) .. ' received ' .. licenseType .. ' license')
            else
                print('Error: License type argument is nil')
            end
        else
            print('Error: Could not find player for license granting')
        end
    elseif Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            if licenseType then
                if licenseType == 'weapon' then
                    xPlayer.addInventoryItem(Config.WeaponLicenseItem, 1)
                elseif licenseType == 'hunting' then
                    xPlayer.addInventoryItem(Config.HuntingLicenseItem, 1)
                end
                
                notifyPlayer(src, licenseType .. ' license granted!', 'success')
                logToDiscord('License Granted', 'Player ' .. GetPlayerName(src) .. ' received ' .. licenseType .. ' license')
            else
                print('Error: License type argument is nil')
            end
        else
            print('Error: Could not find player for license granting')
        end
    end
end)
