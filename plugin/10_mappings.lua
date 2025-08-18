-- clear highlights
----------------------------------
-- vim.keymap.set("n", "<C-l>", function()
--   vim.cmd("nohlsearch")       -- clear search highlight
--   vim.cmd("redraw")           -- same as <C-l> in normal mode
--   vim.cmd("echo ''")
-- end, { desc = "Redraw screen and clear search highlight", silent = true })

-- list files in the current directory
vim.cmd([[nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>]])
-- list files in the neovim config
vim.cmd([[nnoremap <leader>en  :edit <c-r>=stdpath('config').'/**/*'<cr>]])

-- use fdfind with grep
vim.keymap.set('n', '<leader>lf', [[:lexpr system('fdfind --hidden --no-ignore-vcs --ignore-file $XDG_CONFIG_HOME.ignore -g "*"')<left><left><left><left>]])

-- https://vi.stackexchange.com/a/2682
vim.keymap.set('n', '<a-j>', [[:m .+1<CR>==]])
vim.keymap.set('n', '<a-k>', [[:m .-2<CR>==]])
vim.keymap.set('i', '<a-j>', [[<Esc>:m .+1<CR>==gi]])
vim.keymap.set('i', '<a-k>', [[<Esc>:m .-2<CR>==gi]])
vim.keymap.set('x', '<a-j>', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('x', '<a-k>', [[:m '<-2<CR>gv=gv]])

-- change cwd
vim.keymap.set('n', 'cd', ':lcd %:p:h<bar>pwd<cr>', { silent = true })
vim.keymap.set('n', 'cu', ':lcd ..<bar>pwd<cr>', { silent = true })

-- exit terminal
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<c-q>', [[<C-\><C-n>]])

-- disable s
vim.keymap.set('n', 's', '<nop>')

-- remove snippet placeholder
vim.keymap.set('s', '<c-h>', '<c-h>i')

-- ctags
vim.keymap.set('n', '<leader>lt', ':ltag <space>/')

vim.keymap.set('n', '<a-c>', ':')
vim.keymap.set('v', '<a-c>', ':')

vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<leader>gg', ':qa<cr>')

-- close quickfix and loclist
vim.keymap.set('n', '<leader>cc', function()
  vim.cmd('cclose')
  vim.cmd('lclose')
end, { desc = 'Close quickfix and location list', silent = true })
