describe("DecreaseLifePoint spec", function ( ... )

	local decreaseLifePoint = require "decreaseLifePoint"

	display = {}
	heart = { {}, {}, {}}
	escapeCount = 3

	it("It should decrease escape count.", function ( ... )
		--given
		stub(display, "remove")
		--when
		decreaseLifePoint.decreaseByOne()
		--then
		--assert.stub(display.remove).was_called_with(heart[escapeCount])
		assert.are.equal(escapeCount, 2)
	end)

	it("It should remove one lifepoint indicator from remaining lifepoint indicators", function ( ... )
		--given
		stub(display, "remove")
		--when
		decreaseLifePoint.decreaseByOne()
		--then
		assert.stub(display.remove).was_called_with(heart[escapeCount])
	end)
end)