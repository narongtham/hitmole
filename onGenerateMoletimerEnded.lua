onGenerateMoleTimerEnded = {}

generateMolePosition = generateMolePosition or require("generateMolePosition")
createSpawningMole = createSpawningMole or require("createSpawningMole")
startGenerateMoleTimer = startGenerateMoleTimer or require("startGenerateMoleTimer")
isMoleLimitExceed = isMoleLimitExceed or require("isMoleLimitExceed")
verifyGeneratedPositionToAllMoles = verifyGeneratedPositionToAllMoles or require("verifyGeneratedPositionToAllMoles")

function onGenerateMoleTimerEnded.evaluate()
	local generatedMolePosition = generateMolePosition.generate()
	if pcall(onGenerateMoleTimerEnded.verify, generatedMolePosition) then
		createSpawningMole.create(generatedMolePosition)
	end
	startGenerateMoleTimer.evaluate()
end

function onGenerateMoleTimerEnded.verify(position)
	verifyGeneratedPositionToAllMoles.evaluate(position)
	isMoleLimitExceed.evaluate()
end

return onGenerateMoleTimerEnded