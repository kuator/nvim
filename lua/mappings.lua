-- https://github.com/romainl/the-patient-vimmer/blob/gh-pages/3.adoc#introduction
vim.api.nvim_set_keymap('n', '<a-c>', ':', {noremap=true})
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-l>:nohls<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gb', ':ls<cr>:b<space>', {noremap=true})
vim.cmd([[nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>]])
vim.cmd([[nnoremap <leader>en  :edit <c-r>=stdpath('config').'/**'<cr>]])
-- nnoremap <leader>ef :find *

-- grep
vim.api.nvim_set_keymap('n', '<leader>lg', ':silent lgrep<space>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lf', [[:silent lexpr system('fdfind -g "*"')<left><left><left><left>]], {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>lt', ':silent ltag <space>/', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>cc', ':silent cclose<bar>lclose<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<c-c><c-c>', ':q!', {noremap=true})

-- set working directory to the current buffer's directory
vim.api.nvim_set_keymap('n', 'cd', ':lcd %:p:h<bar>pwd<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'cu', ':lcd ..<bar>pwd<cr>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('c', '<a-p>', '<up>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('c', '<a-n>', '<down>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 's', '<nop>', {})
vim.api.nvim_set_keymap('n', 'sf', 'z', {noremap=true, silent=true})

-- vim.api.nvim_set_keymap('n', '<A-j>' [[:m .+1<CR>==]], {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('n', '<A-k>' ":m .-2<CR>==", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('i', '<A-j>' "<Esc>:m .+1<CR>==gi", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('i', '<A-k>' "<Esc>:m .-2<CR>==gi", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('v', '<A-j>' ":m '>+1<CR>gv=gv", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap('v', '<A-k>' ":m '<-2<CR>gv=gv", {noremap=true, silent=true})

vim.cmd([[nnoremap <A-j> :m .+1<CR>==]])
vim.cmd([[nnoremap <A-k> :m .-2<CR>==]])
vim.cmd([[inoremap <A-j> <Esc>:m .+1<CR>==gi]])
vim.cmd([[inoremap <A-k> <Esc>:m .-2<CR>==gi]])
vim.cmd([[vnoremap <A-j> :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap <A-k> :m '<-2<CR>gv=gv]])

vim.cmd('inoreabbr lam =>')
vim.cmd('inoreabbr far =>')
vim.cmd('inoreabbr tar ->')
vim.cmd('inoreabbr ex !')
vim.cmd('inoreabbr pl +')
vim.cmd('cnoreabbr lam =>')
vim.cmd('cnoreabbr far =>')
vim.cmd('cnoreabbr tar ->')
