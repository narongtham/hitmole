describe("isMolePositionIntersect", function ( ... )
	local isMolePositionIntersect

	local generatedMolePosition
	local targetMole = { x=100,y=100,contentWidth=20,contentHeight=20}

	setup(function ( ... )
		isMolePositionIntersect = require("isMolePositionIntersect")
	end)

	it("Should throw error when a 1st given point same as given target mole", function ( ... )
		--given
		generatedMolePosition = { x=100,y=100}
		-- when
		local evaluating = function ( ... )
			isMolePositionIntersect.evaluate(generatedMolePosition, targetMole)
		end
		-- then
		assert.has_error(evaluating, "Detected intersect position")
	end)
end)