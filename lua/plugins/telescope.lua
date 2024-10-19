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
    end,
}
