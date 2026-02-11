local lsp = require('core.lsp')

local root_markers = {
	'.stylua.toml',
	'.git',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/lua-language-server',
	},

	filetypes = {
		'lua',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file('', true),
			},
		},
	},
}

return M.spec
