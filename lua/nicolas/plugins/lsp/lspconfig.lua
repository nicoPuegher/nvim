return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = function()
		local lspconfig = require("lspconfig") -- Loaded, no need for protected call

		-- Create a function that only runs when there is an lsp for the current buffer
		local on_attach = function(client, bufnr)
			print("on_attach fired!")
		end

		-- Connect lua-language-server and set it up
		lspconfig.lua_ls.setup({
			on_attach = on_attach, -- Attaches fn defined above
		})
	end,
}
