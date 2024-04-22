local map = require('nicolas.helper.map')

local function gitsigns_keymaps(gitsigns)
	map('n', ']g', function()
		if vim.wo.diff then
			vim.cmd.normal({ ']g', bang = true })
		else
			gitsigns.nav_hunk('next')
		end
	end, {}, '[G]it Next Hunk')
	map('n', '[g', function()
		if vim.wo.diff then
			vim.cmd.normal({ '[g', bang = true })
		else
			gitsigns.nav_hunk('prev')
		end
	end, {}, '[G]it Prev Hunk')

	map('n', '<leader>gs', gitsigns.stage_hunk, {}, '[G]it [S]tage Hunk')
	map('n', '<leader>gu', gitsigns.undo_stage_hunk, {}, '[G]it [U]nstage Hunk')
	map('n', '<leader>gr', gitsigns.reset_hunk, {}, '[G]it [R]estore Hunk')
	map('n', '<leader>gS', gitsigns.stage_buffer, {}, '[G]it [S]tage Buffer')
	map('n', '<leader>gR', gitsigns.reset_buffer, {}, '[G]it [R]estore Buffer')
	map('n', '<leader>gp', gitsigns.preview_hunk, {}, '[G]it [P]review Hunk')
	map('n', '<leader>gd', gitsigns.diffthis, {}, '[G]it [D]iff Hunk')
	map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {}, '[T]oggle Git [B]lame')
	map('n', '<leader>td', gitsigns.toggle_deleted, {}, '[T]oggle Git [D]eleted')
	map('n', '<leader>gb', function()
		gitsigns.blame_line({ full = true })
	end, {}, '[G]it [B]lame')
	map('n', '<leader>gD', function()
		gitsigns.diffthis('~')
	end, {}, '[G]it [D]iff Hunk ~')

	map('v', '<leader>gs', function()
		gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, {}, '[G]it [S]tage Hunk')
	map('v', '<leader>gr', function()
		gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
	end, {}, '[G]it [R]estore Hunk')
end

return gitsigns_keymaps
