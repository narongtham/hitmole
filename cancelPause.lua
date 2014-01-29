local playAllMoles = playAllMoles or require("playAllMoles")
local resumeGenerateMoleTimer = resumeGenerateMoleTimer or require("resumeGenerateMoleTimer")

cancelPause = {}

function cancelPause.evaluate()
	transition.resume( )
	playAllMoles.evaluate()
	isPause = false
	pauseGame.isVisible = true
	storyboard.hideOverlay( "fade" )
	resumeGenerateMoleTimer.evaluate()
end
return cancelPause