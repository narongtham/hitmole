local playAllMoles = playAllMoles or require("playAllMoles")

cancelPause = {}

function cancelPause.evaluate()
	transition.resume( )
	playAllMoles.evaluate()
	isPause = false
	pauseGame.isVisible = true
	storyboard.hideOverlay( "fade" )
end
return cancelPause