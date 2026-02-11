local lsp = require('core.lsp')
local schemastore = require('schemastore')

local root_markers = {
	'.yamllint',
	'docker-compose.yml',
	'docker-compose.yaml',
	'.git',
}

local fallback_to_cwd = true

-- AWS CloudFormation intrinsic function tags
local cloudformation_tags = {
	'!Ref scalar',
	'!Sub scalar',
	'!GetAtt scalar',
	'!ImportValue scalar',
	'!Join sequence',
	'!Select sequence',
	'!If sequence',
}

local M = {}

M.spec = {
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/yaml-language-server',
		'--stdio',
	},

	filetypes = {
		'yaml',
	},

	root_dir = lsp.make_root(root_markers, fallback_to_cwd),

	settings = {
		yaml = {
			validate = true,
			format = { enable = false },
			hover = true,
			completion = true,
			schemaStore = {
				-- Disable yamlls built-in schema store.
				enable = false,
				url = '',
			},

			-- Load curated YAML schemas from schemastore.nvim
			schemas = schemastore.yaml.schemas(),
			customTags = cloudformation_tags,
		},
	},
}

M.name = 'yamlls'

return M.spec
