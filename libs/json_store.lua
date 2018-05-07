-- @Author: Christian Youngblood <martinswanepoel>
-- @Date:   2018-01-15T19:02:20+02:00
-- @Email:  christian.youngblood@trilogix.co.za
-- @Project: Fortune Wheel
--
-- @Last modified by:   martinswanepoel
-- @Last modified time: 2018-05-06T23:04:34+02:00

local function json_store()
    local json = require("json")

    local self = {
      dbInstance = nil,
      dbPath = nil
    }

    function self.clear()
        os.remove(self.dbPath)
    end

    function self.populate()
        local file = io.open(self.dbPath, 'r')
        if file then
            local jsonRaw = file:read()
            if jsonRaw then
              self.dbInstance = json.decode(jsonRaw)
            end
            io.close(file)
        end
        if not(self.dbInstance) then
            self.dbInstance = { }
        end
    end

    function self.save()
        local file = io.open(self.dbPath, 'w')
        if file then
            local dbInstance = json.encode(self.dbInstance)
            file:write(dbInstance)
            io.close(file)
        end
    end

    function self.get(key, root)
      local root = root
      if not(root) then
          if not(self.dbInstance) then
              self.populate()
          end
          root = self.dbInstance
      end
      local foundKey = false
      for k,v in pairs(root) do
          if k == key then
            return v, k, root
          end
      end
      for k,v in pairs(root) do
          if type(v) == 'table' then
            local object = self.get(key, v)
            if object then
                return object, key, v
            end
          end
      end
    end

    function self.delete(key, root)
        local objectValue, objectKey, parent = self.get(key, root)
        if objectValue then
            parent[objectKey] = nil
        end
    end

    function self.insert(key, value, root)
        local root = root and root or self.dbInstance
        root[key] = value
    end

    function self.update(key, value, root)
        local objectValue, objectKey, parent = self.get(key, root)
        if objectValue then
            parent[objectKey] = value
        end
    end

    function self.set(key, value, root)
        local objectValue, objectKey, parent = self.get(key, root)
        if not(objectValue) then
            self.insert(key, value, root)
        elseif(type(value) ~= type(objectValue)) then
            self.delete(key, parent)
            self.insert(key, value, parent)
        else
            self.update(key, value, parent)
        end
        self.save()
    end

    function self.init(databaseName)
        local databaseName = databaseName
        if not(databaseName) then
          databaseName = "database.json"
        end
        self.dbPath = system.pathForFile(databaseName, system.DocumentsDirectory)

    end

    function self.dispose()
        self.dbPath = nil
        self.dbInstance = nil
        self = nil
    end

    return self
end

return json_store()
