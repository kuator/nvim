local textobject_entire = {
  'kana/vim-textobj-entire',
  lazy = true,
  dependencies = 'vim-textobj-user',
  keys = { { mode = 'o', 'ae' }, { mode = 'o', 'ie' }, { mode = 'x', 'ae' }, { mode = 'x', 'ie' } },
}

local textobject_line = {
  'kana/vim-textobj-line',
  lazy = true,
  dependencies = 'vim-textobj-user',
  init = function()
    vim.g.textobj_line_no_default_key_mappings = true
  end,
  keys = {
    { mode = 'o', 'ar' },
    { mode = 'o', 'ir' },
    { mode = 'x', 'ar' },
    { mode = 'x', 'ir' },
  },
  config = function()
    vim.api.nvim_set_keymap('o', 'ir', '<Plug>(textobj-line-i)', {})
    vim.api.nvim_set_keymap('x', 'ir', '<Plug>(textobj-line-i)', {})
    vim.api.nvim_set_keymap('o', 'ar', '<Plug>(textobj-line-a)', {})
    vim.api.nvim_set_keymap('x', 'ar', '<Plug>(textobj-line-a)', {})
  end,
}

local comment_nvim = {
  'numToStr/Comment.nvim',
  ['config'] = function()
    local status_ok, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    local config = {}
    if status_ok then
      config['pre_hook'] = commentstring.create_pre_hook()
    end
    require('Comment').setup(config)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  keys = { { mode = 'x', 'gc' }, { mode = 'n', 'gc' } },
}

return {
  comment_nvim,
  {
    'inkarkat/vim-ReplaceWithRegister',
    lazy = true,
    keys = { { mode = 'n', 'gr' }, { mode = 'x', 'gr' }, },
  },
  { 'wellle/targets.vim' },
  { 'kana/vim-textobj-user', lazy = true },
  textobject_line,
  textobject_entire,
  {
    'Julian/vim-textobj-variable-segment',
    lazy = true,
    dependencies = 'vim-textobj-user',
    keys = { { mode = 'o', 'iv' }, { mode = 'o', 'av' }, { mode = 'x', 'iv' }, { mode = 'x', 'av' }, },
  },
  {
    'glts/vim-textobj-comment',
    lazy = true,
    dependencies = 'vim-textobj-user',
    keys = { { mode = 'o', 'ic' }, { mode = 'o', 'ac' }, { mode = 'x', 'ic' }, { mode = 'x', 'ac' }, },
  },
  {
    'https://github.com/AndrewRadev/dsf.vim',
    lazy = true,
    keys = { { mode = 'n', 'dsf' }, { mode = 'n', 'dsnf' }, { mode = 'n', 'csf' }, { mode = 'n', 'csnf' } }
  },
  {
    'tommcdo/vim-lion',
    lazy = true,
    keys = { { mode = 'n', 'gl' }, { mode = 'n', 'gL' }, },
  },
  {
    'https://github.com/ralismark/opsort.vim',
    lazy = true,
    keys = { { mode = 'n', 'gs' }, { mode = 'x', 'gs' }, },
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_nomode = "i"
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_deferred_show_delay = 400
      vim.g.matchup_matchparen_deferred_hide_delay = 400
      -- vim.g.matchup_matchparen_offscreen = {}
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }
  -- 'tommcdo/vim-exchange'
  -- {
  --   'ckolkey/ts-node-action',
  --    config = function() -- Optional
  --        require("ts-node-action").setup({})
  --        vim.keymap.set({ "n" }, "<leader>j", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
  --    end
  -- },
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
}
