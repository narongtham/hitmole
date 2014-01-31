isMolePositionIntersect = {}

function isMolePositionIntersect.evaluate(generatedPosition, target)
	if generatedPosition.x == target.x and generatedPosition.y == target.y then
		error("Detected intersect position")
	end

	if generatedPosition.x >= target.x - (target.contentWidth/2) and generatedPosition.x <= target.x + (target.contentWidth/2) then
		if generatedPosition.y >= target.y - (target.contentHeight/2) and generatedPosition.y <= target.y +(target.contentHeight/2) then
			error("Detected intersect position")
		end
	end
end

return isMolePositionIntersect