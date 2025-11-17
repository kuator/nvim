vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/xzbdmw/colorful-menu.nvim",
}, { load = true, confirm = false })

require("colorful-menu").setup()

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-y>"] = { "select_and_accept" },
  },
  snippets = {
    preset = "luasnip",
  },
  cmdline = { enabled = false },
  signature = { enabled = true },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = {
        border = "rounded",
      },
    },
    accept = { auto_brackets = { enabled = true } },
    -- list = { selection = { preselect = false, auto_insert = true } },
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
