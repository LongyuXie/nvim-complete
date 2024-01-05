---@class complete.utils.EventModel
---@field event_list table
local EventModel = {}

EventModel.new = function()
    local self = setmetatable({}, { __index = EventModel })

    self.event_list = {}

    return self
end


EventModel.on = function(self, name, callback)
    if self.event_list[name] == nil then
        self.event_list[name] = {}
    end

    table.insert(self.event_list[name], callback)

    return function()
        self:off(name, callback)
    end
end


EventModel.off = function(self, name, callback)
    local found = 0

    for i, cb in ipairs(self.event_list[name] or {}) do
        if cb == callback then
            found = i
            break
        end
    end

    if found ~= 0 then
        table.remove(self.event_list[name], found)
    end
end

EventModel.clear = function (self)
    self.event_list = {}
end

EventModel.emit = function(self, name, ...)
    if self.event_list[name] == nil then
        return false
    end

    for _, callback in ipairs(self.event_list) do
        callback(...)
    end

    return true
end

return EventModel
