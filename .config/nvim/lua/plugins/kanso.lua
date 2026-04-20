vim.pack.add({
	{ src = 'https://github.com/webhooked/kanso.nvim' },
})

require('kanso').setup({
	bold = true,
	italics = true,
	compile = false, -- important: disable compile
	undercurl = true,
	commentStyle = { italic = true },
	keywordStyle = { italic = true },
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	background = {
		dark = 'zen',
		light = 'zen',
	},
	foreground = 'default',
	minimal = true,
})

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = 'kanso',
	callback = function()
		local groups = {
			'Normal',
			'NormalNC',
			'SignColumn',
			'EndOfBuffer',
			'VertSplit',
			'StatusLine',
			'TabLine',
			'LineNr',
			'CursorLineNr',
			'FoldColumn',
			'NormalFloat',
			'FloatBorder',
		}

		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = 'none' })
		end
	end,
})

vim.cmd('colorscheme kanso')
