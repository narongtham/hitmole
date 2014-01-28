describe("startGenerateMoleTimer", function ( ... )

	local startGenerateMoleTimer
	createSpawningMole = require("createSpawningMole")
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
		startGenerateMoleTimer = require("startGenerateMoleTimer")
		spy.on(timer, "performWithDelay")
		stub(createSpawningMole, "create")
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
		assert.spy(timer.performWithDelay).was_called_with(fakeRandomedTime, startGenerateMoleTimer.onTimerEnded)
	end)

	it("The global variable 'generateMoleTimer' should be set", function ( ... )
		-- when
		startGenerateMoleTimer.evaluate()
		-- then
		assert.are.same(generateMoleTimer, fakeTimerInstance)
	end)

	it("onTimer should call createSpawnMole", function ( ... )
		-- when
		startGenerateMoleTimer.onTimerEnded()
		-- then
		assert.stub(createSpawningMole.create).was_called()
	end)

	it("onTimer should call evaluate again", function ( ... )
		-- given
		spy.on(startGenerateMoleTimer, "evaluate")
		-- when
		startGenerateMoleTimer.onTimerEnded()
		--then
		assert.stub(startGenerateMoleTimer.evaluate).was_called()
	end)
end)