require("colorful-menu").setup()

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-y>"] = {
      function(cmp)
        local accepted

        if vim.bo.filetype == "python" then
          accepted = require("config.python_call_args").accept(cmp)
        else
          accepted = cmp.accept()
        end

        -- Consume <C-y> while the menu is open even when nothing is selected.
        return accepted or cmp.is_visible()
      end,
      "fallback",
    },
  },
  snippets = {
    preset = "luasnip",
  },
  cmdline = { enabled = false },
  signature = { enabled = true },
  completion = {
    trigger = {
      show_in_snippet = false,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = {
        border = "rounded",
      },
    },
    accept = { auto_brackets = { enabled = true } },
    menu = {
      draw = {
        -- We don't need label_description now because label and label_description are already
        -- combined together in label by colorful-menu.nvim.
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

if package.loaded["markview.state"] then
  require("markview.integrations").setup()
end
