local augroup = vim.api.nvim_create_augroup("autocmd", { clear = true })

vim.api.nvim_create_autocmd("VimLeavePre", {
    group = augroup,
    callback = function()
        require("lib.workspace").save_session()
    end,
})
