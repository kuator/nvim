local packages = {
  "nvim-nio",
  "FixCursorHold.nvim",
  "neotest",
  "neotest-python",
}

vim.pack.add({
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/neotest-python",
}, { load = false, confirm = false })

require("config.lazy").commands("Neotest", packages, "config.neotest")
