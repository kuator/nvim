vim.pack.add({ "https://github.com/j-hui/fidget.nvim" }, { load = false, confirm = false })

local packages = { "fidget.nvim" }
local lazy = require("config.lazy")

lazy.commands("Fidget*", packages, "config.fidget")
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Load Fidget",
  once = true,
  callback = function()
    lazy.load(packages, "config.fidget")
  end,
})
