-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T19:35:14+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-06T23:34:10+02:00

local composer = require("composer")
--local appodeal = require("plugin.appodeal")
-- local button = require("classes.button")
--local alignment = require("alignment")
local monitor = require("libs.monitor")

local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view

end

function scene:show(event)
    local sceneGroup = self.view
    local params = event.params

    if(event.phase == "did") then
        print('in game')
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local params = event.params
end

function scene:destroy(event)
    local sceneGroup = self.view
    local params = event.params
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
