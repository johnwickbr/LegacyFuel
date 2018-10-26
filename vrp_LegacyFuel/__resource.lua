ui_page "HTML/ui.html"

files {
	"HTML/ui.html",
	"HTML/ui.css",
	"HTML/ui.js"
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/main.lua'
}

client_scripts {
	'@vrp/lib/utils.lua',
	'config.lua',
	'client/main.lua'
}
