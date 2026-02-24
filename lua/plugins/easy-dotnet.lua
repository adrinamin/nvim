return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		require("easy-dotnet").setup({
			lsp = {
				analyzer_assemblies = {
					"C:\\Users\\SALEHADRVADM\\source\\sonaranalyzer.csharp.10.19.0.132793\\analyzers\\SonarAnalyzer.CSharp.dll",
				},
			},
		})
	end,
}
