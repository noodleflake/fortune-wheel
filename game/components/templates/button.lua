-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T18:59:15+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-14T01:52:21+02:00

local widget = require( "widget" )
local options = require( "options" )
local alignment = require( "components.alignment" )
local json = require( "json" )

local _M = {}

function _M.newButton(params)
    local params = params or {}
    local buttonOptions = {}
    for k,v in pairs(params) do
        if k ~= 'label' then
            buttonOptions[k] = v
        end
    end

    buttonOptions.onRelease = function(event)
        local self = event.target
        audio.play(self.sound)
        self.onRelease(event)
    end

    local button = widget.newButton(buttonOptions)
    button.sound = audio.loadSound(options.sounds.button.filename)
    button.onRelease = params.onRelease

    local group = buttonOptions.group
    if group then
        group:insert(button)
    else
        group = button.parent
    end

    local label = params.label
    if label then
        local buttonText = display.newText(group, label, 200, 200, options.fonts.bebasNeue.Bold.filename, 43)
        buttonText.anchorY = 0.5
        buttonText.anchorX = 0.5
        buttonText.x = buttonOptions.left + (buttonOptions.labelLeftPadding or 0)
        buttonText.y = buttonOptions.top + (buttonOptions.labelTopPadding or 0) + 24
    end

    function button:destroy()
        audio.dispose(self.sound)
        self:removeSelf()
    end

    return button
end

return _M
