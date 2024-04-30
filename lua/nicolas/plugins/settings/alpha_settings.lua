local function alpha_settings(dashboard)
	dashboard.section.header.val = {
		'                                                     ',
		'  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
		'  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
		'  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
		'  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
		'  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
		'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
		'                                                     ',
	}

	dashboard.section.buttons.val = {
		dashboard.button('<leader>fe', '  > [F]ile [E]xplorer'),
		dashboard.button('<leader>sf', '󰱼  > [S]earch [F]iles'),
		dashboard.button('<leader>ho', '󰱼  > [H]arpoon [O]pen'),
		dashboard.button('q', '  > [Q]uit Neovim', '<cmd>qa<CR>'),
	}

	local layout = {
		{ type = 'padding', val = 10 },
		dashboard.section.header,
		{ type = 'padding', val = 2 },
		dashboard.section.buttons,
		dashboard.section.footer,
		{ type = 'padding', val = 10 },
	}

	dashboard.opts.layout = layout
end

return alpha_settings
