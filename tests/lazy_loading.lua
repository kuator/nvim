local deferred_modules = {
  "blink.cmp",
  "dap-view",
  "diffview.bootstrap",
  "fidget",
  "luasnip",
  "mason",
  "markview.state",
  "neotest",
  "null-ls",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "oil",
  "origami",
  "overseer",
  "telescope",
  "treesj",
  "treesitter-unit",
  "match-up",
  "zk",
}

local ok, error_message = pcall(function()
  assert(vim.loader.enabled, "native Lua loader is disabled")

  for _, module in ipairs(deferred_modules) do
    assert(package.loaded[module] == nil, module .. " loaded during startup")
  end
  for _, command in ipairs({
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewClose",
    "DiffviewFocusFiles",
    "DiffviewToggleFiles",
    "DiffviewRefresh",
    "DiffviewLog",
  }) do
    assert(vim.fn.exists(":" .. command) == 2, command .. " is missing from command completion")
    assert(vim.tbl_contains(vim.fn.getcompletion("Diffview", "command"), command), command .. " is not completed")
  end
  assert(vim.g.loaded_targets == nil, "text objects loaded during startup")
  assert(vim.g.loaded_rsi == nil, "vim-rsi loaded during startup")
  assert(vim.g.loaded_characterize == nil, "vim-characterize loaded during startup")

  local lua_file = vim.fn.tempname() .. ".lua"
  vim.fn.writefile({ "local value = { one = 1 }" }, lua_file)
  vim.cmd.edit(vim.fn.fnameescape(lua_file))
  local lua_buf = vim.api.nvim_get_current_buf()
  assert(package.loaded["nvim-treesitter"], "Treesitter did not load for Lua")
  assert(package.loaded["nvim-treesitter-textobjects"], "Treesitter textobjects did not load for Lua")
  assert(package.loaded["treesitter-unit"], "Treesitter unit did not load for Lua")
  assert(package.loaded["null-ls"], "none-ls did not load for Lua")
  assert(package.loaded["mason"], "Mason/LSP setup did not load for Lua")
  assert(package.loaded["origami"], "Origami did not load for Lua")
  assert(package.loaded["match-up"], "vim-matchup did not load for Lua")
  assert(package.loaded["luasnip"], "Neogen did not load its LuaSnip dependency")
  assert(require("rainbow-delimiters.lib").buffers[lua_buf], "rainbow-delimiters missed the first Lua buffer")
  assert(vim.wait(1000, function()
    return #vim.lsp.get_clients({ bufnr = lua_buf, name = "null-ls" }) > 0
  end), "none-ls missed the first Lua buffer")
  vim.fn.delete(lua_file)

  assert(package.loaded["fidget"], "Fidget did not load on the first LspAttach")

  vim.api.nvim_exec_autocmds("ModeChanged", { pattern = "n:no" })
  assert(vim.g.loaded_targets ~= nil, "text objects did not load for operator-pending mode")
  assert(vim.fn.maparg("dsf", "n") == "<Plug>DsfDelete", "dsf mapping was not preserved")

  local markdown_file = vim.fn.tempname() .. ".md"
  vim.fn.writefile({ "# Lazy loading" }, markdown_file)
  vim.cmd.edit(vim.fn.fnameescape(markdown_file))
  assert(package.loaded["markview.state"], "Markview did not load for Markdown")
  assert(package.loaded["zk"], "zk did not load for Markdown")
  assert(package.loaded["telescope"], "zk did not load its Telescope picker")

  vim.api.nvim_exec_autocmds("InsertEnter")
  assert(package.loaded["blink.cmp"], "blink.cmp did not load on InsertEnter")
  assert(vim.g.loaded_rsi == 1, "vim-rsi did not load on InsertEnter")
  assert(vim.g.markview_blink_loaded == true, "Markview did not register with blink.cmp")
  vim.fn.delete(markdown_file)

  vim.cmd.enew()
  vim.bo.filetype = "env"
  vim.opt.virtualedit = "onemore"
  local luasnip = require("luasnip")
  for _, case in ipairs({ { "dc", "::" }, { "fa", "=>" } }) do
    local trigger, expected = unpack(case)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, { trigger })
    vim.api.nvim_win_set_cursor(0, { 1, #trigger })
    assert(luasnip.expand(), trigger .. " is unavailable in env files")
    assert(vim.api.nvim_get_current_line() == expected, trigger .. " expanded incorrectly")
  end

  vim.cmd.enew()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, { '{"one": 1, "two": 2}' })
  vim.bo.filetype = "json"

  local commands = {
    { "DiffviewClose", "diffview.bootstrap" },
    { "Neotest summary close", "neotest" },
    { "DapClearBreakpoints", "dap-view" },
    { "TSJToggle", "treesj" },
    { "OverseerClose", "overseer" },
  }

  for _, command in ipairs(commands) do
    local command_ok, command_error = pcall(vim.cmd, command[1])
    assert(command_ok, command[1] .. " failed: " .. tostring(command_error))
    assert(package.loaded[command[2]], command[1] .. " did not load " .. command[2])
  end

  local refactor_ok, refactor_error = pcall(vim.cmd, "Refactor")
  assert(refactor_ok, "Refactor failed: " .. tostring(refactor_error))
  assert(vim.fn.exists(":Refactor") == 2, "Refactor command did not load")

  local telescope_mapping = vim.fn.maparg("<leader>ff", "n", false, true)
  assert(type(telescope_mapping.callback) == "function", "Telescope mapping has no lazy callback")
  local telescope_ok, telescope_error = pcall(telescope_mapping.callback)
  assert(telescope_ok, "Telescope mapping failed: " .. tostring(telescope_error))
  assert(package.loaded["telescope"], "Telescope mapping did not load Telescope")

  local oil_mapping = vim.fn.maparg("-", "n", false, true)
  assert(type(oil_mapping.callback) == "function", "Oil mapping has no lazy callback")
  local oil_ok, oil_error = pcall(oil_mapping.callback)
  assert(oil_ok, "Oil mapping failed: " .. tostring(oil_error))
  assert(package.loaded["oil"], "Oil mapping did not load Oil")

  local characterize_mapping = vim.fn.maparg("ga", "n", false, true)
  assert(type(characterize_mapping.callback) == "function", "ga has no lazy callback")
  characterize_mapping.callback()
  assert(vim.g.loaded_characterize == 1, "ga did not load vim-characterize")
end)

if not ok then
  vim.api.nvim_err_writeln(error_message)
  vim.cmd.cquit()
  return
end

vim.cmd("qa!")
