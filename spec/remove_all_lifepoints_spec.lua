describe("removeAllLifepoints", function ( ... )

	--display = {}

	--lifePoints = nil
	lifePoints_1 = {}
	lifePoints_2 = {}
	lifePoints_3 = {}

	local removeAllLifepoints = require "removeAllLifepoints"

	setup(function ( ... )
		lifePoints = { 
			lifePoints_1,
			lifePoints_2,
			lifePoints_3
		}
		
		
	end)

	before_each(function ( ... )
		stub(display, "remove")
	end)

	after_each(function ( ... )
		display.remove:revert()
	end)

	it("Remove remain 3 life sprites", function ( ... )
		--given
		escapeCount = 3
		-- when
		removeAllLifepoints.evaluate()
		--then
		assert.stub(display.remove).was_called_with(lifePoints_1)
		assert.stub(display.remove).was_called_with(lifePoints_2)
		assert.stub(display.remove).was_called_with(lifePoints_3)
	end)

	it("Remove remain 2 life sprites", function ( ... )
		--given
		escapeCount = 1
		-- when
		removeAllLifepoints.evaluate()
		--then
		assert.stub(display.remove).was_called_with(lifePoints_1)
		assert.stub(display.remove).was_called_with(lifePoints_2)
	end)

	it("Escape count should be zero")
end)