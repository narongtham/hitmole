describe("loadHighScoreFile", function ( ... )
	local loadHighScoreFile

	local fakeHighscorePath = "path/to/highscore"

	local fakecontent = "..."

	local fakeFile = {
		read = function ( ... )
			return fakecontent
		end
	}

	local expectedResult = {}

	json = {
		decode = function ( ... )
			return expectedResult
		end
	}

	setup(function ( ... )
		system = {
			pathForFile = function ( ... )
				return fakeHighscorePath
			end,
			DocumentsDirectory = "fakeDocumentDir"
		}
		spy.on(system, "pathForFile")

		io.open = function ( ... )
			return fakeFile
		end
		spy.on(io, "open")
		stub(io, "close")

		spy.on(fakeFile, "read")

		spy.on(json, "decode")

		loadHighScoreFile = require("loadHighScoreFile")
	end)

	it("Acquire path of highscore file", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(system.pathForFile).was_called_with("cvm_highscore", system.DocumentsDirectory)
	end)

	it("Open file", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(io.open).was_called_with(fakeHighscorePath, "r")
	end)

	it("If file availables then read", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(fakeFile.read).was_called_with(fakeFile, "*a")
	end)

	it("If file available decode after read", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(json.decode).was_called_with(fakecontent)
	end)

	it("If file available close file after decoded", function ( ... )
		-- when
		loadHighScoreFile.evaluate()
		-- then
		assert.stub(io.close).was_called_with(fakeFile)
	end)

	it("If file available return highscore table", function ( ... )
		-- when
		local result = loadHighScoreFile.evaluate()
		-- then
		assert.are.equal(expectedResult, result)
	end)

	it("Error if no highscore file available", function ( ... )
		-- given
		fakeFile = nil
		-- when then
		assert.has_error(loadHighScoreFile.evaluate, "Highscore file not found")
	end)
end)