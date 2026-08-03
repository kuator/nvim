local M = {}
local loaded = {}

function M.load(packages, config)
  local key = config or packages[#packages]
  if loaded[key] then
    return loaded[key] ~= true and loaded[key] or nil
  end

  for _, package in ipairs(packages) do
    vim.cmd.packadd(package)
  end

  local module = config and require(config) or nil
  loaded[key] = module or true
  return module
end

function M.commands(pattern, packages, config)
  vim.api.nvim_create_autocmd("CmdUndefined", {
    pattern = pattern,
    once = true,
    callback = function()
      M.load(packages, config)
    end,
  })
end

return M
