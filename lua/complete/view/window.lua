
---@class complete.view.Window
---@field buffer integer
---@field win integer
local Window = {}

local misc = require("complete.utils.misc")


Window.new = function () 
    self = setmetatable({}, {__index = Window})
    -- setmetatable(o, index=self)
    self.buffer = nil
    self.win = nil
    self.style = nil

    self.buffer_opt = nil
    self.window_opt = nil

    return self
end


Window.attach = function(self, buffer, opts)
    self.buffer = buffer
end

Window.visible = function (self)
    return self.win and vim.api.nvim_win_is_valid(self.win)
end

Window.set_option = function (self, opts)

end

Window.set_style = function (self, style)
    self.style = style
end

Window.open = function (self, style)
    if style then
        self:set_style(style)
    end

    
    local style = misc.deepcopy(self.style)
    style.noautocmd = true
    print(vim.inspect(style))
    
    self.win = vim.api.nvim_open_win(self.buffer, false, style)

end

Window.update = function (self)

end

Window.close = function (self)
    if not self:visible() then
        return
    end
    nvim.api.nvim_win_hide(self.win)
    self.win = nil
end


return Window
