cancelPause = cancelPause or require "cancelPause"

showBackToGameButton = {}

function showBackToGameButton.show(group, yPosition)
	local backToGameButton = widget.newButton( {
		id="mainMenu",
		defaultFile="img/button/resume.png",
		overFile="img/button/resume_down.png",
		onRelease=showBackToGameButton.onRelease
	})

	backToGameButton.x = DISPLAY_CENTER_X
	backToGameButton.y = yPosition

	group:insert( backToGameButton )
end

function showBackToGameButton.onRelease( ... )
	cancelPause.evaluate()
end

return showBackToGameButton