return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "-", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
			ellipsis = "…",
			-- set to false to disable all mapping icons,
			-- both those explicitly added in a mapping
			-- and those from rules
			mappings = false,
			-- use the highlights from mini.icons
			-- When `false`, it will use `WhichKeyIcon` instead
			colors = false,
			-- used by key format
			keys = {
				Up = "^",
				Down = "",
				Left = "<-",
				Right = "->",
				C = "",
				M = "",
				D = "",
				S = "",
				CR = "crlt",
				Esc = "x",
				ScrollWheelDown = "",
				ScrollWheelUp = "",
				NL = "",
				BS = "",
				Space = "__",
				Tab = "tab",
				F1 = "",
				F2 = "",
				F3 = "",
				F4 = "",
				F5 = "",
				F6 = "",
				F7 = "",
				F8 = "",
				F9 = "",
				F10 = "",
				F11 = "",
				F12 = "",
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
