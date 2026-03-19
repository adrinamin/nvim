return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("easy-dotnet").setup({
			lsp = {
				analyzer_assemblies = {
					"/home/adrin/sources/sonaranalyzer/analyzers/SonarAnalyzer.CSharp.dll",
				},
			},
		})
	end,
}
