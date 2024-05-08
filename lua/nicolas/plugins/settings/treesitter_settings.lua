local function treesitter_settings(treesitter)
	vim.defer_fn(function()
		treesitter.setup({
			modules = {
				'ensure_installed',
				'auto_install',
				'sync_install',
				'ignore_install',
				'highlight',
				'indent',
				'incremental_selection',
			},
			ensure_installed = { 'lua', 'luadoc', 'html', 'css', 'javascript', 'markdown_inline' },
			auto_install = false,
			sync_install = false,
			ignore_install = {},
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = 'tt',
					node_incremental = 'ti',
					scope_incremental = 'false',
					node_decremental = 'td',
				},
			},
		})
	end, 0)
end

return treesitter_settings
