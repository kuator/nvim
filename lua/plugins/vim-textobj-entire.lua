return function() 
	vim.api.nvim_set_keymap('o', 'ie', '<Plug>(textobj-entire-i)',{})
	vim.api.nvim_set_keymap('x', 'ie', '<Plug>(textobj-entire-i)',{})
	vim.api.nvim_set_keymap('o', 'ae', '<Plug>(textobj-entire-a)',{})
	vim.api.nvim_set_keymap('x', 'ae', '<Plug>(textobj-entire-a)',{})
end
