vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
})

vim.g.no_plugin_maps = true

require('nvim-treesitter-textobjects').setup({
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			['af'] = '@function.outer',
			['if'] = '@function.inner',
			['aa'] = '@parameter.outer',
			['ia'] = '@parameter.inner',
		},
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
		},
	},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			[']f'] = '@function.outer',
			[']a'] = '@parameter.inner',
		},
		goto_next_end = {
			[']F'] = '@function.outer',
			[']A'] = '@parameter.inner',
		},
		goto_previous_start = {
			['[f'] = '@function.outer',
			['[a'] = '@parameter.inner',
		},
		goto_previous_end = {
			['[F'] = '@function.outer',
			['[A'] = '@parameter.inner',
		},
	},
})
