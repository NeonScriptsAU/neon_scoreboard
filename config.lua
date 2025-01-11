Config = {}

Config.Framework = 'QB' -- Set this to 'QB', 'ESX' or 'QBX' depending on your framework.

-- Enable or disable police level text
Config.EnablePoliceLevelText = true

-- Server Slots
Config.MaxPlayers = 2

-- Scoreboard Title title
Config.MenuTitle = 'Neon Scripts'

-- Options titles with descriptions
Config.OptionsTitles = {
    totalPlayers = { title = 'Players: ', index = 1 },
    jobs = {
        police = { title = '👮 Police', jobName = 'police', index = 3 },
        ambulance = { title = '🚑 Ambulance', jobName = 'ambulance', index = 4 },
        fire = { title = '🔥 Fire & Rescue', jobName = 'fire', index = 6 },
        mechanic = { title = '🛠️ Mechanics', jobName = 'mechanic', index = 7 },
    }
}

-- Police numbers for different levels
Config.PoliceNumbers = {
    veryHigh = 4,
    high = 3,
    medium = 2,
    low = 1
}

-- Robberies configuration
Config.Robberies = {
    { title = 'Convenience Store', requiredCops = 1 },
    { title = 'Jewelry Store', requiredCops = 2 },
    { title = 'Bank Heist', requiredCops = 3 }
}
