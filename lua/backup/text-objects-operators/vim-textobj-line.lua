return {
    'kana/vim-textobj-line';
    opt=true;
    wants='vim-textobj-user';
    setup='vim.g.textobj_line_no_default_key_mappings=true';
    keys = {{'o'; 'ar'}, {'o'; 'ir'}, {'x'; 'ar'}, {'x'; 'ir'}};
    config=function()
      vim.api.nvim_set_keymap('o', 'ir', '<Plug>(textobj-line-i)',{})
      vim.api.nvim_set_keymap('x', 'ir', '<Plug>(textobj-line-i)',{})
      vim.api.nvim_set_keymap('o', 'ar', '<Plug>(textobj-line-a)',{})
      vim.api.nvim_set_keymap('x', 'ar', '<Plug>(textobj-line-a)',{})
    end;
  }
