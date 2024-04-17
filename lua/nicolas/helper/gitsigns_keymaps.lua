local function gitsigns_keymaps(map, gitsigns)
	map('n', ']h', function()
		if vim.wo.diff then
			vim.cmd.normal({ ']h', bang = true })
		else
			gitsigns.nav_hunk('next')
		end
	end, '')
	map('n', '[h', function()
		if vim.wo.diff then
			vim.cmd.normal({ '[h', bang = true })
		else
			gitsigns.nav_hunk('prev')
		end
	end, '')
	map('n', '<leader>hs', gitsigns.stage_hunk, '')
	map('n', '<leader>hr', gitsigns.reset_hunk, '')
	map('v', '<leader>hs', function()
		gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, '')
	map('v', '<leader>hr', function()
		gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, '')
	map('n', '<leader>hS', gitsigns.stage_buffer, '')
	map('n', '<leader>hu', gitsigns.undo_stage_hunk, '')
	map('n', '<leader>hR', gitsigns.reset_buffer, '')
	map('n', '<leader>hsp', gitsigns.preview_hunk, '')
	map('n', '<leader>hb', function()
		gitsigns.blame_line({ full = true })
	end, '')
	map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '')
	map('n', '<leader>hd', gitsigns.diffthis, '')
	map('n', '<leader>hD', function()
		gitsigns.diffthis('~')
	end, '')
	map('n', '<leader>td', gitsigns.toggle_deleted, '')
end

return gitsigns_keymaps
