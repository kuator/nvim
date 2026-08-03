local removed = {
  "aerial.nvim",
  "comment-box.nvim",
  "git-blame.nvim",
  "git-time-lapse",
  "marks.nvim",
  "opsort.vim",
  "text-case.nvim",
  "undotree",
  "vim-exchange",
  "vim-lion",
  "vim-obsession",
  "vim-sort-motion",
  "vim-textobj-xmlattr",
  "yaml.nvim",
}

local ok, error_message = pcall(function()
  local installed = {}
  for _, plugin in ipairs(vim.pack.get()) do
    installed[plugin.spec.name] = true
  end

  for _, name in ipairs(removed) do
    assert(not installed[name], name .. " is still configured")
  end
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd("cquit")
  return
end

vim.cmd("qa!")
