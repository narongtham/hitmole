showGameOverPopup = {}

function showGameOverPopup.show()
	storyboard.showOverlay( "gameOverScene", {effect = "fade" , isModal = true} )
	pauseGame.isVisible = false
	scoreTxt.isVisible = false
end
return showGameOverPopup