cancelPause = {}

function cancelPause.evaluate()
	transition.resume( )
	mole:play( )
	isPause = false
	pauseGame.isVisible = true
end
return cancelPause