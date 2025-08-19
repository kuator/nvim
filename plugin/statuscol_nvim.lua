vim.pack.add({ "https://github.com/luukvbaal/statuscol.nvim" }, { load = true })
-- require("statuscol").setup({})
local builtin = require("statuscol.builtin")
require("statuscol").setup({
  -- configuration goes here, for example:
  relculright = true,
  bt_ignore = { 'terminal' },
  ft_ignore = { 'oil' },
  segments = {
    { sign = { namespace = { "diagnostic*" } } },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    { sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true }, click = "v:lua.ScSa" },
  }
})
