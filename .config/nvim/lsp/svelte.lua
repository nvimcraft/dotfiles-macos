local lsp = require('core.lsp')

local root_markers = {
	'svelte.config.js',
	'svelte.config.ts',
	'package.json',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/svelteserver',
		'--stdio',
	},

	filetypes = { 'svelte' },

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		svelte = {
			plugin = {
				css = { enable = true },
				typescript = { enable = true },
				javascript = { enable = true },
			},
		},
	},
}

M.name = 'svelte'

return M.spec
