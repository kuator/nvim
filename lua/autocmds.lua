-- Highlight on yank
-- https://oroques.dev/notes/neovim-init/
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'cwindow',
  pattern = '[^l]*',
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'lwindow',
  pattern = 'l*',
})

vim.api.nvim_create_autocmd('FileType', {
  -- command = 'set fo-=c fo-=r fo-=o',
  callback = function ()
    vim.opt.formatoptions:remove('c')
    vim.opt.formatoptions:remove('r')
    vim.opt.formatoptions:remove('o')
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd('TermOpen', {
  command = 'setlocal nonumber norelativenumber | setlocal signcolumn=no ',
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'set bufhidden=delete',
  pattern = 'gitcommit,gitrebase,gitconfig',
})


vim.api.nvim_create_autocmd('CmdwinEnter', {
  command = 'nnoremap <buffer> <c-g> <c-w>q',
  pattern = '*',
})

local lspattach = vim.api.nvim_create_augroup("LspAttach", { clear = true })
local on_attach = require('plugins.lsp-plugins.lsp.handlers').on_attach


vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = lspattach,
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        on_attach(client, bufnr)
    end
})
