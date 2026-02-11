local markers = {
	'config.toml',
	'supabase',
	'migrations',
	'schema.sql',
	'init.sql',
}

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/postgres-language-server',
		'lsp-proxy',
	},

	filetypes = { 'sql' },

	root_dir = function(bufnr, set_root)
		local buf_path = vim.api.nvim_buf_get_name(bufnr)
		if buf_path == '' then
			return
		end

		local project_root = vim.fs.root(buf_path, markers)
		if project_root then
			set_root(project_root)
		end
	end,

	single_file_support = false,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

return M.spec
