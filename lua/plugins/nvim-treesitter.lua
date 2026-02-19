return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	init = function()
		-- This must run before setup, so use init instead of config
		require("nvim-treesitter.install").prefer_git = false
		require("nvim-treesitter.install").compilers = { "gcc", "clang", "cl" }
		vim.fn.setenv("MSYSTEM", nil)
	end,
	config = function()
		require("nvim-treesitter").setup({
			auto_install = false,
			ensure_installed = {
				"lua",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
