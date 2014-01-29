describe("resumeGenerateMoleTimer", function ( ... )
	local resumeGenerateMoleTimer

	timer = {}

	setup(function ( ... )
		generateMoleTimer = {}
		stub(timer, "resume")

		resumeGenerateMoleTimer = require("resumeGenerateMoleTimer")
	end	)

	it("Call timer for current generate mole timer", function ( ... )
		-- when
		resumeGenerateMoleTimer.evaluate()
		-- then
		assert.stub(timer.resume).was_called_with(generateMoleTimer)
	end)
end)