describe("onReadySplashTimerEnded", function ( ... )
	local onReadySplashTimerEnded
	local event
	local target = {}
	local splashImageSequenceData = {
		value = "img/sprite/ready/go.png"
	}

	setup(function ( ... )
		display = {}
		stub(display, "remove")

		event = {
			source = {
				params = {
					target = target,
					imageSequenceData = splashImageSequenceData
				}
			}
		}

		startGenerateMoleTimer = {}
		stub(startGenerateMoleTimer, "evaluate")

		showReadySplash = {}
		stub(showReadySplash, "evaluate")

		onReadySplashTimerEnded = require("onReadySplashTimerEnded")
	end)

	it("Remove ready splash image", function ( ... )
		-- when
		onReadySplashTimerEnded.evaluate(event)
		-- then
		assert.stub(display.remove).was_called_with(target)
	end)

	it("Start generate mole timer when no next sequence", function ( ... )
		-- given
		splashImageSequenceData.next = nil
		-- when
		onReadySplashTimerEnded.evaluate(event)
		-- then
		assert.stub(startGenerateMoleTimer.evaluate).was_called()
	end)

	it("Evaluate showReadySplash with next sequence if available.", function ( ... )
		-- given
		currentViewGroup = {}
		splashImageSequenceData.next = {}
		-- when
		onReadySplashTimerEnded.evaluate(event)
		-- then
		assert.stub(showReadySplash.evaluate).was_called_with(currentViewGroup, splashImageSequenceData.next)
	end)
end)