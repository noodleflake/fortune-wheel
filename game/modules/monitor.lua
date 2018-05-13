-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-15T19:02:20+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T23:24:51+02:00

local function monitor()

    local self = {
        timer = system.getTimer()
    }

    function self.start()
        local timer = system.getTimer()
        self.timer = timer
        return timer
    end

    function self.stop()
        local timerStart = self.timer
        local timerCurrent = system.getTimer()
        local miliseconds = timerCurrent - timerStart
        self.timer = nil
        self.print(miliseconds)
        return miliseconds
    end

    function self.check()
        local timerStart = self.timer
        local timerCurrent = system.getTimer()
        local miliseconds = timerCurrent - timerStart
        self.timer = timerCurrent
        self.print(miliseconds)
        return miliseconds
    end

    function self.total()
        local timerStart = self.timer
        local timerCurrent = system.getTimer()
        local miliseconds = timerCurrent - timerStart
        self.timer = timerCurrent
        self.print(miliseconds)
        return miliseconds
    end

    function self.print(milisecondsTotal)
        local miliseconds = milisecondsTotal > 60 and (milisecondsTotal % 60) or milisecondsTotal
        local secondsTotal = milisecondsTotal * 0.0001
        local seconds = secondsTotal > 60 and secondsTotal % 60 or secondsTotal
        local minutes = secondsTotal / 60
        print(string.format('%02.0f:%02.0f.%03.0f (mm:ss.ms)', minutes, seconds, miliseconds))
    end

    function self.dispose()
        self.stop()
        self = nil
    end

    return self
end

return monitor()
