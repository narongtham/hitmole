describe("startReadySplashTimer", function ( ... )
	local startReadySplashTimer

	timer = {}
	local fakeTimerInstance
	local target = {}
	local splashImageSequenceData = {
		value = "img/sprite/ready/go.png"
	}

	setup(function ( ... )

		fakeTimerInstance = {
			params = {}
		}

		timer.performWithDelay = function ( ... )
			return fakeTimerInstance
		end
		spy.on(timer, "performWithDelay")

		onReadySplashTimerEnded = {}
		onReadySplashTimerEnded.evalaute = function ( ... )
		end

		readySplashConfigurations = {
			delay = 101
		}

		startReadySplashTimer = require("startReadySplashTimer")
	end)

	it("Start timer with proper parameters", function ( ... )
		-- when
		startReadySplashTimer.evaluate(target, splashImageSequenceData)
		-- then
		assert.spy(timer.performWithDelay).was_called_with(readySplashConfigurations.delay, onReadySplashTimerEnded.evaluate)
	end)

	it("Set target to timer's instance parameter", function ( ... )
		-- when
		startReadySplashTimer.evaluate(target, splashImageSequenceData)
		-- then
		assert.are.equal(fakeTimerInstance.params.target, target)
	end)

	it("Set sequenceData to timer's instance parameter", function ( ... )
		-- when
		startReadySplashTimer.evaluate(target, splashImageSequenceData)
		-- then
		assert.are.equal(fakeTimerInstance.params.imageSequenceData, splashImageSequenceData)
	end)
end)