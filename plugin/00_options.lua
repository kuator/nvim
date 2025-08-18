-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Search behavior
vim.o.updatetime    = 300
vim.o.incsearch     = true
vim.o.hlsearch      = true
vim.o.ignorecase    = true
vim.o.smartcase     = true

-- File handling and backups
vim.o.swapfile      = true
vim.o.backup        = true
vim.o.backupcopy    = 'yes'
vim.o.undofile      = true

-- Undo, backup, and swap directories
-- @type string 
local state_dir = vim.fn.stdpath("state")
vim.o.directory     = vim.fs.joinpath(state_dir, "swap") .. '//'
vim.o.backupdir     = vim.fs.joinpath(state_dir, "backup") .. '//'
vim.o.undodir       = vim.fs.joinpath(state_dir, "undo") .. '//'

-- UI settings
vim.o.termguicolors  = true
vim.o.number         = true
vim.o.relativenumber = true
vim.o.wrap           = false
vim.o.signcolumn     = "yes"
vim.o.scrolloff      = 5
vim.o.sidescrolloff  = 5
vim.o.laststatus     = 3
vim.o.title          = true
vim.o.titlestring    = 'VS⠀Code'  -- Note: The space after VS might be a special char

-- Editing behavior
vim.o.expandtab      = true
vim.o.shiftwidth     = 2
vim.o.softtabstop    = -1 -- when 'sts' is negative, shiftwidth value is used
vim.o.autoindent     = true

-- Splits behavior
vim.o.splitbelow     = true
vim.o.splitright     = true

-- Command-line completion and messaging
vim.o.completeopt    = 'menuone,noselect'
vim.o.wildignorecase = true
vim.o.wildoptions    = 'pum'
vim.o.shortmess      = vim.o.shortmess .. 'c'

-- Incremental command preview
vim.o.inccommand     = 'split'

-- Mouse support
vim.o.mouse          = 'nvi'

-- Error format
vim.o.errorformat    = vim.o.errorformat .. ',%f'

-- Shada (shared data) options
vim.o.shada          = "'100"

-- Leader key
vim.g.mapleader      = ' '

vim.o.winborder = "rounded"

-- External UI enable (plugin)
require('vim._extui').enable({})
