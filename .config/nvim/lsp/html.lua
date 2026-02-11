local lsp = require('core.lsp')

local root_markers = {
	'package.json',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/vscode-html-language-server',
		'--stdio',
	},

	filetypes = {
		'html',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		html = {
			validate = true,
			suggest = {
				html5 = true,
			},
		},
	},
}

M.name = 'html'

return M.spec
