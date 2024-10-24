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
        { 'nvim-tree/nvim-web-devicons', enabled = true },
        'nvim-telescope/telescope-ui-select.nvim',
        'sharkdp/fd',
    },
    opts = function()
        local telescope = require('telescope')
        local themes = require('telescope.themes')
        local builtin = require('telescope.builtin')

        telescope.setup({
            extensions = {
                ['ui-select'] = {
                    themes.get_dropdown(),
                },
            },
            defaults = {
                layout_config = {
                    horizontal = { preview_width = 0.5 },
                },
                border = false,
            },
        })

        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')

        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect builtin' })
        vim.keymap.set('n', '<leader>sl', builtin.live_grep, { desc = '[S]earch [L]ive grep' })
        vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = '[S]earch [G]it [F]iles' })
        vim.keymap.set('n', '<leader>sgs', builtin.git_status, { desc = '[S]earch [G]it [S]tatus' })
        vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = '[S]earch [G]it [C]ommits' })
        vim.keymap.set('n', '<leader>sc', function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown({
                winblend = 10,
                previewer = false,
                border = false,
            }))
        end, { desc = '[S]earch [C]urrent buffer' })
        vim.keymap.set('n', '<leader>si', function()
            builtin.live_grep({ grep_open_files = true })
        end, { desc = '[S]earch [I]n open files' })
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end, { desc = '[S]earch [N]eovim files' })
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
        end, { noremap = true, silent = true, desc = '[S]earch [.] hidden' })
    end,
}
