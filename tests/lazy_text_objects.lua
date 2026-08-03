local ok, error_message = pcall(function()
  assert(vim.g.loaded_textobj_entire == nil, "text objects loaded during startup")

  vim.api.nvim_buf_set_lines(0, 0, -1, false, { "first", "second" })
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  vim.api.nvim_feedkeys("die", "xt", false)

  assert(vim.g.loaded_textobj_entire == 1, "operator-pending mode did not load text objects")
  assert(vim.api.nvim_buf_line_count(0) == 1, "die did not select the entire buffer")
  assert(vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "", "die did not delete the entire buffer")
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd.cquit()
  return
end

vim.cmd("qa!")
