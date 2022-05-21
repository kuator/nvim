return {
  {
    'tpope/vim-commentary';
    opt = true;
    keys = { { 'x'; 'gc' }; { 'n'; 'gc' } };
  },
  {
    'tpope/vim-surround';
    opt = true;
    keys = { { 'n'; 'ys' }; { 'x'; 'S' }; { 'n'; 'cs' }; };
  },
  {
    'tpope/vim-unimpaired';
    opt = true;
    keys = { { 'n'; '[p' }; { 'n'; ']p' }; { 'n'; '[l' }; { 'n'; ']l' }; }
  },
  {
    'tpope/vim-repeat';
    opt = true;
    keys = { { 'n'; '.' } };
  },
  {
    'tpope/vim-rsi',
    opt = true,
    event = 'InsertEnter'
  }
}
