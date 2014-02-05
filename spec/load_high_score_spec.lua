describe("loadHighScoreFile", function ( ... )
	local loadHighScoreFile

	setup(function ( ... )
		system = {
			pathForFile = function ( ... )
				-- body
			end,
			DocumentsDirectory = "fakeDocumentDir"
		}
		spy.on(system, "pathForFile")

		loadHighScoreFile = require("loadHighScoreFile")
	end)

	it("Acquire path of highscore file", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(system.pathForFile).was_called_with("cvm_highscore", system.DocumentsDirectory)
	end)

	it("Open file")

	it("Error if no highscore file available")

	it("If file availables then read")

	it("If file available decode after read")

	it("If file available close file after decoded")

	it("If file available return highscore table")


end)