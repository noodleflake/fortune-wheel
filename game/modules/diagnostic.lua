-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2016-12-07T20:10:33+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-20T20:25:51+02:00

local _M = {}
local int = math.floor
local min = math.min
local fps = display.fps

_M.fontSize = 14
_M.updateFreq = int(fps / 10)

function _M.newDiagnostic(params)
    local params = params or {}

    local group = display.newGroup()

    group.isVisible = false

    local topPadding = params.topPadding or 0

    local background = display.newRect(group, display.screenOriginX, display.screenOriginY + topPadding, display.actualContentWidth, 20)
    background:setFillColor(0)
    background.alpha = 0.5
    background.anchorX = 0
    background.anchorY = 0

    local text = display.newText(group, "", 0, 0, 0, 0, native.systemFont, _M.fontSize )
    text:setFillColor(1)
    text.x = display.actualContentWidth * 0.5
    text.y = display.screenOriginY + 10

    group.text = text
    group.ignore = true

    local updateCount = 0
    local prevTime = 0

    local function childCount(object)
        local count = 1
        if object.numChildren and not object.ignore then
            for i = 1, object.numChildren do
                count = count + childCount(object[i])
            end
            count = count + object.numChildren
        end
        return count
    end

    function update()
        local curTime = system.getTimer()
        if updateCount > _M.updateFreq then
            updateCount = 0
            local information = "FPS: ".. tostring(min(fps, int(1000 / (curTime - prevTime)))) .. " " ..
            " Texture Memory: ".. tostring(int(system.getInfo("textureMemoryUsed") * 0.0001) * 0.01) .. "mb " ..
            " System Memory: ".. tostring(int(collectgarbage("count") * 0.1) * 0.01) .. "mb " ..
            " Stage Objects: " .. tostring(int(childCount(display.getCurrentStage())))
            text.text = information
        end
        group:toFront()
        updateCount = updateCount + 1
        prevTime = curTime
    end

    function group:hide()
        self.isVisible = false
        local update = self.update

    end

    function group:show()
        self.isVisible = true
    end

    function group:destroy()
        Runtime:removeEventListener( "enterFrame", update )
    end

    Runtime:addEventListener( "enterFrame", update )

    return group
end

return _M
