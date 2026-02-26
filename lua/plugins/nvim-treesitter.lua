return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = false,
			ensure_installed = {
				"lua",
        "help",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
