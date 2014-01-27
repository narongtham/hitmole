local removeAllLifePoints = removeAllLifePoints or require "removeAllLifePoints"
local removeAllMoles = removeAllMoles or require "removeAllMoles"

showMainMenuButton = {}

function showMainMenuButton.show(group, yPosition)
	local mainMenuButton = widget.newButton {
		id="mainMenu",
		defaultFile="img/button/main_menu.png",
		overFile="img/button/main_menu_down.png",
		onRelease=showMainMenuButton.onRelease
	}

	mainMenuButton.x = DISPLAY_CENTER_X
	mainMenuButton.y = yPosition

	group:insert(mainMenuButton)
end

function showMainMenuButton.onRelease(event)

	storyboard.gotoScene("menuScene",{
		effect = "fade",
		time = 500,
		onComplete = showMainMenuButton.purgeGameScene
	})

	audio.fadeOut( {channel=1,time=500})

	removeAllLifePoints.evaluate()
	removeAllMoles.evaluate()
end

function showMainMenuButton.purgeGameScene(event)
	storyboard.purgeScene( "gameScene" )
end

return showMainMenuButton