local HS = game:GetService("HttpService");

--- @class config
--- @since v1.0.0
--- Basis for savable configurations.
local config = {};

config.configuration = {};

--- @prop isInitializedConfig boolean
--- @within config
--- @readonly
--- Refers to whether or not the object has been created by config.New()
config._isInitializedConfig = false;
--[[
config._added_isInitializedConfig = true;
config._inTable_isInitializedConfig = true;
]]--

config.__index = config;

--[[
-- ignore all the config._added<> and config._inTable<>
config._addedNew = true;
config._addedAddProp = true;
config._addedModifyProp = true;
config._addedInitialize = true;
config._addedReadProp = true;
config._inTableNew = true;
config._inTableAddProp = true;
config._inTableModifyProp = true;
config._inTableInitialize = true;
config._inTableReadProp = true;
config._addedindex = true;
config._inTableindex = true;
]]--
--- @prop _connection boolean
--- @within config
--- @ignore
--- Heartbeat connection generated during config:Initialize()
config._connection = nil;
--[[
config._added_connection = true;
config._inTable_connection = true;
]]--

--[=[
    Creates a new configuration, or loads a pre-existing one.

    @since v1.0.0
    @within config
    @param name string -- Name of the configuration.
    @return class -- Returns a new configuration.
]=]
function config.New(name)
    if (not isfile(name)) then
        writefile(name,HS:JSONEncode("BEGINNING OF CONFIG"));
    end
    local newConfig = {};
    setmetatable(newConfig,config);
    --- @prop _isInitializedconfig boolean
    --- @within newConfig
    --- @ignore
    --- Refers to whether or not the object has been created with config.New()
    newConfig._isInitializedConfig = true;
    --- @prop _path string
    --- @within newConfig
    --- @ignore
    --- Refers to the name of the file containing the config, essentially being a "path".
    newConfig._path = name;
    --- @prop _contents json i guess
    --- @within newConfig
    --- @ignore
    --- Refers to current contents of the config. Make sure that the only way you're modifying them is with config:ModifyProp().
    newConfig._contents = HS:JSONDecode(readfile(name));

    newConfig._added = true;

    newConfig.New = nil;

    return newConfig;
end

--[=[
    Creates a new property within the config.

    @since v1.0.0
    @method AddProp
    @within config
    @param name -- The name of the property.
    @return string -- A return will only happen during an error.
]=]
function config:AddProp(name,value)
    if (not self._isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    for index,_ in pairs(self.configuration) do
        if (index == name) then
            return "The given property already exists.";
        end
    end

    self.configuration[name] = value;
    self.configuration["_added"..name] = false;

    return;
end

--[=[
    Modifies the value of a given property.

    @since v1.0.0
    @method ModifyProp
    @within config
    @param name -- The name of the property.
    @param value -- The new value of the property.
    @return string -- A return will only happen during an error.
]=]
function config:ModifyProp(name, value)
    if (not self._isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    local doesExist = false;
    for index,_ in pairs(self.configuration) do
        if (index == name) then
            doesExist = true;
        end
    end
    if (not doesExist) then
        return "The given property does not exist.";
    end

    self.configuration[name] = value;
    self.configuration["_added"..name] = false;

    return;
end

--[=[
    Reads the value of a given property.

    @since v1.1.0
    @method ReadProp
    @within config
    @param name -- The name of the property.
    @return any -- A return will happen with either a error message or the value of the property.
]=]
function config:ReadProp(name)
    if (not self._isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    local doesExist = false;
    for index,_ in pairs(self.configuration) do
        if (index == name) then
            doesExist = true;
        end
    end
    if (not doesExist) then
        return "The given property does not exist.";
    end

    return self.configuration[name];
end

--[=[
    Initializes the config, eg. starts modifying the file on every property change & reads the contents of the file.

    @since v1.0.0
    @method Initialize
    @within config
    @return string -- A return will only happen during an error.
]=]
function config:Initialize()
    if (not self._isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end

    local fresh = true;
    if (HS:JSONDecode(readfile(self._path)) ~= "BEGINNING OF CONFIG") then fresh = false end;

    if (fresh == false) then
        for index,_ in pairs(HS:JSONDecode(readfile(self._path))) do
            self.configuration["_inTable"..index] = false;
        end
        for index,value in pairs(HS:JSONDecode(readfile(self._path))) do
            if (not self.configuration["_inTable"..index]) then
                self.configuration[index] = value;
                self.configuration["_inTable"..index] = true;
            end
        end
    end

    local function heartbeat()
        local defaultBegin = false;
        if (HS:JSONDecode(readfile(self._path)) == "BEGINNING OF CONFIG") then defaultBegin = true end;
        --local currentContents = HS:JSONDecode(readfile(self._path));
        self._contents = HS:JSONDecode(readfile(self._path));

        for index,value in pairs(self.configuration) do
            if (index ~= "index") then
                if (self.configuration["_added"..index] == false) then
                    if (defaultBegin) then
                        if (HS:JSONDecode(readfile(self._path)) == "BEGINNING OF CONFIG") then
                            local temp = {};
                            temp[index] = value;
                            writefile(self._path, HS:JSONEncode(temp));
                        end
                    end
                    if (not defaultBegin) then
                        self._contents = HS:JSONDecode(readfile(self._path));
                        self._contents[index] = value;
                        writefile(self._path, HS:JSONEncode(self._contents));
                    end
                    self.configuration["_added"..index] = true;
                end
            end
        end
    end

    local connection = game:GetService("RunService").Heartbeat:Connect(heartbeat);
    self._connection = connection;
    return;
end

--[=[
    Terminates the config, eg. stops changing the config file during every modification.

    @since v1.0.0
    @method Terminate
    @within config
    @return string -- A return will only happen during an error.
]=]
function config:Terminate()
    if (not self.isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    if (self._connection == nil) then
        return "The config hasn't been initialized yet.";
    end

    self._connection:Disconnect();
    return;
end

return config;
