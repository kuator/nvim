if vim.g.vscode then
  return
end

vim.pack.add({'https://github.com/Mofiqul/vscode.nvim'})
vim.g.vscode_style = "dark"
vim.cmd[[colorscheme vscode]]
vim.cmd[[hi CursorLine cterm=underline guibg=#333333]]
