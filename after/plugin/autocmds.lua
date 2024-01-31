vim.cmd('autocmd! nvim_terminal TermClose')

vim.api.nvim_create_autocmd('TermClose',{callback=function()
  local bufnr = vim.api.nvim_get_current_buf()
  local window = vim.api.nvim_get_current_win()
  local tab = vim.api.nvim_get_current_tabpage()
  local windows = vim.api.nvim_tabpage_list_wins(tab)
  if #windows > 1 then
    vim.api.nvim_win_close(window, true)
  else
    vim.api.nvim_command('vnew')
    vim.api.nvim_win_close(window, true)
  end
  vim.api.nvim_buf_delete(bufnr,{})
end})

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

vim.api.nvim_create_autocmd('FileType', {
  command = 'nnoremap <esc> <c-w>q',
  pattern = 'lazy,neotest-summary',
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'nnoremap q <c-w>q',
  pattern = 'lazy,neotest-summary',
})

local lspattach = vim.api.nvim_create_augroup("LspAttach", { clear = true })

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = lspattach,
    callback = function(args)
        local on_attach = require('utils').on_attach
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- client.server_capabilities.semanticTokensProvider = nil
        on_attach(client, bufnr)
    end
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
--         vim.bo[args.buf].formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:5000})"
--     end,
-- })


vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsStartingInstall',
  callback = function()
    vim.schedule(function()
      print 'mason-tool-installer is starting'
    end)
  end,
})


vim.api.nvim_create_autocmd({'BufWritePre', 'FileWritePre'}, {
  pattern = '*',
  command = [[if @% !~# '\(://\)' | call mkdir(expand('<afile>:p:h'), 'p') | endif]]
})
