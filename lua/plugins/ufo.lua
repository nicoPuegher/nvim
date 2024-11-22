return {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
        local ufo = require('ufo')

        ufo.setup()
    end,
}
