-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-15T19:02:20+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-07T22:24:24+02:00

local function data_store()
    local self = {
        storeInstance = nil
    }

    function self.clear()
        self.storeInstance.clear()
    end

    function self.get(key)
        local objectValue = self.storeInstance.get(key)
        return objectValue
    end

    function self.set(key, value)
        self.storeInstance.set(key, value)
    end

    function self.init(databaseName, isSql)
        self.storeInstance = require('modules.' .. (isSql and 'sql' or 'json') .. '_store')
        self.storeInstance.init(databaseName)
    end

    function self.init_sql(databaseName)
        self.init(databaseName, true)
    end

    function self.init_json(databaseName)
        self.init(databaseName, false)
    end

    function self.dispose()
        self.storeInstance.dispose()
    end

    return self
end

return data_store()
