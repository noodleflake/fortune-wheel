-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-06T00:02:47+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-13T21:26:15+02:00


local composer = require("composer")
local json = require("json")
local alignment = require("components.alignment")
local monitor = require("modules.monitor")
local options = require("options")
local image = require("components.image")
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- Initialize variables
local playButton
local musicTrack

local function gotoGame()
	composer.removeScene("scenes.game")
	composer.gotoScene("scenes.game", { time=300, effect="crossFade" })
end

local function gotoSettings()
	composer.removeScene( "scenes.settings" )
	composer.gotoScene( "scenes.settings", { time=300, effect="crossFade" })
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
    local sceneGroup = self.view

    local imageOptions = options.backgrounds.menu
	local background = image.newImage({
		group = sceneGroup,
		filename = imageOptions.filename,
		width = imageOptions.width,
		height = imageOptions.height,
		x = display.contentCenterX,
		y = display.contentCenterY,
		anchorX = 0.5,
		anchorY = 0.5,
	})

	local imageOptions = options.layers.topPanel
	local topPanelWidth = imageOptions.width - alignment.contentWidthDifference
	local topPanelHeight = imageOptions.height * topPanelWidth / imageOptions.width
    local topPanel = image.newImage({
		group = sceneGroup,
		filename = imageOptions.filename,
		width = topPanelWidth,
		height = topPanelHeight,
		x = alignment.viewableContentLeft,
		y = alignment.viewableContentTop,
	})

	local topPanelButtonPaddingTop = 30
	local topPanelButtonPaddingRight = 20
	local topPanelButtonPaddingWidth = 20

	local buttonOptions = options.buttons.lobby
	local buttonWidth = buttonOptions.normal.width
	local buttonLobby = widget.newButton({
        defaultFile = buttonOptions.normal.filename,
        overFile = buttonOptions.press.filename,
		left = alignment.viewableContentRight - buttonWidth - topPanelButtonPaddingRight,
		top = alignment.viewableContentTop + topPanelButtonPaddingTop,
    })
	local topPanelButtonPaddingRight = buttonWidth + topPanelButtonPaddingWidth + topPanelButtonPaddingRight

	local buttonOptions = options.buttons.settings
	local buttonWidth = buttonOptions.normal.width
	local buttonSettings = widget.newButton({
        defaultFile = buttonOptions.normal.filename,
        overFile = buttonOptions.press.filename,
		left = alignment.viewableContentRight - buttonWidth - topPanelButtonPaddingRight,
		top = alignment.viewableContentTop + topPanelButtonPaddingTop,
    })
	local topPanelButtonPaddingRight = buttonWidth + topPanelButtonPaddingWidth + topPanelButtonPaddingRight

	local buttonOptions = options.buttons.shop
	local buttonWidth = buttonOptions.normal.width
	local buttonShop = widget.newButton({
        defaultFile = buttonOptions.normal.filename,
        overFile = buttonOptions.press.filename,
		left = alignment.viewableContentRight - buttonWidth - topPanelButtonPaddingRight,
		top = alignment.viewableContentTop + topPanelButtonPaddingTop,
    })
	local topPanelButtonPaddingRight = buttonWidth + topPanelButtonPaddingWidth + topPanelButtonPaddingRight

	local buttonOptions = options.buttons.continue
    local buttonContinue = widget.newButton({
		defaultFile = buttonOptions.normal.filename,
        overFile = buttonOptions.press.filename,
        left = alignment.viewableContentLeft,
        top = alignment.viewableContentTop,
        onRelease = gotoGame
    })
	buttonContinue.alpha = 0

    if(sceneGroup) then
        sceneGroup:insert(buttonLobby);
		sceneGroup:insert(buttonSettings);
		sceneGroup:insert(buttonShop);
		sceneGroup:insert(buttonContinue);
    end

    -- musicTrack = audio.loadStream()
end

function scene:show(event)
    local sceneGroup = self.view
    local params = event.params

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
	elseif ( phase == "did" ) then
		-- audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end

function scene:hide(event)
    local sceneGroup = self.view
    local params = event.params
end

function scene:destroy(event)
    local sceneGroup = self.view
    local params = event.params

    -- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	-- audio.dispose( musicTrack )
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
