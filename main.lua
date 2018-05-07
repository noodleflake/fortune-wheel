-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-05-05T22:02:30+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T21:15:10+02:00


local config = require("config")
local composer = require("composer")
local appodeal = require("plugin.appodeal")
local data_store = require("libs.data_store")
local monitor = require("libs.monitor")
local speaker = require("libs.speaker")

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

-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true

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
appodeal.init({ }, { appKey=application.appodeal.appKey })
appodeal.load(application.appodeal.adType)

-- Go to the menu screen
composer.gotoScene("menu")
