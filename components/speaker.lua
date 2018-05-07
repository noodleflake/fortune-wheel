-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-22T00:38:24+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T22:23:59+02:00


-- Your code here
local data_store = require("modules.data_store")
local audio = require("audio")

local function speaker()
    local self = { }

    function self.reserveChannels(amount)
        local unreservedChannels = (audio.unreservedUsedChannels + audio.unreservedFreeChannels)
        local reservedChannels = audio.totalChannels - unreservedChannels
        local addedChannels = (amount == nil or amount == 0) and 1 or amount
        audio.reserveChannels(reservedChannels + addedChannels)
    end

    function self.populateWithSettings()
        local soundVolume = data_store.get("soundVolume")
        if(soundVolume == nil or soundVolume < 0 or soundVolume > 10) then
            soundVolume = audio.getVolume({ channel = 0 }) * 10
        end
        local musicVolume = data_store.get("musicVolume")
        if(musicVolume == nil or musicVolume < 0 or musicVolume > 10) then
            musicVolume = audio.getVolume({ channel = 1 }) * 10
        end
        audio.setVolume(soundVolume * 0.1, { channel = 0 })
        audio.setVolume(musicVolume * 0.1, { channel = 1 })
    end

    function self.init()

        --Channel1=Music
        self.reserveChannels()

        --Load from Database
        self.populateWithSettings()
    end

    return self
end
return speaker()
