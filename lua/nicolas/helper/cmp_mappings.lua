local function cmp_mappings(cmp, luasnip)
	return {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-l>'] = cmp.mapping(function() -- Go to next snippet transformation
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { 'i', 's' }),
		['<C-h>'] = cmp.mapping(function() -- Go to previous snippet transformation
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { 'i', 's' }),
	}
end

return cmp_mappings
