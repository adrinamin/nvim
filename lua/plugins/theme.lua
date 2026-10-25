return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catpuccin = require("catppuccin")

		catpuccin.setup({
			flavour = "macchiato",
		})
	end,
}
