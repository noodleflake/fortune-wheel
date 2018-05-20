-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T18:59:15+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-20T16:54:55+02:00

local widget = require( "widget" )
local options = require( "options" )
local alignment = require( "components.alignment" )
local json = require( "json" )

local _M = {}

function _M.newButton(params)
    local params = params or {}

    --params.anchorY = params.anchorY or 0.5
    --params.anchorX = params.anchorX or 0.5

    local buttonOptions = {}
    for k,v in pairs(params) do
        if k ~= 'label' then
            buttonOptions[k] = v
        end
    end

    local button = widget.newButton(buttonOptions)

    local group = buttonOptions.group
    if group then
        group:insert(button)
    else
        group = button.parent
    end

    local label = params.label
    if label then
        local fontSize = params.fontSize or 50
        local fontName = params.fontName or options.fonts.bebasNeue.Bold.filename
        local buttonText = display.newText(button, label, 0, 0, fontName, fontSize)
        buttonText.anchorY = params.anchorY
        buttonText.anchorX = params.anchorX
        buttonText.x = buttonOptions.leftPadding or 0
        buttonText.y = (buttonOptions.topPadding or 0) - 3
    end

    function button:destroy()
        self:removeSelf()
    end

    return button
end

return _M
