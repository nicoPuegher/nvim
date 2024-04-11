vim.g.mapleader = ' '

-- File explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = 'Open [F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Move selected line upwards
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv") -- Move selected line downwards

-- Cursor movement
vim.keymap.set('n', '<C-u', '<C-u>zz') -- Half page jump upwards
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Half page jump downwards
vim.keymap.set('n', 'N', 'Nzzzv') -- Upwards in highlight search, keep cursor in the middle
vim.keymap.set('n', 'n', 'nzzzv') -- Downwards in highlight search, keep cursor in the middle

-- Clipboard
vim.keymap.set('n', '<leader>Y', '"+Y') -- Yank current line to system clipboard including end of line
vim.keymap.set('v', '<leader>y', '"+y') -- Yank selected text to system clipboard
vim.keymap.set('n', '<leader>d', '"*dd') -- Delete current line to system clipboard
vim.keymap.set('v', '<leader>d', '"*dd') -- Delete selected lines to system clipboard

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
