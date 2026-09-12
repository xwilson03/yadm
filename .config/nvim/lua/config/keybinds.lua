vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>w", ":w<CR>",   { desc = "Save buffer" })

-- Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus below" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus above" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right" })

-- Buffers
vim.keymap.set("n", "<leader>e", function() require("lib.cycle").close_and_cycle() end, { desc = "Close buffer" })
vim.keymap.set("n", "<Tab>",     function() require("lib.cycle").cycle("next")     end, { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>",   function() require("lib.cycle").cycle("prev")     end, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>t", function() vim.cmd("ToggleTerm " .. vim.v.count)  end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>d", function() require("lib.diffview").toggle()       end, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>",       { desc = "Toggle file tree" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]],             { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>p", ":Telescope workspaces<CR>", { desc = "Search workspaces" })

