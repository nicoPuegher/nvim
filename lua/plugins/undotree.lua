return {
    'mbbill/undotree',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>tu',
            function()
                vim.cmd.UndotreeToggle()
            end,
            mode = 'n',
            desc = '[T]oggle [U]ndotree',
        },
    },
}
