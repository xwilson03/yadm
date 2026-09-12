return {
    'marko-cerovac/material.nvim',
    lazy = false,
    config = function()
        vim.g.material_style = 'deep ocean'
        require('material').setup({})
        vim.cmd('colorscheme material')
    end,
}
