vim.pack.add({
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require('mason').setup()

-- Language servers (LSP binaries)
require('mason-lspconfig').setup({
	ensure_installed = {
		'astro',
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
		'svelte',
		-- 'sqlls', -- excluded to enforce single SQL LSP ownership
		'vtsls',
		'yamlls',
	},
	automatic_installation = true,
})

-- External tooling (non-LSP binaries)
require('mason-tool-installer').setup({
	ensure_installed = {
		-- 'biome',
		'black',
		'codespell',
		'isort',
		'goimports',
		'eslint_d',
		'prettier',
		'shellcheck',
		'shfmt',
		'stylua',
		'sqlfmt',
	},
	run_on_start = true,
})
