--player class
module 'player'
local player = {}

function player.new(level, maxHP, expValue)

	local self = {};
	self.level = level;
	self.maxHP = maxHP;
	self.curHP = maxHP;
	self.expValue = expValue;
	
	return self;
end