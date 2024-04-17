local function telescope_settings(get_dropdown)
	return {
		defaults = {
			layout_config = {
				horizontal = { width = 0.9, height = 0.9, preview_width = 0.5 },
			},
		},
		extensions = {
			['ui-select'] = {
				get_dropdown(),
			},
		},
	}
end

return telescope_settings
