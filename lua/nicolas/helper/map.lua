local function map(mode, keys, func, opts, desc)
	vim.keymap.set(mode, keys, func, { buffer = opts.bufnr, desc = opts.identifier .. desc })
end

return map
