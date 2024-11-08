-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Explorer
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, { desc = '[F]ile [E]xplorer' })

-- Text manipulation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<leader>p', '"_dP', { desc = '[P]aste keep copy' })
vim.keymap.set(
    'n',
    '<leader>r',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = '[R]eplace under cursor' }
)

-- Clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank selection to clipboard' })
