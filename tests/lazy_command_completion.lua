vim.api.nvim_input(":CodeComp")

vim.defer_fn(function()
  local ok, error_message = pcall(function()
    assert(package.loaded.codecompanion, "CodeCompanion did not load while entering its command prefix")
    local commands = vim.fn.getcompletion("CodeComp", "command")
    assert(vim.tbl_contains(commands, "CodeCompanionChat"), "CodeCompanionChat is absent from command completion")
  end)

  vim.api.nvim_input(vim.keycode("<Esc>"))
  vim.schedule(function()
    if ok then
      vim.cmd("qa!")
    else
      vim.api.nvim_err_writeln(error_message)
      vim.cmd("cquit")
    end
  end)
end, 200)
