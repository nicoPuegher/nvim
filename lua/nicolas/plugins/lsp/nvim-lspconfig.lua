return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Adds extra capabilities for lsp
	},
	config = function() -- Executed when nvim-lspconfig loads
		-- Loaded, no need for protected call
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- For conciseness
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local keymap = vim.keymap
		local lsp = vim.lsp.buf
		local diagnostic = vim.diagnostic
		local fn = vim.fn

		-- Create a function that only runs when there is an lsp for the current buffer
		local on_attach = function(client, bufnr)
			-- Set custom options for each keymap
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- Set custom keymaps
			opts.desc = "Show documentation under cursor"
			keymap.set("n", "K", lsp.hover, opts)

			opts.desc = "Show references"
			keymap.set("n", "gr", lsp.references, opts)

			opts.desc = "Show definition"
			keymap.set("n", "gd", lsp.definition, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", lsp.rename, opts)

			opts.desc = "Show code actions"
			keymap.set({ "n", "v" }, "<leader>ca", lsp.code_action, opts)

			opts.desc = "Show line diagnostic"
			keymap.set("n", "<leader>E", diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", diagnostic.goto_next, opts)
		end

		-- Add custom diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Connect lua-language-server and set it up
		lspconfig.lua_ls.setup({
			on_attach = on_attach, -- Attaches fn with keymaps
			capabilities = capabilities, -- Attaches extra capabilities
			settings = {
				Lua = {
					-- Make server recognize vim globally
					diagnostics = {
						globals = { "vim" },
					},
					-- Make server aware of runtime files
					workspace = {
						library = {
							[fn.expand("$VIMRUNTIME/lua")] = true,
							[fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
