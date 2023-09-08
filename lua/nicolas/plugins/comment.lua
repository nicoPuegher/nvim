return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Loads on opening or creating a file
	config = function() -- Executed when comment.nvim loads
		local comment = require("Comment") -- Loaded, no need for protected call

		-- Setup comment.nvim
		comment.setup({})
	end,
}
