describe("pauseGenerateMoletimer", function ( ... )
	local pauseGenerateMoletimer

	timer = {}

	setup(function ( ... )
		generateMoleTimer = {}
		stub(timer, "pause")

		pauseGenerateMoletimer = require("pauseGenerateMoleTimer")
	end)

	it("Call pause on generateMoleTimer", function ( ... )
		-- when
		pauseGenerateMoletimer.evaluate()
		-- then
		assert.stub(timer.pause).was_called_with(generateMoleTimer)
	end)
end)