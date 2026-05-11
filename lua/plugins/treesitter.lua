return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.install({
            "html",
            "css",
            "go",
            "markdown",
            "markdown_inline",
            "diff",
            "vim",
            "vimdoc",
            "lua",
            "luadoc",
            "luap",
            "editorconfig",
            "bash",
        })
        -- Enable Treesitter highlighting
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })

        -- Optional: enable indentation based on Treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
}
