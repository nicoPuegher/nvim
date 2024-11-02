return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
        plugins = {
            marks = false,
            registers = false,
        },
        icons = {
            mappings = false,
        },
        spec = {
            { '<leader>s', group = '[S]earch' },
            { '<leader>c', group = '[C]ode' },
            { '<leader>g', group = '[G]it' },
            { '<leader>f', group = '[F]ile' },
            { '<leader>sg', group = '[G]it' },
            { '<leader>gt', group = '[T]oggle' },
        },
    },
}
