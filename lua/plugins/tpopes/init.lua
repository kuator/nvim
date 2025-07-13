return {
  -- {
  --   'tpope/vim-commentary';
  -- keys = { { mode='x'; 'gc' }; { mode='n'; 'gc' } };
  -- },

  -- {
  --   'tpope/vim-surround';
  --   keys = { { mode='n'; 'ys' }; { mode='x'; 'S' }; { mode='n'; 'cs' }; { mode='n'; 'ds' }; };
  -- },

  {
    "https://github.com/kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { { mode = 'n', 'ys' }, { mode = 'x', 'S' }, { mode = 'n', 'cs' }, { mode = 'n', 'ds' }, },
    config = function()
      require("nvim-surround").setup ({
        surrounds = {
          q = { add = { '"', '"' } },
          ['.'] = { add = { '<', '>' } },
          c = {
            add = { "{", "}" },
            find = function()
              local config = require("nvim-surround.config")
              return config.get_selection({ motion = "a}" })
            end,
            delete = "^(.)().-(.)()$",
          }
        }
      })
    end
  },

  {
    'https://github.com/tpope/vim-unimpaired',
    keys = { { mode = 'n', '[p' }, { mode = 'n', ']p' }, { mode = 'n', '[l' }, { mode = 'n', ']l' }, }
  },
  {
    'https://github.com/tpope/vim-repeat',
    keys = { { mode = 'n', '.' } },
  },
  {
    'https://github.com/tpope/vim-rsi',
    event = {'InsertEnter', 'CmdLineEnter'}
  },
  {
    'https://github.com/tpope/vim-abolish',
    event = 'InsertEnter'
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
}
