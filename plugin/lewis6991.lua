if vim.g.vscode then
  return
end

vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"}, { load = true})
vim.pack.add({ "https://github.com/lewis6991/satellite.nvim"}, { load = true})

require("gitsigns").setup({
  debug_mode = true,
})
