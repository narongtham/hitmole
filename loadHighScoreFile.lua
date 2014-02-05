loadHighScoreFile = {}

json = json or require("json")

function loadHighScoreFile.evaluate()
	local highscoreFilePath = system.pathForFile( "cvm_highscore", system.DocumentsDirectory )
	local highScoreFile = io.open( highscoreFilePath, "r" )

	if highScoreFile then
		local content = highScoreFile:read("*a")
		local decoded = json.decode( content )
		io.close( highScoreFile )

		return decoded
	else
		error("Highscore file not found")
	end
end

return loadHighScoreFile