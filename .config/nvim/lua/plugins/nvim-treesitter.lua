vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

vim.schedule(function()
	local ok_install, install = pcall(require, 'nvim-treesitter.install')
	if ok_install then
		install.compilers = { 'cc', 'clang', 'gcc' }
	end

	local ok, configs = pcall(require, 'nvim-treesitter.configs')
	if not ok then
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
end)
