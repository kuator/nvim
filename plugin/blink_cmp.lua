vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") } }, { load = true, confirm = false })

require("blink.cmp").setup({
  -- keymap = {
  --   preset = "default",
  --   ["<C-j>"] = { "snippet_backward", "fallback" },
  --   ["<C-k>"] = { "snippet_forward", "fallback" },
  -- },
  snippets = { 
    preset = "luasnip" ,
    -- ['<C-y>'] = { 'select_and_accept' }
  },
  cmdline = { enabled = false },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = {
        border = 'rounded',
      },
    },
    accept = { auto_brackets = { enabled = true }, },
    -- list = { selection = { preselect = false, auto_insert = true } },
  },
})
