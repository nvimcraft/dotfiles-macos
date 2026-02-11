local lsp = require('core.lsp')

local root_markers = {
	'astro.config.mjs',
	'astro.config.ts',
	'package.json',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/astro-ls',
		'--stdio',
	},

	filetypes = {
		'astro',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		astro = {
			completions = true,
			diagnostics = true,
		},
	},

	init_options = {
		typescript = {
			tsdk = 'node_modules/typescript/lib',
		},
	},
}

M.name = 'astro'

return M.spec
