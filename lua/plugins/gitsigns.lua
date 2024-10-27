return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre' },
    opts = {
        numhl = true,
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            vim.keymap.set('n', '[g', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[g', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end, { desc = 'Jump to the previous [G]it change', buffer = bufnr })
        end,
    },
}
