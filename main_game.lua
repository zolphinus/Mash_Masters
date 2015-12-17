local composer = require( "composer" )
local enemy = require("enemy")

local scene = composer.newScene()

local delayTime = 0.0 --seconds
system.setTapDelay( delayTime )

local numTaps = 0
local numEnemiesPerWave = 20
local numEnemies = 0
local wave = 1


local enemyStartLevel = 1
local enemyStartHP = 50 --50
local enemyStartExp = 10
local enemyStartAttackRate = 30
local enemyStartAttack = 1

local enemyStats = {
 level = enemyStartLevel,
 maxHP = enemyStartHP,
 expValue = enemyStartExp,
 attackRate = enemyStartAttackRate,
 attack = enemyStartAttack
}

local function levelEnemy()
	enemyStats.level = enemyStats.level + 1
	wave = enemyStats.level
	print("WAVE " .. wave)
	
	
	if enemyStats.level < 100 then
	   bonusHP = (enemyStats.level / 10000)
	elseif enemyStats.level >= 100 and enemyStats.level < 500 then
	   bonusHP = (enemyStats.level / 7500)
    elseif enemyStats.level >= 500 and enemyStats.level < 1000 then
	   bonusHP = (enemyStats.level / 5000)
	elseif enemyStats.level >= 1000 then
	   bonusHP = (enemyStats.level / 2500)
	end
	
	enemyStats.maxHP = enemyStats.maxHP * (1.08 + bonusHP)
	enemyStats.maxHP = enemyStats.maxHP + 10.00
	--rounds maxHP up to nearest whole number
	
	enemyStats.curHP = enemyStats.maxHP
	enemyStats.expValue = enemyStats.expValue * 1.042
	enemyStats.expValue = enemyStats.expValue + 1.00
	
	--round exp value up to nearest whole numbers
	
	--need formula for enemy attack rate
	
	--need formula for enemy attack damage
end



local curEnemy 
local function spawnEnemy()
	numEnemies = numEnemies + 1;
	
	--when num = num per wave, spawn a boss and reset wave
	numEnemies = numEnemies % 20
	
	--chance to spawn regular enemy or special
	
	
	curEnemy = enemy.new(enemyStats)
end

local function killEnemy()

--REWARD EXP

--DEATH ANIMATION

	curEnemy = nil
end





---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc
	
	
	local function checkTap(event)
	  print(curEnemy.curHP)
	  curEnemy.curHP = curEnemy.curHP - 100000000000
	  
	  if curEnemy.curHP < 0 then
	    killEnemy()
		--slight delay here`
		
		levelEnemy()
		spawnEnemy()
	  end
	  
	  
	end
	  
	Runtime:addEventListener("tap", checkTap)
	
	spawnEnemy(curEnemy)
end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
	  composer.removeScene("main_menu")
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
	  
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
	  
	  
   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene