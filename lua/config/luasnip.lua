require('luasnip').filetype_extend('java', { "javadoc" })
require('luasnip').filetype_extend('python', { 'django', 'django-rest', 'pydoc' })

require("luasnip.loaders.from_lua").lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets/luasnip" },
})

vim.tbl_map(function(type)
  require("luasnip.loaders.from_" .. type).lazy_load()
end, { "snipmate", "vscode" })

local ls = require("luasnip")

local function is_skkelua_completion(item)
  return type(item) == "table" and vim.tbl_get(
    item,
    "user_data",
    "nvim",
    "lsp",
    "completion_item",
    "data",
    "skkelua"
  ) == true
end

local function confirm_skkelua_completion()
  if vim.fn.pumvisible() == 0 then
    return false
  end

  local info = vim.fn.complete_info({ "selected", "items" })
  local selected = info.selected or -1
  local item = info.items and info.items[selected >= 0 and selected + 1 or 1]
  if not is_skkelua_completion(item) then
    return false
  end

  local keys = selected >= 0 and "<C-y>" or "<C-n><C-y>"
  vim.api.nvim_feedkeys(vim.keycode(keys), "nit", false)
  return true
end

vim.keymap.set({ "i", "s" }, "<C-L>", function()
  if confirm_skkelua_completion() then
    return
  elseif vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
  elseif ls.locally_jumpable(1) then
    ls.jump(1)
  elseif ls.expandable() then
    ls.expand()
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
  elseif ls.locally_jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
