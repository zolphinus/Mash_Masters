--player class
module 'player'
local player = {}

function player.new(stats)

	local self = {};
	self.level = stats.level;
	self.maxHP = stats.maxHP;
	self.curHP = stats.maxHP;
	self.expValue = stats.expValue;
	self.attack = stats.attack
	
	return self;
end