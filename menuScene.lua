-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
g = nil
-- end header


function scene:createScene(e)
	local group = self.view
	g = group
	local bg = display.newImageRect("img/menuBg.jpg",
		CONTENT_WIDTH,
		CONTENT_HEIGHT)
	bg.x = DISPLAY_CENTER_X
	bg.y = DISPLAY_CENTER_Y
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
	logo.x = DISPLAY_CENTER_X 
	logo.y = 300
	logo.alpha = 0
	transition.to( logo, {time = 1000, alpha = 1, onComplete = showMenu} )
	
end

function showMenu()
	startBtn = display.newImageRect( "img/startBtn.png",  303, 196 )
	startBtn.x = DISPLAY_CENTER_X
	startBtn.y = 900
	startBtn.alpha = 0
	g:insert(startBtn)

	transition.to(startBtn,{time = 1000, alpha =1})
	startBtn:addEventListener("tap",startG1)

end

function startG1( event )
	transition.to( startBtn, {time = 80, yScale = 0.8} )
	transition.to( startBtn, {time = 80, delay = 80, yScale = 1.2} )
	transition.to( startBtn, {time = 80, delay = 160, yScale = 1, onComplete = startG} )
end

function startG()
	
	--startBtn = display.remove(startBtn)
	storyboard.gotoScene("gameScene",{
		effect = "fade",
		time = 500
	})
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene