-- header 
local scene = storyboard.newScene("menuScene")
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

	logo = display.newImageRect("img/logo.png",659,330)
	logo.x = DISPLAY_CENTER_X 
	logo.y = 300
	logo.alpha = 0
	group:insert(logo)

	startBtn = display.newImageRect( "img/startBtn.png",  303, 196 )
	startBtn.x = DISPLAY_CENTER_X
	startBtn.y = 900
	startBtn.alpha = 0
	group:insert(startBtn)
end

function scene:enterScene(e)
	local group = self.view
	startBtn.alpha = 0
	showLogo(view)
end

function scene:exitScene(e) 
	--storyboard.purgeScene( "menuScene" )
end

function showLogo(view)
	transition.to( logo, {time = 1000, alpha = 1, onComplete = showMenu} )
end

function showMenu()
	transition.to(startBtn,{time = 1000, alpha =1})
	startBtn:addEventListener("tap",startG1	)
end

function startG1( event )
	startBtn:removeEventListener( "tap", startG1 )
	transition.to( startBtn, {time = 80, yScale = 0.8} )
	transition.to( startBtn, {time = 80, delay = 80, yScale = 1.2} )
	transition.to( startBtn, {time = 80, delay = 160, yScale = 1, onComplete = startG} )
end

function startG()
	
	--startBtn = display.remove(startBtn)
	storyboard.gotoScene("gameScene",{
		effect = "fade",
		time = 500,
		onComplete = purgeScene
	})
end

function purgeScene(event)
	storyboard.purgeScene( "menuScene" )
end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene