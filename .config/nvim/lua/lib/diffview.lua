local diffview_lib = require("diffview.lib")

local M = {}

function M.toggle()
    if #diffview_lib.views == 0 then
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[bufnr].filetype == "alpha" and vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_buf_delete(bufnr, { force = true })
            end
        end
        vim.cmd("DiffviewOpen")
        return
    end
    for i = #diffview_lib.views, 1, -1 do
        diffview_lib.views[i]:close()
    end
end

return M
