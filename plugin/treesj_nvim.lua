vim.pack.add({ "https://github.com/Wansmer/treesj" }, { load = true, confirm = false})

require("treesj").setup({
  use_default_keymaps = false,
})
vim.keymap.set("n", "<leader>j", "<cmd>TSJToggle<cr>")
