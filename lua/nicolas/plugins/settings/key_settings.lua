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

return key_settings
