local map = require('nicolas.helper.map')

local function builtin_keymaps(builtin)
	map('n', '<leader>sh', builtin.help_tags, {}, '[S]earch [H]elp')
	map('n', '<leader>sk', builtin.keymaps, {}, '[S]earch [K]eymaps')
	map('n', '<leader>sf', builtin.find_files, {}, '[S]earch [F]iles')
	map('n', '<leader>ss', builtin.builtin, {}, '[S]earch [S]elect Builtin')
	map('n', '<leader>sw', builtin.grep_string, {}, '[S]earch Current [W]ord')
	map('n', '<leader>sg', builtin.live_grep, {}, '[S]earch [G]rep')
	map('n', '<leader>sd', builtin.diagnostics, {}, '[S]earch [E]rrors')
	map('n', '<leader>so', builtin.oldfiles, {}, '[S]earch [O]ld Files')
	map('n', '<leader>sb', builtin.buffers, {}, '[S]earch [B]uffers')
	map('n', '<leader>sm', '<cmd>Telescope harpoon marks<CR>', {}, '[S]earch Harpoon [M]arks')
end

local function current_buffer_fuzzy_find(builtin, get_dropdown)
	map('n', '<leader>sc', function()
		builtin.current_buffer_fuzzy_find(get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, {}, '[S]earch [C]urrent Buffer')
end

local function live_grep(builtin)
	map('n', '<leader>si', function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = 'Live grep in open files',
		})
	end, {}, '[S]earch [I]n Open Files')
end

local function find_neovim_files(builtin)
	map('n', '<leader>sn', function()
		builtin.find_files({ cwd = vim.fn.stdpath('config') })
	end, {}, '[S]earch [N]eovim Files')
end

local function indent_for_preview_files()
	vim.api.nvim_create_autocmd('User', {
		pattern = 'TelescopePreviewerLoaded',
		callback = function()
			vim.opt.tabstop = 4
			vim.opt.shiftwidth = 4
			vim.opt.expandtab = true
		end,
	})
end

return {
	builtin_keymaps = builtin_keymaps,
	current_buffer_fuzzy_find = current_buffer_fuzzy_find,
	live_grep = live_grep,
	find_neovim_files = find_neovim_files,
	indent_for_preview_files = indent_for_preview_files,
}
