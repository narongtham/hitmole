		-- header
	local storyboard = require("storyboard")  
	local scene = storyboard.newScene()
	math.randomseed (os.time())

	-- end header


	-- open value
	local score = 0
	local speed = 2500

	moles = {}


	local options = {width = 200, height = 170, numFrames = 55}
	local imageSheet = graphics.newImageSheet( "img/sprite/mole1.png", options )
	local sequenceData = { 
	
	{name = "spawn", start = 1, count = 55, time = 2000 , loopCount = 1}
	}

	-- end value


	function scene:createScene(e)
		local group = self.view
		local bg = display.newImageRect("img/backyard.jpg", contentWidth ,contentHeight)
		--bg:setFillColor( 0,0,0 )
		bg.x = centerX
		bg.y = centerY
		group:insert(bg)

		
		
		--[[local box = display.newRect(0,350,640,1136)
		box:setFillColor(0,0,0)
		box.alpha = 0.01
		box:addEventListener("tap", showFont)]]--


		
	end

	function scene:enterScene(e)
		local group = self.view

		font = native.systemFont
		scoreTxt = display.newText("Score: 0", 0, 0, font, 30)
		scoreTxt.x = display.contentWidth - 140
		scoreTxt.y = 40
		scoreTxt:setTextColor (0,0,0)
		group:insert(scoreTxt)

		pauseGame = display.newText("pause", 0, 0, font, 30)
		pauseGame.x = display.contentWidth - 120
		pauseGame.y = 80
		pauseGame:setTextColor (0,0,0)
		group:insert(pauseGame)

		pauseGame:addEventListener("tap", pauseAll)

		mole_x, mole_y = checkMole()
	 	spawnMole(mole_x, mole_y)

	end

	function scene:exitScene(e) 
	end


	-- element funciton --
		function spawnMole(mole_x, mole_y)

			local mole = display.newSprite( imageSheet, sequenceData )
			mole:setSequence( "spawn" )
			mole:play( )
			--local mole = display.newImageRect("img/mole.png",202,168)
			table.insert(moles, mole)	
			mole.xScale = 1.5
			mole.yScale = 1.5
			mole.x = mole_x
			mole.y = mole_y
			mole:addEventListener("tap",hitMole )
			
			mole.tran = transition.to( mole,{time = speed, x=mole.x, y=mole.y, onComplete = removeMole } )
			
		end

		function checkMole()
			randomized_x = math.random( 110, display.contentWidth - 100)
			randomized_y = math.random( 350, display.contentHeight - 120)

			for key, it_mole in pairs(moles) do
				randomized_x = math.random( 110, display.contentWidth - 100)
				randomized_y = math.random( 350, display.contentHeight - 120)

				print( key )
				print( it_mole.x )
				print( it_mole.y )
				print( it_mole.width )
				print( it_mole.height )
			end

			return randomized_x, randomized_y
		end

		function hitMole(event)
			local mole = event.target
			display.remove(mole)
	 		transition.cancel( mole.tran)
	 		score = score + 20
	 		scoreTxt.text = "Score: ".. score

	 		mole_x, mole_y = checkMole()

	 		spawnMole(mole_x, mole_y)

		end

		function removeMole(event)
			mole_x, mole_y = checkMole()
			display.remove(event)
			table.remove(moles)
			spawnMole(mole_x, mole_y)
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