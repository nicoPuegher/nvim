local function lint_settings(lint)
	lint.linters_by_ft = {
		lua = { 'selene' },
		html = { 'htmlhint' },
		css = { 'stylelint' },
		javascript = { 'eslint' },
		javascriptreact = { 'eslint' },
	}
end

return lint_settings
