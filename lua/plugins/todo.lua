return {
    'folke/todo-comments.nvim',
    event = 'InsertEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local todo = require('todo-comments')

        todo.setup({
            signs = false,
        })

        vim.keymap.set('n', ']t', function()
            todo.jump_next()
        end, { desc = 'Next [T]odo comment' })

        vim.keymap.set('n', '[t', function()
            todo.jump_prev()
        end, { desc = 'Previous [T]odo comment' })
    end,
}
