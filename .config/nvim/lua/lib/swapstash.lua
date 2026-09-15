local M = {}

local stash_dir = vim.fn.stdpath("state") .. "/swap-stash"

-- Flush unsave changes to swapfiles, then relocate to avoid autodelete-on-exit
function M.stash()
    vim.cmd("silent! preserve")
    vim.fn.mkdir(stash_dir, "p")

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local bo = vim.bo[buf]
        if not (bo.buflisted and bo.buftype == "" and bo.modified) then goto continue end

        local swappath = vim.fn.swapname(buf)
        if swappath == "" then goto continue end

        -- pin the undo history for buffers we're saving
        vim.api.nvim_buf_call(buf, function()
            local uf = vim.fn.undofile(vim.api.nvim_buf_get_name(buf))
            vim.cmd("silent! wundo! " .. vim.fn.fnameescape(uf))
        end)

        -- normalize fallback extensions back to .swp
        local name = vim.fn.fnamemodify(swappath, ":t"):gsub("%.s[a-z][a-z]$", ".swp")
        os.rename(swappath, stash_dir .. "/" .. name)

        ::continue::
    end
end

-- Move stashed swapfiles back to swap directory
function M.restore()
    local swap_dir = vim.fn.fnamemodify(vim.o.directory:match("[^,]+"), ":p")
    if vim.fn.isdirectory(stash_dir) == 0 then return end
    vim.fn.mkdir(swap_dir, "p")
    for _, name in ipairs(vim.fn.readdir(stash_dir)) do
        os.rename(stash_dir .. "/" .. name, swap_dir .. "/" .. name)
    end
end

return M
