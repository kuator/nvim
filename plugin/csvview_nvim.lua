local packages = { "csvview.nvim" }

vim.pack.add({ "https://github.com/hat0uma/csvview.nvim" }, { load = false, confirm = false })
require("config.lazy").commands("CsvView*", packages, "config.csvview")
