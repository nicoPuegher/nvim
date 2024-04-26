return {
	'lewis6991/gitsigns.nvim',
	config = function()
		local gitsigns = require('gitsigns')
		local gitsigns_keymaps = require('nicolas.plugins.keymaps.gitsigns_keymaps')

		gitsigns.setup({
			linehl = true,
			attach_to_untracked = true,
			on_attach = function()
				gitsigns_keymaps(gitsigns)
			end,
		})
	end,
}
