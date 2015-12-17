--enemy class
module 'enemy'
local enemy = {}

function enemy.new(stats)

	local self = {};
	self.level = stats.level;
	self.maxHP = stats.maxHP;
	self.curHP = stats.maxHP;
	self.expValue = stats.expValue;
	
	
	
	return self;
end

return enemy