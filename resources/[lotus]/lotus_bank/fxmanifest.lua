fx_version 'cerulean'
game 'gta5'

client_script {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts{ 
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	'web/*',
	'web/**/*'
}
ui_page 'web/index.html'
                                                        