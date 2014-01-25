removeAllLifePoints = {}

function removeAllLifePoints.evaluate()
	for i = 1, escapeCount do
		display.remove( lifePoints[i] )
	end
end

return removeAllLifePoints