vim.pack.add({
  "https://github.com/lewis6991/async.nvim",
  "https://github.com/theprimeagen/refactoring.nvim",
}, { load = false, confirm = false })

require("config.lazy").commands("Refactor", { "async.nvim", "refactoring.nvim" })
