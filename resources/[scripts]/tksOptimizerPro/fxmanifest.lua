fx_version "adamant"
game "gta5"

author "Five Community"
discord "https://discord.gg/fivecommunity"

client_scripts {
   "client-side/*"
}

server_scripts {
	"server-side/*"
 }

files {
   "web-side/*",
   "web-side/**/*"
}

shared_scripts{
   "config.lua "
}

ui_page "web-side/index.html"