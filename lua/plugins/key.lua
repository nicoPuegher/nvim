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
            { '<leader>c', group = '[C]ode', mode = { 'n', 'v' } },
            { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
            { '<leader>f', group = '[F]ile' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>l', group = '[L]sp' },
            { '<leader>d', group = '[D]iagnostic' },
            { '<leader>q', group = '[Q]uickfix' },
            { '<leader>v', group = '[V]oid', mode = { 'v' } },
            { '<leader>sg', group = '[G]it' },
            { '<leader>gt', group = '[T]oggle' },
            { '<leader>ls', group = '[S]ymbols' },
        },
    },
}
