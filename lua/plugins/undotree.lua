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
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_SplitWidth = 40
        vim.g.undotree_DiffpanelHeight = 15
        vim.g.undotree_SetFocusWhenToggle = 1
    end,
}
