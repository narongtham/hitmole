describe("CheckGameOver", function ( ... )

	local checkGameOver = require "checkGameOver"
	showGameOverPopup = require "showGameOverPopup"
	pauseGenerateMoleTimer = require "pauseGenerateMoleTimer"
	
	setup(function ( ... )
		stub(showGameOverPopup, "show")
		stub(pauseGenerateMoleTimer, "evaluate")
	end)

	teardown(function ( ... )
		showGameOverPopup.show:revert()
		pauseGenerateMoleTimer.evaluate:revert()
	end)

	it("If life is equals to zero. It will show gameover scene", function ( ... )
		--given
		escapeCount = 0
		--when
		checkGameOver.evaluate()
		--then
		assert.stub(showGameOverPopup.show).was_called()
	end)

	it("If life is equals to zero. It will call pauseGenerateMoleTimer", function ( ... )
		--given
		escapeCount = 0
		--when
		checkGameOver.evaluate()
		--then
		assert.stub(pauseGenerateMoleTimer.evaluate).was_called()
	end)
end)