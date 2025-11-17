function split(str, sep)
  local result = {}
  local pattern = string.format("([^%s]+)", sep)
  for part in string.gmatch(str, pattern) do
    table.insert(result, part)
  end
  return result
end

vim.api.nvim_create_user_command('TabSwitch', function(opts)
  local arg = opts.args
  local tabs = vim.api.nvim_list_tabpages()
  for i, tab in ipairs(tabs) do
    local names = {}
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
      local buf = vim.api.nvim_win_get_buf(win)
      local nm = vim.api.nvim_buf_get_name(buf)
      local short = vim.fn.fnamemodify(nm, ":t")
      table.insert(names, short)
    end
  end

  local num = tonumber(split(arg, ':')[1])
  if num then
    if num >= 1 and num <= #tabs then
      vim.api.nvim_set_current_tabpage(tabs[num])
      return
    end
  end

  for i, tab in ipairs(tabs) do
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
      local buf = vim.api.nvim_win_get_buf(win)
      local nm = vim.api.nvim_buf_get_name(buf)
      local short = vim.fn.fnamemodify(nm, ":t")
      if short == arg then
        vim.api.nvim_set_current_tabpage(tab)
        return
      end
    end
  end

end, {
  nargs = 1,
  complete = function(_, _, _)
    local tabpages = vim.api.nvim_list_tabpages()
    local comps = {}
    for i, tab in ipairs(tabpages) do
      local win = vim.api.nvim_tabpage_get_win(tab)
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      local short = vim.fn.fnamemodify(name, ":t")
      local display = tostring(i) .. ": " .. (short ~= "" and short or "[No Name]")
      table.insert(comps, display)
    end
    return comps
  end,
  desc = "Debug tab switch",
})
