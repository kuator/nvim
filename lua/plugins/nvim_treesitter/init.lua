local config = {
  ensure_installed = { "python", "lua", "bash", "cpp" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      include_surrounding_whitespace = false,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
        ['is'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V",  -- linewise
        ["@class.outer"] = "V", -- blockwise
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<a-l>"] = { query = { "@parameter.inner", "@statement.outer", "@function.outer" } },
      },
      swap_previous = {
        ["<a-h>"] = { query = { "@parameter.inner", "@statement.outer", "@function.outer" } },
      },
    },
  },
}


local matchup = {
    "andymass/vim-matchup" ,
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
    disable = {'html'}
}


local treesitter_context = { "nvim-treesitter/nvim-treesitter-context" }
local textobjects = { "nvim-treesitter/nvim-treesitter-textobjects" }
local rainbow_delimiters = { "hiphish/rainbow-delimiters.nvim" }
local autotag = { "windwp/nvim-ts-autotag" }

local neogen = {
  "danymat/neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
  end,
}


local dependencies = {
  rainbow_delimiters,
  neogen,
  autotag,
  matchup,
  textobjects,
  treesitter_context,
}



return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("nvim-treesitter.configs").setup(config) end,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = dependencies,
  },
}
