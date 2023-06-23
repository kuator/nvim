local modules = {
  textobjects = {"nvim-treesitter/nvim-treesitter-textobjects"},
  context_commentstring = {"JoosepAlviste/nvim-ts-context-commentstring"},
  rainbow = {"HiPhish/nvim-ts-rainbow2"},
  -- refactor = "nvim-treesitter/nvim-treesitter-refactor",

  -- matchup = {
  --   "andymass/vim-matchup" ,
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  --   end
  -- },

  -- node_movement = 'theHamsta/crazy-node-movement'
}

local configs = {
  textobjects = {
    select = {
      enable = true,

      include_surrounding_whitespace = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        -- ["ac"] = "@conditional.outer",
        -- ["ic"] = "@conditional.inner",
        -- ["al"] = "@loop.outer",
        -- ["il"] = "@loop.inner",
        -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<alt-l>"] = "@parameter.inner",
      },
      swap_previous = {
        ["<alt-h>"] = "@parameter.inner",
      },
  },
  },
  context_commentstring = {
    enable = true
  },
  rainbow = {
    enable = true
  }
  -- refactor = {
  --   highlight_current_scope = { enable = false },
  --   highlight_definitions = {
  --     enable = true,
  --     -- Set to false if you have an `updatetime` of ~100.
  --     clear_on_cursor_move = true,
  --   },
  -- },
}

local dependencies = {}

for _, v in pairs(modules) do
  table.insert(dependencies, v)
end

local config = {
  ensure_installed = { "python", "lua", "bash", "cpp"},
  highlight = { enable = true },
}

for i, _ in pairs(modules) do
  config[i] = configs[i]
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require'nvim-treesitter.configs'.setup(config)
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies
  },
}
