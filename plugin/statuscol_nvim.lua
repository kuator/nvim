vim.pack.add({ "https://github.com/luukvbaal/statuscol.nvim" }, { load = true, confirm = false })

-- https://github.com/KirkEasterson/.dotfiles/blob/7d1a1112be3a75d0a53bbdbf64a0d889f762de0d/vim/.config/nvim/lua/kirk/plugins/ui/statuscol.lua
local builtin = require("statuscol.builtin")
require("statuscol").setup({
  setopt = true,
  relculright = true,
  bt_ignore = { "terminal" },
  ft_ignore = { "help", "mason", "netrw", "oil", "startify" },
  segments = {
    { -- diagnostics
      sign = {
        namespace = { "diagnostic" },
        maxwidth = 1,
        colwidth = 1,
        auto = false,
      },
      click = "v:lua.ScSa",
    },
    { -- testing
      sign = {
        namespace = { "neotest" },
        name = { ".*" },
        maxwidth = 1,
        colwidth = 1,
        auto = true,
      },
    },
    { -- debugging
      sign = {
        namespace = { "dap" },
        maxwidth = 1,
        colwidth = 1,
        auto = true,
      },
    },
    { -- fold
      text = { " ", builtin.foldfunc },
      click = "v:lua.ScFa",
      sign = { foldclosed = true },
    },
    { -- line numbers
      text = { builtin.lnumfunc },
      click = "v:lua.ScLa",
    },
    {                       -- git signs
      hl = "GitSigns",
      sign = {
        namespace = { "gitsigns" },
        colwidth = 1,
        wrap = true,
      },
      click = "v:lua.ScSa",
    },
  },
})
