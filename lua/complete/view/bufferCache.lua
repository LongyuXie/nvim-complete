local BufferCache = {}

---@private
BufferCache.buffers = {}

-- BufferCache.new = function ()
--     local self = setmetatable({}, {__index = BufferCache})
--     self.buffers = {}
--     return self
-- end

BufferCache.get = function (self, name)
    return self.ensure(self, name)
end

BufferCache.ensure = function (self, name)
    if self.buffers[name] == nil then
        self.buffers[name] = vim.api.nvim_create_buf(false, true)
    end

    return self.buffers[name]

end

return BufferCache