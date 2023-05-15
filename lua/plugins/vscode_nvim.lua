return {
  'Mofiqul/vscode.nvim',
  init = function()
    vim.g.vscode_style = "dark"
  end,
  config = function()
    vim.cmd [[colorscheme vscode]]
    vim.cmd [[hi CursorLine cterm=underline guibg=#333333]]
  end
}
