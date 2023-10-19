return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		vim.defer_fn(function()
			require('nvim-treesitter.configs').setup({
				modules = {
					'ensure_installed',
					'auto_install',
					'sync_install',
					'ignore_install',
					'highlight',
					'indent',
					'incremental_selection',
				},
				ensure_installed = { 'lua' },
				auto_install = false,
				sync_install = false,
				ignore_install = {},
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
				incremental_selection = { enable = true },
			})
		end, 0)
	end,
}
