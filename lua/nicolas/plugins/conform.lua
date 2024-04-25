return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require('conform')
		local conform_settings = require('nicolas.plugins.settings.conform_settings')
		local conform_keymaps = require('nicolas.plugins.keymaps.conform_keymaps')

		conform.setup(conform_settings())
		conform_keymaps(conform)
	end,
}
