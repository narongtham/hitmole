local createSpawningMole = createSpawningMole or require("createSpawningMole")

startGenerateMoleTimer = {}

function startGenerateMoleTimer.evaluate()
	math.randomseed( os.time(  ) )
	local interval = math.random( 100, 1000)
	generateMoleTimer = timer.performWithDelay( interval, startGenerateMoleTimer.onTimerEnded )
end

function startGenerateMoleTimer.onTimerEnded( ... )
	createSpawningMole.create()
	startGenerateMoleTimer.evaluate()
end

return startGenerateMoleTimer