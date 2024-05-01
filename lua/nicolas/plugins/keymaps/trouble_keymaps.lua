local function trouble_keymaps()
	return {
		{
			'<leader>tt',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = '[T]rouble [T]oggle',
		},
		{
			'<leader>tb',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = '[T]rouble [B]uffer',
		},
		{
			'<leader>ts',
			'<cmd>Trouble symbols toggle focus=false<cr>',
			desc = '[T]rouble [S]ymbols',
		},
		{
			'<leader>tl',
			'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
			desc = '[T]rouble [L]SP',
		},
		{
			'<leader>tq',
			'<cmd>Trouble qflist toggle<cr>',
			desc = '[T]rouble [Q]uickfix',
		},
	}
end

return trouble_keymaps
