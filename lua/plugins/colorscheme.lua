return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
        variant = 'main',
        styles = {
            bold = false,
            italic = false,
        },
    },
    init = function()
        vim.cmd.colorscheme('rose-pine')
    end,
}
