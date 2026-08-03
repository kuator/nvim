vim.pack.add({ "https://github.com/stevearc/overseer.nvim" }, { load = false, confirm = false })

require("config.lazy").commands("Overseer*", { "overseer.nvim" }, "config.overseer")
