isMolePositionIntersect = {}

function isMolePositionIntersect.evaluate(generatedPosition, target)
	if generatedPosition.x == target.x and generatedPosition.y == target.y then
		error("Detected intersect position")
	end

	local rangeWidth = (target.contentWidth/2)
	local rangeHeight = (target.contentHeight/2)
	local leftMost = target.x - rangeWidth
	local rightMost = target.x + rangeWidth
	local topMost = target.y - rangeHeight
	local bottomMost = target.y + rangeHeight

	if generatedPosition.x >= leftMost and generatedPosition.x <= rightMost then
		if generatedPosition.y >= topMost and generatedPosition.y <= bottomMost then
			error("Detected intersect position")
		end
	end
end

return isMolePositionIntersect