local terms = require("toggleterm.terminal")

local M = {}

function M.cycle_term(direction)
    local all = terms.get_all()
    if #all < 2 then return end

    local focused = terms.get_focused_id()
    local step = direction == "next" and 1 or -1
    local idx

    for i, term in ipairs(all) do
        if term.id == focused then idx = i; break end
    end

    idx = ((idx - 1 + step) % #all) + 1
    vim.cmd("ToggleTerm " .. all[idx].id)
end

function M.cycle_buf(direction)
    local current = vim.api.nvim_get_current_buf()
    if not vim.bo[current].buflisted then return end

    local bufs = vim.fn.getbufinfo({ buflisted = true })
    local buftype = vim.bo[current].buftype
    local step = direction == "next" and 1 or -1

    local idx
    for i, b in ipairs(bufs) do
        if b.bufnr == current then idx = i; break end
    end

    for _ = 1, #bufs do
        idx = ((idx - 1 + step) % #bufs) + 1
        if vim.bo[bufs[idx].bufnr].buftype == buftype then
            vim.api.nvim_set_current_buf(bufs[idx].bufnr)
            return
        end
    end
end

function M.cycle(direction)
    if vim.bo.buftype == "terminal" and vim.b.toggle_number then
        M.cycle_term(direction)
    else
        M.cycle_buf(direction)
    end
end

function M.close_and_cycle()
    if vim.b.toggle_number then
        M.close_and_cycle_terminal()
    else
        M.close_and_cycle_buffer()
    end
end

function M.close_and_cycle_terminal()
    local all = terms.get_all()
    local buf = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
    end
    if #all > 1 then
        vim.cmd("ToggleTerm")
    end
end

function M.close_and_cycle_buffer()
    local bufnr = vim.api.nvim_get_current_buf()
    pcall(vim.cmd, "bprevious")
    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.api.nvim_buf_delete(bufnr, { force = true })
    end
end

return M
