local map = require('nicolas.helper.map')

local opts = {
	identifier = 'Gitsigns: ',
}

local function gitsigns_keymaps(gitsigns)
	map('n', ']h', function()
		if vim.wo.diff then
			vim.cmd.normal({ ']h', bang = true })
		else
			gitsigns.nav_hunk('next')
		end
	end, opts, '[H]unk next')
	map('n', '[h', function()
		if vim.wo.diff then
			vim.cmd.normal({ '[h', bang = true })
		else
			gitsigns.nav_hunk('prev')
		end
	end, opts, '[H]unk prev')

	map('n', '<leader>hs', gitsigns.stage_hunk, opts, '[H]unk [S]tage')
	map('n', '<leader>hu', gitsigns.undo_stage_hunk, opts, '[H]unk [U]ndo stage')
	map('n', '<leader>hr', gitsigns.reset_hunk, opts, '[H]unk [R]estore')
	map('n', '<leader>hS', gitsigns.stage_buffer, opts, '[H]unk [S]tage buffer')
	map('n', '<leader>hR', gitsigns.reset_buffer, opts, '[H]unk [R]estore buffer')
	map('n', '<leader>hsp', gitsigns.preview_hunk, opts, '[H]unk [S]how [P]review')
	map('n', '<leader>hd', gitsigns.diffthis, opts, '[H]unk [D]iff')
	map('n', '<leader>tb', gitsigns.toggle_current_line_blame, opts, '[T]oggle [B]lame')
	map('n', '<leader>td', gitsigns.toggle_deleted, opts, '[T]oggle [D]eleted')
	map('n', '<leader>hb', function()
		gitsigns.blame_line({ full = true })
	end, opts, '[H]unk [B]lame')
	map('n', '<leader>hD', function()
		gitsigns.diffthis('~')
	end, opts, '[H]unk [D]iff ~')

	map('v', '<leader>hs', function()
		gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, opts, '(Vm) [H]unk [S]tage')
	map('v', '<leader>hr', function()
		gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, opts, '(Vm) [H]unk [R]estore')
end

return gitsigns_keymaps
