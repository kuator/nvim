vim.pack.add({
  "https://github.com/zk-org/zk-nvim",
}, { load = true, confirm = false })

require("zk").setup({picker = "telescope",})
