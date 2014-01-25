describe("showBackToGameButton", function ( ... )
	widget = {}
	local group = {
		 insert = function ( ... )
		 	-- body
		 end
	}
	local buttonMetaData = {}
	local backToGameButton = {}
	local cancelPause = cancelPause or require "cancelPause"

	local showBackToGameButton = require "showBackToGameButton"

	setup(function ( ... )
		buttonMetaData = {
			id="mainMenu",
			defaultFile="img/button/resume.png",
			overFile="img/button/resume_down.png",
			onRelease=showBackToGameButton.onRelease
		}

		widget.newButton = function ( ... )
			return backToGameButton
		end

		stub(cancelPause, "evaluate")
	end)

	teardown(function ( ... )
		cancelPause.evaluate:revert()
	end)

	it("Create widget button", function ( ... )
		-- given
		spy.on(widget, "newButton")
		-- when
		showBackToGameButton.show(group)
		-- then
		assert.spy(widget.newButton).was_called_with(buttonMetaData)
	end)

	it("Move button to center x", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		--when
		showBackToGameButton.show(group)
		--then
		assert.are.equal(backToGameButton.x, DISPLAY_CENTER_X)
	end)

	it("Move button to given y", function ( ... )
		-- given
		expectedYPosition = 840
		--when
		showBackToGameButton.show(group, expectedYPosition)
		--then
		assert.are.equal(backToGameButton.y, expectedYPosition)
	end)

	it("Add to assigned group", function ( ... )
		-- given
		stub(group, "insert")
		-- when
		showBackToGameButton.show(group)
		-- then
		assert.stub(group.insert).was_called_with(group, backToGameButton)
	end)

	it("onRelease should call cancelPause.evaluate()", function ( ... )
		-- when
		showBackToGameButton.onRelease()
		-- then
		assert.stub(cancelPause.evaluate).was_called()
	end)

end)