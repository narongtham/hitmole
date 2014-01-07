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
	local group = self.view
	local bg = display.newRect(0,0,640,1136)
	bg.x = centerX
	bg.y = centerY
	bg:setFillColor( 1,1,1 )
	group:insert(bg)
end

function scene:enterScene(e)
	local group = self.view
	showLogo(view)
	group:insert(logo)
end

function scene:exitScene(e) 
end



function showLogo(view)
	--local group = self.view
	logo = display.newImageRect("img/logo.jpg",562,337)
	logo.x = centerX + 15
	logo.y = 200
	logo.alpha = 0
	transition.to( logo, {time = 1000, alpha = 1, onComplete = showMenu} )
	
end

function showMenu()
	--local view = self.view
	local font = "Helvetica" or native.systemFont
	startGame = display.newText("Tab to Start game",0,0,font,50)
	startGame:setFillColor( 0.7, 0.7, 0.7)
	startGame.x = centerX
	startGame.y = 800
	startGame.alpha = 0
	--view:insert(startGame)

	transition.to(startGame,{time = 1000, alpha =1})
	startGame:addEventListener("tap",startG)

end

function startG()
	startGame = display.remove(startGame)
	storyboard.gotoScene("sceneGame",{
		effect = "fade",
		time = 1000
	})
end



scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene