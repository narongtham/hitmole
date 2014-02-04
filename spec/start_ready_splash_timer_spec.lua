describe("startReadySplashTimer", function ( ... )
	local startReadySplashTimer

	timer = {}

	setup(function ( ... )
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
		startReadySplashTimer.evaluate()
		-- then
		assert.spy(timer.performWithDelay).was_called_with(1000, onReadySplashTimerEnded.evaluate)
	end)
end)