local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end
-- Format the list representing the symbol path
-- Grab it from https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua
local function format_symbols(symbols, depth, separator, icons_enabled)
  local parts = {}
  depth = depth or #symbols

  if depth > 0 then
    symbols = { unpack(symbols, 1, depth) }
  else
    symbols = { unpack(symbols, #symbols + 1 + depth) }
  end

  for _, symbol in ipairs(symbols) do
    if icons_enabled then
      table.insert(parts, string.format("%s %s", symbol.icon, symbol.name))
    else
      table.insert(parts, symbol.name)
    end
  end

  return table.concat(parts, separator)
end


-- Get a list representing the symbol path by aerial.get_location (see
-- https://github.com/stevearc/aerial.nvim/blob/master/lua/aerial/init.lua#L127),
-- and format the list to get the symbol path.
-- Grab it from
-- https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua#L89
local symbols = aerial.get_location(true)
local symbol_path = format_symbols(symbols, nil, ' > ', true)

vim.o.winbar:append(' > ' .. (symbol_path == '' and '...' or symbol_path))

-- Set highlight group for winbar
vim.api.nvim_create_augroup('winbar', {})
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = 'winbar',
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'WinBar', { cterm = { bold = false }, bold = false })
    vim.api.nvim_set_hl(0, 'WinBarNC', { cterm = { bold = false }, bold = false })
  end,
})
