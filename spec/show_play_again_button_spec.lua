describe("showPlayAgainButton", function ( ... )

	widget = {}
	local group = {
		 insert = function ( ... )
		 	-- body
		 end
	}
	local buttonMetaData = {}
	local playAgainButton = {}

	local showPlayAgainButton = require "showPlayAgainButton"

	setup(function ( ... )
		buttonMetaData = {
			id="playAgain",
			defaultFile="img/button/play_again.png",
			overFile="img/button/play_again_down.png",
			onRelease=showPlayAgainButton.onPlayAgain
		}

		widget.newButton = function ( ... )
			return playAgainButton
		end
	end)

	it("Create widget button", function ( ... )
		-- given
		spy.on(widget, "newButton")
		--when
		showPlayAgainButton.show(group)
		--then
		assert.spy(widget.newButton).was_called_with(buttonMetaData)
	end)

	it("Move button to center x", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		--when
		showPlayAgainButton.show(group)
		--then
		assert.are.equal(playAgainButton.x, DISPLAY_CENTER_X)
	end)

	it("Move button to y = 720", function ( ... )
		-- given
		expectedYPosition = 720
		--when
		showPlayAgainButton.show(group)
		--then
		assert.are.equal(playAgainButton.y, expectedYPosition)
	end)

	it("Add to assigned group", function ( ... )
		-- given
		stub(group, "insert")
		-- when
		showPlayAgainButton.show(group)
		-- then
		assert.stub(group.insert).was_called_with(group, playAgainButton)
	end)

	it("Bind function restart to button event listener")
	
end)