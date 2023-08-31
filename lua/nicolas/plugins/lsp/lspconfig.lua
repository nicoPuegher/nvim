return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = function()
		local lspconfig = require("lspconfig") -- Loaded, no need for protected call
	end,
}
