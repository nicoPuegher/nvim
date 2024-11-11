return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'html',
            'css',
            'scss',
            'javascript',
            'jsdoc',
            'json',
            'markdown',
            'markdown_inline',
            'diff',
            'vim',
            'vimdoc',
            'lua',
            'luadoc',
            'luap',
            'editorconfig',
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'tt',
                node_incremental = 'ti',
                scope_incremental = 'ts',
                node_decremental = 'td',
            },
        },
    },
}
