local gitsigns_keymaps = require('nicolas.plugins.keymaps.gitsigns_keymaps')

local function gitsigns_settings(gitsigns)
	return {
		linehl = true,
		attach_to_untracked = true,
		on_attach = function()
			gitsigns_keymaps(gitsigns)
		end,
	}
end

return gitsigns_settings
