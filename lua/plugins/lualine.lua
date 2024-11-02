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

            for _, client in pairs(buf_clients) do
                table.insert(components, client.name)
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

            if #components == 0 then
                return 'No client active'
            end
        end
    end,
}
