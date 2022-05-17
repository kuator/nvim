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
vim.cmd([[nnoremap <a-j> :m .+1<CR>==]])
vim.cmd([[nnoremap <a-k> :m .-2<CR>==]])
vim.cmd([[inoremap <a-j> <Esc>:m .+1<CR>==gi]])
vim.cmd([[inoremap <a-k> <Esc>:m .-2<CR>==gi]])
vim.cmd([[xnoremap <a-j> :m '>+1<CR>gv=gv]])
vim.cmd([[xnoremap <a-k> :m '<-2<CR>gv=gv]])

-- https://oroques.dev/notes/neovim-init/
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = true}'  -- enabled in visual mode

-- https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
cmd 'autocmd QuickFixCmdPost [^l]* cwindow'
cmd 'autocmd QuickFixCmdPost l* lwindow'

vim.api.nvim_set_keymap('n', 'csfs', ':cs f s ', {noremap=true})
vim.cmd [[set cscopequickfix=s-,c-,d-,i-,t-,e-]]

vim.cmd[[tnoremap <esc> <C-\><C-n>]]

vim.cmd[[tnoremap kj <C-\><C-n>]]

-- vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert')
-- vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber | startinsert')

vim.cmd([[command! -nargs=1 RenameTerminalBuffer :lua vim.b.term_title = <q-args> .. ' (' .. vim.fn.bufname('%') .. ')']])
-- vim.cmd([[nmap <leader>tr :RenameTerminalBuffer<space>]])
vim.api.nvim_set_keymap('n', 'rt', ':RenameTerminalBuffer<space>',{noremap=false})
