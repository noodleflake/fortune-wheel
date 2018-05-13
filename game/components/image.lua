-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-13T19:50:27+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-13T20:46:14+02:00

local _M = {}

function _M.newImage(params)
    local params = params or {}
    local image = display.newImageRect(params.group, params.filename, params.width, params.height)
    image.x = params.x or image.x
    image.y = params.y or image.y
    image.anchorX = params.anchorX or 0
    image.anchorY = params.anchorY or 0
    return image
end

return _M
