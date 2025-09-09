vim.pack.add({ "http://github.com/chrisgrieser/nvim-origami" }, { load = true, confirm = false })
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
require("origami").setup()
