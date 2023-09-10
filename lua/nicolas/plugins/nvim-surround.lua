return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	version = "*", -- Use for stability; omit to use `main` branch for the latest features (documentation)
	config = true, -- Substitution for plugin.config(no opts), executed when nvim-surround loads
}
