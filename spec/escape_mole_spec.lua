describe("escapeMole", function ( ... )

	local escapeMole = require "escapeMole"
	local switchToEscapingMole = require "switchToEscapingMole"
	local sprite

	setup(function ( ... )
		sprite = {}
		stub(switchToEscapingMole, "evaluate")
	end)

	teardown(function ( ... )
		switchToEscapingMole.evaluate:revert()
	end)

	it("call switchToEscapingMole", function ( ... )
		--when
		escapeMole.evaluate(sprite)
		--then
		assert.stub(switchToEscapingMole.evaluate).was_called_with(sprite)
	end)

end)