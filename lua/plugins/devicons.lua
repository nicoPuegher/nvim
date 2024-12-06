return {
    'nvim-tree/nvim-web-devicons',
    event = 'VimEnter',
    opts = {
        variant = 'dark',
        override_by_filename = {
            ['.prettierrc'] = {
                icon = '',
                color = '#cbcb41',
                cterm_color = '185',
                name = 'PrettierConfig',
            },
        },
    },
}
