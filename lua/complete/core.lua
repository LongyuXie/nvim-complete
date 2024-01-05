local SourceManager = require("complete.source.sourceManager")
local view          = require("complete.view.view")
local misc          = require("complete.utils.misc")

local core          = {}

core.view = view.new()
core.sourceManager = SourceManager.new()


core.close = function(self)
    self.view:close()
end

core.abort = function(self)
    self.view:close()
end


vim.api.nvim_create_user_command("Complete", function()
        core:complete()
    end,
    {}
)

vim.api.nvim_create_user_command("CompleteAbort", function()
        core:close()
    end,
    {})

core.complete = function(self)
    local ss = self.sourceManager.fetch_sources()
    local items = {}
    for name, sourceItem in pairs(ss) do
        items = misc.concatArray(items, sourceItem)
    end

    -- self.view:
    self.view:open(items)

end


return core
