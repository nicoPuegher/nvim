return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim', opts = {} },
    },
    config = function()
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
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    end
}
