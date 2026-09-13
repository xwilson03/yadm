-- Delete terminals when process exits
vim.api.nvim_create_autocmd("TermClose", {
    callback = function() vim.cmd("bdelete!") end
})

-- Give terminals friendly buffer names
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local cmd = vim.api.nvim_buf_get_name(0):match("term://.-//%d+:(.+)$")
        if cmd then vim.api.nvim_buf_set_name(0, vim.fn.fnamemodify(cmd, ":t")) end
    end,
})

-- Auto-close unmodified file buffers if not visible anywhere
vim.api.nvim_create_autocmd("BufWinLeave", {
    callback = function(args)
        local buf = args.buf
        vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(buf) then return end

            local bo = vim.bo[buf]
            if bo.buftype ~= "" or not bo.buflisted then return end  -- only file buffers
            if bo.modified then return end                           -- only unmodified files

            -- keep it if still visible in ANY window of ANY tab
            for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
                for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
                    if vim.api.nvim_win_get_buf(win) == buf then return end
                end
            end

            vim.cmd("bdelete " .. buf)
        end)
    end,
})
