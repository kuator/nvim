return function() 
	vim.api.nvim_set_keymap('o', 'ir', '<Plug>(textobj-line-i)',{})
	vim.api.nvim_set_keymap('x', 'ir', '<Plug>(textobj-line-i)',{})
	vim.api.nvim_set_keymap('o', 'ar', '<Plug>(textobj-line-a)',{})
	vim.api.nvim_set_keymap('x', 'ar', '<Plug>(textobj-line-a)',{})
end
