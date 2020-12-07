vim.g.textobj_line_no_default_key_mappings= true
vim.api.nvim_set_keymap('o', 'ir', '<cmd><Plug>(textobj-line-i)', {})
vim.api.nvim_set_keymap('v', 'ir', '<cmd><Plug>(textobj-line-i)', {})
vim.api.nvim_set_keymap('o', 'ar', '<cmd><Plug>(textobj-line-a)', {})
vim.api.nvim_set_keymap('v', 'ar', '<cmd><Plug>(textobj-line-a)', {})

require('plugins')
