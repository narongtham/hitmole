cancelPause = {}

function cancelPause.evaluate()
	transition.resume( )
	mole:play( )
	isPause = false
	pauseGame.isVisible = true
	storyboard.hideOverlay( "fade" )
end
return cancelPause