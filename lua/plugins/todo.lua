return {
    'folke/todo-comments.nvim',
    event = 'InsertEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local todo = require('todo-comments')

        todo.setup({
            signs = false,
        })
    end,
}
