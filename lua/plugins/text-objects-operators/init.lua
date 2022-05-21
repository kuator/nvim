return {
  {
    'inkarkat/vim-ReplaceWithRegister';
    opt = true;
    keys = { { 'n'; 'gr' }; { 'x'; 'gr' }; };
  };
  { 'wellle/targets.vim' };
  { 'kana/vim-textobj-user', opt = true };
  require 'plugins.text-objects-operators.vim-textobj-line';
  require 'plugins.text-objects-operators.vim-textobj-entire';
  {
    'Julian/vim-textobj-variable-segment';
    opt = true;
    wants = 'vim-textobj-user';
    keys = { { 'o'; 'iv' }; { 'o'; 'av' }; { 'x'; 'iv' }; { 'x'; 'av' }; };
  };
}
