decreaseLifePoint = {}

function decreaseLifePoint.decreaseByOne()
	display.remove( lifePoints[escapeCount] )
	escapeCount = escapeCount-1
end

return decreaseLifePoint