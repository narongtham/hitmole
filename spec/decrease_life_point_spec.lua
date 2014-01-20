describe("DecreaseLifePoint spec", function ( ... )

	local decreaseLifePoint = require "decreaseLifePoint"

	display = {}
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
end)