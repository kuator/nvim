vim.pack.add({
  "https://github.com/folke/neoconf.nvim",
  "https://github.com/rafi/neoconf-venom.nvim",
}, { load = true, confirm = false })
require("venom").setup()
