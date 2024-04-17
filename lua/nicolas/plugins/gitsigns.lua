return {
	'lewis6991/gitsigns.nvim',
	config = function()
		local gitsigns = require('gitsigns')
		local gitsigns_keymaps = require('nicolas.plugins.keymaps.gitsigns_keymaps')

		gitsigns.setup({
			attach_to_untracked = true,
			on_attach = function(bufnr)
				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Gitsigns: ' .. desc })
				end

				gitsigns_keymaps(map, gitsigns)
			end,
		})
	end,
}
