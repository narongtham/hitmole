getFontNameByPlatform = {}

fontNameTable = fontNameTable or require("config.fontNameTable")

function getFontNameByPlatform.evaluate()
	local platformName = system.getInfo( "platformName" )

	return fontNameTable[platformName]
end

return getFontNameByPlatform