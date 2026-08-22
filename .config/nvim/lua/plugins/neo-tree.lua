return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        opts = {
            sources = { "filesystem" },
            window = {
                position = "left",
                width = 40,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
        },
    },
}
