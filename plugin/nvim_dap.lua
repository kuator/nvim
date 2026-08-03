local packages = { "nvim-dap", "nvim-dap-view" }

vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },
}, { load = false, confirm = false })

require("config.lazy").commands("Dap*", packages, "config.nvim_dap")
