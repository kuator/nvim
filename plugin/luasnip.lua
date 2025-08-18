vim.pack.add({ { src = 'https://github.com/L3MON4D3/LuaSnip', build = 'make install_jsregexp' } }, { load = true })
vim.pack.add({ 'https://github.com/rafamadriz/friendly-snippets' }, { load = true })
require('luasnip').filetype_extend('java', { "javadoc" })
require('luasnip').filetype_extend('python', { 'django', 'django-rest', 'pydoc' })
vim.tbl_map(
  function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
  { "lua", "snipmate", "vscode" }
)
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config"), 'snippets/vscode') } })
require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config"), 'snippets/luasnip') } })
require("luasnip.loaders.from_snipmate").lazy_load({ paths = { vim.fs.joinpath(vim.fn.stdpath("config"), 'snippets/snipmate') } })

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-K>", function()
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
