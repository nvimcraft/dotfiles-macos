local lsp = require('core.lsp')

local root_markers = {
	'tsconfig.json',
	'tsconfig.app.json',
	'tsconfig.node.json',
	'jsconfig.json',
	'package.json',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/vtsls',
		'--stdio',
	},

	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},

	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
					preferredPackageManager = 'pnpm',
				},
			},
		},
	},
}

M.name = 'vtsls'

return M.spec
