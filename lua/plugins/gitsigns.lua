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
            vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it [P]review hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it [D]iff hunk', buffer = bufnr })
            vim.keymap.set(
                'n',
                '<leader>gtb',
                gitsigns.toggle_current_line_blame,
                { desc = '[G]it [T]oggle [B]lame', buffer = bufnr }
            )
            vim.keymap.set(
                'n',
                '<leader>gtd',
                gitsigns.toggle_deleted,
                { desc = '[G]it [T]oggle [D]eleted', buffer = bufnr }
            )
            vim.keymap.set('n', '<leader>gb', function()
                gitsigns.blame_line({ full = true })
            end, { desc = '[G]it [B]lame', buffer = bufnr })
            vim.keymap.set('v', '<leader>gs', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = '[G]it [S]tage hunk', buffer = bufnr })
            vim.keymap.set('v', '<leader>gr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = '[G]it [R]estore hunk', buffer = bufnr })
        end,
    },
}
