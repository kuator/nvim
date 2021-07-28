local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local api = vim.api

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  -- use 'ludovicchabant/vim-gutentags'
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'wellle/targets.vim' 
  use 'inkarkat/vim-ReplaceWithRegister' 
  use 'tpope/vim-surround' 
  use 'kana/vim-textobj-user' 
  use 'kana/vim-textobj-line'
  use 'Julian/vim-textobj-variable-segment' 
end)

--rg
if fn.executable("rg") then
    o.grepprg="rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs --ignore-file ~/.config/.ignore"
    o.grepformat='%f:%l:%c:%m,%f:%l:%m'
end

-- fdfind 
-- location list needs this to work with fdfind
o.errorformat = o.errorformat .. ',%f'

o.clipboard = 'unnamedplus'

g.mapleader = ' '

--searching
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true


o.swapfile = true
o.directory = fn.expand(fn.stdpath('data') .. '/swap//')
o.backup = true
o.backupcopy = 'yes'
o.backupdir = fn.expand(fn.stdpath('data') .. '/backup//')
o.undofile = true
o.undodir = fn.expand(fn.stdpath('data') .. '/undo//')


if fn.isdirectory(o.directory) == 0 then fn.mkdir(o.directory, 'p') end
if fn.isdirectory(o.backupdir) == 0 then fn.mkdir(o.backupdir, 'p') end
if fn.isdirectory(o.undodir) == 0 then fn.mkdir(o.undodir, 'p') end

-- interactive substitute
o.inccommand = 'split'

vim.api.nvim_set_keymap('n', '<a-c>', ':', {noremap=true})
vim.api.nvim_set_keymap('v', '<a-c>', ':', {noremap=true})
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-l>:nohls<cr>', {noremap=true, silent=true})

vim.cmd([[nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>]])
vim.cmd([[nnoremap <leader>en  :edit <c-r>=stdpath('config').'/**/*'<cr>]])
vim.api.nvim_set_keymap('n', '<leader>lg', ':silent lgrep<space>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lf', [[:silent lexpr system('fdfind --hidden --no-ignore-vcs --ignore-file ~/.config/.ignore -g "*"')<left><left><left><left>]], {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lt', ':silent ltag <space>/', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':silent cclose<bar>lclose<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', 'cd', ':lcd %:p:h<bar>pwd<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'cu', ':lcd ..<bar>pwd<cr>', {noremap=true, silent=true})

-- https://vi.stackexchange.com/a/2682
vim.cmd([[nnoremap <A-j> :m .+1<CR>==]])
vim.cmd([[nnoremap <A-k> :m .-2<CR>==]])
vim.cmd([[inoremap <A-j> <Esc>:m .+1<CR>==gi]])
vim.cmd([[inoremap <A-k> <Esc>:m .-2<CR>==gi]])
vim.cmd([[vnoremap <A-j> :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap <A-k> :m '<-2<CR>gv=gv]])


-- https://oroques.dev/notes/neovim-init/
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = true}'  -- enabled in visual mode

-- https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
cmd 'autocmd QuickFixCmdPost [^l]* cwindow'
cmd 'autocmd QuickFixCmdPost l* lwindow'

o.termguicolors = true

--vim.cmd'colorscheme default'
o.number = true
o.relativenumber = true
o.wrap = false
