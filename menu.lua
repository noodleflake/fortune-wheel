-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T00:02:47+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T23:21:21+02:00


local composer = require("composer")
local json = require("json")
--local appodeal = require("plugin.appodeal")
local button = require("controls.button")
--local alignment = require("alignment")
local monitor = require("modules.monitor")

local continueButton

local scene = composer.newScene()

function scene:create(event)
    local sceneGroup = self.view
end

function scene:show(event)
    local sceneGroup = self.view
    local params = event.params

    if(event.phase == "did") then
        continueButton = button.newButton()

        local function pressHandle(event)
            if event.phase == 'ended' then
                composer.gotoScene("scenes.game")
            end
        end
        continueButton:addEventListener('press', pressHandle)
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local params = event.params
end

function scene:destroy(event)
    local sceneGroup = self.view
    local params = event.params

    continueButton:destroy()
    continueButton = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
