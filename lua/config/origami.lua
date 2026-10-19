vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("origami").setup({
  -- useLspFoldsWithTreesitterFallback = {
  --   enabled = false,
  -- },
})
