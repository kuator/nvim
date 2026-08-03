local lazy = require("config.lazy")
local packages = { "treesj" }

vim.pack.add({ "https://github.com/Wansmer/treesj" }, { load = false, confirm = false })

lazy.commands("TSJ*", packages, "config.treesj")
vim.keymap.set("n", "<leader>j", function()
  lazy.load(packages, "config.treesj")
  vim.cmd.TSJToggle()
end)
