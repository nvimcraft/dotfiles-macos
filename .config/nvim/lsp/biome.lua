local M = {}

M.spec = {
	cmd = { 'biome', 'lsp-proxy' },

	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'json',
		'jsonc',
		'astro',
		'svelte',
		'yaml',
		'markdown',
	},

	root_markers = {
		'biome.json',
		'biome.jsonc',
		'package.json',
		'.git',
	},

	-- Formatting is handled by conform
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,

	single_file_support = true,
}

M.name = 'biome'

return M.spec
