-- Custom filetypes
vim.filetype.add({
    pattern = {
        ['.env.*'] = 'sh',
        ['.env'] = 'sh',
    },
})

-- Commands
vim.api.nvim_create_user_command('PrettierdRestart', function()
    os.execute('pkill -f prettierd')
end, {})
