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
    end
}
