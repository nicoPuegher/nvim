local map = require('nicolas.helper.map')

local opts = {
	bufnr = vim.api.nvim_get_current_buf(),
	identifier = 'Telescope: ',
}

local function builtin_keymaps(builtin)
	map('n', '<leader>sh', builtin.help_tags, opts, '[S]earch [H]elp')
	map('n', '<leader>sk', builtin.keymaps, opts, '[S]earch [K]eymaps')
	map('n', '<leader>sf', builtin.find_files, opts, '[S]earch [F]iles')
	map('n', '<leader>ss', builtin.builtin, opts, '[S]earch [S]elect telescope')
	map('n', '<leader>sw', builtin.grep_string, opts, '[S]earch current [W]ord')
	map('n', '<leader>sg', builtin.live_grep, opts, '[S]earch by [G]rep')
	map('n', '<leader>sd', builtin.diagnostics, opts, '[S]earch [D]iagnostics')
	map('n', '<leader>sr', builtin.resume, opts, '[S]earch [R]esume')
	map('n', '<leader>s.', builtin.oldfiles, opts, '[S]earch recent files ("." for repeat)')
	map('n', '<leader><leader>', builtin.buffers, opts, '[ ] Find existing buffers')
end

local function current_buffer_fuzzy_find(builtin, get_dropdown)
	map('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, opts, '[/] Fuzzily search in current buffer')
end

local function live_grep(builtin)
	map('n', '<leader>s/', function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = 'Live grep in open files',
		})
	end, opts, '[S]earch [/] in open files')
end

local function find_neovim_files(builtin)
	map('n', '<leader>sn', function()
		builtin.find_files({ cwd = vim.fn.stdpath('config') })
	end, opts, '[S]earch [N]eovim files')
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
