shared_script '@likizao_ac/client/library.lua'


fx_version 'cerulean'
game 'gta5'

fx_version "bodacious"
game "gta5"

ui_page "web-side/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*",
	"cfg/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server-side/server.lua",
	"server-side/notify.lua",
	"cfg/*"
}

files {
	"web-side/*",
	"web-side/**/*",
	"web-side/**/**/*",
	"web-side/**/**/**/*",
}
                                          
