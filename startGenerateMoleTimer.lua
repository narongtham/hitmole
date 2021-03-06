startGenerateMoleTimer = {}

createSpawningMole = createSpawningMole or require("createSpawningMole")
onGenerateMoleTimerEnded = onGenerateMoleTimerEnded or require("onGenerateMoleTimerEnded")

function startGenerateMoleTimer.evaluate()
	local interval = math.random( 0, 100)
	generateMoleTimer = timer.performWithDelay( interval, onGenerateMoleTimerEnded.evaluate )
end

return startGenerateMoleTimer