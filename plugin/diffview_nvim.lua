vim.pack.add({ "https://github.com/sindrets/diffview.nvim" }, { load = false, confirm = false })

local lazy = require("config.lazy")
local commands = {
  DiffviewOpen = { nargs = "*", complete = true },
  DiffviewFileHistory = { nargs = "*", complete = true, range = true },
  DiffviewClose = { nargs = 0, bang = true },
  DiffviewFocusFiles = { nargs = 0, bang = true },
  DiffviewToggleFiles = { nargs = 0, bang = true },
  DiffviewRefresh = { nargs = 0, bang = true },
  DiffviewLog = { nargs = 0, bang = true },
}

local function load()
  for name in pairs(commands) do
    vim.api.nvim_del_user_command(name)
  end
  lazy.load({ "diffview.nvim" })
end

local function complete(...)
  load()
  return require("diffview").completion(...)
end

for name, opts in pairs(commands) do
  opts.complete = opts.complete and complete or nil
  vim.api.nvim_create_user_command(name, function(ctx)
    load()
    local command = { cmd = ctx.name, args = ctx.fargs, bang = ctx.bang, mods = ctx.smods }
    command.range = ctx.range > 0 and { ctx.line1, ctx.line2 } or nil
    vim.api.nvim_cmd(command, {})
  end, opts)
end
