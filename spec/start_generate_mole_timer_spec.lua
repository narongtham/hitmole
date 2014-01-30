describe("startGenerateMoleTimer", function ( ... )

	local startGenerateMoleTimer

	onGenerateMoleTimerEnded = require("onGenerateMoleTimerEnded")

	timer = {}
	fakeRandomedTime = 101
	fakeTimerInstance = {}

	setup(function ( ... )
		math.random = function ( ... )
			return fakeRandomedTime
		end
		timer.performWithDelay = function ( ... )
			return fakeTimerInstance
		end
		
		spy.on(timer, "performWithDelay")
		stub(createSpawningMole, "create")

		startGenerateMoleTimer = require("startGenerateMoleTimer")
	end)

	teardown(function ( ... )
		createSpawningMole.create:revert()
	end)

	it("Should call generate randomed seed", function ( ... )
		--given
		spy.on(math, "randomseed")
		--when
		startGenerateMoleTimer.evaluate()
		--then
		assert.spy(math.randomseed).was_called_with(os.time())
	end)

	it("Should generate randomed time interval for spawning mole", function ( ... )
		--given
		spy.on(math, "random")
		--when
		startGenerateMoleTimer.evaluate()
		--then
		assert.spy(math.random).was_called_with(100, 1000)
	end)

	it("Start timer using randomed time and it will call onTimer when done", function ( ... )
		-- when
		startGenerateMoleTimer.evaluate()
		-- then
		assert.spy(timer.performWithDelay).was_called_with(fakeRandomedTime, onGenerateMoleTimerEnded.evaluate)
	end)

	it("The global variable 'generateMoleTimer' should be set", function ( ... )
		-- when
		startGenerateMoleTimer.evaluate()
		-- then
		assert.are.same(generateMoleTimer, fakeTimerInstance)
	end)

end)