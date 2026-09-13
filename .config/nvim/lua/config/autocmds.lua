vim.api.nvim_create_autocmd("TermClose", {
    callback = function() vim.cmd("bdelete!") end
})
