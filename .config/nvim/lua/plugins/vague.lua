vim.pack.add({
	{ src = 'https://github.com/vague2k/vague.nvim' },
})

vim.cmd('colorscheme vague')

-- Transparency tweaks
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
