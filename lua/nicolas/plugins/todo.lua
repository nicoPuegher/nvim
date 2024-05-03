return {
	'folke/todo-comments.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local todo = require('todo-comments')
		local todo_settings = require('nicolas.plugins.settings.todo_settings')
		local todo_keymaps = require('nicolas.plugins.keymaps.todo_keymaps')

		todo.setup(todo_settings())
		todo_keymaps()
	end,
}
