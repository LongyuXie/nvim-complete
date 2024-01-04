local misc = {}

misc.set_window_option = function (win, name, value)
    local eventignore = vim.opt.eventignore:get()
    vim.opt.eventignore:append('OptionSet')
    vim.api.nvim_win_set_option(window, name, value)
    vim.opt.eventignore = eventignore
end


misc.set_buffer_option = function (buffer, name, value)
    local eventignore = vim.opt.eventignore:get()
    vim.opt.eventignore:append('OptionSet')
    vim.api.nvim_buf_set_option(buffer, name, value)
    vim.opt.eventignore = eventignore
end


misc.deepcopy = function (tbl)
    if type(tbl) ~= 'table' then return tbl end

    local copy = {}
    for key, value in pairs(tbl) do
        copy[key] = misc.deepcopy(value)
    end
    return copy

end

return misc
