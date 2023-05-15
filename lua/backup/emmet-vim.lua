return {
  'mattn/emmet-vim';
  opt = true;
  setup=[[
  vim.g.user_emmet_mode = 'i'
  vim.g.user_emmet_leader_key = "<c-q>"
  vim.g.user_emmet_expandabbr_key = '<c-q><c-q>'
  ]],
  keys = {
    {'i'; '<c-q>'};
  };
  cmd = {'Emmet'; 'EmmetInstall'};
}
