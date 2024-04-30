return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require('harpoon')
		local harpoon_keymaps = require('nicolas.plugins.keymaps.harpoon_keymaps')

		harpoon:setup()
		harpoon_keymaps(harpoon)
	end,
}
