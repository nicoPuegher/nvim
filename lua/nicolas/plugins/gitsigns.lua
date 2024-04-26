return {
	'lewis6991/gitsigns.nvim',
	config = function()
		local gitsigns = require('gitsigns')
		local gitsigns_settings = require('nicolas.plugins.settings.gitsigns_settings')

		gitsigns.setup(gitsigns_settings(gitsigns))
	end,
}
