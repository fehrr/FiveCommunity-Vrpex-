shared_script '@likizao_ac/client/library.lua'



fx_version "bodacious"
game "gta5"

ui_page "http://cidadealta.lotusgroup.dev/tattoos/build/index.html"
 
client_scripts {
	"@vrp/lib/utils.lua",
	"client/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*"
}