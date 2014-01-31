describe("isMolePositionIntersect", function ( ... )
	local isMolePositionIntersect

	local generatedMolePosition
	local targetMole = { x=100,y=100,contentWidth=20,contentHeight=20}

	setup(function ( ... )
		isMolePositionIntersect = require("isMolePositionIntersect")
	end)

	local intersectPositions = {
		{ x=100, y=100},
		{ x=90, y=90},
		{ x=100, y=90},
		{ x=110, y=90},
		{ x=90, y=100},
		{ x=110, y=100},
		{ x=90, y=110},
		{ x=100, y=110},
		{ x=110, y=110}
	}

	for index, generatedPosition in pairs(intersectPositions) do
		it("Should throw error when  given x="..generatedPosition.x.." and y="..generatedPosition.y, function ( ... )
			-- when
			local evaluating = function ( ... )
				isMolePositionIntersect.evaluate(generatedPosition, targetMole)
			end
			-- then
			assert.has_error(evaluating, "Detected intersect position")
		end)
	end

	local nonintersectPositions = {
		{ x=90, y=89},
		{ x=89, y=90},
		{ x=89, y=89},
		{ x=100, y=89},
		{ x=110, y=89},
		{ x=111, y=90},
		{ x=111, y=100},
		{ x=111, y=109},
		{ x=110, y=111},
		{ x=100, y=111},
		{ x=90, y=111},
		{ x=89, y=110},
		{ x=89, y=100}
	}

	for index, generatedPosition in pairs(nonintersectPositions) do
		it("Should not throw error when  given x="..generatedPosition.x.." and y="..generatedPosition.y, function ( ... )
			-- when
			local evaluating = function ( ... )
				isMolePositionIntersect.evaluate(generatedPosition, targetMole)
			end
			-- then
			assert.has_no_error(evaluating, "Detected intersect position")
		end)
	end
end)