local function save_session()
    local path = require("workspaces").path()
    if not path then return end
    require("resession").save(path, { dir = "workspace", notify = false })
end

-- Hide modified file buffers (except terminals) so resession's load doesn't wipe them
local function shelter_modified()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if
            vim.bo[bufnr].buftype ~= "terminal"
            and vim.bo[bufnr].modified
            and vim.fn.buflisted(bufnr) == 1
        then
            vim.bo[bufnr].buflisted = false
            vim.bo[bufnr].bufhidden = "hide"
        end
    end
end

return {
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    opts = {
        hooks = {
            open_pre = save_session,
            open = function(_, path)
                shelter_modified()
                require("resession").load(path, {
                    dir = "workspace",
                    silence_errors = true,
                    notify = false,
                })
            end,
        },
    },
    config = function(_, opts)
        require("workspaces").setup(opts)
        require("workspaces").sync_dirs()
        require("telescope").load_extension("workspaces")

        vim.api.nvim_create_autocmd("VimLeavePre", {
            group = vim.api.nvim_create_augroup("workspaces_persist", { clear = true }),
            callback = save_session,
        })
    end,
}