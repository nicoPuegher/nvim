local function conform_settings()
	return {
		formatters_by_ft = {
			lua = { 'stylua' },
			html = { 'prettier' },
			css = { 'prettier' },
			javascript = { 'prettier' },
			json = { 'prettier' },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	}
end

return conform_settings
