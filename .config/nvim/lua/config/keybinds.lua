vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>w", ":w<CR>",   { desc = "Save buffer" })
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus below" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus above" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right" })

vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>",    { desc = "Search buffers" })
vim.keymap.set("n", "<leader>p", ":Telescope workspaces<CR>", { desc = "Search workspaces" })

-- Buffers
vim.keymap.set("n", "<leader>t", ":terminal<CR>i", { desc = "Open Terminal" })
vim.keymap.set("n", "<leader>g", ":terminal lazygit<CR>i", { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>e", ":bdelete!<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>d", function() require("lib.diffview").toggle() end, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
