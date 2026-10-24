local opt = vim.opt

-- General
opt.clipboard = 'unnamedplus'        -- use system clipboard
opt.undofile = true                  -- persistent undo history
opt.autoread = true                  -- reread files when changes are detected
opt.scrolloff = 3                    -- # lines kept between cursor and edge of screen
opt.signcolumn = "yes:1"             -- always show sign column (lsp errors/warnings)

-- Code Fold
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
opt.foldlevelstart = 99              -- show all code by default

-- Whitespace
opt.expandtab = true                 -- use spaces not \t
opt.tabstop = 4                      -- visual width of \t
opt.shiftwidth = 0                   -- ALL indentation; 0 = use \t visual width
opt.softtabstop = -1                 -- indent snap-to; -1 = snap to shiftwidth
opt.wrap = false                     -- disable linewrap
opt.fcs = 'eob: '                    -- hide '~' chars after end-of-file

-- Line Numbers
opt.number = true                    -- show line numbers
opt.relativenumber = true            -- use relative line numbers
opt.cursorline = true                -- highlight current line...
opt.cursorlineopt = 'number'         -- ...but just the line number

opt.cmdheight = 0                    -- hide cmdline bar when not in use
require('vim._core.ui2').enable({})  -- enable UI2 (experimental, for cmd/msg/alerts)
