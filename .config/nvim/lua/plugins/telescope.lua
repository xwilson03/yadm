return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = { initial_mode = "normal" },
        pickers = { buffers = { disable_coordinates = true } },
    },
}
