return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = function()
		local lspconfig = require("lspconfig") -- Loaded, no need for protected call

		-- Connect lua-language-server and set it up
		lspconfig.lua_ls.setup({})
	end,
}
