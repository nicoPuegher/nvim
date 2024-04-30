return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local lint = require('lint')
		local lint_settings = require('nicolas.plugins.settings.lint_settings')
		local lint_keymaps = require('nicolas.plugins.keymaps.lint_keymaps')

		lint_settings(lint)
		lint_keymaps(lint)
	end,
}
