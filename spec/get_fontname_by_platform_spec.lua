describe("getFontNameByPlatform", function ( ... )
	local getFontNameByPlatform

	local platformName

	setup(function ( ... )

		system = { 
			getInfo = function ( ... )
				return platformName
			end
		}
		spy.on(system, "getInfo")

		fontNameTable = {
			Win="Font_A",
			Android = "fonta.ttf"
		}

		getFontNameByPlatform = require("getFontNameByPlatform")
	end)

	it("Get platform name from system.getInfo", function ( ... )
		-- when
		getFontNameByPlatform.evaluate()
		-- then
		assert.stub(system.getInfo).was_called_with("platformName")
	end)

	it("Return font by given platform", function ( ... )
		-- given
		platformName = "Win"
		-- when
		local result = getFontNameByPlatform.evaluate()
		-- then
		assert.are.equal(result, fontNameTable[platformName])
	end)
end)