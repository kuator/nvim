local ok, error_message = pcall(function()
  assert(package.loaded["mason"] == nil, "LSP loaded during startup")
  assert(package.loaded["null-ls"] == nil, "none-ls loaded during startup")

  local file = vim.fn.tempname() .. ".tsx"
  vim.fn.writefile({ "export const App = () => <main />" }, file)
  vim.cmd.edit(vim.fn.fnameescape(file))
  local buf = vim.api.nvim_get_current_buf()

  assert(vim.bo.filetype == "typescriptreact", "TSX filetype was not detected")
  assert(package.loaded["mason"], "LSP did not load for typescriptreact")
  assert(package.loaded["null-ls"], "none-ls did not load for typescriptreact")
  assert(vim.wait(1000, function()
    return #vim.lsp.get_clients({ bufnr = buf, name = "null-ls" }) > 0
  end), "none-ls did not attach to the first TSX buffer")

  vim.fn.delete(file)
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd.cquit()
  return
end

vim.cmd("qa!")
