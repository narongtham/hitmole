-- header
local scene = storyboard.newScene()
-- end header


-- open value
score = 0
local speed = 3000
isPause = false
g = nil
escapeCount = 3


moles = {}


moleSpriteMetaData = createMoleSprite.create()

local bgmChannel
local tapChannel
--local blastChannel
audio = require("audio")
local bgm = audio.loadSound("audio/music.mp3") --โหลดไฟล์เสียงมาใส่ในเครื่อง user เลย
tapSound = audio.loadStream( "audio/punch.mp3") -- โหลดเสียงแบบ Stream (เหมือนดู ยูทูป)


function playBgSound()
	bgmChannel = audio.play(bgm, { channel=1 , loops=-1 }) -- loops 0mean play once , loops -1 mean infinity loop
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
	playBgSound()
end

function scene:enterScene(e)
	local group = self.view
	g = group

	font = native.systemFont
	scoreTxt = display.newText("Score: 0", 0, 0, font, 30)
	scoreTxt.x = display.contentWidth - 140
	scoreTxt.y = 40
	scoreTxt:setFillColor (0,0,0)
	group:insert(scoreTxt)

	pauseGame = display.newText("pause", 0, 0, font, 30)
	pauseGame.x = display.contentWidth - 120
	pauseGame.y = 80
	pauseGame:setFillColor (0,0,0)
	group:insert(pauseGame)

	pauseGame:addEventListener("tap", pauseAll)

	spawnMole()
	showHeart()
end

-- element funciton --
function spawnMole()
	mole = createSpawningMole.create()
end

function showHeart()
	heart = {}
	for i =1 , escapeCount do
		heart[i] = display.newImage("img/headmole.png")
		heart[i].x = 30*i
		heart[i].y = 30
		g:insert(heart[i])
	end
end

function moleEsc( )
	display.remove(heart[escapeCount])
	escapeCount = escapeCount - 1
	print( "heart = ".. #heart )
	print( "escapeCount = ".. escapeCount )
	print( "mole = ".. #mole )

	if escapeCount > 0 then 
		spawnMole()
	else
		local gameOverTxt = display.newText("GameOver",0,0,"Helvetica",50)
		gameOverTxt:setFillColor( 0,0,0.2 )
		gameOverTxt.x = DISPLAY_CENTER_X
		gameOverTxt.y = DISPLAY_CENTER_Y

	end
end

function pauseAll()
	if ( isPause == false) then
		transition.pause()
		mole.sprite:pause()
		isPause = true
		storyboard.showOverlay( "option" , {effect = "fade" , isModal = true})
	else
		transition.resume( )
		mole.sprite:play()
		isPause = false
	end
end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)

return scene