vim.pack.add({ "https://github.com/sindrets/diffview.nvim" }, { load = false, confirm = false })

require("config.lazy").commands("Diffview*", { "diffview.nvim" })
