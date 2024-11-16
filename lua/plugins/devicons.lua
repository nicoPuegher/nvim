return {
    'nvim-tree/nvim-web-devicons',
    event = 'VimEnter',
    config = function()
        local devicons = require('nvim-web-devicons')

        devicons.setup({
            override_by_filename = {
                ['.prettierrc'] = {
                    icon = '',
                    color = '#cbcb41',
                    cterm_color = '185',
                    name = 'PrettierConfig',
                },
            },
        })
    end,
}
