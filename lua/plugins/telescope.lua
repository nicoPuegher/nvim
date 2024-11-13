return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-ui-select.nvim',
        'sharkdp/fd',
    },
    opts = function()
        local telescope = require('telescope')
        local themes = require('telescope.themes')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')

        telescope.setup({
            extensions = {
                ['ui-select'] = {
                    themes.get_dropdown(),
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = actions.close,
                    },
                },
                layout_config = {
                    horizontal = { preview_width = 0.5 },
                },
                border = false,
            },
        })

        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')

        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[B]uffers' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]elect builtin' })
        vim.keymap.set('n', '<leader>sl', builtin.live_grep, { desc = '[L]ive grep' })
        vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = '[F]iles' })
        vim.keymap.set('n', '<leader>sgs', builtin.git_status, { desc = '[S]tatus' })
        vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = '[C]ommits' })
        vim.keymap.set('n', '<leader>sc', function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown({
                winblend = 10,
                previewer = false,
                border = false,
            }))
        end, { desc = '[C]urrent buffer' })
        vim.keymap.set('n', '<leader>si', function()
            builtin.live_grep({ grep_open_files = true })
        end, { desc = '[I]n open files' })
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end, { desc = '[N]eovim files' })
        vim.keymap.set('n', '<leader>s.', function()
            builtin.find_files({
                hidden = true,
                find_command = {
                    'fd',
                    '--type',
                    'f',
                    '--hidden',
                    '--exclude',
                    '.git',
                    '--exclude',
                    '*/',
                    '--glob',
                    '.*',
                },
            })
        end, { silent = true, desc = '[.] hidden' })
        vim.keymap.set('n', '<leader>se', function()
            builtin.find_files({
                find_command = { 'fd', '--type', 'f', '--exclude', 'node_modules' },
            })
        end, { desc = '[E]xclude modules' })
    end,
}
