local ok, error_message = pcall(function()
  for _, module in ipairs({ "gitsigns", "ibl" }) do
    assert(package.loaded[module] == nil, module .. " loaded during startup")
  end
  assert(package.loaded.debugprint, "Debugprint did not load during startup")
  assert(vim.fn.maparg("g/p", "n", false, true).desc == "Plain debug below current line",
    "Debugprint mapping was not installed")
  assert(vim.fn.maparg("[g", "n") ~= "", "Debugprint default mappings were not preserved")
  assert(vim.g.loaded_gutentags == nil, "Gutentags loaded during startup")
  assert(vim.g.loaded_satellite == nil, "Satellite loaded during startup")

  local file = vim.fn.tempname() .. ".lua"
  vim.fn.writefile({ "local value = 1" }, file)
  vim.cmd.edit(vim.fn.fnameescape(file))

  for _, module in ipairs({ "gitsigns", "ibl" }) do
    assert(package.loaded[module], module .. " missed the first file")
  end
  assert(require("gitsigns.config").config.current_line_blame, "Gitsigns line blame is disabled")
  assert(require("ibl").initialized, "indent-blankline did not initialize for the first file")
  assert(vim.g.loaded_gutentags == 1, "Gutentags missed the first file")
  assert(vim.g.loaded_satellite == true, "Satellite missed the first file")
  vim.fn.delete(file)
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd.cquit()
  return
end

vim.cmd("qa!")
