return {
  {
    'tpope/vim-commentary';
    lazy = true;
    keys = { { mode='x'; 'gc' }; { mode='n'; 'gc' } };
  },
  {
    'tpope/vim-surround';
    lazy = true;
    keys = { { mode='n'; 'ys' }; { mode='x'; 'S' }; { mode='n'; 'cs' }; { mode='n'; 'ds' }; };
  },
  {
    'tpope/vim-unimpaired';
    lazy = true;
    keys = { { mode='n'; '[p' }; { mode='n'; ']p' }; { mode='n'; '[l' }; { mode='n'; ']l' }; }
  },
  {
    'tpope/vim-repeat';
    lazy = true;
    keys = { { mode='n'; '.' } };
  },
  {
    'tpope/vim-rsi',
    lazy = true,
    event = 'InsertEnter'
  }
}
