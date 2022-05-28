return {
  "stevearc/aerial.nvim",
  config = function ()
    -- Format the list representing the symbol path
    -- Grab it from https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua
    local status_ok, aerial = pcall(require, "aerial")

    aerial.setup(
      {
        backends = { 'lsp', 'treesitter', 'markdown' },
        filter_kind = false,
      }
    )

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

    _G.aerial_symbols = function()
      -- Get a list representing the symbol path by aerial.get_location (see
      -- https://github.com/stevearc/aerial.nvim/blob/master/lua/aerial/init.lua#L127),
      -- and format the list to get the symbol path.
      -- Grab it from
      -- https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua#L89
      local symbols = aerial.get_location(true)
      local symbol_path = format_symbols(symbols, nil, ' > ', true)

      return "%m %f > " .. (symbol_path == "" and "..." or symbol_path)
    end

    vim.o.winbar = "%{%v:lua.aerial_symbols()%}"

  end
}
