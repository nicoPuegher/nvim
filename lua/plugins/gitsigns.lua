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
            vim.keymap.set('n', ']g', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']g', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end, { desc = 'Jump to the next [G]it change', buffer = bufnr })
            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it [S]tage hunk', buffer = bufnr })
            vim.keymap.set(
                'n',
                '<leader>gu',
                gitsigns.undo_stage_hunk,
                { desc = '[G]it [U]nstage hunk', buffer = bufnr }
            )
            vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it [R]estore hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage buffer', buffer = bufnr })
            vim.keymap.set(
                'n',
                '<leader>gR',
                gitsigns.reset_buffer,
                { desc = '[G]it [R]estore buffer', buffer = bufnr }
            )
        end,
    },
}
