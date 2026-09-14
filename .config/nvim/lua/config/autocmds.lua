-- Delete terminals when process exits
vim.api.nvim_create_autocmd("TermClose", {
    callback = function(args)
        if not vim.api.nvim_buf_is_valid(args.buf) then return end
        vim.api.nvim_buf_delete(args.buf, { force = true })
    end,
})

-- Give terminals friendly, unique buffer names
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local name = vim.api.nvim_buf_get_name(0)
        local cmd = name:match("^term://.-//%d+:(.*)$")
        if not cmd then return end
        cmd = cmd:gsub(":%d+$", "") -- strip :{index}

        local base = vim.fn.fnamemodify(cmd, ":t")
        local name = base
        local n = 1
        while vim.fn.bufexists(name) ~= 0 do
            name = ("%s (%d)"):format(base, n)
            n = n + 1
        end
        vim.api.nvim_buf_set_name(0, name)
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
