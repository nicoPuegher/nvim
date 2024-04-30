local function lualine_settings()
	return {
		sections = {
			lualine_x = { 'encoding', { 'fileformat', symbols = { unix = 'unix' } }, 'filetype' },
		},
	}
end

return lualine_settings
