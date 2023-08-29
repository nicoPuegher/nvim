return {
	"williamboman/mason.nvim",
	version = "*", -- Latest stable version
	lazy = false,
	config = function() -- Executed when mason.nvim loads
		-- Require and setup mason.nvim
		local mason = require("mason") -- Loaded, no need for protected call
		mason.setup()
	end,
}
