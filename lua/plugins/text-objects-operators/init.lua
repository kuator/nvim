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
  {
    'https://github.com/AndrewRadev/dsf.vim',
    opt = true,
    keys = { { 'n'; 'dsf' }; {'n'; 'dsnf' }; { 'n'; 'csf' }; { 'n'; 'csnf' }}
  },
  {
    'tommcdo/vim-lion',
    opt = true,
    keys = { { 'n'; 'gl' }; { 'n'; 'gL' }; };
  },
  {
    'https://github.com/ralismark/opsort.vim',
    opt = true,
    keys = { { 'n'; 'gs' }; { 'x'; 'gs' }; };
  },
  -- {
  --   'AckslD/nvim-trevJ.lua',
  --   config = 'require("trevj").setup()',
  --   -- optional call for configurating non-default filetypes etc
  --   -- uncomment if you want to lazy load
  --   module = 'trevj',
  --   -- an example for configuring a keybind, can also be done by filetype
  --   setup = function()
  --     vim.keymap.set('n', '<leader>j', function()
  --       require('trevj').format_at_cursor()
  --     end)
  --   end,
  -- },
  {
    'Wansmer/treesj',
    config = function()
      require('treesj').setup({
        --[[ your config ]]
        use_default_keymaps = false,
      })
      vim.keymap.set('n', '<leader>j', "<cmd>TSJToggle<cr>")
    end,
  },
  'tommcdo/vim-exchange'
}
