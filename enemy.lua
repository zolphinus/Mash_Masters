--enemy class
module 'enemy'
local enemy = {}

function enemy.new(level, maxHP, expValue)

	local self = {};
	self.level = level;
	self.maxHP = maxHP;
	self.curHP = maxHP;
	self.expValue = expValue;
	
	return self;
end

return enemy