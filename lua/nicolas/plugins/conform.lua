return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require('conform')

		conform.setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				html = { 'prettier' },
				css = { 'prettier' },
				javascript = { 'prettier' },
				json = { 'prettier' },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ 'n', 'v' }, '<leader>fc', function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 500,
			})
		end, { desc = '[F]ormat [C]ode' })
	end,
}
