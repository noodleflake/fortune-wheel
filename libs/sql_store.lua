-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-15T19:02:20+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-06T17:55:22+02:00

local function sql_store()
    local sqlite3 = require("sqlite3")

    local self = {
        dbInstance = nil,
        dbPath = nil
    }

    function self.create()
        self.open()
        self.dbInstance:exec("CREATE TABLE IF NOT EXISTS settings (key,value);")
        self.close()
    end

    function self.isopen()
        local dbInstance = self.dbInstance
        return dbInstance ~= nil and dbInstance:isopen() or false
    end

    function self.open()
        if not(self.isopen()) then
            self.dbInstance = sqlite3.open(self.dbPath)
        end
    end

    function self.close()
        if (self.isopen()) then
            self.dbInstance:close()
        end
    end

    function self.clear()
        self.open()
        self.dbInstance:exec("DROP TABLE IF EXISTS settings;")
        self.close()
    end

    function self.delete(key)
        self.open()
        self.dbInstance:exec("DELETE FROM settings WHERE key='"..key.."'")
        self.close()
    end

    function self.insert(key , value)
        self.open()
        local dbValue = type(value) == "string" and "'"..value.."'" or value
        self.dbInstance:exec("INSERT INTO settings (key,value) VALUES ('"..key.."',"..dbValue..");")
        self.close()
    end

    function self.update(key , value)
        self.open()
        local dbValue = type(value) == "string" and "'"..value.."'" or value
        self.dbInstance:exec("UPDATE settings SET value="..dbValue.." WHERE key='"..key.."';")
        self.close()
    end

    function self.get(key)
        local value = nil
        self.open()
        for row in self.dbInstance:nrows("SELECT * FROM settings WHERE key='"..key.."'") do
            value = row.value
            break
        end
        self.close()
        return value
    end

    function self.set(key, value)
        local databaseValue = self.get(key)
        if (databaseValue == nil) then
            self.insert(key, value)
        elseif(type(value) ~= type(databaseValue)) then
            self.delete(key)
            self.insert(key, value)
        else
            self.update(key, value)
        end
    end

    function self.init(databaseName)
        local databaseName = databaseName
        if not(databaseName) then
          databaseName = "database.db"
        end
        self.dbPath = system.pathForFile(databaseName, system.DocumentsDirectory)
        self.create()
    end

    function self.dispose()
        self.close()
        self.dbPath = nil
        self.dbInstance = nil
        self = nil
    end

    return self
end

return sql_store()
