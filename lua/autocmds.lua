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
  command = 'set fo-=c fo-=r fo-=o',
  pattern = '*',
})
