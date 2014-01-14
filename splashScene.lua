local splashScene = {}

	function splashScene.new( ... )
		splashScene.scene = storyboard.newScene()
	end

return splashScene

function scene:createScene(e)
	local group = self.view
	local bg = display.newRect(DISPLAY_CENTER_X,
		DISPLAY_CENTER_Y,
		CONTENT_WIDTH,
		CONTENT_HEIGHT)
	bg:setFillColor( 0,0,0 )
	group:insert(bg)

	local logo = display.newImageRect("img/kongDev.jpg",600,488)
	logo.x = DISPLAY_CENTER_X
	logo.y = DISPLAY_CENTER_Y
	logo.alpha = 0
	group:insert(logo)

	transition.to( logo , {time = 1000 , xScale = 1, yScale = 1, alpha = 1} )
	timer.performWithDelay( 2000, toMenu )
	
end


function toMenu()
	transition.to( logo , {time = 1000 , xScale = 1, yScale = 1, alpha = 0} )
	storyboard.gotoScene("menuScene",{
	effect = "fade",
	time = 500,
	onComplete = purgeS
	})
	
end
function purgeS( )
	storyboard.purgeScene( "splashScene" )
end

scene:addEventListener("createScene",scene)


return scene