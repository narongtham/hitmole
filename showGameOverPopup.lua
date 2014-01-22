showGameOverPopup = {}

function showGameOverPopup.show()
	storyboard.showOverlay( "gameOver", {effect = "fade" , isModal = true} )
	pauseGame.isVisible = false
end
return showGameOverPopup