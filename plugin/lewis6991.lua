if vim.g.vscode then
  return
end

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  -- {src="https://github.com/lewis6991/satellite.nvim", version = '1febb774fed40f923a9955e0d029601bd4cabc42'},
  "https://github.com/lewis6991/satellite.nvim",
}, { load = true, confirm = false })

require("gitsigns").setup({
  debug_mode = true,
})
