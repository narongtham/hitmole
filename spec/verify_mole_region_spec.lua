describe("verifyMoleRegion", function ( ... )
	local verifyMoleRegion
	local targetMole = { x=100,y=100,contentWidth=20,contentHeight=20}
	local generatedPosition = {}

	setup(function ( ... )
		isMolePositionIntersect = {
			evaluate = function ( ... )
				-- body
			end
		}
		spy.on(isMolePositionIntersect, "evaluate")

		verifyMoleRegion = require("verifyMoleRegion")
	end)

	it("Evaluate isMolePositionIntersect for actual region", function ( ... )
		-- when
		verifyMoleRegion.evaluate(generatedPosition, targetMole)
		-- then
		assert.spy(isMolePositionIntersect.evaluate).was_called_with(generatedPosition, { x=100,y=100,contentWidth=20,contentHeight=20})
	end)

	it("Evaluate isMolePositionIntersect for left region", function ( ... )
		-- when
		verifyMoleRegion.evaluate(generatedPosition, targetMole)
		-- then
		assert.spy(isMolePositionIntersect.evaluate).was_called_with(generatedPosition, { x=90,y=100,contentWidth=20,contentHeight=20})
	end)

	it("Evaluate isMolePositionIntersect for right region", function ( ... )
		-- when
		verifyMoleRegion.evaluate(generatedPosition, targetMole)
		-- then
		assert.spy(isMolePositionIntersect.evaluate).was_called_with(generatedPosition, { x=110,y=100,contentWidth=20,contentHeight=20})
	end)

	it("Evaluate isMolePositionIntersect for top region", function ( ... )
		-- when
		verifyMoleRegion.evaluate(generatedPosition, targetMole)
		-- then
		assert.spy(isMolePositionIntersect.evaluate).was_called_with(generatedPosition, { x=100,y=90,contentWidth=20,contentHeight=20})
	end)

	it("Evaluate isMolePositionIntersect for bottom region", function ( ... )
		-- when
		verifyMoleRegion.evaluate(generatedPosition, targetMole)
		-- then
		assert.spy(isMolePositionIntersect.evaluate).was_called_with(generatedPosition, { x=100,y=110,contentWidth=20,contentHeight=20})
	end)
end)