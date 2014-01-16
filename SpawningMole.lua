local SpawningMole = {}
local SpawningMole_mt = { __index = SpawningMole }

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

function SpawningMole.spriteEventHandler( target )
	-- body
end

return SpawningMole
