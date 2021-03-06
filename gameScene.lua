-- header
createMoleSprite = require("createMoleSprite")
startGenerateMoleTimer = require("startGenerateMoleTimer")
createDecoratorsFromConfig = require("createDecoratorsFromConfig")
pauseAllMoles = require("pauseAllMoles")
pauseGenerateMoleTimer = require("pauseGenerateMoleTimer")
initiaLizeLevel = require("initializeLevel")
initializeReadySplashSequence = require("initializeReadySplashSequence")
--showReadySplash = require("showReadySplash")
-- end header


-- open value
score = 0
isPause = false
currentViewGroup = nil
escapeCount = 3
moleSpriteMetaData = createMoleSprite.create()
local scene = storyboard.newScene("gameScene")
local bgmChannel
local tapChannel

local bgm = audio.loadStream("audio/music.mp3") --โหลดไฟล์เสียงมาใส่ในเครื่อง user เลย
tapSound = audio.loadSound( "audio/punch.mp3") -- โหลดเสียงแบบ Stream (เหมือนดู ยูทูป)


function playBgSound()
	bgmChannel = audio.play(bgm, { channel=1 , loops=-1 }) -- loops 0mean play once , loops -1 mean infinity loop
	audio.setVolume( 1, {channel=1})
end
function playTapSound()
	tapChannel = audio.play(tapSound, { channel=2 , loops=0}) -- ต้องใส่ channel ด้วย เด๋วเสียงชนกัน
end

function scene:createScene(e)
	local group = self.view
	local bg = display.newImageRect("img/bg_morning.jpg",
		CONTENT_WIDTH,
		CONTENT_HEIGHT)
	bg.x = DISPLAY_CENTER_X
	bg.y = DISPLAY_CENTER_Y
	group:insert(bg)
	
	currentViewGroup = group

	local platForm = system.getInfo( "platformName" )
	local fontName = {
		Win="Stranded BRK",
		Android="Strande2"
	}

	scoreTxt = display.newText("Score: 0", 0, 0, fontName[platForm], 30)
	scoreTxt.anchorX = 0.0
	scoreTxt.anchorY = 0.0
	scoreTxt.x = 25
	scoreTxt.y = 25
	scoreTxt:setFillColor (0.55,0.55,0.55)
	group:insert(scoreTxt)

	pauseGame = display.newImage("img/pause.png")
	pauseGame.xScale = 0.25
	pauseGame.yScale = 0.25

	pauseGame.x = display.contentWidth - (pauseGame.contentWidth/2) - 25
	pauseGame.y = (pauseGame.contentHeight/2) + 25
	
	group:insert(pauseGame)

	pauseGame:addEventListener("tap", pauseAll)

	createDecoratorsFromConfig.create(group)
end

function scene:enterScene(e)
	escapeCount = 3
	score = 0
	scoreTxt.text = "Score: 0"
	scoreTxt.isVisible = true
	pauseGame.isVisible = true
	isPause = false
	initiaLizeLevel.evaluate()
	--showReadySplash.evaluate(currentViewGroup)
	initializeReadySplashSequence.evaluate(currentViewGroup)
	playBgSound()
	showHeart()
end

-- element funciton --
function showHeart()
	lifePoints = {}
	for i =1 , escapeCount do
		lifePoints[i] = display.newImage("img/headmole.png")
		lifePoints[i].x = 49*i
		lifePoints[i].y = 84
		lifePoints[i].width = 48
		lifePoints[i].height = 48
		currentViewGroup:insert(lifePoints[i])
	end
end

function pauseAll()
	transition.pause()
	pauseAllMoles.evaluate()
	pauseGenerateMoleTimer.evaluate()
	isPause = true
	storyboard.showOverlay( "option" , {effect = "fade" , isModal = true})
	pauseGame.isVisible = false
end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)

return scene