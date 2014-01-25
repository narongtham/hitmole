describe("cancelPause", function ( ... )

	local cancelPause = require( "cancelPause" )

	transition = {}
	mole = {}
	pauseGame = {}

	setup(function ( ... )
		stub(transition, "resume")
		stub(mole, "play")
	end)

	it("Resume transition", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.stub(transition.resume).was_called()
	end)

	it("Play mole sprite", function ( ... )
		-- when
		cancelPause.evaluate()
		-- then
		assert.stub(mole.play).was_called_with(mole)
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
end)