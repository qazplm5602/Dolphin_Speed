--[[
	
	███╗   ███╗ █████╗ ██████╗ ███████╗  ██████╗ ██╗   ██╗  ██████╗  █████╗ ██╗     ██████╗ ██╗  ██╗██╗███╗  ██╗
	████╗ ████║██╔══██╗██╔══██╗██╔════╝  ██╔══██╗╚██╗ ██╔╝  ██╔══██╗██╔══██╗██║     ██╔══██╗██║  ██║██║████╗ ██║
	██╔████╔██║███████║██║  ██║█████╗    ██████╦╝ ╚████╔╝   ██║  ██║██║  ██║██║     ██████╔╝███████║██║██╔██╗██║
	██║╚██╔╝██║██╔══██║██║  ██║██╔══╝    ██╔══██╗  ╚██╔╝    ██║  ██║██║  ██║██║     ██╔═══╝ ██╔══██║██║██║╚████║
	██║ ╚═╝ ██║██║  ██║██████╔╝███████╗  ██████╦╝   ██║     ██████╔╝╚█████╔╝███████╗██║     ██║  ██║██║██║ ╚███║
	╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝  ╚═════╝    ╚═╝     ╚═════╝  ╚════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚══╝

	Script : 과속 감지
	Made by Dolphin_Server.Sukong
	Discord: discord.gg/dolphin
	Discord Tag: 수콩#1115
	- 2차 수정 및 배포는 허가 하나 2차 판매는 비허가 합니다.
	- 어떤분 께서 Dump File 일부 수정 후 판매가 확인되어 오픈소스로 배포합니다.
	
]]

dependency "vrp"

ui_page "html/index.html"

client_scripts{ 
	"@vrp/client/Tunnel.lua",
	"@vrp/client/Proxy.lua",
	"config.lua",
    "client.lua",
}

server_scripts{ 
	"@vrp/lib/utils.lua",
    "@vrp/lib/MySQL.lua",
  	"server.lua"
}

files {
	"html/*",
	"html/check.mp3"
}