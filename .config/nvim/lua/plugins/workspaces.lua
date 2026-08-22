return {
    "natecraddock/workspaces.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    opts = {
        hooks = {
            open_pre = function()
                require("lib.workspace").save_session()
            end,
            open = function(_, path)
                require("lib.workspace").load_session(path)
            end,
        },
    },
    config = function(_, opts)
        require("workspaces").setup(opts)
        require("workspaces").sync_dirs()
        require("telescope").load_extension("workspaces")
    end,
}
