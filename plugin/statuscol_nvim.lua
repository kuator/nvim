vim.pack.add({ "https://github.com/luukvbaal/statuscol.nvim" }, { load = true, confirm = false })

-- local builtin = require("statuscol.builtin")
-- require("statuscol").setup({
--   -- configuration goes here, for example:
--   relculright = true,
--   bt_ignore = { 'terminal' },
--   ft_ignore = { 'oil' },
--   segments = {
--     { sign = { namespace = { "diagnostic*" } } },
--     { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
--     { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
--     { sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true }, click = "v:lua.ScSa" },
--   }
-- })

-- https://github.com/KirkEasterson/.dotfiles/blob/7d1a1112be3a75d0a53bbdbf64a0d889f762de0d/vim/.config/nvim/lua/kirk/plugins/ui/statuscol.lua
local builtin = require("statuscol.builtin")
require("statuscol").setup({
  setopt = true,
  relculright = true,
  bt_ignore = { "terminal" },
  ft_ignore = {
    "NeogitStatus",
    "NvimTree",
    "alpha",
    "dashboard",
    "help",
    "lazy",
    "mason",
    "null-ls-info",
    "packer",
    "scratch",
    "startify",
    "term",
    "terminal",
    "toggleterm",
    "trouble",
  },
  segments = {
    { -- marks
      sign = {
        namespace = { "MarkSigns" },
        name = { ".*" },
        maxwidth = 2,
        colwidth = 1,
        auto = true,
      },
    },
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
