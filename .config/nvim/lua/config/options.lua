local opt = vim.opt

opt.clipboard = 'unnamedplus'        -- use system clipboard

opt.expandtab = true                 -- use spaces not tabs
opt.tabstop = 4                      -- tab width = 4

opt.number = true                    -- show line numbers
opt.relativenumber = true            -- use relative line numbers
opt.cursorline = true                -- highlight current line...
opt.cursorlineopt = "number"           -- ...but just the line number

opt.cmdheight = 0                    -- hide cmdline bar when not in use
require("vim._core.ui2").enable({})  -- enable UI2 (experimental, for cmd/msg/alerts)
