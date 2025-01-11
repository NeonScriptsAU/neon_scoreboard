local Framework = nil
local QBCore = nil

if Config.Framework == 'ESX' then
    Framework = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
    Framework = QBCore
elseif Config.Framework == 'QBX' then
    Framework = exports.qbx_core
else
    return
end

lib.callback.register('neon_scoreboard:scoreboard', function(source)
    local TotalPlayers = 0
    local Players = {}
    local jobCounts = {}

    for job, _ in pairs(Config.OptionsTitles.jobs) do
        jobCounts[job] = 0
    end

    local players = {}
    if Config.Framework == 'ESX' then
        players = Framework.GetPlayers() or {}
    elseif Config.Framework == 'QB' then
        players = QBCore.Functions.GetPlayers() or {}
    elseif Config.Framework == 'QBX' then
        players = exports.qbx_core:GetQBPlayers() or {}
    end

    if #players == 0 then
        return nil
    end

    for _, playerId in ipairs(players) do
        local playerData = nil

        if Config.Framework == 'ESX' then
            playerData = Framework.GetPlayerFromId(playerId)
        elseif Config.Framework == 'QB' then
            playerData = QBCore.Functions.GetPlayer(playerId)
        elseif Config.Framework == 'QBX' then
            playerData = exports.qbx_core:GetPlayer(playerId)
        end

        if playerData then
            local jobName = nil
            if Config.Framework == 'QB' or Config.Framework == 'QBX' then
                jobName = playerData.PlayerData.job.name
            elseif Config.Framework == 'ESX' then
                jobName = playerData.job.name
            end

            if jobName then
                for job, jobData in pairs(Config.OptionsTitles.jobs) do
                    if string.lower(jobName) == string.lower(jobData.jobName) then
                        jobCounts[job] = jobCounts[job] + 1
                    end
                end
            end
        end

        TotalPlayers = TotalPlayers + 1
    end

    for job, jobData in pairs(Config.OptionsTitles.jobs) do
        Players[jobData.index] = jobCounts[job] or 0
    end
    Players[Config.OptionsTitles.totalPlayers.index] = TotalPlayers

    local robberiesStatus = {}
    for _, robbery in pairs(Config.Robberies) do
        if jobCounts['police'] >= robbery.requiredCops then
            table.insert(robberiesStatus, { title = robbery.title, status = '✅' })
        else
            table.insert(robberiesStatus, { title = robbery.title, status = '❌' })
        end
    end

    return { players = Players, robberies = robberiesStatus }
end)