vim.opt.clipboard = 'unnamedplus'    -- use system clipboard

vim.opt.expandtab = true             -- use spaces not tabs
vim.opt.tabstop = 4                  -- tab width = 4

vim.opt.number = true                -- show line numbers
vim.opt.relativenumber = true        -- use relative line numbers
vim.opt.cursorline = true            -- highlight current line...
vim.opt.cursorlineopt = "number"       -- ...but just the line number 

vim.o.cmdheight = 0                  -- hide cmdline bar when not in use
require("vim._core.ui2").enable({})  -- enable UI2 (experimental, for cmd/msg/alerts)
