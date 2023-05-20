local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- TODO: https://github.com/renerocksai/telekasten.nvim
-- TODO: https://github.com/mfussenegger/nvim-dap/pulls
-- TODO: https://github.com/nvim-neotest/neotest
-- TODO: https://github.com/stevearc/overseer.nvim
-- TODO: winbar
-- TODO: https://github.com/ray-x/go.nvim
-- TODO: neo-tree.lua

require("lazy").setup("plugins")
