local lsp = require('core.lsp')

local root_markers = {
	'.marksman.toml',
	'package.json',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/marksman',
	},

	filetypes = {
		'markdown',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),
}

M.name = 'marksman'

return M.spec
