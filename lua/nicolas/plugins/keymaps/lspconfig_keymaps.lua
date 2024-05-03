vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
	callback = function(event)
		local map = require('nicolas.helper.map')
		local telescope = require('telescope.builtin')

		local buffer = vim.lsp.buf
		local opts = {
			bufnr = event.buf,
			client_id = event.data.client_id,
		}

		map('n', '<leader>ld', telescope.lsp_definitions, opts, '[L]SP [D]efinition')
		map('n', '<leader>lR', telescope.lsp_references, opts, '[L]SP [R]eferences')
		map('n', '<leader>li', telescope.lsp_implementations, opts, '[L]SP [I]mplementation')
		map('n', '<leader>lt', telescope.lsp_type_definitions, opts, '[L]SP [T]ype Definition')
		map('n', '<leader>ls', telescope.lsp_document_symbols, opts, '[L]SP Document [S]ymbols')
		map('n', '<leader>lr', buffer.rename, opts, '[L]SP [R]ename')
		map('n', '<leader>ea', buffer.code_action, opts, '[E]rror [A]ctions')
		map('n', 'K', buffer.hover, opts, 'Hover Documentation')
		map('n', '<leader>lD', buffer.declaration, opts, '[L]SP [D]eclaration')

		local client = vim.lsp.get_client_by_id(opts.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup('custom-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = opts.bufnr,
				group = highlight_augroup,
				callback = buffer.document_highlight,
			})
			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = opts.bufnr,
				group = highlight_augroup,
				callback = buffer.clear_references,
			})
			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('custom-lsp-detach', { clear = true }),
				callback = function(event2)
					buffer.clear_references()
					vim.api.nvim_clear_autocmds({ group = 'custom-lsp-highlight', buffer = event2.buf })
				end,
			})
		end
	end,
})
