vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "Quit neovim" })

vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus below" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus above" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus right" })

vim.keymap.set("n", "<leader>e", function() require("lib.cycle").close_and_cycle() end, { desc = "Close buffer/terminal" })
vim.keymap.set("n", "<Tab>", function() require("lib.cycle").cycle("next") end, { desc = "Next buffer/terminal" })
vim.keymap.set("n", "<S-Tab>", function() require("lib.cycle").cycle("prev") end, { desc = "Previous buffer/terminal" })

vim.keymap.set("n", "<C-j>", function() require("lib.cursors").add_below() end, { desc = "Add cursor below" })
vim.keymap.set("n", "<C-k>", function() require("lib.cursors").add_above() end, { desc = "Add cursor above" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>t", function() vim.cmd("ToggleTerm " .. vim.v.count) end, { desc = "Toggle terminal" })

vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>p", ":Telescope workspaces<CR>", { desc = "Find workspaces" })
vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { desc = "Open Neogit" })
vim.keymap.set("n", "<leader>G", function() require("lib.gitgraph").open() end, { desc = "Show git graph" })
vim.keymap.set("n", "<leader>d", function() require("lib.diffview").toggle() end, { desc = "Toggle Diffview" })

