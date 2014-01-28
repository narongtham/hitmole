describe("pauseGenerateMoletimer", function ( ... )
	local pauseGenerateMoletimer

	setup(function ( ... )
		generateMoleTimer = {}
		stub(generateMoleTimer, "pause")

		pauseGenerateMoletimer = require("pauseGenerateMoletimer")
	end)

	it("Call pause on generateMoleTimer", function ( ... )
		-- when
		pauseGenerateMoletimer.evaluate()
		-- then
		assert.stub(generateMoleTimer.pause).was_called()
	end)
end)