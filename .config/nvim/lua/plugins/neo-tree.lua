return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
        sources = { "filesystem" },
        window = { position = "float" },
        filesystem = { filtered_items = { visible = true } },
        event_handlers = {
            {
                event = "file_open_requested",
                handler = function(args)
                    vim.api.nvim_set_current_buf(vim.fn.bufadd(args.path))
                    return { handled = true }
                end,
            },
        },
    },
}
