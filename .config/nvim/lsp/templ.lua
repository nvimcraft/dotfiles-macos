local lsp = require('core.lsp')

local root_markers = {
	'go.mod',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/templ-lsp',
		'--stdio',
	},
	filetypes = {
		'templ',
	},
	root_dir = lsp.make_root(root_markers, fallback_to_cwd),
}

M.name = 'templ'

return M.spec
