local lsp = require('core.lsp')

local root_markers = {
	'.git',
	'db.sql',
	'init.sql',
	'schema.sql',
	'migrations',
	'docker-compose.yml',
	'docker-compose.yaml',
	'package.json',
	'composer.json',
	'requirements.txt',
	'go.mod',
}

local fallback_to_cwd = true

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/sql-language-server',
		'up',
		'--method',
		'stdio',
	},

	filetypes = {
		'sql',
		'mysql',
		'pgsql',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		sqlLanguageServer = {
			connections = {},

			lint = {
				rules = {
					['align-column-to-the-first'] = 'warning',
					['column-new-line'] = 'warning',
					['linebreak-after-clause-keyword'] = 'warning',
					['reserved-word-case'] = { 'warning', 'upper' },
					['align-where-clause-to-the-first'] = 'warning',
				},
			},

			completion = {
				keywordCase = 'preserve',
				alwaysSelect = false,
				snippetSupport = true,
			},

			fileAssociations = {
				{
					pattern = '**/*.sql',
					scheme = 'file',
				},
			},
		},
	},
}

M.name = 'sqlls'

return M.spec
