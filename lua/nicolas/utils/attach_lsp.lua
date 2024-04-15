return {
	attach_lsp = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
			vim.lsp.buf.format()
		end, { desc = 'Format current buffer with LSP' })

		vim.diagnostic.config({
			virtual_text = { source = true },
			float = {
				format = function(diagnostic)
					return string.format('%s (%s)', diagnostic.message, diagnostic.source)
				end,
			},
			severity_sort = true,
		})

		if vim.lsp.inlay_hint then
			vim.keymap.set('n', '<leader>th', function()
				vim.lsp.inlay_hint(0, nil)
			end, { desc = '[T]oggle inlay [H]ints' })
		end
	end,
}
