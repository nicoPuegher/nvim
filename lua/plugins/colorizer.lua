return {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy',
    config = function()
        local colorizer = require('colorizer')

        colorizer.setup({
            css = {
                css = true,
                mode = 'background',
            },
        })
    end,
}
