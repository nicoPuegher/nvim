vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
	callback = function(event)
		local map = require('nicolas.helper.map')
		local telescope = require('telescope.builtin')

		local buffer = vim.lsp.buf
		local opts = {
			bufnr = event.buf,
			identifier = 'LSP: ',
		}

		map('n', 'gd', telescope.lsp_definitions, opts, '[G]oto [D]efinition')
		map('n', 'gr', telescope.lsp_references, opts, '[G]oto [R]eferences')
		map('n', 'gI', telescope.lsp_implementations, opts, '[G]oto [I]mplementation')
		map('n', '<leader>D', telescope.lsp_type_definitions, opts, 'Type [D]efinition')
		map('n', '<leader>ds', telescope.lsp_document_symbols, opts, '[D]ocument [S]ymbols')
		map('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, opts, '[W]orkspace [S]ymbols')
		map('n', '<leader>rn', buffer.rename, opts, '[R]e[N]ame')
		map('n', '<leader>ca', buffer.code_action, opts, '[C]ode [A]ction')
		map('n', 'K', buffer.hover, opts, '[H]over documentation')
		map('n', 'gD', buffer.declaration, opts, '[G]oto [D]eclaration')

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = opts.bufnr,
				callback = buffer.document_highlight,
			})
			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = opts.bufnr,
				callback = buffer.clear_references,
			})
		end
	end,
})
