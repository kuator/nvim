vim.pack.add({ "https://github.com/chentoast/marks.nvim" }, { load = true, confirm = false })
require('marks').setup({
  refresh_interval = 1000,
  sign_priority = 5,

})
