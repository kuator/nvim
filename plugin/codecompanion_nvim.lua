local packages = { "plenary.nvim", "codecompanion.nvim" }

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/olimorris/codecompanion.nvim",
}, { load = false, confirm = false })

require("config.lazy").commands("CodeCompanion*", packages, "config.codecompanion")

vim.keymap.set({ "n", "x" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", {
  desc = "CodeCompanion actions",
})
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", {
  desc = "Toggle CodeCompanion chat",
})
vim.keymap.set("x", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", {
  desc = "Add selection to CodeCompanion chat",
})
