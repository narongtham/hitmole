-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
-- end header


function scene:createScene(e)
	local group = self.view
	local bg = display.newRect(DISPLAY_CENTER_X,
		DISPLAY_CENTER_Y,
		600,
		800)
	bg:setFillColor( 0,0,0 )
	group:insert(bg)

	local logo = display.newImageRect("img/kongDev.jpg",600,488)
	logo.x = DISPLAY_CENTER_X
	logo.y = DISPLAY_CENTER_Y - 300
	logo.alpha = 1
	logo.xScale = 0.5
	logo.yScale = 0.5
	group:insert(logo)

	local font = "Helvetica" or native.systemFont
	local optionTitle = display.newText(  "Option" , 0,0,font,48 )
	optionTitle.x = DISPLAY_CENTER_X
	optionTitle.y = DISPLAY_CENTER_Y
	group:insert(optionTitle)

	local backTxt = display.newText(  "back" , 0,0,font,36 )
	backTxt.x = DISPLAY_CENTER_X
	backTxt.y = DISPLAY_CENTER_Y + 100
	backTxt:addEventListener( "tap", backToGame )
	group:insert(backTxt)


	
end

function backToGame( event )
	pauseAll()
	storyboard.hideOverlay( "fade" )

	return true
end



scene:addEventListener("createScene",scene)


return scene