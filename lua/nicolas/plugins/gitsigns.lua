return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = true, -- Substitution for plugin.config(no opts), executed when gitsigns.nvim loads
}
