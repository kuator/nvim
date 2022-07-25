return {
  {
    'simrat39/symbols-outline.nvim',
    opt = true
  };
  {
    'seandewar/bad-apple.nvim',
    opt = true,
    cmd = {'BadApple'}
  };
  { 'noib3/nvim-compleet', opt = true };
  {
    'leafOfTree/vim-vue-plugin';
    ft = 'vue';
  };
  {
    'MaxMEllon/vim-jsx-pretty';
    ft = { 'javascript', 'javascriptreact' };
  };
  {
    'dhruvasagar/vim-zoom';
    opt = true;
    keys = { { 'n'; '<c-w>m' } };
  };
  'godlygeek/tabular'
  -- {
  --   'numToStr/FTerm.nvim';
  --   opt = true;
  --   keys = { { 'n'; '<a-i>' }; { 't'; '<a-i>' }  };
  --   config = function ()
  --     vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
  --     vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  --   end
  -- };

  -- TODO: Investigate
  -- https://github.com/rlane/pounce.nvim
  -- https://github.com/mg979/vim-visual-multi
}
