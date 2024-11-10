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
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            },
        }

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local builtin = require('telescope.builtin')

                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
                end

                map('<leader>ld', builtin.lsp_definitions, '[L]sp [D]efinition')
                map('<leader>lr', builtin.lsp_references, '[L]sp [R]eferences')
                map('<leader>li', builtin.lsp_implementations, '[L]sp [I]mplementation')
                map('<leader>lt', builtin.lsp_type_definitions, '[L]sp [T]ype definition')
                map('<leader>lsd', builtin.lsp_document_symbols, '[L]sp [S]ymbols [D]ocument')
                map('<leader>lsw', builtin.lsp_dynamic_workspace_symbols, '[L]sp [S]ymbols [W]orkspace')
                map('<leader>lc', vim.lsp.buf.declaration, '[L]sp [C]ode declaration')

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({
                                group = 'lsp-highlight',
                                buffer = event2.buf,
                            })
                        end,
                    })
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, cmp_nvim_lsp.default_capabilities())

        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    server.on_attach = function()
                        vim.diagnostic.config({
                            virtual_text = { severity_sort = true },
                            float = {
                                format = function(diagnostic)
                                    return string.format('%s (%s)', diagnostic.message, diagnostic.source)
                                end,
                            },
                            severity_sort = true,
                        })
                    end
                    lspconfig[server_name].setup(server)
                end,
            },
        })
    end,
}
