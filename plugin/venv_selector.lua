vim.pack.add(
  { { src = "https://github.com/linux-cultist/venv-selector.nvim", version = "regexp" } },
  { load = true }
)

require('venv-selector').setup({})
