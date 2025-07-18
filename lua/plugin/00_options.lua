-- rg
if vim.fn.executable("rg") then
  vim.o.grepprg = 'rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore'
  vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end

local options = {
  clipboard      = "unnamedplus",
  updatetime     = 300,
  incsearch      = true,
  hlsearch       = true,
  ignorecase     = true,
  smartcase      = true,
  swapfile       = true,
  backup         = true,
  backupcopy     = 'yes',
  undofile       = true,
  inccommand     = 'split',
  hidden         = true,
  termguicolors  = true,
  number         = true,
  relativenumber = true,
  wrap           = false,
  shada          = "'100",
  expandtab      = true,
  shiftwidth     = 2,
  -- when 'sts' is negative, the value of 'shiftwidth' is used.
  softtabstop    = -1,
  autoindent     = true,
  splitbelow     = true,
  splitright     = true,
  signcolumn     = "yes",
  completeopt    = 'menuone,noselect',
  laststatus     = 3,
  scrolloff      = 5,
  sidescrolloff  = 5,
  wildignorecase = true,
  wildoptions    = 'pum',
  title          = true,
  titlestring    = 'VS⠀Code',
  mouse          = 'nvi',
  errorformat    = vim.o.errorformat .. ',%f',
  shortmess      = vim.o.shortmess .. 'c'
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

local globals = {
  -- disable_distribution_plugins
  loaded_gzip            = 1,
  loaded_tar             = 1,
  loaded_tarPlugin       = 1,
  loaded_zip             = 1,
  loaded_zipPlugin       = 1,
  loaded_getscript       = 1,
  loaded_getscriptPlugin = 1,
  loaded_vimball         = 1,
  loaded_vimballPlugin   = 1,
  loaded_matchit         = 0,
  loaded_matchparen      = 1,
  loaded_2html_plugin    = 1,
  loaded_logiPat         = 1,
  loaded_rrhelper        = 1,
  mapleader              = ' ',
  netrw_banner           = 0,   -- Hide the netrw banner on top
  netrw_altv             = 1,   -- Create the split of the netrw window to the left
  netrw_browse_split     = 4,   -- Open files in previous window. This emulates the typical "drawer" behavior
  netrw_liststyle        = 3,   -- Set the styling of the file list to be that of a tree
  netrw_winsize          = 14,  -- Set the width of the "drawer"
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- create backup folders
local folders = { directory = 'swap', backupdir = 'backup', undodir = 'undo' }
for option, folder in pairs(folders) do
  local path = vim.fs.joinpath(vim.fn.stdpath('data') , folder) .. '//'
  vim.o[option] = path
  if not vim.uv.fs_stat(path) then vim.uv.fs_mkdir(path, 493) end
end

vim.cmd('filetype plugin on')

require('vim._extui').enable({})
