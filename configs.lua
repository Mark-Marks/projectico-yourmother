local HS = game:Getservice("HttpService");

--- @class config
--- @since v1.0.0
--- Basis for savable configurations.
local config = {};

--- @prop isInitializedConfig boolean
--- @within config
--- @readonly
--- Refers to whether or not the object has been created by config.New()
config.isInitializedConfig = false;

config.__index = config;

--- @prop _addedNew boolean
--- @within config
--- @ignore
--- Makes config:Initialize() ignore config.New()
config._addedNew = true;
--- @prop _addedAddProp boolean
--- @within config
--- @ignore
--- Makes config:Initialize() ignore config:AddProp()
config._addedAddProp = true;
--- @prop _addedModifyProp boolean
--- @within config
--- @ignore
--- Makes config:Initialize() ignore config:ModifyProp()
config._addedModifyProp = true;
--- @prop _addedInitialize boolean
--- @within config
--- @ignore
--- Makes config:Initialie() ignore config:Initialize()
config._addedInitialize = true;
--- @prop _connection boolean
--- @within config
--- @ignore
--- Heartbeat connection generated during config:Initialize()
config._connection = nil;

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
    --- @prop isInitializedconfig boolean
    --- @within newConfig
    --- @ignore
    --- Refers to whether or not the object has been created with config.New()
    newConfig.isInitializedConfig = true;
    --- @prop path string
    --- @within newConfig
    --- @ignore
    --- Refers to the name of the file containing the config, essentially being a "path".
    newConfig.path = name;
    --- @prop contents string
    --- @within newConfig
    --- @ignore
    --- Refers to current contents of the config. Make sure that the only way you're modifying them is with config:ModifyProp().
    newConfig.contents = readfile(name);

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
function config:AddProp(name)
    if (not self.isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    for index,_ in pairs(self) do
        if (index == name) then
            return "The given property already exists.";
        end
    end

    self[name] = nil;
    self["_added"..name] = false;

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
    if (not self.isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end
    local doesExist = false;
    for index,_ in pairs(self) do
        if (index == name) then
            doesExist = true;
        end
    end
    if (not doesExist) then
        return "The given property does not exist.";
    end

    self[name] = value;
    self["_added"..name] = false;

    return;
end

--[=[
    Initializes the config, eg. starts modifying the file on every property change.

    @since v1.0.0
    @method Initialize
    @within config
    @return string -- A return will only happen during an error.
]=]
function config:Initialize()
    if (not self.isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end

    local function heartbeat()
        local defaultBegin = false;
        if (HS:JSONDecode(readfile(self.path)) == "BEGINNING OF CONFIG") then defaultBegin = true end;
        local currentContents = HS:JSONDecode(readfile(self.path));

        for index,value in pairs(self) do
            if (self["_added"..index] == false) then
                if (defaultBegin) then
                    if (HS:JSONDecode(readfile(self.path)) == "BEGINNING OF CONFIG") then
                        writefile(HS:JSONEncode({index = value}));
                    end
                end
                if (not defaultBegin) then
                    currentContents = HS:JSONDecode(readfile(self.path));
                    currentContents[index] = value;
                    writefile(HS:JSONEncode(currentContents));
                end
                self["_added"..index] = true;
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
