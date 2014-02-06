describe("saveTable", function ( ... )
	local saveTable

	local table = {}

	local filename = "cvm_table"

	local fakeHighscorePath = "path/to/highscore"

	local fakeFile = {
		write = function ( ... )
			-- body
		end
	}

	local expectedResult = "..."
	

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

		json = {
			encode = function ( ... )
				return expectedResult
			end
		}
		spy.on(json, "encode")

		stub(fakeFile, "write")

		saveTable = require("saveTable")
	end)

	it("Acquire path of highscore file", function ( ... )
		-- when
		saveTable.evaluate(table, filename)
		-- then
		assert.stub(system.pathForFile).was_called_with(filename, system.DocumentsDirectory)
	end)

	it("Open file", function ( ... )
		-- when
		saveTable.evaluate(table, filename)
		-- then
		assert.stub(io.open).was_called_with(fakeHighscorePath, "w")
	end)

	it("If file available encode ", function ( ... )
		-- when
		saveTable.evaluate(table, filename)
		-- then
		assert.stub(json.encode).was_called_with(table)
	end)


	it("If file availables then write encoded json to file", function ( ... )
		-- when
		saveTable.evaluate(table, filename)
		-- then
		assert.stub(fakeFile.write).was_called_with(fakeFile, expectedResult)
	end)

	
	it("If file available close file after decoded", function ( ... )
		-- when
		saveTable.evaluate(table, filename)
		-- then
		assert.stub(io.close).was_called_with(fakeFile)
	end)

	it("Error if no highscore file available", function ( ... )
		-- given
		fakeFile = nil
		-- when then
		assert.has_error(saveTable.evaluate, "Cannot save to file")
	end)
end)