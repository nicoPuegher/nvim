local function map(mode, keys, func, opts, desc)
	local options = { desc = opts.identifier .. desc }

	if opts.bufnr then
		options.buffer = opts.bufnr
	end
	vim.keymap.set(mode, keys, func, options)
end

return map
