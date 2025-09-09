vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/oil.nvim",
}, { load = true, confirm = false })

require("oil").setup({
  default_file_explorer = false,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
