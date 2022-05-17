vim.keymap.set('n', '<a-c>', ':')
vim.keymap.set('v', '<a-c>', ':')
vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<c-l>', '<c-l>:nohls<cr>', { silent=true })

vim.keymap.set('n', '<leader>ec', ":edit <c-r>=fnameescape(expand('%:p:h')).'/*'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>en', ":edit <c-r>=stdpath('config').'/**/*'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>lg', ":lgrep<space>", { expr = true, silent = true })
vim.keymap.set('n', '<leader>lf', [[:silent lexpr system('fdfind --hidden --no-ignore-vcs --ignore-file ~/.config/.ignore -g "*"')<left><left><left><left>]])
vim.keymap.set('n', '<leader>lt', 'ltag <space>/')
vim.keymap.set('n', '<leader>cc', 'cclose<bar>lclose<cr>')
vim.keymap.set('n', 'cd', ':lcd %:p:h<bar>pwd<cr>')
vim.keymap.set('n', 'cu', ':lcd ..<bar>pwd<cr>')

-- https://vi.stackexchange.com/a/2682
vim.keymap.set('n', '<a-j>', [[:m .+1<CR>==]])
vim.keymap.set('n', '<a-k>', [[:m .-2<CR>==]])
vim.keymap.set('i', '<a-j>', [[<Esc>:m .+1<CR>==gi]])
vim.keymap.set('i', '<a-k>', [[<Esc>:m .-2<CR>==gi]])
vim.keymap.set('x', '<a-j>', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('x', '<a-k>', [[:m '<-2<CR>gv=gv]])


vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'kj', [[<C-\><C-n>]])


-- cscope
vim.api.nvim_set_keymap('n', 'csfs', ':cs f s ', {noremap=true})
vim.cmd [[set cscopequickfix=s-,c-,d-,i-,t-,e-]]
