



fx_version "bodacious"
game "gta5"
author "AprendiiZ#3794"
                       
ui_page "web-side/index.html"

client_scripts {
  "@vrp/lib/utils.lua",
  "client-side/**/*",
  "config/**/*"
}

server_scripts {
  "@vrp/lib/utils.lua",
  "server-side/**/*",
  "config/**/*"
}

files {
	"web-side/*",
	"web-side/**/*",
	"web-side/**/**/*",
}
              