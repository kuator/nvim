if vim.g.vscode then
  return
end

vim.g.minibuffer = {
  dynamic_window_resize = true,
  cmd = {
    enabled = true,
    autotrigger = false,
    dynamic_height = false,
    max_height = 12,
  },
}

vim.pack.add({
  { src = "https://github.com/simifalaye/minibuffer.nvim" },
}, { load = true, confirm = false })

local minibuffer = require("minibuffer")

-- Keep select sessions safe for asynchronous sources and make them usable
-- from Normal mode without patching Minibuffer's managed plugin checkout.
if not minibuffer._scheduled_fetch_callbacks then
  local select = minibuffer.select
  minibuffer.select = function(opts, force)
    local wrapped = vim.tbl_extend("force", {}, opts)
    local fetch = wrapped.fetch_fn
    local on_start = wrapped.on_start
    wrapped.fetch_fn = function(input, callback)
      return fetch(input, vim.schedule_wrap(callback))
    end
    wrapped.on_start = function(session, keyset)
      if on_start then
        on_start(session, keyset)
      end
      keyset("i", "<Esc>", function()
        vim.cmd.stopinsert()
      end)
      keyset("i", "<C-j>", function()
        session:accept()
      end)
      keyset("n", "j", function()
        session:move(1)
      end)
      keyset("n", "k", function()
        session:move(-1)
      end)
      for _, key in ipairs({ "<CR>", "<C-y>", "<C-j>" }) do
        keyset("n", key, function()
          session:accept()
        end)
      end
      for _, key in ipairs({ "q", "<Esc>", "<C-c>" }) do
        keyset("n", key, function()
          session:cancel()
        end)
      end
    end
    return select(wrapped, force)
  end
  minibuffer._scheduled_fetch_callbacks = true
  minibuffer._normal_select_navigation = true
end

vim.ui.select = require("minibuffer.builtin.ui_select")
vim.ui.input = require("minibuffer.builtin.ui_input")

vim.keymap.set("n", "<leader><CR>", function()
  require("minibuffer").resume(true)
end, { desc = "Resume minibuffer" })
