-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
-- end header


function scene:createScene(e)
	local group = self.view
	local bg = display.newImageRect("img/menuBg.jpg",contentWidth ,contentHeight)
	bg.x = centerX
	bg.y = centerY
	group:insert(bg)

end

function scene:enterScene(e)
	local group = self.view
	showLogo(view)
	group:insert(logo)
end

function scene:exitScene(e) 
	storyboard.purgeScene( "sceneMenu" )
end

function showLogo(view)
	logo = display.newImageRect("img/logo.png",659,330)
	logo.x = centerX 
	logo.y = 300
	logo.alpha = 0
	transition.to( logo, {time = 1000, alpha = 1, onComplete = showMenu} )
	
end

function showMenu()
	startBtn = display.newImageRect( "img/startBtn.png",  303, 196 )
	startBtn.x = centerX
	startBtn.y = 900
	startBtn.alpha = 0

	transition.to(startBtn,{time = 1000, alpha =1})
	startBtn:addEventListener("tap",startG)

end

function startG()
	startBtn = display.remove(startBtn)
	storyboard.gotoScene("gameScene",{
		effect = "fade",
		time = 1000
	})
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene