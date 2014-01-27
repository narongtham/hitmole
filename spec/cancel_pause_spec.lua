describe("cancelPause", function ( ... )

	local playAllMoles = require "playAllMoles"

	local cancelPause

	transition = {}
	pauseGame = {}
	storyboard = {}

	setup(function ( ... )
		stub(transition, "resume")
		stub(playAllMoles, "evaluate")
		stub(storyboard, "hideOverlay")

		cancelPause = require( "cancelPause" )
	end)

	teardown(function ( ... )
		playAllMoles.evaluate:revert()
	end)

	it("Resume transition", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.stub(transition.resume).was_called()
	end)

	it("Play every mole sprites", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.stub(playAllMoles.evaluate).was_called()
	end)

	it("Set isPause flag to false", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.are.False(isPause)
	end)

	it("Set pause button to visible", function ( ... )
		-- when
		cancelPause.evaluate()
		--then
		assert.are.True(pauseGame.isVisible)
	end)

	it("Fade out the pause menu scene", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.stub(storyboard.hideOverlay).was_called_with("fade")
	end)
end)