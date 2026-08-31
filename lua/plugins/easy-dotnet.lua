return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
	config = function()
		require("easy-dotnet").setup({
			lsp = {
				set_fold_expr = false,
				analyzer_assemblies = {
					"/home/adrin/sources/sonaranalyzer/analyzers/SonarAnalyzer.CSharp.dll",
				},
			},
			test_runner = {
				icons = {
					passed = "P",
					skipped = "-",
					failed = "F",
					success = "W",
					reload = "R",
					test = "T",
					sln = "sln",
					project = "proj",
					dir = "dir",
					package = "pack",
					class = "c#",
					build_failed = "b_f",
				},
			},
		})
	end,
}
