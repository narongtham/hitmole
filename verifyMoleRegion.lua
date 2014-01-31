verifyMoleRegions = {}

function verifyMoleRegions.evaluate(generatePosition, targetMole)
	local targetMoleMetadata = {
		x = targetMole.x,
		y = targetMole.y,
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}

	isMolePositionIntersect.evaluate(generatePosition, targetMoleMetadata)

	local leftMoleMetadata = {
		x = targetMole.x-(targetMole.contentWidth/2),
		y = targetMole.y,
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}
	isMolePositionIntersect.evaluate(generatePosition, leftMoleMetadata)

	local rightMoleMetadata = {
		x = targetMole.x+(targetMole.contentWidth/2),
		y = targetMole.y,
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}
	isMolePositionIntersect.evaluate(generatePosition, rightMoleMetadata)

	local topMoleMetadata = {
		x = targetMole.x,
		y = targetMole.y-(targetMole.contentHeight/2),
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}
	isMolePositionIntersect.evaluate(generatePosition, topMoleMetadata)

	local bottomMoleMetadata = {
		x = targetMole.x,
		y = targetMole.y+(targetMole.contentHeight/2),
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}
	isMolePositionIntersect.evaluate(generatePosition, bottomMoleMetadata)
end

return verifyMoleRegions