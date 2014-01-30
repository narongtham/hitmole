onGenerateMoleTimerEnded = {}

generateMolePosition = generateMolePosition or require("generateMolePosition")
createSpawningMole = createSpawningMole or require("createSpawningMole")
startGenerateMoleTimer = startGenerateMoleTimer or require("startGenerateMoleTimer")
isMoleLimitExceed = isMoleLimitExceed or require("isMoleLimitExceed")

function onGenerateMoleTimerEnded.evaluate()
	if pcall(isMoleLimitExceed.evaluate) then
		local generatedMolePosition = generateMolePosition.generate()
		createSpawningMole.create(generatedMolePosition)
	end
	startGenerateMoleTimer.evaluate()
end

return onGenerateMoleTimerEnded