-- header
--storyboard = require("storyboard")
createMoleSprite = require("createMoleSprite")
createSpawningMole = require("createSpawningMole")

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
--local blastChannel

local bgm = audio.loadSound("audio/music.mp3") --โหลดไฟล์เสียงมาใส่ในเครื่อง user เลย
tapSound = audio.loadStream( "audio/punch.mp3") -- โหลดเสียงแบบ Stream (เหมือนดู ยูทูป)


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

	font = native.systemFont
	scoreTxt = display.newText("Score: 0", 0, 0, font, 30)
	scoreTxt.x = display.contentWidth - 140
	scoreTxt.y = 40
	scoreTxt:setFillColor (0,0,0)
	group:insert(scoreTxt)

	pauseGame = display.newImage("img/pause.png")
	pauseGame.x = display.contentWidth - 100
	pauseGame.y = 128
	pauseGame.xScale = 0.25
	pauseGame.yScale = 0.25
	group:insert(pauseGame)

	pauseGame:addEventListener("tap", pauseAll)
end

function scene:enterScene(e)
	escapeCount = 3
	score = 0
	scoreTxt.text = "Score: 0"
	pauseGame.isVisible = true
	isPause = false
	playBgSound()
	spawnMole()
	showHeart()
end

-- element funciton --
function spawnMole()
	createSpawningMole.create()
end

function showHeart()
	heart = {}
	for i =1 , escapeCount do
		heart[i] = display.newImage("img/headmole.png")
		heart[i].x = 30*i
		heart[i].y = 30
		heart[i].width = 32
		heart[i].height = 32
		currentViewGroup:insert(heart[i])
	end
end

function pauseAll()
	print( "pauseAll" )
	print( isPause )
	if ( isPause == false) then
		transition.pause()
		mole:pause()
		isPause = true
		storyboard.showOverlay( "option" , {effect = "fade" , isModal = true})
		pauseGame.isVisible = false
	else
		transition.resume( )
		mole:play()
		isPause = false
		pauseGame.isVisible = true
	end
end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)

return scene