local storyboard = storyboard or require("storyboard")  
local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
local showEndingImage = require "showEndingImage"
local showPlayAgainButton = require "showPlayAgainButton"
local showMainMenuButton = require "showMainMenuButton"
checkHighScore = checkHighScore or require("checkHighScore")
showAds = showAds or require("showAds")

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	showGameOverBackgroundImage.show(group)
	showEndingImage.show(group)
	showPlayAgainButton.show(group)
	showMainMenuButton.show(group, 940)
end

function scene:enterScene(e)
	checkHighScore.evaluate(self.view)
	showAds.evaluate()
end

function scene:exitScene( ... )
	ads.hide( )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene