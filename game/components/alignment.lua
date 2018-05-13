-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-16T17:55:21+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-13T20:34:38+02:00

local contentWidthDifference = (display.contentWidth - display.viewableContentWidth)
local contentHeightDifference = (display.contentHeight - display.viewableContentHeight)
local contentWidthDifferencePositive = contentWidthDifference > 0 and contentWidthDifference or 0
local contentHeightDifferencePositive = contentHeightDifference > 0 and contentHeightDifference or 0

local viewableContentLeft = (contentWidthDifference > 0 and (contentWidthDifference * 0.5) or 0)
local viewableContentTop = (contentHeightDifference > 0 and (contentHeightDifference * 0.5) or 0)
local viewableContentRight = (contentWidthDifference > 0 and (display.contentWidth - contentWidthDifference * 0.5) or display.contentWidth)
local viewableContentBottom = (contentHeightDifference > 0 and (display.contentHeight - contentHeightDifference * 0.5) or display.contentHeight)

local alignment =
{
    contentWidthDifference = contentWidthDifference,
    contentHeightDifference = contentHeightDifference,
    contentWidthDifferencePositive = contentWidthDifferencePositive,
    contentHeightDifferencePositive = contentHeightDifferencePositive,
    viewableContentLeft = viewableContentLeft,
    viewableContentTop = viewableContentTop,
    viewableContentRight = viewableContentRight,
    viewableContentBottom = viewableContentBottom
}

return alignment
