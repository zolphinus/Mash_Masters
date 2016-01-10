local composer = require( "composer" )
local enemy = require("enemy")
local player = require("player")

local scene = composer.newScene()
local path


local enemyAttackTimer = 320


local delayTime = 0.0 --seconds
system.setTapDelay( delayTime )

local numTaps = 0
local numEnemiesPerWave = 20
local numEnemies = 0
local bossMultiplier = 1.3
local wave = 1

--enemy base stats
local enemyStartLevel = 1
local enemyStartHP = 5
local enemyStartExp = 10
local enemyStartAttackRate = 30
local enemyStartAttack = 1


local enemyStats = {
 level = enemyStartLevel,
 maxHP = enemyStartHP,
 curHP = maxHP,
 expValue = enemyStartExp,
 attackRate = enemyStartAttackRate,
 attack = enemyStartAttack
}

local function loadEnemyStats(fileName)
--if enemy stats save file exists, loads from it
--else it loads from the backup save file
path = system.pathForFile( fileName, system.DocumentsDirectory )

local file, errorString = io.open( path, "r" )

if not file then
	print( "File error: " .. errorString)
	return false
else
	--level
	print(file:read("*number"))
	--maxHP
	print(file:read("*number"))
	--curHP
	print(file:read("*number"))
	--expValue
	print(file:read("*number"))
	--attackRate
	print(file:read("*number"))
	--attack
	print(file:read("*number"))
	print(" ")
	io.close(file)
end

end

local function saveEnemyStats(fileName)
--if the save file does not exist, makes a new one
--else if it does, turns the old one into backup, then saves new
path = system.pathForFile( fileName, system.DocumentsDirectory )

local file, errorString = io.open( path, "w" )

if not file then
	print( "File error: " .. errorString)
else
	file:write(enemyStats.level ..' ')
	file:write(enemyStats.maxHP .. ' ')
	file:write(enemyStats.curHP .. ' ')
	file:write(enemyStats.expValue .. ' ')
	file:write(enemyStats.attackRate .. ' ')
	file:write(enemyStats.attack .. ' ')
	
end

io.close(file)

end

--player base stats
local playerStartLevel = 1
local playerStartMaxHP = 40
local playerStartCurHP = playerStartMaxHP
local playerStartAttack = 1.0
local playerStartSpeed = 1.0
local playerStartMaxKI = 20
local playerStartCurKI = playerStartMaxKI
local playerStartHpRegen = 0.5
local playerStartKiRegen = 0.2
local playerStartRecoverRate = 300
local playerStartMeditateBonus = 1.10
local playerStartMeditateTime = 0
local playerStartExperience = 0

local Hp_Tick = 320
local Ki_Tick = 480

local playerHPTimer, playerKiTimer

local playerStats = {
 level = playerStartLevel,
 maxHP = playerStartMaxHP,
 curHP = playerStartCurHP,
 attack = playerStartAttack,
 speed = playerStartSpeed,
 maxKI = playerStartMaxKI,
 curKI = playerStartCurKI,
 hpRegen = playerStartHpRegen,
 kiRegen = playerStartKiRegen,
 recoverRate = playerStartRecoverRate,
 meditateBonus = playerStartMeditateBonus,
 meditateTime = playerStartMeditateTime,
 experience = playerStartExperience
}
local myPlayer = player.new(playerStats)


local function loadPlayerStats(fileName)
path = system.pathForFile( fileName, system.DocumentsDirectory )

local file, errorString = io.open( path, "r" )

if not file then
	print( "File error: " .. errorString)
	return false
else
	--level
	print(file:read("*number"))
	--maxHP
	print(file:read("*number"))
	--curHP
	print(file:read("*number"))
	--attack
	print(file:read("*number"))
	--speed
	print(file:read("*number"))
	--maxKI
	print(file:read("*number"))
	--curKI
	print(file:read("*number"))
	--hpRegen
	print(file:read("*number"))
	--kiRegen
	print(file:read("*number"))
	--recoverRate
	print(file:read("*number"))
	--meditateBonus
	print(file:read("*number"))
	--meditateTime
	print(file:read("*number"))
	--experience
	print(file:read("*number"))
	print(" ")
	io.close(file)
end


end

local function savePlayerStats(fileName)

path = system.pathForFile( fileName, system.DocumentsDirectory )

local file, errorString = io.open( path, "w" )

if not file then
	print( "File error: " .. errorString)
else
	file:write(playerStats.level ..' ')
	file:write(playerStats.maxHP ..' ')
	file:write(playerStats.curHP ..' ')
	file:write(playerStats.attack ..' ')
	file:write(playerStats.speed ..' ')
	file:write(playerStats.maxKI ..' ')
	file:write(playerStats.curKI ..' ')
	file:write(playerStats.hpRegen ..' ')
	file:write(playerStats.kiRegen ..' ')
	file:write(playerStats.recoverRate ..' ')
	file:write(playerStats.meditateBonus ..' ')
	file:write(playerStats.meditateTime ..' ')
	file:write(playerStats.experience ..' ')
end

io.close(file)

end

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
	
	enemyStats.maxHP = math.floor(enemyStats.maxHP * (1.08 + bonusHP))
	enemyStats.maxHP = enemyStats.maxHP + 10.00
	--rounds maxHP up to nearest whole number
	
	enemyStats.curHP = enemyStats.maxHP
	enemyStats.expValue = enemyStats.expValue * 1.042
	enemyStats.expValue = math.floor(enemyStats.expValue + 1.00)
	
	--round exp value up to nearest whole numbers
	
	--need formula for enemy attack rate
	
	--need formula for enemy attack damage
end



local curEnemy 
local curBoss
local function spawnEnemy()
	numEnemies = numEnemies + 1;
	
	--when num = num per wave, spawn a boss and reset wave
	numEnemies = numEnemies % 20
	
	--chance to spawn regular enemy or special
	
	
	curEnemy = enemy.new(enemyStats)
end

local function spawnBoss()
--placeholder function
	
	numEnemies = numEnemies + 1;
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
	  
	  if curEnemy ~= nil then	  
		  curEnemy.curHP = curEnemy.curHP - (myPlayer.attack * myPlayer.speed)
		  if curEnemy.curHP < 0 then
		    local expMult = 1.0
			if myPlayer.meditateTime > 0 then
			  expMult = myPlayer.meditateBonus
			end
		  
		    myPlayer.experience = myPlayer.experience + (curEnemy.expValue * expMult)
			--round player exp

			killEnemy()
			--slight delay here
			
			
			if numEnemies % numEnemiesPerWave == 0 then
			 spawnBoss()
			 
			 --leveling enemy should be in the boss defeat code
			 levelEnemy()
			 
			else
				spawnEnemy()
				levelEnemy()
				saveEnemyStats("enemyData.txt")
				saveEnemyStats("enemyDataBackup.txt")
				
				savePlayerStats("playerData.txt")
				savePlayerStats("playerDataBackup.txt")
				
				
				loadEnemyStats("enemyData.tx")
				loadPlayerStats("playerData.txt")
			end
		  end
	  end
	  
	  if curBoss ~= nil then
	  --boss fight
	  
	  --leveling enemies should be in this section of code
	  
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