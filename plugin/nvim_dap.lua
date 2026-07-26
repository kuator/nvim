vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
}, { load = true, confirm = false })

require("dap-view").setup({})
