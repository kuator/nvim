if vim.g.vscode then
  return
end

vim.pack.add({
  "https://github.com/Mofiqul/vscode.nvim",
}, { load = true, confirm = false })
vim.g.vscode_style = "dark"
vim.cmd[[colorscheme vscode]]
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#333333", cterm = { underline = true } })
