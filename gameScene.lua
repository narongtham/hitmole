		-- header
	local storyboard = require("storyboard")  
	local scene = storyboard.newScene()
	math.randomseed (os.time())

	-- end header


	-- open value
	local score = 0
	local speed = 3000
	isPause = false
	g = nil
	escCount = 3

	
	moles = {}


	local options = {width = 200, height = 170, numFrames = 67}
	local imageSheet = graphics.newImageSheet( "img/sprite/mole1.png", options )
	local sequenceData = { 
		{name = "spawn", start = 1, count = 55, time = 2000 , loopCount = 1},
		{name = "down", start = 56, count = 12, time = 300 , loopCount = 1}
	}

	 local bgmChannel
	 local tapChannel
	 --local blastChannel
	 local audio = require("audio")
	 local bgm = audio.loadSound("audio/music.mp3") --โหลดไฟล์เสียงมาใส่ในเครื่อง user เลย
	 local tapSound = audio.loadStream( "audio/punch.mp3") -- โหลดเสียงแบบ Stream (เหมือนดู ยูทูป)
	
	 
	 function playBgSound()
	 bgmChannel = audio.play(bgm, { channel = 1 , loops = -1 }) -- loops 0mean play once , loops -1 mean infinity loop
	 end
	 function playTapSound()
	 	tapChannel = audio.play(tapSound, { channel = 2 , loops = 0}) -- ต้องใส่ channel ด้วย เด๋วเสียงชนกัน
	 end

	-- end value


	function scene:createScene(e)
		local group = self.view
		local bg = display.newImageRect("img/backyard.jpg", contentWidth ,contentHeight)
		--bg:setFillColor( 0,0,0 )
		bg.x = centerX
		bg.y = centerY
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

		mole_x, mole_y = checkMole()
	 	spawnMole(mole_x, mole_y)
	 	showHeart()
	 	
	end

	function scene:exitScene(e) 
	end


	-- element funciton --
		function spawnMole(mole_x, mole_y )

			mole = display.newSprite( imageSheet, sequenceData )
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
			g:insert(mole)
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
			if (isPause == true) then
				return
			end

			local mole = event.target
			mole:setSequence("down")
			mole:play( )
			mole:addEventListener( "sprite", moleSpriteEventHandler )
			--timer.performWithDelay( delay, listener [, iterations] )
	 		score = score + 20
	 		scoreTxt.text = "Score: ".. score

	 		playTapSound()

		end

		function showHeart()
			heart = {}
			for i =1 , escCount do
				heart[i] = display.newImage("img/heart.png")
				heart[i].x = 30*i
				heart[i].y = 30
				g:insert(heart[i])
			end
		end

		function moleSpriteEventHandler(event)
			if (event.phase == "ended") then
				--timer.performWithDelay( 0, killMole )
			end
		end

		function killMole(mole)
			
				display.remove(mole)
		 		transition.cancel(mole)
		 		mole_x, mole_y = checkMole()
	 			spawnMole(mole_x, mole_y)
		end

		function removeMole(event)
			mole_x, mole_y = checkMole()
			display.remove(event)
			table.remove(moles)
			moleEsc()
			--spawnMole(mole_x, mole_y)
		end

		function moleEsc( )
			display.remove(heart[escCount])
			escCount = escCount - 1
			print( "heart = ".. #heart )
			print( "escCount = ".. escCount )
			print( "mole = ".. #mole )

			if escCount > 0 then 
				spawnMole(mole_x, mole_y)
		 	else
		 		local gameOverTxt = display.newText("GameOver",0,0,"Helvetica",50)
		 		gameOverTxt:setFillColor( 0,0,0.2 )
		 		gameOverTxt.x = centerX
		 		gameOverTxt.y = centerY

		 	end
		end

		function pauseAll()
			if ( isPause == false) then
				transition.pause()
				mole:pause()
				isPause = true
				storyboard.showOverlay( "option" , {effect = "fade" , isModal = true})
			else
				transition.resume( )
				mole:play()
				isPause = false
			end
		end

	scene:addEventListener("createScene",scene)
	scene:addEventListener("enterScene",scene)
	scene:addEventListener("exitScene",scene)

	return scene