---@type vim.lsp.Config
return {
	cmd = { "azure-pipelines-language-server", "--stdio" },
	filetypes = { "yaml" },
	root_markers = { "azure-pipelines.yml", ".git" }, -- added .git as fallback;  empty scheme causes a hard error.
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
					"/azure-pipeline*.y*l",
					"/*.azure*",
					"Azure-Pipelines/**/*.y*l",
					"Pipelines/*.y*l",
					"infrastructure/**/*.y*l",
					"Infrastructure/**/*.y*l",
				},
			},
		},
	},
}