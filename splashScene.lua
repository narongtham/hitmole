-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
-- end header


function scene:createScene(e)
	local group = self.view
	local bg = display.newRect(centerX,centerY,contentWidth ,contentHeight)
	bg:setFillColor( 0,0,0 )
	group:insert(bg)

	local logo = display.newImageRect("img/kongDev.jpg",600,488)
	logo.x = centerX
	logo.y = centerY
	logo.alpha = 0
	group:insert(logo)

	transition.to( logo , {time = 1000 , xScale = 1, yScale = 1, alpha = 1} )
	timer.performWithDelay( 2000, toMenu )
	
end


function toMenu()
	transition.to( logo , {time = 1000 , xScale = 1, yScale = 1, alpha = 0} )
	storyboard.gotoScene("sceneMenu",{
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