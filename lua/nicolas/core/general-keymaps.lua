vim.g.mapleader = " " -- Set leader key to <Space>

local keymap = vim.keymap -- For conciseness

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make window splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window split" })
