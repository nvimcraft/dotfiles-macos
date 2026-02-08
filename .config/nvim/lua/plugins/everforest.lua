vim.pack.add({
	{ src = 'https://github.com/neanias/everforest-nvim' },
})

-- set background
vim.o.background = 'dark'

-- Everforest options
vim.g.everforest_background = 'hard' -- soft | medium | hard
vim.g.everforest_enable_italic = 1
vim.g.everforest_better_performance = 1

vim.cmd('colorscheme everforest')

-- Transparency tweaks
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })

-- Cursor tweak
vim.api.nvim_set_hl(0, 'Cursor', {
	bg = '#d3c6aa',
	fg = '#272e33',
})
