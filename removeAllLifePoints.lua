removeAllLifePoints = {}

function removeAllLifePoints.evaluate()
	while escapeCount > 0 do
		display.remove( lifePoints[escapeCount] )
		escapeCount = escapeCount-1
	end
end

return removeAllLifePoints