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
        })
    end,
}
