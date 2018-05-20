-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-05T22:02:30+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-20T20:04:10+02:00


local config = require("config")
local composer = require("composer")
local appodeal = require("plugin.appodeal")
local data_store = require("modules.data_store")
local speaker = require("components.speaker")

-- Removes bottom bar on Android
if system.getInfo( "androidApiLevel" ) and system.getInfo( "androidApiLevel" ) < 19 then
	native.setProperty( "androidSystemUiVisibility", "lowProfile" )
else
	native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
end

-- Are we running on the Corona Simulator?
-- https://docs.coronalabs.com/api/library/system/getInfo.html
local isSimulator = system.getInfo( "environment" ) == "simulator"

-- If we are running in the Corona Simulator, enable diagnostics
if isSimulator then

    local function handleKey(event)
        local phase = event.phase
        local key = event.keyName
        if phase == "up" and key == "d" then

            -- Show FPS
            local diagnostic = require("modules.diagnostic")
            local diagnosticHeader = diagnostic:newDiagnostic()
            diagnosticHeader:show()
        end
    end
    -- Listen for key events in Runtime
    -- See the "key" event documentation for more details:
    -- https://docs.coronalabs.com/api/event/key/index.html
    Runtime:addEventListener( "key", handleKey )
end

-- Initialize database with name
data_store.init_json(application.database.databaseName)

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Debugging [default,wireframe]
display.setDrawMode(application.drawMode)

-- Seed the random number generator
math.randomseed(os.time())

--Load set and volumes
speaker.init()

local client = {
    ["appName"] = system.getInfo("appName"),
    ["appVersion"] = system.getInfo("appVersionString"),
    ["architectureInfo"] = system.getInfo("architectureInfo"),
    ["manufacturer"] = system.getInfo("manufacturer"),
    ["model"] = system.getInfo("model"),
    ["name"] = system.getInfo("name"),
    ["build"] = system.getInfo("build"),
    ["platform"] = system.getInfo("platform"),
    ["platformVersion"] = system.getInfo("platformVersion"),
}

--Initialize ads
appodeal.init({ }, { appKey = application.appodeal.appKey })
appodeal.load(application.appodeal.adType)

-- Go to the menu screen
composer.gotoScene("scenes.menu")
