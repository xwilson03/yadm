local diffview_lib = require("diffview.lib")

local M = {}

function M.toggle()
    if #diffview_lib.views == 0 then
        vim.cmd("DiffviewOpen")
        return
    end
    for i = #diffview_lib.views, 1, -1 do
        diffview_lib.views[i]:close()
    end
end

return M
