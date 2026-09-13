return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
        settings = {
            save_on_toggle = true, -- save marks when the list is closed
            sync_on_ui_close = true,
        },
    },
}