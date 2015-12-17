
local composer = require("composer")
local scene = composer.newScene()


local options = {
   effect = "fade",
   time = 1000
}

composer.gotoScene("main_menu", options)