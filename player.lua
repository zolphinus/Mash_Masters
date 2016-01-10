--player class
module 'player'
local player = {}

function player.new(stats) --, gear, specials)

	local self = {};
	self.level = stats.level;
	self.maxHP = stats.maxHP;
	self.curHP = stats.curHP;
	self.attack = stats.attack
	self.speed = stats.speed
	self.maxKI = stats.maxKI
	self.curKI = stats.curKI
	self.hpRegen = stats.hpRegen
	self.kiRegen = stats.kiRegen
	self.recoverRate = stats.recoverRate
	self.meditateBonus = stats.meditateBonus
	self.meditateTime = stats.meditateTime
	self.experience = stats.experience
	
	--self.head = gear.head
	--self.chest = gear.chest
	--self.pants = gear.pants
	--self.gloves = gear.gloves
	--self.boots = gear.boots
	--self.accessory = gear.accessory
	
	--self.meleeSpecial = specials.meleeSpecial
	--self.energySpecial = specials.energySpecial
	--self.ultimate = specials.ultimate
	--self.freeSlot_1 = specials.freeSlot_1
	--self.freeSlot_2 = specials.freeSlot_2
	
	
	return self;
end

return player