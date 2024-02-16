return {
	servers = {
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false, library = {
					'${3rd}/love2d/library',
				} },
				telemetry = { enable = false },
				hint = { enable = true },
				library = {
					'${3rd}/love2d/library',
				},
			},
		},
		html = {},
		stylelint_lsp = {},
	},
}
