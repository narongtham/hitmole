removeAllLifePoints = {}

function removeAllLifePoints.evaluate()
	for i = 1, escapeCount do
		display.remove( lifePoints[i] )
	end

	escapeCount = 0
end

return removeAllLifePoints