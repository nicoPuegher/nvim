local function key_settings()
	return {
		plugins = {
			marks = false,
			registers = false,
			spelling = {
				enabled = false,
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
		motions = {
			count = false,
		},
	}
end

local function key_register()
	return {
		['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
		['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
		['<leader>d'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },
		['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
		['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
		['<leader>n'] = { name = '[N]otes', _ = 'which_key_ignore' },
		['<leader>q'] = { name = '[Q]uickfix', _ = 'which_key_ignore' },
		['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
		['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
		['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
		['<leader>sg'] = { name = '[G]it', _ = 'which_key_ignore' },
	}
end

return {
	key_settings = key_settings,
	key_register = key_register,
}
