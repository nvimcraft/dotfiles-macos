local lsp = require('core.lsp')

local root_markers = {
	'.graphqlrc',
	'.graphqlrc.json',
	'.graphqlrc.yaml',
	'.graphqlrc.yml',
	'.graphqlrc.js',
	'graphql.config.json',
	'graphql.config.js',
	'graphql.config.yaml',
	'graphql.config.yml',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/graphql-lsp',
		'server',
		'-m',
		'stream',
	},

	filetypes = {
		'astro',
		'graphql',
		'javascript',
		'javascriptreact',
		'svelte',
		'typescriptreact',
		'typescript',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),
}

M.name = 'graphql'

return M.spec
