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
  local undefined_autocmd
  local cmdline_autocmd

  local function load()
    if undefined_autocmd then
      pcall(vim.api.nvim_del_autocmd, undefined_autocmd)
    end
    if cmdline_autocmd then
      pcall(vim.api.nvim_del_autocmd, cmdline_autocmd)
    end
    M.load(packages, config)
  end

  undefined_autocmd = vim.api.nvim_create_autocmd("CmdUndefined", {
    pattern = pattern,
    callback = load,
  })

  local command_prefix = pattern:match("^([%w]+)")
  if command_prefix then
    cmdline_autocmd = vim.api.nvim_create_autocmd("CmdlineChanged", {
      pattern = ":",
      callback = function()
        local command = vim.fn.getcmdline():match("^%s*([A-Z][%w]*)")
        if not command or #command < math.min(3, #command_prefix) then
          return
        end
        if vim.startswith(command_prefix, command) or vim.startswith(command, command_prefix) then
          load()
        end
      end,
    })
  end
end

return M
