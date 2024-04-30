local function lint_keymaps(lint)
	local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

	vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
		desc = 'Lint code autocmd',
	})

	vim.keymap.set('n', '<leader>cl', function()
		lint.try_lint()
	end, { desc = '[C]ode [L]int' })
end

return lint_keymaps
