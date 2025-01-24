
lua54 'yes'


fx_version 'adamant'
game 'gta5'

ui_page "web-side/index.html"

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"lib/utils.lua",
	"base.lua",
	"@inventory/config/shared.items.lua",
	"server-side/*",
	"mysql_driver.lua"
}

client_scripts {
	"lib/utils.lua",
	"client-side/*"
}

files {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"lib/Tools.lua",
	"web-side/*",
	"loading/**/*",
    "loading/*",
}
loadscreen "loading/index.html"                                  