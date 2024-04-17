return {
	'folke/todo-comments.nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local todo = require('todo-comments')
		local todo_keymaps = require('nicolas.plugins.keymaps.todo_keymaps')

		todo.setup({
			signs = false,
		})

		todo_keymaps(todo)
	end,
}
