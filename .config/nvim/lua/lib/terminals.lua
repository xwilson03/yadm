local M = {}
local singletons = {}

-- Surface a named singleton terminal. Flow:
--   visible -> focus its window
--   hidden  -> switch current window to its buffer
--   none    -> start fresh in the current window
function M.surface(name, cmd)
    local cur = vim.api.nvim_get_current_win()
    local buf = singletons[name]

    -- none: no live session, start fresh in the current window
    if not buf or not vim.api.nvim_buf_is_valid(buf) then
        local new = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_win_set_buf(cur, new)
        vim.fn.termopen(cmd)
        vim.cmd("startinsert")
        singletons[name] = new
        return
    end

    -- visible: focus its window in any tabpage
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
            vim.api.nvim_set_current_win(win)
            vim.cmd("startinsert")
            return
        end
    end

    -- hidden: switch current window to its buffer (no split)
    vim.api.nvim_win_set_buf(cur, buf)
    vim.cmd("startinsert")
end

return M
