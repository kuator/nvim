vim.pack.add({ "https://github.com/gbprod/substitute.nvim" }, { load = true, confirm = false })

local substitute = require("substitute")
substitute.setup({ highlight_substituted_text = { timer = 150 } })

vim.keymap.set("n", "cr", function() substitute.operator() end, { noremap = true })
vim.keymap.set("n", "crr", function() substitute.line() end, { noremap = true })
vim.keymap.set("x", "cr", function() substitute.visual() end, { noremap = true })
