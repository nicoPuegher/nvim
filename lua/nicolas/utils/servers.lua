return {
	servers = {
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false, library = {
					'${3rd}/love2d/library',
				} },
				telemetry = { enable = false },
				hint = { enable = true },
			},
		},
		html = {},
		stylelint_lsp = {},
		tsserver = {},
	},
}
