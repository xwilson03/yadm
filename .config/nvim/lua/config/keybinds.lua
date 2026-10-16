vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>",   { desc = "Save buffer" })
vim.keymap.set("t", "<M-Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Navigation (Integrated with Tmux)
vim.keymap.set("n", "<M-h>", function() require("tmux").move_left() end, { desc = "Focus left" })
vim.keymap.set("n", "<M-j>", function() require("tmux").move_bottom() end, { desc = "Focus below" })
vim.keymap.set("n", "<M-k>", function() require("tmux").move_top() end, { desc = "Focus above" })
vim.keymap.set("n", "<M-l>", function() require("tmux").move_right() end, { desc = "Focus right" })
vim.keymap.set("n", "<M-n>", function() require("tmux").next_window() end, { desc = "Next window" })
vim.keymap.set("n", "<M-p>", function() require("tmux").previous_window() end, { desc = "Previous window" })

-- Resize (Integrated with Tmux)
vim.keymap.set("n", "<C-h>", function() require("tmux").resize_left() end, { desc = "Resize left" })
vim.keymap.set("n", "<C-j>", function() require("tmux").resize_bottom() end, { desc = "Resize below" })
vim.keymap.set("n", "<C-k>", function() require("tmux").resize_top() end, { desc = "Resize above" })
vim.keymap.set("n", "<C-l>", function() require("tmux").resize_right() end, { desc = "Resize right" })

-- Swap (Integrated with Tmux)
vim.keymap.set("n", "<C-M-h>", function() require("tmux").swap_left() end, { desc = "Swap left" })
vim.keymap.set("n", "<C-M-j>", function() require("tmux").swap_bottom() end, { desc = "Swap below" })
vim.keymap.set("n", "<C-M-k>", function() require("tmux").swap_top() end, { desc = "Swap above" })
vim.keymap.set("n", "<C-M-l>", function() require("tmux").swap_right() end, { desc = "Swap right" })


vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>",    { desc = "Search buffers" })
vim.keymap.set("n", "<leader>p", ":Telescope workspaces<CR>", { desc = "Search workspaces" })

-- Buffers
vim.keymap.set("n", "<leader>t", ":terminal<CR>i", { desc = "Open Terminal" })

vim.keymap.set("n", "<leader>g", function() require("lib.terminals").surface("lazygit", "lazygit") end, { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>e", ":bdelete!<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>d", function() require("lib.diffview").toggle() end, { desc = "Toggle Diffview" })
vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle file tree" })

-- Harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>o", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon: Open list" })

local function harpoon_jump(i) return function() require("harpoon"):list():select(i) end end
for i = 1, 5 do
    vim.keymap.set("n", "<leader>" .. i, harpoon_jump(i), { desc = ("Harpoon: Jump to slot %d"):format(i) })
end
