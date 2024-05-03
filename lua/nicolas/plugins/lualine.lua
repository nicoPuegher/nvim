return {
	'nvim-lualine/lualine.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local lualine = require('lualine')
		local lualine_settings = require('nicolas.plugins.settings.lualine_settings')

		lualine.setup(lualine_settings())
	end,
}
