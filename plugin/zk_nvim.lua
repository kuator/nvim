local packages = {
  "zk-nvim",
}

vim.pack.add({ "https://github.com/zk-org/zk-nvim" }, { load = false, confirm = false })

local lazy = require("config.lazy")
lazy.commands("Zk*", packages, "config.zk")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  once = true,
  callback = function()
    lazy.load(packages, "config.zk")
  end,
})
