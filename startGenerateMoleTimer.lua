createSpawningMole = createSpawningMole or require("createSpawningMole")
onGenerateMoleTimerEnded = onGenerateMoleTimerEnded or require("onGenerateMoleTimerEnded")

startGenerateMoleTimer = {}

function startGenerateMoleTimer.evaluate()
	math.randomseed( os.time(  ) )
	local interval = math.random( 100, 1000)
	generateMoleTimer = timer.performWithDelay( interval, onGenerateMoleTimerEnded.evaluate )
end

return startGenerateMoleTimer