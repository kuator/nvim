vim.pack.add({
  "https://github.com/RRethy/vim-illuminate",
}, { load = true, confirm = false })

require('illuminate').configure({
  delay= 200
})

vim.api.nvim_set_hl(0, "IlluminatedWord", { link = "MatchParen" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "MatchParen" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "MatchParen" })

