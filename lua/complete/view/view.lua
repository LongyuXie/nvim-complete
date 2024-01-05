local Window = require("complete.view.window")
local bufferCache = require("complete.view.bufferCache")


---@class view
---@field win complete.view.Window
---@field buffer any
local view = {}


-- 管理补全窗口
-- 计算窗口显示的位置
-- 更新窗口内容
view.new = function ()
    local self = setmetatable({}, {__index=view})

    self.win = Window.new()
    self.buffer = bufferCache:get('test')
    self.win:attach(self.buffer)


    return self
end


---@return complete.view.window.style
view.adjust_style = function (self)
    -- local cursor = vim.api.nvim_win_get_cursor(0)
    -- local row = cursor[1]
    -- local col = cursor[2]
    return {
        relative = "cursor",
        width = 40,
        height = 5,
        row = 1,
        col = 0,
        style = "minimal"

    }
end

view.open = function (self, items)

    local style = self:adjust_style()

    -- 位置信息从哪里来?
    -- 只考虑相对位置, 补全窗口出现在光标下(1, 0)的偏移位置
    self.win:open(style)
    vim.api.nvim_buf_set_lines(self.buffer, 0, -1, false, items)
    
end

view.close = function (self)
    self.win:close()
end


view.abort = function (self)
    
end



return view