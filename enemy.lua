-------------------------------------------------
--
-- enemy.lua
--
-- Example "dog" class for Corona SDK tutorial.
--
-------------------------------------------------

local enemy = {}
local enemy_mt = { __index = enemy}

function enemy.new(name, type, missingCounter, isGameOver)
{
	local enemy_new = {
		name = name or "noname"
		type = type
		missingCounter = missingCounter or 0;
		isGameOver = isGameOver or false

	}

	return setmetatable(enemy_new, enemy_mt)
}