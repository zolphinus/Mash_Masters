local composer = require( "composer" )
local enemy = require("enemy")

local scene = composer.newScene()

local delayTime = 0.0 --seconds
system.setTapDelay( delayTime )
local numTaps = 0

local curEnemy 
local function spawnEnemy()
	curEnemy = nil
	
	--chance to spawn regular enemy or boss
	
	curEnemy = enemy.new(1, 10, 20)
end


spawnEnemy(curEnemy)





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
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
	local function checkTap(event)
	  print(curEnemy.curHP)
	  curEnemy.curHP = curEnemy.curHP - 1
	  
	  if curEnemy.curHP < 0 then
	    spawnEnemy()
	  end
	  
	end
	  
	Runtime:addEventListener("tap", checkTap)
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