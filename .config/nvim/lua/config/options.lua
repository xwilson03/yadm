vim.opt.clipboard = 'unnamedplus'

vim.opt.expandtab = true
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.o.cmdheight = 0
require("vim._core.ui2").enable({})
