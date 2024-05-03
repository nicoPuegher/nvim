return {
	'rose-pine/neovim',
	name = 'rose-pine',
	priority = 1000,
	lazy = false,
	config = function()
		local colorscheme = require('rose-pine')
		local colorscheme_settings = require('nicolas.plugins.settings.colorscheme_settings')

		colorscheme.setup(colorscheme_settings())
		vim.cmd('colorscheme rose-pine')
	end,
}
