local cmp_keymaps = require('nicolas.plugins.keymaps.cmp_keymaps')

local function cmp_settings(luasnip, cmp)
	return {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert(cmp_keymaps(cmp, luasnip)),
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'path' },
		},
	}
end

return cmp_settings
