local terms = require("toggleterm.terminal")

local M = {}

function M.bnext(direction)
    local current = vim.api.nvim_get_current_buf()
    if not vim.bo[current].buflisted then return end

    local bufs = vim.fn.getbufinfo({ buflisted = true })
    local buftype = vim.bo[current].buftype

    local idx
    for i, b in ipairs(bufs) do
        if b.bufnr == current then idx = i; break end
    end

    for _ = 1, #bufs do
        idx = (idx % #bufs) + 1
        if vim.bo[bufs[idx].bufnr].buftype == buftype then
            vim.api.nvim_set_current_buf(bufs[idx].bufnr)
            return
        end
    end
end

function M.bdelete()
    local bufnr = vim.api.nvim_get_current_buf()
    pcall(vim.cmd, "bprevious")
    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.api.nvim_buf_delete(bufnr, { force = true })
    end
end

return M
