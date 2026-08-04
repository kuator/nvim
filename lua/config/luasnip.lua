require('luasnip').filetype_extend('java', { "javadoc" })
require('luasnip').filetype_extend('python', { 'django', 'django-rest', 'pydoc' })

require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets/luasnip" },
})

vim.tbl_map(function(type)
  require("luasnip.loaders.from_" .. type).lazy_load()
end, { "snipmate", "vscode" })

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
