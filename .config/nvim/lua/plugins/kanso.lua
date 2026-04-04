vim.pack.add({
	{ src = 'https://github.com/webhooked/kanso.nvim' },
})

require('kanso').setup({
	bold = true,
	italics = true,
	compile = true,
	undercurl = true,
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = {},
	typeStyle = {},
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	background = {
		dark = 'zen', -- try "zen", "mist" or "pearl"!
		light = 'zen', -- try "zen", "mist" or "ink"!
	},
	foreground = 'default', -- "default" or "saturated"
	minimal = true,
})

vim.cmd('colorscheme kanso')
