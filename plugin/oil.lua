vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/oil.nvim",
}, { load = false, confirm = false })

local packages = { "nvim-web-devicons", "oil.nvim" }
local lazy = require("config.lazy")

lazy.commands("Oil", packages, "config.oil")
vim.keymap.set("n", "-", function()
  lazy.load(packages, "config.oil")
  vim.cmd("Oil")
end, { desc = "Open parent directory" })
