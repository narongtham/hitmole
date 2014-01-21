describe("CheckGameOver", function ( ... )

	local checkGameOver = require "checkGameOver"
	createSpawningMole = require "createSpawningMole"
	display = {
		newText = function ( ... )
			return {}
		end
	}
	DISPLAY_CENTER_X = 10
	DISPLAY_CENTER_Y = 10
	setup(function ( ... )
		stub(createSpawningMole, "create")
		spy.on(display, "newText")
	end)

	teardown(function ( ... )
		createSpawningMole.create:revert()
	end)

	it("If life still greater than zero. It will create new mole", function ( ... )
		--given
		escapeCount = 3
		--when
		checkGameOver.evaluate()
		--then
		assert.stub(createSpawningMole.create).was_called()
	end)

	it("If life is equals to zero. It will show gameover scene", function ( ... )
		--given
		escapeCount = 0
		--when
		checkGameOver.evaluate()
		--then
		assert.spy(display.newText).was_called_with("GameOver",0,0,"Helvetica",50)
	end)
end)