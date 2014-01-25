describe("DecreaseLifePoint spec", function ( ... )

	local decreaseLifePoint = require "decreaseLifePoint"

	display = {}
	lifePoints = {{}, {}, {}}
	

	it("It should decrease escape count.", function ( ... )
		--given
		stub(display, "remove")
		escapeCount = 3
		--when
		decreaseLifePoint.decreaseByOne()
		--then
		assert.are.equal(escapeCount, 2)
	end)

	it("It should remove one lifepoint indicator from remaining lifepoint indicators", function ( ... )
		--given
		stub(display, "remove")
		escapeCount = 3
		--when
		decreaseLifePoint.decreaseByOne()
		--then
		assert.stub(display.remove).was_called_with(lifePoints[escapeCount])
	end)
end)