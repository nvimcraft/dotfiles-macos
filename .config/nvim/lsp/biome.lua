local lsp = require('core.lsp')

local root_markers = {
	'biome.json',
	'package.json',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/biome',
		'lsp-proxy',
	},

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

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	-- Formatting handled by conform
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}

M.name = 'biome'

return M.spec
