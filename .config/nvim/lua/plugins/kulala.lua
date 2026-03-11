vim.pack.add({
	{
		src = 'https://github.com/mistweaverco/kulala.nvim',
		ft = { 'http', 'rest' },
	},
})

require('kulala').setup({
	global_keymaps = true,
})
