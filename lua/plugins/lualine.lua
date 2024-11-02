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
    end,
}
