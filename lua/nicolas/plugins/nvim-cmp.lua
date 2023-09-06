return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter", -- Loads just before starting Insert or Replace mode
	dependencies = {
		"hrsh7th/cmp-buffer", -- Recommends text in current buffer
		"hrsh7th/cmp-path", -- Recommends file paths
		"L3MON4D3/LuaSnip", -- Autocomplete/snippet engine
		"onsails/lspkind.nvim", -- Adds vscode-like pictograms
	},
	config = function() -- Executed when nvim-cmp loads
		-- Loaded, no need for protected call
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- For conciseness
		local map = cmp.mapping
		local config = cmp.config.sources

		-- Setup nvim-cmp
		cmp.setup({
			-- Set autocompletion/snippet engine
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- Set custom keys to interact with the autocomplete suggestions
			mapping = map.preset.insert({
				["<C-k>"] = map.select_prev_item(),
				["<C-j>"] = map.select_next_item(),
				["<C-b>"] = map.scroll_docs(-4),
				["<C-f>"] = map.scroll_docs(4),
				["<C-e>"] = map.abort(),
				["<CR>"] = map.confirm({ select = false }),
			}),
			-- Link suggestion sources
			sources = config({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{
					{ name = "buffer" },
				},
			}),
			-- Set custom format
			formatting = {
				format = lspkind.cmp_format({}),
			},
		})
	end,
}