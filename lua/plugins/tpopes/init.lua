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
    "kylechui/nvim-surround",
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
    'tpope/vim-unimpaired',
    keys = { { mode = 'n', '[p' }, { mode = 'n', ']p' }, { mode = 'n', '[l' }, { mode = 'n', ']l' }, }
  },
  {
    'tpope/vim-repeat',
    keys = { { mode = 'n', '.' } },
  },
  {
    'tpope/vim-rsi',
    event = {'InsertEnter', 'CmdLineEnter'}
  },
  {
    'tpope/vim-abolish',
    event = 'InsertEnter'
  }
}
