vim.pack.add({
	{ src = 'https://github.com/ThePrimeagen/refactoring.nvim' },
})

require('refactoring').setup({
	prompt_func_return_type = {
		go = true,
		python = true,
	},

	print_var_statements = {
		astro = { 'console.log' },
		go = { 'fmt.Println' },
		jsx = { 'console.log' },
		javascript = { 'console.log' },
		javascriptreact = { 'console.log' },
		lua = { 'print' },
		python = { 'print' },
		svelte = { 'console.log' },
		tsx = { 'console.log' },
		typescript = { 'console.log' },
		typescriptreact = { 'console.log' },
	},
})

vim.keymap.set('v', '<leader>r', function()
	require('refactoring').select_refactor({
		show_success_message = true,
	})
end)
