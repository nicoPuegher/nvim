return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            lua = { 'selene' },
            html = { 'htmlhint' },
            css = { 'stylelint' },
            javascript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
            group = lint_augroup,
            callback = function()
                if vim.opt_local.modifiable:get() then
                    lint.try_lint()
                end
            end,
        })

        vim.keymap.set('n', '<leader>cl', function()
            lint.try_lint()
        end, { desc = '[L]int' })
    end,
}
