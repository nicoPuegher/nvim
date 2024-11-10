return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre' },
    opts = {
        numhl = true,
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            vim.keymap.set('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end, { desc = 'Jump to the previous git [C]hange', buffer = bufnr })
            vim.keymap.set('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end, { desc = 'Jump to the next git [C]hange', buffer = bufnr })
            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]nstage hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]estore hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer', buffer = bufnr })
            vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]estore buffer', buffer = bufnr })
            vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff hunk', buffer = bufnr })
            vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = '[B]lame', buffer = bufnr })
            vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = '[D]eleted', buffer = bufnr })
            vim.keymap.set('n', '<leader>gb', function()
                gitsigns.blame_line({ full = true })
            end, { desc = '[B]lame', buffer = bufnr })
            vim.keymap.set('v', '<leader>gs', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = '[S]tage hunk', buffer = bufnr })
            vim.keymap.set('v', '<leader>gr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = '[R]estore hunk', buffer = bufnr })
        end,
    },
}
