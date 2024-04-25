return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VeryLazy',
	config = function()
		local lualine = require('lualine')
		local lualine_settings = require('nicolas.plugins.settings.lualine_settings')

		lualine.setup(lualine_settings())
	end,
}
