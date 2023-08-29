return {
	"bluz71/vim-nightfly-colors",
	version = "*", -- Latest stable version
	lazy = false,
	priority = 1000,
	name = "nightfly",
	config = function() -- Executed when vim-nightfly-colors loads
		-- Setup colorscheme
		vim.cmd([[colorscheme nightfly]])
	end,
}
