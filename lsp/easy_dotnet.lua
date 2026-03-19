-- installation: dotnet tool install -g easydotnet
-- for linux: export PATH="$HOME/.dotnet/tools:$PATH"
-- the tool is called dotnet-easydotnet, it is easier to create a symlink:
-- ln -sf "$HOME/.dotnet/tools/dotnet-easydotnet" "$HOME/.local/bin/easydotnet"
-- source ~/.zshrc
-- command -v easydotnet && easydotnet --version
---@type vim.lsp.Config
return {
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
		},
		["csharp|formatting"] = {
			dotnet_organize_imports_on_format = true,
		},
	},
}
