vim.pack.add({
	{
		src = 'https://github.com/pwntester/octo.nvim',
		dependencies = {
			'https://github.com/nvim-telescope/telescope.nvim',
		},
	},
})

require('octo').setup({
	picker = 'telescope',
	enable_builtin = true,
})

-- Keymaps
vim.keymap.set('n', '<leader>oi', '<cmd>Octo issue list<cr>')
vim.keymap.set('n', '<leader>oI', '<cmd>Octo issue create<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>Octo pr list<cr>')
vim.keymap.set('n', '<leader>oP', '<cmd>Octo pr create<cr>')
vim.keymap.set('n', '<leader>od', '<cmd>Octo discussion list<cr>')
vim.keymap.set('n', '<leader>on', '<cmd>Octo notification list<cr>')
vim.keymap.set('n', '<leader>os', function()
	vim.ui.input({ prompt = 'Octo search: ' }, function(search_query)
		if search_query and search_query ~= '' then
			vim.cmd('Octo search ' .. search_query)
		end
	end)
end)
