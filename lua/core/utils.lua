-- Custom filetypes
vim.filetype.add({
    pattern = {
        ['.env.*'] = 'sh',
        ['.env'] = 'sh',
    },
})
