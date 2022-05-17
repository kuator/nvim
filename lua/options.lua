local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api
local uv = vim.loop

local disable_distribution_plugins = function()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

disable_distribution_plugins()

-- rg
if fn.executable("rg") then
  o.grepprg="rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
  o.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

-- fdfind 
-- location list needs this to work with fdfind
o.errorformat = o.errorformat .. ',%f'

o.termguicolors = true

o.clipboard = 'unnamedplus'
o.updatetime=100

g.mapleader = ' '

--searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true


o.swapfile = true
o.backup = true
o.backupcopy = 'yes'
o.undofile = true

folders = { directory = 'swap', backupdir = 'backup', undodir= 'undo'}
for option, folder in pairs(folders) do
  local path = fn.expand(fn.stdpath('data') .. '/' .. folder .. '//')
  o[option] = path
  if not uv.fs_stat(path) then uv.fs_mkdir(path, 493) end
end


-- interactive substitute
o.inccommand = 'split'

-- hidden buffers
o.hidden = true

o.termguicolors = true
o.number = true
o.relativenumber = true
o.wrap = false

o.expandtab = true
bo.expandtab = true
o.shiftwidth = 2
bo.shiftwidth = 2
-- when 'sts' is negative, the value of 'shiftwidth' is used.
o.softtabstop = -1
bo.softtabstop = -1
o.autoindent = true
bo.autoindent = true

o.splitbelow = true
o.splitright = true
o.signcolumn = 'yes'

vim.cmd('filetype plugin on')
