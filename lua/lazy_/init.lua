local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
-- TODO: https://github.com/ray-x/go.nvim
-- TODO: neo-tree.lua
-- TODO: glts/vim-textobj-comment
-- TODO: onsails/lspkind.nvim
-- TODO: https://github.com/luukvbaal/statuscol.nvim
-- TODO: https://github.com/kevinhwang91/nvim-ufo
-- TODO: https://github.com/mrcjkb/rustaceanvim
-- TODO: https://github.com/LintaoAmons/scratch.nvim
-- TODO: https://github.com/kndndrj/nvim-dbee
-- TODO: https://github.com/aaronik/treewalker.nvim
-- TODO: https://github.com/igorlfs/nvim-dap-view

require("lazy").setup(
  "plugins", {
    change_detection = {
        enabled = false,
        notify = false, -- get a notification when changes are found
    }
  }
)
