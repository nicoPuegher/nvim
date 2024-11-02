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
        end
    end,
}
