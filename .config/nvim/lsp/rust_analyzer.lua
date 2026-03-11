local lsp = require('core.lsp')

local root_markers = {
	'Cargo.toml',
	'rust-toolchain.toml',
	'rust-toolchain',
	'.git',
}

local fallback_to_cwd = false

local M = {}
M.spec = {
	cmd = {
		'/Users/rjl/.cargo/bin/rust-analyzer',
	},
	filetypes = {
		'rust',
	},
	root_dir = lsp.make_root(root_markers, fallback_to_cwd),
	settings = {
		rust_analyzer = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				runBuildScripts = true,
			},
			procMacro = {
				enable = true,
			},
			inlayHints = {
				enable = true,
				parameterHints = true,
				typeHints = true,
				chainingHints = true,
			},
			diagnostics = {
				enable = true,
			},
		},
	},
}

M.name = 'rust_analyzer'

return M.spec
