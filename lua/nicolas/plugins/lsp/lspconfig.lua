return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = function()
		-- For conciseness
		local lspconfig = require("lspconfig") -- Loaded, no need for protected call
		local keymap = vim.keymap

		-- Create a function that only runs when there is an lsp for the current buffer
		local on_attach = function(client, bufnr)
			-- Set custom options for each keymap
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- Set custom keymaps
			opts.desc = "Show documentation under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show references"
			keymap.set("n", "gr", vim.lsp.buf.references, opts)

			opts.desc = "Show definition"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show line diagnostic"
			keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end

		-- Connect lua-language-server and set it up
		lspconfig.lua_ls.setup({
			on_attach = on_attach, -- Attaches fn defined above
		})
	end,
}
