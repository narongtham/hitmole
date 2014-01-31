isMolePositionIntersect = {}

function isMolePositionIntersect.evaluate(generatedPosition, target)
	if generatedPosition.x == target.x and generatedPosition.y == target.y then
		error("Detected intersect position")
	end
end

return isMolePositionIntersect