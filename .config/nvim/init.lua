--[=[
Ordering is intentional.

`core.lsp` evaluates LSP configs eagerly.
`yamlls` requires schemastore.nvim at load time.
With `vim.pack`, plugin modules must be loaded first.

Do not move `core.lsp` above plugin requires.
]=]

require('config.options').setup()
require('config.keymaps').setup()
require('config.autocmds').setup()

-- UI
require('plugins.kanso')
require('plugins.mini-pairs')
require('plugins.plenary')
require('plugins.telescope')
require('plugins.nvim-surround')
require('plugins.conform')
require('plugins.nvim-highlight-colors')

-- Editor tooling
require('plugins.gitsigns')
require('plugins.vim-fugitive')
require('plugins.octo')
require('plugins.vim-dadbod')

-- LSP dependencies
require('plugins.schemastore')
require('plugins.mason')
require('plugins.nvim-cmp')
require('plugins.luasnip')
require('plugins.nvim-treesitter')
require('plugins.nvim-treesitter-context')
require('plugins.nvim-treesitter-textobjects')
require('plugins.nvim-ts-autotag')

require('core.lsp').setup()

-- Testing
require('plugins.nvim-dap')
require('plugins.neotest')

-- Diagnostics / linting
require('plugins.nvim-lint')

-- LSP-powered tooling
require('plugins.refactoring')

-- kulala
require('plugins.kulala')
