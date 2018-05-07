-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T18:59:15+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T00:02:49+02:00

local _M = {}

function _M.newButton(params)
  local button = display.newGroup()

  local normal = display.newImageRect(button, "images/buttons/sp-button-continue-normal.png", 396, 160)
  normal.anchorX = 0
  normal.anchorY = 0
  normal.x = 885
  normal.y = 850
  normal.alpha = 1

  local press = display.newImageRect(button, "images/buttons/sp-button-continue-press.png", 396, 160)
  press.anchorX = 0
  press.anchorY = 0
  press.x = 885
  press.y = 850
  press.alpha = 0

  local function touchHandle(event)
      if(event.phase == "began") then
          press.alpha = 1
          normal.alpha = 0
          display.getCurrentStage():setFocus(event.target)
          button:dispatchEvent({ name="press", target=button, phase='began' })
      end
      if(event.phase == "ended") then
          press.alpha = 0
          normal.alpha = 1
          display.getCurrentStage():setFocus(nil)
          button:dispatchEvent({ name="press", target=button, phase='ended' })
      end
  end

  button.normal = normal
  button.press = press

  normal:addEventListener("touch", touchHandle)

	function button:destroy()
      self:removeSelf()
	end

	return button
end

return _M
