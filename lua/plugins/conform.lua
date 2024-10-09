return {
    'stevearc/conform.nvim',
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ async = true, lsp_format = 'fallback' })
            end,
            mode = '',
            desc = '[C]ode [F]ormat',
        },
    },
    opts = {
        format_on_save = function(bufnr)
            local disable_filetypes = {}
            local lsp_format_opt = ''

            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = 'never'
            else
                lsp_format_opt = 'fallback'
            end
            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,
        formatters_by_ft = {
            lua = { 'stylua' },
        },
    },
}
