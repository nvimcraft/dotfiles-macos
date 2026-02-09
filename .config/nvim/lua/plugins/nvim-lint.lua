--[=[
nvim-lint configuration

Linting is intentionally scoped, minimal, and explicit.

- Only shell scripts (`.sh`) are linted via nvim-lint, using ShellCheck.
- ShellCheck is installed via Mason (see mason-tool-installer).
- ESLint diagnostics are provided via LSP (`lsp/eslint.lua`).
]=]

vim.pack.add({
	{ src = 'https://github.com/mfussenegger/nvim-lint' },
})

local lint = require('lint')

lint.linters_by_ft = {
	sh = { 'shellcheck' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	callback = function()
		lint.try_lint()
	end,
})
