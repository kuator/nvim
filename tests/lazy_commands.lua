local cases = {
  { "Telescope", "telescope" },
  { "Mason", "mason" },
  { "NoneLsInstall", "mason-null-ls" },
  { "NullLsInfo", "null-ls" },
  { "TSLog", "nvim-treesitter" },
  { "ZkNotes", "zk" },
  { "Markview" },
}

local ok, error_message = pcall(function()
  for _, case in ipairs(cases) do
    assert(vim.fn.exists(":" .. case[1]) == 0, case[1] .. " loaded during startup")
  end

  for _, case in ipairs(cases) do
    local command, module = unpack(case)
    vim.api.nvim_exec_autocmds("CmdUndefined", { pattern = command })
    assert(vim.fn.exists(":" .. command) == 2, command .. " was not restored")
    if module then
      assert(package.loaded[module], command .. " did not load " .. module)
    end
  end

  local stop_ok, stop_error = pcall(vim.cmd, "DevTerminalsStop")
  assert(stop_ok, "DevTerminalsStop failed: " .. tostring(stop_error))
  assert(package.loaded["overseer"], "DevTerminalsStop did not load Overseer")
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd.cquit()
  return
end

vim.cmd("qa!")
