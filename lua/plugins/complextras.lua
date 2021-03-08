return function()
  vim.cmd [[inoremap <c-x><c-d> <c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]]
end
