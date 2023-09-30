return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required, lib of simplified lua fns
	},
	config = function() -- Executed when null-ls.nvim loads
		local null_ls = require("null-ls") -- Loaded, no need for protected call

		-- For conciseness
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local clear_autocmds = vim.api.nvim_clear_autocmds
		local create_autocmd = vim.api.nvim_create_autocmd
		local format = vim.lsp.buf.format

		-- Setup null-ls.nvim
		null_ls.setup({
			-- Setup formatters and linters
			sources = {
				-- Formatters
				formatting.stylua.with({ -- Lua, only when config file exists
					condition = function(utils)
						return utils.root_has_file(".stylelua.toml")
					end,
				}),
				formatting.black, -- Python
				formatting.clang_format.with({ -- C, only when config file exists
					condition = function(utils)
						return utils.root_has_file(".clang-format")
					end,
				}),
				formatting.prettier.with({ -- Javascript, only when config file exists
					condition = function(utils)
						return utils.root_has_file(".prettierrc.json")
					end,
				}),
				formatting.sql_formatter.with({
					extra_args = {"--config", ".sqlformatterrc.json"}
				}),

				-- Linters
				diagnostics.ruff, -- Python
				diagnostics.cpplint.with({ -- C, only when config file exists
					condition = function(utils)
						return utils.root_has_file("cpplint.cfg")
					end,
				}),
				diagnostics.eslint_d.with({ -- Javascript, only when config file exists
					condition = function(utils)
						return utils.root_has_file(".eslintrc.json")
					end,
				}),
				diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "sqlite" },
				}),
			},

			-- Setup sync format on save (blocks nvim until results are applied)
			on_attach = function(client, bufnr)
				-- Check if current client supports formatting
				if client.supports_method("textDocument/formatting") then
					-- Clear and create autocommands before formatting
					clear_autocmds({ group = augroup, buffer = bufnr })
					create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						-- Then, call format
						callback = function()
							format({
								bufnr = bufnr,
								-- Pass all formatting requests to null-ls
								filter = function(curr_client)
									return curr_client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
