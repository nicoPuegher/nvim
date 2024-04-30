local map = require('nicolas.helper.map')

local function harpoon_keymaps(harpoon)
	map('n', '<leader>ha', function()
		harpoon:list():add()
	end, {}, '[H]arpoon [A]dd')
	map('n', '<leader>ho', function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, {}, '[H]arpoon [O]pen')
	map('n', '<leader>hp', function()
		harpoon:list():prev()
	end, {}, '[H]arpoon [P]rev')
	map('n', '<leader>hn', function()
		harpoon:list():next()
	end, {}, '[H]arpoon [N]ext')

	harpoon:extend({
		UI_CREATE = function(cx)
			map('n', '<C-v>', function()
				harpoon.ui:select_menu_item({ vsplit = true })
			end, { cx.bufnr }, 'Open Harpoon Mark In Vsplit')
			map('n', '<C-x>', function()
				harpoon.ui:select_menu_item({ split = true })
			end, { cx.bufnr }, 'Open Harpoon Mark In Xsplit')
		end,
	})
end

return harpoon_keymaps
