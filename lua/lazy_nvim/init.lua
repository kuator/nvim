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

-- use { 'nvim-lua/plenary.nvim' };
-- use(require 'plugins.vim-gutentags')
-- use(require 'plugins.tpopes')

-- use(require('plugins.darkplus-nvim'))
-- use(require 'plugins.gitsigns')

-- use(require 'plugins.nvim-telescope')
-- use(require 'plugins.mason-nvim')
-- use(require('plugins.text-objects-operators'))
-- use(require 'plugins.vim-signify')
-- use(require('plugins.nvim-treesitter-plugins'))
-- use(require 'plugins.lsp-plugins')
-- use(require 'plugins.cmp-and-friends')
-- use(require 'plugins.treesitter-unit') -- broken
-- use(require 'plugins.ui')
-- use(require 'plugins.stuffs')

require("lazy").setup("plugins")
