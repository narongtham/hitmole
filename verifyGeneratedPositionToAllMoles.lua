verifyGeneratedPositionToAllMoles = {}

verifyMoleRegion = verifyMoleRegion or require("verifyMoleRegion")
moleContainer = moleContainer or require("moleContainer")

function verifyGeneratedPositionToAllMoles.evaluate(generatedPosition)
	for iterateMole in pairs(moleContainer) do
		verifyMoleRegion.evaluate(generatedPosition, iterateMole)
	end
end

return verifyGeneratedPositionToAllMoles