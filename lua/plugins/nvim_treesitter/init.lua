local modules = {
  textobjects = { "nvim-treesitter/nvim-treesitter-textobjects" },
  autotag = { "windwp/nvim-ts-autotag" },

  -- textsubjects = { "RRethy/nvim-treesitter-textsubjects" },

  -- rainbow = {"HiPhish/nvim-ts-rainbow2"},

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
  textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
      },
  },
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
        ["<a-l>"] = { query = {  "@parameter.inner", '@statement.outer', "@function.outer", } },
      },
      swap_previous = {
        ["<a-h>"] = { query = {  "@parameter.inner", '@statement.outer', "@function.outer",} },
      },
    },
  },
  -- context_commentstring = {
  --   enable = true
  -- },
  rainbow = {
    enable = true
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,
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

local context_commentstring = {
  "JoosepAlviste/nvim-ts-context-commentstring",
  config = function()
    vim.g.skip_ts_context_commentstring_module = true
  end
}

local treesitter_context = {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    -- require('treesitter-context').setup()

    -- vim.keymap.set("n", "[c", function()
    --   require("treesitter-context").go_to_context()
    -- end, { silent = true })

  end
}


local rainbow_delimiters = {
  "hiphish/rainbow-delimiters.nvim",
  config = function()
  end
}

local neogen = {
  "danymat/neogen",
  config = function()
    require('neogen').setup({ snippet_engine = "luasnip" })
  end
}

table.insert(dependencies, context_commentstring)
table.insert(dependencies, treesitter_context)
table.insert(dependencies, rainbow_delimiters)
table.insert(dependencies, neogen)

for _, v in pairs(modules) do
  table.insert(dependencies, v)
end

local config = {
  ensure_installed = { "python", "lua", "bash", "cpp" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

for i, _ in pairs(modules) do
  config[i] = configs[i]
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'nvim-treesitter.configs'.setup(config)
    end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies
  },
}
