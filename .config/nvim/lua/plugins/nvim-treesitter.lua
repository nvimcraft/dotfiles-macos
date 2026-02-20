vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter').setup({
	install_dir = vim.fn.stdpath('data') .. '/site',
})

local filetypes = {
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
}

for _, ft in ipairs(filetypes) do
	vim.api.nvim_create_autocmd('FileType', {
		pattern = ft,
		callback = function()
			vim.treesitter.start()
		end,
		group = vim.api.nvim_create_augroup('TreesitterStart', { clear = false }),
	})
end

-- MDX support
vim.filetype.add({
	extension = {
		mdx = 'mdx',
	},
})

vim.treesitter.language.register('markdown', 'mdx')

-- Incremental selection keymaps
vim.keymap.set('n', '<leader>ci', function()
	if vim.fn.mode() == 'n' then
		vim.cmd('normal! v')
	end
	vim.fn.feedkeys(
		vim.api.nvim_replace_termcodes('<C-space>', true, false, true),
		''
	)
end, { desc = 'Increment Selection' })

vim.keymap.set('v', '<leader>ci', function()
	vim.fn.feedkeys(
		vim.api.nvim_replace_termcodes('<C-space>', true, false, true),
		''
	)
end, { desc = 'Increment Selection' })

vim.keymap.set('v', '<leader>cd', function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<BS>', true, false, true), '')
end, { desc = 'Decrement Selection' })
