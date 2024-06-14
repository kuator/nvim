return {
  -- 'sindrets/diffview.nvim',
  -- require('plugins.neo_tree'),
  {
    'https://github.com/f-person/git-blame.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()

      require('gitblame').setup {
           --Note how the `gitblame_` prefix is omitted in `setup`
          enabled = true,
      }

    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
    cond = not vim.g.vscode,
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen'
  }
  -- {
  --   "luukvbaal/statuscol.nvim",
  --   config = function()
  --     -- local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       -- configuration goes here, for example:
  --       -- relculright = true,
  --       -- segments = {
  --       --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --       --   {
  --       --     sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --       --   {
  --       --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       -- }
  --     })
  --   end,
  --   event = { "BufReadPre", "BufNewFile" },
  -- },

  -- {
  --   "braxtons12/blame_line.nvim",
  --   config = function()
  --     require("blame_line").setup {
  --     }
  --   end
  -- }

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  -- https://github.com/stevearc/aerial.nvim
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
}
