local SpawningMole = {}
local SpawningMole_mt = { __index = SpawningMole }
local swithchToIdlingMole = swithchToIdlingMole or require('switchToIdlingMole')

function SpawningMole.new( ... )
	local newSpawningMole = {}
	local instance = setmetatable( newSpawningMole, SpawningMole_mt )
	return instance
end

function SpawningMole:setSprite( sprite )
	self.sprite = sprite
	self.sprite:setSequence( "spawn" )
	self.sprite:addEventListener( "sprite", self.spriteEventHandler )
end

function SpawningMole.spriteEventHandler( event )
	if event.phase == "ended" then
		swithchToIdlingMole.evaluate(event.target)
		event.target:removeEventListener( "sprite", SpawningMole.spriteEventHandler )
	end
end

return SpawningMole
