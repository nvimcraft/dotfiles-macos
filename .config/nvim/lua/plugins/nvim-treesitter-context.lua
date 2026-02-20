vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
})

require('treesitter-context').setup({
	enabled = true,
	max_lines = 3,
	trim_scope = 'outer',
	mode = 'cursor',
	multiwindow = false,
	multiline_threshold = 20,
	separator = '─',
	zindex = 20,
})
