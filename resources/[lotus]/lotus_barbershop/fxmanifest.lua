shared_script '@likizao_ac/client/library.lua'


fx_version "bodacious"
game "gta5"

ui_page "http://cidadealta.lotusgroup.dev/barbershop/build/index.html"

shared_scripts {
    'shared-side/*'
}

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server-side/*"
}
