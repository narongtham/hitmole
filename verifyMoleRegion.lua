isMolePositionIntersect = isMolePositionIntersect or require("isMolePositionIntersect")

verifyMoleRegions = {}

function verifyMoleRegions.evaluate(generatePosition, targetMole)
	verifyMoleRegions.verifyOnActualRegion(generatePosition, targetMole)
	verifyMoleRegions.verifyOnLeftRegion(generatePosition, targetMole)
	verifyMoleRegions.verifyOnRightRegion(generatePosition, targetMole)
	verifyMoleRegions.verifyOnTopRegion(generatePosition, targetMole)
	verifyMoleRegions.verifyOnBottomRegion(generatePosition, targetMole)
end

function verifyMoleRegions.createMoleMetadata(targetMole)
	return {
		x = targetMole.x,
		y = targetMole.y,
		contentWidth = targetMole.contentWidth,
		contentHeight = targetMole.contentHeight
	}
end

function verifyMoleRegions.verifyOnActualRegion(generatePosition, targetMole)
	local targetMoleMetadata = verifyMoleRegions.createMoleMetadata(targetMole)
	isMolePositionIntersect.evaluate(generatePosition, targetMoleMetadata)
end

function verifyMoleRegions.verifyOnLeftRegion(generatePosition, targetMole)
	local leftMoleMetadata = verifyMoleRegions.createMoleMetadata(targetMole)
	leftMoleMetadata.x = targetMole.x-(targetMole.contentWidth/2),
	isMolePositionIntersect.evaluate(generatePosition, leftMoleMetadata)
end

function verifyMoleRegions.verifyOnRightRegion(generatePosition, targetMole)
	local rightMoleMetadata = verifyMoleRegions.createMoleMetadata(targetMole)
	rightMoleMetadata.x = targetMole.x+(targetMole.contentWidth/2),
	isMolePositionIntersect.evaluate(generatePosition, rightMoleMetadata)
end

function verifyMoleRegions.verifyOnTopRegion(generatePosition, targetMole)
	local topMoleMetadata = verifyMoleRegions.createMoleMetadata(targetMole)
	topMoleMetadata.y = targetMole.y-(targetMole.contentHeight/2)
	isMolePositionIntersect.evaluate(generatePosition, topMoleMetadata)
end

function verifyMoleRegions.verifyOnBottomRegion(generatePosition, targetMole)
	local bottomMoleMetadata = verifyMoleRegions.createMoleMetadata(targetMole)
	bottomMoleMetadata.y = targetMole.y+(targetMole.contentHeight/2)
	isMolePositionIntersect.evaluate(generatePosition, bottomMoleMetadata)
end

return verifyMoleRegions