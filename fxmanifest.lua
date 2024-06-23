--[[
  _  ___    _ ____          _   _    _____  ________      ________ _      ____  _____  __  __ ______ _   _ _______ _____ 
 | |/ / |  | |  _ \   /\   | \ | |  |  __ \|  ____\ \    / /  ____| |    / __ \|  __ \|  \/  |  ____| \ | |__   __/ ____|
 | ' /| |  | | |_) | /  \  |  \| |  | |  | | |__   \ \  / /| |__  | |   | |  | | |__) | \  / | |__  |  \| |  | | | (___  
 |  < | |  | |  _ < / /\ \ | . ` |  | |  | |  __|   \ \/ / |  __| | |   | |  | |  ___/| |\/| |  __| | . ` |  | |  \___ \ 
 | . \| |__| | |_) / ____ \| |\  |  | |__| | |____   \  /  | |____| |___| |__| | |    | |  | | |____| |\  |  | |  ____) |
 |_|\_\\____/|____/_/    \_\_| \_|  |_____/|______|   \/   |______|______\____/|_|    |_|  |_|______|_| \_|  |_| |_____/ 
                                                                                                                                                                                                                                                 
https://discord.gg/4STYVS8xTP | @Kuban
Renaming Any Files. = Script Breaking
]]--
fx_version 'cerulean'
game 'gta5'
author 'KubanScripts'
description 'Delivery System'
version '1.0.0'
lua54 'yes'
server_script 'server/main.lua'
client_script 'client/main.lua'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

escrow_ignore {
    'config.lua',
    'server/main.lua' 
    }

dependencies {
    'qb-core',
    'ox_lib'
}
