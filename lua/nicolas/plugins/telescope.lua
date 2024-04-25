return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		local telescope = require('telescope')
		local telescope_settings = require('nicolas.plugins.settings.telescope_settings')
		local get_dropdown = require('telescope.themes').get_dropdown
		local builtin = require('telescope.builtin')
		local telescope_keymaps = require('nicolas.plugins.keymaps.telescope_keymaps')

		telescope.setup(telescope_settings(get_dropdown))

		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')
		pcall(require('telescope').load_extension, 'harpoon')

		telescope_keymaps.builtin_keymaps(builtin)
		telescope_keymaps.current_buffer_fuzzy_find(builtin, get_dropdown)
		telescope_keymaps.live_grep(builtin)
		telescope_keymaps.find_neovim_files(builtin)
		telescope_keymaps.indent_for_preview_files()
	end,
}
