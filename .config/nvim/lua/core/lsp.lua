local M = {}

-- Central LSP policy:
-- - Root resolution is handled via make_root()
-- - Per-server configs should NOT define single_file_support
-- - fallback_to_cwd controls standalone attachment behavior
-- - Diagnostics UI is configured globally here
function M.make_root(root_markers, fallback_to_cwd)
	return function(bufnr, set_root)
		local buf_path = vim.api.nvim_buf_get_name(bufnr)
		if buf_path == '' then
			return
		end

		local root = vim.fs.root(buf_path, root_markers)

		if not root and fallback_to_cwd then
			root = vim.uv.cwd()
		end

		if root then
			set_root(root)
		end
	end
end

function M.setup()
	vim.lsp.enable({
		'astro',
		-- 'biome',
		'cssls',
		'emmet_language_server',
		'eslint',
		'gopls',
		'graphql',
		'html',
		'jsonls',
		'lua_ls',
		'marksman',
		'postgres_lsp',
		'pyright',
		-- 'sqlls',
		'svelte',
		'vtsls',
		'yamlls',
	})

	vim.diagnostic.config({
		virtual_lines = false,
		virtual_text = false,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = 'rounded',
			source = true,
		},
		signs = {
			text = {
				-- [vim.diagnostic.severity.ERROR] = '󰅚 ',
				-- [vim.diagnostic.severity.WARN] = '󰀪 ',
				-- [vim.diagnostic.severity.INFO] = '󰋽 ',
				-- [vim.diagnostic.severity.HINT] = '󰌶 ',
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
				[vim.diagnostic.severity.WARN] = 'WarningMsg',
				[vim.diagnostic.severity.INFO] = 'InfoMsg',
				[vim.diagnostic.severity.HINT] = 'HintMsg',
			},
		},
	})
end

return M
