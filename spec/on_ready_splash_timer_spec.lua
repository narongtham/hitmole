describe("onReadySplashTimerEnded", function ( ... )
	local onReadySplashTimerEnded
	local event
	local target = {}

	setup(function ( ... )
		display = {}
		stub(display, "remove")

		event = {
			source = {
				params = {
					target = target
				}
			}
		}

		onReadySplashTimerEnded = require("onReadySplashTimerEnded")
	end)

	it("Remove ready splash image", function ( ... )
		-- when
		onReadySplashTimerEnded.evaluate(event)
		-- then
		assert.stub(display.remove).was_called_with(target)
	end)

	it("Start generate mole timer")
end)