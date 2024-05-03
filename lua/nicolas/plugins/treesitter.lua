return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local treesitter = require('nvim-treesitter.configs')
		local treesitter_settings = require('nicolas.plugins.settings.treesitter_settings')

		treesitter_settings(treesitter)
	end,
}
