vim.pack.add({
	{ src = 'https://github.com/stevearc/conform.nvim' },
})

local conform = require('conform')

conform.formatters.biome = {
	command = 'biome',
	args = { 'format', '--write', '$FILENAME' },
	stdin = false,
}

conform.formatters['sql-formatter'] = {
	command = 'sql-formatter',
	args = { '--language', 'postgresql' },
	stdin = true,
}

require('conform').setup({
	format_on_save = {
		lsp_format = 'never',
		timeout_ms = 5000,
	},

	formatters_by_ft = {

		-- Prettier configuration (default formatter)
		['_'] = { 'codespell', 'trim_whitespace' },
		astro = { 'prettier' },
		css = { 'prettier' },
		graphql = { 'prettier' },
		html = { 'prettier' },
		javascript = { 'prettier' },
		javascriptreact = { 'prettier' },
		json = { 'prettier' },
		markdown = { 'prettier' },
		svelte = { 'prettier' },
		typescript = { 'prettier' },
		typescriptreact = { 'prettier' },
		yaml = { 'prettier' },

		go = { 'goimports', 'gofmt' },
		lua = { 'stylua' },
		python = { 'isort', 'black' },
		sh = { 'shfmt' },
		sql = { 'sql-formatter' },

		-- Biome configuration (alternative, kept for easy switching)
		-- ['_'] = { 'codespell', 'trim_whitespace' },
		-- astro = { 'biome' },
		-- css = { 'biome' },
		-- graphql = { 'biome' },
		-- html = { 'biome' },
		-- javascript = { 'biome' },
		-- javascriptreact = { 'biome' },
		-- json = { 'biome' },
		-- jsonc = { 'biome' },
		-- markdown = { 'prettier' },
		-- svelte = { 'biome' },
		-- typescript = { 'biome' },
		-- typescriptreact = { 'biome' },
		-- yaml = { 'prettier' },
		--
		-- go = { 'goimports', 'gofmt' },
		-- lua = { 'stylua' },
		-- python = { 'isort', 'black' },
		-- sh = { 'shfmt' },
		-- sql = { 'sql-formatter' },
	},
})
