return {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "natecraddock/workspaces.nvim",
    },
    config = function() require("lib.alpha").setup() end,
}
