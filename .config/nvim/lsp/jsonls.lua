local lsp = require('core.lsp')

local root_markers = {
	'package.json',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/vscode-json-language-server',
		'--stdio',
	},

	filetypes = {
		'json',
		'jsonc',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		json = {
			validate = { enable = true },
			format = { enable = false },
			schemas = require('schemastore').json.schemas(),
			schemaDownload = { enable = true },
		},
	},
}

M.name = 'jsonls'

return M.spec
