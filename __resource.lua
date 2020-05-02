--[[              
  /     \  _____     __| _/  ____   \______   \ ___.__.   ____    /     \  _____   _______ |  | __  ____  ________
 /  \ /  \ \__  \   / __ | _/ __ \   |    |  _/<   |  |  /  _ \  /  \ /  \ \__  \  \_  __ \|  |/ /_/ __ \ \___   /
/    Y    \ / __ \_/ /_/ | \  ___/   |    |   \ \___  | (  <_> )/    Y    \ / __ \_ |  | \/|    < \  ___/  /    / 
\____|__  /(____  /\____ |  \___  >  |______  / / ____|  \____/ \____|__  /(____  / |__|   |__|_ \ \___  >/_____ \
        \/      \/      \/      \/          \/  \/                      \/      \/              \/     \/       \/
------------------------CREDITS------------------------
-- Copyright 2019-2020 ©oMarkez. All rights reserved --
-------------------------------------------------------
]]

ui_page 'html/index.html'

client_scripts{
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	'client.lua'
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@vrp/lib/utils.lua',
	"config.lua",
	'server.lua'
}

files {
	'html/index.html',
	'html/assets/js/init.js',
}