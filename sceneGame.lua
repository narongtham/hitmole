	-- header
local storyboard = require("storyboard")  
local scene = storyboard.newScene()
math.randomseed (os.time())

-- end header


-- open value
local score = 0
local speed = 2000
-- end value

-- create center
local centerX = display.contentCenterX
local centerY = display.contentCenterY
-- end create center

function scene:createScene(e)
	local view = self.view
	local bg = display.newImageRect("img/backyard.jpg", 640 ,1136)
	--bg:setFillColor( 0,0,0 )
	bg.x = centerX
	bg.y = centerY
	view:insert(bg)

	font = native.systemFont
	scoreTxt = display.newText("Score: 0", 0, 0, font, 30)
	scoreTxt.x = display.contentWidth - 140
	scoreTxt.y = 40
	scoreTxt:setTextColor (0,0,0)

	pauseGame = display.newText("pause", 0, 0, font, 30)
	pauseGame.x = display.contentWidth - 120
	pauseGame.y = 80
	pauseGame:setTextColor (0,0,0)

	pauseGame:addEventListener("tap", pauseAll)
	
	--[[local box = display.newRect(0,350,640,1136)
	box:setFillColor(0,0,0)
	box.alpha = 0.01
	box:addEventListener("tap", showFont)]]--


	
end

function scene:enterScene(e)
	spawnMole()

end

function scene:exitScene(e) 
end


-- element funciton --
	function spawnMole()
		local mole = display.newImageRect("img/mole.png",202,168)


		mole.x = math.random( 110, display.contentWidth - 100)
		mole.y = math.random( 350, display.contentHeight - 120)
		mole:addEventListener("tap",hitMole )
		
		mole.tran = transition.to( mole,{time = speed, x=mole.x, y=mole.y, onComplete = removeMole } )
		
	end

	function hitMole(event)
		local mole = event.target
		display.remove(mole)
 		transition.cancel( mole.tran)
 		score = score + 20
 		scoreTxt.text = "Score: ".. score
 		spawnMole()

	end

	function removeMole(obj)
		display.remove(obj)
		spawnMole()
	end

	function pauseAll()
		transition.pause()
	end

	function showFont()
		local font = "Helvetica" or native.systemFont
		local text = display.newText("main game",0,0,font,40)
		text:setTextColor(70,70,70)
		text.x = centerX
		text.y = centerY
	end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene