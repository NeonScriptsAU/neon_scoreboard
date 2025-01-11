![GitHub all releases](https://img.shields.io/github/downloads/NeonScriptsAU/neon_scoreboard/total?color=blue&style=flat-square)

# Neon Scoreboard for ESX & QBCore

## Overview

The Neon Scoreboard script provides an interactive scoreboard for FiveM servers using either the ESX, QBCore or QBOX framework. This script dynamically adjusts to the selected framework and displays a list of current jobs and robberies, as well as overall player counts.

## Setup

1. **Framework Selection**: 
   - Open `config.lua` and set the framework you're using:
     ```lua
     Config.Framework = 'QB' -- Set this to 'QB', 'ESX' or 'QBX' depending on your framework.
     ```

2. **Key Mapping**:
   - The scoreboard is bound to the `HOME` key by default. To change it, modify the `RegisterKeyMapping` in the `client.lua` file.

3. **Features**:
   - Displays a count of on-duty jobs (police, ambulance, etc.).
   - Shows the total player count on the server.
   - Lists robbery options and shows whether there are enough police to start a robbery.
   - Framework agnostic: works with both QBCore and ESX.

## Installation

1. Download or clone this repository into your `resources` folder.
2. Add `ensure neon_scoreboard` to your `server.cfg`.
3. Configure `config.lua` for your framework and preferred settings.
4. Restart your server or run `refresh` followed by `start neon_scoreboard`.# neon_scoreboard
