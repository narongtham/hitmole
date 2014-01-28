describe("CheckGameOver", function ( ... )

	local checkGameOver = require "checkGameOver"
	showGameOverPopup = require "showGameOverPopup"

	display = {
		newText = function ( ... )
			return {}
		end
	}
	DISPLAY_CENTER_X = 10
	DISPLAY_CENTER_Y = 10
	setup(function ( ... )
		stub(showGameOverPopup, "show")
	end)

	teardown(function ( ... )
		showGameOverPopup.show:revert()
	end)

	it("If life is equals to zero. It will show gameover scene", function ( ... )
		--given
		escapeCount = 0
		--when
		checkGameOver.evaluate()
		--then
		assert.stub(showGameOverPopup.show).was_called()
	end)
end)