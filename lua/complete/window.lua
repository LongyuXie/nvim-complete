local window = {}

local misc = require("complete.misc")


window.new = function () 
    self = setmetatable({}, {__index = window})
    -- setmetatable(o, index=self)
    self.buffer = nil
    self.win = nil
    self.style = nil

    self.buffer_opt = nil
    self.window_opt = nil

    return self
end


window.attach = function(self, buffer, opts)
    self.buffer = buffer
end

window.visible = function (self)
    return self.win and vim.api.nvim_win_is_valid(self.win)
end

window.set_option = function (self, opts)

end

window.set_style = function (self, style)
    self.style = style
end

window.open = function (self, style)
    if style then
        self:set_style(style)
    end

    
    local style = misc.deepcopy(self.style)
    style.noautocmd = true
    print(vim.inspect(style))
    
    self.win = vim.api.nvim_open_win(self.buffer, false, style)

end

window.update = function (self)

end

window.close = function (self)
    if not self:visible() then
        return
    end
    nvim.api.nvim_win_hide(self.win)
    self.win = nil
end


return window
