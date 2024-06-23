--[[
  _  ___    _ ____          _   _    _____  ________      ________ _      ____  _____  __  __ ______ _   _ _______ _____ 
 | |/ / |  | |  _ \   /\   | \ | |  |  __ \|  ____\ \    / /  ____| |    / __ \|  __ \|  \/  |  ____| \ | |__   __/ ____|
 | ' /| |  | | |_) | /  \  |  \| |  | |  | | |__   \ \  / /| |__  | |   | |  | | |__) | \  / | |__  |  \| |  | | | (___  
 |  < | |  | |  _ < / /\ \ | . ` |  | |  | |  __|   \ \/ / |  __| | |   | |  | |  ___/| |\/| |  __| | . ` |  | |  \___ \ 
 | . \| |__| | |_) / ____ \| |\  |  | |__| | |____   \  /  | |____| |___| |__| | |    | |  | | |____| |\  |  | |  ____) |
 |_|\_\\____/|____/_/    \_\_| \_|  |_____/|______|   \/   |______|______\____/|_|    |_|  |_|______|_| \_|  |_| |_____/ 
                                                                                                                                                                                                                                                 
https://discord.gg/4STYVS8xTP | @Kuban
]]--
fx_version "cerulean"
game "gta5"
author "KubanScripts"
description "Cityhall"
version "1.0.0"
lua54 "yes"

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'modules/cityhall/client.lua',
    'modules/interactions/target.lua',
    'modules/interactions/drawmarker.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'modules/cityhall/server.lua',
}

dependencies {
    'ox_lib',
    'oxmysql',
    '/server:4500',
}
