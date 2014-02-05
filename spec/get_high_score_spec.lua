describe("getHighScore", function ( ... )
	local getHighScore

	setup(function ( ... )
		getHighScore = require( "getHighScore" )
	end)

	it("Return valure from highScore", function ( ... )
		-- given
		highScore = { value=5000 }
		-- when
		local result = getHighScore.evaluate()
		-- then
		assert.are.equal(result, highScore.value)
	end)
end)