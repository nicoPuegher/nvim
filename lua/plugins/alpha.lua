return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        local fortune = require('alpha.fortune')

        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }

        dashboard.section.buttons.val = {
            dashboard.button('<leader>fe', '  > [F]ile [E]xplorer'),
            dashboard.button('<leader>sf', '󰱼  > [S]earch [F]iles'),
            dashboard.button('q', '  > [Q]uit Neovim', '<cmd>qa<CR>'),
        }
    end,
}
