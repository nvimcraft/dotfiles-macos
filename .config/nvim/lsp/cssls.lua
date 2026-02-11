local lsp = require('core.lsp')

local root_markers = {
	'package.json',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/vscode-css-language-server',
		'--stdio',
	},

	filetypes = {
		'css',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		css = {
			validate = true,
		},
	},
}

M.name = 'cssls'

return M.spec
