local core = {}


local window = require("complete.window")

core.win = window.new()
core.buffer = vim.api.nvim_create_buf(false, true)
core.win:attach(core.buffer)

core.fetch_source = function (self)
    return {
        "xielongyu",
        "name",
        "function",
        "main body",
        "hello, world"
    }

end

core.update_window = function ()


end

core.open_window = function (self)
    local context = self:get_context()
    local items = self:fetch_source()

    local style = {
        relative = "cursor",
        row = context[1],
        col = context[2],
        width = 20,
        height = #items,
        style = "minimal"
    }
    print(vim.inspect(style))

    vim.api.nvim_buf_set_lines(self.buffer, 0, -1, true, items)
    self.win:open(style)

end

core.close = function (self)
    self.win:close()
end

vim.api.nvim_create_user_command("Openwin", function ()
    core:open_window()
end,
{}
)

vim.api.nvim_create_user_command("Closewin", function ()
    core:close()
end, {})

core.complete = function (self)

end


core.get_context = function (self)
    return vim.api.nvim_win_get_cursor(0)
end


return core
