function config:Initialize()
    if (not self._isInitializedConfig) then
        return "Ensure that you're currently using a config returned by config.New()";
    end

    local fresh = true;
    if (HS:JSONDecode(readfile(self._path)) ~= "BEGINNING OF CONFIG") then fresh = false end;

    if (fresh == false) then
        for index,value in pairs(HS:JSONDecode(readfile(self._path))) do
            if (not self["_inTable"..index]) then
                self[index] = value;
                self["_inTable"..index] = true;
            end
        end
    end

    local function heartbeat()
        local defaultBegin = false;
        if (HS:JSONDecode(readfile(self._path)) == "BEGINNING OF CONFIG") then defaultBegin = true end;
        --local currentContents = HS:JSONDecode(readfile(self._path));
        self._contents = HS:JSONDecode(readfile(self._path));

        for index,value in pairs(self) do
            if (self["_added"..index] == false) then
                if (defaultBegin) then
                    if (HS:JSONDecode(readfile(self._path)) == "BEGINNING OF CONFIG") then
                        writefile(self._path, HS:JSONEncode({index = value}));
                    end
                end
                if (not defaultBegin) then
                    self._contents = HS:JSONDecode(readfile(self._path));
                    self._contents[index] = value;
                    writefile(self._path, HS:JSONEncode(self._contents));
                end
                self["_added"..index] = true;
            end
        end
    end

    local connection = game:GetService("RunService").Heartbeat:Connect(heartbeat);
    self._connection = connection;
    return;
end
