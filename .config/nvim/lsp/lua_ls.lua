local lsp = require('core.lsp')

local root_markers = {
	'.stylua.toml',
	'.git',
}

local fallback_to_cwd = true

local M = {}

local function pack_lua_dirs()
	local dirs = {}
	vim.list_extend(
		dirs,
		vim.fn.globpath(vim.o.packpath, 'pack/*/start/*/lua', true, true)
	)
	vim.list_extend(
		dirs,
		vim.fn.globpath(vim.o.packpath, 'pack/*/opt/*/lua', true, true)
	)
	return dirs
end

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/lua-language-server',
	},

	filetypes = { 'lua' },

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = { 'lua/?.lua', 'lua/?/init.lua' },
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
				library = vim.list_extend({
					vim.env.VIMRUNTIME .. '/lua',
					vim.fn.stdpath('config') .. '/lua',
				}, pack_lua_dirs()),
			},
		},
	},
}

return M.spec
