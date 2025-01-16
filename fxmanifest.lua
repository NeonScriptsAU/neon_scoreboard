fx_version 'cerulean'
game 'gta5'

description 'Scoreboard System'
version '1.0.2'
author 'Neon Scripts'

lua54 'yes'

server_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'server/*.lua'
}

client_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'client/*.lua'
}

dependencies {
    'ox_lib'
}