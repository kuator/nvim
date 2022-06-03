return {
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
  { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
  { 'tami5/sql.nvim', opt = true },
  -- {
  --   'tknightz/telescope-termfinder.nvim',
  --   config = function ()
  --     require('telescope').load_extension("termfinder")
  --   end,
  --   opt = true,
  -- },
  {
    "nvim-telescope/telescope-frecency.nvim",
    opt = true,
    wants = { "sql.nvim" }
  },
  {
    'nvim-telescope/telescope.nvim',
    wants = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'telescope-frecency.nvim',
      'telescope-file-browser.nvim',
      -- 'telescope-termfinder.nvim',
    },
    opt=true,
    keys = {
      {'n'; '<leader>se'};
      {'n'; '<leader>sf'};
      {'n'; '<leader>sg'};
      {'n'; '<leader>st'};
      {'n'; '<leader>sl'};
      {'n'; '<leader>sh'};
      -- {'n'; '<leader>sp'};
      -- {'n'; '<leader>sb'};
      -- {'n'; '<leader><leader>'};
    };
    cmd = {
      'Telescope'
    };

    config=function ()
      require('plugins.nvim-telescope.telescope-config');
    end
  }
}
