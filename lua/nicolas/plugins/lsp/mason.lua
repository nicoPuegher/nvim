return {
	"williamboman/mason.nvim",
	config = function() -- Executed when mason.nvim loads
		local mason = require("mason") -- Loaded, no need for protected call

		-- Setup mason.nvim
		mason.setup()
	end,
}
