-- rg
if vim.fn.executable("rg") then
  vim.opt.grepprg = "rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
  vim.opt.grepformat = {
    '%f:%l:%c:%m', '%f:%l:%m'
  }
end

local options = {
  clipboard      = "unnamedplus",
  updatetime     = 100,
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
  -- when 'sts' is negative, the value of 'shiftwidth' is used.,
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
  -- winbar         = [[%m %f]],
  mouse          = 'nvi',
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

local globals = {
  -- disable_distribution_plugins
  loaded_gzip              = 1,
  loaded_tar               = 1,
  loaded_tarPlugin         = 1,
  loaded_zip               = 1,
  loaded_zipPlugin         = 1,
  loaded_getscript         = 1,
  loaded_getscriptPlugin   = 1,
  loaded_vimball           = 1,
  loaded_vimballPlugin     = 1,
  loaded_matchit           = 0,
  loaded_matchparen        = 1,
  loaded_2html_plugin      = 1,
  loaded_logiPat           = 1,
  loaded_rrhelper          = 1,
  -- loaded_netrw             = 1,
  -- loaded_netrwPlugin       = 1,
  -- loaded_netrwSettings     = 1,
  -- loaded_netrwFileHandlers = 1,
  mapleader                = ' ',
  netrw_liststyle                = 3
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- create backup folders
local folders = { directory = 'swap', backupdir = 'backup', undodir = 'undo' }
for option, folder in pairs(folders) do
  local path = vim.fn.expand(vim.fn.stdpath('data') .. '/' .. folder .. '//')
  vim.o[option] = path
  if not vim.loop.fs_stat(path) then vim.loop.fs_mkdir(path, 493) end
end

-- fdfind
-- location list needs this to work with fdfind
-- vim.opt.errorformat doens't work
vim.opt.errorformat = vim.o.errorformat .. ',%f'

vim.cmd('filetype plugin on')

vim.opt.shortmess:append('c')
