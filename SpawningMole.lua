local SpawningMole = {}
local SpawningMole_mt = { __index = SpawningMole }

function SpawningMole.new( ... )
	local newSpawningMole = {}
	local instance = setmetatable( newSpawningMole, SpawningMole_mt )

	return instance
end

return SpawningMole
