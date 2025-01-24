shared_script '@likizao_ac/client/library.lua'






lua54 'yes'


fx_version "bodacious"
game "gta5"
author 'decibel#0001'
ui_page "web/index.html"

client_scripts {
    "@vrp/lib/utils.lua",
    "client/*"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server/*",
}

files { 
    'web/**/**/*'
}              