vim.pack.add({
  -- 'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/honza/vim-snippets',
  { src = 'https://github.com/L3MON4D3/LuaSnip' }
}, { load = true, confirm = false })

require('luasnip').filetype_extend('java', { "javadoc" })
require('luasnip').filetype_extend('python', { 'django', 'django-rest', 'pydoc' })

vim.tbl_map(
  function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
  { "lua", "snipmate", "vscode" }
)

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-L>", function()
  if ls.expand_or_jumpable()
  then
    ls.expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
