-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Explorer
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[E]xplorer" })

-- Text manipulation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Cursor movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page jump [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page jump [U]p" })

-- Clipboard
vim.keymap.set("n", "<leader>y", '"+Y', { desc = "[Y]ank line to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "[Y]ank selection to clipboard" })

-- Diagnostics
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "[M]essages" })

-- Command line
vim.keymap.set("c", "<C-r>", "<C-f><Up>", { desc = "Search command history" })
