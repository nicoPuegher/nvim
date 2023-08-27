local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy exists and clone it if it does not
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Latest stable release
		lazypath,
	})
end

-- Add lazy to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Make sure lazy is installed
local status, lazy = pcall(require, "lazy")
if not status then
	print("lazy.nvim not installed!")
	return
end

-- Setup lazy.nvim
lazy.setup({})
