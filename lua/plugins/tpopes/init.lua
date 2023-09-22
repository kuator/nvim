return {
  -- {
  --   'tpope/vim-commentary';
    -- keys = { { mode='x'; 'gc' }; { mode='n'; 'gc' } };
  -- },
  {
    'tpope/vim-surround';
    keys = { { mode='n'; 'ys' }; { mode='x'; 'S' }; { mode='n'; 'cs' }; { mode='n'; 'ds' }; };
  },
  {
    'tpope/vim-unimpaired';
    keys = { { mode='n'; '[p' }; { mode='n'; ']p' }; { mode='n'; '[l' }; { mode='n'; ']l' }; }
  },
  {
    'tpope/vim-repeat';
    keys = { { mode='n'; '.' } };
  },
  {
    'tpope/vim-rsi',
    event = 'InsertEnter'
  },
  {
    'tpope/vim-abolish',
    event = 'InsertEnter'
  }
}
