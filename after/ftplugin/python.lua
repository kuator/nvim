vim.cmd[[setlocal foldmethod=indent]]
vim.g.pyindent_open_paren = 'shiftwidth()'

-- vim.cmd([[
--   augroup folds
--   " Don't screw up folds when inserting text that might affect them, until
--   " leaving insert mode. Foldmethod is local to the window. Protect against
--   " screwing up folding when switching between windows.
--   autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
--   autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
--   augroup END
-- ]])
