local function builtin_keymaps(builtin)
	vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect telescope' })
	vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch recent files ("." for repeat)' })
	vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
end

local function current_buffer_fuzzy_find(builtin, get_dropdown)
	vim.keymap.set('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = '[/] Fuzzily search in current buffer' })
end

local function live_grep(builtin)
	vim.keymap.set('n', '<leader>s/', function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = 'Live grep in open files',
		})
	end, { desc = '[S]earch [/] in open files' })
end

local function find_neovim_files(builtin)
	vim.keymap.set('n', '<leader>sn', function()
		builtin.find_files({ cwd = vim.fn.stdpath('config') })
	end, { desc = '[S]earch [N]eovim files' })
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
