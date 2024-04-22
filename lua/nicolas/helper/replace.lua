function Replace()
	local old_text = vim.fn.input('Enter text to replace: ')
	if old_text == '' then
		return
	end

	local new_text = vim.fn.input('Enter new text: ')
	if new_text == '' then
		return
	end

	local command = string.format('%%s/%s/%s/g', vim.fn.escape(old_text, '/'), vim.fn.escape(new_text, '/'))
	vim.api.nvim_command(command)
end

vim.api.nvim_set_keymap(
	'n',
	'<leader>r',
	'<cmd>lua Replace()<CR>',
	{ noremap = true, silent = true, desc = '[R]ename' }
)

return Replace
