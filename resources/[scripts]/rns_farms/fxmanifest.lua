
fx_version "bodacious"
games { "gta5" }

ui_page "web/index.html"

author "RenanRamos#7425"

client_scripts {
	"@vrp/lib/utils.lua",
	"main/**/client.lua",
	"main/**/callbacks.lua"
}

shared_scripts {
	"@vrp/lib/utils.lua",
	"main/**/config.lua",
	"main/**/routes.lua",
	"lib/*.lua",
	"config.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"main/**/server.lua"
}

files {
    "web/**/*",
}
              