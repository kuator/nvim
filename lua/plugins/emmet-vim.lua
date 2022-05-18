return {
  'mattn/emmet-vim';
  opt = true;
  setup=[[
  vim.g.user_emmet_mode = 'i'
  vim.g.user_emmet_leader_key = "<c-s>"
  vim.g.user_emmet_expandabbr_key = '<c-s><c-s>'
  ]],
  keys = {
    {'i'; '<c-s>'};
  };
  cmd = {'Emmet'; 'EmmetInstall'};
}
