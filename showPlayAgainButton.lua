--local widget = widget or require("widget")

showPlayAgainButton = {}

function showPlayAgainButton.show(group)
	local playAgainButton = widget.newButton {
		id="playAgain",
		defaultFile="img/button/play_again.png",
		overFile="img/button/play_again_down.png",
		onRelease=showPlayAgainButton.onPlayAgain
	}
	playAgainButton.x = DISPLAY_CENTER_X
	playAgainButton.y = 720

	group:insert( playAgainButton )
end

function showPlayAgainButton.onPlayAgain(event)
	storyboard.reloadScene()
end

return showPlayAgainButton