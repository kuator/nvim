vim.pack.add({ { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') } }, { load = true })

require('blink.cmp').setup({
  -- keymap = {
  --   preset = "default",
  --   ["<C-j>"] = { "snippet_backward", "fallback" },
  --   ["<C-k>"] = { "snippet_forward", "fallback" },
  -- },
  snippets = { preset = "luasnip" },
  cmdline = { enabled = false },
})

