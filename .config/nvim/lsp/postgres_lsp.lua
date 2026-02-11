local lsp = require('core.lsp')

local root_markers = {
	'supabase',
	'migrations',
	'schema.sql',
	'init.sql',
	'config.toml',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/postgres-language-server',
		'lsp-proxy',
	},

	filetypes = {
		'sql',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),
}

return M.spec
