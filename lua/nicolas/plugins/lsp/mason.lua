return {
	"williamboman/mason.nvim",
	config = function() -- Executed when mason.nvim loads
		-- Require and setup mason.nvim
		local mason = require("mason") -- Loaded, no need for protected call
		mason.setup()
	end,
}
