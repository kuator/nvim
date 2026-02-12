vim.pack.add({ "https://github.com/kuator/treesitter-unit" }, { load = true, confirm = false })
local treesitter_unit = require("treesitter-unit")
treesitter_unit.enable_highlighting("CursorLine")

vim.keymap.set("x", "iu", function()
  treesitter_unit.select()
end, { noremap = true })

vim.keymap.set("x", "au", function()
  treesitter_unit.select(true)
end, { noremap = true })

vim.keymap.set("o", "iu", function()
  treesitter_unit.select()
end, { noremap = true })

vim.keymap.set("o", "au", function()
  treesitter_unit.select(true)
end, { noremap = true })
