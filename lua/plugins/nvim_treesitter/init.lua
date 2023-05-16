local modules = {
  textobjects = "nvim-treesitter/nvim-treesitter-textobjects",

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

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
  },
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
    end
  },
  unpack(dependencies)
}
