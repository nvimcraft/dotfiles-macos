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
-- require('plugins.vague')
require('plugins.everforest')
require('plugins.mini-pairs')
require('plugins.plenary')
require('plugins.telescope')
require('plugins.nvim-surround')
require('plugins.conform')
require('plugins.nvim-highlight-colors')

-- LSP dependencies
require('plugins.schemastore')
require('plugins.gitsigns')
require('plugins.octo')
require('plugins.vim-dadbod')
require('plugins.mason')
require('plugins.nvim-cmp')
require('plugins.luasnip')

require('core.lsp')
