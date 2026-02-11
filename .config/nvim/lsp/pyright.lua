local lsp = require('core.lsp')

local root_markers = {
	'pyproject.toml',
	'setup.py',
	'setup.cfg',
	'requirements.txt',
	'Pipfile',
	'pyrightconfig.json',
	'.git',
}

local fallback_to_cwd = false

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/pyright-langserver',
		'--stdio',
	},

	filetypes = {
		'python',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		python = {
			analysis = {
				-- Core analysis
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = 'workspace',
				useLibraryCodeForTypes = true,

				-- Strict type checking
				typeCheckingMode = 'strict',

				-- Inlay hints
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
					callArgumentNames = true,
					genericTypes = true,
				},

				-- Override severities (strict = turn many into errors)
				diagnosticSeverityOverrides = {
					reportMissingImports = 'error',
					reportMissingTypeStubs = 'warning',
					reportUndefinedVariable = 'error',
					reportUnusedVariable = 'error',
					reportUnusedImport = 'error',
					reportUnusedFunction = 'error',
					reportUnusedClass = 'error',
					reportGeneralTypeIssues = 'error',
					reportOptionalMemberAccess = 'error',
					reportOptionalSubscript = 'error',
					reportOptionalCall = 'error',
					reportUntypedFunctionDecorator = 'warning',
					reportUntypedNamedTuple = 'warning',
					reportUnknownMemberType = 'warning',
				},
			},
		},
	},
}

M.name = 'pyright'

return M.spec
