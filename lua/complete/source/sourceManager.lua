---@class SourceManager
SourceManager = {}

SourceManager.new = function ()
    local self = setmetatable({}, {__index = SourceManager})
    self.sources = {}
    return self
end

SourceManager.fetch_sources = function ()

    return {
        test = {
            "xielongyu",
            "test 01",
            "hello, world"
        }
    }


end

return SourceManager