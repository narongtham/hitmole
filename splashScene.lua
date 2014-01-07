-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
-- end header
-- open value
-- end value

-- create center
local centerX = display.contentCenterX
local centerY = display.contentCenterY
-- end create center

function scene:createScene(e)
	local view = self.view
	local bg = display.newRect(0,0,640,1136)
	bg:setFillColor( 0,0,0 )
	view:insert(bg)

	local logo = display.newImageRect("img/v.jpg",200,260)
	logo.x = centerX
	logo.y = centerY
	logo.alpha = 0
	view:insert(logo)

	transition.to( logo , {time = 1000 , xScale = 1, yScale = 1, alpha = 1} )
	timer.performWithDelay( 2000, toMenu )

	--print( "hello world!!!!" )
	
end

function scene:enterScene(e)
end

function scene:exitScene(e) 
end


function toMenu()
	storyboard.gotoScene("sceneMenu",{
	effect = "fade",
	time = 500,
	})
end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene