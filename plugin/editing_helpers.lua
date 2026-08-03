vim.pack.add({
  "https://github.com/tpope/vim-unimpaired",
  "https://github.com/tpope/vim-repeat",
}, { load = true, confirm = false })

vim.pack.add({ "https://github.com/tpope/vim-characterize" }, { load = false, confirm = false })

local lazy = require("config.lazy")
lazy.commands("Characterize", { "vim-characterize" })

vim.keymap.set("n", "ga", function()
  lazy.load({ "vim-characterize" })
  return "<Plug>(characterize)"
end, { expr = true, remap = true })
