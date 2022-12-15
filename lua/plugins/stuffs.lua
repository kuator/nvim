return {
  {
    'simrat39/symbols-outline.nvim',
    opt = true
  };
  -- {
  --   'seandewar/bad-apple.nvim',
  --   opt = true,
  --   cmd = {'BadApple'}
  -- };
  { 'noib3/nvim-compleet', opt = true };
  { 'https://github.com/Eandrju/cellular-automaton.nvim', opt = true, cmd = {'CellularAutomaton'} };
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
  'godlygeek/tabular',
  'junkblocker/git-time-lapse',
  {
      "ThePrimeagen/refactoring.nvim",
      requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
      },
      config = function ()
        require('refactoring').setup({})
        -- Remaps for the refactoring operations currently offered by the plugin
        vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
        vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
        vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
        vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

        -- Extract block doesn't need visual mode
        vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
        vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

        -- Inline variable can also pick up the identifier currently under the cursor without visual mode
        vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
      end
  }

  -- TODO: Investigate
  -- https://github.com/rlane/pounce.nvim
  -- https://github.com/mg979/vim-visual-multi

}

