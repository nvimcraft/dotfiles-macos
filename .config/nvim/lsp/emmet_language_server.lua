local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/emmet-language-server',
		'--stdio',
	},

	filetypes = {
		'astro',
		'css',
		'html',
		'javascriptreact',
		'scss',
		'svelte',
		'typescriptreact',
	},

	init_options = {
		includeLanguages = {
			javascript = 'javascriptreact',
			typescript = 'typescriptreact',
		},
		showExpandedAbbreviation = 'always',
		showAbbreviationSuggestions = true,
		syntaxProfiles = {
			html = {
				selfClosingStyle = 'xhtml',
			},
		},
		options = {
			-- BEM methodology support
			['bem.enabled'] = true,

			-- Output formatting
			['output.indent'] = '  ',
			['output.newline'] = '\n',
		},
	},
}

M.name = 'emmet_language_server'

return M.spec
