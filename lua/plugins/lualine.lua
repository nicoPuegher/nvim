return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'mfussenegger/nvim-lint',
        'stevearc/conform.nvim',
    },
    opts = function()
        local lualine = require('lualine')

        local function get_attached_clients()
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            local buf_ft = vim.bo.filetype
            local components = {}

            local lsp_clients = {}
            for _, client in pairs(buf_clients) do
                table.insert(lsp_clients, client.name)
            end

            if #lsp_clients > 0 then
                table.insert(components, '[' .. table.concat(lsp_clients, ', ') .. ']')
            else
                table.insert(components, 'No client active')
            end

            local conform_success, conform = pcall(require, 'conform')
            if conform_success then
                for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
                    table.insert(components, formatter)
                end
            end

            local lint_success, lint = pcall(require, 'lint')
            if lint_success then
                local linters = lint.linters_by_ft[buf_ft]
                if linters then
                    for _, linter in pairs(linters) do
                        table.insert(components, linter)
                    end
                end
            end

            return table.concat(components, ' | ')
        end

        lualine.setup({
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diagnostics' },
                lualine_c = { 'filetype', 'filename', 'filesize' },
                lualine_x = {
                    'encoding',
                    { 'fileformat', symbols = { unix = 'unix' } },
                },
                lualine_y = { get_attached_clients },
                lualine_z = { 'progress' },
            },
            options = {
                component_separators = { left = '|', right = '|' },
            },
        })
    end,
}
