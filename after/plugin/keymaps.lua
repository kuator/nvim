vim.g.mapleader = ' '
-- vim.keymap.set('n', 'q;', 'q:')
vim.keymap.set('n', '<a-c>', ':')
vim.keymap.set('v', '<a-c>', ':')
vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<c-l>', '<c-l>:nohls<cr>', { silent = true })

vim.cmd([[nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>]])
vim.cmd([[nnoremap <leader>en  :edit <c-r>=stdpath('config').'/**/*'<cr>]])

vim.keymap.set('n', '<leader>lg', ':silent lgrep<space>')
vim.keymap.set('n', '<leader>lf', [[:lexpr system('fdfind --hidden --no-ignore-vcs --ignore-file ~/.config/.ignore -g "*"')<left><left><left><left>]])
vim.keymap.set('n', '<leader>lt', ':ltag <space>/')
vim.keymap.set('n', '<leader>cc', ':cclose<bar>lclose<cr>', { silent = true })
vim.keymap.set('n', 'cd', ':silent lcd %:p:h<bar>pwd<cr>', { silent = true })
vim.keymap.set('n', 'cu', ':silent lcd ..<bar>pwd<cr>', { silent = true })

vim.keymap.set('n', '<c-t>t', ':silent tabnew <cr>', { silent = true })
-- vim.keymap.set('n', '<c-t><c-t>', ':vsplit | term <cr>', { silent = true })
vim.keymap.set('n', '<c-t>v', ':vsplit | term <cr>', { silent = true })
vim.keymap.set('n', '<c-t>s', ':split | term <cr>', { silent = true })
vim.keymap.set('n', '<c-t>q', ':tabclose <cr>', { silent = true })
vim.keymap.set('n', '<c-t>w', ':tabclose <cr>', { silent = true })
vim.keymap.set('n', '<leader>gg', ':qa<cr>')

vim.keymap.set("n", "<c-w><c-t>", function()
    local window = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_get_current_buf()
    local tab = vim.api.nvim_get_current_tabpage()
    local tabnumber = vim.api.nvim_tabpage_get_number(tab)
    local windows = vim.api.nvim_tabpage_list_wins(tab)
    local vnew = ''
    if #windows > 1 then
      vnew = ''
    else
      vnew = 'vnew'
    end
    print(vim.inspect(windows))
    print(window)
    print(vnew)
    local command = ":" .. "<c-u>" .. vim.v.count .. 'tabnext | vert sbuffer' .. bufnr .. ' | ' .. tab .. "tabnext | silent " .. vnew .. " | lua vim.api.nvim_win_close(" .. window .. ", true)<cr>"
    return command
end, { expr = true })

vim.keymap.set("n", "<c-w>q", function()
    local window = vim.api.nvim_get_current_win()
    local tab = vim.api.nvim_get_current_tabpage()
    local windows = vim.api.nvim_tabpage_list_wins(tab)
    if #windows > 1 then
      vim.api.nvim_win_close(window, true)
    else
      vim.api.nvim_command('vnew')
      vim.api.nvim_win_close(window, true)
    end
end)


vim.keymap.set('n', '<c-t>1', '1gt', { silent = true })
vim.keymap.set('n', '<c-t>2', '2gt', { silent = true })
vim.keymap.set('n', '<c-t>3', '3gt', { silent = true })
vim.keymap.set('n', '<c-t>4', '4gt', { silent = true })

-- https://vi.stackexchange.com/a/2682
vim.keymap.set('n', '<a-j>', [[:m .+1<CR>==]])
vim.keymap.set('n', '<a-k>', [[:m .-2<CR>==]])
vim.keymap.set('i', '<a-j>', [[<Esc>:m .+1<CR>==gi]])
vim.keymap.set('i', '<a-k>', [[<Esc>:m .-2<CR>==gi]])
vim.keymap.set('x', '<a-j>', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('x', '<a-k>', [[:m '<-2<CR>gv=gv]])

vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<c-q>', [[<C-\><C-n>]])
-- vim.keymap.set('t', 'kj', [[<C-\><C-n>]])

-- vim.cmd[[tnoremap <a-h> <C-\><C-n><C-w>h]]
-- vim.cmd[[tnoremap <a-j> <C-\><C-n><C-w>j]]
-- vim.cmd[[tnoremap <a-k> <C-\><C-n><C-w>k]]
-- vim.cmd[[tnoremap <a-l> <C-\><C-n><C-w>l]]

-- vim.cmd[[nnoremap <a-h> <C-\><C-n><C-w>h]]
-- vim.cmd[[nnoremap <a-j> <C-\><C-n><C-w>j]]
-- vim.cmd[[nnoremap <a-k> <C-\><C-n><C-w>k]]
-- vim.cmd[[nnoremap <a-l> <C-\><C-n><C-w>l]]

-- cscope
-- vim.keymap.set('n', 'scs', ':cs f s ')

-- vim.opt.cscopequickfix = { "s-", "c-", "d-", "i-", "t-", "e-" }

vim.keymap.set('n', 's', '<nop>')

vim.keymap.set('s', '<c-h>', '<c-h>i')

vim.keymap.set('c', '<c-s>', '<c-a>')

-- vim.cmd.abb('ar', '->')

vim.keymap.set('n', 'gu', 'g~')
vim.keymap.set('v', 'gu', 'g~')

