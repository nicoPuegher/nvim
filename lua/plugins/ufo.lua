return {
    'kevinhwang91/nvim-ufo',
    event = 'InsertEnter',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
        local ufo = require('ufo')

        ufo.setup()
    end,
}
