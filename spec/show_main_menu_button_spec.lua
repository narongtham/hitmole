describe("showMainMenu", function ( ... )
	widget = {}
	local group = {
		 insert = function ( ... )
		 	-- body
		 end
	}
	local buttonMetaData = {}
	local mainMenuButton = {}

	local showMainMenuButton = require "showMainMenuButton"

	setup(function ( ... )
		buttonMetaData = {
			id="mainMenu",
			defaultFile="img/button/main_menu.png",
			overFile="img/button/main_menu_down.png",
			onRelease=showMainMenuButton.onRelease
		}

		widget.newButton = function ( ... )
			return mainMenuButton
		end
	end)

	it("Create widget button", function ( ... )
		-- given
		spy.on(widget, "newButton")
		--when
		showMainMenuButton.show(group)
		--then
		assert.spy(widget.newButton).was_called_with(buttonMetaData)
	end)

	it("Move button to center x", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		--when
		showMainMenuButton.show(group)
		--then
		assert.are.equal(mainMenuButton.x, DISPLAY_CENTER_X)
	end)

	it("Move button to y = 720", function ( ... )
		-- given
		expectedYPosition = 840
		--when
		showMainMenuButton.show(group)
		--then
		assert.are.equal(mainMenuButton.y, expectedYPosition)
	end)

	it("Add to assigned group", function ( ... )
		-- given
		stub(group, "insert")
		-- when
		showMainMenuButton.show(group)
		-- then
		assert.stub(group.insert).was_called_with(group, mainMenuButton)
	end)
end)