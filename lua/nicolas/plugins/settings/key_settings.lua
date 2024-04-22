local function key_settings()
	return {
		plugins = {
			marks = false,
			registers = false,
			spelling = {
				enabled = false,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = false,
				z = false,
				g = false,
			},
		},
		operators = {},
		key_labels = {},
		motions = {
			count = false,
		},
		icons = {
			breadcrumb = '»',
			separator = '➜',
			group = '+',
		},
		popup_mappings = {
			scroll_down = '<down>',
			scroll_up = '<up>',
		},
		window = {
			border = 'none',
			position = 'bottom',
			margin = { 1, 0, 1, 0 },
			padding = { 1, 2, 1, 2 },
			winblend = 0,
			zindex = 1000,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = 'left',
		},
		ignore_missing = false,
		hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', '^:', '^ ', '^call ', '^lua ' },
		show_help = true,
		show_keys = true,
		triggers = 'auto',
		triggers_nowait = {
			'`',
			"'",
			'g`',
			"g'",
			'"',
			'<c-r>',
			'z=',
		},
		triggers_blacklist = {
			i = { 'j', 'k' },
			v = { 'j', 'k' },
		},
		disable = {
			buftypes = {},
			filetypes = {},
		},
	}
end

return key_settings
