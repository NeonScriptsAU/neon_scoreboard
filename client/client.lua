RegisterCommand('scoreboard', function()
    local data = lib.callback.await('neon_scoreboard:scoreboard', false)

    if not data or not data.players then
        print("Error: Players data is nil")
        return
    end

    local players = data.players
    local robberies = data.robberies
    local jobCounts = {}

    for job, jobData in pairs(Config.OptionsTitles.jobs) do
        local count = players[jobData.index] or 0

        if job == 'police' then
            if Config.EnablePoliceLevelText then
                if count >= Config.PoliceNumbers.veryHigh then
                    count = 'Very High'
                elseif count >= Config.PoliceNumbers.high then
                    count = 'High'
                elseif count >= Config.PoliceNumbers.medium then
                    count = 'Medium'
                elseif count >= Config.PoliceNumbers.low then
                    count = 'Low'
                else
                    count = 'Very Low'
                end
            else
                count = players[jobData.index] or 0
            end
        elseif count == 0 then
            count = 'None'
        end
        jobCounts[job] = count
    end

    local options = {}

    table.insert(options, {
        title = Config.OptionsTitles.totalPlayers.title .. (players[Config.OptionsTitles.totalPlayers.index] or 0) .. ' / ' .. Config.MaxPlayers,
        icon = 'fa-solid fa-users',
        iconColor = '#00FF00',
        arrow = Config.EnableRobberyStatus,
        onSelect = Config.EnableRobberyStatus and function()
            local robberyOptions = {}

            for _, robbery in ipairs(robberies) do
                table.insert(robberyOptions, {
                    title = robbery.title .. ' ' .. robbery.status,
                    icon = 'fa-solid fa-user-secret'
                })
            end

            lib.registerContext({
                id = 'robberies',
                title = 'Robberies',
                menu = 'scoreboard',
                options = robberyOptions
            })
            lib.showContext('robberies')
        end or nil,
        index = Config.OptionsTitles.totalPlayers.index
    })

    for job, jobData in pairs(Config.OptionsTitles.jobs) do
        local description = "ON DUTY: " .. jobCounts[job]
        table.insert(options, {
            title = jobData.title,
            description = description,
            index = jobData.index
        })
    end

    table.sort(options, function(a, b)
        return a.index < b.index
    end)

    lib.registerContext({
        id = 'scoreboard',
        title = Config.MenuTitle,
        options = options
    })
    lib.showContext('scoreboard')
end)

RegisterKeyMapping('scoreboard', 'Open Scoreboard', 'keyboard', 'HOME')