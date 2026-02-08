vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

-- vim.pack installs plugins asynchronously on first startup.
-- Treesitter may not be on runtimepath yet; skip setup and retry next launch.
local has_configs, configs = pcall(require, 'nvim-treesitter.configs')
if not has_configs then
	return
end

configs.setup({
	ensure_installed = {
		'astro',
		'bash',
		'css',
		'diff',
		'gitignore',
		'go',
		'graphql',
		'html',
		'http',
		'javascript',
		'json',
		'jsonc',
		'lua',
		'luadoc',
		'markdown',
		'markdown_inline',
		'python',
		'svelte',
		'query',
		'regex',
		'toml',
		'tsx',
		'typescript',
		'vim',
		'vimdoc',
		'yaml',
	},

	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
