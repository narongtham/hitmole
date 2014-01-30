onGenerateMoleTimerEnded = {}

generateMolePosition = generateMolePosition or require("generateMolePosition")
createSpawningMole = createSpawningMole or require("createSpawningMole")
startGenerateMoleTimer = startGenerateMoleTimer or require("startGenerateMoleTimer")

function onGenerateMoleTimerEnded.evaluate()
	local generatedMolePosition = generateMolePosition.generate()
	createSpawningMole.create(generatedMolePosition)
	startGenerateMoleTimer.evaluate()
end

return onGenerateMoleTimerEnded