Config = {}

Config.AmazingScripts = true
Config.VersionChecker = true 

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
        police = { title = '👮 Police', jobNames = {'police', 'sheriff'}, index = 2 },
        ambulance = { title = '🚑 Ambulance', jobNames = {'ambulance'}, index = 3 },
        fire = { title = '🔥 Fire & Rescue', jobNames = {'fire'}, index = 4 },
        mechanic = { title = '🛠️ Mechanics', jobNames = {'mechanic'}, index = 5 },
    }
}

-- Police numbers for different levels
Config.PoliceNumbers = {
    veryHigh = 4,
    high = 3,
    medium = 2,
    low = 1
}

Config.EnableRobberyStatus = true -- Options: true/false | This Will Enable/Disable The Robbery Status Menu

-- Robberies configuration
Config.Robberies = {
    { title = 'Convenience Store', requiredCops = 1 },
    { title = 'Jewelry Store', requiredCops = 2 },
    { title = 'Bank Heist', requiredCops = 3 }
}