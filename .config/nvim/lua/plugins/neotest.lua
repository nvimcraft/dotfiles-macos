vim.pack.add({
	{ src = 'https://github.com/nvim-neotest/nvim-nio' },
	{ src = 'https://github.com/antoinemadec/FixCursorHold.nvim' },
	{ src = 'https://github.com/nvim-neotest/neotest' },
	{ src = 'https://github.com/marilari88/neotest-vitest' },
	{ src = 'https://github.com/nvim-neotest/neotest-jest' },
})

---@diagnostic disable-next-line: missing-fields
require('neotest').setup({
	adapters = {
		require('neotest-vitest')({
			filter_dir = function(name, _)
				return name ~= 'node_modules'
			end,
		}),
		require('neotest-jest')({
			jestCommand = 'pnpm test --',
		}),
	},
})

-- Keymaps
vim.keymap.set('n', '<leader>tt', function()
	require('neotest').summary.toggle()
end)

vim.keymap.set('n', '<leader>tr', function()
	require('neotest').run.run()
end)

vim.keymap.set('n', '<leader>tf', function()
	require('neotest').run.run(vim.fn.expand('%'))
end)

vim.keymap.set('n', '<leader>ts', function()
	require('neotest').run.stop()
end)

vim.keymap.set('n', '<leader>ta', function()
	require('neotest').run.attach()
end)

vim.keymap.set('n', '<leader>to', function()
	require('neotest').output.open()
end)

vim.keymap.set('n', '<leader>tw', function()
	require('neotest').run.run({
		suite = false,
		vitestCommand = 'vitest --watch',
	})
end)

vim.keymap.set('n', '<leader>td', function()
	require('neotest').run.run({
		suite = false,
		strategy = 'dap',
	})
end)
