describe("gameOverScene", function ( ... )

	local showGameOverPopup = require "showGameOverPopup"
	storyboard = {
		showOverlay = function ( ... ) end
	}
	pauseGame = {}

	it("Should show game over overlay screen", function ( ... )
		--given
		stub(storyboard, "showOverlay")
		--when
		showGameOverPopup.show()
		--then
		assert.stub(storyboard.showOverlay).was_called_with("gameOver", {effect = "fade" , isModal = true})
	end)

	it("Should hide pause button", function ( ... )
		--when
		showGameOverPopup.show()
		--then
		assert.are.equal(pauseGame.isVisible, false)
	end)
end)