vim.pack.add({
	{ src = 'https://github.com/mfussenegger/nvim-dap' },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui' },
	{ src = 'https://github.com/nvim-neotest/nvim-nio' },
})

local dap = require('dap')

local js_debug_adapter_path = vim.fn.stdpath('data')
	.. '/mason/packages/js-debug-adapter/js-debug/out/src/dapDebugServer.js'
dap.adapters['pwa-node'] = {
	type = 'server',
	host = 'localhost',
	port = '${port}',
	executable = {
		command = 'node',
		args = { js_debug_adapter_path, '${port}' },
	},
}

local js_debug_configs = {
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Debug Current File (Node)',
		program = '${file}',
		cwd = '${workspaceFolder}',
		sourceMaps = true,
		console = 'integratedTerminal',
		skipFiles = { '<node_internals>/**', '**/node_modules/**' },
	},

	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Debug Jest Tests',
		program = '${workspaceFolder}/node_modules/jest/bin/jest.js',
		args = { '--runInBand', '${file}' },
		cwd = '${workspaceFolder}',
		console = 'integratedTerminal',
		sourceMaps = true,
		skipFiles = { '<node_internals>/**', '**/node_modules/**' },
	},

	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Debug Vitest Tests',
		program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
		args = { 'run', '${file}' },
		cwd = '${workspaceFolder}',
		console = 'integratedTerminal',
		sourceMaps = true,
		skipFiles = { '<node_internals>/**', '**/node_modules/**' },
	},

	{
		type = 'pwa-node',
		request = 'attach',
		name = 'Attach to Node Process',
		processId = require('dap.utils').pick_process,
		cwd = '${workspaceFolder}',
		sourceMaps = true,
		skipFiles = { '<node_internals>/**', '**/node_modules/**' },
	},
}
for _, filetype in ipairs({
	'javascript',
	'javascriptreact',
	'typescript',
	'typescriptreact',
}) do
	dap.configurations[filetype] = js_debug_configs
end

require('dapui').setup()

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>do', dap.step_over)
vim.keymap.set('n', '<leader>dO', dap.step_out)
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>du', require('dapui').toggle)
