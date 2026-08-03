local opts = { noremap = true }

vim.keymap.set("n", "dsf", "<Plug>DsfDelete", opts)
vim.keymap.set("n", "csf", "<Plug>DsfChange", opts)
vim.keymap.set("n", "dsnf", "<Plug>DsfNextDelete", opts)
vim.keymap.set("n", "csnf", "<Plug>DsfNextChange", opts)

local indent_obj = require("treesitter_indent_object.textobj")

vim.keymap.set({ "x", "o" }, "ai", indent_obj.select_indent_outer, { desc = "Select context-aware indent (outer)" })
vim.keymap.set({ "x", "o" }, "aI", function()
  indent_obj.select_indent_outer(true)
end, { desc = "Select context-aware indent (outer, line-wise)" })
vim.keymap.set({ "x", "o" }, "ii", indent_obj.select_indent_inner, { desc = "Select context-aware indent (inner, partial range)" })
vim.keymap.set({ "x", "o" }, "iI", function()
  indent_obj.select_indent_inner(true, "V")
end, { desc = "Select context-aware indent (inner, entire range)" })

require("ts-comments").setup()
