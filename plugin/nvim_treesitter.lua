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

      lookahead = true,

      include_surrounding_whitespace = false,

      keymaps = {
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
      swap_previous = {
        ["<a-h>"] = { query = { "@parameter.inner", "@statement.outer", "@function.outer" } },
      },
      swap_next = {
        ["<a-l>"] = { query = { "@parameter.inner", "@statement.outer", "@function.outer" } },
      },
    },
  },
}


local treesitter_context = { "http://github.com/nvim-treesitter/nvim-treesitter-context" }
local textobjects = { "http://github.com/nvim-treesitter/nvim-treesitter-textobjects" }
local rainbow_delimiters = { "http://github.com/hiphish/rainbow-delimiters.nvim" }
local autotag = { "http://github.com/windwp/nvim-ts-autotag" }
local neogen = { "http://github.com/danymat/neogen" }



vim.pack.add({ "http://github.com/nvim-treesitter/nvim-treesitter" }, { load = true })
vim.pack.add(treesitter_context, { load = true })
vim.pack.add(textobjects, { load = true })
vim.pack.add(rainbow_delimiters, { load = true })
vim.pack.add(autotag, { load = true })
vim.pack.add(neogen, { load = true })



vim.g.matchup_surround_enabled = 1
vim.g.matchup_matchparen_nomode = "i"
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 400
vim.g.matchup_matchparen_deferred_hide_delay = 400
vim.g.matchup_matchparen_offscreen = { method = "popup" }
vim.pack.add({ "https://github.com/andymass/vim-matchup" }, { load = true})


require("nvim-treesitter.configs").setup(config)
require("neogen").setup({ snippet_engine = "luasnip" })
require('match-up').setup({})


vim.pack.add({ 'https://github.com/David-Kunz/treesitter-unit' }, { load = true })

local treesitter_unit = require("treesitter-unit")


vim.keymap.set('x', 'iu', function()
  treesitter_unit.select()
end, { noremap = true })

vim.keymap.set('x', 'au', function()
  treesitter_unit.select(true)
end, { noremap = true })

vim.keymap.set('o', 'iu', function()
  treesitter_unit.select()
end, { noremap = true })

vim.keymap.set('o', 'au', function()
  treesitter_unit.select(true)
end, { noremap = true })
require "treesitter-unit".enable_highlighting('CursorLine')
