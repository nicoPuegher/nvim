return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim', opts = {} },
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require('lspconfig')

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    lspconfig[server_name].setup(server)
                end,
            },
        })
    end,
}
