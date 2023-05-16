return {
  {
    'Wansmer/treesj',
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
      vim.keymap.set('n', '<leader>j', "<cmd>TSJToggle<cr>")
    end,
    keys = { { mode='n'; '<leader>j' }}
  },
  {
    'simrat39/symbols-outline.nvim',
    lazy = true
  },
  -- {
  --   'seandewar/bad-apple.nvim',
  --   lazy = true,
  --   cmd = {'BadApple'}
  -- };
  { 'https://github.com/Eandrju/cellular-automaton.nvim', lazy = true, cmd = { 'CellularAutomaton' } },
  {
    'leafOfTree/vim-vue-plugin',
    ft = 'vue',
  },
  {
    'MaxMEllon/vim-jsx-pretty',
    ft = { 'javascript', 'javascriptreact' },
  },
  {
    'dhruvasagar/vim-zoom',
    lazy = true,
    keys = { { mode = 'n', '<c-w>m' } },
  },
  'godlygeek/tabular',
  'junkblocker/git-time-lapse',

  -- TODO: Investigate
  -- https://github.com/rlane/pounce.nvim
  -- require 'plugins.nvimux'
  -- https://github.com/mg979/vim-visual-multi
}
