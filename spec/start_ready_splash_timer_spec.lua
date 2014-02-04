describe("startReadySplashTimer", function ( ... )
	local startReadySplashTimer

	timer = {}
	local fakeTimerInstance
	local target = {}
	setup(function ( ... )

		fakeTimerInstance = {}

		timer.performWithDelay = function ( ... )
			return fakeTimerInstance
		end
		spy.on(timer, "performWithDelay")

		onReadySplashTimerEnded = {}
		onReadySplashTimerEnded.evalaute = function ( ... )
			-- body
		end

		startReadySplashTimer = require("startReadySplashTimer")
	end)

	it("Start timer with proper parameters", function ( ... )
		-- when
		startReadySplashTimer.evaluate(target)
		-- then
		assert.spy(timer.performWithDelay).was_called_with(1000, onReadySplashTimerEnded.evaluate)
	end)

	it("Set target to timer's instance parameter", function ( ... )
		-- when
		startReadySplashTimer.evaluate(target)
		-- then
		assert.are.equal(fakeTimerInstance.source.parameters.target, target)
	end)
end)